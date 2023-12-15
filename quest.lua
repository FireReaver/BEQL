-- Author      : admin
-- Create Date : 11/7/2019 12:58:09 PM

local addonName = (...);

local beql = LibStub("AceAddon-3.0"):GetAddon(addonName);
local module = beql:NewModule('QuestScanner');

local quests, objectives, changes = {}, {}, {};
local scan, scanning, deepScan, fireEvents;
local cState = {[-1] = 'failed', [0] = 'incompleted', [1] = 'completed'};
local pairs, tinsert, tonumber, type = pairs, tinsert, tonumber, type;
local lastCompleted = false;

module.questCache = {};
module.objectiveCache = {};

module.scanning = false;
module.numComplete = 0;

local Quest = {
    header     = 'String',
    index      = 'Integer',
    level      = 'Integer',
    lookupText = 'String',
    objectives = 'Array<Objective>',
    status     = 'Enum[-1,0,1]',
    timerIndex = 'Integer',
    title      = 'String',
};

local Objective = {
    completed = 'Boolean',
    countable = 'Boolean',
    got       = 'Integer',
    id        = 'Integer',
    index     = 'Integer',
    need      = 'Integer',
    text      = 'String',
    type      = 'Enum',
};

function module:OnInitialize()
    module.numQuests = 0;
    module.db.global.timer = module.db.global.timer or {};

    module.db.global._G = {};
    for k, v in pairs(_G) do
        if (type(v) == 'string' and k:match('^QUEST_') and v:match(': ') and not k:match('_NOPROGRESS$')) then
            module.db.global._G[k] = v;
        end
    end

    module:scan();
end

function module:OnEnable()
    module:OnEvent('QUEST_ACCEPTED', module.scan);
    module:OnEvent('QUEST_COMPLETE', module.scan);
    module:OnEvent('QUEST_LOG_UPDATE', module.scan);
    module:OnEvent('QUEST_REMOVED', module.scan);
end

function module:OnDisable()
    module:OffEvent('QUEST_ACCEPTED', module.scan);
    module:OffEvent('QUEST_COMPLETE', module.scan);
    module:OffEvent('QUEST_LOG_UPDATE', module.scan);
    module:OffEvent('QUEST_REMOVED', module.scan);
end


--[[
--------------------------------------------
-- Notes:
-- Scan for quest log changes
--
-- Returns:
-- * nothing
--------------------------------------------]]
function module.scan(event, ...)
    if (module.scanning) then
        return;
    end

    module.scanning = true;
    module.numComplete = 0;
    module.objectiveCache = {};

    local questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID, lastHeader, key, quest, objective;
    local visibleQuests = GetNumQuestLogEntries();
    local questIndex = 1;

    if (type(quests) == 'table') then
        for _, quest in pairs(quests) do
            quest.index = nil;
            if (quest.timerIndex ~= nil) then
                quest.timerIndex = -1;
            end
        end
    end

    local timers = {};
    for idx in ipairs({GetQuestTimers()}) do
        local timerIndex = GetQuestIndexForTimer(idx);
        timers[timerIndex] = idx;
    end

    while (true) do
        questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(questIndex);

        if (questLogTitleText == nil) then
            break;
        end

        key = isHeader and questLogTitleText or questID;
        lastHeader = isHeader and questLogTitleText or lastHeader;
        isComplete = isComplete or 0;

        if (questIndex > visibleQuests) then
            lastHeader = '_UNKNOWN';
        end

        if (isComplete == 1) then
            module.numComplete = module.numComplete + 1;
        end

        module.questCache[key] = questLogTitleText;

        if (quests[key] == nil) then
            -- new item
            quests[key] = {
                header = lastHeader,
                title = questLogTitleText,
                status = 0,
                objectives = {};
            };

            tinsert(changes, 'q:' .. key .. ':added');
        end

        quest = quests[key];

        quest.index = questIndex;
        quest.level = level;
        quest.lookupText = {GetQuestLogQuestText(questIndex)};

        if (timers[questIndex] ~= nil) then
            if (quest.timerIndex == nil) then
                tinsert(changes, 'q:' .. key .. ':timer_added');
            end

            quest.timerIndex = timers[questIndex];
            -- save timer max length to global profile
            module.db.global.timer[key] = math.max(module.db.global.timer[key] or 0, ({GetQuestTimers()})[timers[questIndex]]);
        end

        if (quest.status ~= isComplete) then
            quest.status = isComplete;
            tinsert(changes, 'q:' .. key .. ':' .. cState[isComplete]);
        end

        for i = 1, GetNumQuestLeaderBoards(questIndex) do
            local oText, oType, oComplete = GetQuestLogLeaderBoard(i, questIndex);

            key = 'q:' .. questID .. ':o:' .. i;

            if (objectives[key] == nil) then
                objectives[key] = {
                    completed = false,
                    countable = #{oText:match('(%d+)/(%d+)')} > 0,
                    got = '0',
                    id = questID,
                    index = i,
                    need = '0',
                    type = oType
                };

                quest.objectives[i] = objectives[key];

                tinsert(changes, key .. ':added');
            end

            objective = objectives[key];
            tinsert(module.objectiveCache, objective);

            objective.text = oText;
            table.insert(quest.lookupText, oText);

            if (objective.countable) then
                local got, need = oText:match('(%d+)/(%d+)');

                if (objective.got ~= got) then
                    tinsert(changes, key .. ':changed:' .. (objective.got or 0) .. ':' .. got);
                    objective.got = got
                end

                objective.need = need;
            end

            if (objective.completed ~= oComplete) then
                objective.completed = oComplete;
                tinsert(changes, key .. ':' .. (oComplete and 'completed' or 'incompleted'));
            end
        end

        quest.lookupText = table.concat(quest.lookupText, '\n');
        questIndex = questIndex + 1;
    end

    for questID, quest in pairs(quests) do
        if (quest.timerIndex == -1) then
            tinsert(changes, 'q:' .. questID .. ':timer_removed');
            quest.timerIndex = nil;
        end

        if (quest.index == nil) then
            tinsert(changes, 'q:' .. questID .. ':removed');
            quests[questID] = nil;

            for objectiveID in pairs(objectives) do
                if(objectiveID:match('q:' .. questID .. ':o')) then
                    tinsert(changes, objectiveID .. ':removed');
                    objectives[objectiveID] = nil;
                end
            end
        end

        if (quest.header == '_UNKNOWN') then
            module:deepScan();
        end
    end

    module.scanning = false;
    local questID;

    if (event == 'QUEST_ACCEPTED') then
        questID = select(2, ...);
        tinsert(changes, 1, 'q:' .. questID .. ':accepted');
    elseif (event == 'QUEST_COMPLETE') then
        lastCompleted = true;
    elseif (event == 'QUEST_REMOVED' and lastCompleted) then
        questID = select(1, ...);
        tinsert(changes, 1, 'q:' .. questID .. ':finished');
        lastCompleted = false;
    elseif (event == 'QUEST_REMOVED') then
        questID = select(1, ...);
        tinsert(changes, 1, 'q:' .. questID .. ':aborted');
    end

    module:fireEvents();
end

--[[
--------------------------------------------
-- Notes:
-- Makes a deep scan for hiden quests to get
-- her header
--
-- Returns:
-- * nothing
--------------------------------------------]]
function module:deepScan()
    QuestLogFrame:UnregisterEvent('QUEST_LOG_UPDATE');
    local header = {};
    local questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID, lastHeader;
    local cnt = GetNumQuestLogEntries();
    
    for questIndex = 1, cnt do
        questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(questIndex);

        if (isHeader and isCollapsed) then
            tinsert(header, questIndex);
        end
    end
    
    ExpandQuestHeader(0);
    cnt = GetNumQuestLogEntries();

    for questIndex = 1, cnt do
        questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(questIndex);

        lastHeader = isHeader and questLogTitleText or lastHeader;

        if (questID > 0) then
            quests[questID].header = lastHeader;
        end
    end
    
    for _, headerIndex in ipairs(header) do
        CollapseQuestHeader(headerIndex);
    end

    QuestLogFrame:RegisterEvent('QUEST_LOG_UPDATE');
end

--[[
--------------------------------------------
-- Notes:
-- Fires event with callback handler
--
-- Returns:
-- * nothing
--------------------------------------------]]
function module:fireEvents()
    local numQuests = select(2, GetNumQuestLogEntries());
    if (#changes == 0 or math.abs(module.numQuests - numQuests) > 1) then
        -- quest numbers can only jump in one steps,
        -- if there are higher jumps it comes from 
        -- quest cache filling or initializing 
        -- --> this ar not valid quest events, skip
        changes = {};
    end

    for _, change in pairs(changes) do
        local t = {};

        for w in change:gmatch('([^:]+)') do 
            tinsert(t, tonumber(w) or w) 
        end

        if (#t == 3 and tonumber(t[2]) == nil) then
            -- quest: event, headerName
            module:Fire('HEADER_' .. strupper(t[3]), t[2]);
        elseif (#t == 3) then
            -- quest: event, questID
            module:Fire('QUEST_' .. strupper(t[3]), t[2]);
        elseif (t[1] == 'q' and t[3] == 'o') then
            -- objectives: event, questID, objectiveIndex[, oldvalue, newvalue]
            module:Fire('OBJECTIVE_' .. strupper(t[5]), t[2], t[4], t[6], t[7]);
        else
            module:debug('unknown', unpack(t));
        end
    end

    module:Fire('QUEST_LOG_CHANGED');

    changes = {};
    module.numQuests = numQuests;
end

--[[
--------------------------------------------
-- Notes:
-- Gets Quest information like GetQuestLogTitle
--
-- Returns:
--------------------------------------------]]
function module:GetQuestLogTitle(questID)
    local quest = quests[questID];
    local questData = {GetQuestLogTitle(quest and quest.index or 0)};

    -- remove unused flags
    while (#questData > 8) do
        tremove(questData, 9);
    end

    tinsert(questData, quest and quest.index or 0);
    tinsert(questData, quest and quest.header or 'DUMMY');

    return unpack(questData);
end

--[[
--------------------------------------------
-- Notes:
-- Gets Quest objective information like GetQuestLogLeaderBoard
--
-- Returns:
--------------------------------------------]]
function module:GetQuestLogObjective(questID, index)
    if (quests[questID] == nil) then
        return;
    end

    local key = 'q:' .. questID .. ':o:' .. index;
    local oText, oType, oComplete = GetQuestLogLeaderBoard(index, quests[questID].index);

    return oText, oType, oComplete, tonumber(objectives[key].got), tonumber(objectives[key].need);
end

function module:IsQuestValid(questID)
    -- @HACK: this overwrites validation short after login
    local overwriteValidation = module.numQuests == 0;

    return quests[questID] ~= nil or overwriteValidation;
end

--[[
--------------------------------------------
-- Notes:
-- Gets all current quistids for the zone
--
-- Returns:
-- * table
--------------------------------------------]]
function module:GetZoneQuests(questZone)
    local questIDs = newArray();

    for questID, quest in pairs (quests) do
        if (quest.header == questZone and questID ~= questZone) then
            questIDs.push(questID);
        end
    end

    return questIDs;
end

--[[
--------------------------------------------
-- Notes:
-- Check for specific Quest timer
--
-- Returns:
-- * boolean
--------------------------------------------]]
function module:HasQuestTimer(questID)
    return quests[questID] ~= nil and quests[questID].timerIndex ~= nil;
end

--[[
--------------------------------------------
-- Notes:
-- Get time lift for a Quest timer
--
-- Returns:
-- * number
--------------------------------------------]]
function module:GetQuestTimer(questID)
    if(module:HasQuestTimer(questID) == false) then
        return;
    end

    local timer = {GetQuestTimers()};

    return timer[quests[questID].timerIndex], module.db.global.timer[questID];
end

function module:IsTextInQuest(name)
    for questId, quest in pairs(quests) do
        if (quest.lookupText:match(name)) then
            return true;
        end
    end

    return false
end

function module:GetObjectivesForText(text)
    local results = {}
    for _, objective in ipairs(module.objectiveCache) do
        if (objective.text:match(text)) then
            tinsert(results, objective);
        end
    end

    return #results > 0 and results or nil;
end

function module:GetQuestsForText(text)
    local results = {}
    for id, quest in pairs(quests) do
        if (quest.lookupText:match(text)) then
            tinsert(results, id);
        end
    end

    return #results > 0 and results or nil;
end


-- EOF --

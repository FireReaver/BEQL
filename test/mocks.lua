-- Author      : admin
-- Create Date : 8/28/2020 11:37:57 AM

local addonName = (...);

local beql = LibStub("AceAddon-3.0"):GetAddon(addonName);

local module = beql:NewModule('Mocks', "AceHook-3.0");

function module:OnInitialize()
    beql.db.char.fn = nil;
end

function module:OnEnable()
    -- module:RawHook("GetNumQuestLogChoices", true);
    --module:RawHook("GetNumQuestLogEntries", true);
    -- module:RawHook("GetNumQuestLogRewardSpells", true);
    -- module:RawHook("GetNumQuestLogRewards", true);
    --module:RawHook("GetQuestIndexForTimer", true);
    -- module:RawHook("GetQuestLogChoiceInfo", true);
    -- module:RawHook("GetQuestLogIndexByID", true);
    -- module:RawHook("GetQuestLogIndexByName", true);
    -- module:RawHook("GetQuestLogItemDrop", true);
    -- module:RawHook("GetQuestLogItemLink", true);
    -- module:RawHook("GetQuestLogLeaderBoard", true);
    -- module:RawHook("GetQuestLogPushable", true);
   -- module:RawHook("GetQuestLogQuestText", true);
    -- module:RawHook("GetQuestLogQuestType", true);
    -- module:RawHook("GetQuestLogRequiredMoney", true);
    -- module:RawHook("GetQuestLogRewardInfo", true);
    -- module:RawHook("GetQuestLogRewardMoney", true);
    -- module:RawHook("GetQuestLogRewardSpell", true);
   -- module:RawHook("GetQuestTimers", true);
   -- module:RawHook("GetQuestLogSelection", true);
    -- module:RawHook("GetQuestLogSpellLink", true);
   -- module:RawHook("GetQuestLogTimeLeft", true);
   -- module:RawHook("GetQuestLogTitle", true);
    -- module:RawHook("QuestLogPushQuest", true);
   -- module:RawHook("SelectQuestLogEntry", true);
    -- module:RawHook("ToggleQuestLog", true);

    for k, v in pairs(_G) do
        if (module[k] and type(v) == 'function') then
           -- module:debug(k, 'hooked');
            module:RawHook(k, true);
        end
    end
end

function module:OnDisable()
    module:UnhookAll();
end

local selectedIndex;
local questMocks = {
    {
        title = "Mock Quest Header", 
        level = 0, 
        tag = nil, 
        isHeader = true, 
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = nil
	},
    {
        title = "Raid Quest",
        level = UnitLevel("player") + 5, 
        tag = RAID, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        objectives = {
            {text = 'Kill the false King: 0/1', type = 'monster', complete = false}
        },
        questID = 100001
	},
    {
        title = "Dungeon Quest",
        level = UnitLevel("player") + 3, 
        tag = LFG_TYPE_DUNGEON or "Dungeon", 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = 100002
	},
    {
        title = "Elite Quest",
        level = UnitLevel("player"), 
        tag = ELITE, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = 100003
	},
    {
        title = "Group Quest",
        level = UnitLevel("player"), 
        tag = GROUP, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = 100004
	},
    {
        title = "PvP Quest",
        level = UnitLevel("player") - 3, 
        tag = PVP, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = 100005
	},
    {
        title = "Timer Quest",
        level = UnitLevel("player") - 3, 
        tag = nil, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = nil, 
        frequency = nil, 
        questID = 100005,
        objectives = { 
            {text = 'Linen Cloth: 40/40', type = 'item', complete = true},
            {text = 'Wool Cloth: 30/40', type = 'item', complete = false},
            {text = 'Silk Cloth: 20/40', type = 'item', complete = false},
            {text = 'Mageweave Cloth: 10/40', type = 'item', complete = false},
            {text = 'Runeloth: 0/40', type = 'item', complete = false},
            --{text = 'Netherweave Cloth: 3/40', type = 'item', complete = false},
            --{text = 'Frostweave Cloth: 0/40', type = 'item', complete = false}
        },
        timer = math.random(time(), time() + 3600);
	},
    {
        title = "Failed Quest with very long title text",
        level = UnitLevel("player") - 3, 
        tag = nil, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = -1, 
        frequency = nil, 
        questID = 100007
	},
    {
        title = "Complete Trivial Quest",
        level = UnitLevel("player") - GetQuestGreenRange() -1, 
        tag = nil, 
        isHeader = false,
        isCollapsed = false, 
        isComplete = 1, 
        frequency = nil, 
        questID = 100008
	}
};

local function isMocked(index)
    return index > module.hooks.GetNumQuestLogEntries();
end

local function getLocalIndex(questIndex) 
    return questIndex - (module.hooks.GetNumQuestLogEntries());
end

function module:GetNumQuestLeaderBoards(index)
    index = index or GetQuestLogSelection();

    if (not isMocked(index)) then
        return module.hooks.GetNumQuestLeaderBoards(index);
    end

    local i = getLocalIndex(index);

    return #(questMocks[i].objectives or {});
end

function module:GetNumQuestLogEntries()
    local numEntries, numQuests = module.hooks.GetNumQuestLogEntries();

    return numEntries + #questMocks, numQuests + #questMocks - 1;
end

function module:GetQuestLogQuestText()
    if (selectedIndex == nil) then
        return module.hooks.GetQuestLogQuestText();
    end
    
    return questMocks[selectedIndex].text, questMocks[selectedIndex].desc;
end

function module:GetQuestLogTitle(index)
    QuestLogDummyText.index = index;

    if (not isMocked(index)) then
        return module.hooks.GetQuestLogTitle(index);
    end

    local localIndex = index - (module.hooks.GetNumQuestLogEntries());
    local q = questMocks[localIndex] or {};

    return q.title, q.level, q.tag, q.isHeader, q.isCollapsed, q.isComplete, q.frequency, q.questID;
end

function module:GetQuestLogSelection()
    if (selectedIndex == nil) then
        return module.hooks.GetQuestLogSelection();
    end

    return module.hooks.GetNumQuestLogEntries() + selectedIndex;
end

function module:GetQuestIndexForTimer(timerIndex)
    local timers = {module.hooks.GetQuestTimers()};

    if (timerIndex <= #timers) then
        return module.hooks.GetQuestIndexForTimer(timerIndex);
    end
    
    local questIndex = module.hooks.GetQuestIndexForTimer(timerIndex);

    for k, q in pairs(questMocks) do
        if (q.timer and q.timer >= time()) then
            tinsert(timers, k + module.hooks.GetNumQuestLogEntries());
        end
    end

    return timers[timerIndex];
end

function module:GetQuestLogTimeLeft()
    if (selectedIndex == nil) then
        return module.hooks.GetQuestLogTimeLeft()
    end

    local q = questMocks[selectedIndex];

    return q.timer and (q.timer - time()) or nil;
end

function module:GetQuestTimers()
    local timers = {module.hooks.GetQuestTimers()};

    for _, q in pairs(questMocks) do
        if (q.timer and q.timer >= time()) then
            tinsert(timers, q.timer - time());
        end
    end

    return unpack(timers);
end

function module:GetQuestLogLeaderBoard(...)
    local oIndex, qIndex = ...;
    if (select('#', ...) == 1) then
        qIndex = GetQuestLogSelection();
    end

    if (not isMocked(qIndex)) then
        return module.hooks.GetQuestLogLeaderBoard(...);
    end

    local localIndex = qIndex - (module.hooks.GetNumQuestLogEntries());
    local q = questMocks[localIndex] or {};
    local o = q and q.objectives and q.objectives[oIndex] or {};

    return o.text, o.type, o.complete;
end

function module:SelectQuestLogEntry(index)
    selectedIndex = nil;
    if (not isMocked(index)) then
        return module.hooks.SelectQuestLogEntry(index);
    end

    selectedIndex = index - module.hooks.GetNumQuestLogEntries();
end

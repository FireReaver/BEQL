-- Author      : admin
-- Create Date : 10/28/2019 10:19:08 AM

local addonName = ...;

local beql   = LibStub('AceAddon-3.0'):GetAddon(addonName);
local module = beql:NewModule('Chat');
local L      = LibStub('AceLocale-3.0'):GetLocale(addonName)
local questScanner;

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Initialize the modul
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnInitialize()
    module:debug('Init');

    module:SetEnabledState(module.db.profile.questlog.chat.AnnounceQuest);

    module:debug('Init - done');
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- enables the module
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnEnable()
    module:debug('Enable');

    questScanner = beql:GetModule('QuestScanner');

    if (module:IsDisabled()) then
        module:SetEnabledState(module.db.profile.questlog.chat.AnnounceQuest);
        module:debug('enable, beql disabled -> skip');
        
        return;
    end

    module:On('ANNOUNCE_QUEST', module.AddQuestStatusToChatFrame);
    module:On('QUEST_ACCEPTED', module.questAccepted);
    module:On('QUEST_ABORTED', module.questAborted);
    module:On('QUEST_COMPLETED', module.questCompleted);
    module:On('QUEST_FAILED', module.questFailed);
    module:On('QUEST_FINISHED', module.questFinished);
    module:On('OBJECTIVE_CHANGED', module.objectiveChanged);
    module:On('OBJECTIVE_COMPLETED', module.objectiveCompleted);

    module:debug('Enable - done');
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- disables the module
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnDisable()
    module:debug('Disable');

    module:Off('ANNOUNCE_QUEST', module.AddQuestStatusToChatFrame);
    module:Off('QUEST_ACCEPTED', module.questAccepted);
    module:Off('QUEST_ABORTED', module.questAborted);
    module:Off('QUEST_COMPLETED', module.questCompleted);
    module:Off('QUEST_FAILED', module.questFailed);
    module:Off('QUEST_FINISHED', module.questFinished);
    module:Off('OBJECTIVE_CHANGED', module.objectiveChanged);
    module:Off('OBJECTIVE_COMPLETED', module.objectiveCompleted);

    module:debug('Disable - done');
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- toggles the module status based on main module and module enabled setting
--
-- Returns:
-- nothing
------------------------------------------]]
function module:ToggleModuleState() 
    if (beql:IsEnabled() and module.db.profile.questlog.chat.AnnounceQuest) then
        module:Enable();
    else
        module:Disable();
        module:SetEnabledState(module.db.profile.questlog.chat.AnnounceQuest);
    end
end

--
--- module methodes
--

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
-- number - objectiveIndex - index of quests objective
--
-- Notes:
-- Handels the event when a objective has completed
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:partyMessage(msg)
    local channel = UnitInBattleground('player') and 'INSTANCE_CHAT'
        or IsInRaid() and 'RAID'
            or IsInGroup() and 'PARTY'
                or nil;

    module:debug(msg, channel);

    if (module.db.profile.questlog.chat.AnnounceQuest and channel ~= nil) then
        SendChatMessage(msg, channel);
    end

    if (module.db.profile.debug and not msg or msg == '') then
        assert(false , 'module:partyMessage: massage is a \'' .. tostring(msg) .. '\' value');
    end
end

--
--- Events
--

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
-- number - objectiveIndex - index of quests objective
-- number - old - value before update
-- number - new - value after update
--
-- Notes:
-- Handels the event when a objective has changed
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:objectiveChanged(questID, objectiveIndex, old, new)
    if (module.db.profile.questlog.chat.progress ~= true) then
        return
    end

    local text, _type, complete, got, need = questScanner:GetQuestLogObjective(questID, objectiveIndex);

    if (new < need) then
        module:partyMessage(L['Quest objective updated: '] .. text);
    end
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
-- number - objectiveIndex - index of quests objective
--
-- Notes:
-- Handels the event when a objective has completed
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:objectiveCompleted(questID, objectiveIndex)
    if (module.db.profile.questlog.chat.finished ~= true) then
        return;
    end

    local text = questScanner:GetQuestLogObjective(questID, objectiveIndex);

    module:partyMessage(' - ' .. text:gsub(':[^:]*$', '') .. ' ' .. L['Completed!']);
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
--
-- Notes:
-- Handels the event when a has been aborted
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:questAborted(questID)
    if (module.db.profile.questlog.chat.abandoned ~= true) then
        return;
    end

    local title = questScanner.questCache[questID];
    module:partyMessage(L['Quest abandoned: '] .. title);
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
-- number - objectiveIndex - index of quests objective
--
-- Notes:
-- Handels the event when a objective has completed
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:questAccepted(questID)
    if (module.db.profile.questlog.chat.accept ~= true) then
        return;
    end

    local title = questScanner:GetQuestLogTitle(questID);
    module:partyMessage(L['Quest accepted: '] .. title);
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
--
-- Notes:
-- Handels the event when a quest switched to state completed
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:questCompleted(questID)
    local title = beql:GetModule('QuestScanner'):GetQuestLogTitle(questID);

    if (module.db.profile.questlog.chat.finished ~= true) then
        return;
    end

    module:partyMessage(title .. ' ' .. L['Completed!']);
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
--
-- Notes:
-- Handels the event when a quest has failed 
-- and was removed from the questlog
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:questFailed(questID)
    if (module.db.profile.questlog.chat.progress ~= true) then
        return;
    end

    local title = questScanner.questCache[questID];
    module:partyMessage(L['Quest failed: '] .. title);
end

--[[----------------------------------------
-- Arguments:
-- string - event - Name of the event
-- number - questID - Id of the quest
--
-- Notes:
-- Handels the event when a quest has sucessfully complete 
-- and was removed from the questlog
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:questFinished(questID)
    if (module.db.profile.questlog.chat.delivert ~= true) then
        return;
    end

    local title = questScanner.questCache[questID];
    
    module:partyMessage(L['Quest %s done.']:format(title));
end

--[[----------------------------------------
-- Arguments:
-- number - quest id
-- string - quest name
--
-- Notes:
-- Prints the Quest Name/Status and Objectives to the currently opened chatbox
--
-- Returns:
-- * nothing
------------------------------------------]]
function module:AddQuestStatusToChatFrame(index)
    local chatFrame = DEFAULT_CHAT_FRAME
    local channel = chatFrame.editBox:GetAttribute('chatType')

    if (channel == 'WHISPER') then
        channel = 'SAY'
    end

    local qTitle, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(index);
    local tag = beql:GetModule('Log'):getQuestTag(index);
    local numObjectives = GetNumQuestLeaderBoards(index);
    
    if (isHeader) then
        return;
    end

    SendChatMessage(tag .. qTitle, channel);

    for i = 1, GetNumQuestLeaderBoards(index) do
        local text, type, complete = GetQuestLogLeaderBoard(i, index);
        local suffix = complete and (' ' .. L['(Done)']) or '';
        SendChatMessage(' - ' .. text .. suffix, channel);
    end 

    if(numObjectives == 0) then
        SendChatMessage(' - ' .. L['No Objectives!'], channel);
    end

    chatFrame.editBox:Hide()
end

-- EOF

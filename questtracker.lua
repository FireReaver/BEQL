--[[
************************************************************************

tracker.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike

************************************************************************
]]--

local addonName = (...);

local beql   = LibStub("AceAddon-3.0"):GetAddon(addonName)
local questLog, questScanner;
local module = beql:NewModule('Tracker', 'AceHook-3.0');
local L      = LibStub("AceLocale-3.0"):GetLocale(addonName)

module.trackerLists = {
    {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'},
    {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'},
    {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'}
}

module.trackerSymbols = {'-', '+', '@', '>'}

-- Define UIFrameCache as a table
UIFrameCache = {}

-- UIFrameCache New method
function UIFrameCache:New(frameType, name, parent, template)
    local frame = CreateFrame(frameType, name, parent, template)
    -- Add any additional setup logic for the frame if needed
    return frame
end

-- UIFrameCache Reset method
function UIFrameCache:Reset()
    while #self.usedFrames > 0 do
        local frame = self.usedFrames[1]
        if frame then
            frame:Hide()
            local success, releaseError = pcall(self.ReleaseFrame, self, frame)
            if not success then
                -- Handle the release error
                print("Error releasing frame:", releaseError)
            end
        end
    end
end

function module:OnInitialize()
    module:debug('Init');

    module.lineCache = UIFrameCache:New("FRAME", tostring(module) .. 'Line', module.frames.questWatchFrame, "beqlWatchFrameLineTemplate");
    module.tooltip = CreateFrame('GameTooltip',  tostring(module) .. 'Tooltip', module.frames.questWatchFrame, 'GameTooltipTemplate');

    module.tooltip.FadeOutTooltip = module.startFading;
    module.tooltip.IsFading       = module.isFading;
    module.tooltip.OnFadeEnd      = module.onFadeEnd;
    module.tooltip.StopFading     = module.stopFading;

    module.frames.questWatchTitle:SetPoint('RIGHT', module.frames.questWatchFrame);

    module.tooltip:SetScript('OnUpdate', module.Tooltip_OnUpdate);

    -- tooltip on update 
    module.frames.questWatchFrame.updateTooltip = module.tracker_OnUpdate;

    module.db.char.QuestWatchIDs = newArray(unpack(module.db.char.QuestWatchIDs));

    module:On('TOGGLE_QUEST_WATCH', module.toggleQuestWatch);

    module:SetEnabledState(not module.db.profile.tracker.disabled);
    module:debug('Init - done');
end

--
-- Hooks
--

function module:getLine()
    local line = module.lineCache:GetFrame();
    local t1, _ , t2 = line.text:GetFont()

    line:ClearAllPoints();
    line:SetHeight(module.db.profile.tracker.FontHeight * 1.125)
    line:Show();
    line.type = nil;

    line.dash:ClearAllPoints();
    line.dash:SetFont(t1, module.db.profile.tracker.FontHeight, t1);
    line.dash:SetPoint('TOPLEFT', line, 'TOPLEFT', 0, module.db.profile.tracker.FontHeight * -0.0625);
    line.dash:SetPoint('BOTTOMLEFT', line, 'BOTTOMLEFT', 0, module.db.profile.tracker.FontHeight * 0.0625);
    line.dash:SetText("");
    line.dash:SetTextColor(0.8, 0.8, 0.8);
    line.dash:Show();
    line.dash:SetWidth(0);

    line.statusBar:Hide();

    line.text:SetFont(t1, module.db.profile.tracker.FontHeight, t1);
    line.text:SetText("");
    line.text:SetTextColor(0.8, 0.8, 0.8);
    line.text:SetWidth(0)
    line.text:Show();

    -- load scripts
    beql:initFrames(line);

    return line;
end

function UIFrameCache:Reset()
    while #self.usedFrames > 0 do
        local frame = self.usedFrames[1]
        if frame then
            frame:Hide()
            local success, releaseError = pcall(self.ReleaseFrame, self, frame)
            if not success then
                -- Handle the release error
                print("Error releasing frame:", releaseError)
            end
        end
    end
end

function module:OnEnable()
    questScanner = beql:GetModule('QuestScanner');
    questLog = beql:GetModule('Log');

    if (module:IsDisabled()) then
        module:Disable();
        module:SetEnabledState(not module.db.profile.tracker.disabled);
        module:debug('enable, beql disabled -> skip');
        
        return;
    end

    module:On('QUEST_ADDED', module.autoWatchNewQuest);
    module:On('QUEST_REMOVED', module.questWatchRemoveQuest);
    module:On('QUEST_LOG_CHANGED', module.displayQuests);
    module:OnEvent('QUEST_WATCH_UPDATE');

    module:applyStyles();

    QuestWatchFrame:SetScript('OnShow', QuestWatchFrame.Hide);
    QuestTimerFrame:SetScript('OnShow', QuestTimerFrame.Hide);

    QuestWatchFrame:Hide();
    QuestTimerFrame:Hide();

    if (not module:IsHooked('IsQuestWatched'))  then
        -- must be a raw hook to take effect in QuestLogFrame
        module:RawHook('IsQuestWatched', true);
    end

    module:applyStyles();

    -- update blizzard UI
    QuestLog_Update();
    QuestWatch_Update();
    module:displayQuests();

    module:debug('enable - done');
end

function module:OnDisable()
    module:Off('QUEST_ADDED', module.autoWatchNewQuest);
    module:Off('QUEST_REMOVED', module.questWatchRemoveQuest);
    module:Off('QUEST_LOG_CHANGED', module.displayQuests);
    module:OffEvent('QUEST_WATCH_UPDATE');

    module:Unhook('IsQuestWatched');

    QuestWatchFrame:SetScript('OnShow', nil);
    QuestTimerFrame:SetScript('OnShow', nil);
    module.frames.questWatchFrame:Hide();
    module.frames.questWatchTitle:Hide();

    -- update blizzard UI
    QuestLog_Update();
    QuestWatch_Update();

    module:debug('disable - done');
end

--
-- module methodes
--

-- Update Base Stats of the Frame like Color etc...
function module:applyStyles()
    local borderColor, bgColor = CreateColor(0, 0, 0, 0), CreateColor(0, 0, 0, 0);
    local FontHeight = nil;
    local options = module.db.profile.tracker

    -- movability
    if (options.locked) then
        module.frames.questWatchFrame:RegisterForDrag("LeftButton");
        module.frames.questWatchTitle:EnableMouse(false);
        module.frames.questWatchFrame:RegisterForDrag("LeftButton");
        module.frames.questWatchAnchor:SetMovable(true);
    else
        module.frames.questWatchFrame:RegisterForDrag("LeftButton");
        module.frames.questWatchTitle:EnableMouse(true);
        module.frames.questWatchTitle:RegisterForDrag("LeftButton");
        module.frames.questWatchAnchor:SetMovable(true);
    end

    -- Title
    if (options.ShowHeader) then
        module.frames.questWatchTitle:Show();
    else
        module.frames.questWatchTitle:Hide();
    end

    -- Colors
    if (options.UseBgColors) then
        if (options.CustomBgColor) then
            borderColor = options.Colors.BgBorder;
            bgColor = options.Colors.Bg;
        else
            borderColor = TOOLTIP_DEFAULT_BACKGROUND_COLOR;
            bgColor = TOOLTIP_DEFAULT_BACKGROUND_COLOR;
        end
    end

    module.frames.questWatchTitle:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
    module.frames.questWatchTitle:SetBackdropColor(bgColor.r, bgColor.g, bgColor.b, bgColor.a)
    module.frames.questWatchFrame:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
    module.frames.questWatchFrame:SetBackdropColor(bgColor.r, bgColor.g, bgColor.b, bgColor.a)

    local t1, _, t2 = module.frames.questWatchTitle.Text:GetFont();
    module.frames.questWatchTitle.Text:SetFont(t1, options.FontHeight + 2, t2)
    module.frames.questWatchTitle.Text:SetHeight(options.FontHeight + 2)

    -- Alpha
    module.frames.questWatchAnchor:SetAlpha(module.db.profile.tracker.Alpha)
end

function module:displayQuests()
    -- beql locales
    local _, curZone, invalidRun, isComplete, questIndex, qZone, watchIDs;
    
    invalidRun = module:IsDisabled() or #module.db.char.QuestWatchIDs == 0 or (GetNumQuestLogEntries()) == 0;
    
    local filteredIDs = {}
    for _, questID in pairs(module.db.char.QuestWatchIDs) do
		if questScanner:IsQuestValid(questID) then
			table.insert(filteredIDs, questID)
		end
    end
	module.db.char.QuestWatchIDs = filteredIDs

    watchIDs = invalidRun and {} or module.db.char.QuestWatchIDs;


    module.lineCache:Reset();
    module:displayTrackerHeader()

    for _, questID in pairs(watchIDs) do
        _, _, _, _, _, isComplete, _, _, questIndex, qZone = questScanner:GetQuestLogTitle(questID);

        --
        -- Zone !
        --
        curZone = module:displayTrackerZone(curZone, qZone, isComplete);

        --
        -- Quest !
        --
        module:displayQuestTitle(questIndex);

        --
        -- Timer
        --
        module:displayQuestTimer(questID);
    end

    -- Handle Frame Visibility
    module:displayTrackerFrame();
end

function module:displayQuestObjective(questIndex, objectiveIndex)
    local text, otype, complete, got, need = GetQuestLogLeaderBoard(objectiveIndex, questIndex);
    local _, _, _, _, _, _, _, questID = GetQuestLogTitle(questIndex);
    local options = module.db.profile.tracker;

    local numbers, tempColor, tempColor2, Color, objText;

    objText = '';

    if (complete and options.MinimizeFinished) then
        -- hide complete
        return;
    end

    local numbers = {text:match('(%d+)/(%d+)')};

    if (#numbers > 0) then
        got, need = unpack(numbers);
    elseif (complete) then
        got, need = 1, 1;
    else
        got, need = 0, 1;
    end

    -- colores
    if (options.CustomObjetiveColor) then
        tempColor = options.Colors.ObjectiveNormal;
        tempColor2 = options.Colors.ObjectiveComplete;
    else
        tempColor = CreateColor(0.8, 0.8, 0.8);
        tempColor2 = HIGHLIGHT_FONT_COLOR;
    end

    if (complete) then
        Color = tempColor2
    elseif (options.FadeColor) then
        local percent = Round(got / need * 100);
        local stepColor = options.Colors.ObjectiveStepColor;
        
        if (options.useFadeStepColor and percent <= 50 ) then
            Color = beql:FadeColors(tempColor, stepColor, percent, 50)
        elseif (options.useFadeStepColor and percent > 50 ) then
            Color = beql:FadeColors(stepColor, tempColor2, percent - 50, 50)
        else 
            Color = beql:FadeColors(tempColor, tempColor2, percent, 100)
        end
    else
        Color = tempColor
    end

    -- markers
    if (module.db.profile.tracker.ShowObjectiveMarkers) then
        if (module.db.profile.tracker.UseTrackerListing) then
            objText = " " .. module.trackerLists[module.db.profile.tracker.TrackerList][objectiveIndex] .. ") "
        else
            objText = " " .. module.trackerSymbols[module.db.profile.tracker.TrackerSymbol] .. " "
        end
    else
        if (IsAddOnLoaded("Mobmap")) then
            objText = "- "
        else
            objText = "  "
        end
    end

    objText = objText .. text

    -- create line
    line = module:getLine();
    line.type = 'objective';
    line.questID = questID;

    if (module.db.profile.tracker.ShowZones) then
        line.dash:SetText("  ")
    end

    line.text:SetText(objText);
    line.text:SetTextColor(Color.r, Color.g, Color.b)
    line:Show();
end

function module:displayQuestTimer(questID)
    if (not questScanner:HasQuestTimer(questID)) then
        return;
    end

    local questTime, maxTime = questScanner:GetQuestTimer(questID);

    line = module:getLine();
    line:SetHeight(20);
    line.type = 'objective';
    line.questID = questID;
    line:Show();
    line.statusBar:Show();
    line.statusBar.text:SetText(SecondsToTime(questTime));
    line.statusBar:SetMinMaxValues(0 or 0, maxTime or 100);
    line.statusBar:SetValue(questTime);
    line.mouseover:SetWidth(line.statusBar:GetWidth())
end

function module:displayQuestTitle(questIndex)
    local title, qLvl, tag, isHeader, isCollapsed, isComplete, frequency, questID = GetQuestLogTitle(questIndex);
    local taggedTag = questLog:getQuestTag(questIndex);

    local Color, line;

    if (module.db.profile.tracker.RemoveFinished and isComplete == 1) then
        -- complete and hidden, exit
        return;
    end

    -- Colores
    if (isComplete == 1) then
        --Completed
        if (module.db.profile.tracker.CustomHeaderColor) then
            if (module.db.profile.tracker.HeaderQuestLevelColor) then
                Color = GetQuestDifficultyColor(qLvl)
            else
                Color = module.db.profile.tracker.Colors.HeaderComplete
            end
        else
            Color = NORMAL_FONT_COLOR
        end
    elseif (isComplete == -1) then
        -- Failed
        if (module.db.profile.tracker.CustomHeaderColor) then
            Color = module.db.profile.tracker.Colors.HeaderFailed
        else
            Color = NORMAL_FONT_COLOR
        end
    else
        -- Normal
        if (module.db.profile.tracker.CustomHeaderColor) then
            if (module.db.profile.tracker.HeaderQuestLevelColor) then
                Color = GetQuestDifficultyColor(qLvl)
            else
                Color = module.db.profile.tracker.Colors.HeaderNormal
            end
        else
            Color = { r = 0.75, g = 0.61, b = 0 }
        end
    end

    line = module:getLine();
    if (module.db.profile.tracker.ShowZones) then
        line.dash:SetText("  ")
    end

    line.type = 'quest';
    line.text:SetText(taggedTag .. tostring(title));
    line.questID = questID;
    line.text:SetTextColor(Color.r, Color.g, Color.b)
    line:Show();
    
    --
    -- Objectives
    --

    if (module.db.profile.tracker.MinimizeFinished or module.db.profile.tracker.HideCompletedOnly) and isComplete == 1 then
        -- hide questobjectives on complete quest
        return;
    end

    for i = 1, GetNumQuestLeaderBoards(questIndex) do
        module:displayQuestObjective(questIndex, i);
    end
end

function module:displayTrackerFrame()
    -- Hide empty Frame
    if (#module.lineCache.usedFrames == 0) then
        module.frames.questWatchFrame:Hide();
        module.frames.questWatchTitle:Hide();

        return;
    end 

    -- display title when allowed
    if (module.db.profile.tracker.ShowHeader) then
        module.frames.questWatchTitle:Show();
    end

    -- hide minimized tracker only when title is displayed
    if (module.db.profile.tracker.ShowHeader and module.db.char.QuestWatchMinimized) then
        module.frames.questWatchFrame:Hide();

        return;
    end

    module.frames.questWatchFrame:Show();

    -- Tracker height
    local height = 0 + module.db.profile.tracker.FontHeight; -- border spacing
    local width = module.frames.questWatchTitle:GetWidth(); -- is calculated in header
    local linewidth = 0 
    local nextoffset = 0
    local previousLine;
    local spacing = module.db.profile.tracker.FontHeight;

    for k, line in ipairs(module.lineCache.usedFrames) do
        previousLine = k == 1 and module.frames.questWatchFrame or module.lineCache.usedFrames[k - 1];
        nextoffset = (line.type == 'header' and 0.5 or line.type == 'quest' and 0.25 or 0.125) * line:GetHeight();
        linewidth = line.dash:GetWidth() + line.text:GetWidth() + spacing;

        if (not module.db.profile.tracker.AutoResize and linewidth > module.db.profile.tracker.FixedWidth) then
            line.text:SetWidth(module.db.profile.tracker.FixedWidth - line.dash:GetWidth() - spacing);
            linewidth = module.db.profile.tracker.FixedWidth;
        end

        if (k > 1) then
             line:SetPoint("TOPLEFT", previousLine, "BOTTOMLEFT", 0, -nextoffset);
             line:SetPoint("TOPRIGHT", previousLine, "BOTTOMRIGHT", 0, -nextoffset);
        else 
             line:SetPoint("TOPLEFT", previousLine, "TOPLEFT", spacing / 2, (-spacing - 8) / 2); -- indent of 4
             line:SetPoint("RIGHT", previousLine, "RIGHT", -(spacing / 2), (-spacing - 8) / 2); -- indent of 4
        end

        line.mouseover:Show();
        line.mouseover:ClearAllPoints();
        line.mouseover:SetPoint('LEFT', line.text);
        line.mouseover:SetPoint('RIGHT', line.text);
        line.mouseover:SetPoint('TOP', line, 'TOP', 0, nextoffset);
        line.mouseover:SetPoint('BOTTOM', line);

        height = height + line:GetHeight() + nextoffset;
        width = max(width, linewidth);
    end
    
    module.frames.questWatchFrame:SetHeight(height)
    module.frames.questWatchFrame:SetWidth(width)
end

function module:displayTrackerHeader()
    local _, index, isComplete, numQuests, questEntries;
    local completedQuests = 0;

    for _, questID in ipairs(module.db.char.QuestWatchIDs) do
        _, _, _, _, _, isComplete = questScanner:GetQuestLogTitle(questID);

        if (isComplete) then
            completedQuests = completedQuests + 1
        end
    end

    numQuests = #module.db.char.QuestWatchIDs;

    _, questEntries = GetNumQuestLogEntries()
    
    if (module.db.profile.tracker.RemoveFinished) then
        module.frames.questWatchTitle.Text:SetText(L["Quest Tracker"] .. " (" .. numQuests - completedQuests .. "/" .. questEntries .. ")")
    else
        module.frames.questWatchTitle.Text:SetText(L["Quest Tracker"] .. " (" .. numQuests .. "/" .. questEntries .. ")")
    end

    -- set Tracker Width
    module.frames.questWatchFrame:SetWidth(module.frames.questWatchTitle.Text:GetStringWidth() + module.db.profile.tracker.FontHeight + 24 + 2);
end

function module:displayTrackerZone(lastZone, newZone, complete)
    local color, line;

    if (not module.db.profile.tracker.ShowZones or module.db.profile.tracker.RemoveFinished == complete or lastZone == newZone) then
        return lastZone;
    end

    if (module.db.profile.tracker.CustomZoneColor) then
        color = module.db.profile.tracker.Colors.Zone
    else
        color = {r = 0.8, g = 0.8, b = 1}
    end

    line = module:getLine(lines);
    line.type = 'header';
    line.questID = newZone;
    line.text:SetText(newZone);
    line.text:SetTextColor(color.r, color.g, color.b, color.a)

    return newZone;
end

function module:mergeQuestsToAddon()
    local watchIndexes = {};
    for i = 1, GetNumQuestWatches(), 1 do
        local index = GetQuestIndexForWatch(i);

        module:AddQuestWatch(index);

        tinsert(watchIndexes, index);
    end

    for _, index in ipairs(watchIndexes) do
        RemoveQuestWatch(index);
    end
end

function module:mergeQuestsFromAddon()
    for _, questId in ipairs( module.db.char.QuestWatchIDs) do
        --local
    end
end

function module:isFading()
    self = self or module.tooltip;

    return self.fadeInfo ~= nil;
end

function module:onFadeEnd()
    self = self or module.tooltip;

    self:ClearLines();
    self:Hide();
    self:SetAlpha(1);
    self.fadeInfo = nil;
end

function module:startFading(time)
    self = self or module.tooltip;
    ResetCursor();

    local fadeInfo = {
        fadeHoldTime = 1,
        finishedFunc = module.onFadeEnd,
        mode = "OUT",
        timeToFade = time or 0.25
    };

    UIFrameFade(self, fadeInfo);
end

function module:stopFading()
    self = self or module.tooltip;
    UIFrameFadeRemoveFrame(self);
    self:OnFadeEnd();
end

--
-- Events
--

function module:anchor_OnUpdate(elapsed)
    if (self.UIScale ~= UIParent:GetScale()) then
        beql:RestoreFramePosition(self);
    end
end

function module:line_OnUpdate(elapsed)
    self.updateTime = (self.updateTime or 0.2) - elapsed;
    
    if (self.updateTime > 0) then
        return
    end
    
    self.updateTime = 0.2; 
    
    if (self:IsMouseOver()) then
        local line = self:GetParent()
        if (GetMouseFocus() == module.frames.questWatchFrame) then
            module.frames.questWatchFrame.questID = line.questID
            module.frames.questWatchFrame.lastIdUpdate = GetTime() + .2
        end
    end
end

function module:line_OnEnter()
    local line = self:GetParent();

    if (line.type ~= 'quest' and line.type ~= 'objective' or not module.db.profile.tracker.tooltip.enabled) then
        return;
    end


    if (module.tooltip.questID ~= line.questID) then
        module.tooltip.questID = line.questID;
    end

    module:Tooltip_OnUpdate(1);
end

function module:line_OnLeave()
    local line = self:GetParent();
    
    if (module.tooltip.questID == line.questID) then
        module.tooltip.questID = nil;
    end 


    self.LeftButton = nil;
    self.RightButton = nil;
end

function module:line_OnMouseDown(button)
    self[button] = GetTime();
end

function module:line_OnMouseUp(button)
    local line = self:GetParent();
    local duration = GetTime() - (self[button] or GetTime());

    if (duration == 0) then
        return;
    end

    local _, _, _, _, _, _, _, questID, questIndex, headerID = questScanner:GetQuestLogTitle(line.questID);

    if (line.type == 'header' and button == 'LeftButton') then
        --@TODO: open map
        return;
    elseif (line.type == 'header' and button == 'RightButton') then
        local header = line.questID;
        for _, questID in pairs(questScanner:GetZoneQuests(line.questID)) do
            local childIndex = select(9, questScanner:GetQuestLogTitle(questID))
            if (IsQuestWatched(childIndex)) then
                module:toggleQuestWatch(childIndex);
            end
        end
    elseif (IsShiftKeyDown() and button == 'LeftButton') then
        --@TODO: post quest
        return;
        elseif (button == 'LeftButton') then
            if (QuestLogFrame:IsVisible() ~= true) then
                securecall(ShowUIPanel, QuestLogFrame);
            end

            securecall(QuestLog_SetSelection, questIndex);

            if(questIndex > GetNumQuestLogEntries())then
                local headerIndex = select(9, questScanner:GetQuestLogTitle(headerID)) 
                securecall(ExpandQuestHeader, headerIndex);
            end
        elseif (button == 'RightButton') then
            module:toggleQuestWatch(questIndex);
        end

    QuestLog_Update();
    module:displayQuests();
end

function module:OnDragStart()
    if (module.frames.questWatchAnchor:IsMovable()) then
        module.frames.questWatchAnchor.ismoving = true;
        module.frames.questWatchAnchor:StartMoving();
    end
end

function module:OnDragStop()
    module.frames.questWatchAnchor.ismoving = false
    module.frames.questWatchAnchor:StopMovingOrSizing()
    beql:SaveFramePosition(module.frames.questWatchAnchor)
end

function module:OnToggle(...)
    if(select('#',...) > 0) then
        if (IsShiftKeyDown()) then
            return beql:Fire('OPEN_OPTIONES_MENU', 'questtracker');
        end

        -- clicked
        module.db.char.QuestWatchMinimized = not module.db.char.QuestWatchMinimized;

        module:displayQuests();
    end

    if (module.db.char.QuestWatchMinimized) then
        module.frames.questWatchToggleButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\restore_up")
        module.frames.questWatchToggleButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\restore_down")
    else
        module.frames.questWatchToggleButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
        module.frames.questWatchToggleButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    end
end

function module:QUEST_WATCH_UPDATE(event, index)
    if (not module:IsDisabled() and not IsQuestWatched(index) and module.db.profile.tracker.AddUntracked) then
        module:toggleQuestWatch(index);
    end
end

function module:StatusBar_OnUpdate(elapsed)
    if (not self.statusBar:IsShown()) then
        -- stausbar not shown, exit
        return;
    end

    self.time = (self.time or 0) + elapsed
    if (self.time < 0.25) then
        -- only update every 0.1 seconds
        return;
    end
    
    if (not questScanner:HasQuestTimer(self.questID)) then
        self:Hide();
        -- ToDo: Update WatchFrame
        return;
    end
    
    local questtimeleft = questScanner:GetQuestTimer(self.questID);
    
    if (not questtimeleft or type(questtimeleft) ~= 'number') then
        self:Hide();
        
        return;
    end
    
    self.statusBar.text:SetText(SecondsToTime(questtimeleft));
    self.statusBar:SetValue(questtimeleft);
    self.time = 0
end

--[[
--------------------------------------------
-- Notes:
-- Shows Tooltip on Questtracker
--
-- Returns:
-- * nothing
--------------------------------------------]]

function module:Tooltip_OnUpdate(elapsed)
    local tooltip = module.tooltip;

    tooltip.updateTime = (tooltip.updateTime or 0.2) - elapsed;

    if (tooltip.questID == nil and not tooltip:IsFading() and tooltip:IsVisible()) then
        tooltip:FadeOutTooltip();
    end

    if (tooltip.updateTime > 0 or tooltip.questID == nil) then 
        return;
    end

    tooltip.updateTime = 0.2;

    if (tooltip:IsFading()) then
        tooltip:StopFading();
    end

    local Groupmember = {};

    -- show tooltip
    ShowInspectCursor()
    tooltip:SetOwner(UIParent, "ANCHOR_CURSOR")

    local title, qLvl, tag, isHeader, isCollapsed, isComplete, frequency, questID, index, header = questScanner:GetQuestLogTitle(tooltip.questID);

    if (module.db.profile.tracker.tooltip.useQuestColors) then
        Color = GetQuestDifficultyColor(qLvl)
    else
        Color = module.db.profile.tracker.tooltip.titleColor
    end
    tooltip:AddLine(title, Color.r, Color.g, Color.b)

    -- Questdetails
    if (module.db.profile.tracker.tooltip.showDescription) then
        local questObjectives = select(2, GetQuestLogQuestText(index))
        tooltip:AddLine(questObjectives, module.db.profile.tracker.tooltip.descriptionColor.r, module.db.profile.tracker.tooltip.descriptionColor.g, module.db.profile.tracker.tooltip.descriptionColor.b, 1)
    end

    -- Groupmember
    -- temp fix for display Groupmember on Quest
    if (GetNumGroupMembers() > 0) then
        for i=1, GetNumGroupMembers(), 1 do
            local partymember, partyrealm = UnitName("party" .. i)

            if (partyrealm and partyrealm ~= "" and partyrealm ~= GetRealmName()) then
                partymember = partymember .. "-" .. partyrealm
            end

            if (IsUnitOnQuest(index, "party" .. i)) then
                tinsert(Groupmember, partymember);
            end
        end

        if (#Groupmember > 0) then
            tooltip:AddLine(" ", nil, nil, nil, 1)
            tooltip:AddLine(L["Party member on Quest:"], 1, 1, 1, 1)
            tooltip:AddLine(table.concat(Groupmember, ', '), nil, nil, nil, 1)
        end
    end

    tooltip:Show()
end

--
-- Hooks
--

function module:IsQuestWatched(index)
    local questID = select(8, GetQuestLogTitle(index));

    return module.db.char.QuestWatchIDs.includes(questID);
end

-----------------------------------------------------------------------------------------------------


function module:autoWatchNewQuest(questID)
    if (module:IsDisabled() or module.db.profile.tracker.AddNew ~= true or module.db.char.QuestWatchIDs.includes(questID)) then
        return;
    end 

    module.db.char.QuestWatchIDs.push(questID);
    module:SortWatchedQuests();
end

function module:questWatchRemoveQuest(questID)
    local watchIDs = module.db.char.QuestWatchIDs

    if (watchIDs.includes(questID)) then
        watchIDs.splice(watchIDs.indexOf(questID), 1);
    end 
end

function module:toggleQuestWatch(index)
    local watched = IsQuestWatched(index); -- <-- api hooked !
    local zone, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(index);

    if (isHeader) then
        local zoneQuests = questScanner:GetZoneQuests(zone);
        local zoneWatched = true;
        for _, childID in pairs(zoneQuests) do
            local childIndex = select(9, questScanner:GetQuestLogTitle(childID));

            zoneWatched = zoneWatched and IsQuestWatched(childIndex);
        end

        for _, childID in pairs(zoneQuests) do
            local childIndex = select(9, questScanner:GetQuestLogTitle(childID));

            if(IsQuestWatched(childIndex) == zoneWatched) then
                module:toggleQuestWatch(childIndex);
            end
        end
    elseif (watched) then
        for k, id in ipairs(module.db.char.QuestWatchIDs) do
            if (id == questID) then
                tremove(module.db.char.QuestWatchIDs, k);
                break;
            end
        end
        index = nil
    else
        module.db.char.QuestWatchIDs.push(questID);
    end

    module:SortWatchedQuests();
    module:displayQuests();
    QuestLog_Update();
end

function module:SortWatchedQuests()
    if (module.db.profile.tracker.SortItems ~= true) then
        return;
    end

    table.sort(module.db.char.QuestWatchIDs, function(a, b)
        local aText, aLevel, _, _, _, _, _, _, _, aHeader = questScanner:GetQuestLogTitle(a);
        local bText, bLevel, _, _, _, _, _, _, _, bHeader = questScanner:GetQuestLogTitle(b);

        if (module.db.profile.tracker.ShowZones and aHeader ~= bHeader) then
            return aHeader < bHeader;
        end

        if (module.db.profile.questlog.showlevel and aLevel ~= bLevel) then
            return aLevel < bLevel;
        end

        return aText < bText;
    end)
end


-- EOF --

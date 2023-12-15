--[[
************************************************************************

questlog.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike

************************************************************************
]]--
local addonName = ...;

local beql   = LibStub("AceAddon-3.0"):GetAddon(addonName)
local module = beql:NewModule('Log');
local L      = LibStub("AceLocale-3.0"):GetLocale(addonName);
local path   = 'Interface\\AddOns\\' .. addonName .. '\\Images\\';


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
    local _, node, region, tInfo;

    module:debug('Init');
    beql:saveLayout(QuestLogFrame);
    beql:saveLayout(QuestLogFrameCloseButton);
    beql:saveLayout(QuestFrameExitButton);
    beql:saveLayout(QuestFramePushQuestButton);
    beql:saveLayout(QuestLogListScrollFrame);
    beql:saveLayout(QuestLogDetailScrollFrame);
    beql:saveLayout(QuestLogCountRight);
    beql:saveLayout(beql.frames.questLogAnchor);

    QuestLogListScrollFrame.buttons = {};
    QuestLogFrame.textures = {};
    QuestLogFrame.QUESTS_DISPLAYED = QUESTS_DISPLAYED;

for _, region in ipairs({QuestLogFrame:GetRegions()}) do
    if (region:IsObjectType("Texture")) then
        local texturePath = region:GetTexture();

        -- Add a check to handle the case where texturePath is a number
        if type(texturePath) == "string" then
            module:debug('Texture Path:', texturePath);

            local name = texturePath:match('([^\-]*[fh]t)$');

            if (region:GetTexture():match('(Icon)$')) then
                beql.frames.questlogIcon = region;
            end

            if (name) then
                region.simple = true;
                QuestLogFrame.textures[name:lcFirst()] = region;
            end
        else
            module:debug('Skipping invalid texturePath:', texturePath);
        end
    end
end

    QuestLogFrame.UIPanelWindows = {
        area = UIPanelWindows.QuestLogFrame.area,
        width = UIPanelWindows.QuestLogFrame.width,
        height = UIPanelWindows.QuestLogFrame.height
    };

    for i = 1, 40 do
        node = _G['QuestLogTitle' .. i] or CreateFrame('Button', 'QuestLogTitle' .. i, QuestLogFrame, 'QuestLogTitleButtonTemplate');
        node:SetID(i);
        module:initQuestLogTitleButton(node);
    end

    local t = {
        {file = path .. 'LeftOff', x = 0,   y = 0, minimized = true}, 
        {file = path .. 'LeftOn',  x = 0,   y = 0, maximized = true},
        {file = path .. 'RightOn', x = 512, y = 0, maximized = true}, 
    };

    for _, tInfo in ipairs(t) do
        node = QuestLogFrame:CreateTexture(nil, 'BORDER');
        node:SetTexture(tInfo.file);
        node:SetPoint('TOPLEFT', QuestLogFrame, 'TOPLEFT', tInfo.x, tInfo.y);
        node:SetParent(QuestLogFrame);
        node:SetWidth(0.01);
        node:SetHeight(0.01);

        node.minimized = tInfo.minimized;
        node.maximized = tInfo.maximized;

        QuestLogFrame.textures["beql_" .. tInfo.file:match('([%w_]*)$')] = node;
    end

    -- QuestLogDetailScrollFrame:Show is triggered by QuestLogUpdate, so we must place a hook to keep it hidden
    hooksecurefunc('GetQuestLogTitle', module.Hooks_GetQuestLogTitle);
    hooksecurefunc('ShowUIPanel', module.Hooks_OnToggle);
    hooksecurefunc(QuestLogDetailScrollFrame, 'Show', module.Hooks_DetailScrollFrame_OnShow);
    hooksecurefunc(QuestLogDummyText, 'SetText', module.Hooks_TitleButton_SetText);
    hooksecurefunc(QuestLogFrame, 'SetPoint', module.Hooks_SetPoint);

    module:On('QUEST_COMPLETED', module.questCompleted);

    beql.frames.configButton:Show();
    module:SetEnabledState(beql.db.profile.questlog.enabled);

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
    module:debug('enable');

    if (module:IsDisabled()) then
        -- may be disabled because addon is disabled
        module:Disable();

        module:debug('enable, beql disabled -> skip');
        
        return;
    end

    QuestLogTitleText:SetText(L["Bayi's Extended Quest Log"]);

    -- Ensure that questlogIcon is properly created and assigned a texture
    beql.frames.questlogIcon = beql.frames.questlogIcon or CreateFrame("Frame", "beqlQuestLogIcon", QuestLogFrame, "InsetFrameTemplate");
    beql.frames.questlogIcon:SetSize(16, 16);  -- Adjust the size as needed
    beql.frames.questlogIcon:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 0, 0);

    beql.frames.questlogIcon.texture = beql.frames.questlogIcon.texture or beql.frames.questlogIcon:CreateTexture(nil, "ARTWORK");
    beql.frames.questlogIcon.texture:SetAllPoints(true);
    beql.frames.questlogIcon.texture:SetTexture("Interface\\Addons\\beql\\Images\\icon");

    QuestLogFrame:SetAlpha(beql.db.profile.questlog.Alpha);
    QuestLogFrame:SetScale(beql.db.profile.questlog.Scale);
    module:setFontSize();

    -- movability
    if (beql.db.profile.questlog.locked ~= true) then
        module.Hooks_SetPoint(QuestLogFrame);
    else
        QuestLogFrame:RegisterForDrag("LeftButton");
        beql:restoreLayout(QuestLogFrame);
    end

    module.Hooks_OnToggle(QuestLogFrame);
    module:debug(' enable - done');
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
    module:debug(' disable');

    module:SetEnabledState(beql.db.profile.questlog.enabled);

    module:simpleQuestlog();

    QuestLogTitleText:SetText(QUEST_LOG)
    module:setFontSize()
    QuestLogFrame:SetAlpha(1)
    QuestLogFrame:SetScale(1)
    QuestLogFrame:RegisterForDrag(0)

    beql.frames.questlogIcon:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BookIcon");

    -- update frame
    QuestLog_Update()

    -- Blizzard Status is now resored, activate beql stuff if needed
    module:debug(' disable - done');
end

--
-- module methodes
--

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Initialize extended questlog style
--
-- Returns:
-- nothing
------------------------------------------]]
function module:extendedQuestlog()
    QUESTS_DISPLAYED = 25;

    -- adjust button's position
    QuestLogFrameCloseButton:ClearAllPoints();
    QuestLogFrameCloseButton:SetPoint('TOPRIGHT', QuestLogFrame, 'TOPRIGHT', 2, -8);

    QuestFrameExitButton:ClearAllPoints();
    QuestFrameExitButton:SetPoint('BOTTOMRIGHT', QuestLogFrame, 'BOTTOMRIGHT', -10, 55);

    QuestFramePushQuestButton:ClearAllPoints();
    QuestFramePushQuestButton:SetPoint('TOPLEFT', QuestLogFrameAbandonButton, 'TOPRIGHT', 2);

    QuestLogCountRight:ClearAllPoints();
    QuestLogCountRight:SetPoint('TOPRIGHT', QuestLogFrame, 'TOPRIGHT', -15, -41);


    QuestLogFrame:SetAttribute("UIPanelLayout-width", 680);
    QuestLogFrame:SetAttribute("UIPanelLayout-height", 562);
    QuestLogFrame:SetAttribute("UIPanelLayout-area", 'doublewide');

    QuestLogFrame:SetHeight(562)
    QuestLogListScrollFrame:SetHeight(410)
    QuestLogDetailScrollFrame:SetHeight(410);
    

end

--[[----------------------------------------
-- Arguments:
-- number - index of the quest
--
-- Notes:
-- gets the active tag for a quest
--
-- Returns:
-- string - quest tag in braces
------------------------------------------]]
function module:getQuestTag(index)
    local _, level, questTag, isHeader, _, _, frequency = GetQuestLogTitle(index);

    if (isHeader) then
        return "";
    end

    local tags = {};

    if (beql.db.profile.questlog.showlevel) then
        tinsert(tags, level > 0 and level or 1);
    end

    -- build a tagged title
    if (beql.db.profile.questlog.showTags) then
        if (questTag == GROUP and GROUP ~= nil) then
            tinsert(tags, 'G');
        elseif (questTag == ELITE and ELITE ~= nil) then
            tinsert(tags, '+');
        elseif (questTag == ITEM_HEROIC and ITEM_HEROIC ~= nil) then
            tinsert(tags, 'H');
        elseif (questTag == RAID and RAID ~= nil) then
            tinsert(tags, 'R');
        elseif (questTag == PVP and PVP ~= nil) then
            tinsert(tags, 'P');
        elseif (frequency == 2) then
            tinsert(tags, 'Y');
        elseif (frequency == 3) then
            tinsert(tags, 'W');
        elseif (questTag == LFG_TYPE_DUNGEON and LFG_TYPE_DUNGEON ~= nil) or BUG_CATEGORY3:match(questTag or 'noTag') then
            tinsert(tags, 'D');
        end
    end

    if (#tags > 0) then
        tinsert(tags, 1, '[');
        tinsert(tags, '] ');
    end

    return table.concat(tags, '');
end

--[[----------------------------------------
-- Arguments:
-- UIObject - QuestLogTitleButton
--
-- Notes:
-- Initialize the QuestFrameExitButton and enable hooks
--
-- Returns:
-- nothing
------------------------------------------]]
function module:initQuestLogTitleButton(button)
    tinsert(QuestLogListScrollFrame.buttons, button);

    button:SetScript('OnClick', module.Hooks_TitleButton_OnClick)
    hooksecurefunc(button, 'SetText', module.Hooks_TitleButton_SetText);

    if (button:GetID() > 1) then
        button:ClearAllPoints();
        button:SetPoint('TOPLEFT', _G['QuestLogTitle' .. (button:GetID() - 1)], 'BOTTOMLEFT');
    end

    button:Hide();
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Maximize the style of the extended questlog
--
-- Returns:
-- nothing
------------------------------------------]]
function module:maximizeQuestlog()
    if ( GetNumQuestLogEntries() == 0 ) then
        -- no quests in log, do not allow to maximize
        return
    end

    beql.db.char.QuestLogMinimized = false

    local button = beql.frames.questLogToggleButton
    button:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
    button:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    QuestLogFrame:SetAttribute("UIPanelLayout-width", 680)
    QuestLogFrame:SetWidth(682)

    -- change textures
    module:toggleTextures('maximized');

    QuestLogDetailScrollFrame:ClearAllPoints();
    QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPRIGHT", 30, 2);
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Minimize the style of the extended questlog
--
-- Returns:
-- nothing
------------------------------------------]]
function module:minimizeQuestlog()
    beql.db.char.QuestLogMinimized = true

    local button = beql.frames.questLogToggleButton
    button:SetNormalTexture("Interface\\AddOns\\beql\\Images\\restore_up")
    button:SetPushedTexture("Interface\\AddOns\\beql\\Images\\restore_down")

    QuestLogFrame:SetAttribute("UIPanelLayout-width", 384)
    QuestLogFrame:SetWidth(353)

    -- change textures
    module:toggleTextures('minimized');

    QuestLogDetailScrollFrame:Hide();
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Adjust questlog fonts to the given size
--
-- Returns:
-- nothing
------------------------------------------]]
function module:setFontSize()
    local fontSize = module:IsDisabled() and 12 or beql.db.profile.questlog.FontSize;

    local fonts = {};

    for key, v in pairs(_G) do
        if ((key:match('^QuestInfo') or key:match('^QuestLog')) and type(v) == 'table' and v.GetFont and not key:match('Watch')) then
            tinsert(fonts, v);
        end
    end

    for _, font in ipairs(fonts) do 
        if (font._heightFactor == nil) then
            font._heightFactor = select(2, font:GetFont()) / 12;
        end

        local fontName, fontHeight, fontFlags = font:GetFont();
        fontHeight = fontSize * font._heightFactor;
        font:SetFont(fontName, fontHeight, fontFlags);
    end
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Initialize the simple Blizzard style questLog
--
-- Returns:
-- noting
------------------------------------------]]
function module:simpleQuestlog()
    for _, frame in ipairs(QuestLogListScrollFrame.buttons) do
        frame:Hide();
    end

    QUESTS_DISPLAYED = QuestLogFrame.QUESTS_DISPLAYED;

    -- frame Defaults

    beql:restoreLayout(QuestLogFrame);
    beql:restoreLayout(QuestLogFrameCloseButton);
    beql:restoreLayout(QuestFrameExitButton);
    beql:restoreLayout(QuestFramePushQuestButton);
    beql:restoreLayout(QuestLogListScrollFrame);
    beql:restoreLayout(QuestLogDetailScrollFrame);
    beql:restoreLayout(QuestLogCountRight);

    -- Hide Addon Buttons
    beql.frames.questLogToggleButton:Hide();

    --QuestLogDetailScrollFrame:Show();

    -- restore old textures
    module:toggleTextures('simple')

    UIPanelWindows.QuestLogFrame.area = QuestLogFrame.UIPanelWindows.area;
    UIPanelWindows.QuestLogFrame.area = QuestLogFrame.UIPanelWindows.area;
    UIPanelWindows.QuestLogFrame.area = QuestLogFrame.UIPanelWindows.area;
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Toggles the minimize/maximize style of the questlog
--
-- Returns:
-- nothing
------------------------------------------]]
function module.toggleStyle()
    if (beql.db.char.QuestLogMinimized) then
        module:maximizeQuestlog();
        QuestLogDetailScrollFrame:Show();
    else
        module:minimizeQuestlog()
    end
end

--[[----------------------------------------
-- Arguments:
-- string - the name of the current active texture set
--
-- Notes:
-- Toggles the visibility for the questlog textures
--
-- Returns:
-- nothing
------------------------------------------]]
function module:toggleTextures(style)
    for _, texture in pairs(QuestLogFrame.textures) do
        -- 0 removes the size limitations
        local size = texture[style] and 0 or 0.01;

        texture:SetHeight(size);
        texture:SetWidth(size);
    end
end

--
-- Events
--

--[[----------------------------------------
-- Arguments:
-- number - time since last update
--
-- Notes:
-- Update frame script
--
-- Returns:
-- nothing
------------------------------------------]]
function module:Anchor_OnUpdate(elapsed)
    self.updateTime = self.updateTime - elapsed;

    if (self.updateTime < 0) then
        if (self.UIScale ~= UIParent:GetScale()) then
            beql:RestoreFramePosition(self)
        end   

        self.updateTime = .2;
    end
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Trigger config menue
--
-- Returns:
-- nothing
------------------------------------------]]
function module.configButton_OnClick()
    if (IsShiftKeyDown()) then
        return beql:Fire('OPEN_OPTIONES_MENU', 'questlog');
    end

    beql:Fire('OPEN_OPTIONES_MENU', 'main');
end

--[[----------------------------------------
-- Arguments:
-- 
--
-- Notes:
-- Questloag frame drag start script
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnDragStart(...)
    local self = beql.frames.questLogAnchor;
    if (module:IsDisabled() or beql.db.profile.questlog.locked) then
        return;
    end

    self.ismoving = true;
    self:StartMoving();
end

--[[----------------------------------------
-- Arguments:
-- 
--
-- Notes:
-- Questloag frame drag stop script
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnDragStop(...)
    local self = beql.frames.questLogAnchor;
    self.ismoving = false
    self:StopMovingOrSizing()
    beql:SaveFramePosition(self)
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

    if (module.db.profile.questlog.InfoOnQuestCompletion) then
        UIErrorsFrame:AddMessage(title ..' '..L['Completed!'], 1.0, 0.8, 0.0, 1.0, UIERRORS_HOLD_TIME)

        if (module.db.profile.questlog.InfoSound and module.db.profile.questlog.InfoSound ~= '') then
            PlaySoundFile(module.db.profile.questlog.InfoSound, 'Master')
        end
    end
end

--
-- Hooks
--

function module:Hooks_OnToggle()
    if (self ~= QuestLogFrame) then
        return;
    end

    local style = beql.db.profile.questlog.style;

    if (style == 'simple') then
        module:simpleQuestlog();
    end

    if (module:IsDisabled() or QuestLogFrame:IsVisible() == false) then
        return;
    end

    if (style == 'minimized') then
        beql.db.char.QuestLogMinimized = true;
    elseif (style == 'maximized') then
        beql.db.char.QuestLogMinimized = false;
    end

    if (beql.db.profile.questlog.style ~= 'simple') then
        beql.frames.questLogToggleButton:Show();
        module:extendedQuestlog();

        if(GetNumQuestLogEntries() == 0 or beql.db.char.QuestLogMinimized) then
            module:minimizeQuestlog();
        elseif (not beql.db.char.QuestLogMinimized) then
            module:maximizeQuestlog();
        end
    end

    QuestLog_Update();
end

function module:Hooks_DetailScrollFrame_OnShow()
    if (module:IsDisabled() or beql.db.profile.questlog.style == 'simple') then
        -- nothing to do here
        return;
    end

    if (beql.db.char.QuestLogMinimized) then
        module:minimizeQuestlog();
    else
        module:maximizeQuestlog();
    end
end

function module.Hooks_GetQuestLogTitle(index)
    QuestLogDummyText.index = index;
end

function module.Hooks_SetPoint(self, ...)
    if (module:IsDisabled() or beql.db.profile.questlog.locked or self.setPointCall) then
        return
    end
    
    self.setPointCall = true;
    self:ClearAllPoints();
    self:SetPoint("TOPLEFT", beql.frames.questLogAnchor, "TOPLEFT", 0, 0);
    self:RegisterForDrag("LeftButton");

    self.setPointCall = nil;
end


function module:Hooks_TitleButton_OnClick(...)
    -- print chat progress
    if (DEFAULT_CHAT_FRAME.editBox:IsVisible() and IsShiftKeyDown() and beql:GetModule('Chat'):IsEnabled()) then
        module:Fire('ANNOUNCE_QUEST', self:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame));

        return;
    end

    -- link good old blizzard style
    if ( IsModifiedClick("CHATLINK") and ChatEdit_GetActiveWindow() ) then
        securecall(QuestLogTitleButton_OnClick, self, ...);
        return;
    end

    -- select quest or header
    if (not IsShiftKeyDown() or not beql:GetModule('Tracker'):IsEnabled()) then
        if (self.isHeader ~= true) then
            beql.db.char.QuestLogMinimized = false;
        end

        securecall(QuestLogTitleButton_OnClick, self, ...);

        return;
    end

    -- Toggle selection
    module:Fire('TOGGLE_QUEST_WATCH', self:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame));
end

function module.Hooks_TitleButton_SetText(button, ...)
    if (button.hookCall or module:IsDisabled()) then
        return;
    end

    button.hookCall = true;

    local spacing = button:GetText():match('^(%s*)');
    local questIndex = QuestLogDummyText.index;
    local text = GetQuestLogTitle(questIndex);
    local tag = module:getQuestTag(questIndex);
    local newText = spacing .. tag .. text;

    button:SetText(newText);

    button.hookCall = nil;
end



--- EOF --- 
 

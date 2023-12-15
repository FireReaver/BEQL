--[[
************************************************************************

icon.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike

************************************************************************
]]--

local addonName = ...;
local modulName = addonName .. 'Icon';

local beql = LibStub("AceAddon-3.0"):GetAddon(addonName);
local options = beql:GetModule('Options')
local beqlIcon = beql:NewModule('Icon');

local L = LibStub("AceLocale-3.0"):GetLocale(addonName);
local AceConfigDialog = LibStub("AceConfigDialog-3.0");

local beqlLDB = LibStub("LibDataBroker-1.1"):NewDataObject(modulName, {
    type = "data source",
    text = "beql",
    icon = "Interface\\Icons\\INV_Letter_03"
});

local iconFrame = LibStub("LibDBIcon-1.0");

-- Fubar Options

local iconOptions = {
    desc = L["Icon Config"],
    name = L["Icon Config"],
    type = 'group',
    args = {
        hide = {
            desc = L["Hide the plugin from the panel or minimap, leaving the addon running."],
            get = function(info)
                return beql.db.profile.icon.hide
            end,
            name = L["Hide plugin"],
            order = 1,
            set = function(info, newval)
                beql.db.profile.icon.hide = newval;
                iconFrame:Refresh(modulName);
            end,
            type = 'toggle',
        },
        spacer1 = {
            order = 2,
            type = 'header',
        },
        tooltip = {
            desc = L["Shows the tooltip on mousover this plugin"],
            disabled = function(info)
                return beql.db.profile.icon.hide or beql:IsDisabled();
            end,
            get = function(info)
                return beql.db.profile.icon.tooltip
            end,
            name = L["Show Icon Tooltip"],
            order = 3,
            set = function(info, newval)
                beql.db.profile.icon.tooltip = newval
            end,
            type = 'toggle',
        },
        minimapPos = {
            desc = L["Minimap position"],
            disabled = function(info)
                return beql.db.profile.icon.hide or beql:IsDisabled();
            end,
            get = function(info)
                return beql.db.profile.icon.minimapPos
            end,
            min = 1,
            max = 360,
            name = L["Minimap position"],
            order = 4,
            set = function(info, newval)
                beql.db.profile.icon.minimapPos = newval;
                iconFrame:Refresh(modulName);
            end,
            step = 1,
            type = 'range',
        }
    }
}

function beqlIcon:OnInitialize()
    options:registerOptionsTable(iconOptions, 'icon',  L["Icon Config"]);
end

function beqlIcon:OnEnable()
    if (not beql:IsEnabled()) then
        beqlIcon:Disable();
        beqlIcon:SetEnabledState(true);

        return;
    end

    if (not iconFrame:IsRegistered(modulName)) then
        iconFrame:Register(modulName, beqlLDB, beql.db.profile.icon);
    end

    iconFrame:Refresh(modulName);
    iconFrame:Refresh(modulName);
end

function beqlIcon:OnDisable()
    iconFrame:Hide(modulName);
end

function beqlLDB:OnClick(button) 
    if (IsShiftKeyDown()) then
        beql:Fire('OPEN_OPTIONES_MENU', 'main');
    elseif (button == 'RightButton') then
        beql:Fire('OPEN_OPTIONES_MENU', 'icon');
    else
        ToggleFrame(QuestLogFrame);
    end
end
    
function beqlLDB:OnTooltipShow()
    if (not beql.db.profile.icon.tooltip) then
        return;
    end

    iconFrame.tooltip:SetOwner(iconFrame:GetMinimapButton(modulName), "ANCHOR_BOTTOMLEFT", 30, 0)

    local questEntries = select(2, GetNumQuestLogEntries());
    local numfinished = 'NYI' --select(2, beqlQ:GetNumQuests())

    -- title
    iconFrame.tooltip:AddLine(addonName);
    iconFrame.tooltip:AddLine(" "); -- spacer

    -- num quests
    iconFrame.tooltip:AddDoubleLine(L["|cffffffffQuests|r"], questEntries);

    -- num watched quests
    iconFrame.tooltip:AddDoubleLine(L["|cffff8000Tracked Quests|r"], GetNumQuestWatches());

    -- num completed quests
    iconFrame.tooltip:AddDoubleLine(L["|cff00d000Completed Quests|r"], numfinished);
    iconFrame.tooltip:AddLine(" "); -- spacer

    -- tooltip hint
    iconFrame.tooltip:AddLine(L["|cffeda55fClick|r to open Quest Log."] .. '\n' .. L["|cffeda55fShift+Click|r to open beql config."] .. '\n' .. L["|cffeda55fRightclick|r to open Icon config."], 0, 1, 0, true);

    iconFrame.tooltip:Show();
end

-- EOF --

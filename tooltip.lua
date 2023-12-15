--[[
************************************************************************

tooltip.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike

************************************************************************
]]--
local addonName = ...;

local beql   = LibStub('AceAddon-3.0'):GetAddon(addonName)
local module = beql:NewModule('Tooltip');
local beqlQ  = beql:GetModule('QuestScanner');
local L      = LibStub('AceLocale-3.0'):GetLocale(addonName)

local GameTooltip = GameTooltip;
module.lineCache = {};
module.tooltipQuests = newArray();

--[[
--------------------------------------------
-- Notes:
-- Init the Tooltips for beql
--
-- Returns:
-- * nothing
--------------------------------------------]]
function module:OnInitialize()
    GameTooltip:HookScript('OnShow', module.scan);           -- needed for static objects in the world
    GameTooltip:HookScript('OnSizeChanged', module.scan);    -- neede when a tooltip is re-set with sam contnt by game engine
    GameTooltip:HookScript('OnTooltipSetItem', module.scan); -- items ...
    GameTooltip:HookScript('OnTooltipSetUnit', module.scan); -- units ...
	GameTooltip:HookScript('OnUpdate', module.scan);         -- needed for non tirggerable sets

    hooksecurefunc(GameTooltip, 'SetOwner', module.clear)     -- is triggered by objects
	GameTooltip:HookScript('OnTooltipCleared', module.clear); -- other triggers
	GameTooltip:HookScript('OnHide', module.clear);           -- hiding ...
end

--
-- module methodes
--

--[[----------------------------------------
-- Arguments:
-- string - a text that should be represented in the quest
--
-- Notes:
-- adds a quest to the tooltip and when possible also the matching objective
--
-- Returns:
-- nothing
------------------------------------------]]
function module:addQuestsToTooltip(text)
    if (GameTooltip:GetItem() and module.db.profile.tooltip.scanItems ~= true) then
        -- don't allow hints on items
        return
    end

    if (GameTooltip:GetUnit() and module.db.profile.tooltip.scanUnits ~= true) then
        -- don't allow hints on mobs
        return
    end

    if (not GameTooltip:GetItem() and not GameTooltip:GetUnit() and module.db.profile.tooltip.scanOthers ~= true) then
        -- don't allow hints on other objects
        return
    end

    local objectives = beqlQ:GetObjectivesForText(text);

    if (objectives) then
        for _, objective in pairs(objectives) do
            module:addSpacer();
            GameTooltip:AddLine(module:getQuest(objective.id));
            GameTooltip:AddLine(module:getObjective(objective));
        end
    end

    if (not module.db.profile.tooltip.scanDeep) then
        return;
    end

    local quests = beqlQ:GetQuestsForText(text);

    for _, questId in ipairs(quests) do
        module:addSpacer();
        GameTooltip:AddLine(module:getQuest(questId));
    end
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- adds a spacer, when needed, between tooltip content and quest info
--
-- Returns:
-- nothing
------------------------------------------]]
function module:addSpacer()
    if (#module.tooltipQuests > 0) then
        return;
    end

    GameTooltip:AddLine(' ');

    local line =  module:getLine(GameTooltip:NumLines());
    line:SetHeight(select(2, line:GetFont()) / 4);
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- clears tooltip infos from last scan
--
-- Returns:
-- nothing
------------------------------------------]]
function module:clear()
    if (self.scanned) then
        self.scanned = nil;
        self.updateTime = 0;
        module.tooltipQuests = newArray();

        for _, line in pairs(module.lineCache) do
            -- reset line height to default, 0 means auto height
            line:SetHeight(0);
        end
    end
end

--[[----------------------------------------
-- Arguments:
-- number - index of line to get
--
-- Notes:
-- gets a line from a GameTooltip
--
-- Returns:
-- UIObject - the line object
------------------------------------------]]
function module:getLine(i)
    if (GameTooltip:NumLines() < i) then
        return;
    end

    if (GameTooltip:NumLines() >= i and module.lineCache[i]) then
        return module.lineCache[i];
    end

    module.lineCache[i] = _G['GameTooltipTextLeft' .. i];

    return module:getLine(i);
end

--[[----------------------------------------
-- Arguments:
-- Objective - quest objective object from questscanner
--
-- Notes:
-- formats a quest objective string for adding to tooltip
--
-- Returns:
-- string - the formatted objective string
------------------------------------------]]
function module:getObjective(objective)
    local text = '  - '.. objective.text;

    if (not module.db.profile.tooltip.colorObjectives) then
        return '|cffffffff' .. text .. '|r';
    end

    local colors, color = module.db.profile.tooltip.Colors;

    if (module.db.profile.tooltip.fadeObjectiveColors and objective.countable)  then
        local percent = Round(objective.got / objective.need * 100);
        if (module.db.profile.tooltip.fadeObjectiveWithStep and percent < 50) then
            color = beql:FadeColors(colors.objectiveIncomplete, colors.objectiveFadeStep, percent, 50)
        elseif (module.db.profile.tooltip.fadeObjectiveWithStep and percent < 50) then
            color = beql:FadeColors(colors.objectiveFadeStep, colors.objectiveComplete, percent - 50, 50)
        else
            color = beql:FadeColors(colors.objectiveIncomplete, colors.objectiveComplete, percent, 100)
        end
        
        return '|cff' .. module:RGBPercToHex(color.r, color.g, color.b) .. text .. '|r';
    end

    if (objective.completed) then
        color = colors.objectiveComplete
    else
        color = colors.objectiveIncomplete
    end

    return color:WrapTextInColorCode(text);
end

--[[----------------------------------------
-- Arguments:
-- number - the quest ID
--
-- Notes:
-- formats a quest title string for adding to tooltip
--
-- Returns:
-- string - the formatted quest string
------------------------------------------]]
function module:getQuest(questId)
    if (module.tooltipQuests.indexOf(questId) > -1) then
        return;
    end

    module.tooltipQuests.push(questId);
    local title, qLvl, tag, isHeader, isCollapsed, isComplete, frequency, questID, index, header = beqlQ:GetQuestLogTitle(questId);
    local text = ' ' .. beql:GetModule('Log'):getQuestTag(index) .. tostring(title);

    local color = module.db.profile.tooltip.Colors.titleNormal;
    if (module.db.profile.tooltip.useQuestColors) then
        color = GetQuestDifficultyColor(qLvl);
        color = CreateColor(color.r, color.g, color.b);
    end

    return color:WrapTextInColorCode(text);
end

--[[----------------------------------------
-- Arguments:
-- number - value or red color
-- number - value or green color
-- number - value or blue color
--
-- Notes:
-- transform the color from single values to a hex color string
--
-- Returns:
-- string - color as hex string
------------------------------------------]]
function module:RGBPercToHex(r, g, b)
	r = r and r <= 1 and r >= 0 and r or 0
	g = g and g <= 1 and g >= 0 and g or 0
	b = b and b <= 1 and b >= 0 and b or 0

	return string.format('%02x%02x%02x', r*255, g*255, b*255)
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- checks the tooltip for a quest occurence
--
-- Returns:
-- nothing
------------------------------------------]]
function module:scan()
    if (self.scanned) then
        return;
    end

    self.scanned = true;

    if (self:NumLines() == 0) then
        return
    end

    local text = module:getLine(1):GetText();

    if(beqlQ:IsTextInQuest(text)) then
        module:addQuestsToTooltip(text);
        
        -- nasty resize hack, but works
        self:Show();
    end
end

--- EOF ---

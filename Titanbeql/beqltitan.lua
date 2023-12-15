if (not IsAddOnLoaded("Titan")) then
	-- Do not load if Titanbar is not loaded
	return
end
local beql = LibStub("AceAddon-3.0"):GetAddon(addonName)
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local Ltitan = LibStub("AceLocale-3.0"):GetLocale("Titan", true)


function TitanPanelbeqlButton_OnLoad(this)
    this:SetFrameStrata('FULLSCREEN');
    this:SetToplevel(true);

	this.registry = {
		id = "beql",
		menuText = "bEQL",
		tooltipTitle = "bEQL",
		tooltipTextFunction = "TitanPanelbeqlButton_GetTooltipText",
		category = "Information",
		builtin = 1,
		icon = "Interface\\Icons\\INV_Letter_03",
		iconWidth = 16,
		iconButtonWidth = 16,    
		buttonTextFunction = "TitanPanelbeqlButton_GetButtonText",
		savedVariables = {
            ShowIcon = 1,
            ShowLabelText = 1,
            ShowColoredText = 1
		}
	}
end

function TitanPanelbeqlButton_GetTooltipText()
	local tooltiptext = ""
	local _,questEntries = GetNumQuestLogEntries()
	local _, numfinished = beqlQ:GetNumQuests()	
	
	tooltiptext = tooltiptext.."\n"
	tooltiptext = tooltiptext..L["|cffffffffQuests|r"].."\t"..TitanUtils_GetHighlightText(questEntries.."\n")
	tooltiptext = tooltiptext..L["|cffff8000Tracked Quests|r"].."\t"..TitanUtils_GetHighlightText(GetNumQuestWatches().."\n")
	tooltiptext = tooltiptext..L["|cff00d000Completed Quests|r"].."\t"..TitanUtils_GetHighlightText(numfinished)
	tooltiptext = tooltiptext.."\n\n"
	tooltiptext = tooltiptext..L["|cffeda55fClick|r to open Quest Log and |cffeda55fShift+Click|r to open Waterfall config"]	

	return tooltiptext
end

function TitanPanelbeqlButton_GetButtonText()
    local _,questEntries = GetNumQuestLogEntries()
   	return questEntries.."/20"
end

function TitanPanelbeqlButton_OnClick(self, button)
	if (button == "LeftButton") then
		if (IsShiftKeyDown()) then
            beql:Fire('OPEN_OPTIONES_MENU', 'main');
		else
			ToggleFrame(QuestLogFrame);
		end
	end
end

-- prepares the menu for right click
function TitanPanelRightClickMenu_PreparebeqlMenu()

	TitanPanelRightClickMenu_AddTitle(TitanPlugins["beql"].menuText);

	info = {};
	info.text = L["Main Options"];
	info.func = function() beql:Fire('OPEN_OPTIONES_MENU', 'main'); end
	UIDropDownMenu_AddButton(info);

    --	TitanPanelRightClickMenu_AddSpacer();     
	TitanPanelRightClickMenu_AddToggleIcon("beql");
    --	TitanPanelRightClickMenu_AddSpacer();     
	TitanPanelRightClickMenu_AddCommand(Ltitan["TITAN_PANEL_MENU_HIDE"], "beql", TITAN_PANEL_MENU_FUNC_HIDE);

end

local frame = CreateFrame('Button', 'TitanPanelbeqlButton', UIParent, 'TitanPanelComboTemplate');

TitanPanelbeqlButton_OnLoad(frame);
TitanPanelButton_OnLoad(frame);

frame:SetScript('OnClick', function(button)
    TitanPanelbeqlButton_OnClick(self, button)
    TitanPanelButton_OnClick(self, button);
end)

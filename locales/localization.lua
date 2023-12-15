--[[
************************************************************************

localization.lua

File date: 2020-09-29T23:06:51Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: -

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "enUS", true);

-- general
L[" |cffff0000Disabled by|r"] = true
L["(Done)"] = true
L["Abandon a quest"] = true
L["Accept a new quest"] = true
L["Active Tracker"] = true
L["Add New Quests"] = true
L["Add Untracked"] = true
L["Allow the plugin to color its text."] = true
L["Always Open Maximized"] = true
L["Always Open Minimized"] = true
L["Attach the plugin to the minimap instead of the panel."] = true
L["Attach to minimap"] = true
L["Auto Complete Quest"] = true
L["Auto Resize Tracker"] = true
L["Automatical add new Quests to tracker"] = true
L["Automatical add quests with updated objectives to tracker"] = true
L["Automatical hide completed objectives in tracker"] = true
L["Automatical remove completed quests from tracker"] = true
L["Automatical resizes the tracker depending on the lenght of the text in it"] = true
L["Automatically Complete Quests"] = true
L["Background"] = true
L["Background Color"] = true
L["Background Corner Color"] = true
L["Bayi's Extended Quest Log"] = true
L["Center"] = true
L["Change Locale (needs Interface Reload)"] = true
L["Changes the font size of the tracker"] = true
L["Click to open Quest Log"] = true
L["Close"] = true
L["Close the menu."] = true
L["Color Objectives"] = true
L["Colors"] = true
L["Complete"] = true
L["Complete a quest"] = true
L["Completed Header Color"] = true
L["Completed Objective Color"] = true
L["Completed!"] = true
L["Completion Sound"] = true
L["Custom Background Color"] = true
L["Custom Header Color"] = true
L["Custom Objective Color"] = true
L["Custom Zone Color"] = true
L["Customize the Objective/Quest Markers"] = true
L["Deep scan for quest"] = true
L["Default chat for actual group"] = true
L["Detach the tooltip from the panel."] = true
L["Detach tooltip"] = true
L["Disable the Tracker"] = true
L["Disable Tracker"] = true
L["Display Markers before objectives"] = true
L["Displays the actual quest's description in the tracker tooltip"] = true
L["Don't play a sound"] = true
L["Enable Addon"] = true
L["Enable Debug"] = true
L["Enable Language support"] = true
L["Enable Left Click"] = true
L["Enable Quest Progression to Party Chat"] = true
L["Enable Questlog"] = true
L["Enable Right Click"] = true
L["Enable the Questlog"] = true
L["Enable this Addon"] = true
L["Enables the language support for non-natural Languages."] = true
L["Extended Quest Log"] = true
L["Fade Colors"] = true
L["Fade the objective colors"] = true
L["Fade-Step-Color"] = true
L["Failed Header Color"] = true
L["Finalize a quest."] = true
L["Fixed Tracker Width"] = true
L["Font Size"] = true
L["Force the quest log to open maximized"] = true
L["Force the quest log to open minimized"] = true
L["Force Tracker Unlock"] = true
L["GameTooltip"] = true
L["General Quest Log Options"] = true
L["Group chat"] = true
L["Header Color"] = true
L["Hidden"] = true
L["Hide Completed Objectives"] = true
L["Hide Objectives for Completed only"] = true
L["Hide objectives only for completed quests"] = true
L["Incomplete"] = true
L["Info on Quest Completion"] = true
L["Item Tooltip Quest Info"] = true
L["Left"] = true
L["Left clicking a quest in the tracker opens the Quest Log"] = true
L["List Type"] = true
L["Lock Quest Log"] = true
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = true
L["Lock tooltip"] = true
L["Lock Tracker"] = true
L["Main Options"] = true
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = true
L["Makes the quest log unmovable"] = true
L["Makes the quest tracker unmovable"] = true
L["Markers"] = true
L["Minimap"] = true
L["Mob Tooltip Quest Info"] = true
L["Mouse Events"] = true
L["No Objectives!"] = true
L["No sound"] = true
L["Non Objective"] = true
L["NPC color"] = true
L["Number of Lines"] = true
L["Number of lines that can be used by the Linemanger"] = true
L["Objective Color"] = true
L["Options related to the Quest Log"] = true
L["Options related to the Quest Tracker"] = true
L["Other"] = true
L["Other Tooltip Quest Info"] = true
L["Party Member Color"] = true
L["Party member on Quest:"] = true
L["Party Member with Quixote Color"] = true
L["Party Quest Progression info"] = true
L["Pick Locale"] = true
L["Position"] = true
L["Position the plugin on the panel."] = true
L["Print a chat massage when an objective of a quest is updated."] = true
L["Print a chat massage when you abandon a quest."] = true
L["Print a chat massage when you accept a new quest."] = true
L["Print a chat massage when you complete all quest objectives."] = true
L["Print a chat massage when you deliver a completed quest to the NPC."] = true
L["Print a chat message when you accept a new quest."] = true
L["Prints the Quest Progression Status to the Party Chat"] = true
L["Profiles"] = true
L["Progess of a quest"] = true
L["Quest %d finished."] = true
L["Quest %s done."] = true
L["Quest abandoned: "] = true
L["Quest accepted: "] = true
L["Quest Accepted: "] = true
L["Quest Description Color"] = true
L["Quest Description in Tracker Tooltip"] = true
L["Quest finalized: "] = true
L["Quest Log Alpha"] = true
L["Quest Log Options"] = true
L["Quest Log Scale"] = true
L["Quest Log Style"] = true
L["Quest objective updated: "] = true
L["Quest Progression to Party Chat"] = true
L["Quest Tracker"] = true
L["Quest Tracker Alpha"] = true
L["Quest Tracker Options"] = true
L["Questlog Layout"] = true
L["Reload UI ?"] = true
L["Remove Completed Quests"] = true
L["Requires Interface Reload"] = true
L["Reset questlog position"] = true
L["Reset tracker position"] = true
L["Right"] = true
L["Right clicking a quest in the tracker removes it from the tracker"] = true
L["say quest progession"] = true
L["Scans the full quest for tooltip info occurence"] = true
L["Select chattype"] = true
L["Select the sound to be played when a quest is completed"] = true
L["Set the type of listing"] = true
L["Set the type of symbol"] = true
L["Set tracker Colors"] = true
L["Sets the Alpha of the Quest Log"] = true
L["Sets the Alpha of the Quest Tracker"] = true
L["Sets the Background Color"] = true
L["Sets the Background Corner Color"] = true
L["Sets the color for completed headers"] = true
L["Sets the color for completed objectives"] = true
L["Sets the color for failed quests"] = true
L["Sets the color for headers"] = true
L["Sets the color for objectives"] = true
L["Sets the color for Party member"] = true
L["Sets the color for the Quest description"] = true
L["Sets the fixed width of the tracker if auto resize is disabled"] = true
L["Sets the Scale of the Quest Log"] = true
L["Sets the zone color"] = true
L["Show colored text"] = true
L["Show hint tooltip"] = true
L["Show icon"] = true
L["Show Objective Markers"] = true
L["Show quest info in item tooltips"] = true
L["Show quest info in mob tooltips"] = true
L["Show quest info on other tooltips"] = true
L["Show Quest Level"] = true
L["Show Quest Tags"] = true
L["Show Quest Zones"] = true
L["Show text"] = true
L["Show the plugins icon on the panel."] = true
L["Show the plugins text on the panel."] = true
L["Show the quests zone it belongs to above its name"] = true
L["Show tooltip"] = true
L["Show Tracker Header"] = true
L["Showing mouseover tooltips in tracker"] = true
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = true
L["Shows a message and plays a sound when you complete a quest"] = true
L["Shows the quests level"] = true
L["Shows the short verion of the tag"] = true
L["Shows the trackers header"] = true
L["Simple Quest Log"] = true
L["Sort the quests in tracker"] = true
L["Sort Tracker Quests"] = true
L["Symbol Type"] = true
L["The chattype to post progress massages."] = true
L["The default appearance of the quest log."] = true
L["Title color"] = true
L["Tooltip"] = true
L["Tooltip Options"] = true
L["Tracker Tooltip"] = true
L["Use Background"] = true
L["Use custom color for background"] = true
L["Use custom color for headers"] = true
L["Use custom color for objective text"] = true
L["Use custom color for Zone names"] = true
L["Use Fade-Step-Color"] = true
L["Use Listing"] = true
L["Use Quest Level Colors"] = true
L["Use the colors to indicate quest difficulty"] = true
L["User Listing rather than symbols"] = true
L["Uses the default Blizzard Quest Log"] = true
L["Watch Options"] = true
L["Zone Color"] = true
L["Zones"] = true


-- chat
-- chat
L["Quest failed: "] = true


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = true
L["|cffeda55fClick|r to open Quest Log."] = true
L["|cffeda55fRightclick|r to open Icon config."] = true
L["|cffeda55fShift+Click|r to open beql config."] = true
L["|cffff8000Tracked Quests|r"] = true
L["|cffffffffQuests|r"] = true
L["Hide plugin"] = true
L["Hide the plugin from the panel or minimap, leaving the addon running."] = true
L["Icon Config"] = true
L["Minimap position"] = true
L["Show Icon Tooltip"] = true
L["Shows the tooltip on mousover this plugin"] = true



-- EOF --

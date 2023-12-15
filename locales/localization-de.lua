--[[
************************************************************************

localization-de.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: Angelike, agentrocket, Farook, Brainsen 

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "deDE")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = " |cffff0000Ausgeschaltet von|r"
L["(Done)"] = "(Fertig)"
L["Abandon a quest"] = "Abbruch einer Quest"
L["Accept a new quest"] = "Annahme einer neuen Quest"
L["Active Tracker"] = "Aktiver Tracker"
L["Add New Quests"] = "Neue Quests hinzufügen"
L["Add Untracked"] = "Unbeobachtete hinzufügen"
L["Allow the plugin to color its text."] = "Ermöglicht es farbigen Text im Plugin anzuzeigen."
L["Always Open Maximized"] = "Immer maximiert öffnen"
L["Always Open Minimized"] = "Immer minimiert öffnen"
L["Attach the plugin to the minimap instead of the panel."] = "Befestigt das Plugin an der Minikarte."
L["Attach to minimap"] = "An der Minimap anbringen"
L["Auto Complete Quest"] = "Quests automatisch abgeben"
L["Auto Resize Tracker"] = "Automatische Größenanpassung"
L["Automatical add new Quests to tracker"] = "Automatisch neue Quests zum Tracker hinzufügen."
L["Automatical add quests with updated objectives to tracker"] = "Automatisch unbeobachtete Quests mit erfüllten Aufgaben hinzufügen."
L["Automatical hide completed objectives in tracker"] = "Versteckt automatisch erledigte Questziele im Quest Tracker."
L["Automatical remove completed quests from tracker"] = "Automatisches entfernen abgeschlossener Quests."
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "Passt die Größe des Quest Trackers automatisch an den Text an."
L["Automatically Complete Quests"] = "Gibt Quests automatisch beim Questgeber ab."
L["Background"] = "Hintergrund"
L["Background Color"] = "Hintergrundfarbe"
L["Background Corner Color"] = "Hintergrund Eckfarbe"
L["Bayi's Extended Quest Log"] = "Bayi's Extended Quest Log"
L["Center"] = "Mitte"
L["Change Locale (needs Interface Reload)"] = "Sprache wechseln (erfordert Interface Neustart)."
L["Changes the font size of the tracker"] = "Verändert die Schriftgröße des Quest Trackers."
L["Click to open Quest Log"] = "Klicken, um das Questlog zu Öffnen."
L["Close"] = "Schließen"
L["Close the menu."] = "Schließt das Menü."
L["Color Objectives"] = "Einfärben der Questziele"
L["Colors"] = "Farben"
L["Complete"] = "Vollständig"
L["Complete a quest"] = "Fertigstellen einer Quest"
L["Completed Header Color"] = "Farbe für abgeschlossene Quests"
L["Completed Objective Color"] = "Abgeschlossene Questzielfarbe"
L["Completed!"] = "Fertig!"
L["Completion Sound"] = "Abgeschlossen Sound"
L["Custom Background Color"] = "Eigene Hintergrundfarbe"
L["Custom Header Color"] = "Eigene Kopfzeilenfarbe"
L["Custom Objective Color"] = "Eigene Questzielfarbe"
L["Custom Zone Color"] = "Eigene Zonenfarbe"
L["Customize the Objective/Quest Markers"] = "Anpassen der Quest-/Questzielmarkierungen."
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
L["Default chat for actual group"] = "In den Chat der aktuellen Gruppe"
L["Detach the tooltip from the panel."] = "Löst den Tooltip von der Fubar."
L["Detach tooltip"] = "Tooltip lösen"
L["Disable the Tracker"] = "Deaktiviert den Quest Tracker"
L["Disable Tracker"] = "Tracker deaktivieren"
L["Display Markers before objectives"] = "Anzeigen von Markierungen vor den Questzielen."
L["Displays the actual quest's description in the tracker tooltip"] = "Zeigt die aktuelle Questbeschreibung im Tracker Tooltip."
L["Don't play a sound"] = "Spielt keinen Sound bei Questfertigstellung."
L["Enable Addon"] = "Addon aktivieren"
L["Enable Debug"] = "Debug einschalten"
L["Enable Language support"] = "Aktiviere Sprachunterstützung"
L["Enable Left Click"] = "Aktiviere Linksklick"
L["Enable Quest Progression to Party Chat"] = "Aktiviere Questfortschritt in Gruppenchat"
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "Aktiviere Rechtsklick"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "Aktiviert dieses Addon"
L["Enables the language support for non-natural Languages."] = "Aktiviert die Sprachunterstützung für Sprachen, die nicht offiziell von WoW unterstützt werden."
L["Extended Quest Log"] = "Erweitertes Questlog"
L["Fade Colors"] = "Sanfter Farbwechsel"
L["Fade the objective colors"] = "Farben der Questziele mit sanftem Übergang wechseln."
--[[Translation missing --]]
--[[ L["Fade-Step-Color"] = ""--]] 
L["Failed Header Color"] = "Farbe für fehlgeschlagene Quests"
L["Finalize a quest."] = "Beenden einer Quest"
L["Fixed Tracker Width"] = "Feste Breite"
L["Font Size"] = "Schriftgröße"
L["Force the quest log to open maximized"] = "Öffnet das Questlog stets maximiert."
L["Force the quest log to open minimized"] = "Öffnet das Questlog stets minimiert."
L["Force Tracker Unlock"] = "Forciert Tracker Entriegelung"
L["GameTooltip"] = "GameTooltip"
L["General Quest Log Options"] = "Hauptoptionen Questlog"
L["Group chat"] = "Gruppenchat"
L["Header Color"] = "Kopfzeilenfarbe"
L["Hidden"] = "Verseckt"
L["Hide Completed Objectives"] = "Erledigte Questziele verstecken"
L["Hide Objectives for Completed only"] = "Verstecke Ziele nur für fertige"
L["Hide objectives only for completed quests"] = "Verstecke Ziele nur für fertige Quests."
L["Incomplete"] = "Unvollständig"
L["Info on Quest Completion"] = "Info bei Quest Fertigstellung"
L["Item Tooltip Quest Info"] = "Item Tooltip Quest Info"
L["Left"] = "Links"
L["Left clicking a quest in the tracker opens the Quest Log"] = "Linksklicken einer Quest öffnet das Questlog."
L["List Type"] = "Auflistungsformate"
L["Lock Quest Log"] = "Questlog fixieren"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "Sperret den Tooltip auf dem Bildschirm. Um den Tooltip zu bewegen muss die ALT Taste gedrückt sein."
L["Lock tooltip"] = "Tooltip sperren"
L["Lock Tracker"] = "Tracker fixieren"
L["Main Options"] = "Hauptoptionen"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "Macht den Quest Tracker auch mit geladenem CTMod verschiebbar. Bitte überprüfe vorher deine CTMod Konfiguration."
L["Makes the quest log unmovable"] = "Das Questlog wird unbeweglich gemacht."
L["Makes the quest tracker unmovable"] = "Fixiert den Quest Tracker und macht ihn unbeweglich."
L["Markers"] = "Markierungen"
L["Minimap"] = "Minimap"
L["Mob Tooltip Quest Info"] = "Mob Tooltip Quest Info"
L["Mouse Events"] = "Mausereignisse"
L["No Objectives!"] = "Keine Questziele"
L["No sound"] = "Keinen Sound"
L["Non Objective"] = "Nicht das Ziel"
L["NPC color"] = "Nichtspieler-Farben"
L["Number of Lines"] = "Anzahl an Zeilen"
L["Number of lines that can be used by the Linemanger"] = "Anzahl Zeilen, die vom Zeilenmanager benutzt werden können"
L["Objective Color"] = "Questzielfarbe"
L["Options related to the Quest Log"] = "Optionen, die das Questlog betreffen."
L["Options related to the Quest Tracker"] = "Optionen, die den Quest Tracker betreffen."
L["Other"] = "Andere"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "Gruppenmitglied"
L["Party member on Quest:"] = "Gruppenmitglieder mit dieser Quest: "
L["Party Member with Quixote Color"] = "Gruppenmitglied mit Quixote Farbe"
L["Party Quest Progression info"] = "Gruppenanzeige Quest Fortschritt"
L["Pick Locale"] = "Sprache wählen"
L["Position"] = "Position"
L["Position the plugin on the panel."] = "Position des Fubarplugins auf der Leiste"
L["Print a chat massage when an objective of a quest is updated."] = "Zeige eine Chatnachricht wenn ein Questziel aktualisiert wird."
L["Print a chat massage when you abandon a quest."] = "Zeige eine Chatnachricht wenn man eine Quest abbricht."
L["Print a chat massage when you accept a new quest."] = "Zeige eine Chatnachricht wenn man eine neue Quest annimmt."
L["Print a chat massage when you complete all quest objectives."] = "Zeige eine Chatnachricht wenn man alle Questziele erfüllt hat."
L["Print a chat massage when you deliver a completed quest to the NPC."] = "Zeige eine Chatnachricht wenn man eine fertige Quest beim NSC abgibt."
L["Print a chat message when you accept a new quest."] = "Erzeugt eine Chat-Nachricht, wenn eine neue Quest akzeptiert wurde."
L["Prints the Quest Progression Status to the Party Chat"] = "Zeigt die Quest Fortschritte im Gruppen Chat."
L["Profiles"] = "Profile"
L["Progess of a quest"] = "Questfortschritt"
L["Quest %d finished."] = "Quest %d beendet"
L["Quest %s done."] = "Quest %s abgeschlossen"
L["Quest abandoned: "] = "Quest abgebrochen"
L["Quest accepted: "] = "Quest angenommen"
L["Quest Accepted: "] = "Quest angenommen:"
L["Quest Description Color"] = "Questbeschreibung"
L["Quest Description in Tracker Tooltip"] = "Quest Beschreibung im Tracker Tooltip"
L["Quest finalized: "] = "Quest fertig gestellt"
L["Quest Log Alpha"] = "Questlog Transparenz"
L["Quest Log Options"] = "Questlog Optionen"
L["Quest Log Scale"] = "Questlog Skalierung"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
L["Quest objective updated: "] = "Questziele aktualisiert"
L["Quest Progression to Party Chat"] = "Quest Fortschritte im Gruppen Chat"
L["Quest Tracker"] = "Quest Tracker"
L["Quest Tracker Alpha"] = "Quest Tracker Transparenz"
L["Quest Tracker Options"] = "Quest Tracker Optionen"
L["Questlog Layout"] = "Aussehen des Questlogs"
L["Reload UI ?"] = "UI neu laden?"
L["Remove Completed Quests"] = "Abgeschlossene Quests entfernen"
L["Requires Interface Reload"] = "Erfordert Interface Neustart"
L["Reset questlog position"] = "Setze die Position des Questlogs zurück"
L["Reset tracker position"] = "Tracker Position zurücksetzen"
L["Right"] = "Rechts"
L["Right clicking a quest in the tracker removes it from the tracker"] = "Rechtsklicken einer Quest entfernt es vom Tracker."
L["say quest progession"] = "Sage Questfortschritt"
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
L["Select chattype"] = "Chattyp wählen"
L["Select the sound to be played when a quest is completed"] = "Sound auswählen, der gespielt wird, wenn die Quest abgeschlossen ist."
L["Set the type of listing"] = "Wähle das Format der Auflistung."
L["Set the type of symbol"] = "Wähle die Art des Symbols."
L["Set tracker Colors"] = "Die Tracker Farben einstellen."
L["Sets the Alpha of the Quest Log"] = "Setzt die Transparenz des Questlogs."
L["Sets the Alpha of the Quest Tracker"] = "Transparenz des Quest Trackers festlegen."
L["Sets the Background Color"] = "Hintergrundfarbe festlegen."
L["Sets the Background Corner Color"] = "Hintergrund Eckfarbe festlegen."
L["Sets the color for completed headers"] = "Farbe für die Kopfzeile bei abgeschlossenen Quests festlegen."
L["Sets the color for completed objectives"] = "Farbe für abgeschlossene Questziele festlegen."
L["Sets the color for failed quests"] = "Farbe für die Kopfzeile bei fehlgeschlagenen Quests festlegen."
L["Sets the color for headers"] = "Farbe für Kopfzeilen festlegen."
L["Sets the color for objectives"] = "Farbe für Questziele festlegen."
L["Sets the color for Party member"] = "Farbe für ein Gruppenmitglied festlegen."
L["Sets the color for the Quest description"] = "Farbe für die Questbeschreibung festlegen."
L["Sets the fixed width of the tracker if auto resize is disabled"] = "Feste Breite für den Quest Tracker festlegen, wenn die Automatische Größenanpassung deaktiviert ist."
L["Sets the Scale of the Quest Log"] = "Skalierung des Questlogs festlegen."
L["Sets the zone color"] = "Zonenfarbe festlegen."
L["Show colored text"] = "Zeige gefärbten Text"
L["Show hint tooltip"] = "Zeige Tooltip mit Hinweis"
L["Show icon"] = "Zeige Icon"
L["Show Objective Markers"] = "Zeige Questzielmarkierungen"
L["Show quest info in item tooltips"] = "Zeige Questinfos in den Item Tooltips."
L["Show quest info in mob tooltips"] = "Zeige Questinfos in den Mob Tooltips."
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "Questlevel anzeigen"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "Quest Zonen anzeigen"
L["Show text"] = "Zeige Text"
L["Show the plugins icon on the panel."] = "Zeigt das Fubar Icon in der Leise an."
L["Show the plugins text on the panel."] = "Zeigt den Text in der Fubar-Leise an."
L["Show the quests zone it belongs to above its name"] = "Zeigt die zugehörigen Zonen über dem Questnamen an."
L["Show tooltip"] = "Zeige Tooltip"
L["Show Tracker Header"] = "Quest Tracker Kopfzeile Anzeigen"
L["Showing mouseover tooltips in tracker"] = "Zeige mouseover Tooltips im Tracker."
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "Zeige bei mouseover Tooltips, klicken öffnet den Tracker, rechtsklicken entfernt die Quest vom Tracker."
L["Shows a message and plays a sound when you complete a quest"] = "Zeigt eine Nachricht und spielt einen Sound, wenn die Quest abgeschlossen wurde."
L["Shows the quests level"] = "Aktiviert/Deaktiviert die Questlevelanzeige."
L["Shows the short verion of the tag"] = "Kurzversion des Tags anzeigen"
L["Shows the trackers header"] = "Die Quest Tracker Kopfzeile ein/ausblenden."
L["Simple Quest Log"] = "Einfaches Questlog"
L["Sort the quests in tracker"] = "Sortiert den Quest Tracker."
L["Sort Tracker Quests"] = "Quest Tracker sortieren"
L["Symbol Type"] = "Symbolformat"
L["The chattype to post progress massages."] = "Chattyp für das Senden der Fortschrittsmeldungen"
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "Titelfarbe"
L["Tooltip"] = "Tooltip"
L["Tooltip Options"] = "Tooltip Optionen."
L["Tracker Tooltip"] = "Tracker Tooltip"
L["Use Background"] = "Hintergund anzeigen."
L["Use custom color for background"] = "Benutze eine eigene Hintergrundfarbe."
L["Use custom color for headers"] = "Eigene Farbe für die Kopfzeile benutzen."
L["Use custom color for objective text"] = "Farbe für Questziele verwenden."
L["Use custom color for Zone names"] = "Eigene Zonenfarbe benutzen."
L["Use Fade-Step-Color"] = "Zwischenfarbe benutzen"
L["Use Listing"] = "Benutze Auflistung"
L["Use Quest Level Colors"] = "Questlevelfarben benutzen"
L["Use the colors to indicate quest difficulty"] = "Benutzt Questlevelfarben, um die Schwierigkeit der Quest zu verdeutlichen."
L["User Listing rather than symbols"] = "Benutze Auflistung statt Symbolen."
L["Uses the default Blizzard Quest Log"] = "Benutzen des Standard Blizzard Questlogs"
L["Watch Options"] = "Beobachtungs-Optionen"
L["Zone Color"] = "Zonenfarbe"
L["Zones"] = "Zonen"


-- chat
-- chat
L["Quest failed: "] = "Quest fehlgeschlagen: "


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000Abgeschlossene Quests|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55fKlicken|r um das Questlog zu öffnen und |cffeda55fShift+Klick|r um die Konfiguration zu öffnen"
L["|cffeda55fRightclick|r to open Icon config."] = ". |cffeda55fRechtsklicken|r öffnet FuBar Konfiguration."
L["|cffeda55fShift+Click|r to open beql config."] = "|cffeda55fShift+Klick|r um das Optionsmenü zu öffnen"
L["|cffff8000Tracked Quests|r"] = "|cffff8000Beobachtete Quests|r"
L["|cffffffffQuests|r"] = "|cffffffffQuests|r"
L["Hide plugin"] = "Verstecke Plugin"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "Verseckt das Plugin, aber lässt das Addon weiterlaufen."
L["Icon Config"] = "FuBar Konfiguration"
L["Minimap position"] = "Minimap Position"
L["Show Icon Tooltip"] = "FuBar-Tooltip anzeigen"
L["Shows the tooltip on mousover this plugin"] = "Zeigt den Tooltip wenn man mit der Maus über das FuBar-Plugin fährt."


-- EOF --

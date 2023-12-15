--[[
************************************************************************

localization-fr.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: Scylia, ColorLight, lastdans

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "frFR")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = " |cffff0000Désactivé par|r"
L["(Done)"] = "(Fait)"
--[[Translation missing --]]
--[[ L["Abandon a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Accept a new quest"] = ""--]] 
L["Active Tracker"] = "Suivi actif"
L["Add New Quests"] = "Ajout des nouvelles quêtes"
L["Add Untracked"] = "Ajout non-suivi"
L["Allow the plugin to color its text."] = "Autorisé à coloriser son texte"
L["Always Open Maximized"] = "Toujours ouvrir maximisé"
L["Always Open Minimized"] = "Toujours ouvrir minimisé"
L["Attach the plugin to the minimap instead of the panel."] = "Attacher l'addon à la mini-carte au lieu du panneau"
L["Attach to minimap"] = "Attacher à la mini-carte"
L["Auto Complete Quest"] = "Validation automatique des quêtes"
L["Auto Resize Tracker"] = "Taille automatique du suivi"
L["Automatical add new Quests to tracker"] = "Ajouter automatiquement les nouvelles quêtes"
L["Automatical add quests with updated objectives to tracker"] = "Ajouter automatiquement les quêtes non suivies quand un objectif est modifié"
L["Automatical hide completed objectives in tracker"] = "Cacher automatiquement les objectifs terminés dans le suivi"
L["Automatical remove completed quests from tracker"] = "Enlever automatiquement les quêtes terminées du suivi"
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "Redimensionner automatiquement le suivi en fonction du texte"
L["Automatically Complete Quests"] = "Valide automatiquement les quêtes"
L["Background"] = "Fond"
L["Background Color"] = "Couleur de fond"
L["Background Corner Color"] = "Couleur de fond des coins"
L["Bayi's Extended Quest Log"] = "Bayi's Extended Quest Log"
L["Center"] = "Centre"
L["Change Locale (needs Interface Reload)"] = "Change la langue (requiert un rechargement de l'interface)"
L["Changes the font size of the tracker"] = "Change la taille de la police du suivi"
L["Click to open Quest Log"] = "Cliquer pour ouvrir le Journal de Quêtes"
L["Close"] = "Fermer"
L["Close the menu."] = "Ferme le menu"
L["Color Objectives"] = "Couleur des objectifs"
L["Colors"] = "Couleurs"
L["Complete"] = "Finis"
--[[Translation missing --]]
--[[ L["Complete a quest"] = ""--]] 
L["Completed Header Color"] = "Couleur quête terminée"
L["Completed Objective Color"] = "Couleur objectifs terminés"
L["Completed!"] = "Fini!"
L["Completion Sound"] = "Son à la fin d'un objectif"
L["Custom Background Color"] = "Couleur de fond personnalisée"
L["Custom Header Color"] = "Couleur personnalisée des titres"
L["Custom Objective Color"] = "Couleur personnalisée des objectifs"
L["Custom Zone Color"] = "Couleur de régions personnalisée"
L["Customize the Objective/Quest Markers"] = "Changer les symboles des objectifs/quêtes"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Default chat for actual group"] = ""--]] 
L["Detach the tooltip from the panel."] = "Détache l'information du panneau"
L["Detach tooltip"] = "Détache l'information"
L["Disable the Tracker"] = "Désactive le suivi des quêtes"
L["Disable Tracker"] = "Désactive le suivi"
L["Display Markers before objectives"] = "Affiche un symbole devant les objectifs"
L["Displays the actual quest's description in the tracker tooltip"] = "Afficher la description de la quête dans la bulle du suivi"
L["Don't play a sound"] = "Ne pas jouer de son"
L["Enable Addon"] = "Activer l'addon"
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Language support"] = ""--]] 
L["Enable Left Click"] = "Activer le clic Gauche"
--[[Translation missing --]]
--[[ L["Enable Quest Progression to Party Chat"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "Activer le clic droit"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "Activer cet addon"
--[[Translation missing --]]
--[[ L["Enables the language support for non-natural Languages."] = ""--]] 
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "Fondu des couleurs"
L["Fade the objective colors"] = "Crée un fondu sur les couleurs des objectifs"
L["Fade-Step-Color"] = "Couleur du fondu"
L["Failed Header Color"] = "Couleur de quête raté"
--[[Translation missing --]]
--[[ L["Finalize a quest."] = ""--]] 
L["Fixed Tracker Width"] = "Largeur fixe du suivi"
L["Font Size"] = "Taille de la police"
L["Force the quest log to open maximized"] = "Forcer le Journal de Quêtes à s'ouvrir maximisé"
L["Force the quest log to open minimized"] = "Forcer le Journal de Quêtes à s'ouvrir minimisé"
L["Force Tracker Unlock"] = "Forcer le déblocage du suivi"
--[[Translation missing --]]
--[[ L["GameTooltip"] = ""--]] 
L["General Quest Log Options"] = "Options Général des logs de quêtes"
--[[Translation missing --]]
--[[ L["Group chat"] = ""--]] 
L["Header Color"] = "Couleur de titre"
L["Hidden"] = "Caché"
L["Hide Completed Objectives"] = "Cacher les objectifs terminés"
L["Hide Objectives for Completed only"] = "Cacher les objectifs complets uniquement"
L["Hide objectives only for completed quests"] = "Cacher les objectifs uniquement pour les quêtes terminées"
L["Incomplete"] = "Incomplet"
L["Info on Quest Completion"] = "Infos sur les objectifs de quête"
L["Item Tooltip Quest Info"] = "Tooltips d'info sur les objets"
L["Left"] = "Gauche"
L["Left clicking a quest in the tracker opens the Quest Log"] = "Clic gauche sur une quête ouvre le journal de quête"
L["List Type"] = "Types de listes"
L["Lock Quest Log"] = "Verrouiller le Journal de Quêtes"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "Fixer la position des tooltips. Dans ce cas, vous devez utiliser Alt pour y accéder"
L["Lock tooltip"] = "Fixer le tooltip"
L["Lock Tracker"] = "Verrouiller le suivi"
L["Main Options"] = "Options Principales"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "Rendre déplacable le suivi même avec CTMod. Vérifiez votre config. CTMOD avant de l'utiliser"
L["Makes the quest log unmovable"] = "Rendre le Journal de Quêtes non déplacable"
L["Makes the quest tracker unmovable"] = "Rendre le suivi des quêtes non déplacable"
L["Markers"] = "Symboles"
L["Minimap"] = "Mini-carte"
L["Mob Tooltip Quest Info"] = "Tooltips d'info sur les mobs"
--[[Translation missing --]]
--[[ L["Mouse Events"] = ""--]] 
L["No Objectives!"] = "Pas d'objectif"
L["No sound"] = "Pas de son"
--[[Translation missing --]]
--[[ L["Non Objective"] = ""--]] 
L["NPC color"] = "Couleur des NPC"
L["Number of Lines"] = "Nombre de lignes"
L["Number of lines that can be used by the Linemanger"] = "Nombre de lignes utilisables par le gestionnaire de lignes"
L["Objective Color"] = "Couleur des objectifs"
L["Options related to the Quest Log"] = "Options du journal de quêtes"
L["Options related to the Quest Tracker"] = "Options du suivi des quêtes"
L["Other"] = "Autres"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "Couleur des membres du groupe"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "Couleur des membre du groupe avec Quixote"
L["Party Quest Progression info"] = "Information sur la progression des quêtes de groupe"
L["Pick Locale"] = "Choix de la langue"
L["Position"] = "Position"
L["Position the plugin on the panel."] = "Position du plugin sur le panneau"
--[[Translation missing --]]
--[[ L["Print a chat massage when an objective of a quest is updated."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you abandon a quest."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you accept a new quest."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you complete all quest objectives."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you deliver a completed quest to the NPC."] = ""--]] 
L["Print a chat message when you accept a new quest."] = "Afficher un message dans le chat quand une nouvelle quête est acceptée"
L["Prints the Quest Progression Status to the Party Chat"] = "Afficher le status de progression des quêtes sur le chat Groupe"
L["Profiles"] = "Profils"
L["Progess of a quest"] = "Progression de la quête"
L["Quest %d finished."] = "%d de la quête terminé"
L["Quest %s done."] = "%s de la quête achevé"
L["Quest abandoned: "] = "Quête abondonnée"
--[[Translation missing --]]
--[[ L["Quest accepted: "] = ""--]] 
L["Quest Accepted: "] = "Quête acceptée"
L["Quest Description Color"] = "Couleur de la description des Quêtes"
L["Quest Description in Tracker Tooltip"] = "Description des quêtes dans le tooltip du suivi"
--[[Translation missing --]]
--[[ L["Quest finalized: "] = ""--]] 
L["Quest Log Alpha"] = "Transparence du Journal de Quêtes"
L["Quest Log Options"] = "Options du Journal de Quêtes"
L["Quest Log Scale"] = "Proportion du Journal de Quêtes"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
L["Quest objective updated: "] = "Objectif de quête mis à jour"
L["Quest Progression to Party Chat"] = "Progression des Quêtes sur le chat Groupe"
L["Quest Tracker"] = "Suivi des quêtes"
L["Quest Tracker Alpha"] = "Transparence du suivi"
L["Quest Tracker Options"] = "Options du suivi des quêtes"
--[[Translation missing --]]
--[[ L["Questlog Layout"] = ""--]] 
L["Reload UI ?"] = "Recharger l'interface ?"
L["Remove Completed Quests"] = "Enlever les quêtes terminées"
L["Requires Interface Reload"] = "Nécessite un rechargement de l'interface"
--[[Translation missing --]]
--[[ L["Reset questlog position"] = ""--]] 
L["Reset tracker position"] = "Réinitialiser la position du suivi"
L["Right"] = "Droite"
L["Right clicking a quest in the tracker removes it from the tracker"] = "Clic Droit sur une quête dans le suivi le supprime du suivi"
--[[Translation missing --]]
--[[ L["say quest progession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
--[[Translation missing --]]
--[[ L["Select chattype"] = ""--]] 
L["Select the sound to be played when a quest is completed"] = "Sélectionnez le son à jouer quand une quête est terminée"
L["Set the type of listing"] = "Change le type de la liste"
L["Set the type of symbol"] = "Change le type de symbole"
L["Set tracker Colors"] = "Change les couleurs du suivi"
L["Sets the Alpha of the Quest Log"] = "Change la transparence du Journal de Quêtes"
L["Sets the Alpha of the Quest Tracker"] = "Change la transparence pour le suivi des quêtes"
L["Sets the Background Color"] = "Change la couleur de fond"
L["Sets the Background Corner Color"] = "Change la couleur de la bordure"
L["Sets the color for completed headers"] = "Change la couleur des titres des quêtes terminées"
L["Sets the color for completed objectives"] = "Change la couleur des objectifs terminés"
L["Sets the color for failed quests"] = "Change la couleur des titres des quêtes ratées"
L["Sets the color for headers"] = "Change la couleur des titres"
L["Sets the color for objectives"] = "Change la couleur des objectifs"
L["Sets the color for Party member"] = "Change la couleur des membres du groupe"
L["Sets the color for the Quest description"] = "Change la couleur de la description des quêtes"
L["Sets the fixed width of the tracker if auto resize is disabled"] = "Change la largeur du suivi dans le cas où la taille automatique a été désactivée"
L["Sets the Scale of the Quest Log"] = "Change la proportion du journal des quêtes"
L["Sets the zone color"] = "Change la couleur des régions"
L["Show colored text"] = "Afficher du texte coloré"
--[[Translation missing --]]
--[[ L["Show hint tooltip"] = ""--]] 
L["Show icon"] = "Montrer l'icône"
L["Show Objective Markers"] = "Montrer les symboles des objectifs"
L["Show quest info in item tooltips"] = "Montre les infos des quêtes sur le tooltip des objets"
L["Show quest info in mob tooltips"] = "Montre les infos des quêtes sur le tooltip des monstres"
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "Voir le niveau des quêtes"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "Montrer les régions"
L["Show text"] = "Afficher le texte"
L["Show the plugins icon on the panel."] = "Montrer l'icone du plugin dans le panneau"
L["Show the plugins text on the panel."] = "Montrer le texte du plugins dans le panneau"
L["Show the quests zone it belongs to above its name"] = "Montrer les régions des quêtes"
--[[Translation missing --]]
--[[ L["Show tooltip"] = ""--]] 
L["Show Tracker Header"] = "Voir le titre du suivi"
L["Showing mouseover tooltips in tracker"] = "Montre les tooltips dans le suivi sur survol de la souris"
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "Montre le tooltip sur survol, cliquez pour ouvrir le suivi, clic droit supprime la quête du suivi"
L["Shows a message and plays a sound when you complete a quest"] = "Voir un message et jouer un son quand vous terminezune quête"
L["Shows the quests level"] = "Voir le niveau des quêtes"
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "Voir le titre du suivi"
L["Simple Quest Log"] = "Journal de Quêtes simple"
L["Sort the quests in tracker"] = "Classer les quêtes dans le suivi"
L["Sort Tracker Quests"] = "Classer les quêtes"
L["Symbol Type"] = "Types de symboles"
--[[Translation missing --]]
--[[ L["The chattype to post progress massages."] = ""--]] 
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "Couleur des titres"
L["Tooltip"] = "Tooltip"
L["Tooltip Options"] = "Option du Tooltip"
L["Tracker Tooltip"] = "Tooltip du suivi"
L["Use Background"] = "Ajouter un fond"
L["Use custom color for background"] = "Utiliser une couleur personnalisée pour le fond"
L["Use custom color for headers"] = "Changer la couleur des titres"
L["Use custom color for objective text"] = "Utiliser la couleur personnalisée pour les textes des objectifs"
L["Use custom color for Zone names"] = "Utiliser la couleur personnalisée pour les régions"
L["Use Fade-Step-Color"] = "Utiliser la couleur de fondu"
L["Use Listing"] = "Utiliser une liste"
L["Use Quest Level Colors"] = "Utiliser la couleur de niveau des quêtes"
L["Use the colors to indicate quest difficulty"] = "Utiliser la couleur de niveau de la quête pour montrer la difficulté"
L["User Listing rather than symbols"] = "Utilise une liste plutôt que des symboles"
L["Uses the default Blizzard Quest Log"] = "Utiliser le Journal de Quêtes"
L["Watch Options"] = "Afficher les options."
L["Zone Color"] = "Couleur des régions"
L["Zones"] = "Zones"


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000Quêtes terminées|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55fCliquer|r pour ouvrir le Journal de Quêtes et |cffeda55fMaj+Clic|r pour ouvrir la configuration"
L["|cffeda55fRightclick|r to open Icon config."] = " . |cffeda55fCliquedroit|r pour ouvrir la configuration de fubar.."
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000Quêtes suivies|r"
L["|cffffffffQuests|r"] = "|cffffffffQuêtes|r"
L["Hide plugin"] = "Cacher le plugin"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "Cacher le plugin du panneau ou de la mini carte, en laissant l'addon "
L["Icon Config"] = "Configuration FubarPlugin"
L["Minimap position"] = "Position sur la mini carte"
L["Show Icon Tooltip"] = "Montrer la bulle d'aide sur Fubar"
L["Shows the tooltip on mousover this plugin"] = "Afficher la bulle d'aide au passage de la souris."


-- EOF --

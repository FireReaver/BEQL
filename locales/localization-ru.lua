--[[
************************************************************************

localization-ru.lua

File date: 2020-09-29T23:06:51Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: Mans

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "ruRU")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = " |cffff0000Отключено|r"
L["(Done)"] = "(Сделано)"
--[[Translation missing --]]
--[[ L["Abandon a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Accept a new quest"] = ""--]] 
L["Active Tracker"] = "Активный список"
L["Add New Quests"] = "Добавлять новые задания"
L["Add Untracked"] = "Добавлять обновившиеся задания"
--[[Translation missing --]]
--[[ L["Allow the plugin to color its text."] = ""--]] 
L["Always Open Maximized"] = "Всегда открывать развернутым"
L["Always Open Minimized"] = "Всегда открывать свернутым"
--[[Translation missing --]]
--[[ L["Attach the plugin to the minimap instead of the panel."] = ""--]] 
--[[Translation missing --]]
--[[ L["Attach to minimap"] = ""--]] 
L["Auto Complete Quest"] = "Автозавершение задания"
L["Auto Resize Tracker"] = "Автоизменение размера списка"
L["Automatical add new Quests to tracker"] = "Выберите, чтобы новые задания автоматически добавлялись в список."
L["Automatical add quests with updated objectives to tracker"] = "Выберите, чтобы в список автоматически добавлялись задания, цели которых обновились."
L["Automatical hide completed objectives in tracker"] = "Выберите, чтобы автоматически скрывать выполненные цели задания в списке."
L["Automatical remove completed quests from tracker"] = "Выберите, чтобы автоматически убирать выполненные задания из списка."
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "Автоматически изменяет размер списка в зависимости от длины текста"
L["Automatically Complete Quests"] = "Выберите, чтобы автоматически (без диалога) получать награду у нанимателя за выполненые задания (если такое возможно)."
L["Background"] = "Использовать фон"
L["Background Color"] = "Цвет фона"
L["Background Corner Color"] = "Цвет границы"
L["Bayi's Extended Quest Log"] = "Bayi's Extended Quest Log"
--[[Translation missing --]]
--[[ L["Center"] = ""--]] 
L["Change Locale (needs Interface Reload)"] = "Изменить язык интерфейса адд-она (требует перезагрузку интерфейса игры)."
L["Changes the font size of the tracker"] = "Устанавливает размер шрифта списка заданий"
L["Click to open Quest Log"] = "Нажмите, чтобы открыть Журнал Заданий"
--[[Translation missing --]]
--[[ L["Close"] = ""--]] 
--[[Translation missing --]]
--[[ L["Close the menu."] = ""--]] 
--[[Translation missing --]]
--[[ L["Color Objectives"] = ""--]] 
L["Colors"] = "Настройки цвета"
--[[Translation missing --]]
--[[ L["Complete"] = ""--]] 
--[[Translation missing --]]
--[[ L["Complete a quest"] = ""--]] 
L["Completed Header Color"] = "Выполненное задание"
L["Completed Objective Color"] = "Выполненная цель"
L["Completed!"] = "Выполнено!"
L["Completion Sound"] = "Звук Выполнения"
L["Custom Background Color"] = "Изменить цвет фона"
L["Custom Header Color"] = "Изменить цвет задания"
L["Custom Objective Color"] = "Изменить цвет цели"
L["Custom Zone Color"] = "Изменить цвет зоны"
L["Customize the Objective/Quest Markers"] = "Настройки маркеров Целей и Заданий"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Default chat for actual group"] = ""--]] 
--[[Translation missing --]]
--[[ L["Detach the tooltip from the panel."] = ""--]] 
--[[Translation missing --]]
--[[ L["Detach tooltip"] = ""--]] 
L["Disable the Tracker"] = "Выберите, чтобы убрать список с экрана."
L["Disable Tracker"] = "Отключить список"
L["Display Markers before objectives"] = "Выберите, чтобы отображать маркеры перед целями."
L["Displays the actual quest's description in the tracker tooltip"] = "Выберите, чтобы в окне подсказки списка отображались описания заданий."
--[[Translation missing --]]
--[[ L["Don't play a sound"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Addon"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Language support"] = ""--]] 
L["Enable Left Click"] = "Доп. функция левого щелчка"
--[[Translation missing --]]
--[[ L["Enable Quest Progression to Party Chat"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "Доп. функция правого щелчка"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable this Addon"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enables the language support for non-natural Languages."] = ""--]] 
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "Использовать затемнение цвета"
L["Fade the objective colors"] = "Выберите, чтобы применить автоматическое затемнение цвета надписи цели."
--[[Translation missing --]]
--[[ L["Fade-Step-Color"] = ""--]] 
L["Failed Header Color"] = "Проваленное задание"
--[[Translation missing --]]
--[[ L["Finalize a quest."] = ""--]] 
L["Fixed Tracker Width"] = "Зафиксировать ширину списка"
L["Font Size"] = "Размер шрифта"
L["Force the quest log to open maximized"] = "Выберите, чтобы журнал заданий всегда открывался в развернутом виде."
L["Force the quest log to open minimized"] = "Выберите, чтобы журнал заданий всегда открывался в свернутом виде."
L["Force Tracker Unlock"] = "Принудительно сделать список перемещаемым"
--[[Translation missing --]]
--[[ L["GameTooltip"] = ""--]] 
--[[Translation missing --]]
--[[ L["General Quest Log Options"] = ""--]] 
--[[Translation missing --]]
--[[ L["Group chat"] = ""--]] 
L["Header Color"] = "Цвет Заголовка"
--[[Translation missing --]]
--[[ L["Hidden"] = ""--]] 
L["Hide Completed Objectives"] = "Скрывать выполненные цели"
L["Hide Objectives for Completed only"] = "Скрывать только для выполненных заданий"
L["Hide objectives only for completed quests"] = "Выберите, чтобы автоматически цели скрывались только для выполненных заданий."
--[[Translation missing --]]
--[[ L["Incomplete"] = ""--]] 
L["Info on Quest Completion"] = "Извещать о выполнении задания"
L["Item Tooltip Quest Info"] = "Инфо в окне подсказки предмета"
--[[Translation missing --]]
--[[ L["Left"] = ""--]] 
L["Left clicking a quest in the tracker opens the Quest Log"] = "Выберите, чтобы открывать журнал левым щелчком мыши по списку."
L["List Type"] = "Тип списка"
L["Lock Quest Log"] = "Прилепить журнал заданий"
--[[Translation missing --]]
--[[ L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = ""--]] 
--[[Translation missing --]]
--[[ L["Lock tooltip"] = ""--]] 
L["Lock Tracker"] = "Прилепить список"
--[[Translation missing --]]
--[[ L["Main Options"] = ""--]] 
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "Делает список заданий перемещаемым даже при загруженом CTMod. Проверьте наличие и настройки CTMod прежде чем использовать эту опцию."
L["Makes the quest log unmovable"] = "Выберите, чтобы сделать журнал заданий неперемещаемым."
L["Makes the quest tracker unmovable"] = "Выберите, чтобы сделать список неперемещаемым."
L["Markers"] = "Маркеры"
--[[Translation missing --]]
--[[ L["Minimap"] = ""--]] 
L["Mob Tooltip Quest Info"] = "Инфо в окне подсказки существа"
--[[Translation missing --]]
--[[ L["Mouse Events"] = ""--]] 
L["No Objectives!"] = "Нет Целей!"
--[[Translation missing --]]
--[[ L["No sound"] = ""--]] 
--[[Translation missing --]]
--[[ L["Non Objective"] = ""--]] 
--[[Translation missing --]]
--[[ L["NPC color"] = ""--]] 
--[[Translation missing --]]
--[[ L["Number of Lines"] = ""--]] 
--[[Translation missing --]]
--[[ L["Number of lines that can be used by the Linemanger"] = ""--]] 
L["Objective Color"] = "Невыполненная цель"
L["Options related to the Quest Log"] = "Настройки журнала заданий"
L["Options related to the Quest Tracker"] = "Настройки списка заданий"
--[[Translation missing --]]
--[[ L["Other"] = ""--]] 
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "Цвет членов группы"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "Цвет членов группы с Quixote"
L["Party Quest Progression info"] = "Инфо о прогрессе группы по заданию"
L["Pick Locale"] = "Язык интерфейса"
--[[Translation missing --]]
--[[ L["Position"] = ""--]] 
--[[Translation missing --]]
--[[ L["Position the plugin on the panel."] = ""--]] 
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
--[[Translation missing --]]
--[[ L["Print a chat message when you accept a new quest."] = ""--]] 
L["Prints the Quest Progression Status to the Party Chat"] = "Выводит процесс выполнения задания в групповой чат."
--[[Translation missing --]]
--[[ L["Profiles"] = ""--]] 
--[[Translation missing --]]
--[[ L["Progess of a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest %d finished."] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest %s done."] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest abandoned: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest accepted: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest Accepted: "] = ""--]] 
L["Quest Description Color"] = "Цвет описания задания"
L["Quest Description in Tracker Tooltip"] = "Описание задания в окне подсказки"
--[[Translation missing --]]
--[[ L["Quest finalized: "] = ""--]] 
L["Quest Log Alpha"] = "Прозрачность журнала заданий"
L["Quest Log Options"] = "Журнал заданий"
L["Quest Log Scale"] = "Масштаб журнала заданий"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest objective updated: "] = ""--]] 
L["Quest Progression to Party Chat"] = "Процесс выполнения в групповой чат"
L["Quest Tracker"] = "Список заданий"
L["Quest Tracker Alpha"] = "Прозрачность списка"
L["Quest Tracker Options"] = "Список заданий"
--[[Translation missing --]]
--[[ L["Questlog Layout"] = ""--]] 
L["Reload UI ?"] = "Перезагрузить интерфейс?"
L["Remove Completed Quests"] = "Убирать выполненные задания"
L["Requires Interface Reload"] = "Требует перезагрузку интерфейса игры."
--[[Translation missing --]]
--[[ L["Reset questlog position"] = ""--]] 
L["Reset tracker position"] = "Исходная позиция списка"
--[[Translation missing --]]
--[[ L["Right"] = ""--]] 
L["Right clicking a quest in the tracker removes it from the tracker"] = "Выберите, чтобы правым щелчком мыши удалять задание из списка."
--[[Translation missing --]]
--[[ L["say quest progession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
--[[Translation missing --]]
--[[ L["Select chattype"] = ""--]] 
L["Select the sound to be played when a quest is completed"] = "Выбор звука, который воспроизводится по выполнению задания."
L["Set the type of listing"] = "Устанавливает тип списка"
L["Set the type of symbol"] = "Устанавливает тип символов: -, +, @, >"
L["Set tracker Colors"] = "Настройки цветов списка заданий"
L["Sets the Alpha of the Quest Log"] = "Setzt die Transparenz des Questlogs."
L["Sets the Alpha of the Quest Tracker"] = "Устанавливает прозрачность списка заданий."
L["Sets the Background Color"] = "Установка цвета фона."
L["Sets the Background Corner Color"] = "Установка цвета границы."
L["Sets the color for completed headers"] = "Установка цвета текста названий выполненных заданий."
L["Sets the color for completed objectives"] = "Установка цвета текста надписи выполненной цели."
L["Sets the color for failed quests"] = "Установка цвета текста названий проваленных заданий."
L["Sets the color for headers"] = "Установка цвета текста заголовков."
L["Sets the color for objectives"] = "Установка цвета надписи цели."
L["Sets the color for Party member"] = "Устанавливает цвет для членов группы."
L["Sets the color for the Quest description"] = "Устанавливает цвет текста описания задания."
L["Sets the fixed width of the tracker if auto resize is disabled"] = "Устанавливает фиксированную ширину, если выключено автоизменение размера."
L["Sets the Scale of the Quest Log"] = "Устанавливает масштаб журнала заданий."
L["Sets the zone color"] = "Установка цвета зоны."
--[[Translation missing --]]
--[[ L["Show colored text"] = ""--]] 
--[[Translation missing --]]
--[[ L["Show hint tooltip"] = ""--]] 
--[[Translation missing --]]
--[[ L["Show icon"] = ""--]] 
L["Show Objective Markers"] = "Показывать маркеры целей"
L["Show quest info in item tooltips"] = "Выберите, чтобы информация о задании появилась в окне подсказки существа."
L["Show quest info in mob tooltips"] = "Выберите, чтобы информация о задании появилась в окне подсказки существа."
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "Показывать уровень задания"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "Показывать зоны"
--[[Translation missing --]]
--[[ L["Show text"] = ""--]] 
--[[Translation missing --]]
--[[ L["Show the plugins icon on the panel."] = ""--]] 
--[[Translation missing --]]
--[[ L["Show the plugins text on the panel."] = ""--]] 
L["Show the quests zone it belongs to above its name"] = "Выберите, чтобы над названиями заданий писались зоны, к которым задания принадлежат."
--[[Translation missing --]]
--[[ L["Show tooltip"] = ""--]] 
L["Show Tracker Header"] = "Показывать заголовок списка"
L["Showing mouseover tooltips in tracker"] = "Выберите, чтобы при наведении курсора на список заданий показывалось окно подсказки."
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "Выберите, чтобы сделать список активным: при наведении курсора на задание в списке показываются подсказки, нажатие ЛКМ на название открывает журнал, нажатие ПКМ убирает задание из списка."
L["Shows a message and plays a sound when you complete a quest"] = "Выберите, чтобы после выполнения задания проигрывался звуковой сигнал и появлялось текстовое сообщение."
L["Shows the quests level"] = "Выберите, чтобы в журнале показывались уровни заданий."
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "Выберите, чтобы показать заголовок списка заданий."
L["Simple Quest Log"] = "Стандартный вид"
L["Sort the quests in tracker"] = "Выберите, чтобы автоматически сортировать задания в списке."
L["Sort Tracker Quests"] = "Сортировать задания в списке"
L["Symbol Type"] = "Тип символов"
--[[Translation missing --]]
--[[ L["The chattype to post progress massages."] = ""--]] 
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
--[[Translation missing --]]
--[[ L["Title color"] = ""--]] 
L["Tooltip"] = "Окно подсказки"
L["Tooltip Options"] = "Настройки окна подсказки"
L["Tracker Tooltip"] = "Окно подсказки для списка заданий"
L["Use Background"] = "Выберите, чтобы использовать фон для списка заданий."
L["Use custom color for background"] = "Выберите, чтобы самостоятельно установить цвет фона."
L["Use custom color for headers"] = "Выберите, чтобы самостоятельно установить цвет текста для названий заданий в списке."
L["Use custom color for objective text"] = "Выберите, чтобы самостоятельно установить цвет надписи цели."
L["Use custom color for Zone names"] = "Выберите, чтобы самостоятельно установить цвет текста надписи зоны задания."
--[[Translation missing --]]
--[[ L["Use Fade-Step-Color"] = ""--]] 
L["Use Listing"] = "Использовать список"
L["Use Quest Level Colors"] = "Цветовая индикация сложности"
L["Use the colors to indicate quest difficulty"] = "Выберите, чтобы использовать изменение цвета текста названия в зависимости от сложности задания."
L["User Listing rather than symbols"] = "Выберите, чтобы использовать пользовательский список вместо символов."
L["Uses the default Blizzard Quest Log"] = "Выберите, чтобы использовать стандартный вид журнала заданий от Blizzard."
--[[Translation missing --]]
--[[ L["Watch Options"] = ""--]] 
L["Zone Color"] = "Цвет зоны"
--[[Translation missing --]]
--[[ L["Zones"] = ""--]] 


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000Выполненные задания|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55fНажмите|r для открытия журнала заданий, или |cffeda55fНажмите с Shift'ом|r для открытия графического интерфейса настроек Waterfall"
L["|cffeda55fRightclick|r to open Icon config."] = "|cffeda55fПКМ|r открыть настройки Иконок."
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000Отслеживаемые задания|r"
L["|cffffffffQuests|r"] = "|cffffffffВсего заданий|r"
--[[Translation missing --]]
--[[ L["Hide plugin"] = ""--]] 
--[[Translation missing --]]
--[[ L["Hide the plugin from the panel or minimap, leaving the addon running."] = ""--]] 
L["Icon Config"] = "Настройки FuBar"
--[[Translation missing --]]
--[[ L["Minimap position"] = ""--]] 
--[[Translation missing --]]
--[[ L["Show Icon Tooltip"] = ""--]] 
--[[Translation missing --]]
--[[ L["Shows the tooltip on mousover this plugin"] = ""--]] 


-- EOF --

--[[
************************************************************************

localization-cn.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: 

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "zhCN")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = "|cffff0000禁止于|r"
L["(Done)"] = "（已完成）"
L["Abandon a quest"] = "放弃任务"
L["Accept a new quest"] = "接受任务"
L["Active Tracker"] = "活跃列表"
L["Add New Quests"] = "添加新任务"
L["Add Untracked"] = "添加未追踪"
L["Allow the plugin to color its text."] = "允许插件显示彩色文字."
L["Always Open Maximized"] = "最大化"
L["Always Open Minimized"] = "最小化"
L["Attach the plugin to the minimap instead of the panel."] = "插件依附于小地图而不是与面板上."
L["Attach to minimap"] = "依附小地图"
L["Auto Complete Quest"] = "自动完成任务"
L["Auto Resize Tracker"] = "自动调整追踪列表大小"
L["Automatical add new Quests to tracker"] = "自动在追踪器中添加新任务"
L["Automatical add quests with updated objectives to tracker"] = "获取任务物品后自动将相关任务添加至追踪列表"
L["Automatical hide completed objectives in tracker"] = "自动隐藏追踪器中已完成的目标"
L["Automatical remove completed quests from tracker"] = "自动从追踪器中移除已完成的任务"
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "Automatical resizes the tracker depending on the lenght of the text in it"
L["Automatically Complete Quests"] = "自动完成任务"
L["Background"] = "背景"
L["Background Color"] = "背景"
L["Background Corner Color"] = "转角"
L["Bayi's Extended Quest Log"] = "增强任务日志"
L["Center"] = "中间"
L["Change Locale (needs Interface Reload)"] = "更改本地化方案（需要重载界面）"
L["Changes the font size of the tracker"] = "更改任务追踪器的字体大小"
L["Click to open Quest Log"] = "点击打开任务日志"
L["Close"] = "关闭"
L["Close the menu."] = "关闭菜单."
--[[Translation missing --]]
--[[ L["Color Objectives"] = ""--]] 
L["Colors"] = "颜色"
--[[Translation missing --]]
--[[ L["Complete"] = ""--]] 
L["Complete a quest"] = "完成任务"
L["Completed Header Color"] = "完成标题"
L["Completed Objective Color"] = "完成目标"
L["Completed!"] = "完成！"
L["Completion Sound"] = "完成音效"
L["Custom Background Color"] = "自定义背景颜色"
L["Custom Header Color"] = "自定义标题颜色"
L["Custom Objective Color"] = "自定义目标颜色"
L["Custom Zone Color"] = "自定义区域颜色"
L["Customize the Objective/Quest Markers"] = "自定义目标/任务标记"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
L["Default chat for actual group"] = "默认聊天频道为当前队伍"
L["Detach the tooltip from the panel."] = "从面板上分离出提示文字."
L["Detach tooltip"] = "分离提示文字"
L["Disable the Tracker"] = "关闭追踪列表"
L["Disable Tracker"] = "关闭追踪列表"
L["Display Markers before objectives"] = "在目标前显示标记"
L["Displays the actual quest's description in the tracker tooltip"] = "在追踪提示上显示完全的任务描述"
L["Don't play a sound"] = "不播放声音."
L["Enable Addon"] = "启用插件"
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
L["Enable Language support"] = "启用语言支持"
L["Enable Left Click"] = "允许左击"
--[[Translation missing --]]
--[[ L["Enable Quest Progression to Party Chat"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "允许右击"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "启用这个插件"
L["Enables the language support for non-natural Languages."] = "启用非基本语言支持"
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "淡出"
L["Fade the objective colors"] = "目标颜色淡出"
--[[Translation missing --]]
--[[ L["Fade-Step-Color"] = ""--]] 
L["Failed Header Color"] = "失败标题颜色"
L["Finalize a quest."] = "完成任务."
L["Fixed Tracker Width"] = "固定追踪列表宽度"
L["Font Size"] = "字体大小"
L["Force the quest log to open maximized"] = "强制最大化打开任务日志"
L["Force the quest log to open minimized"] = "强制最小化打开任务日志"
L["Force Tracker Unlock"] = "强制解锁"
L["GameTooltip"] = "鼠标提示信息"
L["General Quest Log Options"] = "任务日志基本设置"
L["Group chat"] = "组队聊天"
L["Header Color"] = "标题"
L["Hidden"] = "隐藏"
L["Hide Completed Objectives"] = "隐藏已完成目标"
L["Hide Objectives for Completed only"] = "隐藏完成任务目标"
L["Hide objectives only for completed quests"] = "仅隐藏已完成任务的目标"
L["Incomplete"] = "未完成"
L["Info on Quest Completion"] = "任务完成信息"
L["Item Tooltip Quest Info"] = "物品提示"
L["Left"] = "左边"
L["Left clicking a quest in the tracker opens the Quest Log"] = "左键点击追踪列表中的任务来打开任务日志"
L["List Type"] = "列表类型"
L["Lock Quest Log"] = "锁定"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "锁定提示文字位置，当提示文字锁定时，你需要Alt点击才能拖动."
L["Lock tooltip"] = "锁定提示文字"
L["Lock Tracker"] = "锁定"
L["Main Options"] = "全局设置"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "即使载入了CTMod依旧可以移动追踪列表，使用前请检查CTMod的设置"
L["Makes the quest log unmovable"] = "锁定任务日志"
L["Makes the quest tracker unmovable"] = "锁定任务追踪器"
L["Markers"] = "标记"
L["Minimap"] = "小地图"
L["Mob Tooltip Quest Info"] = "怪物提示"
L["Mouse Events"] = "鼠标事件"
L["No Objectives!"] = "无目标!"
L["No sound"] = "禁用声音"
--[[Translation missing --]]
--[[ L["Non Objective"] = ""--]] 
L["NPC color"] = "NPC颜色"
L["Number of Lines"] = "行数"
L["Number of lines that can be used by the Linemanger"] = "可被Linemanger使用的最大行数"
L["Objective Color"] = "目标"
L["Options related to the Quest Log"] = "任务日志选项设置"
L["Options related to the Quest Tracker"] = "任务追踪器选项设置"
L["Other"] = "其他"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "队友颜色"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "使用Quixote库的队友颜色"
L["Party Quest Progression info"] = "小队任务进度"
L["Pick Locale"] = "本地化选择"
L["Position"] = "位置"
L["Position the plugin on the panel."] = "决定插件在面板上的显示位置"
L["Print a chat massage when an objective of a quest is updated."] = "当任务进度更新时显示一条聊天信息"
L["Print a chat massage when you abandon a quest."] = "当你放弃一项任务时显示一条聊天信息"
--[[Translation missing --]]
--[[ L["Print a chat massage when you accept a new quest."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you complete all quest objectives."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you deliver a completed quest to the NPC."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat message when you accept a new quest."] = ""--]] 
L["Prints the Quest Progression Status to the Party Chat"] = "将任务进度报告到小队频道"
L["Profiles"] = "配置"
--[[Translation missing --]]
--[[ L["Progess of a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest %d finished."] = ""--]] 
L["Quest %s done."] = "任务完成 %s."
--[[Translation missing --]]
--[[ L["Quest abandoned: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest accepted: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest Accepted: "] = ""--]] 
L["Quest Description Color"] = "任务描述颜色"
L["Quest Description in Tracker Tooltip"] = "提示任务描述"
--[[Translation missing --]]
--[[ L["Quest finalized: "] = ""--]] 
L["Quest Log Alpha"] = "日志透明度"
L["Quest Log Options"] = "任务日志选项"
L["Quest Log Scale"] = "任务日志缩放"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest objective updated: "] = ""--]] 
L["Quest Progression to Party Chat"] = "报告任务进度"
L["Quest Tracker"] = "任务追踪"
L["Quest Tracker Alpha"] = "任务追踪透明度"
L["Quest Tracker Options"] = "任务追踪器选项"
--[[Translation missing --]]
--[[ L["Questlog Layout"] = ""--]] 
L["Reload UI ?"] = "是否重新载入UI？"
L["Remove Completed Quests"] = "移除已完成任务"
L["Requires Interface Reload"] = "需要重新载入界面"
L["Reset questlog position"] = "重置任务列表位置"
L["Reset tracker position"] = "重置追踪列表位置"
L["Right"] = "右边"
L["Right clicking a quest in the tracker removes it from the tracker"] = "右键点击追踪列表中的任务以将其从列表移除"
--[[Translation missing --]]
--[[ L["say quest progession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
--[[Translation missing --]]
--[[ L["Select chattype"] = ""--]] 
L["Select the sound to be played when a quest is completed"] = "选择任务完成时所播放的音效"
L["Set the type of listing"] = "设置列表的类型"
L["Set the type of symbol"] = "设置符号的类型"
L["Set tracker Colors"] = "设置追踪器颜色"
L["Sets the Alpha of the Quest Log"] = "设置任务日志的透明度"
L["Sets the Alpha of the Quest Tracker"] = "设置任务追踪列表的透明度"
L["Sets the Background Color"] = "设置背景颜色"
L["Sets the Background Corner Color"] = "设置背景转角颜色"
L["Sets the color for completed headers"] = "设置已完成标题颜色"
L["Sets the color for completed objectives"] = "设置已完成目标颜色"
L["Sets the color for failed quests"] = "为失败的任务设置颜色"
L["Sets the color for headers"] = "设置标题颜色"
L["Sets the color for objectives"] = "设置目标颜色"
L["Sets the color for Party member"] = "为队友设置颜色"
L["Sets the color for the Quest description"] = "设置任务描述的颜色"
L["Sets the fixed width of the tracker if auto resize is disabled"] = "Sets the fixed width of the tracker if auto resize is disabled"
L["Sets the Scale of the Quest Log"] = "设置任务日志的缩放比例"
L["Sets the zone color"] = "设置区域颜色"
L["Show colored text"] = "显示彩色文字"
L["Show hint tooltip"] = "显示提示信息"
L["Show icon"] = "显示图标"
L["Show Objective Markers"] = "显示目标标记"
L["Show quest info in item tooltips"] = "在物品提示中显示任务信息"
L["Show quest info in mob tooltips"] = "在怪物提示中显示任务信息"
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "任务等级"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "区域"
L["Show text"] = "显示文字"
L["Show the plugins icon on the panel."] = "在面板上显示插件图标."
L["Show the plugins text on the panel."] = "在面板上显示插件文字."
L["Show the quests zone it belongs to above its name"] = "显示任务所在地区"
L["Show tooltip"] = "显示鼠标提示"
L["Show Tracker Header"] = "标题"
L["Showing mouseover tooltips in tracker"] = "鼠标经过时在追踪列表上显示提示信息"
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "显示鼠标提示信息，左键点击打开追踪列表，右键点击把任务从列表中移除。"
L["Shows a message and plays a sound when you complete a quest"] = "当完成任务时显示信息并播放声音"
L["Shows the quests level"] = "显示任务的等级"
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "显示任务追踪器标题"
L["Simple Quest Log"] = "精简日志"
L["Sort the quests in tracker"] = "对追踪器中的任务进行排序"
L["Sort Tracker Quests"] = "任务排序"
L["Symbol Type"] = "符号类型"
L["The chattype to post progress massages."] = "要输出进度信息的聊天频道"
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "标题颜色"
L["Tooltip"] = "提示信息"
L["Tooltip Options"] = "提示选项"
L["Tracker Tooltip"] = "追踪提示"
L["Use Background"] = "使用背景"
L["Use custom color for background"] = "背景使用自定义颜色"
L["Use custom color for headers"] = "标题使用自定义颜色"
L["Use custom color for objective text"] = "目标文本使用自定义颜色"
L["Use custom color for Zone names"] = "区域名称使用自定义颜色"
--[[Translation missing --]]
--[[ L["Use Fade-Step-Color"] = ""--]] 
L["Use Listing"] = "使用列表"
L["Use Quest Level Colors"] = "等级"
L["Use the colors to indicate quest difficulty"] = "使用颜色表示任务难度"
L["User Listing rather than symbols"] = "以列表替代符号"
L["Uses the default Blizzard Quest Log"] = "使用Blizzard默认任务日志"
L["Watch Options"] = "监视设置"
L["Zone Color"] = "区域"
L["Zones"] = "地区"


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000完成的任务|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55f点击|r打开任务日志|cffeda55f按住Shift点击|r打开Waterfall样式设置界面"
L["|cffeda55fRightclick|r to open Icon config."] = ". |cffeda55f右击|r打开Fubar设置"
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000追踪任务|r"
L["|cffffffffQuests|r"] = "|cffffffff任务|r"
L["Hide plugin"] = "隐藏插件"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "隐藏插件显示，插件依然在运行."
L["Icon Config"] = "Fubar插件设置"
L["Minimap position"] = "小地图位置"
L["Show Icon Tooltip"] = "显示Fubar说明提示"
L["Shows the tooltip on mousover this plugin"] = "鼠标滑过Fubar插件时显示提示文字"


-- original Locale : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
-- locale updated on 2007/08/22：lostcup @ NGACN

-- EOF --

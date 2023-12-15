--[[
************************************************************************

localization-tw.lua

File date: 2020-09-29T23:06:51Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: a9012456

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "zhTW")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = "|cffff0000禁止於|r"
L["(Done)"] = "(完成)"
L["Abandon a quest"] = "放棄任務"
L["Accept a new quest"] = "接受新任務"
L["Active Tracker"] = "活躍列表"
L["Add New Quests"] = "添加新任務"
L["Add Untracked"] = "添加"
L["Allow the plugin to color its text."] = "允許插件彩化他的文字"
L["Always Open Maximized"] = "最大化"
L["Always Open Minimized"] = "最小化"
L["Attach the plugin to the minimap instead of the panel."] = "依附插件在小地圖上而不是面板上"
L["Attach to minimap"] = "依附在小地圖"
L["Auto Complete Quest"] = "自動完成任務"
L["Auto Resize Tracker"] = "自動修正追蹤列表尺寸"
L["Automatical add new Quests to tracker"] = "自動在追蹤中添加新任務"
L["Automatical add quests with updated objectives to tracker"] = "獲取任務物品後自動將相關任務添加至追蹤列表"
L["Automatical hide completed objectives in tracker"] = "自動隱藏追蹤中已完成的目標"
L["Automatical remove completed quests from tracker"] = "自動從追蹤中移除已完成的任務"
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "依此處參數長度自動修正追蹤列表"
L["Automatically Complete Quests"] = "自動完成任務"
L["Background"] = "背景"
L["Background Color"] = "背景"
L["Background Corner Color"] = "角落"
L["Bayi's Extended Quest Log"] = "增強任務紀錄"
L["Center"] = "置中"
L["Change Locale (needs Interface Reload)"] = "更改語言 (需要重載介面)"
L["Changes the font size of the tracker"] = "更改任務追蹤的字體大小"
L["Click to open Quest Log"] = "點擊打開任務紀錄"
L["Close"] = "關閉"
L["Close the menu."] = "關閉選單"
L["Color Objectives"] = "彩化目標"
L["Colors"] = "顏色"
L["Complete"] = "完成"
L["Complete a quest"] = "完成任務"
L["Completed Header Color"] = "完成標題"
L["Completed Objective Color"] = "完成目標"
L["Completed!"] = "已完成!"
L["Completion Sound"] = "完成音效"
L["Custom Background Color"] = "自訂背景顏色"
L["Custom Header Color"] = "自訂標題顏色"
L["Custom Objective Color"] = "自訂目標顏色"
L["Custom Zone Color"] = "自訂區域顏色"
L["Customize the Objective/Quest Markers"] = "自訂目標/任務標記"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
L["Default chat for actual group"] = "預設實際群組頻道"
L["Detach the tooltip from the panel."] = "從面板上分離提示"
L["Detach tooltip"] = "分離提示"
L["Disable the Tracker"] = "關閉追蹤列表"
L["Disable Tracker"] = "關閉追蹤列表"
L["Display Markers before objectives"] = "在目標前顯示標記"
L["Displays the actual quest's description in the tracker tooltip"] = "在追蹤提示上顯示完全的任務描述"
L["Don't play a sound"] = "不發出音效"
L["Enable Addon"] = "啟用插件"
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
L["Enable Language support"] = "啟用語言支援"
L["Enable Left Click"] = "允許左擊"
L["Enable Quest Progression to Party Chat"] = "啟用任務進度到隊伍頻道"
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "允許右擊"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "啟用這插件"
L["Enables the language support for non-natural Languages."] = "啟用非自然語言語言支援"
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "淡出顏色"
L["Fade the objective colors"] = "目標顏色淡出"
L["Fade-Step-Color"] = "淡化顏色"
L["Failed Header Color"] = "失敗標題顏色"
L["Finalize a quest."] = "終止任務"
L["Fixed Tracker Width"] = "固定追蹤列表寬度"
L["Font Size"] = "字體大小"
L["Force the quest log to open maximized"] = "強制最大化打開任務紀錄"
L["Force the quest log to open minimized"] = "強制最小化打開任務紀錄"
L["Force Tracker Unlock"] = "強制解鎖"
L["GameTooltip"] = "遊戲提示"
L["General Quest Log Options"] = "一般任務紀錄設定"
L["Group chat"] = "群組頻道"
L["Header Color"] = "標題顏色"
L["Hidden"] = "隱藏"
L["Hide Completed Objectives"] = "隱藏已完成目標"
L["Hide Objectives for Completed only"] = "隱藏完成任務目標"
L["Hide objectives only for completed quests"] = "僅隱藏已完成任務的目標"
L["Incomplete"] = "未完成"
L["Info on Quest Completion"] = "任務完成資訊"
L["Item Tooltip Quest Info"] = "物品提示"
L["Left"] = "置左"
L["Left clicking a quest in the tracker opens the Quest Log"] = "左鍵點擊追蹤列表中的任務來打開任務紀錄"
L["List Type"] = "列表類型"
L["Lock Quest Log"] = "鎖定任務紀錄"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "鎖定提示位置。當提示鎖定，你可以使用Alt+滑鼠訪問"
L["Lock tooltip"] = "鎖定提示"
L["Lock Tracker"] = "鎖定追蹤"
L["Main Options"] = "主要設定"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "即使載入了 CTMod 依舊可以移動追蹤列表，使用前請檢查 CTMod 的設定"
L["Makes the quest log unmovable"] = "鎖定任務紀錄"
L["Makes the quest tracker unmovable"] = "鎖定任務追蹤"
L["Markers"] = "標記"
L["Minimap"] = "小地圖"
L["Mob Tooltip Quest Info"] = "怪物提示"
L["Mouse Events"] = "滑鼠事件"
L["No Objectives!"] = "無目標!"
L["No sound"] = "沒有音效"
L["Non Objective"] = "無目標"
L["NPC color"] = "NPC顏色"
L["Number of Lines"] = "數據線"
L["Number of lines that can be used by the Linemanger"] = "設定由行列管理員之管理行數"
L["Objective Color"] = "目標顏色"
L["Options related to the Quest Log"] = "任務紀錄設定"
L["Options related to the Quest Tracker"] = "任務追蹤選項設定"
L["Other"] = "其它"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "隊友顏色"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "使用 Quixote 庫的隊友顏色"
L["Party Quest Progression info"] = "小隊任務進度"
L["Pick Locale"] = "語言選擇"
L["Position"] = "位置"
L["Position the plugin on the panel."] = "在面板上放置插件"
L["Print a chat massage when an objective of a quest is updated."] = "當目標任務更新發佈頻道訊息"
L["Print a chat massage when you abandon a quest."] = "當你放棄任務發佈頻道訊息"
L["Print a chat massage when you accept a new quest."] = "當你接受新任務發佈頻道訊息"
L["Print a chat massage when you complete all quest objectives."] = "當你完成所有任務目標發佈頻道訊息"
L["Print a chat massage when you deliver a completed quest to the NPC."] = "當你向NPC交付任務發佈頻道訊息"
L["Print a chat message when you accept a new quest."] = "接受新的任務時由聊天頻道輸出"
L["Prints the Quest Progression Status to the Party Chat"] = "發佈任務進度狀況到隊伍頻道"
L["Profiles"] = "設定檔"
L["Progess of a quest"] = "任務進度"
L["Quest %d finished."] = "任務%d已經完成。"
L["Quest %s done."] = "任務%s完成。"
L["Quest abandoned: "] = "已放棄任務:"
L["Quest accepted: "] = "已接受任務:"
L["Quest Accepted: "] = "已接受任務:"
L["Quest Description Color"] = "任務描述顏色"
L["Quest Description in Tracker Tooltip"] = "提示任務描述"
L["Quest finalized: "] = "已終止任務:"
L["Quest Log Alpha"] = "紀錄透明度"
L["Quest Log Options"] = "任務紀錄設定"
L["Quest Log Scale"] = "任務紀錄縮放"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
L["Quest objective updated: "] = "任務目標已更新:"
L["Quest Progression to Party Chat"] = "任務進度到隊伍頻道"
L["Quest Tracker"] = "任務追蹤"
L["Quest Tracker Alpha"] = "任務追蹤透明度"
L["Quest Tracker Options"] = "任務追蹤選項"
L["Questlog Layout"] = "任務紀錄樣式"
L["Reload UI ?"] = "重新載入UI?"
L["Remove Completed Quests"] = "移除已完成任務"
L["Requires Interface Reload"] = "需要重新載入界面"
L["Reset questlog position"] = "重置任務紀錄位置"
L["Reset tracker position"] = "重置追蹤列表位置"
L["Right"] = "置右"
L["Right clicking a quest in the tracker removes it from the tracker"] = "右鍵點擊追蹤列表中的任務以將其從列表移除"
L["say quest progession"] = "說任務進度"
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
L["Select chattype"] = "選擇頻道類型"
L["Select the sound to be played when a quest is completed"] = "選擇任務完成時所播放的音效"
L["Set the type of listing"] = "設定列表的類型"
L["Set the type of symbol"] = "設定符號的類型"
L["Set tracker Colors"] = "設定追蹤顏色"
L["Sets the Alpha of the Quest Log"] = "設定任務紀錄的透明度"
L["Sets the Alpha of the Quest Tracker"] = "設定任務追蹤列表的透明度"
L["Sets the Background Color"] = "設定背景顏色"
L["Sets the Background Corner Color"] = "設定背景角落顏色"
L["Sets the color for completed headers"] = "設定已完成標題顏色"
L["Sets the color for completed objectives"] = "設定已完成目標顏色"
L["Sets the color for failed quests"] = "為失敗的任務設定顏色"
L["Sets the color for headers"] = "設定標題顏色"
L["Sets the color for objectives"] = "設定目標顏色"
L["Sets the color for Party member"] = "為隊友設定顏色"
L["Sets the color for the Quest description"] = "設定任務描述的顏色"
L["Sets the fixed width of the tracker if auto resize is disabled"] = "設定追蹤列表固定寬度在自動修正關閉的情況下"
L["Sets the Scale of the Quest Log"] = "設定任務紀錄的縮放比例"
L["Sets the zone color"] = "設定區域顏色"
L["Show colored text"] = "顯示彩化文字"
L["Show hint tooltip"] = "顯示暗示提示"
L["Show icon"] = "顯示圖示"
L["Show Objective Markers"] = "顯示目標標記"
L["Show quest info in item tooltips"] = "在物品提示中顯示任務訊息"
L["Show quest info in mob tooltips"] = "在怪物提示中顯示任務訊息"
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "顯示任務等級"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "顯示任務區域"
L["Show text"] = "顯示文字"
L["Show the plugins icon on the panel."] = "顯示插件圖示在面板上"
L["Show the plugins text on the panel."] = "顯示插件名稱在面板上"
L["Show the quests zone it belongs to above its name"] = "顯示任務所在地區"
L["Show tooltip"] = "顯示提示"
L["Show Tracker Header"] = "顯示追蹤標題"
L["Showing mouseover tooltips in tracker"] = "滑鼠經過時在追蹤列表上顯示提示訊息"
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "顯示滑鼠提示訊息，左鍵點擊打開追蹤列表，右鍵點擊把任務從列表中移除。"
L["Shows a message and plays a sound when you complete a quest"] = "當完成任務時顯示訊息並播放聲音"
L["Shows the quests level"] = "顯示任務的等級"
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "顯示任務追蹤標題"
L["Simple Quest Log"] = "精簡紀錄"
L["Sort the quests in tracker"] = "排序正在追蹤的任務"
L["Sort Tracker Quests"] = "排序追蹤的任務"
L["Symbol Type"] = "符號類型"
L["The chattype to post progress massages."] = "頻道類型來發佈進度訊息。"
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "標題顏色"
L["Tooltip"] = "提示訊息"
L["Tooltip Options"] = "提示選項"
L["Tracker Tooltip"] = "追蹤提示"
L["Use Background"] = "使用背景"
L["Use custom color for background"] = "使用自訂的背景顏色"
L["Use custom color for headers"] = "使用自訂的標題顏色"
L["Use custom color for objective text"] = "使用自訂的目標文字顏色"
L["Use custom color for Zone names"] = "使用自訂的區域顏色名稱"
L["Use Fade-Step-Color"] = "使用淡化顏色"
L["Use Listing"] = "使用列表"
L["Use Quest Level Colors"] = "使用任務等級顏色"
L["Use the colors to indicate quest difficulty"] = "使用顏色顯示任務難度"
L["User Listing rather than symbols"] = "以清單替代符號"
L["Uses the default Blizzard Quest Log"] = "使用 Blizzard 預設任務紀錄"
L["Watch Options"] = "察看設定"
L["Zone Color"] = "區域顏色"
L["Zones"] = "區域"


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000完成任務|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55f點擊|r打開任務紀錄|cffeda55f按住 Shift 點擊|r打開 Waterfall 樣式設定界面"
L["|cffeda55fRightclick|r to open Icon config."] = ". |cffeda55f右鍵點擊|r 開啟FuBar設定。"
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000追蹤任務|r"
L["|cffffffffQuests|r"] = "|cffffffff任務|r"
L["Hide plugin"] = "隱藏插件"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "面板或是小地圖上隱藏插件，離開插件運行"
L["Icon Config"] = "Fubar 插件設定"
L["Minimap position"] = "小地圖位置"
L["Show Icon Tooltip"] = "顯示FuBar提示"
L["Shows the tooltip on mousover this plugin"] = "滑鼠經過插件顯示提示"


-- EOF --

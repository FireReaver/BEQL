--[[
************************************************************************

localization-ko.lua

File date: 2020-09-29T23:06:51Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: bayi??

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "koKR")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = " |cffff0000사용 불가|r"
L["(Done)"] = "(완료)"
L["Abandon a quest"] = "퀘스트 포기"
L["Accept a new quest"] = "새 퀘스트 수락"
L["Active Tracker"] = "동적 퀘스트 알리미"
L["Add New Quests"] = "신규 퀘스트 추가"
L["Add Untracked"] = "퀘스트 변동 시 추가"
L["Allow the plugin to color its text."] = "플러그인의 문자에 색상을 사용합니다."
L["Always Open Maximized"] = "항상 최대화하여 열기"
L["Always Open Minimized"] = "항상 최소화하여 열기"
L["Attach the plugin to the minimap instead of the panel."] = "패널 대신에 미니맵에 플러그인을 표시합니다."
L["Attach to minimap"] = "미니맵 표시"
L["Auto Complete Quest"] = "자동 퀘스트 완료"
L["Auto Resize Tracker"] = "퀘스트 알리미 크기 자동 조정"
L["Automatical add new Quests to tracker"] = "퀘스트 수락시 자동으로 퀘스트 알리미에 퀘스트를 추가합니다"
L["Automatical add quests with updated objectives to tracker"] = "퀘스트 진행에 변동이 있을 경우 퀘스트를 퀘스트 알리미에 추가합니다"
L["Automatical hide completed objectives in tracker"] = "완료된 목표는 퀘스트 알리미에서 숨깁니다"
L["Automatical remove completed quests from tracker"] = "완료된 퀘스트는 퀘스트 알리미에서 삭제합니다"
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "문자열의 길이에 따라서 퀘스트 알리미의 크기를 자동 조정합니다"
L["Automatically Complete Quests"] = "자동으로 퀘스트를 완료합니다"
L["Background"] = "배경"
L["Background Color"] = "배경 색상"
L["Background Corner Color"] = "배경 외곽선 색상"
L["Bayi's Extended Quest Log"] = "Bayi의 Extended Quest Log"
L["Center"] = "중앙"
L["Change Locale (needs Interface Reload)"] = "지역화 파일 변경 (UI를 다시 불러와야 합니다)"
L["Changes the font size of the tracker"] = "퀘스트 알리미의 폰트 크기를 변경합니다"
L["Click to open Quest Log"] = "클릭시 퀘스트 목록을 엽니다"
L["Close"] = "닫기"
L["Close the menu."] = "메뉴를 닫습니다."
L["Color Objectives"] = "수행목표 색상"
L["Colors"] = "색상"
L["Complete"] = "완료"
L["Complete a quest"] = "퀘스트 완료"
L["Completed Header Color"] = "완료된 퀘스트 이름 색상"
L["Completed Objective Color"] = "완료된 퀘스트 목표"
L["Completed!"] = "완료!"
L["Completion Sound"] = "완료시 재생음"
L["Custom Background Color"] = "배경 색상 설정"
L["Custom Header Color"] = "퀘스트 이름 사용자 색상"
L["Custom Objective Color"] = "퀘스트 목표 색상 설정"
L["Custom Zone Color"] = "지역 색상 설정"
L["Customize the Objective/Quest Markers"] = "퀘스트와 목표의 목차에 대한 설정을 변경합니다"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
L["Default chat for actual group"] = "실제 그룹의 기본 대화"
L["Detach the tooltip from the panel."] = "판넬에서 툴팁을 분리합니다."
L["Detach tooltip"] = "툴팁 분리"
L["Disable the Tracker"] = "퀘스트 알리미를 사용하지 않습니다"
L["Disable Tracker"] = "퀘스트 알리미 사용안함"
L["Display Markers before objectives"] = "퀘스트 목표 앞에 목차를 표시합니다"
L["Displays the actual quest's description in the tracker tooltip"] = "퀘스트 알리미 툴팁에 실제 퀘스트 설명을 표시합니다"
L["Don't play a sound"] = "사운드를 재생하지 않습니다."
L["Enable Addon"] = "애드온 사용"
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
L["Enable Language support"] = "언어 지원 사용"
L["Enable Left Click"] = "좌클릭 사용"
L["Enable Quest Progression to Party Chat"] = "파티 대화로 퀘스트 진행사항 알림 사용"
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "우클릭 사용"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "이 애드온을 사용합니다."
L["Enables the language support for non-natural Languages."] = "비-자연 언어들에 대한 언어 지원을 사용합니다."
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "점층 색상"
L["Fade the objective colors"] = "퀘스트 완료 목표에 점층 색상 기능을 사용합니다"
L["Fade-Step-Color"] = "사라짐 단계 색상"
L["Failed Header Color"] = "실패한 퀘스트 색상"
L["Finalize a quest."] = "퀘스트를 마무리 하세요."
L["Fixed Tracker Width"] = "고정 너비 사용"
L["Font Size"] = "폰트 크기"
L["Force the quest log to open maximized"] = "퀘스트 목록창을 항상 최대화하여 엽니다"
L["Force the quest log to open minimized"] = "퀘스트 목록창을 항상 최소화하여 엽니다"
L["Force Tracker Unlock"] = "퀘스트 알리미 이동 활성화"
L["GameTooltip"] = "게임툴팁"
L["General Quest Log Options"] = "일반적인 퀘스트 창 옵션입니다."
L["Group chat"] = "그룹 대화"
L["Header Color"] = "퀘스트 이름 색상"
L["Hidden"] = "숨김"
L["Hide Completed Objectives"] = "완료된 목표 숨김"
L["Hide Objectives for Completed only"] = "완료된 목표만 숨김"
L["Hide objectives only for completed quests"] = "완료된 퀘스트의 목표만 숨깁니다"
L["Incomplete"] = "미완료"
L["Info on Quest Completion"] = "퀘스트 완료 알림"
L["Item Tooltip Quest Info"] = "아이템 툴팁 퀘스트 정보 표시"
L["Left"] = "좌측"
L["Left clicking a quest in the tracker opens the Quest Log"] = "퀘스트 알리미를 좌클릭 했을 때 퀘스트창을 엽니다"
L["List Type"] = "순서 목차 형식"
L["Lock Quest Log"] = "퀘스트 목록창 고정"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "툴팁의 위치를 고정합니다. 툴팁이 고정일때, 액세스하려면 Alt와 마우스를 함께 사용해야 합니다."
L["Lock tooltip"] = "툴팁 고정"
L["Lock Tracker"] = "퀘스트 알리미 고정"
L["Main Options"] = "메인 설정"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "CTMod가 사용중일 때에도 퀘스트 알리미를 움직일 수 있습니다. 사용 전에 CTMod 설정을 확인하세요"
L["Makes the quest log unmovable"] = "퀘스트 목록창의 위치를 고정합니다"
L["Makes the quest tracker unmovable"] = "퀘스트 알리미의 위치를 고정합니다"
L["Markers"] = "목차"
L["Minimap"] = "미니맵"
L["Mob Tooltip Quest Info"] = "몹 툴팁 퀘스트 정보 표시"
L["Mouse Events"] = "마우스 이벤트"
L["No Objectives!"] = "수행 목표 없음!"
L["No sound"] = "사운드 없음"
L["Non Objective"] = "수행목표 없음"
L["NPC color"] = "NPC 색상"
L["Number of Lines"] = "행 숫자"
L["Number of lines that can be used by the Linemanger"] = "라인 관리자가 사용할 수 있는 라인 수"
L["Objective Color"] = "퀘스트 목표 색상"
L["Options related to the Quest Log"] = "퀘스트 목록에 관련된 설정을 변경합니다"
L["Options related to the Quest Tracker"] = "퀘스트 알리미와 관련된 설정을 변경합니다"
L["Other"] = "기타"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "파티원 색상"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "Quixote 색상에 따른 파티원 색상"
L["Party Quest Progression info"] = "파티 퀘스트 진행 정보"
L["Pick Locale"] = "언어 선택"
L["Position"] = "위치"
L["Position the plugin on the panel."] = "판넬에 플러그인의 위치입니다."
L["Print a chat massage when an objective of a quest is updated."] = "퀘스트의 수행목표가 업데이트되면 채팅 메세지를 출력합니다."
L["Print a chat massage when you abandon a quest."] = "퀘스트 포기 시 대화창에 알림"
L["Print a chat massage when you accept a new quest."] = "새로운 퀘스트를 수락했을 시 대화창에 알림"
L["Print a chat massage when you complete all quest objectives."] = "퀘스트 목표를 달성 했을 시 대화창에 알림"
L["Print a chat massage when you deliver a completed quest to the NPC."] = "NPC에게 퀘스트 완료 시 대화창에 알림"
L["Print a chat message when you accept a new quest."] = "새로운 퀘스트를 수락하면 채팅 메시지를 출력합니다."
L["Prints the Quest Progression Status to the Party Chat"] = "파티 대화로 퀘스트 진행상황을 알려줍니다"
L["Profiles"] = "프로파일"
L["Progess of a quest"] = "퀘스트 진행 사항"
L["Quest %d finished."] = "%d 퀘스트를 마무리함."
L["Quest %s done."] = "%s 퀘스트가 완료됨."
L["Quest abandoned: "] = "포기한 퀘스트:"
L["Quest accepted: "] = "수락한 퀘스트:"
L["Quest Accepted: "] = "수락한 퀘스트:"
L["Quest Description Color"] = "퀘스트 상세 설명 색상"
L["Quest Description in Tracker Tooltip"] = "퀘스트 알리미 툴팁에 퀘스트 설명 표시"
L["Quest finalized: "] = "마무리한 퀘스트:"
L["Quest Log Alpha"] = "퀘스트 창 투명도"
L["Quest Log Options"] = "퀘스트 목록 설정"
L["Quest Log Scale"] = "퀘스트창 크기"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
L["Quest objective updated: "] = "수행목표가 업데이트된 퀘스트:"
L["Quest Progression to Party Chat"] = "퀘스트 진행상황 파티에 알림"
L["Quest Tracker"] = "퀘스트 알리미"
L["Quest Tracker Alpha"] = "퀘스트 알리미 투명도"
L["Quest Tracker Options"] = "퀘스트 알리미 설정"
L["Questlog Layout"] = "퀘스트로그 배치"
L["Reload UI ?"] = "UI를 다시 불러오시겠습니까 ?"
L["Remove Completed Quests"] = "완료된 퀘스트 삭제"
L["Requires Interface Reload"] = "UI 리로드 필요"
L["Reset questlog position"] = "퀘스트로그 위치 초기화"
L["Reset tracker position"] = "퀘스트 알리미 위치 초기화"
L["Right"] = "우측"
L["Right clicking a quest in the tracker removes it from the tracker"] = "퀘스트 알리미를 우클릭 했을 때 퀘스트 알리미에서 퀘스트를 삭제합니다"
L["say quest progession"] = "퀘스트 진행 알림"
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
L["Select chattype"] = "대화 유형 선택"
L["Select the sound to be played when a quest is completed"] = "퀘스트 완료시 재생할 소리를 선택합니다"
L["Set the type of listing"] = "사용할 순서 목차를 변경합니다"
L["Set the type of symbol"] = "사용할 문자 목차를 변경합니다"
L["Set tracker Colors"] = "퀘스트 알리미의 색상을 설정합니다"
L["Sets the Alpha of the Quest Log"] = "퀘스트 창의 투명도를 설정합니다"
L["Sets the Alpha of the Quest Tracker"] = "퀘스트 알리미의 투명도를 설정합니다"
L["Sets the Background Color"] = "배경 색상을 선택합니다"
L["Sets the Background Corner Color"] = "퀘스트 알리미의 배경 외곽선 색상을 선택합니다"
L["Sets the color for completed headers"] = "완료된 퀘스트 이름에 대한 색상을 선택합니다"
L["Sets the color for completed objectives"] = "완료된 퀘스트 목표에 대한 색상을 설정합니다"
L["Sets the color for failed quests"] = "실패한 퀘스트 이름에 대한 색상을 선택합니다"
L["Sets the color for headers"] = "퀘스트 이름에 대한 색상을 선택합니다"
L["Sets the color for objectives"] = "퀘스트 목표 색상을 선택합니다"
L["Sets the color for Party member"] = "파티원의 색상을 설정합니다"
L["Sets the color for the Quest description"] = "퀘스트의 상세 설명에 대한 색상을 설정합니다"
L["Sets the fixed width of the tracker if auto resize is disabled"] = "퀘스트 알리미의 너비를 자동 조정하지 않고 고정된 크기로 설정합니다"
L["Sets the Scale of the Quest Log"] = "퀘스트창의 크기를 설정합니다"
L["Sets the zone color"] = "지역명 색상을 설정합니다"
L["Show colored text"] = "색상 문자 표시"
L["Show hint tooltip"] = "힌트 툴팁 보기"
L["Show icon"] = "아이콘 표시"
L["Show Objective Markers"] = "퀘스트 목표 목차 표시"
L["Show quest info in item tooltips"] = "아이템 툴팁에 퀘스트 정보를 표시합니다"
L["Show quest info in mob tooltips"] = "몹의 툴팁에 퀘스트 정보를 표시합니다"
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "퀘스트 레벨 보기"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "퀘스트 지역 보기"
L["Show text"] = "문자 표시"
L["Show the plugins icon on the panel."] = "판넬에 플러그인 아이콘을 표시합니다."
L["Show the plugins text on the panel."] = "판넬에 플러그인 문자를 표시합니다."
L["Show the quests zone it belongs to above its name"] = "퀘스트 이름 상단에 퀘스트 지역을 표시합니다"
L["Show tooltip"] = "툴팁 보기"
L["Show Tracker Header"] = "퀘스트 알리미 제목 보기"
L["Showing mouseover tooltips in tracker"] = "퀘스트 알리미에 마우스를 올려 놓으면 툴팁을 표시합니다"
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "마우스 오버시 툴팁을 표시하며, 클릭시 퀘스트창을 엽니다. 우클릭시 퀘스트를 퀘스트 알리미에서 제거합니다"
L["Shows a message and plays a sound when you complete a quest"] = "퀘스트 완료시 소리를 재생하고 메세지를 표시합니다"
L["Shows the quests level"] = "퀘스트 레벨을 표시합니다"
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "퀘스트 알리미의 제목을 표시합니다"
L["Simple Quest Log"] = "간단한 퀘스트 창"
L["Sort the quests in tracker"] = "퀘스트 알리미에서 퀘스트 정렬을 사용합니다"
L["Sort Tracker Quests"] = "퀘스트 알리미 정렬"
L["Symbol Type"] = "문자 목차 형식"
L["The chattype to post progress massages."] = "진행률 메세지를 알리는 채팅 유형입니다."
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "제목 색상"
L["Tooltip"] = "툴팁"
L["Tooltip Options"] = "툴팁 설정"
L["Tracker Tooltip"] = "퀘스트 알리미 툴팁"
L["Use Background"] = "배경 색상을 사용합니다"
L["Use custom color for background"] = "퀘스트 알리미의 배경에 색상을 사용합니다"
L["Use custom color for headers"] = "퀘스트 이름에 사용자 지정 색상을 사용합니다"
L["Use custom color for objective text"] = "퀘스트 목표에 사용자 지정 색상을 사용합니다"
L["Use custom color for Zone names"] = "지역명에 사용자 지정 색상을 사용합니다"
L["Use Fade-Step-Color"] = "사라짐 단계 색상 사용"
L["Use Listing"] = "순서 목차 사용"
L["Use Quest Level Colors"] = "퀘스트 레벨별 색상 사용"
L["Use the colors to indicate quest difficulty"] = "퀘스트 난이도에 따른 색상값을 사용합니다"
L["User Listing rather than symbols"] = "문자형 목차 대신에 순서 목차를 사용합니다"
L["Uses the default Blizzard Quest Log"] = "Blizzard 기본 퀘스트 창을 사용합니다"
L["Watch Options"] = "설정 보기"
L["Zone Color"] = "지역 색상"
L["Zones"] = "지역"


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000완료된 퀘스트|r"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55f클릭|r시 퀘스트창을 열기 |cffeda55fShift 클릭|r시 Waterfall 설정창 열기"
L["|cffeda55fRightclick|r to open Icon config."] = ". |cffeda55fR우클릭|r은 Fubar 옵션창을 엽니다."
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000확인중인 퀘스트|r"
L["|cffffffffQuests|r"] = "|cffffffff퀘스트|r"
L["Hide plugin"] = "플러그인 숨김"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "애드온 실행에 상관없이 판넬이나 미니맵에 플러그인을 숨깁니다."
L["Icon Config"] = "Fubar 플러그인 설정"
L["Minimap position"] = "미니맵 위치"
L["Show Icon Tooltip"] = "Fubar 툴팁 보이기"
L["Shows the tooltip on mousover this plugin"] = "이 플러그인에 마우스를 올렸을때 툴팁을 보여줍니다."


-- EOF --

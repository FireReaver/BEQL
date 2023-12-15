--[[
************************************************************************

beql.lua

File date: 2020-09-29T23:06:49Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike, Bayi

************************************************************************
]]--

local isDisabled;


local addonName, addonTable = ...;


local beql = LibStub('AceAddon-3.0'):NewAddon(addonTable, addonName, 'AceConsole-3.0', 'AceEvent-3.0');
local L    = LibStub('AceLocale-3.0'):GetLocale(addonName);


beql.frames = {};
beql.revision = GetAddOnMetadata(addonName, 'Version')
beql.versionstring = GetAddOnMetadata(addonName, 'Version')

beql.Fire = beql.SendMessage;
beql.On = beql.RegisterMessage;
beql.Off = beql.UnregisterMessage;
beql.OffAll = beql.UnregisterAllMessage;

beql.OnEvent = beql.RegisterEvent;
beql.OffEvent = beql.UnregisterEvent;

-- Debug Function
-- #NODOC
function beql:debugprint(...)
	if (beql.db and beql.db.profile.debug) then
        local t = {...};
        
        for k, v in pairs(t) do
            t[k] = tostring(v);
        end

        if (not t[1]:match('bEQL-') ) then
            tinsert(t, 1, 'bEQL: '); 
        end

		DEFAULT_CHAT_FRAME:AddMessage(table.concat(t, ' '))
	end
end

-- Init beql addon
function beql:OnInitialize()
    beql:InitDB()

    beql:debugprint('Init beql Addon')

    beql:initFrames();

    -- use a function call instead of a copy of the function to prevent hook issues
    beql.db.RegisterCallback(beql, 'OnProfileChanged', 'RefreshConfig')
    beql.db.RegisterCallback(beql, 'OnProfileCopied', 'RefreshConfig')
    beql.db.RegisterCallback(beql, 'OnProfileReset', 'RefreshConfig')

    -- Register the parent category 'beql'
    local options = {
        type = "group",
        args = {
            -- ... other options ...
        },
    }
    LibStub("AceConfig-3.0"):RegisterOptionsTable("beql", options)
    beql.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("beql", "beql", nil, "general") -- Add the 'general' tab

    beql:SetEnabledState(beql.db.profile.AddonStatus)

    beql:debugprint('Init beql Addon - done')
end

-- enable beql addon
function beql:OnEnable()
	beql:debugprint('Enable - START')
	
    -- Check for other addons
	beql:Compatibility()

	-- Init Questlog

	beql.db.profile.revision = beql.revision


	beql:debugprint('Enable - end')
end

-- disable beql addon
function beql:OnDisable()
	beql:debugprint('Disable')
end

--
-- Addon methodes
--

function beql:IsDisabled()
    return not beql:IsEnabled();
end

-- toggel addon enabled status 
function beql:ToggleActive()
	if (beql.db.profile.AddonStatus) then
		beql:Enable()
	else
		beql:Disable()
	end
end

-- Internal for setting default values for the variables
-- #NODOC
function beql:InitDB()
	local defaults = {
        global = {
            timer = {}
        },
        profile = {
            AddonStatus = true,
            Language = 'SystemDefault',
            debug = false,


            -- QuestTracker
            tracker = {
                Colors = {
                    Bg = CreateColor(ColorMixin.GetRGB(TOOLTIP_DEFAULT_BACKGROUND_COLOR)),
                    BgBorder = CreateColor(ColorMixin.GetRGB(TOOLTIP_DEFAULT_BACKGROUND_COLOR)),
                    Zone = CreateColor(1, 1, 1, 1),
                    HeaderNormal = CreateColor(0.75, 0.61, 0),
                    HeaderComplete = CreateColor(0.05, 0.93, 0.15),
                    HeaderFailed = CreateColor(1, 0.09, 0),
                    ObjectiveNormal = CreateColor(1, 0.09, 0),
                    ObjectiveComplete = CreateColor(0.05, 0.93, 0.15),
                    ObjectiveStepColor = CreateColor(0.96, 1, 0)
                },
                tooltip = {
                    enabled = true,
                    -- flags
                    useQuestColors = true,
                    showDescription = true,
                    -- colors
                    descriptionColor = CreateColor(1.0, 0.8, 0),
                    titleColor = CreateColor(0.75, 0.61, 0)
                },

                -- Color event
                UseBgColors = true,
                CustomBgColor = false,
                CustomHeaderColor = true,
                HeaderQuestLevelColor = true,
                CustomZoneColor = false,
                CustomObjetiveColor = true,
                FadeColor = true,
                useFadeStepColor = false,
                Alpha = 1,

                locked = true,
                disabled = false,
                ShowHeader = true,
                FontHeight = 10,
                ShowZones = true,
                RemoveFinished = true,
                MinimizeFinished = true,
                HideCompletedOnly = false,
                ShowObjectiveMarkers = true,
                UseTrackerListing = false,
                TrackerList = 1,
                TrackerSymbol = 1,
                SortItems = true,
                AddNew = true,
                AddUntracked = true,
                AutoResize = true,
                FixedWidth = 250,
                LeftClick = true,
                RightClick = true,
                activetracker = true,
                activetrackerparty = false
            },

            -- QuestLog
            questlog = {
                chat = {
                    AnnounceQuest = false,
                    accept = false,
                    abandoned = false,
                    progress = true,
                    finished = true,
                    delivert = false
                },
                enabled = true,
                locked = true,
                showlevel = true,
                showTags = true,
                InfoOnQuestCompletion = true,
                autocomplete = false,
                style = 'extended',
                Alpha = 1,
                Scale = 1,
                InfoSound = 'Sound\\Interface\\PVPFlagCaptured.ogg',
                FontSize = 12
            },
            -- Tooltip
            tooltip = {
                Colors = {
                    titleNormal         = NORMAL_FONT_COLOR,
                    objectiveNormal     = HIGHLIGHT_FONT_COLOR,
                    objectiveIncomplete = CreateColor(1, 0.09, 0),
                    objectiveComplete   = CreateColor(0.05, 0.93, 0.15),
                    objectiveFadeStep   = CreateColor(0.96, 1, 0),
                },
                -- Gametooltip
                fadeObjectiveColors = true,
                fadeObjectiveWithStep = true,
                colorObjectives = true,
                scanDeep = false,
                scanItems = true,
                scanOthers = true,
                scanUnits = true,
                useQuestColors = true,
            },
            -- icon
            icon = {
                hide = false,
                tooltip = true,
                minimapPos = 238
            },

            disabled = {}
        },

        char = {
            FramePositions = {},
            QuestLogMinimized = false,
            QuestWatchMinimized = false,
            QuestWatchIDs = {}
        },
        global = {
            questtimes = {}
        }
	}

	beql.db = LibStub('AceDB-3.0'):New('beqlDBnew', defaults, true)
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Internal for Compatiblity with other addons
--
-- Returns:
-- nothing
------------------------------------------]]
function beql:Compatibility()
    if (IsAddOnLoaded('Mobmap')) then
        beql.db.profile.disabled.markers = true
        MainOptionsTable.args.questTracker.args.MarkerOptions.desc = MainOptionsTable.args.questTracker.args.MarkerOptions.desc..' '..L[' |cffff0000Disabled by|r']..' |cffe0c000Mobmap|r'
        MainOptionsTable.args.questTracker.args.MarkerOptions.args.ShowObjectiveMarkers.desc = MainOptionsTable.args.questTracker.args.MarkerOptions.args.ShowObjectiveMarkers.desc..' '..L[' |cffff0000Disabled by|r']..' |cffe0c000Mobmap|r'
        if (beql.db.profile.tracker.ShowObjectiveMarkers) then
            beql.db.profile.tracker.ShowObjectiveMarkers = false
        end
    else
        beql.db.profile.disabled.markers = false
    end

    if (QuestLogFrame_MidTextures) ~= nil then
        MainOptionsTable.args.qlogoption.args.SimpleQuestLog.desc = MainOptionsTable.args.qlogoption.args.SimpleQuestLog.desc..' '..L[' |cffff0000Disabled by|r']..' |cffe0c000FramesResized|r'
        beql.db.profile.disabled.style = true
        beql.db.profile.style = true
    else
        beql.db.profile.disabled.style = false
    end
end

--[[----------------------------------------
-- Arguments:
-- table - Color1
-- table - Color2
-- number - Have
-- number - Needed
--
-- Notes:
-- Fades Colors between Color1 and Color2 depending on how much percent has Have from Needed
--
-- Returns:
-- * table - Color Faded
------------------------------------------]]
function beql:FadeColors(tempColor, tempColor2, got, need)
	local color = CreateColor(0, 0, 0, 1);
	local multiplier = got / need;

	color.r = tempColor.r + ((tempColor2.r - tempColor.r) * multiplier);
	color.g = tempColor.g + ((tempColor2.g - tempColor.g) * multiplier);
	color.b = tempColor.b + ((tempColor2.b - tempColor.b) * multiplier);

	return color
end

--[[----------------------------------------
-- Arguments:
-- number - Decimal nr
-- number - Length of number
--
-- Notes:
-- Converts a Decimal Number to Hexadecimal
--
-- Returns:
-- string - Hexadecimal number
------------------------------------------]]
function beql:decToHex(Dec, Length)
	local B, K, Hex, I, D = 16, '0123456789ABCDEF', '', 0;

	while Dec>0 do
		I=I+1;
		Dec, D = math.floor(Dec/B), math.fmod(Dec, B)+1;
		Hex=string.sub(K, D, D)..Hex;
	end

	if( (Length ~= nil) and (string.len(Hex) < Length) ) then
		local temp, i = Length-string.len(Hex), 1;
		for i=1, temp, 1 do
			Hex = '0'..Hex;
		end
	end

	return Hex;
end

--[[----------------------------------------
-- Arguments:
-- string - text
-- number - Red Component
-- number - Green Component
-- number - Blue Component
--
-- Notes:
-- Returns a WoW-style colored text
--
-- Returns:
-- string - Text colored with WoW control characters
------------------------------------------]]
function beql:ColorText(t, r, g, b)
	if (t == nil) then
        t = ''; end
	if (r == nil) then
        r = 0.0;
    end
	if (g == nil) then
        g = 0.0;
    end
	if (b == nil) then
        b = 0.0;
    end
	return '|CFF'..beql:decToHex(r*255, 2)..beql:decToHex(g*255, 2)..beql:decToHex(b*255, 2)..t..'|r';
end

--[[---------------------------------------
-- Arguments:
-- string - text
--
-- Notes:
-- Prints all Points of a Region
--
-- Returns:
-- nothing

-- function to ge points of an region
-- #NODOC
-----------------------------------------]]
function beql:printpoints(tmp)
	local region
	if (type(tmp) == 'string') then
		region = getglobal(tmp)
	else
		region = tmp
	end
	local i

	print('Framepoints for ' .. tostring(region:GetName()))
	for i=1, region:GetNumPoints(), 1 do
		local point, relativeTo, relativePoint, xOfs, yOfs = region:GetPoint(i)
		beql:debugprint(point .. ' ' .. relativeTo:GetName() .. ' ' .. relativePoint .. ' ' ..  xOfs ..' '.. yOfs)
	end
end

function beql:round(input, places)
	if (not places) then
        places = 0
	end
	if (type(input) == 'number' and type(places) == 'number') then
        local pow = 1
        for i = 1, ceil(places) do
            pow = pow * 10
        end
        return floor(input * pow + 0.5) / pow
	end
end

function beql:RefreshConfig()
	beql:OnDisable()
	
	beql.frames.questLogAnchor.UpdateFrame = nil
	beql.frames.questWatchAnchor.UpdateFrame = nil
	
	if (beql:IsEnabled()) then
		beql:OnEnable()
	end
end

--[[---------------------------------------
-- Arguments:
-- UIObject - frame reference
--
-- Notes:
-- Collect frames
--
-- Returns:
-- nothing

-- #NODOC
-----------------------------------------]]
function beql:initFrames(parent)
    parent = parent or UIParent;

    beql:loadScripts(parent);

    for _, frame in pairs({parent:GetChildren()}) do
        if (frame.beqlName) then
            beql.frames[frame.beqlName] = frame;
            frame.beqlName = nil;
        end


        if (frame:IsForbidden() == false) then
            beql:initFrames(frame)
        end

    end
end

--[[---------------------------------------
-- Arguments:
-- UIObject - frame reference
--
-- Notes:
-- Abbend events from string placeholder
--
-- Returns:
-- nothing

-- #NODOC
-----------------------------------------]]
function beql:loadScripts(frame)
    local eventName, fnName, module, modulName;
    for k, v in pairs(frame) do
        if (type(k) == 'string' and k:match('^beqlOn')) then
            eventName = k:gsub('^beql', '');
            modulName = v:match('^([^\:]+):');
            fnName = v:gsub('^([^\:]+):', '');
            module = beql:GetModule(modulName, true) or beql;
            
            if (module[fnName] == nil) then
                beql:debugprint(k, module, '->', fnName, 'not found', v);
            end

            frame:SetScript(eventName, module[fnName]);

            frame[k] = nil;
        end
    end
end

--[[---------------------------------------
-- Arguments:
-- string - name ot the frame
-- UIObject - reference of the frame
--
-- Notes:
-- Adds Frames to our addon, which where created in frames.xml
--
-- Returns:
-- nothing 

-- #NODOC
-----------------------------------------]]
function beql:setFrame(name, frame)
    beql.frames[name] = frame;
end

-- string helper

string.lcFirst = function(string)
    if (type(string) == 'string') then
        return string:gsub('^.', strlower(string:match('^.')))
    end

    return string;
end

string.matchAll = function(s, pattern)
    if (type(s) ~= 'string' or type(pattern) ~= 'string' or strlen(pattern) == 0) then
        return;
    end

    local t = {};
    for m in string.gmatch(s, pattern) do
        tinsert(t, m);
    end

    return unpack(t);
end


function beql:saveLayout(region)
    if (not region or not region.GetNumPoints) then
        return;
    end 

    region._points = {};

    for i = 1, region:GetNumPoints() do
        tinsert(region._points, {region:GetPoint(i)});
    end

    region._width = region:GetWidth();
    region._height = region:GetHeight();
end

function beql:restoreLayout(region)
    if (not region or not region.GetNumPoints) then
        return;
    end 

    region:ClearAllPoints();

    for _, point in ipairs(region._points) do
        region:SetPoint(unpack(point));
    end

    region:SetWidth(region._width);
    region:SetHeight(region._height);
end

local mt = {}
mt.__index = function(t, name)
    if (mt[name]) then
        return beql[name];
    end
end;

-- allow limeted access from modules to main addon
mt.db = true;
mt.frames = true;
mt.Fire = true;
mt.Off = true;
mt.OffEvent = true;
mt.On = true;
mt.OnEvent = true;

local prototype = {
    -- debug output from modules
    debug = function(module, ...)
        beql:debugprint('bEQL-' .. module.moduleName ..': ', ...);
    end,
    -- check if module is disabled because addon is disabled
    IsDisabled = function(module)
        return not (beql:IsEnabled() and module:IsEnabled());
    end,
}

setmetatable(prototype, mt);

beql:SetDefaultModulePrototype(prototype);


-- EOF ---

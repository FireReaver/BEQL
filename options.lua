--[[
************************************************************************

options.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331

Author: Angelike

************************************************************************
--]]

local addonName = (...);

local beql            = LibStub('AceAddon-3.0'):GetAddon(addonName);
local module          = beql:NewModule('Options');
local AceConfig       = LibStub('AceConfig-3.0');
local AceConfigReg    = LibStub('AceConfigRegistry-3.0');
local AceConfigDialog = LibStub('AceConfigDialog-3.0');
local L               = LibStub('AceLocale-3.0'):GetLocale(addonName);
local callbackCache   = {};

module.optionsFrames = {}
module.optionsTable  = {}
module.sounds        = {
    ['AllianceVictory'] = 'Sound\\Spells\\PVPVictoryAlliance.ogg',
    ['Cow']             = 'Sound\\Creature\\Cow\\CowDeath.ogg',
    ['Exploration']     = 'Sound\\Interface\\GnomeExploration.ogg',
    ['FlagCaptured1']   = 'Sound\\Spells\\PVPFlagCaptured.ogg',
    ['FlagCaptured2']   = 'Sound\\Spells\\PVPFlagCapturedHorde.ogg',
    ['HordeVictory']    = 'Sound\\Spells\\PVPVictoryHorde.ogg',
    ['LevelUp1']        = 'Sound\\Interface\\LevelUp.ogg',
    ['LevelUp2']        = 'Sound\\Interface\\levelup2.ogg',
    ['Message']         = 'Sound\\Interface\\iTellMessage.ogg',
    ['RaidWarning']     = 'Sound\\Interface\\RaidWarning.ogg',
    ['ReadyCheck']      = 'Sound\\Interface\\ReadyCheck.ogg',
    ['WorkComplete']    = 'Sound\\Creature\\Peon\\PeonBuildingComplete1.ogg'
};

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- Initialize the modul
--
-- Returns:
-- nothing
------------------------------------------]]
function module:OnInitialize()
    beql:RegisterMessage('OPEN_OPTIONES_MENU', module.OPEN_OPTIONES_MENU);
    module:createMainOptionsTable();

    module:validateOptionsTable(module.optionsTable);

    beql:RegisterChatCommand('beql', function() beql:Fire('OPEN_OPTIONES_MENU', 'main') end)

    -- general registartion
    AceConfigReg:RegisterOptionsTable(addonName, module.optionsTable , addonName)

    -- Mainframe
    module.optionsFrames.main = AceConfigDialog:AddToBlizOptions(addonName, L['Main Options'], addonName, 'main')
    module.optionsFrames.questlog = AceConfigDialog:AddToBlizOptions(addonName, L['Quest Log Options'], addonName, 'questlog')
    module.optionsFrames.questtracker = AceConfigDialog:AddToBlizOptions(addonName, L['Quest Tracker Options'], addonName, 'questtracker')
    module.optionsFrames.tooltip = AceConfigDialog:AddToBlizOptions(addonName, L['Tooltip'], addonName, 'tooltip')
    module.optionsFrames.profiles = AceConfigDialog:AddToBlizOptions(addonName, L['Profiles'], addonName, 'profiles')
	
    -- Subframes
	--

    for _, t in pairs(module.optionsTable.args) do
        module:validateWidth(t);
    end

    --module.optionsFrames.test = AceConfigDialog:AddToBlizOptions(addonName, 'test', addonName, 'test')
end

--
-- Addon functions
--

--[[----------------------------------------
-- Arguments:
-- table - table to check
-- string - property to check
--
-- Notes:
-- chacks a callback string for a valid callalble in addon and module scopes
--
-- Returns:
-- nothing
------------------------------------------]]
function module:checkHandler(t, handler)
    if (type(t[handler]) ~= 'string') then
        return;
    end

    local fn = callbackCache[t[handler]] or module:resolveCallback(t[handler]);

    if (type(fn) == 'function') then
        t[handler] = fn;
    elseif (not t[handler]:match('Profiles?$')) then
        -- profiles are handled by AceConfig
        beql:debugprint('function', t[handler], 'not found')
    end
end

--[[----------------------------------------
-- Arguments:
-- string - path to the option based from db property
--
-- Notes:
-- Initialize the modul
--
-- Returns:
-- table  - the table that contains the option
-- string - key value ot the option
------------------------------------------]]
function module:getOptionRef(path) 
    if (type(path) ~= 'string') then
        return;
    end

    local option = module.db;
    local parts = {path:matchAll('[^.]+')};

    local key = parts[#parts];
    tremove(parts, #parts);

    for _, v in ipairs(parts) do
        option = option[v] or {};
    end

    if (option[key] ~= nil) then
        -- only return valid refs
        return option, key;
    end
end

--[[----------------------------------------
-- Arguments:
-- none
--
-- Notes:
-- gets the value based of the dbProp path in the info object
--
-- Returns:
-- mixed - the resolved value
------------------------------------------]]
function module:getValue()
    local info = self;
    local option, key =  module:getOptionRef(info.option.dbProp); 

    if (not option) then
        module:debug('not found', info.option.dbProp);

        return;
    end

    if (info.option.type == 'color') then
        return ColorMixin.GetRGBA(option[key]);
    end
    
    return option[key];
end

--[[----------------------------------------
-- Arguments:
-- table  - the optionstable
-- string - technical key for registaration
-- string - display name
--
-- Notes:
-- Register a sub-option in options menu
--
-- Returns:
-- nothing
------------------------------------------]]
function module:registerOptionsTable(t, key, name)
    module.optionsTable.args[key] = t;

    module:validateOptionsTable(module.optionsTable);

    module.optionsFrames[key] = AceConfigDialog:AddToBlizOptions(addonName, name, addonName, key);
end

--[[----------------------------------------
-- Arguments:
-- string - function name to resolve
--
-- Notes:
-- Resolves the callback based on the input string
--   resolving based on three
--    * <Module>:<methode>
--    * <Addon>:<methode>
--    * <GlobalScope>:<methode>
--
-- Returns:
-- function - the found callback
------------------------------------------]]
function module:resolveCallback(fnName)
    if (type(fnName) ~= 'string') then
        return fnName;
    end

    local names = {fnName:matchAll('[^:]+')};

    if (#names == 2 and beql:GetModule(names[1], true) and type(beql:GetModule(names[1])[names[2]]) == 'function') then
        callbackCache[fnName] = function(...)
            local m = beql:GetModule(names[1]);
            return m[names[2]](m, ...);
        end

        return callbackCache[fnName];
    end

    if (#names == 1 and type(beql[names[1]]) == 'function') then
        callbackCache[fnName] = function(...)
            return beql[names[1]](beql, ...);
        end

        return callbackCache[fnName];
    end

    if (type(_G[fnName]) == 'function') then
        callbackCache[fnName] = function(...)
            return securecall(fnName, ...);
        end

        return callbackCache[fnName];
    end
end

--[[----------------------------------------
-- Arguments:
-- UIPbject - the UIObject
--
-- Notes:
-- restores a position of a UIObject, based on char saved variabled
--
-- Returns:
-- nothing
------------------------------------------]]
function beql:RestoreFramePosition(frame)
    local name, info;
    for n, f in pairs(beql.frames) do
        if (frame == f) then
            name = n;
        end
    end

    if (not name) then
        return;
    end

    frame.UIScale = UIParent:GetScale();
    info = module.db.char.FramePositions[name];

    if (not info) then
        return;
    end

    frame:ClearAllPoints()
    frame:SetPoint('TOPLEFT', UIParent, info.point, info.x/UIParent:GetScale(), info.y/UIParent:GetScale())

    beql:debugprint('Restore postion of frame: ' .. name)
end

--[[----------------------------------------
-- Arguments:
-- UIPbject - the UIObject
--
-- Notes:
-- saves a position of a UIObject to char saved variabled
--
-- Returns:
-- nothing
------------------------------------------]]
function beql:SaveFramePosition(frame)
    local name, posx, posy, point;

    for n, f in pairs(beql.frames) do
        if (frame == f) then
            name = n;
        end
    end

    if (not name) then
        return;
    end

    local x, y = frame:GetCenter()
    local hhalf = (x > UIParent:GetWidth()/2) and 'RIGHT' or 'LEFT'
    local vhalf = (y > UIParent:GetHeight()/2) and 'TOP' or 'BOTTOM'
    point = vhalf .. hhalf

    posx = beql:round(hhalf == 'LEFT' and (frame:GetLeft() * UIParent:GetScale()) or ((frame:GetLeft() - UIParent:GetWidth()) * UIParent:GetScale()) , 2)
    posy = beql:round(vhalf == 'TOP' and ((frame:GetTop() - UIParent:GetHeight()) * UIParent:GetScale()) or (frame:GetTop() * UIParent:GetScale()) , 2)

    frame:ClearAllPoints()
    frame:SetPoint('TOPLEFT', UIParent, point, posx/UIParent:GetScale(), posy/UIParent:GetScale())

    module.db.char.FramePositions[name] = {
        x = posx,
        y = posy,
        point = point
    };
end

--[[----------------------------------------
-- Arguments:
-- mixed - values that should be saved
--
-- Notes:
-- sets the value based of the dbProp path in the info object
--
-- Returns:
-- mixed - the resolved value
------------------------------------------]]
function module:setValue(...)
    local info = self;
    local option, key =  module:getOptionRef(info.option.dbProp); 

    if (not option) then
        module:debug('not found', info.option.dbProp);

        return;
    end

    if(info.option.type == 'color') then
        ColorMixin.SetRGBA(option[key], ...)
    else
        option[key] = ...;
    end

    if (info.option.onSet) then
        local fn = module:resolveCallback(info.option.onSet);

        if (type(fn) == 'function') then
            return fn()
        end
        module:debug('OnSet not found:', info.option.onSet);
    end
end

--[[----------------------------------------
-- Arguments:
-- table - the optionstable to validate
--
-- Notes:
-- validate a ace-config options table and replaces string callbacks with functions
--
-- Returns:
-- nothing
------------------------------------------]]
function module:validateOptionsTable(t)
    if (type(t) ~= 'table') then
        return;
    end

    if (t.dbProp) then
        t.get = t.get or module.getValue;
        t.set = t.set or module.setValue;
    end

    for _, handler in ipairs({'disabled', 'get', 'hidden', 'set'}) do
        module:checkHandler(t, handler);
    end

    if (type(t.args) == 'table') then
        for _, o in pairs(t.args) do
            module:validateOptionsTable(o);
        end
    end
end

function module:validateWidth(t, baseWidth)
    baseWidth = (baseWidth ~= nil and baseWidth or InterfaceOptionsFramePanelContainer:GetWidth()) - 24;

    if (t.widthInPercent ~= nil) then
        local base = baseWidth / 170
        t.width = base * t.widthInPercent / 100;
    end

    
    for k, v in pairs(t.args or {}) do
        module:validateWidth(v, baseWidth);
    end
end


--
-- Events
--

-- open Optionsinterface for a category
function module:OPEN_OPTIONES_MENU(option)
    if (not option) or (not module.optionsFrames[option]) then
        assert(false, 'Option ' .. option .. ' not found in options table!')
    end

    InterfaceOptionsFrame_Show();
    InterfaceOptionsFrame_OpenToCategory(module.optionsFrames[option])
end

--
-- Options generation
--

function module:createMainOptionsTable()

    module.optionsTable = {
        name = addonName,
        type = 'group',
        args = {

            -- General Options, shown on the main window

            main = {
                desc = L['Main Options'],
                name = L['Main Options'],
                order = 1,
                type = 'group',
                args = {
                    DisableAddon = {
                        dbProp = 'profile.AddonStatus',
                        desc = L['Enable this Addon'],
                        name = L['Enable Addon'],
                        order = 1,
                        onSet = 'ToggleActive',
                        type = 'toggle',
                        width = 'full'
                    },
                    Spacer1 = {
                        order = 2,
                        type = 'header'
                    },
                    DisableLog = {
                        dbProp = 'profile.questlog.enabled',
                        desc = L['Enable the Questlog'],
                        disabled = 'IsDisabled',
                        name = L['Enable Questlog'],
                        order = 3,
                        onSet = function()
                            local fn = module.db.profile.questlog.enabled and 'EnableModule' or 'DisableModule';
                            beql[fn](beql, 'Log');
                        end,
                        type = 'toggle',
                        width = 'full'
                    },
                    DisableTracker = {
                        dbProp = 'profile.tracker.disabled',
                        desc = L['Disable the Tracker'],
                        disabled = 'IsDisabled',
                        name = L['Disable Tracker'],
                        order = 4,
                        onSet = function()
                            local fn = module.db.profile.tracker.disabled and 'DisableModule' or 'EnableModule';
                            beql[fn](beql, 'Tracker');
                        end,
                        type = 'toggle',
                        width = 'full'
                    },
                    Language = {
                        dbProp = 'profile.EnableLanguages',
                        desc = L['Enables the language support for non-natural Languages.'],
                        disabled = function(info)
                            return not beql_lang or not beql:IsEnabled()
                        end,
                        name = L['Enable Language support'],
                        order = 7,
                        type = 'toggle'
                    },
                    LanguageSelect = {
                        desc = 'Change the language to a non WoW language. Reloades interface.' ..' - '..L['Requires Interface Reload'],
                        dbProp = 'profile.Language',
                        disabled = function(info)
                            return not beql_lang or not module.db.profile.EnableLanguages or not beql:IsEnabled()
                        end,
                        name = 'Language',
                        order = 8,
                        onSet = 'ReloadUI',
                        type = 'select',
                        values = function()
                            local langtable = { SystemDefault = 'SystemDefault'}
                            for k in pairs(beql_lang) do
                                langtable[k] = k
                            end
                            return langtable
                        end
                    },
                    debug = {
                        dbProp = 'profile.debug',
                        name = L['Enable Debug'],
                        type = 'toggle',
                        width = 'full'
                    }
                }
            },

            -- Quest Log Options

            questlog = {
                desc = L['Options related to the Quest Log'],
                name = L['Quest Log Options'],
                order = 2,
                type = 'group',
                args = {
                    Spacing0 = {
                        order = 0,
                        type = 'header'
                    },
                    Locked = {
                        desc = L['Makes the quest log unmovable'],
                        dbProp = 'profile.questlog.locked',
                        disabled = 'IsDisabled',
                        name = L['Lock Quest Log'],
                        onSet = 'Log:OnEnable',
                        order = 1,
                        type = 'toggle',
                        widthInPercent = 66
                    },
                    Reset = {
                        desc = L['Reset questlog position'],
                        func = function(info)
                            beql:restoreLayout(beql.frames.questLogAnchor);
                            beql:SaveFramePosition(beql.frames.questLogAnchor)
                            beql:GetModule('Log'):Hooks_OnToggle();
                        end,
                        name = L['Reset questlog position'],
                        order = 2,
                        type = 'execute',
                        widthInPercent = 33
                    },
                    Spacing1 = {
                        name = L['General Quest Log Options'],
                        order = 3,
                        type = 'header'
                    },
                    Layout = {
                        disabled = 'IsDisabled',
                        guiInline = true,
                        name = L['Questlog Layout'],
                        order = 4,
                        type = 'group',
                        args = {
                            style = {
                                desc = L['The default appearance of the quest log.'],
                                dbProp = 'profile.questlog.style',
                                disabled = 'IsDisabled',
                                name = L['Quest Log Style'],
                                onSet = 'Log:OnEnable',
                                order = 1,
                                sorting = {'simple', 'extended' ,'minimized' ,'maximized'},
                                type = 'select',
                                values = {
                                    simple = L['Simple Quest Log'],
                                    extended = L['Extended Quest Log'],
                                    minimized = L['Always Open Minimized'],
                                    maximized = L['Always Open Maximized']
                                },
                                widthInPercent = 33
                            },
                            Spacing1 = {
                                order = 2,
                                type = 'header',
                                hidden= true
                            },
                            ShowLevel = {
                                dbProp = 'profile.questlog.showlevel',
                                desc = L['Shows the quests level'],
                                disabled = 'IsDisabled',
                                name = L['Show Quest Level'],
                                onSet = 'QuestLog_Update',
                                order = 3,
                                type = 'toggle',
                                widthInPercent = 33
                            },
                            ShowShortTags = {
                                dbProp = 'profile.questlog.showTags',
                                desc = L['Shows the short verion of the tag'],
                                disabled = 'IsDisabled',
                                name = L['Show Quest Tags'],
                                onSet = 'QuestLog_Update',
                                order = 4,
                                type = 'toggle',
                                widthInPercent = 33
                            },
                            QuestLogFontSize = {
                                dbProp = 'profile.questlog.FontSize',
                                desc = L['Font Size'],
                                disabled = 'IsDisabled',
                                width = 'full',
                                max = 20,
                                min = 6,
                                name = L['Font Size'],
                                onSet = 'Log:OnEnable',
                                order = 5,
                                step = 1,
                                type = 'range',
                                widthInPercent = 50
                            },
                            QuestLogAlpha = {
                                dbProp = 'profile.questlog.Alpha',
                                desc = L['Sets the Alpha of the Quest Log'],
                                disabled = 'IsDisabled',
                                max = 1,
                                min = 0,
                                name = L['Quest Log Alpha'],
                                onSet = 'Log:OnEnable',
                                order = 6,
                                step = 0.01,
                                type = 'range',
                                widthInPercent = 25
                            },
                            QuestLogScale = {
                                dbProp = 'profile.questlog.Scale',
                                desc = L['Sets the Scale of the Quest Log'],
                                disabled = 'IsDisabled',
                                max = 1.5,
                                min = 0.4,
                                name = L['Quest Log Scale'],
                                onSet = 'Log:OnEnable',
                                order = 7,
                                step = 0.01,
                                type = 'range',
                                widthInPercent = 25
                            }
                        }
                    },
                    QuestCompletionSound = {
                        desc = L['Select the sound to be played when a quest is completed'],
                        disabled = 'IsDisabled',
                        guiInline = true,
                        name = L['Completion Sound'],
                        order = 9,
                        type = 'group',
                        width = 'full',
                        args = {
                            InfoOnQuestCompletion = {
                                dbProp = 'profile.questlog.InfoOnQuestCompletion',
                                desc = L['Shows a message and plays a sound when you complete a quest'],
                                disabled = 'IsDisabled',
                                name = L['Info on Quest Completion'],
                                order = 1,
                                type = 'toggle',
                                width = 10,
                                --width = 'full'
                            },
                            Spacing1 = {
                                hidden = function(info)
                                    return not module.db.profile.questlog.InfoOnQuestCompletion or not beql:IsEnabled()
                                end,
                                order = 2,
                                type = 'header',
                                width = 0.25
                            },
                            none = {
                                desc = L['Don\'t play a sound'],
                                get = function(info)
                                    return not module.db.profile.questlog.InfoSound or module.db.profile.questlog.InfoSound == ''
                                end,
                                hidden = function(info)
                                    return not module.db.profile.questlog.InfoOnQuestCompletion or not beql:IsEnabled()
                                end,
                                name = L['No sound'],
                                order = 3,
                                set = function()
                                    module.db.profile.questlog.InfoSound = '';
                                end,
                                type = 'toggle',
                                width = 'full'
                            }
                        }
                    },
                    AnnounceQuestStatus = {
                        guiInline = true,
                        name = L['Quest Progression to Party Chat'],
                        order = 10,
                        type = 'group',
                        args ={
                            AnnounceQuestStatus = {
                                desc = L['Prints the Quest Progression Status to the Party Chat'],
                                dbProp = 'profile.questlog.chat.AnnounceQuest',
                                disabled = 'IsDisabled',
                                name = L['Enable Quest Progression to Party Chat'],
                                onSet = 'Chat:ToggleModuleState',
                                order = 1,
                                type = 'toggle',
                                width = 'full'
                            },
                            accept = {
                                dbProp = 'profile.questlog.chat.accept',
                                desc = L['Print a chat massage when you accept a new quest.'],
                                disabled = function(info)
                                    return not beql:IsEnabled() or not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                hidden = function()
                                    return not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                name = L['Accept a new quest'],
                                order = 3,
                                type = 'toggle',
                                width = 'full'
                            },
                            abandon = {
                                dbProp = 'profile.questlog.chat.abandoned',
                                desc = L['Print a chat massage when you abandon a quest.'],
                                disabled = function(info)
                                    return not beql:IsEnabled() or not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                hidden = function()
                                    return not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                name = L['Abandon a quest'],
                                order = 4,
                                type = 'toggle',
                                width = 'full'
                            },
                            progress = {
                                dbProp = 'profile.questlog.chat.progress',
                                desc = L['Print a chat massage when an objective of a quest is updated.'],
                                disabled = function(info)
                                    return not beql:IsEnabled() or not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                hidden = function()
                                    return not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                name = L['Progess of a quest'],
                                order = 5,
                                type = 'toggle',
                                width = 'full'
                            },
                            complete = {
                                dbProp = 'profile.questlog.chat.finished',
                                desc = L['Print a chat massage when you complete all quest objectives.'],
                                disabled = function(info)
                                    return not beql:IsEnabled() or not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                hidden = function()
                                    return not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                name = L['Complete a quest'],
                                order = 6,
                                type = 'toggle',
                                width = 'full'
                            },
                            finished = {
                                dbProp = 'profile.questlog.chat.delivert',
                                desc = L['Print a chat massage when you deliver a completed quest to the NPC.'],
                                disabled = function(info)
                                    return not beql:IsEnabled() or not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                hidden = function()
                                    return not module.db.profile.questlog.chat.AnnounceQuest
                                end,
                                name = L['Finalize a quest.'],
                                order = 7,
                                type = 'toggle',
                                width = 'full'
                            }
                        }
                    },
                    AutoComplete = {
                        dbProp = 'profile.questlog.autocomplete',
                        desc = L['Automatically Complete Quests'],
                        disabled = 'IsDisabled',
                        hidden = true,
                        name = L['Auto Complete Quest'],
                        order = 11,
                        type = 'toggle',
                        width = 'full'
                    }
                }
            },

            -- Questtracker Options

            questtracker = {
                desc = L['Disable the Tracker'],
                name = L['Disable Tracker'],
                order = 3,
                type = 'group',
                disabled = 'Tracker:IsDisabled',
                args = {
                    LockedTracker = {
                        dbProp = 'profile.tracker.locked',
                        desc = L['Makes the quest tracker unmovable'],
                        name = L['Lock Tracker'],
                        onSet = 'Tracker:OnEnable',
                        order = 1,
                        type = 'toggle'
                    },
                    ResetTracker = {
                        desc = L['Reset tracker position'],
                        name = L['Reset tracker position'],
                        func = function(info)
                            beql.frames.questWatchAnchor:ClearAllPoints()
                            beql.frames.questWatchAnchor:SetPoint('TOPLEFT','UIParent','Center',0,0)
                            beql:SaveFramePosition(beql.frames.questWatchAnchor)
                        end,
                        order = 2,
                        type = 'execute'
                    },
                    Spacing1 = {
                        order = 3,
                        type = 'header'
                    },
                    style = {
                        guiInline = true,
                        name = '[ph] style',
                        order = 4,
                        type = 'group',
                        args = {
                            ShowTrackerHeader = {
                                dbProp = 'profile.tracker.ShowHeader',
                                desc = L['Shows the trackers header'],
                                name = L['Show Tracker Header'],
                                onSet = 'Tracker:OnEnable',
                                order = 4,
                                type = 'toggle',
                                width = 'full'
                            },
                            TrackerAutoResize = {
                                dbProp = 'profile.tracker.AutoResize',
                                desc = L['Automatical resizes the tracker depending on the lenght of the text in it'],
                                name = L['Auto Resize Tracker'],
                                order = 5,
                                onSet = 'Tracker:OnEnable',
                                type = 'toggle',
                                widthInPercent = 33
                            },
                            TrackerFixedWidth = {
                                dbProp = 'profile.tracker.FixedWidth',
                                desc = L['Sets the fixed width of the tracker if auto resize is disabled'],
                                disabled = function(info)
                                    return module.db.profile.tracker.AutoResize
                                end,
                                max = 600,
                                min = 20,
                                name = L['Fixed Tracker Width'],
                                onSet = 'Tracker:OnEnable',
                                order = 6,
                                step = 10,
                                type = 'range',
                                widthInPercent = 66
                            },
                            TrackerFontHeight = {
                                dbProp = 'profile.tracker.FontHeight',
                                desc = L['Changes the font size of the tracker'],
                                max = 18,
                                min = 8,
                                name = L['Font Size'],
                                onSet = 'Tracker:OnEnable',
                                order = 7,
                                step = 1,
                                type = 'range',
                                widthInPercent = 50
                            },
                            QuestTrackerAlpha = {
                                dbProp = 'profile.tracker.Alpha',
                                desc = L['Sets the Alpha of the Quest Tracker'],
                                min = 0,
                                max = 1,
                                name = L['Quest Tracker Alpha'],
                                onSet = 'Tracker:OnEnable',
                                order = 8,
                                step = 0.01,
                                type = 'range',
                                widthInPercent = 50
                            }
                        }
                    },
                    WatchOptions = {
                        guiInline = true,
                        name = L['Watch Options'],
                        order = 5,
                        type = 'group',
                        args = {
                            AddNew = {
                                dbProp = 'profile.tracker.AddNew',
                                desc = L['Automatical add new Quests to tracker'],
                                name = L['Add New Quests'],
                                order = 10,
                                type = 'toggle',
                                width = 'full'
                            },
                            AddUntracked = {
                                dbProp = 'profile.tracker.AddUntracked',
                                desc = L['Automatical add quests with updated objectives to tracker'],
                                name = L['Add Untracked'],
                                order = 11,
                                type = 'toggle',
                                width = 'full'
                            },
                            RemoveFinished = {
                                dbProp = 'profile.tracker.RemoveFinished',
                                desc = L['Automatical remove completed quests from tracker'],
                                name = L['Remove Completed Quests'],
                                onSet = 'Tracker:displayQuests',
                                order = 15,
                                type = 'toggle',
                                width = 'full'
                            },
                            MinimizeFinished = {
                                dbProp = 'profile.tracker.MinimizeFinished',
                                desc = L['Automatical hide completed objectives in tracker'],
                                name = L['Hide Completed Objectives'],
                                onSet = 'Tracker:displayQuests',
                                order = 16,
                                type = 'toggle',
                                width = 'full'
                            },
                            HideCompletedOnly = {
                                dbProp = 'profile.tracker.HideCompletedOnly',
                                desc = L['Hide objectives only for completed quests'],
                                disabled = function(info)
                                    return module.db.profile.tracker.MinimizeFinished or module.db.profile.tracker.RemoveFinished
                                end,
                                name = L['Hide Objectives for Completed only'],
                                onSet = 'Tracker:displayQuests',
                                order = 17,
                                type = 'toggle',
                                width = 'full'
                            },
                            SortTrackerItems = {
                                dbProp = 'profile.tracker.SortItems',
                                desc = L['Sort the quests in tracker'],
                                name = L['Sort Tracker Quests'],
                                onSet = 'Tracker:displayQuests',
                                order = 18,
                                type = 'toggle',
                                width = 'full'
                            }
                        }
                    },

                    -- Colors on Questtracker

                    Colors = {
                        guiInline = true,
                        name = L['Colors'],
                        order = 22,
                        type = 'group',
                        args = {
                            UseBackgroundColor = {
                                dbProp = 'profile.tracker.UseBgColors',
                                desc = L['Use Background'],
                                name = L['Background'],
                                onSet = 'Tracker:applyStyles',
                                order = 1,
                                type = 'toggle'
                            },
                            CustomBgColor = {
                                dbProp = 'profile.tracker.CustomBgColor',
                                desc = L['Use custom color for background'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.UseBgColors
                                end,
                                name = L['Custom Background Color'],
                                onSet = 'Tracker:applyStyles',
                                order = 2,
                                type = 'toggle'
                            },
                            BackgroundColor = {
                                dbProp = 'profile.tracker.Colors.Bg',
                                desc = L['Sets the Background Color'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomBgColor
                                end,
                                hasAlpha = true,
                                name = L['Background Color'],
                                onSet = 'Tracker:applyStyles',
                                order = 3,
                                type = 'color'
                            },
                            QuestTracker_BgBorder = {
                                dbProp = 'profile.tracker.Colors.BgBorder',
                                desc = L['Sets the Background Corner Color'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomBgColor
                                end,
                                hasAlpha = true,
                                name = L['Background Corner Color'],
                                onSet = 'Tracker:applyStyles',
                                order = 4,
                                type = 'color'
                            },
                            spacer1 = {
                                name = L['Zones'],
                                order = 5,
                                type = 'header'
                            },
                            ShowZonesInTracker = {
                                dbProp = 'profile.tracker.ShowZones',
                                desc = L['Show the quests zone it belongs to above its name'],
                                name = L['Show Quest Zones'],
                                onSet = 'Tracker:displayQuests',
                                order = 5.5,
                                type = 'toggle',
                                width = 'full'
                            },
                            CustomZoneColor = {
                                dbProp = 'profile.tracker.CustomZoneColor',
                                desc = L['Use custom color for Zone names'],
                                disabled = function()
                                    return not module.db.profile.tracker.ShowZones
                                end,
                                name = L['Custom Zone Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 6,
                                type = 'toggle'
                            },
                            ColorZone = {
                                dbProp = 'profile.tracker.Colors.Zone',
                                desc = L['Sets the zone color'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomZoneColor or not module.db.profile.tracker.ShowZones
                                end,
                                hasAlpha = false,
                                name = L['Zone Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 7,
                                type = 'color'
                            },
                            spacer3 = {
                                order = 8,
                                type = 'header'
                            },
                            CustomHeaderColor = {
                                dbProp = 'profile.tracker.CustomHeaderColor',
                                desc = L['Use custom color for headers'],
                                name = L['Custom Header Color'],
                                order = 9,
                                onSet = 'Tracker:displayQuests',
                                type = 'toggle'
                            },
                            ColorHeaderEmpty = {
                                order = 10,
                                name = L['Header Color'],
                                desc = L['Sets the color for headers'],
                                dbProp = 'profile.tracker.Colors.HeaderNormal',
                                onSet = 'Tracker:displayQuests',
                                hasAlpha = false,
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomHeaderColor or module.db.profile.tracker.HeaderQuestLevelColor
                                end,
                                type = 'color'
                            },
                            HeaderQuestLevelColor = {
                                dbProp = 'profile.tracker.HeaderQuestLevelColor',
                                desc = L['Use the colors to indicate quest difficulty'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomHeaderColor
                                end,
                                name = L['Use Quest Level Colors'],
                                onSet = 'Tracker:displayQuests',
                                order = 11,
                                type = 'toggle',
                                width = 'full'
                            },
                            ColorHeaderFailed = {
                                dbProp = 'profile.tracker.Colors.HeaderFailed',
                                desc = L['Sets the color for failed quests'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomHeaderColor
                                end,
                                hasAlpha = false,
                                name = L['Failed Header Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 12,
                                type = 'color'
                            },
                            ColorHeaderComplete = {
                                dbProp = 'profile.tracker.Colors.HeaderComplete',
                                desc = L['Sets the color for completed headers'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomHeaderColor
                                end,
                                hasAlpha = false,
                                name = L['Completed Header Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 13,
                                type = 'color'
                            },
                            spacer2 = {
                                order = 14,
                                type = 'header'
                            },
                            CustomObjetiveColor = {
                                dbProp = 'profile.tracker.CustomObjetiveColor',
                                desc = L['Use custom color for objective text'],
                                name = L['Color Objectives'],
                                onSet = 'Tracker:displayQuests',
                                order = 15,
                                type = 'toggle'
                            },
                            FadeColor = {
                                dbProp = 'profile.tracker.FadeColor',
                                desc = L['Fade the objective colors'],
                                name = L['Fade Colors'],
                                onSet = 'Tracker:displayQuests',
                                order = 16,
                                type = 'toggle'
                            },
                            ColorObjectiveNormal = {
                                dbProp = 'profile.tracker.Colors.ObjectiveNormal',
                                desc = L['Sets the color for objectives'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomObjetiveColor
                                end,
                                hasAlpha = false,
                                name = L['Objective Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 17,
                                type = 'color'
                            },
                            ColorObjectiveComplete = {
                                dbProp = 'profile.tracker.Colors.ObjectiveComplete',
                                desc = L['Sets the color for completed objectives'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.CustomObjetiveColor
                                end,
                                hasAlpha = false,
                                name = L['Completed Objective Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 18,
                                type = 'color'
                            },
                            useFadeStepColor = {
                                dbProp = 'profile.tracker.useFadeStepColor',
                                --desc = L['Use custom color for objective text'],
                                disabled = function()
                                    return beql:GetModule('Tracker'):IsDisabled() or not module.db.profile.tracker.FadeColor or not module.db.profile.tracker.CustomObjetiveColor;
                                end,
                                name = L['Use Fade-Step-Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 19,
                                type = 'toggle'
                            },
                            ColorObjectiveStep = {
                                dbProp = 'profile.tracker.Colors.ObjectiveStepColor',
                                --desc = L['Sets the color for completed objectives'],
                                disabled = function(info)
                                    return beql:GetModule('Tracker'):IsDisabled() or not module.db.profile.tracker.FadeColor or not module.db.profile.tracker.CustomObjetiveColor or not module.db.profile.tracker.useFadeStepColor;
                                end,
                                hasAlpha = false,
                                name = L['Fade-Step-Color'],
                                onSet = 'Tracker:displayQuests',
                                order = 20,
                                type = 'color'
                            },
                            MarkerOptions = {
                                desc = L['Customize the Objective/Quest Markers'],
                                guiInline = true,
                                order = 21,
                                type = 'group',
                                args = {
                                    Spacing5 = {
                                        name = L['Markers'],
                                        order = 0,
                                        type = 'header'
                                    },
                                    ShowObjectiveMarkers = {
                                        dbProp = 'profile.tracker.ShowObjectiveMarkers',
                                        desc = L['Display Markers before objectives'],
                                        name = L['Show Objective Markers'],
                                        order = 1,
                                        onSet = 'Tracker:displayQuests',
                                        type = 'toggle'
                                    },
                                    TrackerSymbol = {
                                        dbProp = 'profile.tracker.TrackerSymbol',
                                        desc = L['Set the type of symbol'],
                                        disabled = function(info)
                                            return module.db.profile.tracker.UseTrackerListing or not module.db.profile.tracker.ShowObjectiveMarkers
                                        end,
                                        max = 4,
                                        min = 1,
                                        name = L['Symbol Type'],
                                        onSet = 'Tracker:displayQuests',
                                        order = 2,
                                        step = 1,
                                        type = 'range'
                                    },
                                    UseTrackerListing = {
                                        dbProp = 'profile.tracker.UseTrackerListing',
                                        desc = L['User Listing rather than symbols'],
                                        disabled = function(info)
                                            return not module.db.profile.tracker.ShowObjectiveMarkers
                                        end,
                                        name = L['Use Listing'],
                                        onSet = 'Tracker:displayQuests',
                                        order = 3,
                                        type = 'toggle'
                                    },
                                    TrackerList = {
                                        dbProp = 'profile.tracker.TrackerList',
                                        desc = L['Set the type of listing'],
                                        disabled = function(info)
                                            return not module.db.profile.tracker.UseTrackerListing
                                        end,
                                        max = 4,
                                        min = 1,
                                        name = L['List Type'],
                                        onSet = 'Tracker:displayQuests',
                                        order = 4,
                                        step = 1,
                                        type = 'range'
                                    }
                                }
                            }
                        }
                    },
                    QuestTrackerTooltip = {
                        guiInline = true,
                        name = L['Tracker Tooltip'],
                        --order = 3,
                        type = 'group',
                        args = {
                            ActiveTracker = {
                                dbProp = 'profile.tracker.tooltip.enabled',
                                desc = L['Showing mouseover tooltips in tracker'],
                                name = L['Tracker Tooltip'],
                                order = 1,
                                type = 'toggle',
                                width = 'full'
                            },
                            TrackerMouseLeft = {
                                dbProp = 'profile.tracker.LeftClick',
                                desc = L['Left clicking a quest in the tracker opens the Quest Log'],
                                name = L['Enable Left Click'],
                                order = 3,
                                type = 'toggle'
                            },
                            TrackerMouseRight = {
                                dbProp = 'profile.tracker.RightClick',
                                desc = L['Right clicking a quest in the tracker removes it from the tracker'],
                                name = L['Enable Right Click'],
                                order = 4,
                                type = 'toggle'
                            },
                            Spacer2 = {
                                name = L['Title color'],
                                order = 5,
                                type = 'header'
                            },
                            ColorTitleDiff = {
                                dbProp = 'profile.tracker.tooltip.useQuestColors',
                                desc = L['Use Quest Level Colors'],
                                name = L['Use Quest Level Colors'],
                                order = 6,
                                type = 'toggle'
                            },
                            ColorTitle = {
                                dbProp = 'profile.tracker.tooltip.titleColor',
                                desc = L['Sets the color for headers'],
                                disabled = function(info)
                                    return module.db.profile.tracker.tooltip.useQuestColors
                                end,
                                hasAlpha = false,
                                name = L['Header Color'],
                                order = 7,
                                type = 'color'
                            },
                            TrackerTooltipDesc = {
                                dbProp = 'profile.tracker.tooltip.showDescription',
                                desc = L['Displays the actual quest\'s description in the tracker tooltip'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.tooltip.enabled
                                end,
                                name = L['Quest Description in Tracker Tooltip'],
                                order = 8,
                                type = 'toggle',
                                width = 'full'
                            },
                            ColorDesc = {
                                dbProp = 'profile.tracker.tooltip.descriptionColor',
                                desc = L['Sets the color for the Quest description'],
                                hasAlpha = false,
                                name = L['Quest Description Color'],
                                order = 9,
                                type = 'color'
                            },
                            TrackerTooltipParty = {
                                dbProp = 'profile.activetrackerparty',
                                --desc = L['Displays Party members quest status in the tooltip - Quixote must be installed on the partymembers client'],
                                disabled = function(info)
                                    return not module.db.profile.tracker.tooltip.enabled
                                end,
                                hidden = true,
                                name = L['Party Quest Progression info'],
                                order = 10,
                                type = 'toggle',
                                width = 'full'
                            }
                        }
                    }
                }
            },

            -- Tooltip Options

            tooltip = {
                desc = L['Tooltip Options'],
                name = L['Tooltip'],
                order = 4,
                type = 'group',
                args = {
                    Spacer1 = {
                        name = L['Quest Tracker'],
                        hidden = true,
                        order = 3,
                        type = 'header'
                    },
                    party = {
                        guiInline = true,
                        hidden = true,
                        name = 'Party',
                        order = 0,
                        type = 'group',
                        args = {
                            ColorPartyQ = {
                                dbProp = 'profile.Color.TooltipPartyQuixote',
                                desc = L['Sets the color for Party member'],
                                hasAlpha = false,
                                name = L['Party Member with Quixote Color'],
                                order = 2,
                                type = 'color',
                                width = 'full'
                            },
                            ColorPartyNQ = {
                                dbProp = 'profile.Color.TooltipPartyNonQuixote',
                                desc = L['Sets the color for Party member'],
                                hasAlpha = false,
                                name = L['Party Member Color'],
                                order = 3,
                                type = 'color',
                                width = 'full'
                            },
                            ColorPartyObj = {
                                dbProp = 'profile.Color.TooltipPartyObj',
                                desc = L['Sets the color for objectives'],
                                hasAlpha = false,
                                name = L['Objective Color'],
                                order = 4,
                                type = 'color',
                                width = 'full'
                            },
                            ColorPartyObjC = {
                                dbProp = 'profile.Color.TooltipPartyObjComp',
                                desc = L['Sets the color for completed objectives'],
                                hasAlpha = false,
                                name = L['Completed Objective Color'],
                                order = 5,
                                type = 'color',
                                width = 'full'
                            },
                        }
                    },
                    Spacer2 = {
                        hidden = true,
                        name = L['NPC color'],
                        order = 10,
                        type = 'header'
                    },
                    Gametooltip = {
                        desc = L['Colors'],
                        guiInline = true,
                        name = L['GameTooltip'],
                        order = 14,
                        type = 'group',
                        args = {
                            scanUnits = {
                                dbProp = 'profile.tooltip.scanUnits',
                                desc = L['Show quest info in mob tooltips'],
                                name = L['Mob Tooltip Quest Info'],
                                order = 1,
                                type = 'toggle',
                                width = 'normal'
                            },
                            scanItems = {
                                dbProp = 'profile.tooltip.scanItems',
                                desc = L['Show quest info in item tooltips'],
                                name = L['Item Tooltip Quest Info'],
                                order = 2,
                                type = 'toggle',
                                width = 'normal'
                            },
                            scanOthers = {
                                dbProp = 'profile.tooltip.scanOthers',
                                desc = L['Show quest info on other tooltips'],
                                name = L['Other Tooltip Quest Info'],
                                order = 3,
                                type = 'toggle',
                                width = 'normal'
                            },
                            scanDeep = {
                                dbProp = 'profile.tooltip.scanDeep',
                                desc = L['Scans the full quest for tooltip info occurence'],
                                name = L['Deep scan for quest'],
                                order = 4,
                                type = 'toggle',
                                width = 'full'
                            },
                            useQuestColors = {
                                dbProp = 'profile.tooltip.useQuestColors',
                                desc = L['Use Quest Level Colors'],
                                name = L['Use Quest Level Colors'],
                                order = 5,
                                type = 'toggle',
                                width = 'normal'
                            },
                            {
                                order = 6,
                                type = 'header'
                            },
                            ColorObjectives = {
                                dbProp = 'profile.tooltip.colorObjectives',
                                -- desc = L['Show quest info in item tooltips'],
                                name = L['Color Objectives'],
                                order = 7,
                                type = 'toggle'
                            },
                            ColorIncomplete = {
                                dbProp = 'profile.tooltip.Colors.objectiveIncomplete',
                                -- desc = L['Item Tooltip Quest Info'],
                                disabled = function(info)
                                    return not module.db.profile.tooltip.colorObjectives
                                end,
                                hasAlpha = false,
                                name = L['Incomplete'],
                                order = 8,
                                type = 'color'
                            },
                            ColorComplete = {
                                dbProp = 'profile.tooltip.Colors.objectiveComplete',
                                -- desc = L['Item Tooltip Quest Info'],
                                disabled = function(info)
                                    return not module.db.profile.tooltip.colorObjectives
                                end,
                                hasAlpha = false,
                                name = L['Complete'],
                                order = 9,
                                type = 'color'
                            },
                            FadeObjectives = {
                                dbProp = 'profile.tooltip.fadeObjectiveColors',
                                -- desc = L['Show quest info in item tooltips'],
                                disabled = function(info)
                                    return not module.db.profile.tooltip.colorObjectives
                                end,
                                name = L['Fade Colors'],
                                order = 10,
                                type = 'toggle'
                            },
                            UseFadeStepColor = {
                                dbProp = 'profile.tooltip.fadeObjectiveWithStep',
                                -- desc = L['Show quest info in item tooltips'],
                                disabled = function(info)
                                    return not module.db.profile.tooltip.colorObjectives or not module.db.profile.tooltip.fadeObjectiveColors
                                end,
                                name = L['Use Fade-Step-Color'],
                                order = 11,
                                type = 'toggle'
                            },
                            ColorFadeStep = {
                                dbProp = 'profile.tooltip.Colors.objectiveFadeStep',
                                -- desc = L['Item Tooltip Quest Info'],
                                disabled = function(info)
                                    return not module.db.profile.tooltip.colorObjectives or not module.db.profile.tooltip.fadeObjectiveWithStep or not module.db.profile.tooltip.fadeObjectiveColors
                                end,
                                hasAlpha = false,
                                name = L['Fade-Step-Color'],
                                order = 12,
                                type = 'color'
                            }
                        }
                    }
                }
            },
            test = {
                type = 'group',
                name = 'test',
                args = {
                }
            },

            -- Profiles
            profiles = LibStub('AceDBOptions-3.0'):GetOptionsTable(self.db)
        }
    }

    for i = 0, 100 do
        module.optionsTable.args.test.args[i] = {
            type = 'toggle',
            order = i,
            name = tostring(i) .. '%',
            widthInPercent = i,
            width = i
        }
    end

-- /run print(InterfaceOptionsFramePanelContainer:GetWidth())

    -- add Sounds to Options
    module:createSoundTable(module.optionsTable.args.questlog.args.QuestCompletionSound.args);
end

function module:createSoundTable(options)
    local soundKeys = {};
    for k in pairs(module.sounds) do
        tinsert(soundKeys, k);
    end

    table.sort(soundKeys);

    for i, k in ipairs(soundKeys) do
        local v = module.sounds[k];

        options[k] = {
            desc = k,
            get = function(info)
                return module.db.profile.questlog.InfoSound == v;
            end,
            hidden = function(info)
                return not module.db.profile.questlog.InfoOnQuestCompletion or not beql:IsEnabled()
            end,
            name = k,
            order = i + 3,
            set = function(info, newval)
                module.db.profile.questlog.InfoSound = v;
                PlaySoundFile(module.db.profile.questlog.InfoSound)
            end,
            type = 'toggle',
            widthInPercent = 25
        }
    end
end

-- - EOF -- -

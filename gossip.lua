--[[
************************************************************************

questlog.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike

************************************************************************
]]--
local addonName = ...;

local beql = LibStub("AceAddon-3.0"):GetAddon(addonName)
local module = beql:NewModule('Gossip');

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

function module:OnInitialize()

end

function module:OnEnable()
    if (beql:IsDisabled() ) then
        module:Disable();
        module:SetEnabledState(not beql.db.profile.gossip.disabled);
        
        return;
    end

	module:questLog_OnToggle();
end 

function module:OnDisable()

end

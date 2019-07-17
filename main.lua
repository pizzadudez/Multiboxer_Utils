local addonName, addonTable = ...

local Utils = LibStub('AceAddon-3.0'):NewAddon('Multiboxer_Utils', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')
addonTable[1] = Utils
_G[addonName] = Utils

local StdUi = LibStub('StdUi')


-- ============================================================================
-- Addon Initialization
-- ============================================================================

function Utils:OnEnable()
    -- Enable AutoLoot:
    if GetCVar("autoLootDefault") == "0" then
        SetCVar( "autoLootDefault", 1 )
    end

    self:RegisterEvent('LOOT_READY')
end


-- ============================================================================
-- Event Handlers
-- ============================================================================

function Utils:LOOT_READY()
    local lootCount = GetNumLootItems()
    if lootCount == 0 then
        CloseLoot()
    end

    for slot = lootCount, 1, -1 do
        local isLocked = select(6, GetLootSlotInfo(slot))
        if isLocked == false then
            LootSlot(slot)
        end
    end
    lootCount = GetNumLootItems()
    
    if lootCount > 0 then
        self:ScheduleTimer('LOOT_READY', 0.3)
    else
        self:ScheduleTimer(function() CloseLoot() end, 0.1)
    end
end
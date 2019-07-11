local addonName, addonTable = ...

local Utils = LibStub('AceAddon-3.0'):NewAddon('Multiboxer_Utils', 'AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0')
addonTable[1] = Utils
_G[addonName] = Utils

local StdUi = LibStub('StdUi')


-- ============================================================================
-- Addon Initialization
-- ============================================================================

function Utils:OnInitialize()

end

function Utils:OnEnable()

end


-- ============================================================================
-- Event Handlers
-- ============================================================================

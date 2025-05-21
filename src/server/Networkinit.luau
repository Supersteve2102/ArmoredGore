-- src/server/NetworkInit.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Networker = require(ReplicatedStorage.Packages.networker)

local CombatNetwork = Networker.server("Combat")

CombatNetwork:declare({
	RequestM1 = Networker.Event(),
	AttemptParry = Networker.Event(),
	M1Fired = Networker.Event(),
	ParryFeedback = Networker.Event(),
})

return CombatNetwork

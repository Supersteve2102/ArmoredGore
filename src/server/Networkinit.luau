local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Networker = require(ReplicatedStorage.Packages.Networker)

-- Access the server namespace
local NetworkServer = Networker.server

-- Create the "Combat" namespace
local CombatNetwork = NetworkServer:createNamespace("Combat")

-- Declare events within the "Combat" namespace
CombatNetwork:declare({
	RequestM1 = NetworkServer.Event(),
	FireM1 = NetworkServer.Event(),
	Parry = NetworkServer.Event(),
	HitConfirm = NetworkServer.Event(),
})

return CombatNetwork

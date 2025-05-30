local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local NetworkerModule = require(ReplicatedStorage.Packages.Networker)

-- Arguments needed: LocalPlayer and ReplicatedStorage
local localPlayer = Players.LocalPlayer
local NetworkClient = NetworkerModule.client.new(localPlayer, ReplicatedStorage)

-- Wait for namespace
NetworkClient:namespaceReached("Combat")
	:andThen(function(Combat)
		-- Ready to use events like Combat.RequestM1
		Combat.RequestM1:fire()
	end)
	:catch(function(err)
		warn("Combat namespace not reached:", err)
	end)

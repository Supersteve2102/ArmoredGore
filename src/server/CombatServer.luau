-- src/server/CombatServer.server.lua
local CombatNetwork = require(script.Parent.Networkinit)

CombatNetwork.RequestM1:connect(function(player)
	print(player.Name .. " requested an M1 attack.")
	-- Implement attack logic here
end)

CombatNetwork.AttemptParry:connect(function(player)
	print(player.Name .. " attempted a parry.")
	-- Implement parry logic here
end)

local CombatNetwork = require(script.Parent.Networkinit) -- ✅ use the existing server namespace

CombatNetwork.RequestM1:connect(function(player)
	print(player.Name .. " requested an M1 attack")
end)

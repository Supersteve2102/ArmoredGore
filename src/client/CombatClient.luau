local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Networker = require(ReplicatedStorage.Packages.Networker)
local localPlayer = Players.LocalPlayer
local CombatNetwork = Networker.client.new(localPlayer, ReplicatedStorage)

CombatNetwork:namespaceReached("Combat"):andThen(function(Combat)
	-- Pressing "F" fires M1
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end
		if input.KeyCode == Enum.KeyCode.F then
			Combat.RequestM1:fire()
			print("M1")
		end
	end)

	-- Optional: Receive hit confirmation
	Combat.HitConfirm:connect(function(hitTarget)
		print("You hit:", hitTarget.Name)
	end)
end)

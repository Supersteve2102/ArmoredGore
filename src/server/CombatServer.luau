local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CombatNetwork = require(script.Parent.Networkinit)

CombatNetwork.RequestM1:connect(function(player)
	local character = player.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then
		return
	end

	local origin = character.PrimaryPart.Position
	local direction = character.PrimaryPart.CFrame.LookVector * 5

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude

	raycastParams.FilterDescendantsInstances = { character }

	local result = workspace:Raycast(origin, direction, raycastParams)

	if result and result.Instance then
		local hitPart = result.Instance
		local hitModel = hitPart:FindFirstAncestorOfClass("Model")

		if hitModel then
			local hitHumanoid = hitModel:FindFirstChildOfClass("Humanoid")
			if hitHumanoid then
				hitHumanoid:TakeDamage(10)
				CombatNetwork.HitConfirm:fire(player, hitModel)
			end
		end
	end
end)

local function attachHitbox(dummy, name, offset)
	local torso = dummy:FindFirstChild("Torso") or dummy:FindFirstChild("UpperTorso")
	if not torso then
		return
	end

	local hitbox = Instance.new("Part")
	hitbox.Name = name
	hitbox.Size = Vector3.new(4, 5, 1)
	hitbox.Transparency = 0.8
	hitbox.CanCollide = false
	hitbox.Anchored = false
	hitbox.Massless = true
	hitbox.Color = Color3.fromRGB(255, 0, 0)
	hitbox.Parent = dummy

	local weld = Instance.new("WeldConstraint")
	weld.Part0 = torso
	weld.Part1 = hitbox
	weld.Parent = hitbox

	hitbox.CFrame = torso.CFrame * CFrame.new(offset)
end

-- Usage:
local dummy = workspace:FindFirstChild("TestDummy")
if dummy then
	attachHitbox(dummy, "FrontHitbox", Vector3.new(0, 0, -2.5))
	attachHitbox(dummy, "BackHitbox", Vector3.new(0, 0, 2.5))
end

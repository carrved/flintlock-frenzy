local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Folder = script.Parent

function onPlayerAdded(player)
	if not RunService:IsStudio() then
		for i,v in pairs(Folder:GetChildren()) do
			if v:IsA("NumberValue") then
				if player.UserId == v.Value then                    
		     		player:Kick("You are banned from the game! If you believe this is a false ban, please contact someone on our discord server.")
   				end
			end
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
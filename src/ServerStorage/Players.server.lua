--//Variables\\--
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
	local remotes = replicatedStorage:WaitForChild("Remotes", 60)
		local sendFeed = remotes:WaitForChild("SendFeed", 60)

--//Custom Functions\\--
function FindKiller(victimTeamColor, victim)	
	local creator = victim:FindFirstChildOfClass("ObjectValue")
	
	if creator and (string.lower(creator.Name) == "creator") and creator.Value then
		sendFeed:FireAllClients({creator, victim, victimTeamColor})
	elseif not creator then
		sendFeed:FireAllClients({victim, victimTeamColor})
	end
end
		
--//Events and Functions\\--

--//When a player joins the game
players.PlayerAdded:Connect(function(player)
	local teamColor = player.TeamColor
	
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid", 60)
		
		humanoid.Died:Connect(function()
			FindKiller(teamColor, humanoid)
		end)
		
	end)
end)

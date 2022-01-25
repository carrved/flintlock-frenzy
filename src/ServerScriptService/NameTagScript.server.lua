--Made by Sheasu

--Variables
local rep = game:GetService("ReplicatedStorage") --You can change this to ServerStorage for more security.
local nametag = rep.NameTag 

--Functions
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		--Varibles
		local head = char.Head
		local newtext = nametag:Clone() --Cloning the text.
		local uppertext = newtext.UpperText
		local lowertext = newtext.LowerText
		local humanoid = char.Humanoid
		
		humanoid.DisplayDistanceType = "None"
		
		--Main Text
		newtext.Parent = head
		newtext.Adornee = head
		uppertext.Text = player.Name --Changes the text to the player's name.
		
		--"If" Statements
		--You can add as many of these as you wish, just change it to the player's name.
		if player.Name == "whos_ian" then
			lowertext.Text = "Owner" --This is that the text will say.
			lowertext.TextColor3 = Color3.fromRGB(255, 51, 0) --This is what the color of the text will be.
		end
		if player.Name == "MisterSparkz" then
			lowertext.Text = "Owner" --This is that the text will say.
			lowertext.TextColor3 = Color3.fromRGB(255, 51, 0) --This is what the color of the text will be.
		end
		if player.Name == "Diamonddaichan" then
			lowertext.Text = "Admin" --This is that the text will say.
			lowertext.TextColor3 = Color3.fromRGB(255, 100, 125) --This is what the color of the text will be.
		end
	end)
end)

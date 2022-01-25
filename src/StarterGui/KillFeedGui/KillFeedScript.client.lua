--//Variables\\--
local gui = script.Parent
local holder = gui:WaitForChild("Holder", 60)
		local template = holder:WaitForChild("Template", 60)
		local list = holder:WaitForChild("List", 60)

local replicatedStorage = game:GetService("ReplicatedStorage")
	local remotes = replicatedStorage:WaitForChild("Remotes", 60)
		local sendFeed = remotes:WaitForChild("SendFeed", 60)

local debris = game:GetService("Debris")

--//Tables/Arrays
local ActionQuotes = { --What the killer *did* to the victim (You can add more if you like)
	"killed";
	"KO'd";
	"annihilated";
	"squished";
	"destroyed";
	"screwed";
	"pounded";
	"vanquished";
	"had a fight with";
	"won against";
	"knocked out";
	"finished";
	"murdered";
	"assassinated";
	"bloxxed";
	"oofed";
	"said goodbye to"
}

--//Custom Functions\\--
function CloneTemplate()
	local clonedTemplate = template:Clone()
	clonedTemplate.Parent = list
	
	return clonedTemplate
end

function CreateMessage(info)	
	local message = CloneTemplate()
		local killer = message:WaitForChild("Killer", 60)
		local action = message:WaitForChild("Action", 60)
	local victim = message:WaitForChild("Victim", 60)

		
	
	if #info >= 3 then
		
		killer.Text = info[1].Value.Name
		killer.TextColor3 = info[1].Value.TeamColor.Color

		victim.Text = tostring(info[2].Parent.Name)
		victim.TextColor3 = info[3].Color
	elseif #info <= 2 then
		
		killer.Text = tostring(info[1].Parent.Name)
		killer.TextColor3 = info[2].Color
		
		victim.Text = tostring(info[1].Parent.Name)
		victim.TextColor3 = info[2].Color
	end
	
	local chosenAction = ActionQuotes[math.random(1, #ActionQuotes)]
	action.Text = chosenAction

	
	if chosenAction == "annihilated" or chosenAction == "destroyed" or chosenAction == "oofed" or chosenAction == "bloxxed" or chosenAction == "murdered" or chosenAction == "assassinated" then
		action.Font = Enum.Font.SourceSansItalic
		action.TextColor3 = Color3.fromRGB(255, 0, 0)

	end
	
	local messages = list:GetChildren()
	message.LayoutOrder = (message.LayoutOrder + #messages) + 1
	
	message.Name = "Message"
	message.Visible = true
	debris:AddItem(message, 60)
end

--//Connections\\--
sendFeed.OnClientEvent:Connect(CreateMessage)

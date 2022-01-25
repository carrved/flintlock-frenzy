
game.ReplicatedFirst:RemoveDefaultLoadingScreen()

local SG = Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild("PlayerGui"))
script.Parent = SG
local X,Y = script.Parent.AbsoluteSize.X,script.Parent.AbsoluteSize.Y + 100
local bg = script:WaitForChild("BG")
local ci = script:WaitForChild("Circle")
ci.Size = UDim2.new(0,0,0,0) ci.Position = UDim2.new(.5,0,.5,0)


local top = bg:clone()
top.Size = UDim2.new(0,Y/2,0,Y/2)
top.Position = UDim2.new(0,0,.5,-Y/2)

local t2 = top:clone() t2.Parent = top t2.Position = UDim2.new(1,0,0,0) t2.Visible = true
local t3 = t2:clone() t3.Parent = t2
local t4 = t2:clone() t4.Parent = t3

local bottom = bg:clone()
bottom.Size = UDim2.new(0,Y/2,0,Y/2)
bottom.Position = UDim2.new(0,0,.5,0)

local b2 = bottom:clone() b2.Parent = bottom b2.Position = UDim2.new(1,0,0,0) b2.Visible = true
local b3 = b2:clone() b3.Parent = b2
local b4 = b2:clone() b4.Parent = b3
wait()
game:GetService("StarterGui"):SetCore("TopbarEnabled",false)

top.Visible = true
bottom.Visible = true

top.Parent = script.Parent
bottom.Parent = script.Parent

local frame = script:WaitForChild("Frame"):clone()
frame.Parent = top.Parent
frame.Position = UDim2.new(0,0,.5,-80)

frame.TextLabel.Position = UDim2.new(0,-100,.5,-80)

wait(2)

top:TweenPosition(UDim2.new(0,0,.5,-Y/2 - 50),1,2,1) -- open curtains
bottom:TweenPosition(UDim2.new(0,0,.5,50),1,2,1)
wait(.5)

frame.TextLabel:TweenPosition(UDim2.new(1,0,.5,-80),1,1,5)
wait(.5)
frame.TextLabel.ZIndex = 5
local newC = ci:clone() newC.Visible = true
newC.Parent = script.Parent

newC:TweenSizeAndPosition(UDim2.new(0,300,0,300),UDim2.new(.5,-150,.5,-150),1,3,.5)
wait(2)
frame.TextLabel.ZIndex = 2
newC:TweenSizeAndPosition(UDim2.new(0,0,0,0),UDim2.new(.5,0,.5,0),1,1,.6)

top:TweenPosition(UDim2.new(0,0,.5,-Y/2),1,1,1)
bottom:TweenPosition(UDim2.new(0,0,.5,0),1,1,1)
wait(1.5)
frame.Visible = false

wait(.25)
top:TweenPosition(UDim2.new(0,0,0,-Y/2 - 50),1,2,1)
bottom:TweenPosition(UDim2.new(0,0,1,50),1,2,1)
wait(1.1)
top:Destroy()
bottom:Destroy()


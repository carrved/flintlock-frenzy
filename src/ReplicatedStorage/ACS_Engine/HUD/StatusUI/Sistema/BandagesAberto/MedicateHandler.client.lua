repeat
	wait()
until game.Players.LocalPlayer.Character
wait(0.5)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Char = player.Character
local Human = Char.Humanoid
local Saude = Char.Saude

local MedicSystem = game.ReplicatedStorage.ACS_Engine
local Functions = MedicSystem.Eventos.MedSys
local FunctionsMulti = Functions.Multi

local Target = Char.Saude.Variaveis.PlayerSelecionado

local Timer = script.Parent.Parent.Timer
local TS = game:GetService("TweenService")

script.Parent.TratarFeridasAberto.Comprimir.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Compress:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(5), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		FunctionsMulti.Compress:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(5), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

script.Parent.TratarFeridasAberto.Bandagem.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Bandage:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		FunctionsMulti.Bandage:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

script.Parent.TratarFeridasAberto.Tourniquet.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Tourniquet:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		FunctionsMulti.Tourniquet:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

script.Parent.TratarFeridasAberto.Splint.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Splint:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		FunctionsMulti.Splint:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

--[[script.Parent.TratarFeridasAberto.Tourniquet.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Energetic:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		--FunctionsMulti.Energetic:FireServer()
	end
end
end)]]
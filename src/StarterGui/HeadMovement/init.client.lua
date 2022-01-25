--[[
Original: Unknown, Upgraded by: foodman54
]]--

-- ian was here lol

wait()

local Ang = CFrame.Angles
local aSin = math.asin
local aTan = math.atan

local Cam = game.Workspace.CurrentCamera

local Plr = game.Players.LocalPlayer
local Mouse = Plr:GetMouse()
local Body = Plr.Character or Plr.CharacterAdded:wait()
local Head = Body:WaitForChild("Head")
local Hum = Body:WaitForChild("Humanoid")
local Core = Body:WaitForChild("HumanoidRootPart")
local IsR6 = (Hum.RigType.Value==0)
local Trso = (IsR6 and Body:WaitForChild("Torso")) or Body:WaitForChild("UpperTorso")
local Neck = (IsR6 and Trso:WaitForChild("Neck")) or Head:WaitForChild("Neck")
local Waist = (not IsR6 and Trso:WaitForChild("Waist"))


local MseGuide = false

local TurnCharacterToMouse = script.Config.FollowMouse.Value

local HeadHorFactor = script.Config.HeadHorFactor.Value
local HeadVertFactor = script.Config.HeadVertFactor.Value
local BodyHorFactor = script.Config.BodyHorFactor.Value
local BodyVertFactor = script.Config.BodyVertFactor.Value


local UpdateSpeed = script.Config.UpdateSpeed.Value
local NeckOrgnC0 = Neck.C0
local WaistOrgnC0 = (not IsR6 and Waist.C0)



Neck.MaxVelocity = 1/3


if TurnCharacterToMouse == true then
	MseGuide = true
	HeadHorFactor = 0
	BodyHorFactor = 0
end

game:GetService("RunService").RenderStepped:Connect(function()
	local CamCF = Cam.CoordinateFrame
	if ((IsR6 and Body["Torso"]) or Body["UpperTorso"])~=nil and Body["Head"]~=nil then	
		local TrsoLV = Trso.CFrame.lookVector
		local HdPos = Head.CFrame.p
		if IsR6 and Neck or Neck and Waist then	
			if Cam.CameraSubject:IsDescendantOf(Body) or Cam.CameraSubject:IsDescendantOf(Plr) then
				local Dist = nil;
				local Diff = nil;
				if not MseGuide then	
					Dist = (Head.CFrame.p-CamCF.p).magnitude
					Diff = Head.CFrame.Y-CamCF.Y
					if not IsR6 then	
						Neck.C0 = Neck.C0:lerp(NeckOrgnC0*Ang((aSin(Diff/Dist)*HeadVertFactor), -(((HdPos-CamCF.p).Unit):Cross(TrsoLV)).Y*HeadHorFactor, 0), UpdateSpeed/2)
						Waist.C0 = Waist.C0:lerp(WaistOrgnC0*Ang((aSin(Diff/Dist)*BodyVertFactor), -(((HdPos-CamCF.p).Unit):Cross(TrsoLV)).Y*BodyHorFactor, 0), UpdateSpeed/2)
					else	
						Neck.C0 = Neck.C0:lerp(NeckOrgnC0*Ang(-(aSin(Diff/Dist)*HeadVertFactor), 0, -(((HdPos-CamCF.p).Unit):Cross(TrsoLV)).Y*HeadHorFactor),UpdateSpeed/2)
					end
				else
					local Point = Mouse.Hit.p
					Dist = (Head.CFrame.p-Point).magnitude
					Diff = Head.CFrame.Y-Point.Y
					if not IsR6 then
						Neck.C0 = Neck.C0:lerp(NeckOrgnC0*Ang(-(aTan(Diff/Dist)*HeadVertFactor), (((HdPos-Point).Unit):Cross(TrsoLV)).Y*HeadHorFactor, 0), UpdateSpeed/2)
						Waist.C0 = Waist.C0:lerp(WaistOrgnC0*Ang(-(aTan(Diff/Dist)*BodyVertFactor), (((HdPos-Point).Unit):Cross(TrsoLV)).Y*BodyHorFactor, 0), UpdateSpeed/2)
					else
						Neck.C0 = Neck.C0:lerp(NeckOrgnC0*Ang((aTan(Diff/Dist)*HeadVertFactor), 0, (((HdPos-Point).Unit):Cross(TrsoLV)).Y*HeadHorFactor), UpdateSpeed/2)
					end
				end
			end
		end
	end
	if TurnCharacterToMouse == true then
		Hum.AutoRotate = false
		Core.CFrame = Core.CFrame:lerp(CFrame.new(Core.Position, Vector3.new(Mouse.Hit.p.x, Core.Position.Y, Mouse.Hit.p.z)), UpdateSpeed / 2)
	else
		Hum.AutoRotate = true
	end
end)
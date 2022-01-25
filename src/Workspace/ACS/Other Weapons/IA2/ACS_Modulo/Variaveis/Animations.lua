local ts = game:GetService('TweenService')
local module = {

--//Client Animations
		IdleAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = require(script.Parent.Settings).RightPos}):Play() -- require(script).FakeRightPos (For fake arms) | require(script).RightArmPos (For real arms)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = require(script.Parent.Settings).LeftPos}):Play() -- require(script).FakeLeftPos (For fake arms) | require(script).LeftArmPos (For real arms)	
		end;
		
		StanceDown = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(1.2,-0.05,-1.65) * CFrame.Angles(math.rad(-90),math.rad(35),math.rad(-25))}):Play()
			wait(0.3)	
		end;

		StanceUp = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-.875, -1.85, -1.25) * CFrame.Angles(math.rad(-160), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(.8,-0.6,-1.15) * CFrame.Angles(math.rad(-170),math.rad(60),math.rad(15))}):Play()
			wait(0.3)	
		end;
		
		Patrol = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.75, -.9, -1.6) * CFrame.Angles(math.rad(-80), math.rad(-70), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(0.75,0.75,-1) * CFrame.Angles(math.rad(-90),math.rad(-45),math.rad(-25))}):Play()
			wait(0.3)	
		end;

		SprintAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(1.2,-0.05,-1.65) * CFrame.Angles(math.rad(-90),math.rad(35),math.rad(-25))}):Play()
			wait(0.3)
		end;

		EquipAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0),{C1 = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0),{C1 = CFrame.new(1.2,-0.05,-1.65) * CFrame.Angles(math.rad(-90),math.rad(35),math.rad(-25))}):Play()
			wait(0.1)
			objs[5].Handle:WaitForChild("AimUp"):Play()
			ts:Create(objs[2],TweenInfo.new(0.5),{C1 = require(script.Parent.Settings).RightPos}):Play()
			ts:Create(objs[3],TweenInfo.new(0.5),{C1 = require(script.Parent.Settings).LeftPos}):Play()
			wait(0.5)
		end;

		ZoomAnim = function(char, speed, objs)
			--ts:Create(objs[2],TweenInfo.new(0),{C1 = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.65, -0.7, -1)*CFrame.Angles(math.rad(-180), 0, 0)*CFrame.Angles(0, 0, math.rad(30))}):Play()
			wait(0.3)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.25, -1.1, -1)*CFrame.Angles(math.rad(-180), 0, 0)*CFrame.Angles(0, 0, math.rad(5))}):Play()
			ts:Create(objs[5].g33:WaitForChild("g33"),TweenInfo.new(0.3),{C1 = CFrame.new(-0.2, 0.21, 0)*CFrame.Angles(0, 0, math.rad(90))*CFrame.new(0.225, -0.75, 0)}):Play()
			wait(0.3)
		end;

		UnZoomAnim = function(char, speed, objs)
			--ts:Create(objs[2],TweenInfo.new(0),{C1 = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.25, -1.1, -1)*CFrame.Angles(math.rad(-180), 0, 0)*CFrame.Angles(0, 0, math.rad(5))}):Play()
			wait(0.3)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.65, -0.7, -1)*CFrame.Angles(math.rad(-180), 0, 0)*CFrame.Angles(0, 0, math.rad(30))}):Play()
			ts:Create(objs[5].g33:WaitForChild("g33"),TweenInfo.new(0.3),{C1 = CFrame.new()}):Play()
			wait(0.3)
		end;

		ChamberAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = require(script.Parent.Settings).RightPos}):Play()
			ts:Create(objs[3],TweenInfo.new(0.35),{C1 = CFrame.new(0.1,0.15,-1.4) * CFrame.Angles(math.rad(-120),math.rad(15),math.rad(15))}):Play()
			wait(0.35)	
			objs[5].Bolt:WaitForChild("SlidePull"):Play()
			ts:Create(objs[3],TweenInfo.new(0.25),{C1 = CFrame.new(0.05,-0.25,-1.15) * CFrame.Angles(math.rad(-120),math.rad(15),math.rad(15))}):Play()
			ts:Create(objs[5].Handle:WaitForChild("Bolt"),TweenInfo.new(0.25),{C0 = CFrame.new(objs[6].BoltExtend) * CFrame.Angles(0,math.rad(0),0)}):Play()
			ts:Create(objs[5].Handle:WaitForChild("Slide"),TweenInfo.new(0.25),{C0 = CFrame.new(objs[6].SlideExtend) * CFrame.Angles(0,math.rad(0),0)}):Play()
			wait(0.3)
			objs[5].Bolt:WaitForChild("SlideRelease"):Play()
			ts:Create(objs[5].Handle:WaitForChild("Bolt"),TweenInfo.new(0.1),{C0 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(0),0)}):Play()
			ts:Create(objs[5].Handle:WaitForChild("Slide"),TweenInfo.new(0.1),{C0 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(0),0)}):Play()
		end;

		ChamberBKAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.875, -0.465, -0.9) * CFrame.Angles(math.rad(-95), math.rad(-2), math.rad(7.5))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(0.1,-0.15,-1.115) * CFrame.Angles(math.rad(-110),math.rad(25),math.rad(0))}):Play()
			wait(0.3)	
			objs[5].Bolt:WaitForChild("SlideRelease"):Play()
			ts:Create(objs[3],TweenInfo.new(0.15),{C1 = CFrame.new(0.1,-0.15,-1.025) * CFrame.Angles(math.rad(-100),math.rad(30),math.rad(0))}):Play()
			ts:Create(objs[5].Handle:WaitForChild("Bolt"),TweenInfo.new(0.1),{C0 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(0),0)}):Play()
			ts:Create(objs[5].Handle:WaitForChild("Slide"),TweenInfo.new(0.1),{C0 = CFrame.new(0,0,0) * CFrame.Angles(0,math.rad(0),0)}):Play()
			wait(0.15)
		end;
		
		CheckAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.875, 0, -1.15) * CFrame.Angles(math.rad(-95), math.rad(-2), math.rad(7.5))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.5,0.475,-1.6) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			wait(.35)
			local MagC = objs[5]:WaitForChild("Mag"):clone()
				objs[5].Mag.Transparency = 1
				MagC.Parent = objs[5]
				MagC.Name = "MagC"
				MagC.Transparency = 0			

			local MagCW = Instance.new("Motor6D")
				MagCW.Part0 = MagC
				MagCW.Part1 = objs[3].Parent.Parent:WaitForChild("Left Arm")
				MagCW.Parent = MagC
				MagCW.C1 = MagC.CFrame:toObjectSpace(objs[3].Parent.Parent:WaitForChild("Left Arm").CFrame)
			ts:Create(MagCW,TweenInfo.new(0),{C0 = CFrame.new(-0.2, 0.5, -0.75) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.45,0.475,-2.05) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			objs[5].Handle:WaitForChild("MagOut"):Play()
			wait(0.3)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(0.15,0.475,-1.5) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(0))}):Play()
			wait(1.5)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.45,0.475,-2.05) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			wait(0.3)
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.5,0.475,-1.6) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			objs[5].Handle:WaitForChild("MagIn"):Play()
			MagC:Destroy()
			objs[5].Mag.Transparency = 0	
			wait(0.3)
		end;
		
		ShellInsertAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.975, -0.365, -1.2) * CFrame.Angles(math.rad(-115), math.rad(-2), math.rad(9))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(1.55,-0.4,-1.15) * CFrame.Angles(math.rad(-100),math.rad(70),math.rad(-41))}):Play()
			wait(0.3)
			objs[5].Handle:WaitForChild("ShellInsert"):Play()
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.975, -0.365, -1.2) * CFrame.Angles(math.rad(-110), math.rad(-2), math.rad(9))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(1.6,-0.3,-1.1) * CFrame.Angles(math.rad(-100),math.rad(70),math.rad(-41))}):Play()
			objs[6].Value = objs[6].Value - 1
			objs[7].Value = objs[7].Value + 1
			wait(0.3)
		end;
		
		ReloadAnim = function(char, speed, objs)
			ts:Create(objs[2],TweenInfo.new(0.3),{C1 = CFrame.new(-0.875, 0, -1.15) * CFrame.Angles(math.rad(-95), math.rad(-2), math.rad(7.5))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.3),{C1 = CFrame.new(-0.5,0.475,-1.6) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			wait(0.5)	
			ts:Create(objs[2],TweenInfo.new(0.5),{C1 = CFrame.new(-0.875, 0, -1.35) * CFrame.Angles(math.rad(-100), math.rad(-2), math.rad(7.5))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.6),{C1 = CFrame.new(1.195,1.4,-0.5) * CFrame.Angles(math.rad(0),math.rad(25),math.rad(0))}):Play()
			objs[5].Mag.Transparency = 1
			objs[5].Handle:WaitForChild("MagOut"):Play()
			
			local MagC = objs[5]:WaitForChild("Mag"):clone()
				MagC.Parent = objs[5]
				MagC.Name = "MagC"
				MagC.Transparency = 0			

			local MagCW = Instance.new("Motor6D")
				MagCW.Part0 = MagC
				MagCW.Part1 = objs[3].Parent.Parent:WaitForChild("Left Arm")
				MagCW.Parent = MagC
				MagCW.C1 = MagC.CFrame:toObjectSpace(objs[3].Parent.Parent:WaitForChild("Left Arm").CFrame)
			ts:Create(MagCW,TweenInfo.new(0),{C0 = CFrame.new(-0.2, 0.5, -0.75) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))}):Play()
			

			wait(1.5)				
			
			
			ts:Create(objs[2],TweenInfo.new(0.4),{C1 = CFrame.new(-0.875, 0, -1.15) * CFrame.Angles(math.rad(-95), math.rad(-2), math.rad(7.5))}):Play()
			ts:Create(objs[3],TweenInfo.new(0.4),{C1 = CFrame.new(-0.5,0.475,-1.6) * CFrame.Angles(math.rad(-100),math.rad(0),math.rad(7.5))}):Play()
			wait(0.5)
			ts:Create(objs[2],TweenInfo.new(0.1),{C1 = CFrame.new(-0.875, 0, -1.125) * CFrame.Angles(math.rad(-95), math.rad(-2), math.rad(7.5))}):Play()
			objs[5].Handle:WaitForChild("MagIn"):Play()
			MagC:Destroy()
			objs[5].Mag.Transparency = 0	

			if (objs[6].Value - (objs[8].Ammo - objs[7].Value)) < 0 then
				objs[7].Value = objs[7].Value + objs[6].Value
				objs[6].Value = 0
				--Evt.Recarregar:FireServer(objs[5].Value)

			elseif objs[7].Value <= 0 then
				objs[6].Value = objs[6].Value - (objs[8].Ammo - objs[7].Value)
				--Evt.Recarregar:FireServer(objs[5].Value)
				objs[7].Value = objs[8].Ammo
				objs[9] = false

			elseif objs[7].Value > 0 and objs[9] and objs[8].IncludeChamberedBullet then
				objs[6].Value = objs[6].Value - (objs[8].Ammo - objs[7].Value) - 1
				--objs[10].Recarregar:FireServer(objs[6].Value)
				objs[7].Value = objs[8].Ammo + 1

			elseif objs[7].Value > 0 and objs[9] and not objs[8].IncludeChamberedBullet then
				objs[6].Value = objs[6].Value - (objs[8].Ammo - objs[7].Value)
				--Evt.Recarregar:FireServer(objs[5].Value)
				objs[7].Value = objs[8].Ammo
			end
			wait(0.55)
		end;
--//Server Animations
	RightHighReady = CFrame.new(-1, -1, -1.5) * CFrame.Angles(math.rad(-160), math.rad(0), math.rad(0));
	LeftHighReady = CFrame.new(.85,-0.35,-1.15) * CFrame.Angles(math.rad(-170),math.rad(60),math.rad(15));

	RightLowReady = CFrame.new(-1, 0.5, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0));
	LeftLowReady = CFrame.new(1.25,1.15,-1.35) * CFrame.Angles(math.rad(-60),math.rad(35),math.rad(-25));

	RightPatrol = CFrame.new(-1, -.35, -1.5) * CFrame.Angles(math.rad(-80), math.rad(-80), math.rad(0));
	LeftPatrol = CFrame.new(1,1.25,-.75) * CFrame.Angles(math.rad(-90),math.rad(-45),math.rad(-25));

	RightAim = CFrame.new(-.575, 0.1, -1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0));
	LeftAim = CFrame.new(1.4,0.25,-1.45) * CFrame.Angles(math.rad(-120),math.rad(35),math.rad(-25));
	
	RightSprint = CFrame.new(-1, 0.5, -1.25) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0));
	LeftSprint = CFrame.new(1.25,1.15,-1.35) * CFrame.Angles(math.rad(-60),math.rad(35),math.rad(-25));

	ShootPos = CFrame.new(0,0,.25);
	
}

return module

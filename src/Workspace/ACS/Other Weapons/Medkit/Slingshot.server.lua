Tool = script.Parent
VELOCITY = 50 -- constant
loaded=false

local Pellet = Tool.Handle:Clone()
Tool.PelletScript:Clone().Parent = Pellet


function fire(mouse_pos)
Tool.Parent.Torso["Right Shoulder"].MaxVelocity = 0.7
Tool.Parent.Torso["Right Shoulder"].DesiredAngle = 3.6
wait(.1)
Tool.Parent.Torso["Right Shoulder"].MaxVelocity = 1
Tool.Handle.Transparency=1
	Tool.Handle.Fire:play()

-- find player's head pos

	local vCharacter = Tool.Parent
	local vPlayer = game.Players:playerFromCharacter(vCharacter)

	local head = vCharacter:findFirstChild("Head")
	if head == nil then return end

	local dir = head.CFrame.LookVector

	--local launch = head.Position + 5 * dir

	--local delta = mouse_pos - launch
	
	--local dy = delta.y
	
	--local new_delta = Vector3.new(delta.x, 0, delta.z)
	--delta = new_delta

	--local dx = delta.magnitude
	--local unit_delta = delta.unit
	
	-- acceleration due to gravity in RBX units
	local g = (-9.81 * 20)

	

	local missile = Pellet:clone()
        

	Tool.Handle.Mesh:clone().Parent = missile
		

	missile.Position = head.Position + 5 * dir
	missile.Velocity = dir * VELOCITY
	missile.RotVelocity = Vector3.new(5,0,0)

	missile.PelletScript.Disabled = false

	missile.Parent = game.Workspace

end


function computeLaunchAngle(dx,dy,grav)
	-- arcane
	-- http://en.wikipedia.org/wiki/Trajectory_of_a_projectile
	
	local g = math.abs(grav)
	local inRoot = (VELOCITY*VELOCITY*VELOCITY*VELOCITY) - (g * ((g*dx*dx) + (2*dy*VELOCITY*VELOCITY)))
	if inRoot <= 0 then
		return .25 * math.pi
	end
	local root = math.sqrt(inRoot)
	local inATan1 = ((VELOCITY*VELOCITY) + root) / (g*dx)

	local inATan2 = ((VELOCITY*VELOCITY) - root) / (g*dx)
	local answer1 = math.atan(inATan1)
	local answer2 = math.atan(inATan2)
	if answer1 < answer2 then return answer1 end
	return answer2
end

function computeDirection(vec)
	local lenSquared = vec.magnitude * vec.magnitude
	local invSqrt = 1 / math.sqrt(lenSquared)
	return Vector3.new(vec.x * invSqrt, vec.y * invSqrt, vec.z * invSqrt)
end




Tool.Enabled = true
function onActivated()
	if not Tool.Enabled then
		return
	end

	Tool.Enabled = false

	local character = Tool.Parent;
	local humanoid = character.Humanoid
	if humanoid == nil then
		print("Humanoid not found")
		return 
	end



	local targetPos = humanoid.TargetPoint

	fire(targetPos)
	wait(3)
	
	if (Tool.Parent:FindFirstChild("Torso") ~= nil) then
		Tool.Parent.Torso["Right Shoulder"].MaxVelocity = 0.6
		Tool.Parent.Torso["Right Shoulder"].DesiredAngle = -3.6
	end
		wait(.1)
	Tool.Handle.Transparency=0
	wait(.1)
	Tool.Enabled = true


end

script.Parent.Activated:connect(onActivated)

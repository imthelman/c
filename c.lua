print("a")

local char = game:GetService("Players").LocalPlayer.Character

for i,v in pairs(char:GetChildren()) do
	if v.Name == "MeshPartAccessory" then
		for x,y in pairs(v:WaitForChild("Handle"):GetDescendants()) do
			if y:IsA("SpecialMesh") then
				local meshid = y.MeshId
				if meshid == 'rbxassetid://13415096670' then
					v.Name = "Right Arm _glitcherhats"
				elseif meshid == 'rbxassetid://13421705040' then
					v.Name = "Left Arm _glitcherhats"
				elseif meshid == 'rbxassetid://13421836805' then
					v.Name = "Right Leg _glitcherhats"
				elseif meshid == 'rbxassetid://13421798868' then
					v.Name = "Left Leg _glitcherhats"
				elseif meshid == 'rbxassetid://13421774668' then
					v.Name = "Torso _glitcherhats"
				end
			end
		end
	end
end

local Global = (getgenv and getgenv()) or getfenv(0)
local Rad = math.rad
local r = Rad
Global.ReanimateSettings = {
    AntiSleep = true, -- Recommended: True
    AntiVoid = true, -- Recommended: True
    NoClip = false, -- Recommended: False
    DynamicalVelocity = true, -- Recommended: True
    Animations = false, -- Recommended: False for scripts / Other than that True.
    ToolFling = true, -- Recommended: Up to you.
    NewRunServiceEvents = true, -- Recommended: True
    KeepCharacter = false, -- Recommended: false
    ExtraOptimization = true, -- Recommended: Up to you.
    EagerBulkExecution = true, -- Recommended (various by pc) low end: false | medium-high: true

    DefinedHats = { -- true: MeshId, false = TextureId
        ['Torso1'] = {'rbxassetid://13421774668', CFrame.new(0,0,0), CFrame.Angles(Rad(180),0,0), true},
        ['Torso2'] = {'nil', CFrame.new(0,0,0), CFrame.Angles(0,0,0), false},

        ['Right Arm'] = {'rbxassetid://13415096670', CFrame.new(0,0,0), CFrame.Angles(r(67),r(-25),r(3)), true},
        ['Left Arm'] = {'rbxassetid://13421705040', CFrame.new(0,0,0), CFrame.Angles(r(64),r(21.2),r(5)), true},
        ['Right Leg'] = {'rbxassetid://13421836805', CFrame.new(0,0.1,0), CFrame.Angles(r(120),r(-5),r(30.1)), true},
        ['Left Leg'] = {'rbxassetid://13421798868', CFrame.new(0,-0.05,0), CFrame.Angles(r(120),r(-2),r(-40.5)), true},
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/toldblock/GelatekReanimateV2/main/Releases/Update1.lua"))()

--Tool Fling
--[[local Global = (getgenv and getgenv()) or getfenv(0)
local ReanimateData = Global.ReanimateData

local CA = CFrame.Angles
local Random = math.random

local isnetworkowner = isnetworkowner or function(Part)
	return Part.ReceiveAge == 0
end

local RunService = game:GetService("RunService")
local Client = game:GetService("Players").LocalPlayer
local Character = Client.Character
local RootPart = Character:WaitForChild("HumanoidRootPart", 10)
local Mouse = Client:GetMouse()

local Bullet = ReanimateData.FlingPart
warn(Bullet.Name)
local Connections = ReanimateData.Connections
ReanimateData.FlingEnabled = true
local Flinging = false
table.insert(Connections, Mouse.Button1Down:Connect(function()
	Flinging = true
end))

table.insert(Connections, Mouse.Button1Up:Connect(function()
	Flinging = false
end))
local OffsetDown = CFrame.new(0, -12, 0)
local Rotation = CA(Random(-360,360),Random(-360,360),Random(-360,360))
local V3 = Vector3.new
table.insert(Connections, RunService.Heartbeat:Connect(function()
	Rotation = CA(Random(-360,360),Random(-360,360),Random(-360,360))
	if (Bullet and isnetworkowner(Bullet)) then
		if Flinging then
			Bullet.RotVelocity = V3(0,7500,0)
			if Mouse.Target ~= nil then
				Bullet.CFrame = Mouse.Hit * Rotation
			end
		else
			Bullet.RotVelocity = V3(0,Random(0, 30),0)
			Bullet.CFrame = RootPart.CFrame * OffsetDown * Rotation
		end
	end
end))]]
wait(2.5)
--Variables
local osclock=os.clock
local sine=osclock()
local lastsine=sine
local clamp=math.clamp
local sin=math.sin
local abs=math.abs
local rad=math.rad
local cf=CFrame.new
local angles=CFrame.Angles
local lp = game:GetService("Players").LocalPlayer
local Character = lp.Character
local c = Character
local RootPart = Character:WaitForChild("HumanoidRootPart")
local rp = RootPart
local mode = "Chill"
local Anim = "Idle"

--AnimationVariables
local RightHip = c.Torso["Right Hip"]
local LeftHip = c.Torso["Left Hip"]
local RightShoulder = c.Torso["Right Shoulder"]
local LeftShoulder = c.Torso["Left Shoulder"]
local RootJoint = rp["RootJoint"]
local Neck = c.Torso["Neck"]

--Functions
function newmode(key, name, ws, jp)

end

function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end

--Anims and stuff
while true do
	sine=osclock()
	local delta=sine-lastsine
	deltaTime=clamp(delta*10,0,1)
	lastsine=sine
    local torvel = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
	local velderp = RootPart.Velocity.y
    hitfloor, posfloor = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0)).lookVector, 4, Character)

    if RootPart.Velocity.y > 1 and hitfloor == nil then
		Anim = "Jump"
    elseif RootPart.Velocity.y < -1 and hitfloor == nil then
		Anim = "Fall"
    elseif torvel < 1 and hitfloor ~= nil then
		Anim = "Idle"
    elseif torvel > 2 and torvel < 22 and hitfloor ~= nil then
		Anim = "Walk"
    elseif torvel >= 22 and hitfloor ~= nil then
		Anim = "Run"
    end
	if mode == "Chill" and Anim == "Idle" then
		RightHip.C0=RightHip.C0:Lerp(cf(0.5,-1-0.15*sin(sine*2),0.5)*angles(0,0,0.08726646259971647+0.08726646259971647*sin((sine-1999998)*2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.6+0.1*sin(sine*2),-0.5)*angles(0,0,-0.17453292519943295+0.08726646259971647*sin((sine+1999998)*2)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,0.15961408615112305,-0.3751012086868286)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1+0.15*sin((sine + 0.2)*2),0)*angles(-1.5271630954950384+0.04363323129985824*sin(sine*2),0,3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.5,-1-0.15*sin(sine*2),0.5)*angles(0,0,-0.08726646259971647+0.08726646259971647*sin((sine+199999999999998)*2)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*2),0.17453292519943295*sin(sine*1),3.141592653589793),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.6+0.1*sin(sine*2),-0.5)*angles(0,0,0.17453292519943295+0.08726646259971647*sin((sine-19999998)*-2)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.01117706298828125,-0.05389392375946045,-0.8308497667312622)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
	elseif mode == "Chill" and Anim == "Walk" then
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.6+0.1*sin(sine*-2),-0.5)*angles(0.7853981633974483*sin(sine*-2),0,0.17453292519943295+0.08726646259971647*sin((sine-19999998)*-2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.6+0.1*sin(sine*2),-0.5)*angles(0.7853981633974483*sin(sine*2),0,-0.17453292519943295+0.08726646259971647*sin((sine+1999998)*2)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,0.15961408615112305,-0.3751012086868286)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.01117706298828125,-0.05389392375946045,-0.8308497667312622)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0.17453292519943295*sin(sine*2),3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.5,-1-0.15*sin(sine*2),0.5)*angles(0.7853981633974483*sin(sine*-2),0,-0.08726646259971647+0.08726646259971647*sin((sine+199999999999998)*2)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(0.5,-1-0.15*sin(sine*2),0.5)*angles(0.7853981633974483*sin(sine*2),0,0.08726646259971647+0.08726646259971647*sin((sine+999999999)*2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1+0.15*sin((sine + 0.2)*4),0)*angles(-1.5271630954950384+0.04363323129985824*sin(sine*2),0,3.141592653589793),deltaTime) 
	elseif mode == "Chill" and Anim == "Fall" then
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.6+0.1*sin(sine*-2),0.5)*angles(3.141592653589793+0.2617993877991494*sin((sine+2930857423908457000)*2),0,0.17453292519943295+0.2617993877991494*sin((sine-19999998)*-2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.6+0.1*sin(sine*2),0.5)*angles(3.141592653589793+0.2617993877991494*sin((sine+4982375098539)*2),0,-0.17453292519943295+0.2617993877991494*sin((sine+1999998)*2)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,0.15961408615112305,-0.3751012086868286)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.01117706298828125,-0.05389392375946045,-0.8308497667312622)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.007128639793479+0.08726646259971647*sin(sine*4),0.17453292519943295*sin(sine*2),3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.5,-1-0.15*sin(sine*2),0.5)*angles(-0.4363323129985824+0.08726646259971647*sin((sine+1908374123125)*2),0,-0.08726646259971647+0.08726646259971647*sin((sine+199999999999998)*2)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(0.5,-1-0.15*sin(sine*2),0.5)*angles(-0.4363323129985824+0.08726646259971647*sin((sine+12355745)*2),0,0.08726646259971647+0.08726646259971647*sin((sine+999999999)*2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.25,0)*angles(-1.8325957145940461+0.04363323129985824*sin(sine*2),0,3.141592653589793),deltaTime) 
	elseif mode == "Chill" and Anim == "Jump" then
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,1+0.1*sin(sine*-2),0)*angles(2.356194490192345+0.2617993877991494*sin((sine+67845)*2),0,0.17453292519943295+0.2617993877991494*sin((sine-19999998)*-2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,1+0.1*sin(sine*2),0)*angles(2.356194490192345+0.2617993877991494*sin((sine+1235765)*2),0,-0.17453292519943295+0.2617993877991494*sin((sine+1999998)*2)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,0.15961408615112305,-0.3751012086868286)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		--AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.01117706298828125,-0.05389392375946045,-0.8308497667312622)*angles(0,0,31415926535.89793*sin(sine*4.e-11)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0.17453292519943295*sin(sine*2),3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.5,-1-0.15*sin(sine*2),0.5)*angles(0,0,-0.08726646259971647+0.08726646259971647*sin((sine+199999999999998)*2)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(0.5,-1-0.15*sin(sine*2),0.5)*angles(0,0,0.08726646259971647+0.08726646259971647*sin((sine+999999999)*2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1,0)*angles(-1.6580627893946132+0.04363323129985824*sin(sine*2),0,3.141592653589793),deltaTime) 
	end
	task.wait()
end
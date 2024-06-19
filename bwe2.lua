local HttpService = game:GetService("HttpService")
local SoundsList = HttpService:JSONDecode(HttpService:GetAsync("https://raw.githubusercontent.com/UnknownUser5820/SoundList/main/Sounds.json"))
function SoundReplace(Id)
	if SoundsList[tostring(Id)] then
		return SoundsList[tostring(Id)]
	else
		return Id
	end
end

--Undyne



local Client=NLS([[
	local HeadCameraFollowing=true
	local Player=game:GetService("Players").LocalPlayer
	local HeadCamFollow=coroutine.wrap(function()
		local Head=Player.Character.Head
		local HRP=Player.Character.HumanoidRootPart
		local Hum=Player.Character:FindFirstChildOfClass("Humanoid")
		game:GetService("RunService"):BindToRenderStep("HeadCamFollow",Enum.RenderPriority.Character.Value,function()
			local CF=Head.CFrame:ToObjectSpace(HRP.CFrame*CFrame.new(0,1.5,0))
			Hum.CameraOffset=Hum.CameraOffset:Lerp(Vector3.new(-CF.X,-CF.Y,-CF.Z),.15)
		end)
	end)
	if HeadCameraFollowing then
		HeadCamFollow()
	end
]],owner.Character)
--Srry vlad i use ur HeadcameraFollowing pls dont hate me
if game:GetService("RunService"):IsClient() then error("Please run as a server script. Use h/ instead of hl/.") end
print("FE Compatibility: by WaverlyCole & Mokiros")
InternalData = {}
do
	script.Parent = owner.Character
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput"
	local function NewFakeEvent()
		local Fake = {fakeEvent=true,Connect=function(self,Func)self.Function=Func end}Fake.connect = Fake.Connect
		return Fake
	end
	local Mouse = {Target=nil,Hit=CFrame.new(),KeyUp=NewFakeEvent(),KeyDown=NewFakeEvent(),Button1Up=NewFakeEvent(),Button1Down=NewFakeEvent()}
	local UserInputService = {InputBegan=NewFakeEvent(),InputEnded=NewFakeEvent()}
	local ContextActionService = {Actions={},BindAction = function(self,actionName,Func,touch,...)
		self.Actions[actionName] = Func and {Name=actionName,Function=Func,Keys={...}} or nil
	end};ContextActionService.UnBindAction = ContextActionService.BindAction
	local function TriggerEvent(self,Event,...)
		local Trigger = Mouse[Event]
		if Trigger and Trigger.fakeEvent and Trigger.Function then
			Trigger.Function(...)
		end
	end
	Mouse.TrigEvent = TriggerEvent
	UserInputService.TrigEvent = TriggerEvent
	Event.OnServerEvent:Connect(function(FiredBy,Input)
		if FiredBy.Name ~= owner.Name then end
		if Input.MouseEvent then
			Mouse.Target = Input.Target
			Mouse.Hit = Input.Hit
		else
			local Begin = Input.UserInputState == Enum.UserInputState.Begin
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				return Mouse:TrigEvent(Begin and "Button1Down" or "Button1Up")
			end
			for _,Action in pairs(ContextActionService.Actions) do
				for _,Key in pairs(Action.Keys) do
					if Key==Input.KeyCode then
						Action.Function(Action.Name,Input.UserInputState,Input)
					end
				end
			end
			Mouse:TrigEvent(Begin and "KeyDown" or "KeyUp",Input.KeyCode.Name:lower())
			UserInputService:TrigEvent(Begin and "InputBegan" or "InputEnded",Input,false)
		end
	end)
	InternalData["Mouse"] = Mouse
	InternalData["ContextActionService"] = ContextActionService
	InternalData["UserInputService"] = UserInputService
	Event.Parent = NLS([[
		local Player = owner
		local Event = script:WaitForChild("UserInput")
		local UserInputService = game:GetService("UserInputService")
		local Mouse = Player:GetMouse()
		local Input = function(Input,gameProcessedEvent)
			if gameProcessedEvent then return end
			Event:FireServer({KeyCode=Input.KeyCode,UserInputType=Input.UserInputType,UserInputState=Input.UserInputState})
		end
		UserInputService.InputBegan:Connect(Input)
		UserInputService.InputEnded:Connect(Input)
		local Hit,Target
		while wait(1/30) do
			if Hit ~= Mouse.Hit or Target ~= Mouse.Target then
				Hit,Target = Mouse.Hit,Mouse.Target
				Event:FireServer({["MouseEvent"]=true,["Target"]=Target,["Hit"]=Hit})
			end
		end
	]],owner.Character)
end
RealGame = game;game = setmetatable({},{
	__index = function (self,Index)
		local Sandbox = function (Thing)
			if Thing:IsA("Player") then
				local RealPlayer = Thing
				return setmetatable({},{
					__index = function (self,Index)
						local Type = type(RealPlayer[Index])
						if Type == "function" then
							if Index:lower() == "getmouse" or Index:lower() == "mouse" then
								return function (self)
									return InternalData["Mouse"]
								end
							end
							return function (self,...)
								return RealPlayer[Index](RealPlayer,...)
							end
						else
							if Index == "PlrObj" then
								return RealPlayer
							end
							return RealPlayer[Index]
						end
					end;
					__tostring = function(self)
						return RealPlayer.Name
					end
				})
			end
		end
		if RealGame[Index] then
			local Type = type(RealGame[Index])
			if Type == "function" then
				if Index:lower() == "getservice" or Index:lower() == "service" then
					return function (self,Service)
						if Service:lower() == "players" then
							return setmetatable({},{
								__index = function (self2,Index2)
									local RealService = RealGame:GetService(Service)
									local Type2 = type(Index2)
									if Type2 == "function" then
										return function (self,...)
											return RealService[Index2](RealService,...)
										end
									else
										if Index2:lower() == "localplayer" then
											return Sandbox(owner)
										end
										return RealService[Index2]
									end
								end;
								__tostring = function(self)
									return RealGame:GetService(Service).Name
								end
							})
						elseif Service:lower() == "contextactionservice" then
							return InternalData["ContextActionService"]
						elseif Service:lower() == "contextactionservice" then
							return InternalData["UserInputService"]
						elseif Service:lower() == "runservice" then
							return setmetatable({},{
								__index = function(self2,Index2)
									local RealService = RealGame:GetService(Service)
									local Type2 = type(Index2)
									if Type2 == "function" then
										return function (self,...)
											return RealService[Index2](RealService,...)
										end
									else
										if Index2:lower() == "bindtorenderstep" then
											return function (self,Name,Priority,Function)
												return RealGame:GetService("RunService").Stepped:Connect(Function)
											end
										end
										if Index2:lower() == "renderstepped" then
											return RealService["Stepped"]
										end
										return RealService[Index2]
									end
								end
							})
						else
							return RealGame:GetService(Service)
						end
					end
				end
				return function (self,...)
					return RealGame[Index](RealGame,...)
				end
			else
				if game:GetService(Index) then
					return game:GetService(Index)
				end
				return RealGame[Index]
			end
		else
			return nil
		end
	end
});Game = game;owner = game:GetService("Players").LocalPlayer;script = {}
print("Complete! Running...")


wait(0.5)



warn([[IDK
Script Status: aaaa

Created by SincereProdeadZ
Well need more work sad




Music Player commands:

play [ID]
pitch [Pitch]
vol [Vol]
global
local
pause or continue
restart
]])




warn([[I recommend use the volume in .5 or .7]])






local Player = game:GetService("Players").LocalPlayer
plr = game:GetService("Players").LocalPlayer
char = plr.Character
hum = char.Humanoid
workspace.CurrentCamera.Focus = owner.Character.Head.CFrame
local cam = game.Workspace.CurrentCamera
Cam = game.workspace.CurrentCamera
Camera = cam
local Player_Size = 1
local CamInterrupt = false
local TwoD = false
local TargetInfo = {nil, nil}
cam.CameraType = "Custom"
t = char.Torso
Torso2 = char.Torso
h = char.Head
ra = char["Right Arm"]
la = char["Left Arm"]
rl = char["Right Leg"]
ll = char["Left Leg"]
tors = char.Torso
lleg = char["Left Leg"]
root = char.HumanoidRootPart
hed = char.Head
rleg = char["Right Leg"]
rarm = char["Right Arm"]
larm = char["Left Arm"]
radian = math.rad
Rad = math.rad
vt = Vector3.new
BRICKC = BrickColor.new
random = math.random
Vec3 = Vector3.new
Inst = Instance.new
cFrame = CFrame.new
Euler = CFrame.fromEulerAnglesXYZ
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
c3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
ceuler = CFrame.fromEulerAnglesXYZ



chr=plr.Character
Head=chr.Head
Root=chr.HumanoidRootPart
Torso=chr.Torso
RArm=chr["Right Arm"]
LArm=chr["Left Arm"]
RLeg=chr["Right Leg"]
LLeg=chr["Left Leg"]
RJ=Root.RootJoint
Neck=Torso.Neck
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
modecolor={"Fossil","Bright red"}


BrickC = BrickColor.new
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor
mouse=Player:GetMouse()
local Booleans = {
	CamFollow = true,
	GyroUse = true
}


local speed = 3
local MRC_A = BrickColor.new("Cyan")
local MRC_B = BrickColor.new("Really black")
ruin = 1

















NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end




local Sitt = false
function lerp(object, newCFrame, alpha)
	return object:lerp(newCFrame, alpha)
end

local Directer = Inst("BodyGyro", root)
Directer.MaxTorque = Vec3(0, 0, 0)
Directer.P = 600000
local CPart = Inst("Part")
CPart.Anchored = true
CPart.CanCollide = false
CPart.Locked = true
CPart.Transparency = 1

local rainbowmode = false
local chaosmode = false

local ORGID = 394334631
local ORVOL = 7
local ORPIT = 1
local mode = 0
-------------------------------------------------------
--Start Anti Nosounds
-------------------------------------------------------
local GlitchS
spawn(function()
	while wait() do
		if not root:FindFirstChild('GlitchS') then
			Theme = Instance.new("Sound")
			Theme.Parent = root
			Theme.SoundId = "rbxassetid://1881119483"
			Theme.Volume = 0
			Theme.Name = "GlitchS"
			Theme.Looped = true
			Theme.Pitch = 1
			Theme:Play()
			-----------------
			GlitchS = sound2
		end
	end
end)


function newTheme(ID,timepos,pitch,vol)
	local kmusicz = music
	--kmusicz:Stop()
	kmusicz.Volume = vol
	--kmusicz.TimePosition = timepos
	kmusicz.PlaybackSpeed = pitch
	kmusicz.Pitch = pitch
	kmusicz.SoundId = ID
	kmusicz.Name = "wrecked"
	kmusicz.Looped = true
	currentThemePlaying = kmusicz.SoundId
	currentVol = kmusicz.Volume
	currentPitch = kmusicz.Pitch
	--kmusicz:Play()
	--coroutine.resume(coroutine.create(function()
	--wait(0.05)
	--end))
end


function newThemeCust(ID,timepos,pitch,vol)
	local kmusicz = music
	kmusicz:Stop()
	kmusicz.Volume = vol
	kmusicz.TimePosition = timepos
	kmusicz.PlaybackSpeed = pitch
	kmusicz.Pitch = pitch
	kmusicz.SoundId = ID
	kmusicz.Name = "wrecked"
	kmusicz.Looped = true
	currentThemePlaying = kmusicz.SoundId
	currentVol = kmusicz.Volume
	currentPitch = kmusicz.Pitch
	kmusicz:Play()
	coroutine.resume(coroutine.create(function()
		wait(0.05)
	end))
end

local mutedtog = false

function CameraEnshaking(Length,Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1*Intensity
		local rotM = 0.01*Intensity
		for i = 0, Length, 0.1 do
			swait()
			intensity = intensity - 0.05*Intensity/Length
			rotM = rotM - 0.0005*Intensity/Length
			hum.CameraOffset = Vec3(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity)))
			cam.CFrame = cam.CFrame * cFrame(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity))) * Euler(radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM)
		end
		Humanoid.CameraOffset = Vec3(0, 0, 0)
	end))
end
CamShake=function(Part,Distan,Power,Times) 
	local de=Part.Position
	for i,v in pairs(workspace:children()) do
		if v:IsA("Model") and v:findFirstChild("Humanoid") then
			for _,c in pairs(v:children()) do
				if c.ClassName=="Part" and (c.Position - de).magnitude < Distan then
					local Noob=v.Humanoid
					if Noob~=nil then
						coroutine.resume(coroutine.create(function()
							FV = Instance.new("BoolValue", Noob)
							FV.Name = "CameraShake"
							for ShakeNum=1,Times do
								swait()
								local ef=Power
								if ef>=1 then
									Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef),math.random(-ef,ef),math.random(-ef,ef))
								else
									ef=Power*10
									Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef)/10,math.random(-ef,ef)/10,math.random(-ef,ef)/10)
								end	
							end
							Humanoid.CameraOffset = Vector3.new(0,0,0)
							FV:Destroy()
						end))
						CameraShake(Times, Power, Noob)
					end
				end
			end
		end
	end
end


function chatFunc(msg, timr, col, size)
	spawn(function()
		local namebillboard = Instance.new("BillboardGui")
		local textt = Instance.new("TextBox")
		namebillboard.Size = UDim2.new(6, 0, 1, 0)
		namebillboard.Name = "NameBillboard"
		namebillboard.StudsOffset = Vector3.new(0, 0.75, 2)
		namebillboard.Parent = hed
		textt.TextWrapped = true
		textt.BackgroundTransparency = 1
		textt.BackgroundColor3 = Color3.new(1, 1, 1)
		textt.TextSize = size or 14
		textt.TextScaled = true
		--textt.Font = Enum.Font.Arcade
		textt.Text = msg or ''
		textt.TextStrokeTransparency = 0
		textt.TextStrokeColor3 = Color3.new(1,1,1)
		textt.TextColor = col
		textt.Size = UDim2.new(1, 0, 1, 0)
		textt.Parent = namebillboard
		local RM = math.random(1,2)
		local DR = 0
		for i=1,timr do swait()
			if RM == 1 then
				DR = DR + 1
				namebillboard.StudsOffset = Vector3.new(0, 0.75+2.5*math.sin(DR/(timr/2.5)), 2)
				textt.TextStrokeTransparency = i/timr
				textt.TextTransparency = i/timr
			elseif RM == 2 then
				DR = DR + 1
				namebillboard.StudsOffset = Vector3.new(0, 0.75+2.5*math.sin(DR/(timr/2.5)), 2)
				textt.TextStrokeTransparency = i/timr
				textt.TextTransparency = i/timr
			end
		end
		namebillboard:Destroy()
	end)
end

function chatFunc2(msg, timr, size)
	spawn(function()
		local namebillboard = Instance.new("BillboardGui")
		local textt = Instance.new("TextBox")
		namebillboard.Size = UDim2.new(6, 0, 1, 0)
		namebillboard.Name = "NameBillboard"
		namebillboard.StudsOffset = Vector3.new(0, 0.75, 2)
		namebillboard.Parent = hed
		textt.TextWrapped = true
		textt.BackgroundTransparency = 1
		textt.BackgroundColor3 = Color3.new(1, 1, 1)
		textt.TextSize = size or 14
		textt.TextScaled = true
		textt.Font = Enum.Font.Arcade
		textt.Text = msg or ''
		textt.TextStrokeTransparency = 0
		textt.TextStrokeColor3 = MRC_B.Color
		textt.TextColor = MRC_A
		textt.Size = UDim2.new(1, 0, 1, 0)
		textt.Parent = namebillboard
		for i = 1,string.len(msg),1 do
			textt.Text = string.sub(msg,1,i)
			textt.Text = string.sub(msg,1,i)
			--CFuncs["Sound"].Create("rbxassetid://418252437", Torso, 5,1)
			wait(0.01)
		end
		local RM = math.random(1,2)
		local DR = 0
		for i=1,timr do swait()
			if RM == 1 then
				DR = DR + 1
				namebillboard.StudsOffset = Vector3.new(0, 0.75+2.5*math.sin(DR/(timr/2.5)), 2)
				textt.TextStrokeTransparency = i/timr
				textt.TextTransparency = i/timr
			elseif RM == 2 then
				DR = DR + 1
				namebillboard.StudsOffset = Vector3.new(0, 0.75+2.5*math.sin(DR/(timr/2.5)), 2)
				textt.TextStrokeTransparency = i/timr
				textt.TextTransparency = i/timr
			end
		end
		namebillboard:Destroy()
	end)
end

function MegaBossChat(text,color,watval)
	coroutine.resume(coroutine.create(function()
		if plr.PlayerGui:FindFirstChild("Dialog")~= nil then
			plr.PlayerGui:FindFirstChild("Dialog"):destroy()
		end
		local scrg = Instance.new("ScreenGui",plr.PlayerGui)
		scrg.Name = "Dialog"
		local txtlb = Instance.new("TextLabel",scrg)
		txtlb.Text = ""
		txtlb.Font = "Bodoni"
		txtlb.TextColor3 = MRC_A.Color
		txtlb.TextStrokeTransparency = 0
		txtlb.BackgroundTransparency = 1
		txtlb.BackgroundColor3 = Color3.new(0,0,0)
		txtlb.TextStrokeColor3 = MRC_A.Color
		txtlb.TextScaled = true
		txtlb.Size = UDim2.new(1,0,0.25,0)
		txtlb.TextXAlignment = "Center"
		txtlb.Position = UDim2.new(0,0,0.75,0)
		local txtlb2 = Instance.new("TextLabel",scrg)
		txtlb2.Text = ""
		txtlb2.Font = "Arcade"
		txtlb2.TextColor3 = MRC_A.Color
		txtlb2.TextStrokeTransparency = 0
		txtlb2.BackgroundTransparency = 1
		txtlb2.TextStrokeColor3 = MRC_A.Color
		txtlb2.TextSize = 40
		txtlb2.Size = UDim2.new(1,0,0.25,0)
		txtlb2.TextXAlignment = "Left"
		txtlb2.Position = UDim2.new(0,0,1,0)
		local fvalen = 0.55
		local fval = -0.49

		coroutine.resume(coroutine.create(function()
			while true do
				swait()
				if scrg.Parent ~= nil then
					fvalen = fvalen - 0.0001
				elseif scrg.Parent == nil then
					break
				end
			end
		end))
		local flol = 1.75
		local flil = 1.6
		coroutine.resume(coroutine.create(function()
			for i = 0, 9 do
				swait()
				fval = fval + 0.05
				flol = flol - 0.175
				flil = flil - 0.15
				txtlb.Text = ""
				--		txtlb.Position = UDim2.new(flol,0,0.3,0)
				--		txtlb2.Position = UDim2.new(flil,0,0.3,0)
			end
			txtlb.Text = text
			for i = 1,string.len(text),1 do
				--CFuncs["Sound"].Create("rbxassetid://565939471", char, .6, .8)
				txtlb.Text = string.sub(text,1,i)
				swait(1)
			end
			wait(watval)
			local valinc = 0
			for i = 0, 99 do
				swait()
				valinc = valinc + 0.0001
				flol = flol + valinc
				flil = flil + valinc
				--txtlb.Rotation = txtlb.Rotation + valinc*30
				--txtlb2.Rotation = txtlb2.Rotation - valinc*30
				--txtlb.Position = UDim2.new(0,0,0.3 + flol,0)
				--txtlb2.Position = UDim2.new(0,0,0.3 + flil,0)
				txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency + 0.01
				txtlb.TextTransparency = txtlb.TextTransparency + 0.01
				txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
				txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
				txtlb.BackgroundTransparency = txtlb.BackgroundTransparency + 0.0025
			end
			scrg:Destroy()
		end))
	end))
end


local scrg = Instance.new("ScreenGui",plr.PlayerGui)
scrg.Name = "Movers"


local massv = Instance.new("ImageLabel",scrg)
massv.BackgroundTransparency = 1
massv.BackgroundColor3 = Color3.new(0,0,0)
massv.Image = "rbxassetid://102396405"
massv.Size = UDim2.new(0,1600,0,1600)
massv.ImageTransparency = 1
massv.Position = UDim2.new(0.5,-800,0.5,-800)


Create = function(Obj)
	local Ins = Instance.new(Obj);
	return function(Property)
		if Property then else return Ins end
		for Property_,Value_ in next, Property do
			Ins[Property_] = Value_;
		end;
		return Ins;
	end;
end;

--local Create = LoadLibrary("RbxUtility").Create
create=Create


local NSn=NumberSequence.new
local NSKp=NumberSequenceKeypoint.new
local CSn=ColorSequence.new
local NRn=NumberRange.new

local emitters={}
local emitterDU = Instance.new("ParticleEmitter")
emitterDU.Name = "Dust"
emitterDU.LightEmission = 1
emitterDU.Transparency = NumberSequence.new(0,1)
emitterDU.Size = NumberSequence.new(0,0.2)
emitterDU.SpreadAngle = Vector2.new(360,360)
emitterDU.Speed = NumberRange.new(0.5)
emitterDU.Lifetime = NumberRange.new(0.75)
emitterDU.Texture = "rbxassetid://241812810"
emitterDU.Rate = 1000
emitterDU.Color = ColorSequence.new(Color3.new(1,1,1))
emitterDU.LockedToPart = false
table.insert(emitters,emitterDU)
function particles(art)
	emitterDU:Clone().Parent = art
end

m2=create("Model"){
	Parent=chr,
	Name="WModel"}
e=create("Model"){
	Parent=chr,
	Name="Effect"}

function NoOutline(Part)
	Part.TopSurface,Part.BottomSurface,Part.LeftSurface,Part.RightSurface,Part.FrontSurface,Part.BackSurface = 10,10,10,10,10,10
end

function cwedges(Par,name,size,color,mat,ref,tra)
	local wedgez=create("CornerWedgePart"){
		Parent=Par,
		Name=name,
		Size=size,
		CanCollide=false,
		Anchored=false,
		BrickColor=BrickColor.new(color),
		Material=mat,
		Reflectance=ref,
		Transparency=tra}
	--Position=Torso.Position}
	NoOutline(wedgez)
	wedgez:BreakJoints()
	return wedgez
end

function parts(Par,name,size,color,mat,ref,tra)
	local part=create("Part"){
		Parent=Par,
		Name=name,
		Size=size,
		CanCollide=false,
		Anchored=false,
		BrickColor=BrickColor.new(color),
		Material=mat,
		Reflectance=ref,
		Transparency=tra}
	--Position=Torso.Position}
	NoOutline(part)
	part:BreakJoints()
	return part 
end

function meshs(Par,name,scale,mtype,id)
	local mesh=create("SpecialMesh"){
		Parent=Par,
		Name=name,
		Scale=scale,
		MeshType=mtype}
	if id~="" then
		mesh.MeshId="rbxassetid://"..id
	end
	return meshs
end

function welds(Par,name,p0,p1,c0,c1)
	local weld=create("Weld"){
		Parent=Par,
		Name=name,
		Part0=p0,
		Part1=p1,
		C0=c0,
		C1=c1}
	return weld
end

function sounds(Par,id,vol,pit,emitter)
	local sound=create("Sound"){
		Parent=Par,
		SoundId="rbxassetid://"..id,
		Volume=vol,
		PlaybackSpeed=pit,
		MaxDistance=66666666}
	if emitter~=nil then
		sound.EmitterSize=emitter
	end
	sound:Play()
	game:GetService("Debris"):AddItem(sound,10)
	return sound
end


function Weld(part0,part1,c0,c1)
	local weld = Instance.new("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or cf()
	weld.C1 = c1 or cf()
	return weld
end




CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			return Part
		end;
	};

	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	["Weld"] = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	["Sound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};

	["TimeSound"] = {
		Create = function(id, par, vol, pit, timepos) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					TimePosition = timepos,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};
	["EchoSound"] = {
		Create = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl) 
			coroutine.resume(coroutine.create(function()
				local Sas = Create("Sound"){
					Volume = vol,
					Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					TimePosition = timepos,
					Parent = par or workspace,
				}
				local E = Create("EchoSoundEffect"){
					Delay = echodelay,
					Name = "Echo",
					Feedback = fedb,
					DryLevel = dryl,
					Parent = Sas,
				}
				wait() 
				Sas:play() 
				game:GetService("Debris"):AddItem(Sas, delays)
			end))
		end;
	};

	["LongSound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 60)
			end))
		end;
	};

	["ParticleEmitter"] = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return fp
		end;
	};

	CreateTemplate = {

	};
}




local halocolor = BrickColor.new("Pastel light blue")
local halocolor2 = BrickColor.new("Cool yellow")
local starcolor = BrickColor.new("Bright yellow")
local lunacolor = BrickColor.new("Navy blue")
local lunacolor2 = BrickColor.new("Bright blue")
local wepcolor = BrickColor.new("Really black")
local maincolor = BrickColor.new("Really black")
local m = Instance.new("Model",char)
local m2 = Instance.new("Model",char)
local m3 = Instance.new("Model",char)
local mw1 = Instance.new("Model",char)
local mw2 = Instance.new("Model",char)
local movelegs = false


gui = function(GuiType, parent, text, backtrans, backcol, pos, size)
	local gui = it(GuiType)
	gui.Parent = parent
	gui.Text = text
	gui.BackgroundTransparency = backtrans
	gui.BackgroundColor3 = backcol
	gui.SizeConstraint = "RelativeXY"
	gui.TextXAlignment = "Center"
	gui.TextYAlignment = "Center"
	gui.Position = pos
	gui.Size = size
	gui.Font = "SourceSans"
	gui.FontSize = "Size14"
	gui.TextWrapped = false
	gui.TextStrokeTransparency = 0
	gui.TextColor = BrickColor.new("White")
	return gui
end
local extrawingmod1 = Instance.new("Model",char)
local extrawingmod2 = Instance.new("Model",char)

function CreateParta(parent,transparency,reflectance,material,brickcolor)
	local p = Instance.new("Part")
	p.TopSurface = 0
	p.BottomSurface = 0
	p.Parent = parent
	p.Size = Vector3.new(0.1,0.1,0.1)
	p.Transparency = transparency
	p.Reflectance = reflectance
	p.CanCollide = false
	p.Locked = true
	p.BrickColor = brickcolor
	p.Material = material
	return p
end

function CreateMesh(parent,meshtype,x1,y1,z1)
	local mesh = Instance.new("SpecialMesh",parent)
	mesh.MeshType = meshtype
	mesh.Scale = Vector3.new(x1*10,y1*10,z1*10)
	return mesh
end

function CreateSpecialMesh(parent,meshid,x1,y1,z1)
	local mesh = Instance.new("SpecialMesh",parent)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = meshid
	mesh.Scale = Vector3.new(x1,y1,z1)
	return mesh
end


function CreateSpecialGlowMesh(parent,meshid,x1,y1,z1)
	local mesh = Instance.new("SpecialMesh",parent)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = meshid
	mesh.TextureId = "http://www.roblox.com/asset/?id=269748808"
	mesh.Scale = Vector3.new(x1,y1,z1)
	mesh.VertexColor = Vector3.new(parent.BrickColor.r, parent.BrickColor.g, parent.BrickColor.b)
	return mesh
end

function CreateWeld(parent,part0,part1,C1X,C1Y,C1Z,C1Xa,C1Ya,C1Za,C0X,C0Y,C0Z,C0Xa,C0Ya,C0Za)
	local weld = Instance.new("Weld")
	weld.Parent = parent
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C1 = CFrame.new(C1X,C1Y,C1Z)*CFrame.Angles(C1Xa,C1Ya,C1Za)
	weld.C0 = CFrame.new(C0X,C0Y,C0Z)*CFrame.Angles(C0Xa,C0Ya,C0Za)
	return weld
end




--------------
--------------
local sorb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb,rarm,sorb,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local sorb2 = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb2,larm,sorb2,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

------

New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

Shadow = New("Part",char,"Shadow",{CanCollide = false,BrickColor = BrickColor.new("Really black"),Size = Vector3.new(1.20000005, 0.600000024, 1),CFrame = CFrame.new(68.5999985, 0.700013041, 9.89999962, 1, 0, 0, 0, 1, 0, 0, 0, 1),Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",Shadow,"Mesh",{Scale = Vector3.new(1.25999999, 1.5, 1.25999999),})
Weld = New("ManualWeld",Shadow,"Weld",{Part0 = Shadow,Part1 = hed,C1 = CFrame.new(0, 0.200000048, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),})
Shadow.Transparency = 1


function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part")({
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
		CanCollide = false,
		Locked = true,
		BrickColor = BrickColor.new(tostring(BColor)),
		Name = Name,
		Size = Size,
		Material = Material
	})
	Part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
	RemoveOutlines(Part)
	return Part
end
function CreateMesha(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	local Msh = Create(Mesh)({
		Parent = Part,
		Offset = OffSet,
		Scale = Scale
	})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
function CreateWeld(Parent, Part0, Part1, C0, C1)
	local Weld = Create("Weld")({
		Parent = Parent,
		Part0 = Part0,
		Part1 = Part1,
		C0 = C0,
		C1 = C1
	})
	return Weld
end

local char = owner.Character
local onPerson = false
local host = nil
function weldparts(part1,part2)
	local weldc = Instance.new("WeldConstraint",part1)
	weldc.Name = "weld12pts"
	weldc.Part0 = part1
	weldc.Part1 = part2
end
if char then
	wait(.1)
	local CCH = char:GetChildren()
	if char["Left Arm"].Size.Y == 2 then
		for i, v in pairs(CCH) do
			if v:IsA("Part") and v.Name~="Head" then
				v.Size = Vector3.new(v.Size.X*1.1,v.Size.Y*1.1,v.Size.Z*1.1)
			end
		end
	end
	local torso = char:FindFirstChild("Torso")
	if char["Left Arm"].Size.Y == 1 then
		if torso then
			torso["Left Hip"].C1 = CFrame.new(-0.75,0,0) * CFrame.fromOrientation(0,math.rad(-90),0)
			torso["Right Hip"].C1 = CFrame.new(0.75,0,0) * CFrame.fromOrientation(0,math.rad(90),0)
		end
	end

end

Character=Player.Character 
PlayerGui=Player.PlayerGui 
Backpack=Player.Backpack 
Torso=Character.Torso 
Head=Character.Head 
Humanoid=Character.Humanoid
m=Instance.new('Model',Character)
LeftArm=Character["Left Arm"] 
LeftLeg=Character["Left Leg"] 
RightArm=Character["Right Arm"] 
RightLeg=Character["Right Leg"] 
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false 
local Effects2 = Instance.new("Folder", Character)
Effects2.Name = "Effects"
attackdebounce = false 
deb=false
equipped=false
hand=false
MMouse=nil
local combo = 1
mana=0
trispeed=.2
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
local sine = 0
local doe = 0
local SINE = 0
local change = 1


Death = false
deadii = false
deadii2 = false






local S = it("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://"..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function warnedpeople(text,represfont,color,color2)
	CFuncs["Sound"].Create("rbxassetid://534859368", char, 2.5,1)
	CFuncs["Sound"].Create("rbxassetid://963718869", char, 1,1)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		coroutine.resume(coroutine.create(function()
			if v.PlayerGui:FindFirstChild("Spinny")~= nil then
				v.PlayerGui:FindFirstChild("Spinny"):destroy()
			end
			local scrg = Instance.new("ScreenGui",v.PlayerGui)
			scrg.Name = "Spinny"
			local frm = Instance.new("Frame",scrg)
			frm.BackgroundTransparency = 0.25
			frm.BackgroundColor3 = color
			frm.BorderSizePixel = 0
			frm.Rotation = 45
			frm.Size = UDim2.new(3,0,0,100)
			frm.Position = UDim2.new(-4,0,0,0)
			local frm2 = frm:Clone()
			frm2.Parent = scrg
			frm2.BackgroundColor3 = color2
			frm2.Position = UDim2.new(-4.05,0,0,0)
			local imlb = Instance.new("ImageLabel",scrg)
			imlb.BackgroundTransparency = 1
			imlb.BackgroundColor3 = Color3.new(0,0,0)
			imlb.Image = "rbxassetid://2344851144"
			imlb.Size = UDim2.new(0,750,0,750)
			imlb.ImageColor3 = color2
			imlb.ImageTransparency = 0.25
			imlb.Position = UDim2.new(-2.5,0,-2.5,0)
			local imlb2 = imlb:Clone()
			imlb2.Image = "rbxassetid://2325939897"
			imlb2.Size = UDim2.new(1,0,1,0)
			imlb2.ImageColor3 = color
			imlb2.ImageTransparency = 0
			imlb2.Position = UDim2.new(0,0,0,0)
			local imlb3 = imlb:Clone()
			imlb3.Image = "rbxassetid://2344830904"
			imlb3.Size = UDim2.new(1,0,1,0)
			imlb3.ImageColor3 = color2
			imlb3.ImageTransparency = 0
			imlb3.Position = UDim2.new(0,0,0,0)
			local imlb4 = imlb:Clone()
			imlb4.Image = "rbxassetid://2344870656"
			imlb4.Size = UDim2.new(1,0,1,0)
			imlb4.ImageColor3 = Color3.new(1,1,1)
			imlb4.ImageTransparency = 0
			imlb4.Position = UDim2.new(0,0,0,0)
			imlb2.Parent = imlb
			imlb3.Parent = imlb
			imlb4.Parent = imlb
			local txtlb2 = Instance.new("TextLabel",imlb)
			txtlb2.Text = text
			txtlb2.Font = represfont
			txtlb2.TextColor3 = color
			txtlb2.TextStrokeTransparency = 0
			txtlb2.BackgroundTransparency = 1
			txtlb2.TextStrokeColor3 = color2
			txtlb2.TextScaled = true
			txtlb2.Size = UDim2.new(1,0,1,0)
			txtlb2.Position = UDim2.new(0,0,0,0)
			local fvalen = 0.55
			local fval = -0.49
			coroutine.resume(coroutine.create(function()
				while true do
					swait()
					if chaosmode == true then
						txtlb2.Rotation = math.random(-1,1)
						imlb.Position = imlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
						txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
						imlb.ImageColor3 = BrickColor.random().Color
						txtlb2.TextStrokeColor3 = BrickColor.random().Color
					end
				end
			end))
			coroutine.resume(coroutine.create(function()
				while true do
					swait()
					if scrg.Parent ~= nil then
						fvalen = fvalen - 0.0001
					elseif scrg.Parent == nil then
						break
					end
				end
			end))
			local flol = -5
			local flil = 1.6
			coroutine.resume(coroutine.create(function()
				for i = 0, 49 do
					swait()
					flol = flol + 0.125
					flil = flil - 0.1
					frm.Size = frm.Size + UDim2.new(0.1,0,0,0)
					frm.Rotation = frm.Rotation - 0.25
					frm2.Size = frm2.Size + UDim2.new(0.1,0,0,0)
					frm2.Rotation = frm.Rotation + 0.325
					imlb3.Rotation = imlb3.Rotation - 10
					imlb2.Rotation = imlb.Rotation + 7.5
					imlb.Rotation = imlb.Rotation + 5
					txtlb2.Rotation = txtlb2.Rotation - 5.125
					imlb.Position = imlb.Position + UDim2.new(0.05125,0,0.04775,0)
				end
				for i = 0, 99 do
					swait()
					fval = fval + 0.05
					flol = flol + 0.005
					frm.Size = frm.Size + UDim2.new(0.005,0,0,0)
					frm.Rotation = frm.Rotation - 0.075
					frm2.Size = frm2.Size + UDim2.new(0.005,0,0,0)
					frm2.Rotation = frm2.Rotation + 0.125
					imlb3.Rotation = imlb3.Rotation - 2
					imlb2.Rotation = imlb.Rotation + 1.5
					imlb.Rotation = imlb.Rotation + 1
					txtlb2.Rotation = txtlb2.Rotation - 1.125
					imlb.Position = imlb.Position + UDim2.new(0.0015,0,0.00075,0)
				end
				local valinc = 0
				local vinc2 = 1
				for i = 0, 99 do
					swait()
					vinc2 = vinc2 + 0.25
					valinc = valinc + 0.0001
					flol = flol + valinc
					flil = flil + valinc
					txtlb2.Rotation = txtlb2.Rotation - 1.125*vinc2
					imlb3.Rotation = imlb3.Rotation - 2*vinc2
					imlb.Rotation = imlb.Rotation + 1*vinc2
					imlb.Position = imlb.Position + UDim2.new(0.0015*vinc2,0,0.0005*vinc2,0)
					frm.Size = frm.Size + UDim2.new(0.005*vinc2,0,0,0)
					frm.Rotation = frm.Rotation + 0.1*vinc2
					frm2.Size = frm2.Size + UDim2.new(0.005*vinc2,0,0,0)
					frm2.Rotation = frm2.Rotation + 0.225*vinc2
					frm2.BackgroundTransparency = frm2.BackgroundTransparency + 0.0075
					frm.BackgroundTransparency = frm.BackgroundTransparency + 0.0075
					imlb.ImageTransparency = imlb.ImageTransparency + 0.005
					imlb2.ImageTransparency = imlb2.ImageTransparency + 0.01
					imlb3.ImageTransparency = imlb3.ImageTransparency + 0.01
					imlb4.ImageTransparency = imlb4.ImageTransparency + 0.01
					txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
					txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
				end
				scrg:Destroy()
			end))
		end))
	end
end



--save shoulders 
RSH, LSH=nil, nil 
--welds 
RW, LW=Instance.new("Weld"), Instance.new("Weld") 
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
TorsoColor=Torso.BrickColor
ch=Character
RSH=ch.Torso["Right Shoulder"] 
LSH=ch.Torso["Left Shoulder"] 
-- 
RSH.Parent=nil 
LSH.Parent=nil 
-- 
RW.Name="Right Shoulder"
RW.Part0=ch.Torso 
RW.C0=cf(1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5) 
RW.C1=cf(0, 0.5, 0) 
RW.Part1=ch["Right Arm"] 
RW.Parent=ch.Torso 
-- 
LW.Name="Left Shoulder"
LW.Part0=ch.Torso 
LW.C0=cf(-1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8) 
LW.C1=cf(0, 0.5, 0) 
LW.Part1=ch["Left Arm"] 
LW.Parent=ch.Torso 

local Stats=Instance.new("BoolValue")
Stats.Name="Stats"
Stats.Parent=Character
local Atk=Instance.new("NumberValue")
Atk.Name="Damage"
Atk.Parent=Stats
Atk.Value=1
local Def=Instance.new("NumberValue")
Def.Name="Defense"
Def.Parent=Stats
Def.Value=1
local Speed=Instance.new("NumberValue")
Speed.Name="Speed"
Speed.Parent=Stats
Speed.Value=1
local Mvmt=Instance.new("NumberValue")
Mvmt.Name="Movement"
Mvmt.Parent=Stats
Mvmt.Value=1

local donum=0


function part(formfactor,parent,reflectance,transparency,brickcolor,name,size)
	local fp=it("Part")
	fp.formFactor=formfactor 
	fp.Parent=parent
	fp.Reflectance=reflectance
	fp.Transparency=transparency
	fp.CanCollide=false 
	fp.Locked=true
	fp.BrickColor=brickcolor
	fp.Name=name
	fp.Size=size
	fp.Position=Torso.Position 
	NoOutline(fp)
	fp.Material="SmoothPlastic"
	fp:BreakJoints()
	return fp 
end 

function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh=it(Mesh) 
	mesh.Parent=part
	if Mesh=="SpecialMesh" then
		mesh.MeshType=meshtype
		if meshid~="nil" then
			mesh.MeshId="http://www.roblox.com/asset/?id="..meshid
		end
	end
	mesh.Offset=offset
	mesh.Scale=scale
	return mesh
end

function weld(parent,part0,part1,c0)
	local weld=it("Weld") 
	weld.Parent=parent
	weld.Part0=part0 
	weld.Part1=part1 
	weld.C0=c0
	return weld
end

local Color1=Torso.BrickColor

local bodvel=Instance.new("BodyVelocity")
local bg=Instance.new("BodyGyro")

function swait(num)
	if num==0 or num==nil then
		game:service'RunService'.Stepped:wait(0)
	else
		for i=0,num do
			game:service'RunService'.Stepped:wait(0)
		end
	end
end

function Swait(num) if num==0 or num==nil then game:service'RunService'.Stepped:wait(0) else for i=0,num do game:service'RunService'.Stepped:wait(0) end end end


-------- RAINBOW LEAVE IT TO ME
local r = 255
local g = 0
local b = 0
coroutine.resume(coroutine.create(function()
	while wait() do
		for i = 0, 254/5 do
			swait()
			g = g + 5
		end
		for i = 0, 254/5 do
			swait()
			r = r - 5
		end
		for i = 0, 254/5 do
			swait()
			b = b + 5
		end
		for i = 0, 254/5 do
			swait()
			g = g - 5
		end
		for i = 0, 254/5 do
			swait()
			r = r + 5
		end
		for i = 0, 254/5 do
			swait()
			b = b - 5
		end
	end
end))


so = function(id,par,vol,pit) 
	coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound",par or workspace)
		sou.Volume=vol
		sou.Pitch=pit or 1
		sou.SoundId=id
		swait() 
		sou:play() 
		game:GetService("Debris"):AddItem(sou,6)
	end))
end

function clerp(a,b,t) 
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)} 
	local ax, ay, az = a.x, a.y, a.z 
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end 

function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = math.sqrt(1 + trace) 
		local recip = 0.5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = math.sqrt(m00-m11-m22+1) 
			local recip = 0.5/s 
			return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = math.sqrt(m11-m22-m00+1) 
			local recip = 0.5/s 
			return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = math.sqrt(m22-m00-m11+1) 
			local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx = x*xs 
	local xy = x*ys 
	local xz = x*zs 
	local yy = y*ys 
	local yz = y*zs 
	local zz = z*zs 
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp; 
	if cosTheta >= 0.0001 then 
		if (1 - cosTheta) > 0.0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((1-t)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((t-1)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

local function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CFrame.new(at.x, at.y, at.z,
		right.x, top.x, back.x,
		right.y, top.y, back.y,
		right.z, top.z, back.z)
end

function Triangle(a, b, c)
	local edg1 = (c-a):Dot((b-a).unit)
	local edg2 = (a-b):Dot((c-b).unit)
	local edg3 = (b-c):Dot((a-c).unit)
	if edg1 <= (b-a).magnitude and edg1 >= 0 then
		a, b, c = a, b, c
	elseif edg2 <= (c-b).magnitude and edg2 >= 0 then
		a, b, c = b, c, a
	elseif edg3 <= (a-c).magnitude and edg3 >= 0 then
		a, b, c = c, a, b
	else
		assert(false, "unreachable")
	end

	local len1 = (c-a):Dot((b-a).unit)
	local len2 = (b-a).magnitude - len1
	local width = (a + (b-a).unit*len1 - c).magnitude

	local maincf = CFrameFromTopBack(a, (b-a):Cross(c-b).unit, -(b-a).unit)

	local list = {}

	if len1 > 0.01 then
		local w1 = Instance.new('WedgePart', m)
		game:GetService("Debris"):AddItem(w1,5)
		w1.Material = "SmoothPlastic"
		w1.FormFactor = 'Custom'
		w1.BrickColor = BrickColor.new("Really red")
		w1.Transparency = 0
		w1.Reflectance = 0
		w1.Material = "SmoothPlastic"
		w1.CanCollide = false
		local l1 = Instance.new("PointLight",w1)
		l1.Color = Color3.new(170,0,0)
		NoOutline(w1)
		local sz = Vector3.new(0.2, width, len1)
		w1.Size = sz
		local sp = Instance.new("SpecialMesh",w1)
		sp.MeshType = "Wedge"
		sp.Scale = Vector3.new(0,1,1) * sz/w1.Size
		w1:BreakJoints()
		w1.Anchored = true
		w1.Parent = workspace
		w1.Transparency = 0.7
		table.insert(Effects,{w1,"Disappear",.01})
		w1.CFrame = maincf*CFrame.Angles(math.pi,0,math.pi/2)*CFrame.new(0,width/2,len1/2)
		table.insert(list,w1)
	end

	if len2 > 0.01 then
		local w2 = Instance.new('WedgePart', m)
		game:GetService("Debris"):AddItem(w2,5)
		w2.Material = "SmoothPlastic"
		w2.FormFactor = 'Custom'
		w2.BrickColor = BrickColor.new("Really red")
		w2.Transparency = 0
		w2.Reflectance = 0
		w2.Material = "SmoothPlastic"
		w2.CanCollide = false
		local l2 = Instance.new("PointLight",w2)
		l2.Color = Color3.new(170,0,0)
		NoOutline(w2)
		local sz = Vector3.new(0.2, width, len2)
		w2.Size = sz
		local sp = Instance.new("SpecialMesh",w2)
		sp.MeshType = "Wedge"
		sp.Scale = Vector3.new(0,1,1) * sz/w2.Size
		w2:BreakJoints()
		w2.Anchored = true
		w2.Parent = workspace
		w2.Transparency = 0.7
		table.insert(Effects,{w2,"Disappear",.01})
		w2.CFrame = maincf*CFrame.Angles(math.pi,math.pi,-math.pi/2)*CFrame.new(0,width/2,-len1 - len2/2)
		table.insert(list,w2)
	end
	return unpack(list)
end




function Damagefunc(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChildOfClass("Humanoid")
	for _, v in pairs(hit.Parent:GetDescendants()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Head") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
			return
		end
		local c = Create("ObjectValue")({
			Name = "creator",
			Value = RealGame:service("Players")[owner.Name],
			Parent = h
		})
		game:GetService("Debris"):AddItem(c, 0.5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch)
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil and block.className == "IntValue" and block.Value > 0 then
			blocked = true
			block.Value = block.Value - 1
			print(block.Value)
		end
		if blocked == false then
			HitHealth = h.Health
			h.MaxHealth = 100
			h.Health = h.Health - Damage
			if HitHealth ~= h.Health and HitHealth ~= 0 and 0 >= h.Health and h.Parent.Name ~= "Hologram" then
				print("gained kill")
			end
			--   ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage / 2
			--   ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
			local bodvol = Create("BodyVelocity")({
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			local rl = Create("BodyAngularVelocity")({
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit
			})
			game:GetService("Debris"):AddItem(bodvol, 0.5)
			game:GetService("Debris"):AddItem(rl, 0.5)
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity")({
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05
			})
			if knockback > 0 then
				vp.Parent = hit.Parent.Head
			end
			game:GetService("Debris"):AddItem(vp, 0.5)
		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity")({
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
			local bodyVelocity = Create("BodyVelocity")({
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Leech" then
			local hum = hit.Parent.Humanoid
			if hum ~= nil then
				for i = 0, 2 do
					Effects.Sphere.Create(BrickColor.new("Bright red"), hit.Parent.Torso.CFrame * cn(0, 0, 0) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
				end
				Humanoid.Health = Humanoid.Health + 10
			end
		elseif Type == "UpKnock" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			if hum ~= nil then
				hitr = true
			end
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(5)
				HHumanoid.PlatformStand = false
				hitr = false
			end), hum)
			local bodyVelocity = Create("BodyVelocity")({
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
			local bodyVelocity = Create("BodyVelocity")({
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition")({
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso
			})
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Slashnare" then
			Effects.Block.Create(BrickColor.new("Pastel Blue"), hit.Parent.Torso.CFrame * cn(0, 0, 0), 15*4, 15*4, 15*4, 3*4, 3*4, 3*4, 0.07)
			for i = 1, math.random(4, 5) do
				Effects.Sphere.Create(BrickColor.new("Teal"), hit.Parent.Torso.CFrame * cn(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
			end
			local bp = Create("BodyPosition")({
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso
			})
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Spike" then
			CreateBigIceSword(hit.Parent.Torso.CFrame)
			local bp = Create("BodyPosition")({
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso
			})
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Burn" then
			local humss = hit.Parent:findFirstChildOfClass("Humanoid")
			humss.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(60)
				HHumanoid.PlatformStand = false
			end), humss)
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
			local bodvol = Create("BodyVelocity")({
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8000, 8000, 8000),
				Parent = hit
			})
			local rl = Create("BodyAngularVelocity")({
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit
			})
			local bld = Instance.new("ParticleEmitter",hit)
			bld.LightEmission = 1
			bld.Texture = "rbxasset://textures/particles/explosion01_implosion_main.dds"
			bld.Color = ColorSequence.new(bc("Deep orange").Color,bc("Really red").Color)
			bld.Rate = 999
			bld.Lifetime = NumberRange.new(1)
			bld.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.75,0),NumberSequenceKeypoint.new(1,0,0)})
			bld.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
			bld.Speed = NumberRange.new(0,0)
			bld.VelocitySpread = 50000
			bld.Rotation = NumberRange.new(-500,500)
			bld.RotSpeed = NumberRange.new(-500,500)
			bld.Speed = NumberRange.new(1,5)
			bld.Acceleration = vt(0,10,0)
			game:GetService("Debris"):AddItem(bodvol, 0.5)
			game:GetService("Debris"):AddItem(rl, 0.5)
			game:GetService("Debris"):AddItem(bld, 20)
			coroutine.resume(coroutine.create(function()
				if hit.Parent:findFirstChild("Torso")then
					local hitoor=hit.Parent:findFirstChild("Torso")
					for i=1, 150 do
						swait(5)
						humss.Health = humss.Health - .4
					end
				end
			end))
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition")({
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso
			})
			local BodGy = Create("BodyGyro")({
				maxTorque = Vector3.new(400000, 400000, 400000) * math.huge,
				P = 20000,
				Parent = hit.Parent.Torso,
				cframe = hit.Parent.Torso.CFrame
			})
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part)
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		local debounce = Create("BoolValue")({
			Name = "DebounceHit",
			Parent = hit.Parent,
			Value = true
		})
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Instance.new("ObjectValue")
		c.Name = "creator"
		c.Value = RealGame:service("Players")[owner.Name]
		c.Parent = h
		game:GetService("Debris"):AddItem(c, 0.5)
	end
end
function MagniDamage(Part, magni, mindam, maxdam, knock, Type,Sound)
    coroutine.resume(coroutine.create(function()
        for _, c in pairs(workspace:GetDescendants()) do
		local hum = c:findFirstChildOfClass("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if magni >= mag and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://406913243", 3)
				end
			end
			local head = c:findFirstChild("UpperTorso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if magni >= mag and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://406913243", 3)
				end
			end
		end
	end
end))
end


function MagniDamageWithEffect(Part, magni, mindam, maxdam, knock, Type)
    coroutine.resume(coroutine.create(function()
        for _, c in pairs(workspace:GetDescendants()) do
            local hum = c:findFirstChild("Humanoid")
            if hum ~= nil then
                local head = c:findFirstChild("Torso")
                if head ~= nil then
                    local targ = head.Position - Part.Position
                    local mag = targ.magnitude
                    if magni >= mag and c.Name ~= Player.Name then
                        MagicBlock(BrickColor.new("Pastel light blue"),head.CFrame,5,5,5,1,1,1,0.05)
                        Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://231917784", 1)
                    end
                end
            end
        end
    end))
end

function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

function CastRay(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 



function MagicBlock(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	prt.CFrame=prt.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		for i=0,1,delay do
			swait()
			Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
			Part.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicBlockSteady(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			Part.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh)
end



function MagicBlockSteady(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			Part.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicShock(brickcolor,cframe,x1,y1,x3,y3,delay,rottype)
	local prt=part(3,char,1,1,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	local dec = decal(prt.Color,"http://www.roblox.com/asset/?id=874580939","Front",prt)
	local dec2 = decal(prt.Color,"http://www.roblox.com/asset/?id=874580939","Front",prt)
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,0.01))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			dec.Transparency=i
			dec2.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicShockAlt(brickcolor,cframe,x1,y1,x3,y3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,0.01))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			prt.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicShockAltCircle(brickcolor,cframe,x1,z1,x3,z3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0.1,0)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,-0.1,0)
			end
			prt.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,0,z3)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicShockTrailAlt(brickcolor,cframe,x1,y1,z1,x3,y3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			prt.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicShockTrailAlt2(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=true
	prt.Material = "Neon"
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh) 
		local rtype = rottype
		for i=0,1,delay do
			swait()
			if rtype == 1 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
			elseif rtype == 2 then
				prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
			end
			prt.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh)
end

function MagicBlock2(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
	local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=false
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	local wld=weld(prt,prt,Parent,cframe)
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
		for i=0,1,delay do
			wait()
			Weld.C0=euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))*cframe
			--Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
			Part.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh,wld)
end

function MagicBlock3(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
	local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
	prt.Anchored=false
	prt.CFrame=cframe
	msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
	local wld=weld(prt,prt,Parent,euler(0,0,0)*cf(0,0,0))
	game:GetService("Debris"):AddItem(prt,5)
	coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
		for i=0,1,delay do
			wait()
			Weld.C0=euler(i*20,0,0)
			--Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
			Part.Transparency=i
			Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
		end
		Part.Parent=nil
	end),prt,msh,wld)
end


function waveEff2(bonuspeed, type, pos, scale, value, color)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "FileMesh"
	rngm.MeshId = "rbxassetid://20329976"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	local randomrot = math.random(1, 2)
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			if randomrot == 1 then
				rng.CFrame = rng.CFrame * CFrame.Angles(0, math.rad(5 * bonuspeed / 2), 0)
			elseif randomrot == 2 then
				rng.CFrame = rng.CFrame * CFrame.Angles(0, math.rad(-5 * bonuspeed / 2), 0)
			end
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, 0, scaler2 * bonuspeed)
		end
		rng:Destroy()
	end))
end



function waveEff3(bonuspeed, type, pos, scale, value, color)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "FileMesh"
	rngm.MeshId = "rbxassetid://20329976"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1 * value
	elseif type == "Divide" then
		scaler2 = 1 / value
	end
	local randomrot = math.random(1, 2)
	coroutine.resume(coroutine.create(function()
		for i = 0, 10 / bonuspeed, 0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01 * value / bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01 / value * bonuspeed
			end
			if randomrot == 1 then
				rng.CFrame = rng.CFrame * CFrame.Angles(0, math.rad(5 * bonuspeed / 2), 0)
			elseif randomrot == 2 then
				rng.CFrame = rng.CFrame * CFrame.Angles(0, math.rad(-5 * bonuspeed / 2), 0)
			end
			rng.Transparency = rng.Transparency + 0.01 * bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, 0, scaler2 * bonuspeed)
		end
		rng:Destroy()
	end))
end 
function waveEff(bonuspeed,type,typeoftrans,pos,scale,value,color)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	if typeoftrans == "In" then
		rng.Transparency = 1
	end
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "FileMesh"
	rngm.MeshId = "rbxassetid://20329976"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	local randomrot = math.random(1,2)
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
			end
			if randomrot == 1 then
				rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(5*bonuspeed/2),0)
			elseif randomrot == 2 then
				rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-5*bonuspeed/2),0)
			end
			if typeoftrans == "Out" then
				rng.Transparency = rng.Transparency + 0.01*bonuspeed
			elseif typeoftrans == "In" then
				rng.Transparency = rng.Transparency - 0.01*bonuspeed
			end
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, 0, scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end



function dmgstart(dmg,what)
	hitcon = what.Touched:connect(function(hit)
		local hum = hit.Parent:FindFirstChild("Humanoid")
		if hum and not hum:IsDescendantOf(Character) then
			hum:TakeDamage(dmg)
		end
	end)
end

function dmgstop()
	hitcon:disconnect()
end

function Cloak()
	Face.Parent=nil
	cloaked=true
	for _,v in pairs(Torso.Parent:children()) do
		if v.className=="Part" and v.Name~="HumanoidRootPart" then
			coroutine.resume(coroutine.create(function() 
				for i=0,1,0.2 do
					wait()
					v.Transparency=i
				end
				v.Transparency=1
			end))
		end
		if v.className=="Hat" then
			hatp=v.Handle
			coroutine.resume(coroutine.create(function(derp) 
				for i=0,1,0.2 do
					wait()
					derp.Transparency=i
				end
				derp.Transparency=1
			end),hatp)
		end
	end
	for _,v in pairs(m:children()) do
		if v.className=="Part" then
			coroutine.resume(coroutine.create(function() 
				for i=0,1,0.2 do
					wait()
					v.Transparency=i
				end
				v.Transparency=1
			end))
		end
	end
end

function UnCloak()
	so("http://roblox.com/asset/?id=2767090",Torso,1,1.1) 
	Face.Parent=Head 
	cloaked=false
	for _,v in pairs(Torso.Parent:children()) do
		if v.className=="Part" and v.Name~="HumanoidRootPart" then
			coroutine.resume(coroutine.create(function() 
				for i=0,1,0.1 do
					wait()
					v.Transparency=v.Transparency-0.1
				end
				v.Transparency=0
			end))
		end
		if v.className=="Hat" then
			hatp=v.Handle
			coroutine.resume(coroutine.create(function(derp) 
				for i=0,1,0.1 do
					wait()
					derp.Transparency=derp.Transparency-0.1
				end
				derp.Transparency=0
			end),hatp)
		end
	end
	for _,v in pairs(m:children()) do
		if v.className=="Part" and v.Name~="hitbox" and v.Name~='tip' then
			coroutine.resume(coroutine.create(function() 
				for i=0,1,0.1 do
					wait()
					v.Transparency=v.Transparency-0.1
				end
				v.Transparency=0
			end))
			v.Transparency=0
		end
	end
end

local origcolor = BrickColor.new("Pastel light blue")
---- This section of explosions.

----


function ring(type,pos,scale,value)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = origcolor
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshId = "http://www.roblox.com/asset/?id=3270017"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value
			end
			rng.Transparency = rng.Transparency + 0.01
			rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, 0)
		end
		rng:Destroy()
	end))
end



function wave(type,pos,scale,value)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = origcolor
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshId = "http://www.roblox.com/asset/?id=20329976"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value
			end
			rng.Transparency = rng.Transparency + 0.01
			rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, scaler2)
		end
		rng:Destroy()
	end))
end

function wind(type,pos,scale,value,speed)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = origcolor
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshId = "http://www.roblox.com/asset/?id=1051557"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value
			end
			rng.CFrame = rng.CFrame*CFrame.Angles(0,0.025*speed,0)
			rng.Transparency = rng.Transparency + 0.01
			rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, scaler2)
		end
		rng:Destroy()
	end))
end



function CameraManager()
	if TwoD and not CamInterrupt then
		if Humanoid.Health > 0 then
			Camera.CameraSubject = Humanoid
			Camera.CameraType = "Scriptable"
			Humanoid.AutoRotate = false
			if Booleans.GyroUse then
				Directer.MaxTorque = Vec3(0, huge, 0)
			else
				Directer.MaxTorque = Vec3(0, 0, 0)
			end
			if TargetInfo[1] ~= nil and TargetInfo[2] ~= nil then
				if Booleans.CamFollow then
					CPart.CFrame = cFrame(RootPart.Position, Vec3(TargetInfo[1].Position.X, RootPart.Position.Y, TargetInfo[1].Position.Z))
					Directer.CFrame = cFrame((RootPart.CFrame * cFrame(0, 0, 10)).p, TargetInfo[1].Position)
				else
					CPart.Position = RootPart.Position
				end
			else
				local ahead = (RootPart.CFrame * cFrame(0, 0, -3)).p
				CPart.CFrame = cFrame(RootPart.Position, Vec3(ahead.X, RootPart.Position.Y, ahead.Z))
			end
			Camera.CFrame = lerp(Camera.CFrame, CPart.CFrame * cFrame(25, 3, 0) * Euler(0, radian(90), 0), 0.2)
		else
			Camera.CameraSubject = Humanoid
			Camera.CameraType = "Custom"
		end
	end
end

function ring(type,pos,scale,value)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = origcolor
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshId = "http://www.roblox.com/asset/?id=3270017"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value
			end
			rng.Transparency = rng.Transparency + 0.01
			rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, 0)
		end
		rng:Destroy()
	end))
end


function wave(type,pos,scale,value)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = origcolor
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshId = "http://www.roblox.com/asset/?id=20329976"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value
			end
			rng.Transparency = rng.Transparency + 0.01
			rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, scaler2)
		end
		rng:Destroy()
	end))
end

function sphere(bonuspeed,type,pos,scale,value,color)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	if ModeOfGlitch ~= 9 then
		rng.BrickColor = color
	elseif ModeOfGlitch == 9 then
		rng.Color = Color3.new(kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000)
	end
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	if rainbowmode == true then
		rng.Color = Color3.new(r/255,g/255,b/255)
	end
	if ModeOfGlitch == 9 then
		coroutine.resume(coroutine.create(function()
			while true do
				swait()
				if rng.Parent ~= nil then
					rng.Color = Color3.new(kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000)
				else
					break
				end
			end
		end))
	end
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if rainbowmode == true then
				rng.Color = Color3.new(r/255,g/255,b/255)
			end
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
			end
			if chaosmode == true then
				rng.BrickColor = BrickColor.random()
			end
			rng.Transparency = rng.Transparency + 0.01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function Effect(par,color,CF,x,y,z,x1,y1,z1,de,mtyp,typ,rad,id,posi)
	local ex=create("Part"){
		Size=Vector3.new(.2,.2,.2),
		BrickColor=BrickColor.new(color),
		CanCollide=false,
		Material="Neon",
		Anchored=true,
		Parent=par}
	NoOutline(ex)
	if posi==2 then
		ex.Position=(CF).p
		ex.CFrame=ex.CFrame*CFrame.Angles(-math.rad(90),0,0)
	else
		ex.CFrame=CF
	end
	local exe=create("SpecialMesh"){
		Scale=Vector3.new(x,y,z),
		MeshType=mtyp,
		Parent=ex}
	if mtyp=="FileMesh"and id~=""then
		exe.MeshId="rbxassetid://"..id
	end
	game:GetService("Debris"):AddItem(ex,10)
	local ez=ex.CFrame
	local nu=0
	local no=math.random()-math.random()
	coroutine.resume(coroutine.create(function()
		for i=0,1.01,de do
			swait()
			if typ~=5 then
				ex.Transparency=i
			end
			exe.Scale=exe.Scale+Vector3.new(x1,y1,z1)
			if typ==1 then
				ex.CFrame=ex.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			elseif typ==2 then
				ex.CFrame=ex.CFrame*CFrame.Angles(0,math.rad(rad),0)
			elseif typ==3 then
				ex.CFrame=ex.CFrame*CFrame.new(0,0,rad)
			elseif typ==4 then
				nu=nu+no
				ez=ez*CFrame.new(0,rad,0)
				ex.CFrame=ez*CFrame.Angles(nu,0,0)
				--ex.CFrame=ex.CFrame
			end
		end
		ex:Remove()
	end))
end

function clone(wh,tr,asdf,deb)
	local aaa=wh:Clone()
	aaa.Parent=e
	aaa:BreakJoints()
	aaa.Color=BrickColor.new(modecolor[1]).Color
	aaa.Material="Neon"
	aaa.Transparency=tr
	aaa.Anchored=true
	aaa.CanCollide=false
	if asdf==true then
		aaa.Size=aaa.Size+Vector3.new(0.05,0.05,0.05)	
	end
	game:GetService("Debris"):AddItem(aaa,5)
	for _,ff in pairs(aaa:children()) do
		if ff:IsA("Sound")or ff:IsA("SpecialMesh")or ff:IsA("Decal")or ff:IsA("BillboardGui") then
			ff:Remove()
		end
	end	
	if aaa.Name=="Head" then
		aaa.Size=Vector3.new(1,1,1)
	elseif aaa.Name=="HumanoidRootPart"then
		aaa.Transparency=1
	end
	coroutine.resume(coroutine.create(function(cc)
		for i=0,1,deb do
			swait()
			cc.Transparency=i
		end
		cc:Remove()
	end),aaa)
end

function sphere1(par,anch,name,mat,si,cf,tr,ccol,bcol)
	local v3 = Vector3.new
	local ins = Instance.new
	local sp = ins('Part')
	sp.Size = si
	sp.Transparency = tr
	sp.Anchored = anch
	sp.CanCollide = ccol
	sp.Name = name
	sp.Material = mat
	sp.BrickColor = bcol
	sp.CFrame = cf
	local mesls = ins("SpecialMesh",sp)
	mesls.Scale = v3(0.8, 0.8, 0.8)
	mesls.MeshType = Enum.MeshType.Sphere
	sp.Parent = par
	return sp
end

function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color,material)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	if ModeOfGlitch ~= 9 then
		rng.BrickColor = color
	elseif ModeOfGlitch == 9 then
		rng.Color = Color3.new(kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000)
	end
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = material
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	local scaler2 = 1
	local scaler2b = 1
	local scaler2c = 1
	if type == "Add" then
		scaler2 = 1*value
		scaler2b = 1*value2
		scaler2c = 1*value3
	elseif type == "Divide" then
		scaler2 = 1/value
		scaler2b = 1/value2
		scaler2c = 1/value3
	end
	if ModeOfGlitch == 9 then
		coroutine.resume(coroutine.create(function()
			while true do
				swait()
				if rng.Parent ~= nil then
					rng.Color = Color3.new(kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000,kmusic.PlaybackLoudness/1000)
				else
					break
				end
			end
		end))
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
				scaler2b = scaler2b - 0.01*value/bonuspeed
				scaler2c = scaler2c - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
				scaler2b = scaler2b - 0.01/value*bonuspeed
				scaler2c = scaler2c - 0.01/value*bonuspeed
			end
			rng.Transparency = rng.Transparency + 0.01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2c*bonuspeed)
		end
		rng:Destroy()
	end))
end

function slash(bonuspeed,rotspeed,rotatingop,typeofshape,type,typeoftrans,pos,scale,value,color)
	local type = type
	local rotenable = rotatingop
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	if typeoftrans == "In" then
		rng.Transparency = 1
	end
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "FileMesh"
	if typeofshape == "Normal" then
		rngm.MeshId = "rbxassetid://662586858"
	elseif typeofshape == "Round" then
		rngm.MeshId = "rbxassetid://662585058"
	end
	rngm.Scale = scale
	local scaler2 = 1/10
	if type == "Add" then
		scaler2 = 1*value/10
	elseif type == "Divide" then
		scaler2 = 1/value/10
	end
	local randomrot = math.random(1,2)
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed/10
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed/10
			end
			if rotenable == true then
				if randomrot == 1 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(rotspeed*bonuspeed/2),0)
				elseif randomrot == 2 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-rotspeed*bonuspeed/2),0)
				end
			end
			if typeoftrans == "Out" then
				rng.Transparency = rng.Transparency + 0.01*bonuspeed
			elseif typeoftrans == "In" then
				rng.Transparency = rng.Transparency - 0.01*bonuspeed
			end
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed/10, 0, scaler2*bonuspeed/10)
		end
		rng:Destroy()
	end))
end



function block(bonuspeed,type,pos,scale,value,value2,value3,color,color3)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	rng.BrickColor = color
	rng.Color = color3
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1, 1, 1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Brick"
	rngm.Scale = scale
	local scaler2 = 1
	local scaler2b = 1
	local scaler2c = 1
	if type == "Add" then
		scaler2 = 1*value
		scaler2b = 1*value2
		scaler2c = 1*value3
	elseif type == "Divide" then
		scaler2 = 1/value
		scaler2b = 1/value2
		scaler2c = 1/value3
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
				scaler2b = scaler2b - 0.01*value/bonuspeed
				scaler2c = scaler2c - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
				scaler2b = scaler2b - 0.01/value*bonuspeed
				scaler2c = scaler2c - 0.01/value*bonuspeed
			end
			rng.CFrame = rng.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
			rng.Transparency = rng.Transparency + 0.01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2c*bonuspeed)
		end
		rng:Destroy()
	end))
end



function dmg(dude)
	if dude.Name ~= Character then
		local bgf = Instance.new("BodyGyro",dude.Head)
		bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
		local val = Instance.new("BoolValue",dude)
		val.Name = "IsHit"
		local ds = coroutine.wrap(function()
			local torso = dude:FindFirstChild'Torso' or dude:FindFirstChild'UpperTorso'
			for i = 1, 10 do
			end
			dude:WaitForChild("Head"):BreakJoints()
			wait(0.5)
			targetted = nil

			coroutine.resume(coroutine.create(function()
				for i, v in pairs(dude:GetChildren()) do
					if v:IsA("Accessory") then
						v:Destroy()
					end
					if v:IsA("Humanoid") then
						v:Destroy()
					end
					if v:IsA("CharacterMesh") then
						v:Destroy()
					end
					if v:IsA("Model") then
						v:Destroy()
					end
					if v:IsA("Part") or v:IsA("MeshPart") then
						for x, o in pairs(v:GetChildren()) do
							if o:IsA("Decal") then
								o:Destroy()
							end
						end
						coroutine.resume(coroutine.create(function()
							v.Transparency = 1
							wait(0.5)
							v.Transparency = 0
							coroutine.resume(coroutine.create(function()
								for i = 0, 49 do
									swait(1)
									v.Transparency = 1
								end
								wait(0.5)
								wait(3)
								v:Destroy()
								dude:Destroy()
							end))
						end))
					end
				end
			end))
		end)
		ds()
	end
end

function dmg2(dude)
	if dude.Name ~= Character then
		local keptcolor = BrickColor.new("Really red")
		local bgf = Instance.new("BodyGyro",dude.Head)
		bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
--[[local val = Instance.new("BoolValue",dude)
val.Name = "IsHit"]]--
		local ds = coroutine.wrap(function()
			dude:WaitForChild("Head"):BreakJoints()
			for i, v in pairs(dude:GetChildren()) do
				if v:IsA("Part") or v:IsA("MeshPart") then
					v.Name = "DEMINISHED"
				end
			end
			wait(0.5)
			targetted = nil
			--["Sound"].Create("rbxassetid://62339698", char, 0.75, 0.285)
			coroutine.resume(coroutine.create(function()
				for i, v in pairs(dude:GetChildren()) do
					if v:IsA("Accessory") then
						v:Destroy()
					end
					if v:IsA("Humanoid") then
						v:Destroy()
					end
					if v:IsA("CharacterMesh") then
						v:Destroy()
					end
					if v:IsA("Model") then
						v:Destroy()
					end
					if v:IsA("Part") or v:IsA("MeshPart") then
						for x, o in pairs(v:GetChildren()) do
							if o:IsA("Decal") then
								o:Destroy()
							end
						end
						coroutine.resume(coroutine.create(function()
							v.Material = "Neon"
							v.CanCollide = false
							v.Anchored = false
							local sbs = Instance.new("BodyPosition", v)
							sbs.P = 3000
							sbs.D = 1000
							sbs.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
							sbs.position = v.Position + Vector3.new(math.random(-2,2),10 + math.random(-2,2),math.random(-2,2))
							v.Color = keptcolor.Color
							coroutine.resume(coroutine.create(function()
								for i = 0, 49 do
									swait(1)
									v:BreakJoints()
									v.Transparency = v.Transparency + 0.02
								end
								v:BreakJoints()
								--sphere2(1,"Add",v.CFrame,vt(0,0,0),0.1,0.1,0.1,keptcolor)
								CFuncs["Sound"].Create("rbxassetid://1192402877", v, 0.5, 0.75)
								wait(0.5)
								wait(8)
								v:Destroy()
								dude:Destroy()
							end))
						end))
					end
				end
			end))
		end)
		ds()
	end
end

function FindNearestTorso(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return (SinglePlayer.Torso.CFrame.p - Position).magnitude < Distance
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			if v:findFirstChild("Torso") or v:findFirstChild("UpperTorso") then
				if v ~= Character then
					if (v.Head.Position - Position).magnitude <= Distance then
						table.insert(List, v)
					end 
				end 
			end 
		end 
	end
	return List
end

function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return (SinglePlayer.Torso.CFrame.p - Position).magnitude < Distance
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			if v:findFirstChild("Head") then
				if v ~= Character then
					if (v.Head.Position - Position).magnitude <= Distance then
						table.insert(List, v)
					end 
				end 
			end 
		end 
	end
	return List
end

function FaceMouse()
	Cam = workspace.CurrentCamera
	return {
		CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, char.Torso.Position.y, mouse.Hit.p.z)),
		Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
	}
end

function FaceMouse2()
	Cam = workspace.CurrentCamera
	return {
		CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)),
		Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
	}
end



function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = it("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = it("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = it("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

function CreatePartD(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = it("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end



function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = cf(StartPos,EndPos).lookVector
	local Ignore = ((type(Ignore) == "table" and Ignore) or {Ignore})
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, DIRECTION * Distance), Ignore)
end



-- Functions are ready.
--local storehumanoidWS = 19

function createBGCircle(size,parent,color)
	local bgui = Instance.new("BillboardGui",parent)
	bgui.Size = UDim2.new(size, 0, size, 0)
	local imgc = Instance.new("ImageLabel",bgui)
	imgc.BackgroundTransparency = 1
	imgc.ImageTransparency = 0
	imgc.Size = UDim2.new(1,0,1,0)
	imgc.Image = "rbxassetid://997291547" --997291547,521073910
	imgc.ImageColor3 = color
	return bgui,imgc
end


function symbolizeBlink(guipar,size,img,color,bonussize,vol,pit,soundid,spar,rotationenabled,rotsp,delay)
	local bgui,imgc = createBGCircle(size,guipar,color)
	bgui.AlwaysOnTop = true
	imgc.Image = "rbxassetid://" ..img
	local rrot = math.random(1,2)
	CFuncs["Sound"].Create("rbxassetid://" ..soundid, spar, vol,pit)
	coroutine.resume(coroutine.create(function()
		for i = 0, 24*delay do
			swait()
			if rotationenabled == true then
				if rrot == 1 then
					imgc.Rotation = imgc.Rotation + rotsp
				elseif rrot == 2 then
					imgc.Rotation = imgc.Rotation - rotsp
				end
			end
			bgui.Size = bgui.Size + UDim2.new(1*bonussize/delay,0,1*bonussize/delay,0)
			imgc.ImageTransparency = imgc.ImageTransparency + 0.04/delay
		end
		bgui:Destroy()
	end))
end
local ColorEx1 = BrickColor.new("Bright yellow")
local ColorEx2 = BrickColor.new("Deep orange")





New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

function Weld(part0,part1,c0,c1)
	local weld = Instance.new("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or cf()
	weld.C1 = c1 or cf()
	return weld
end


Spear = New("Model",char,"Spear",{})
Part = New("Part",Spear,"Part",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(2.79753733, 0.549614251, 0.824421406),CFrame = CFrame.new(-10.3638077, 7.50114822, -11.7736702, 0.965785384, -0.258781523, 0.017052127, 0.0164720062, -0.00440999214, -0.999854624, 0.258819103, 0.965925872, 3.54495251e-06),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})
Part = New("Part",Spear,"Part",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(7.64537334, 0.549614251, 0.549614251),CFrame = CFrame.new(-7.33128548, 7.55286694, -12.1534872, 0.999854624, 0, 0.0170509946, 0.0170509946, 0, -0.999854624, 0, 1, 0),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})
Part = New("Part",Spear,"Part",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(2.93494034, 0.549614251, 0.824421406),CFrame = CFrame.new(-10.2974529, 7.50228024, -12.5510788, 0.965785384, 0.258781523, 0.017052127, 0.0164720062, 0.00440999214, -0.999854624, -0.258819103, 0.965925872, -3.54495251e-06),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})
Part = New("Part",Spear,"Part",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(2.198457, 0.549614251, 0.824421406),CFrame = CFrame.new(-10.6530972, 7.49621105, -12.1534872, 0.999854624, 0, 0.0170509946, 0.0170509946, 0, -0.999854624, 0, 1, 0),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})
Handle = New("Part",Spear,"Handle",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(1.55540669, 0.549614251, 0.549614251),CFrame = CFrame.new(-6.089149, 7.5742631, -12.1535301, 0.999854624, 0, 0.0170509946, 0.0170509946, 0, -0.999854624, 0, 1, 0),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",Handle,"Mesh",{MeshType = Enum.MeshType.Cylinder,})
SHitbox = New("Part",Spear,"SHitbox",{BrickColor = BrickColor.new("Toothpaste"),Material = Enum.Material.Neon,Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(4.15540648, 2.63961363, 0.549614251),CFrame = CFrame.new(-11.0382757, 7.48959684, -12.1790009, 0.999854624, 0, 0.0170509946, 0.0170509946, 0, -0.999854624, 0, 1, 0),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0, 1, 1),})
Mesh = New("SpecialMesh",SHitbox,"Mesh",{MeshType = Enum.MeshType.Cylinder,})

for _,v in pairs(Spear:GetDescendants()) do
	if v:IsA("Part") then
		v.Anchored = false
		v.Locked = true
		v.CanCollide = false
		Weld(Handle,v,Handle.CFrame:inverse()*v.CFrame)
	end
end


local NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance,parent)
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

local HW = NewInstance('Weld',char,{Part0 = rarm, Part1 = Handle, C0 = CFrame.new(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0))})


New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

Soul = New("Model",char,"Soul",{})
Part = New("Part",Soul,"Part",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.9898718, 0.268192887, 0.314561456),CFrame = CFrame.new(-5.03756809, 3.14152217, 2.03607273, -0.00250599906, -0.000667000189, 0.999996662, 0.965922654, 0.25881806, 0.0025932414, -0.258818924, 0.965925872, -4.32722027e-06),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})
SHandle = New("Part",Soul,"SHandle",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.773847044, 0.37866509, 0.314561456),CFrame = CFrame.new(-5.03710747, 2.96566939, 2.19920325, -0.00259399903, 0, 0.999996662, 0.999996662, 0, 0.00259399903, 0, 1, 0),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("SpecialMesh",SHandle,"Mesh",{MeshType = Enum.MeshType.Sphere,})
Part = New("Part",Soul,"Part",{BrickColor = BrickColor.new("Institutional white"),Material = Enum.Material.Neon,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.982933581, 0.294186324, 0.314561456),CFrame = CFrame.new(-5.03754473, 3.13480473, 2.37399125, -0.00250599906, 0.000667000189, 0.999996662, 0.965922654, -0.25881806, 0.0025932414, 0.258818924, 0.965925872, 4.32722027e-06),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.972549, 0.972549, 0.972549),})
Mesh = New("SpecialMesh",Part,"Mesh",{MeshType = Enum.MeshType.Sphere,})

for _,v in pairs(Soul:GetDescendants()) do
	if v:IsA("Part") then
		v.Anchored = false
		v.Locked = true
		v.CanCollide = false
		v.Transparency = 1
		Weld(SHandle,v,SHandle.CFrame:inverse()*v.CFrame)
	end
end


local SWL = NewInstance('Weld',char,{Part0 = root, Part1 = SHandle, C0 = CFrame.new(0, 0,0) * angles(Rad(0), Rad(0), Rad(0))})


local AT = Instance.new("Attachment")
AT.CFrame = cf(-0.075,0.17,-0.7) * angles(0,math.rad(150),0) 
AT.Parent = Head
--0.25
--local EyeTest = Instance.new("ParticleEmitter")
--EyeTest.Acceleration = Vector3.new(0, 3.5, 0)
--EyeTest.Speed = NumberRange.new(6)
--EyeTest.LightEmission = 1
--EyeTest.Size =NumberSequence.new(0.2,0)
---EyeTest.SpreadAngle = Vector2.new(100, 100)
--EyeTest.Lifetime = NumberRange.new(1.7)
---EyeTest.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(0.429, 0.319), NumberSequenceKeypoint.new(0.749, 0.856), NumberSequenceKeypoint.new(1, 1)})
--EyeTest.Drag = 19
--EyeTest.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
--EyeTest.RotSpeed = NumberRange.new(10)
--EyeTest.Texture = "http://www.roblox.com/asset/?id=241779220"
--EyeTest.Parent = AT
--EyeTest.Enabled = false
local EyeTest = Instance.new("ParticleEmitter")
EyeTest.Name = "Flame"
EyeTest.Parent = AT
EyeTest.Transparency = NumberSequence.new(0.69999998807907,0.89999997615814,1)
EyeTest.Rotation = NumberRange.new(-180, 180)
EyeTest.Size = NumberSequence.new(0.2,0.2)
EyeTest.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
EyeTest.LightEmission = 1
EyeTest.Texture = "http://www.roblox.com/asset/?id=134531489"
EyeTest.Acceleration = Vector3.new(0, 20, 0)
EyeTest.Lifetime = NumberRange.new(0.10000001184186, 0.10000001184186)
EyeTest.Rate = 500
EyeTest.Speed = NumberRange.new(10, 10)
EyeTest.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
EyeTest.Enabled = false
------------------------------------------------------
--Start Music Option--
-------------------------------------------------------
-------------------------------------------------------
--End Music Option--
-------------------------------------------------------
--music
music = Instance.new("Sound")
music.Parent = tors
music.Volume = 3
music.Looped = true
music.Pitch = 1
music.Name = "CustomMusic"
music.SoundId = "rbxassetid://".. SoundReplace(ORGID)
music:Play()
musictime = 0
volchoice = 3
pitchchoice = 1
es = 10
tors.ChildRemoved:connect(function(removed)
	if removed.Name == "CustomMusic" then
		music = Instance.new("Sound")
		music.Parent = tors
		music.Volume = volchoice
		music.Looped = true
		music.Pitch = pitchchoice
		music.Name = "CustomMusic"
		music.TimePosition = musictime
		music.EmitterSize = es
		music.SoundId = "rbxassetid://"..SoundReplace(ORGID)
		music:Play()
	end
end)
-- music end
local how_much = 13
print(string.rep("I",how_much))
-- music controls
plr.Chatted:Connect(function(word)
	if word:sub(1,4) == "play" then
		local IDL = word:len()
		local ID = word:sub(6,IDL)
		ORGID = SoundReplace(ID)
		music:Play()
		wait(0.3)
		chatFunc("Now Playing "..game:service'MarketplaceService':GetProductInfo(music.SoundId:match("%d+")).Name.. "", 200, BrickColor.new('White'), 14)
	end

	if word:sub(1,5):lower()=='pitch' then
		local val3 = Instance.new("NumberValue", char)
		val3.Value = tonumber(word:sub(5))
		local Pitch = val3.Value
		music.Pitch = Pitch
		pitchchoice = Pitch
	end

	if word:sub(1,3):lower()=='vol' then
		local val3 = Instance.new("NumberValue", char)
		val3.Value = tonumber(word:sub(5))
		local Volume = val3.Value
		music.Volume = Volume
		volchoice = Volume
	end

	if word:sub(1,6) == "global" then
		es = 10000
	end
	if word:sub(1,7) == "restart" then
		music.TimePosition = 0
	end
	if word:sub(1,5) == "local" then
		es = 10
	end

	if word:sub(1,5) == "pause" then
		if music.IsPlaying then
			music:Pause()
		end
	end

	if word:sub(1,6) == "resume" or word:sub(1,8) == "continue" then
		if music.IsPaused then
			music:Resume()
		end
	end
end)
dmgcombo=1





function SpearAttack()

	attack=true
	if combo==1 then
		combo=2
		Humanoid.WalkSpeed=3
		for i = 0, 1, 0.1 do
			swait()
			local Alpha = .3
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(-19.8),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.4,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-10.7)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1.3,0.5,0.3)*angles(math.rad(88.8),math.rad(0),math.rad(129.1)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(19.8),math.rad(0))*necko,Alpha)
			HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
		end
		CFuncs["Sound"].Create("rbxasset://sounds/swordslash.wav", Torso, 5,1)
		for i = 0, 2, 0.1 do
			swait()
			local Alpha = .3
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(52.8),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(0.8,-1,0.4)*angles(math.rad(0),math.rad(-52.8),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-5.2)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(107.7),math.rad(-33.1),math.rad(-33.2)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(23.6),math.rad(0))*necko,Alpha)
			HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(-1.1), Rad(90), Rad(90)), 0.1)
			coroutine.resume(coroutine.create(function()MagniDamage(SHitbox, 6, 15, 25, .5, "Normal",0)end))
		end	
	elseif combo==2 then
		combo=1

		hum.WalkSpeed = 4
		for i = 0, 2, 0.1 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-40),math.rad(0)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(5)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0.1,0.1,0)*angles(math.rad(0),math.rad(0),math.rad(40)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(-40)),.3)
			RW.C0=clerp(RW.C0,cf(1.25,0.5,-0.65)*angles(math.rad(100),math.rad(0),math.rad(-23)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(110),math.rad(0),math.rad(-85)),.3)
			HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(-1.1), Rad(90), Rad(90)), 0.1)
			coroutine.resume(coroutine.create(function()MagniDamage(SHitbox, 6, 15, 25, .5, "Normal",0)end))
		end
		CFuncs["Sound"].Create("rbxasset://sounds/swordslash.wav", Torso, 5,1)

		for i = 0, 1, 0.1 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(50),math.rad(0)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(-0.1,-0.25,0)*angles(math.rad(10),math.rad(0),math.rad(-50)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(50)),.3)
			RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(100),math.rad(0),math.rad(-50)),.3)
			HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(-1.1), Rad(90), Rad(90)), 0.1)
			coroutine.resume(coroutine.create(function()MagniDamage(SHitbox, 6, 15, 25, .5, "Normal",0)end))
		end
	end
	attack = false
	if mode == 0 then
		hum.WalkSpeed = 16
	elseif mode == 1 then
		hum.WalkSpeed = 30
	end
end

function Spearmovethink()
	attack = true
	for i = 0, 2, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end
	waveEff(5,"Add","Out",root.CFrame,vt(0,5,0),5,BrickColor.new("White"))

	local vel = Instance.new("BodyPosition", root)
	vel.P = 25000
	vel.D = 1000
	vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
	vel.position = root.CFrame.p + vt(0,40,0)

	for i = 0, 4, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)


		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(70)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-70)),.4)
	end
	for i = 0, 4, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1* Player_Size * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-45)), 0.2)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0), Rad(45)), 0.2)
		RH.C0 = clerp(RH.C0, CF(0.5* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(-45), Rad(0)) * angles(Rad(0), Rad(0), Rad(15)), 0.2)
		LH.C0 = clerp(LH.C0, CF(-0.5* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(10), Rad(0)) * angles(Rad(0), Rad(0), Rad(-15)), 0.2)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(180), Rad(0 + 5 * Sin(sine / 20)), Rad(25 + 5 * Sin(sine / 20))), 0.2)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-20), Rad(0 - 5 * Sin(sine / 20)), Rad(-10 - 5 * Sin(sine / 20))), 0.2)
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(90), Rad(0)), 0.1)

	end
	vel:Destroy()
	waveEff2(6, "Add", root.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)) + root.CFrame.lookVector * 2, vt(0, 1, 0), 0.1, BrickColor.new("White"))
	waveEff2(8, "Add", root.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)) + root.CFrame.lookVector * 2, vt(0, 1, 0), 0.1, BrickColor.new("White"))

	for i = 0, 1.2, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * CF(0* Player_Size, 0* Player_Size, -0.1 + 0.1* Player_Size * Cos(sine / 20)) * angles(Rad(20), Rad(0), Rad(45)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, necko* CF(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(20 - 5 * Sin(sine / 20)), Rad(0), Rad(-45)), 0.3)
		RH.C0 = clerp(RH.C0, CF(0.5* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(20), Rad(-10), Rad(0)) * angles(Rad(0), Rad(0), Rad(15)), 0.3)
		LH.C0 = clerp(LH.C0, CF(-0.5* Player_Size, -0.9 - 0.1 * Cos(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-20), Rad(45), Rad(0)) * angles(Rad(0), Rad(0), Rad(-15)), 0.3)
		RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(85), Rad(0 + 5 * Sin(sine / 20)), Rad(45 + 5 * Sin(sine / 20))), 0.3)
		LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-45), Rad(0 - 5 * Sin(sine / 20)), Rad(-25 - 5 * Sin(sine / 20))), 0.3)
	end
	RootPart.CFrame = mouse.Hit *CFrame.new(0,2,0)
	local hf,pf=rayCast(root.Position,(CFrame.new(root.Position,root.Position - vt(0,1,0))).lookVector,4,char)
	local rotation = 0
	for i = 0, 35 do
		rotation = rotation + 10
		local deb = Instance.new("Part", char)
		deb.Anchored = true
		deb.CanCollide = false
		deb.FormFactor = 3
		deb.Name = "Ring"
		deb.Material = hf.Material
		deb.Color = hf.Color
		deb.Size = vt(math.random(50,60)/4,math.random(25,35)/4,math.random(50,60)/4)
		deb.Transparency = 0
		deb.TopSurface = 0
		deb.BottomSurface = 0
		deb.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-6,100/4)*CFrame.Angles(math.rad(math.random(20,30)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local debb = Instance.new("Part", char)
		debb.Anchored = true
		debb.CanCollide = false
		debb.FormFactor = 3
		debb.Name = "Ring"
		debb.Material = hf.Material
		debb.Color = hf.Color
		debb.Size = vt(math.random(40,50)/4,math.random(19,25)/4,math.random(40,50)/4)
		debb.Transparency = 0
		debb.TopSurface = 0
		debb.BottomSurface = 0
		debb.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-7,125/4)*CFrame.Angles(math.rad(math.random(10,20)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local debc = Instance.new("Part", char)
		debc.Anchored = true
		debc.CanCollide = false
		debc.FormFactor = 3
		debc.Name = "Ring"
		debc.Material = hf.Material
		debc.Color = hf.Color
		debc.Size = vt(math.random(35,40)/4,math.random(14,18)/4,math.random(35,40)/4)
		debc.Transparency = 0
		debc.TopSurface = 0
		debc.BottomSurface = 0
		debc.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-7,150/4)*CFrame.Angles(math.rad(math.random(5,10)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local deb2 = Instance.new("Part", char)
		deb2.CanCollide = false
		deb2.FormFactor = 3
		deb2.Name = "Ring"
		deb2.Material = hf.Material
		deb2.Color = hf.Color
		deb2.Size = vt(math.random(50,60)/16,math.random(50,60)/16,math.random(50,60)/16)
		deb2.Transparency = 0
		deb2.TopSurface = 0
		deb2.BottomSurface = 0
		deb2.CFrame = root.CFrame
		deb2.Velocity = vt(math.random(-300,300)/4,math.random(250,500)/4,math.random(-300,300)/4)
		deb2.RotVelocity = vt(math.random(-5,5),math.random(-5,5),math.random(-5,5))

		game:GetService("Debris"):AddItem(deb,9)
		game:GetService("Debris"):AddItem(debb,9)
		game:GetService("Debris"):AddItem(debc,9)
		game:GetService("Debris"):AddItem(deb2,9)
		coroutine.resume(coroutine.create(function()
			wait(5)
			for i = 0, 8 do
				swait()
				deb.Transparency = deb.Transparency + 0.04
				debb.Transparency = debb.Transparency + 0.04
				debc.Transparency = debc.Transparency + 0.04
			end
			soul1d:Destroy()
			soul1sd:Destroy()
			deb:Destroy()
			debb:Destroy()
			debc:Destroy()
		end))
	end
	for i = 0, 3, 0.1 do
		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-0.1,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(60)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1)*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1,1,-0.65)*angles(math.rad(100),math.rad(0),math.rad(-30)),.3)
		LW.C0=clerp(LW.C0,cf(-1,1,-0.65)*angles(math.rad(100),math.rad(0),math.rad(30)),.3)
	end
	attack = false
end

function Epicspearmove()
	attack = true
	for i = 0, 2, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end
	waveEff(5,"Add","Out",root.CFrame,vt(0,5,0),5,BrickColor.new("White"))
	CFuncs["Sound"].Create("rbxassetid://1295446488", root, 7.5, 0.9)
	local vel = Instance.new("BodyPosition", root)
	vel.P = 25000
	vel.D = 1000
	vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
	vel.position = root.CFrame.p + vt(0,40,0)

	for i = 0, 4, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)


		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(70)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-70)),.4)
	end

	CFuncs["Sound"].Create("rbxassetid://3223045506", char, 2, 1.1)
	chatFunc2("Justice..", 200,14)
	for i = 0, 9, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15),math.rad(5),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-40),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(170),math.rad(10),math.rad(0)),.3)
	end
	CFuncs["EchoSound"].Create("rbxassetid://847061203", char, 3,1)
	chatFunc2("SPEAR!!..", 200,14)
	for i = 0, 4, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15),math.rad(5),math.rad(50)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-40),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(170),math.rad(10),math.rad(0)),.3)
	end

	local orb = Instance.new("Part", char)
	orb.Anchored = true
	orb.BrickColor = BrickColor.new("Really red")
	orb.CanCollide = false
	orb.FormFactor = 3
	orb.Name = "Ring"
	orb.Material = "Neon"
	orb.Size = Vector3.new(2.99, 1.88, 50.2)
	orb.Transparency = 0.5
	orb.TopSurface = 0
	orb.BottomSurface = 0
	local orbm = Instance.new("SpecialMesh", orb)
	orbm.MeshType = "Sphere"
	--orbm.MeshId = "rbxassetid://134110849"
	--orbm.Scale = vt(6, 6, 5)
	orb.CFrame = root.CFrame*CFrame.new(0,35,0)
	for i = 0, 24 do
		slash(math.random(10,30)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.001,0.1),math.random(50,400)/420,BrickColor.new("White"))
	end
	sphere2(2,"Add",orb.CFrame,vt(10,10,10),0.5,0.5,0.5,BrickColor.new("Really red"),"Neon")
	sphere2(3,"Add",orb.CFrame,vt(10,10,10),0.75,0.75,0.75,BrickColor.new("Really red"),"Neon")
	sphere2(4,"Add",orb.CFrame,vt(10,10,10),1,1,1,BrickColor.new("Really red"),"Neon")
	CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 7.5, 1)
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.Transparency = 1
	a.CanCollide = false
	local ray = Ray.new(
		orb.CFrame.p,                           -- origin
		(mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
	) 
	local ignore = orb
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
	orb.CFrame = a.CFrame
	for i = 0, 8, 0.1 do
		swait()
		ray = Ray.new(
			orb.CFrame.p,                           -- origin
			(mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
		) 
		hit, position, normal = workspace:FindPartOnRay(ray, ignore)
		distance = (orb.CFrame.p - position).magnitude
		a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
		orb.CFrame = a.CFrame
		cam.CFrame = lerp(cam.CFrame, root.CFrame * cf(20, 65, 55) * ceuler(math.rad(-20), math.rad(0), math.rad(10)), 0.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0),math.rad(-6)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(40),math.rad(3)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(90)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-20),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.25,0.5,-0.5)*angles(math.rad(100),math.rad(0),math.rad(60)),.3)
		--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
	end
	cam.CameraType = "Custom"
	orb.Anchored = false
	a:Destroy()
	local bv = Instance.new("BodyVelocity")
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = orb.CFrame.lookVector*250
	bv.Parent = orb
	local hitted = false
	CFuncs["Sound"].Create("rbxassetid://466493476", orb, 7.5, 0.7)
	coroutine.resume(coroutine.create(function()
		while true do
			swait(2)
			if hitted == false and orb.Parent ~= nil then
				--slash(3,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(0.075,0.005,0.075),-0.05,BrickColor.new("White"))
			elseif hitted == true and orb.Parent == nil then
				break
			end
		end
	end))
	orb.Touched:connect(function(hit) 
		if hitted == false and hit.Parent ~= char then
			hitted = true
			MagniDamage(orb, 30, 72,95, 0, "Normal",153092213)
			CFuncs["Sound"].Create("rbxassetid://2042692050", orb, 10, 1)
			CFuncs["Sound"].Create("rbxassetid://1295446488", orb, 9, 0.75)
			for i = 0, 24 do
			end
			--ParticleEmitter({Transparency1 = 0.3, Transparency2 = 1, Speed = 125, Acel = VT(0,0,0), RotSpeed = NumberRange.new(-15, 15), Drag = 0.4, Size1 = 15, Size2 = 32, Lifetime1 = 0.4, Lifetime2 = 1, Parent = orb, Emit = 300, Offset = 360, Enabled = false, Color1 = MRC_A.Color, Color2 = MRC_B.Color, Texture = 296874871})
			sphere2(1,"Add",orb.CFrame,vt(12,12,12),1,1,1,BrickColor.new("Really red"),"Neon")
			sphere2(1.5,"Add",orb.CFrame,vt(12,12,12),1.1,1.1,1.1,BrickColor.new("Really red"),"Neon")
			sphere2(2,"Add",orb.CFrame,vt(12,12,12),1.2,1.2,1.2,BrickColor.new("Really red"),"Neon")
			orb.Anchored = true
			orb.Transparency = 1
			coroutine.resume(coroutine.create(function()
				for i = 0, 4, 0.1 do
					swait()
					MagniDamage(orb, 30, 72,95, 0, "Normal",153092213)
					sphere2(1,"Add",orb.CFrame,vt(14,14,14),1,1,1,BrickColor.new("Really red"),"Neon")
					sphere2(1,"Add",orb.CFrame,vt(14,14,14),1,1,1,BrickColor.new("Really red"),"Neon")
					slash(math.random(10,50)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.015,0.01),1.5,BrickColor.new("Really red"))
				end
			end))
			wait(10)
			orb:Destroy()
		end
	end)
	game:GetService("Debris"):AddItem(orb, 10)
	for i = 0, 2, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0),math.rad(-6)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(30),math.rad(3)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.4,0)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(70)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-40),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-80)),.3)
		--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
	end
	vel:Destroy()
	attack = false
end


local smokepart2 = Instance.new('Part',root)
smokepart2.Size = Vector3.new(0.5,0,1.5)
smokepart2.CanCollide = false
smokepart2.Transparency = 1
local skpartweld2 = Instance.new('Weld',smokepart2)
skpartweld2.Part0 = smokepart2
skpartweld2.Part1 = root
skpartweld2.C0 = CFrame.new(0,0,0)
local smokt2 = Instance.new("ParticleEmitter")
smokt2.Acceleration = Vector3.new(0, 2.5, 0)
smokt2.Speed = NumberRange.new(1)
smokt2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(1, 1.5)})
smokt2.SpreadAngle = Vector2.new(100, 100)
smokt2.Lifetime = NumberRange.new(1)
smokt2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(0.429, 0.319), NumberSequenceKeypoint.new(0.749, 0.856), NumberSequenceKeypoint.new(1, 1)})
smokt2.Drag = 100
smokt2.Color = ColorSequence.new(Color3.new(0.737255, 0.737255, 0.737255), Color3.new(1, 1, 1))
smokt2.RotSpeed = NumberRange.new(10)
smokt2.Texture = "http://www.roblox.com/asset/?id=2263365802"
smokt2.Parent = smokepart
smokt2.Enabled = false
function FIUUM()
	attack = true
	smokt2.Enabled = false
	for i = 0, 3, 0.1 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end
	smokt2.Enabled = true
	CFuncs["Sound"].Create("rbxassetid://138210320", Torso, 5,1)
	waveEff3(6, "Add", root.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)) + root.CFrame.lookVector * 2, vt(0, 1, 0), 0.1, BrickColor.new("White"))
	waveEff3(8, "Add", root.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)) + root.CFrame.lookVector * 2, vt(0, 1, 0), 0.1, BrickColor.new("White"))

	local v = Instance.new("BodyVelocity",root)--EgibleParts[i].Parent:FindFirstChild('Torso'))
	v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
	-- v.Velocity = (root.CFrame.lookVector + Vector3.new(0,0.025,0)) * 90
	v.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	smokt2.Lifetime = NumberRange.new(2.1)
	for i = 0, 4, 0.3 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

		v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
		RH.C0=clerp(RH.C0,cf(1,-0.4 - 0.05 * math.cos(sine / 32),-0.8)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(30 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(00 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),-1 + 0.05 * math.cos(sine / 32))*angles(math.rad(50 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-40 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(172 - 7 * math.cos(sine / 58)),math.rad(1 - 5 * math.cos(sine / 55)),math.rad(19 - 3 * math.cos(sine / 45))),.2)
	end
	for i = 0, 4, 0.3 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

		v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
		RH.C0=clerp(RH.C0,cf(1,-0.4 - 0.05 * math.cos(sine / 32),-0.8)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(30 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(00 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),-1 + 0.05 * math.cos(sine / 32))*angles(math.rad(50 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-40 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(172 - 7 * math.cos(sine / 58)),math.rad(1 - 5 * math.cos(sine / 55)),math.rad(19 - 3 * math.cos(sine / 45))),.2)
	end
	for i = 0, 4, 0.3 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

		v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
		RH.C0=clerp(RH.C0,cf(1,-0.4 - 0.05 * math.cos(sine / 32),-0.8)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(30 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(00 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),-1 + 0.05 * math.cos(sine / 32))*angles(math.rad(50 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-40 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(172 - 7 * math.cos(sine / 58)),math.rad(1 - 5 * math.cos(sine / 55)),math.rad(19 - 3 * math.cos(sine / 45))),.2)
	end
	for i = 0, 16, 0.3 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

		v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
		RH.C0=clerp(RH.C0,cf(1,-0.4 - 0.05 * math.cos(sine / 32),-0.8)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(30 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(00 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),-1 + 0.05 * math.cos(sine / 32))*angles(math.rad(50 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-40 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(172 - 7 * math.cos(sine / 58)),math.rad(1 - 5 * math.cos(sine / 55)),math.rad(19 - 3 * math.cos(sine / 45))),.2)
	end
	v:Destroy()
	smokt2.Enabled = false
	attack = false
end

function dead()
	attack = true
	root.Anchored = true
	ORGID = 408594818

	Death = true
	music.SoundId = "rbxassetid://"..SoundReplace(ORGID)
	musictime = 0
	music.TimePosition = 0
	for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" then
			if c.Transparency == 0 and c:FindFirstChild("Dust") == nil then
				particles(c)
			end
		end
	end
	for _,v in pairs(Soul:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	for _,v in pairs(Spear:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	local fall = Instance.new("Sound",workspace)
	fall.SoundId = "rbxassetid://178646271"
	fall.Volume = 4
	fall:Play()
	for i = 0, 10, 0.1 do
		swait()
		local Alpha = .1
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-2.7,-1.5)*angles(math.rad(-86.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(-3),math.rad(-9.5),math.rad(1))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-8.7),math.rad(17.6),math.rad(26.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.2,-0.2)*angles(math.rad(-165),math.rad(19.9),math.rad(-39.4)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.8,-0.2)*angles(math.rad(-25.6),math.rad(8.3),math.rad(42.4)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(-64.9),math.rad(0))*necko,1)
	end
	local fall2 = Instance.new("Sound",workspace)
	fall2.SoundId = "rbxassetid://427025525"
	fall2.Volume = 4
	fall2:Play()
	chatFunc2("Y-You M-Monster...", 400,14)
	hum.MaxHealth = "1"
	Humanoid.Health = "-1"
	for i = 0, 44, 0.1 do
		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-2.7,-1.5)*angles(math.rad(-86.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(-3),math.rad(-9.5),math.rad(1))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-8.7),math.rad(17.6),math.rad(26.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.2,-0.2)*angles(math.rad(-165),math.rad(19.9),math.rad(-39.4)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.8,-0.2)*angles(math.rad(-25.6),math.rad(8.3),math.rad(42.4)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(-64.9),math.rad(0))*necko,1)
	end
	Death = false
	attack = false
end


function Changemode()
	attack = true
	ORGID = 0
	Death = true
	massv.ImageTransparency = 0.5
	music.SoundId = "rbxassetid://"..SoundReplace(ORGID)
	hum.WalkSpeed = 0
	music.TimePosition = 0
	hum.MaxHealth = math.huge
	hum.Health = math.huge
	chatFunc2("..", 200,14)
	CFuncs["Sound"].Create("rbxassetid://406913243", root, 8,1)
	for _,v in pairs(Soul:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	for _,v in pairs(Spear:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	for i = 0, 5, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(-15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0)),.1)

	end
	for _,v in pairs(Soul:GetDescendants()) do if v:IsA("Part") then v.Transparency = 0 end end
	chatFunc2("No..", 200,14)
	for i = 0, 15, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		SWL.C0 = clerp(SWL.C0, CF(0, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 30 * math.cos(sine / 13))),.1)

	end
	local emitterD = Instance.new("ParticleEmitter")
	emitterD.Name = "Dust"
	emitterD.LightEmission = 1
	emitterD.Transparency = NumberSequence.new(0,1)
	emitterD.Size = NumberSequence.new(0,0.2)
	emitterD.SpreadAngle = Vector2.new(360,360)
	emitterD.Speed = NumberRange.new(0.5)
	emitterD.Lifetime = NumberRange.new(0.75)
	emitterD.Texture = "rbxassetid://241812810"
	emitterD.Rate = 1000
	emitterD.Color = ColorSequence.new(Color3.new(1,1,1))
	emitterD.LockedToPart = false
	emitterD.Parent = rarm
	ORGID = 333552980
	music.SoundId = "rbxassetid://"..SoundReplace(ORGID)
	music.TimePosition = 0
	chatFunc2("My Body.. It feels like its Splitting Apart", 200,14)
	coroutine.resume(coroutine.create(function()


		for i = 1,14 do
			massv.ImageTransparency = massv.ImageTransparency + 0.07
			wait()
		end
	end))
	for i = 0, 15, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0+math.random(-10,10)/10, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(80),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(-30 - 1 * math.cos(sine / 13))),.1)

	end
	local emitterD2 = emitterD:Clone()
	emitterD2.Parent = larm
	chatFunc2("Like Any Instant.. Ill Scatter into a Million parts", 200,14)
	for i = 0, 15, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0+math.random(-10,10)/10, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0)),.1)

	end
	local emitterD3 = emitterD:Clone()
	emitterD3.Parent = Torso
	chatFunc2("But...", 200,14)
	for i = 0, 20, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0+math.random(-10,10)/10, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0)),.1)

	end
	local emitterD4 = emitterD:Clone()
	emitterD4.Parent = lleg
	local emitterD5 = emitterD:Clone()
	emitterD5.Parent = rleg
	chatFunc2("Deep in my Soul..", 200,14)
	for i = 0, 28, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0+math.random(-10,10)/10, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0)),.1)

	end
	EyeTest.Enabled = true
	CFuncs["EchoSound"].Create("rbxassetid://847061203", root, 1, 1,0,10,0.25,0.25,1)
	chatFunc2("Theres a Burning feeling that WONT LET ME DIE!!", 200,14)
	for i = 0, 15, 0.1 do
		swait()
		local Alpha = .05
		hum.MaxHealth = math.huge
		hum.Health = math.huge
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0+math.random(-10,10)/10, 0, -3) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,0)*angles(math.rad(-16.4),math.rad(-17.1),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.2,0.1,-0.4)*angles(math.rad(0),math.rad(23),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.8,-1.1,-0.9)*angles(math.rad(-63.8),math.rad(-8.4),math.rad(13.8))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.3)*angles(math.rad(77.5),math.rad(-19.9),math.rad(39.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,-0.3)*angles(math.rad(7.1),math.rad(17.7),math.rad(-7)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(0 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0)),.1)

	end
	for i = 0, 3, 0.1 do
		swait()
		massv.ImageTransparency = 0.8 - 0.4 * math.cos( sine / 12)
		SWL.C0 = clerp(SWL.C0, CF(0, 0, -2) * angles(Rad(0), Rad(0), Rad(90)), 0.1)
		RH.C0=clerp(RH.C0,cf(1,-0.75 - 0.05 * math.cos(sine / 32),-0.65)*angles(math.rad(15),math.rad(90),math.rad(0))*angles(math.rad(15),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(0 - 2 * math.cos(sine / 32))),.06)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),-0.75)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-15),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(57.5 + 2 * math.cos(sine / 32))),.06)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),-0.85 + 0.05 * math.cos(sine / 32))*angles(math.rad(15 - 2 * math.cos(sine / 32)),math.rad(15),math.rad(0 - 1 * math.cos(sine / 44))),.06)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(27 - 8 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 15 * math.cos(sine / 58) - 7.5 * math.cos(sine / 43.5))),.06)
		RW.C0=clerp(RW.C0,cf(1.45,0.4 + 0.005 * math.cos(sine / 45),0)*angles(math.rad(90 + 6 * math.cos(sine / 74)),math.rad(8 - 5 * math.cos(sine / 53)),math.rad(-55)),.06)
		LW.C0=clerp(LW.C0,cf(-1.45,0.4 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(0 - 7 * math.cos(sine / 73)),math.rad(2 - 4 * math.cos(sine / 55)),math.rad(-55)),.06)
	end
	massv.ImageTransparency = 1
	for i = 0, 7, 0.1 do
		swait()
		SWL.C0 = clerp(SWL.C0, CF(0, 0, 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(2 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(8 + 3 * math.cos(sine / 45))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
	end
	Death = true
	emitterD:Destroy()
	emitterD2:Destroy()
	emitterD3:Destroy()
	emitterD4:Destroy()
	emitterD5:Destroy()
	for _,v in pairs(Soul:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	for _,v in pairs(Spear:GetDescendants()) do if v:IsA("Part") then v.Transparency = 0 end end SHitbox.Transparency = 1
	hum.WalkSpeed = 32
	soul1d = Instance.new("Part",char)
	soul1d.Shape = "Ball"
	soul1d.Material = "Neon"
	soul1d.BrickColor = BrickColor.new("Cyan")
	soul1d.Size = Vector3.new(1,1,1)
	soul1d.Transparency = 0.5
	soul1dweld = Instance.new("Weld",soul1d)
	soul1dweld.Part0 = root
	soul1dweld.Part1 = soul1d
	soul1dweld.C0 = CFrame.new(0,0,0)
	soul1mesh = Instance.new("SpecialMesh",soul1d)
	soul1mesh.MeshType = "Sphere"
	soul1sd = Instance.new("Part",char)
	soul1sd.Shape = "Ball"
	soul1sd.Material = "Neon"
	soul1sd.BrickColor = BrickColor.new("White")
	soul1sd.Size = Vector3.new(0.9,0.9,0.9)
	soul1sd.Transparency = 0.2
	soul1sdweld = Instance.new("Weld",soul1sd)
	soul1sdweld.Part0 = root
	soul1sdweld.Part1 = soul1sd
	soul1sdweld.C0 = CFrame.new(0,0,0)
	soul1smesh = Instance.new("SpecialMesh",soul1sd)
	soul1smesh.MeshType = "Sphere"
	coroutine.resume(coroutine.create(function()
		for i = 1,14 do
			soul1mesh.Scale = soul1mesh.Scale + Vector3.new(4,4,4)
			soul1smesh.Scale = soul1mesh.Scale + Vector3.new(4,4,4)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 30, 0, 0.3, 12, "Normal",0)end))
			wait()
		end
	end))
	coroutine.resume(coroutine.create(function()
		for i, v in pairs(FindNearestTorso(root.CFrame.p, 27)) do
			if v:FindFirstChild('Head') then
				coroutine.resume(coroutine.create(function()
					for i,v in pairs(v:WaitForChild('Head'):GetChildren()) do
						if v:IsA("BodyPosition") then
							v:Destroy()
						end
					end
					local vel = Instance.new("BodyPosition", v:WaitForChild('Head'))
					vel.P = 9000
					vel.D = 1000
					vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
					vel.position = v:WaitForChild('Head').CFrame.p + root.CFrame.lookVector*3 + Vector3.new(0,34,0)
					v:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
					v:FindFirstChildOfClass("Humanoid").JumpPower = 0
					if v:IsA("Part") then
						v.Anchored = true
					end
					game:GetService("Debris"):AddItem(vel,0.75)
					wait(0.75)
					v:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
					v:FindFirstChildOfClass("Humanoid").JumpPower = 50
				end))
			end
		end
	end))

	mode=1
	CFuncs["Sound"].Create("rbxassetid://341301373", char, 2, 1)
	local hf,pf=rayCast(root.Position,(CFrame.new(root.Position,root.Position - vt(0,1,0))).lookVector,4,char)
	local rotation = 0
	for i = 0, 35 do
		rotation = rotation + 10
		local deb = Instance.new("Part", char)
		deb.Anchored = true
		deb.CanCollide = false
		deb.FormFactor = 3
		deb.Name = "Ring"
		deb.Material = hf.Material
		deb.Color = hf.Color
		deb.Size = vt(math.random(50,60)/4,math.random(25,35)/4,math.random(50,60)/4)
		deb.Transparency = 0
		deb.TopSurface = 0
		deb.BottomSurface = 0
		deb.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-6,100/4)*CFrame.Angles(math.rad(math.random(20,30)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local debb = Instance.new("Part", char)
		debb.Anchored = true
		debb.CanCollide = false
		debb.FormFactor = 3
		debb.Name = "Ring"
		debb.Material = hf.Material
		debb.Color = hf.Color
		debb.Size = vt(math.random(40,50)/4,math.random(19,25)/4,math.random(40,50)/4)
		debb.Transparency = 0
		debb.TopSurface = 0
		debb.BottomSurface = 0
		debb.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-7,125/4)*CFrame.Angles(math.rad(math.random(10,20)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local debc = Instance.new("Part", char)
		debc.Anchored = true
		debc.CanCollide = false
		debc.FormFactor = 3
		debc.Name = "Ring"
		debc.Material = hf.Material
		debc.Color = hf.Color
		debc.Size = vt(math.random(35,40)/4,math.random(14,18)/4,math.random(35,40)/4)
		debc.Transparency = 0
		debc.TopSurface = 0
		debc.BottomSurface = 0
		debc.CFrame = root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-7,150/4)*CFrame.Angles(math.rad(math.random(5,10)),math.rad(0),math.rad(0))*CFrame.new(0,math.random(-5,5),0)
		local deb2 = Instance.new("Part", char)
		deb2.CanCollide = false
		deb2.FormFactor = 3
		deb2.Name = "Ring"
		deb2.Material = hf.Material
		deb2.Color = hf.Color
		deb2.Size = vt(math.random(50,60)/16,math.random(50,60)/16,math.random(50,60)/16)
		deb2.Transparency = 0
		deb2.TopSurface = 0
		deb2.BottomSurface = 0
		deb2.CFrame = root.CFrame
		deb2.Velocity = vt(math.random(-300,300)/4,math.random(250,500)/4,math.random(-300,300)/4)
		deb2.RotVelocity = vt(math.random(-5,5),math.random(-5,5),math.random(-5,5))

		game:GetService("Debris"):AddItem(deb,5)
		game:GetService("Debris"):AddItem(debb,5)
		game:GetService("Debris"):AddItem(debc,5)
		game:GetService("Debris"):AddItem(deb2,5)
		coroutine.resume(coroutine.create(function()
			wait(2)
			for i = 0, 1.5 do
				swait()
				deb.Transparency = deb.Transparency + 0.04
				debb.Transparency = debb.Transparency + 0.04
				debc.Transparency = debc.Transparency + 0.04
			end
			soul1d:Destroy()
			soul1sd:Destroy()
			deb:Destroy()
			debb:Destroy()
			debc:Destroy()
		end))
	end

	for i = 0, 8, 0.1 do
		swait()
		SWL.C0 = clerp(SWL.C0, CF(0, 0, 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(2 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(8 + 3 * math.cos(sine / 45))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
	end
	chatFunc2("you're gonna have to try a little harder than that!", 200,14)
	for i = 0, 11, 0.1 do
		swait()
		SWL.C0 = clerp(SWL.C0, CF(0, 0, 0) * angles(Rad(0), Rad(0), Rad(0)), 0.1)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0),math.rad(-6)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(30),math.rad(3)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.4,-0.3)*angles(math.rad(0),math.rad(0),math.rad(-70)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(5),math.rad(0),math.rad(70)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-40),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-80)),.3)
	end
	attack = false
end

Effects = Instance.new("Folder",Character)
Effects.Name = "Stuff"

local mp = Instance.new("Part",Effects)
mp.CanCollide = false
mp.Name = "Point X"
mp.Transparency = 1
mp.Size = Vector3.new(1, 1, 1)

Point = Instance.new("BodyGyro")
Point.Parent = mp
Point.D = 175
Point.P = 200000
Point.MaxTorque = Vector3.new(0,400000000,0)

local mp2 = Instance.new("Part",Effects)
mp2.CanCollide = false
mp2.Name = "Point XYZ"
mp2.Transparency = 1
mp2.Size = Vector3.new(1, 1, 1)

Point2 = Instance.new("BodyGyro")
Point2.Parent = mp2
Point2.D = 175
Point2.P = 200000
Point2.MaxTorque = Vector3.new(400000000,400000000,400000000)

local mousep = nil
local pos = Instance.new("BodyPosition",mp)
pos.D = 1250
pos.P = 200000
pos.MaxForce = Vector3.new(4000000000, 4000000000, 4000000000)
local pos2 = Instance.new("BodyPosition",mp2)
pos2.D = 1250
pos2.P = 200000
pos2.MaxForce = Vector3.new(4000000000, 4000000000, 4000000000)
coroutine.wrap(function()
	while true do
		mousep = mouse.Hit.p
		Point.CFrame = CFrame.new(RootPart.Position,mouse.Hit.p)
		pos.Position = RootPart.Position + Vector3.new(0,0,0)
		Point2.CFrame = CFrame.new(RootPart.Position,mouse.Hit.p)
		pos2.Position = RootPart.Position + Vector3.new(0,0,0)
		swait()
	end
end)()


function Spearthrow()
	attack = true
	hum.WalkSpeed = 5
	for i = 0, 4, 0.1 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(90), Rad(0)), 0.1)

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-0.1,0.1)*angles(math.rad(5),math.rad(-25),math.rad(0))*RootCF,.3)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,-0.4)*angles(math.rad(15),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),.3)
		RH.C0 = RH.C0:lerp(cf(1,-0.9,-0.1)*angles(math.rad(-5),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),.3)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0.1)*angles(math.rad(-14.6),math.rad(8.2),math.rad(-5.8)),.3)
		RW.C0 = RW.C0:lerp(cf(1.2,0.7,0.2)*angles(math.rad(-151.5),math.rad(29.5),math.rad(5.7)),.3)

		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(25),math.rad(0))*necko,.3)
		--     		RootJoint.C0 = clerp(RootJoint.C0, RootCF * CF(0, 0, -0.1 + 0.1 * Cos(sine / 20)) * angles(Rad(0), Rad(0), Rad(-45)), 0.2)
		--			Torso.Neck.C0 = clerp(Torso.Neck.C0, necko* CF(0, 0, 0 + ((1) - 1)) * angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0), Rad(45)), 0.2)
		--RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		--LH.C0=clerp(LH.C0,cf(-1,-1.1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-7),math.rad(-90),math.rad(0))*angles(math.rad(5 + 2 * math.cos(sine / 32)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		--			RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.1 * Sin(sine / 20), 0) * angles(Rad(180), Rad(0 + 5 * Sin(sine / 20)), Rad(25 + 5 * Sin(sine / 20))), 0.2)
		--			LW.C0 = clerp(LW.C0, CF(-1.5, 0.5 + 0.1 * Sin(sine / 20), 0) * angles(Rad(-20), Rad(0 - 5 * Sin(sine / 20)), Rad(-10 - 5 * Sin(sine / 20))), 0.2)

	end
	local SpiritBall = Instance.new("Part", char)
	SpiritBall.Anchored = true
	SpiritBall.BrickColor = BrickColor.new("Toothpaste")
	SpiritBall.CanCollide = false
	SpiritBall.FormFactor = 3
	SpiritBall.Name = "SpiritBall"
	SpiritBall.Material = "Neon"
	SpiritBall.Size = Vector3.new(1.95, 1.62, 15.6)
	SpiritBall.Transparency = 1
	SpiritBall.TopSurface = 0
	SpiritBall.BottomSurface = 0
	--SpiritBall.Shape = Enum.PartType.Sphere
	SpiritBall.CFrame = root.CFrame*CFrame.new(0,3,-14)
	local orbm = Instance.new("SpecialMesh", SpiritBall)
	orbm.MeshType = "Sphere"
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.Transparency = 1
	a.CanCollide = false
	local ray = Ray.new(
		SpiritBall.CFrame.p,                           -- origin
		(mouse.Hit.p - SpiritBall.CFrame.p).unit * 500 -- direction
	) 
	local ignore = SpiritBall
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (SpiritBall.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(SpiritBall.CFrame.p, position) * CFrame.new(0, 0, 0)
	SpiritBall.CFrame = a.CFrame
	for _,v in pairs(Spear:GetDescendants()) do if v:IsA("Part") then v.Transparency = 1 end end
	CFuncs["Sound"].Create("rbxassetid://466493476", root, 4, 0.7)
	for i = 0, 1, 0.1 do
		swait()
		ray = Ray.new(
			SpiritBall.CFrame.p,                           -- origin
			(mouse.Hit.p - SpiritBall.CFrame.p).unit * 500 -- direction
		) 
		hit, position, normal = workspace:FindPartOnRay(ray, ignore)
		distance = (SpiritBall.CFrame.p - position).magnitude
		a.CFrame = CFrame.new(SpiritBall.CFrame.p, position) * CFrame.new(0, 0, 0)
		SpiritBall.CFrame = a.CFrame
		HW.C0=clerp(HW.C0,cf(3,1 + 0.6 * math.cos(sine/45),2)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(0,0,0),.1)
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,-0.1)*angles(math.rad(-15),math.rad(0),math.rad(0))*RootCF,.3)
		LH.C0 = LH.C0:lerp(cf(-1,-1.1,-0.5)*angles(math.rad(-45),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),.3)
		RH.C0 = RH.C0:lerp(cf(1,-0.8,-0.2)*angles(math.rad(20),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),.3)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.4,0.5)*angles(math.rad(-55),math.rad(0),math.rad(0)),.3)
		RW.C0 = RW.C0:lerp(cf(1.5,0.3,-0.2)*angles(math.rad(55),math.rad(0),math.rad(0)),.3)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,.3)
	end
	SpiritBall.Transparency = 0
	SpiritBall.Anchored = false
	a:Destroy()
	local bv = Instance.new("BodyVelocity")
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = SpiritBall.CFrame.lookVector*250
	bv.Parent = SpiritBall
	local hitted = false
	coroutine.resume(coroutine.create(function()
		while true do
			swait(1)
			if hitted == false and SpiritBall.Parent ~= nil then
				--slash(3,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(0.075,0.005,0.075),-0.05,BrickColor.new("White"))
			elseif hitted == true and SpiritBall.Parent == nil then
				break
			end
		end
	end))
	SpiritBall.Touched:connect(function(hit) 
		if hitted == false and hit.Parent ~= char then
			SpiritBall.Anchored = true
			SpiritBall.Transparency = 1
			hitted = true
			--MagniDamage(SpiritBall, 6, 99,99, 0, "Normal")
			MagniDamage(SpiritBall, 8, 23,40, 0, "Normal")


			sphere2(5,"Add",SpiritBall.CFrame,vt(2.1,2.1,2),-0.02,-0.02,5,BrickColor.new("Toothpaste"),"Neon")
			sphere2(5,"Add",SpiritBall.CFrame,vt(2,2,2),-0.02,-0.02,4,BrickColor.new("Toothpaste"),"Neon")
			for i = 0, 24 do
				slash(math.random(20,100)/10,5,true,"Round","Add","Out",SpiritBall.CFrame*CFrame.new(0,0,math.random(-60,60))*CFrame.Angles(math.rad(90),0,0),vt(0.01,0.01,0.01),math.random(10,100)/1000,BrickColor.new("White"))
			end


			wait(10)
			SpiritBall:Destroy()
		end
	end)

	for i = 0, 4, 0.1 do
		swait()
		HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),-0.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)


		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 + 0.02 * math.cos(sine / 18), -0) * angles(math.rad(0 + 3 * math.cos(sine/16)), math.rad(0), math.rad(90)),0.4)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
	end
	for _,v in pairs(Spear:GetDescendants()) do if v:IsA("Part") then v.Transparency = 0 end end SHitbox.Transparency = 1
	local particlemiter = Instance.new("ParticleEmitter",hed) 
	particlemiter.Texture = "rbxassetid://241779220" 
	particlemiter.Size = NumberSequence.new(2,.5) 
	particlemiter.Transparency = NumberSequence.new(0,1) 
	particlemiter.Enabled = true 
	particlemiter.LockedToPart = false 
	particlemiter.Speed = NumberRange.new(20) 
	particlemiter.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
	particlemiter.RotSpeed = NumberRange.new(210) 
	particlemiter.Lifetime = NumberRange.new(2) 
	particlemiter.SpreadAngle = Vector2.new(-100,100) 
	particlemiter.Rate = 500 
	local particlemiter2 = Instance.new("ParticleEmitter",hed) 
	particlemiter2.Texture = "rbxassetid://241779220" 
	particlemiter2.Size = NumberSequence.new(2,.5) 
	particlemiter2.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
	particlemiter2.Transparency = NumberSequence.new(0,1) 
	particlemiter2.Enabled = true 
	particlemiter2.LockedToPart = false 
	particlemiter2.Speed = NumberRange.new(20) 
	particlemiter2.RotSpeed = NumberRange.new(210) 
	particlemiter2.Lifetime = NumberRange.new(2) 
	particlemiter2.SpreadAngle = Vector2.new(-100,100) 
	particlemiter2.Rate = 500 
	local particlemiter3 = Instance.new("ParticleEmitter",hed) 
	particlemiter3.Texture = "rbxassetid://241779220" 
	particlemiter3.Size = NumberSequence.new(2,.5) 
	particlemiter3.Transparency = NumberSequence.new(0,1) 
	particlemiter3.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
	particlemiter3.Enabled = true 
	particlemiter3.LockedToPart = false 
	particlemiter3.Speed = NumberRange.new(20) 
	particlemiter3.RotSpeed = NumberRange.new(210) 
	particlemiter3.Lifetime = NumberRange.new(2) 
	particlemiter3.SpreadAngle = Vector2.new(-100,100) 
	particlemiter3.Rate = 500 
	wait(.15) 
	coroutine.wrap(function() 
		particlemiter.Enabled = false 
		particlemiter2.Enabled = false 
		particlemiter3.Enabled = false 
		wait(5) 
		particlemiter3:Remove() 
		particlemiter:Remove() 
		particlemiter2:Remove() 
	end)() 
	if mode == 0 then
		hum.WalkSpeed = 16
	elseif mode == 1 then
		hum.WalkSpeed = 30
	end
	attack = false
end

-------------------------------------
local CurId = 1
Humanoid.Animator.Parent = nil
hum.JumpPower = 80
hum.WalkSpeed = 16
local CD1=false
local CD3=false
local CD2=false
soulmode = 1
-------------------------------------

local attacktype = 1
mouse.Button1Down:connect(function()

	if attack == false and Humanoid.Sit == false then
		SpearAttack()
	end
end)


mouse.KeyDown:connect(function(k)

	if k == "z" and CD1==false and attack == false  then
		CD1=true
		Spearthrow()
		--Spearmovethink()
		wait(5)
		CD1=false
	end
	if k == "v" and CD2==false and attack == false and mode == 1 then
		CD2=true
		Epicspearmove()
		wait(60)
		CD2=false
	elseif k == "v" and CD2==true and attack == false and mode == 1 then
	end
	if k == "r" and attack == false then
		FIUUM()
	end

	if k == "n" and attack == false and mode == 1 then
		local particlemiter = Instance.new("ParticleEmitter",hed) 
		particlemiter.Texture = "rbxassetid://241779220" 
		particlemiter.Size = NumberSequence.new(2,.5) 
		particlemiter.Transparency = NumberSequence.new(0,1) 
		particlemiter.Enabled = true 
		particlemiter.LockedToPart = false 
		particlemiter.Speed = NumberRange.new(20) 
		particlemiter.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
		particlemiter.RotSpeed = NumberRange.new(210) 
		particlemiter.Lifetime = NumberRange.new(2) 
		particlemiter.SpreadAngle = Vector2.new(-100,100) 
		particlemiter.Rate = 500 
		local particlemiter2 = Instance.new("ParticleEmitter",hed) 
		particlemiter2.Texture = "rbxassetid://241779220" 
		particlemiter2.Size = NumberSequence.new(2,.5) 
		particlemiter2.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
		particlemiter2.Transparency = NumberSequence.new(0,1) 
		particlemiter2.Enabled = true 
		particlemiter2.LockedToPart = false 
		particlemiter2.Speed = NumberRange.new(20) 
		particlemiter2.RotSpeed = NumberRange.new(210) 
		particlemiter2.Lifetime = NumberRange.new(2) 
		particlemiter2.SpreadAngle = Vector2.new(-100,100) 
		particlemiter2.Rate = 500 
		local particlemiter3 = Instance.new("ParticleEmitter",hed) 
		particlemiter3.Texture = "rbxassetid://241779220" 
		particlemiter3.Size = NumberSequence.new(2,.5) 
		particlemiter3.Transparency = NumberSequence.new(0,1) 
		particlemiter3.Color = ColorSequence.new(bc("Toothpaste").Color,bc("Toothpaste").Color)
		particlemiter3.Enabled = true 
		particlemiter3.LockedToPart = false 
		particlemiter3.Speed = NumberRange.new(20) 
		particlemiter3.RotSpeed = NumberRange.new(210) 
		particlemiter3.Lifetime = NumberRange.new(2) 
		particlemiter3.SpreadAngle = Vector2.new(-100,100) 
		particlemiter3.Rate = 500 
		wait(.15) 
		coroutine.wrap(function() 
			particlemiter.Enabled = false 
			particlemiter2.Enabled = false 
			particlemiter3.Enabled = false 
			wait(5) 
			particlemiter3:Remove() 
			particlemiter:Remove() 
			particlemiter2:Remove() 
		end)() 
	end
	if k == "p" and attack == false and mode == 0 then
		Changemode()
	end
end)


local SwimType = 1
aerrtee = 0




local hh = (char['Right Leg'].Size.Y+char.HumanoidRootPart.Size.Y/2)

local smokepart = Instance.new('Part',root)
smokepart.Size = Vector3.new(0.5,0,1.5)
smokepart.CanCollide = false
smokepart.Transparency = 1
local skpartweld = Instance.new('Weld',smokepart)
skpartweld.Part0 = smokepart
skpartweld.Part1 = root
skpartweld.C0 = CFrame.new(0,hh,0)
local smokt = Instance.new("ParticleEmitter")
smokt.Acceleration = Vector3.new(0, 2.5, 0)
smokt.Speed = NumberRange.new(1)
smokt.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(1, 1.5)})
smokt.SpreadAngle = Vector2.new(100, 100)
smokt.Lifetime = NumberRange.new(1)
smokt.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(0.429, 0.319), NumberSequenceKeypoint.new(0.749, 0.856), NumberSequenceKeypoint.new(1, 1)})
smokt.Drag = 1
smokt.Color = ColorSequence.new(Color3.new(0.737255, 0.737255, 0.737255), Color3.new(1, 1, 1))
smokt.RotSpeed = NumberRange.new(10)
smokt.Texture = "http://www.roblox.com/asset/?id=2263365802"
smokt.Parent = smokepart
smokt.Enabled = false

Humanoid.MaxHealth = "250"
Humanoid.Health = "250"
Instance.new("ForceField",char).Visible = false


hum.BreakJointsOnDeath = false






idleanim=.4
while true do
	if mutedtog == false then
		--kmusic.Volume = ORVOL
	elseif mutedtog == true then
		--kmusic.Volume = 0
	end
	--kmusic.PlaybackSpeed = ORPIT
	--kmusic.Pitch = ORPIT
	--kmusic.SoundId = "rbxassetid://" ..ORGID
	--kmusic.Looped = true
	--kmusic.Parent = root
	--kmusic:Resume()
	CameraManager()
	swait()
	doe=doe+1
	sine = sine + change

	musictime = music.TimePosition
	if music ~= nil then
		music.Parent = tors
		music.Volume = volchoice
		music.Looped = true
		music.Pitch = pitchchoice
		music.EmitterSize = es
		music.Name = "CustomMusic"
		if music.SoundId ~= "rbxassetid://"..SoundReplace(ORGID) then
			music.SoundId = "rbxassetid://"..SoundReplace(ORGID)
		end
	end	

	local sidevec = math.clamp((root.Velocity*root.CFrame.rightVector).X+(root.Velocity*root.CFrame.rightVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
	local forwardvec =  math.clamp((root.Velocity*root.CFrame.lookVector).X+(root.Velocity*root.CFrame.lookVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
	local sidevelocity = sidevec/hum.WalkSpeed
	local forwardvelocity = forwardvec/hum.WalkSpeed



	if Humanoid.Health < 30 and deadii == false and Death == false and mode == 0 then
		deadii = true
		ORGID = 0
		Changemode()
	end
	if Humanoid.Health < 30 and deadii2 == false and Death == true and mode == 1 then
		deadii2 = true
		ORGID = 0
		dead()
	end
	if deadii2 == true then
		for _, c in pairs(Character:GetChildren()) do
			if c.ClassName == "Part" then
				if c.Transparency == 0 and c:FindFirstChild("Dust") == nil then
					particles(c)
				end
			end
		end
	end

	if attack == true then
		smokt.Enabled = false 
	end
	local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
	local velderp=RootPart.Velocity.y
	hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
	coroutine.resume(coroutine.create(function()
		if hitfloor ~= nil then
			--sphereMK(2,math.random(5,10)/45,"Add",root.CFrame*CFrame.new(math.random(-3,3),-10,math.random(-3,3))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.5,0.5,0.5,0,BrickColor.new("Really red"),0)
			--slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.002,0.01),math.random(5,10)/250,BrickColor.new("White"))
		end
	end))
	if equipped==true or equipped==false then
		if attack==false then
			idle=idle+1
		else
			idle=0
		end
		if idle>=500 then
			if attack==false then
				--Sheath()
			end
		end
		if Anim ~= "Idle" then
			change = 1
		else
			change = 0.90
		end
		if hum:GetState() == Enum.HumanoidStateType.Swimming and torvel<1 then
			Anim="SwimIdle"
			if attack == false then
				local Alpha = .3
				if SwimType == 1 then
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1,-0.1)*angles(math.rad(11.2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.5,-0.6)*angles(math.rad(-24.8),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.6,-0.1)*angles(math.rad(70.5),math.rad(-15.8),math.rad(-53.9 + 40 * math.cos(sine/30))),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.7,0.5,-0.1)*angles(math.rad(64.7),math.rad(19),math.rad(43.1 - 40 * math.cos(sine/30))),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*necko,.1)
				end
			end
		elseif hum:GetState() == Enum.HumanoidStateType.Swimming and torvel>1 then
			Anim="Swim"
			if attack == false then
				local Alpha = .3
				if SwimType == 1 then
					--Front crawl
					aerrtee = aerrtee + 10
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1.1,0.2)*angles(math.rad(-5 - 20 * math.cos(sine/7)),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.8,-0.1)*angles(math.rad(5 + 20 * math.cos(sine/7)),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					RW.C0=clerp(RW.C0,cf(1.43,0.45 + 0.135 * math.cos(sine / 28),0)*angles(math.rad(0 + 6 * math.cos(sine / 22*-1.25)),math.rad(3 - 2 * math.cos(sine / 28*-1.25)),math.rad(90 + 90 * math.sin(sine / 14))),.1)
					LW.C0=clerp(LW.C0,cf(-1.43,0.6 + 0.135 * math.cos(sine / 28),0)*angles(math.rad(0 - 7 * math.cos(sine / 16*-1.25)),math.rad(4 - 3 * math.cos(sine / 29*-1.25)),math.rad(-90 - 90 * math.sin(sine / 14))),.1)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,-0.5)*angles(math.rad(28.4),math.rad(0),math.rad(0))*necko,.1)
				end
			end
		elseif RootPart.Velocity.y > 1 and hitfloor==nil then 
			Anim="Jump"
			if attack==false then
				HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

				RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-10),math.rad(0),math.rad(0)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-2.5),math.rad(0),math.rad(0)),.1)
				RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(25)),.1)
				LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(-25)),.1)
			end
		elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
			Anim="Fall"
			if attack==false then
				HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

				RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(10),math.rad(0),math.rad(0)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(0),math.rad(0)),.1)
				RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(55)),.1)
				LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(-55)),.1)
			end
		elseif torvel<1 and hitfloor~=nil and Humanoid.Sit == false then
			Anim="Idle"
			if attack==false then
				if mode == 0 then
					smokt.Enabled = false 
					HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),-0.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)


					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(2 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(8 + 3 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
				elseif mode == 1 then
					smokt.Enabled = false
					HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(-10),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),-0.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(-10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)


					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(2 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(8 + 3 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
				end
			end
		elseif torvel>2 and torvel<22 and hitfloor~=nil and Humanoid.Sit == false then
			Anim="Walk"
			if attack==false then
				if mode == 0 then
					smokt.Enabled = true 
					HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)
					RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 45 * math.cos(sine / 8))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 45 * math.cos(sine / 8))),.1)

					--RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 + 0.05 * math.cos(sine / 4))*angles(math.rad(5 + 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)

					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.3 + 0.05 * math.cos(sine / 4))*angles(math.rad(5 + 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(-5 - 5 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 10 * math.cos(sine / 8))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 20) ,0)*angles(math.rad(0),math.rad(-30),math.rad(20)),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)

				elseif attack == true and movelegs == true then
					RH.C0 = clerp(RH.C0, cf(1, -0.8 - 0.5 * math.cos(sine / 7) / 2, 0.6 * math.cos(sine / 7) / 2)  * angles(math.rad(-15 - 25 * math.cos(sine / 7)) - rl.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
					LH.C0 = clerp(LH.C0, cf(-1, -0.8 + 0.5 * math.cos(sine / 7) / 2, -0.6 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 25 * math.cos(sine / 7)) + ll.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
				elseif mode == 1 then
					smokt.Enabled = true 
					RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, -0.175 + 0.10 * math.cos(sine / 3.5) + -math.sin(sine / 3.5) / 7) * angles(math.rad(3 - 2.5 * math.cos(sine / 3.5)), math.rad(0) - root.RotVelocity.Y / 75, math.rad(4 * math.cos(sine / 7))), 0.15)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, necko* cf(0,0,0.2) * angles(math.rad(0), math.rad(0), math.rad(0) - hed.RotVelocity.Y / 15), 0.3)
					RH.C0 = clerp(RH.C0, cf(1, -0.8 - 0.5 * math.cos(sine / 7) / 2, 0.6 * math.cos(sine / 7) / 2)  * angles(math.rad(-15 - 25 * math.cos(sine / 7)) - rl.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
					LH.C0 = clerp(LH.C0, cf(-1, -0.8 + 0.5 * math.cos(sine / 7) / 2, -0.6 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 25 * math.cos(sine / 7)) + ll.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
					RW.C0 = clerp(RW.C0, cf(1.5* Player_Size, 0.5 + 0.05 * Sin(sine / 8)* Player_Size, 0) * angles(Rad(75 + 9 * Sin(sine / 4)) + root.RotVelocity.Y / 75, Rad(0), Rad(10) + root.RotVelocity.Y / -75), 0.1)
					LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.05 * Sin(sine / 8)* Player_Size, 0 + 0.5 * Sin(sine / 8)* Player_Size) * angles(Rad(-45 * Sin(sine / 8)) + root.RotVelocity.Y / 75, Rad(10 * Cos(sine / 8)), Rad(-10) + root.RotVelocity.Y / -75), 0.1)
				elseif attack == true and movelegs == true then
					RH.C0 = clerp(RH.C0, cf(1, -0.8 - 0.5 * math.cos(sine / 7) / 2, 0.6 * math.cos(sine / 7) / 2)  * angles(math.rad(-15 - 25 * math.cos(sine / 7)) - rl.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
					LH.C0 = clerp(LH.C0, cf(-1, -0.8 + 0.5 * math.cos(sine / 7) / 2, -0.6 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 25 * math.cos(sine / 7)) + ll.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
				end
			end
		elseif torvel>=22 and hitfloor~=nil and Humanoid.Sit == false then
			Anim="Run"
			if attack==false then
				smokt.Enabled = true
				HW.C0 = clerp(HW.C0, CF(0, -1,0) * angles(Rad(0), Rad(-90), Rad(0)), 0.1)

				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(forwardvelocity*25),math.rad(-sidevelocity*20),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.3)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(-forwardvelocity*14),math.rad(-sidevelocity*14),math.rad(0)),.2)
				RH.C0=clerp(RH.C0,cf(1,-0.75 - 0/2 * math.cos(9 / 4),0+ forwardvelocity/2 * math.cos(50-sine / 4))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(sidevelocity*40 * math.cos(sine / 7)),math.rad(0),math.rad(0 - forwardvelocity*90 * math.cos(sine / 7))),.2)
				LH.C0=clerp(LH.C0,cf(-1,-0.75 + 0/2 * math.cos(9 / 4),0- forwardvelocity/2 * math.cos(50-sine / 4))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(sidevelocity*40 * math.cos(sine / 7)),math.rad(0),math.rad(0 - forwardvelocity*90 * math.cos(sine / 7))),.2)

				--Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5 - 5 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 10 * math.cos(sine / 8))),.1)
				--RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(25 - 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.3)
				RH.C0 = clerp(RH.C0, cf(1, -0.8 - 1 * math.cos(sine / 7) / 2, 0.6 * math.sin(sine / 7))  * angles(math.rad(-15 - 50 * math.cos(sine / 7)) - rl.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
				LH.C0 = clerp(LH.C0, cf(-1, -0.8 + 1 * math.cos(sine / 7) / 2, -0.6 * math.sin(sine / 7)) * angles(math.rad(-15 + 50 * math.cos(sine / 7)) + ll.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-90 - 10 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 2 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
				RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 20) ,0)*angles(math.rad(0),math.rad(-30),math.rad(20)),.1)
				--LW.C0 = clerp(LW.C0, cf(-1.5, 0.5 + 0.05 * math.sin(sine / 7), 0 + 0.5 * math.cos(sine / 7)) * angles(math.rad(-78)  * math.cos(sine / 7) , math.rad(8 * math.cos(sine / 7)) ,   math.rad(-6) + la.RotVelocity.Y/75), 0.3)
				LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0-forwardvelocity*14- forwardvelocity*75 * math.cos(sine / 7)),math.rad(0),math.rad(-10)),.2)

			end
		elseif hitfloor ~= nil and Humanoid.Sit == true then
			Anim = "Sit"
			if attack == false then
				if mode == 0 then
					RH.C0 = clerp(RH.C0, cf(1, -0.9, 0) * angles(math.rad(85), math.rad(90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, 0) * angles(math.rad(85), math.rad(-90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.01 * math.cos(sine / 32),-0.3)*angles(math.rad(0 - 2 * math.cos(sine / 88)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 88))),.1)

					--RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0.2)*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(2 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(8 + 3 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-14 - 3 * math.cos(sine / 45))),.1)
				elseif mode == 1 then
					RH.C0 = clerp(RH.C0, cf(1, -0.9, 0) * angles(math.rad(85), math.rad(90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, 0) * angles(math.rad(85), math.rad(-90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.01 * math.cos(sine / 32),-0.3)*angles(math.rad(0 - 2 * math.cos(sine / 88)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 88))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(10 + 2 * math.cos(sine / 53))),.1)
					RW.C0 = clerp(RW.C0, CF(1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 24)* Player_Size, -0.05* Player_Size) * angles(Rad(70 + 3 * Sin(sine / 24)), Rad(0), Rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CF(-1.5* Player_Size, 0.5 + 0.1 * Sin(sine / 24)* Player_Size, 0* Player_Size) * angles(Rad(0), Rad(0), Rad(-10 + 5 * Cos(sine / 24))), 0.1)
				end
			end
		end
	end
end

--The end of the story bruh.

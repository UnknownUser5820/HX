--Ruin FX bruh


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

plr = game:GetService("Players").LocalPlayer
char = plr.Character
hum = char.Humanoid
local cam = game.Workspace.CurrentCamera
t = char.Torso
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
it = Instance.new
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
Euler = CFrame.fromEulerAnglesXYZ
local muter = false
local ORGID = 14638577578
local ORVOL = 1.15
local ORPIT = 1.01
-------------------------------------------------------
--Start Anti Nosounds
-------------------------------------------------------
local music
spawn(function()
	while wait() do
		if not root:FindFirstChild('Musi') then
			Theme = Instance.new("Sound")
			Theme.Parent = root
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.Volume = 5
			Theme.Name = "Musi"
			Theme.Looped = true
			Theme.Pitch = 1
			Theme:Play()
			-----------------
			music = sound2
		end
	end
end)


local MRC_A = BrickColor.new("Royal purple")
local MRC_B = BrickColor.new("Cyan")

function CameraEnshaking(Length,Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1*Intensity
		local rotM = 0.01*Intensity
		for i = 0, Length, 0.1 do
			swait()
			intensity = intensity - 0.05*Intensity/Length
			rotM = rotM - 0.0005*Intensity/Length
			hum.CameraOffset = vt(math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)))
			cam.CFrame = cam.CFrame * cf(math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity))) * Euler(math.rad(math.random(-intensity, intensity)) * rotM, math.rad(math.random(-intensity, intensity)) * rotM, math.rad(math.random(-intensity, intensity)) * rotM)
		end
		Humanoid.CameraOffset = vt(0, 0, 0)
	end))
end






local scrg = Instance.new("ScreenGui",plr.PlayerGui)
scrg.Name = "Movers"

local imlb = Instance.new("ImageLabel",scrg)
imlb.BackgroundTransparency = 1
imlb.BackgroundColor3 = Color3.new(0,0,0)
imlb.Image = "rbxassetid://2109045978"
imlb.Size = UDim2.new(0,500,0,500)
imlb.ImageColor3 = Color3.new(0,0.5,1)
imlb.ImageTransparency = 0.1
imlb.Position = UDim2.new(1,-250,0.5,-250)

local imlb2 = Instance.new("ImageLabel",scrg)
imlb2.BackgroundTransparency = 1
imlb2.BackgroundColor3 = Color3.new(0,0,0)
imlb2.Image = "rbxassetid://2344830904"
imlb2.Size = UDim2.new(0,400,0,400)
imlb2.ImageColor3 = Color3.new(0,0.5,1)
imlb2.ImageTransparency = 0
imlb2.Position = UDim2.new(1,-200,0.5,-200)
local imlbg = Instance.new("ImageLabel",scrg)
imlbg.BackgroundTransparency = 1
imlbg.BackgroundColor3 = Color3.new(0,0,0)
imlbg.Image = "rbxassetid://2344870656"
imlbg.Size = UDim2.new(0,800,0,800)
imlbg.ImageColor3 = Color3.new(0.5,0,1)
imlbg.ImageTransparency = 0
imlbg.Position = UDim2.new(1,-400,0.5,-400)


local ned = Instance.new("TextLabel",scrg)
ned.ZIndex = 2
ned.Font = "SciFi"
ned.BackgroundTransparency = 1
ned.BorderSizePixel = 0.45
ned.Size = UDim2.new(0.4,0,0.1,0)
ned.Position = UDim2.new(0,0,0.8,0) --UDim2.new(0.6,0,0.8,0)
ned.TextColor3 = BrickColor.new("Royal purple").Color
ned.TextStrokeColor3 = BrickColor.new("Cyan").Color
ned.TextScaled = true
ned.TextStrokeTransparency = 0
ned.Text = "NEPTUNIAN V"
ned.TextSize = 24
ned.Rotation = 1
--ned.TextXAlignment = "Right"
ned.TextYAlignment = "Bottom"



function chatfunc(text,color,typet,font,timeex)
	local chat = coroutine.wrap(function()
		if Character:FindFirstChild("TalkingBillBoard")~= nil then
			Character:FindFirstChild("TalkingBillBoard"):destroy()
		end
		local naeeym2 = Instance.new("BillboardGui",Character)
		naeeym2.Size = UDim2.new(0,100,0,40)
		naeeym2.StudsOffset = Vector3.new(0,3,0)
		naeeym2.Adornee = Character.Head
		naeeym2.Name = "TalkingBillBoard"
		local tecks2 = Instance.new("TextLabel",naeeym2)
		tecks2.BackgroundTransparency = 1
		tecks2.BorderSizePixel = 0
		tecks2.Text = ""
		tecks2.Font = font
		tecks2.TextSize = 30
		tecks2.TextStrokeTransparency = 0
		tecks2.TextColor3 = color
		tecks2.TextStrokeColor3 = Color3.new(0,0,0)
		tecks2.Size = UDim2.new(1,0,0.5,0)
		local tecks3 = Instance.new("TextLabel",naeeym2)
		tecks3.BackgroundTransparency = 1
		tecks3.BorderSizePixel = 0
		tecks3.Text = ""
		tecks3.Font = font
		tecks3.TextSize = 30
		tecks3.TextStrokeTransparency = 0
		if typet == "Inverted" then
			tecks3.TextColor3 = Color3.new(0,0,0)
			tecks3.TextStrokeColor3 = color
		elseif typet == "Normal" then
			tecks3.TextColor3 = color
			tecks3.TextStrokeColor3 = Color3.new(0,0,0)
		end
		tecks3.Size = UDim2.new(1,0,0.5,0)
		coroutine.resume(coroutine.create(function()
			while true do
				swait(1)
				if chaosmode == true then
					tecks2.TextColor3 = BrickColor.random().Color
					tecks3.TextStrokeColor3 = BrickColor.random().Color
				end
			end
		end))
		for i = 0, 74*timeex do
			swait()
			tecks2.Text = text
			tecks3.Text = text
		end
		local randomrot = math.random(1,2)
		if randomrot == 1 then
			for i = 1, 50 do
				swait()
				tecks2.Text = text
				tecks3.Text = text
				tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks2.TextTransparency = tecks2.TextTransparency + .04
				tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks3.TextTransparency = tecks2.TextTransparency + .04
			end
		elseif randomrot == 2 then
			for i = 1, 50 do
				swait()
				tecks2.Text = text
				tecks3.Text = text
				tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks2.TextTransparency = tecks2.TextTransparency + .04
				tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks3.TextTransparency = tecks2.TextTransparency + .04
			end
		end
		naeeym2:Destroy()
	end)
	chat()
end

function warnedpeople(text,represfont,color,color2)
	if disably ~= true then
		coroutine.resume(coroutine.create(function()
			if plr.PlayerGui:FindFirstChild("Spinny")~= nil then
				plr.PlayerGui:FindFirstChild("Spinny"):destroy()
			end
			local scrg = Instance.new("ScreenGui",plr.PlayerGui)
			scrg.Name = "Spinny"
			local frm = Instance.new("TextLabel",scrg)
			frm.BackgroundTransparency = 0.75
			frm.BackgroundColor3 = color2
			frm.BorderSizePixel = 0
			frm.Rotation = 0
			frm.Size = UDim2.new(4,0,0,75)
			frm.Position = UDim2.new(-4,0,0,0)
			frm.Text = text
			frm.Font = represfont
			frm.TextColor3 = color
			frm.TextStrokeColor3 = MRC_B.Color
			frm.TextScaled = true
			local frm2 = frm:Clone()
			frm2.Parent = scrg
			frm2.BackgroundColor3 = color2
			frm2.Position = UDim2.new(-4.05,0,22222222,0)
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
			coroutine.resume(coroutine.create(function()
				while true do 
					swait()
					if ERROR == true then
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
					frm.Rotation = frm.Rotation - 0
					frm2.Size = frm2.Size + UDim2.new(0.1,0,0,0)
					frm2.Rotation = frm.Rotation + 0.325
					txtlb2.Rotation = txtlb2.Rotation - 5.125
				end
				for i = 0, 99 do
					swait()
					fval = fval + 0.05
					flol = flol + 0.005
					frm.Size = frm.Size + UDim2.new(0.005,0,0,0)
					frm.Rotation = frm.Rotation - 0
					frm2.Size = frm2.Size + UDim2.new(0.005,0,0,0)
					frm2.Rotation = frm2.Rotation + 0.125
					txtlb2.Rotation = txtlb2.Rotation - 1.125
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
					frm.Size = frm.Size + UDim2.new(0.005*vinc2,0,0,0)
					frm.Rotation = frm.Rotation + 0*vinc2
					frm2.Size = frm2.Size + UDim2.new(0.005*vinc2,0,0,0)
					frm2.Rotation = frm2.Rotation + 0.225*vinc2
					frm2.BackgroundTransparency = frm2.BackgroundTransparency + 0.0075
					frm.BackgroundTransparency = frm.BackgroundTransparency + 0.0075
					txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
					txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
				end
				scrg:Destroy()
			end))
		end))
	end
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
		txtlb.BackgroundColor3 = MRC_B.Color
		txtlb.TextStrokeColor3 = MRC_B.Color
		txtlb.TextScaled = true
		txtlb.Size = UDim2.new(1,0,0.25,0)
		txtlb.TextXAlignment = "Left"
		txtlb.Position = UDim2.new(0,0,0.75 + 1,0)
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


local namebillboard = Instance.new("BillboardGui")
local textt = Instance.new("TextBox")
local ffg = Instance.new("TextBox")
namebillboard.Size = UDim2.new(4, 0, 1, 0)
namebillboard.Name = "NameBillboard"
namebillboard.StudsOffset = Vector3.new(0, 3, 0)
namebillboard.Parent = hed
textt.TextWrapped = true
textt.BackgroundTransparency = 1
textt.BackgroundColor3 = Color3.new(1, 1, 1)
textt.TextSize = 12
textt.TextScaled = true
textt.Font = Enum.Font.Fantasy
textt.TextSize = Enum.FontSize.Size12
textt.Text = 'NEPTUNIAN'
textt.TextStrokeTransparency = 0
textt.Position = UDim2.new(0,0,0,0)
textt.TextStrokeColor3 = MRC_B.Color
textt.TextColor = MRC_A
textt.Size = UDim2.new(1, 0, 1, 0)
textt.Parent = namebillboard

ffg.TextWrapped = true
ffg.BackgroundTransparency = 1
ffg.BackgroundColor3 = Color3.new(1, 1, 1)
ffg.TextSize = 12
ffg.TextScaled = true
ffg.Font = Enum.Font.Fantasy
ffg.TextYAlignment = 'Bottom'
ffg.TextSize = Enum.FontSize.Size12
ffg.Text = 'V'
ffg.TextStrokeTransparency = 0
ffg.TextStrokeColor3 = MRC_B.Color
ffg.TextColor = MRC_A
ffg.Position = UDim2.new(0,0,0.9,0)
ffg.Size = UDim2.new(1, 0, 1, 0)
ffg.Parent = namebillboard
function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
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
				game:GetService("Debris"):AddItem(S, 30)
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



New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end



JarModel = Instance.new("Model", char)
JarModel.Name = "JarModel"
JarModel.Parent = nil
JarHandle = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0, 1, "Cyan", "JarHandle", Vector3.new(0.734439611, 0.477309436, 0.715112269))
JarHandleWeld = CFuncs.Weld.Create(JarHandle, char["Left Arm"], JarHandle, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.00576019287, -0.133415222, -1.10377526, -1, 0, 0, 0, 0, -1, 0, -1, 0))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Cyan", "Part", Vector3.new(0.734439611, 0.193273589, 0.734439611))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0.350410461, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("SpecialMesh", Part, Enum.MeshType.Sphere, "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Cyan", "Part", Vector3.new(0.773094356, 0.773094356, 0.734439611))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, -0.0361404419, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Mid gray", "Part", Vector3.new(0.773094356, 0.773094356, 0.773094356))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, -0.0361404419, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Mid gray", "Part", Vector3.new(0.773094356, 0.231928319, 0.773094356))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0.350410461, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("SpecialMesh", Part, Enum.MeshType.Sphere, "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Mid gray", "Part", Vector3.new(0.734439611, 0.0773094371, 0.773094356))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, -0.499992371, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Mid gray", "Part", Vector3.new(0.676457405, 0.0720000044, 0.773094356))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0.00965881348, -0.442008972, -0.00966250896, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 0.536871016, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Cyan", "Part", Vector3.new(0.676457405, 0.0720000044, 0.715112269))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0.00965881348, -0.442008972, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 0.536871016, 1))
Part = CFuncs.Part.Create(JarModel, Enum.Material.SmoothPlastic, 0.30000001192093, 0.60000002384186, "Cyan", "Part", Vector3.new(0.734439611, 0.0773094371, 0.715112269))
PartWeld = CFuncs.Weld.Create(JarModel, JarHandle, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, -0.499992371, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
CFuncs.Mesh.Create("CylinderMesh", Part, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))

local m = Instance.new("Model",char)
local movelegs = false
function CreateParta(parent,transparency,reflectance,material,brickcolor)
	local p = Instance.new("Part")
	p.TopSurface = 0
	p.BottomSurface = 0
	p.Parent = parent
	p.Size = Vector3.new(0.05,0.05,0.05)
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
	mesh.Scale = Vector3.new(x1*20,y1*20,z1*20)
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




---- WEAPON OR STUFF




--------------- WINGS
local mainpart = CreateParta(m,1,0,"SmoothPlastic",BrickColor.Random())
local mwingweld = CreateWeld(mainpart,tors,mainpart,0,-0.5,-0.75,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local wng1a = CreateParta(m,1,0,"Neon",BrickColor.new("Alder"))
CreateMesh(wng1a,"Wedge",0.1,4,4)
CreateWeld(wng1a,mainpart,wng1a,0,-2,-2.5,math.rad(0),math.rad(70),math.rad(5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local wng2a = CreateParta(m,1,0,"Neon",BrickColor.new("Alder"))
CreateMesh(wng2a,"Wedge",0.1,4,4)
CreateWeld(wng2a,mainpart,wng2a,0,-2,-2.5,math.rad(0),math.rad(-70),math.rad(-5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local wng1b = CreateParta(m,1,0,"Neon",BrickColor.new("Alder"))
CreateMesh(wng1b,"Wedge",0.1,1.5,3)
CreateWeld(wng1b,mainpart,wng1b,0,-1,-2.25,math.rad(180),math.rad(-110),math.rad(-5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local wng2b = CreateParta(m,1,0,"Neon",BrickColor.new("Alder"))
CreateMesh(wng2b,"Wedge",0.1,1.5,3)
CreateWeld(wng2b,mainpart,wng2b,0,-1,-2.25,math.rad(180),math.rad(110),math.rad(5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
------


function lerp(object, newCFrame, alpha)
	return object:lerp(newCFrame, alpha)
end

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
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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




Player=game:GetService("Players").LocalPlayer
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
--Face = Head.face
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
attackdebounce = false 
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=.2
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
local sine = 0
local change = 1
player=nil 

mouse=Player:GetMouse()
--save shoulders 
RSH, LSH=nil, nil 
--welds 
RW, LW=Instance.new("Weld"), Instance.new("Weld") 
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
TorsoColor=Torso.BrickColor
function NoOutline(Part)
	Part.TopSurface,Part.BottomSurface,Part.LeftSurface,Part.RightSurface,Part.FrontSurface,Part.BackSurface = 10,10,10,10,10,10
end
player=Player 
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
	for _, v in pairs(hit.Parent:children()) do
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
				warnedpeople("Gained Kill","Arcade",BrickColor.new("Royal purple").Color,BrickColor.new("Cyan").Color)

				dmg(h.Parent)
			end
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage / 2
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
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
function ShowDamage(Pos, Text, Time, Color)
	coroutine.resume(coroutine.create(function()
		local Rate = 0.03333333333333333
		local Pos = Pos or Vector3.new(0, 0, 0)
		local Text = Text or ""
		local Color = Color or Color3.new(1, 0, 1)
		local EffectPart = CreatePart(Character, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
		EffectPart.Anchored = true
		EffectPart.CFrame = CFrame.new(Pos)
		local BillboardGui = Create("BillboardGui")({
			Size = UDim2.new(6, 0, 6, 0),
			Adornee = EffectPart,
			Parent = EffectPart,
			AlwaysOnTop=true,
			Active=true
		})
		local TextLabel = Create("TextLabel")({
			BackgroundTransparency = 1,
			AnchorPoint=Vector2.new(.5,.5),
			Position = UDim2.new(.5, 0, .5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Text = DMG ..Text,
			TextColor3 = MRC_A.Color,
			TextStrokeColor3 = Color3.new(0,0,0),
			TextStrokeTransparency=0,
			TextScaled = true,
			Font = "Arcade",
			Parent = BillboardGui,
			ZIndex=4,
		})
		local raise=.2
		local rot=math.random(-10,10)/15
		local aaa=math.random(-360,360)
		local bbb=math.random(-360,360)
		for aaa=0,2,.01 do
			swait()
			raise=raise-.008
			TextLabel.Rotation = TextLabel.Rotation+rot
			TextLabel.TextTransparency=aaa
			TextLabel.TextStrokeTransparency=aaa
			EffectPart.Position=EffectPart.Position+Vector3.new(0,raise,0)
		end
		wait(3)
		BillboardGui:Remove()
		EffectPart:Remove()
	end))
end
function MagniDamage(Part, magni, mindam, maxdam, knock, Type,Sound)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChildOfClass("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if magni >= mag and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://" ..Sound, 3)
				end
			end
			local head = c:findFirstChild("UpperTorso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if magni >= mag and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://231917784", 3)
				end
			end
		end
	end
end


function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 
----

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
			CFuncs["Sound"].Create("rbxassetid://62339698", char, 0.5, 0.3)

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
							local bld = Instance.new("ParticleEmitter",v)
							bld.LightEmission = 1
							bld.Texture = "rbxassetid://284205403"
							bld.Color = ColorSequence.new(Color3.new(1,1,1))
							bld.Rate = 50
							bld.Lifetime = NumberRange.new(1)
							bld.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.75,0),NumberSequenceKeypoint.new(1,0,0)})
							bld.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
							bld.Speed = NumberRange.new(0,0)
							bld.VelocitySpread = 50000
							bld.Rotation = NumberRange.new(-500,500)
							bld.RotSpeed = NumberRange.new(-500,500)
							local sbs = Instance.new("BodyPosition", v)
							sbs.P = 3000
							sbs.D = 1000
							sbs.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
							sbs.position = v.Position + Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
							v.Color = Color3.new(1,1,1)
							coroutine.resume(coroutine.create(function()
								for i = 0, 49 do
									swait(1)
									v.Transparency = v.Transparency + 0.02
								end
								CFuncs["Sound"].Create("rbxassetid://1192402877", v, 0.25, 1)
								bld.Speed = NumberRange.new(1,5)
								bld.Acceleration = vt(0,10,0)
								wait(0.5)
								bld.Enabled = false
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

function sphere(bonuspeed,type,pos,scale,value,color)
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
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	if rainbowmode == true then
		rng.Color = Color3.new(r/255,g/255,b/255)
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

function sphereEXTRA(bonuspeed,type,pos,scale,value,value2,value3,color)
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

function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color,color3)
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

function sphereMK(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,color3,outerpos)
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
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = vt(x1,y1,z1)
	if rainbowmode == true then
		rng.Color = Color3.new(r/255,g/255,b/255)
	end
	local scaler2 = 1
	local speeder = FastSpeed
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
			speeder = speeder - 0.01*FastSpeed*bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + 0.01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, 0)
		end
		rng:Destroy()
	end))
end

function waveEff(bonuspeed,type,typeoftrans,pos,scale,value,value2,color)
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
	local scaler2b = 1
	if type == "Add" then
		scaler2 = 1*value
		scaler2b = 1*value2
	elseif type == "Divide" then
		scaler2 = 1/value
		scaler2b = 1/value2
	end
	local randomrot = math.random(1,2)
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,0.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - 0.01*value/bonuspeed
				scaler2b = scaler2b - 0.01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - 0.01/value*bonuspeed
				scaler2b = scaler2b - 0.01/value*bonuspeed
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
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2*bonuspeed)
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







m=Instance.new('Model',Character)
it=Instance.new
function nooutline(part)
	part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
end
function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
	local fp=it("Part")
	fp.formFactor=formfactor
	fp.Parent=parent
	fp.Reflectance=reflectance
	fp.Transparency=transparency
	fp.CanCollide=false
	fp.Locked=true
	fp.BrickColor=BrickColor.new(tostring(brickcolor))
	fp.Name=name
	fp.Size=size
	fp.Position=Character.Torso.Position
	nooutline(fp)
	fp.Material=material
	fp:BreakJoints()
	return fp
end
function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh=it(Mesh)
	mesh.Parent=part
	if Mesh=="SpecialMesh" then
		mesh.MeshType=meshtype
		mesh.MeshId=meshid
	end
	mesh.Offset=offset
	mesh.Scale=scale
	return mesh
end
function weld(parent,part0,part1,c0,c1)
	local weld=it("Weld")
	weld.Parent=parent
	weld.Part0=part0
	weld.Part1=part1
	weld.C0=c0
	weld.C1=c1
	return weld
end

m.Parent = nil
rarmor=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Mid gray","Handle",Vector3.new(0.275000006, 1.73512506, 0.280375004))
HandleWeld=weld(m,Character["Right Arm"],rarmor,CFrame.new(0, 0, 0, 1, -1.10559327e-007, 0, 1.10559313e-007, 0.999999881, -6.82671057e-008, 7.54756585e-015, 6.82671129e-008, 1),CFrame.new(-0.069039166, -0.113463402, 1.04289675, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",rarmor,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.228, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.96695328e-006, 1.76659834, -0.297748327, 1, -1.86023797e-007, 5.96046519e-008, -5.96047443e-008, -4.97983308e-007, 1, -1.86023769e-007, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.569999993, 0.125, 0.375))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.214124978, 0.205375016))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, 1.86247182, 0.341249466, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.569999993, 0.75, 0.75))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.228, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, 1.76659834, 0.369124293, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.569999993, 0.125, 0.375))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.252000004, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.78813934e-006, -1.95409656, 0.369124651, 1, -3.5029597e-008, -5.96046519e-008, -5.96046306e-008, 6.17193905e-007, -1, 3.50296325e-008, 1, 6.17193905e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.569999993, 0.125, 0.375))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.252000004, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-8.94069672e-007, -1.95409656, -0.297748804, -1, -5.23922949e-008, 5.96046519e-008, -5.96046803e-008, 6.17193905e-007, -1, 5.23922594e-008, -1, -6.17193905e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.569999993, 0.125, 0.375))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.13575315, -0.0312535167, 1.63871276, -5.96046448e-008, -0.707106888, -0.707106709, 1, 1.651742e-007, -2.49467973e-007, 2.93196308e-007, -0.707106709, 0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.413124949, 0.622375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.98023224e-007, -1.16725111, -1.41408849, 1, 1.56260029e-007, -2.68220901e-007, -7.91682311e-008, -0.707106948, -0.70710665, -3.00153374e-007, 0.70710665, -0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.204125047, 0.287375003))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.02655792e-006, -1.16711032, -0.0589969158, 1, 1.08027862e-007, 0, -5.37960721e-014, 4.97983308e-007, -1, -1.08027862e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.448374987))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.36441803e-007, -2.35079217, 0.103010416, 1, 2.03386463e-007, -1.49011612e-007, -1.4901174e-007, 6.17194019e-007, -1, -2.03386378e-007, 1, 6.17194075e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.200000003, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, 1.71972668, 0.400372267, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 0.25, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.207000002, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-8.94069672e-007, -2.02871776, -0.278748035, -1, -1.71600149e-007, 5.96046519e-008, -5.96047229e-008, 4.38378009e-007, -1, 1.71600121e-007, -1, -4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.207000002, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(8.94069672e-007, -2.02871752, 0.419371605, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.223999977, 0.375375003))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(7.15255737e-007, -2.16047049, 0.508368373, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.699999988, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.405000031, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.35976458, -0.0312541127, 1.86352515, 5.96046448e-008, 0.500000238, -0.866025329, -1, -3.57641632e-008, -8.94739998e-008, -7.57096927e-008, 0.866025269, 0.500000238))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.203125, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0, -1.08190203, 0.2501719, 1, -3.12822095e-007, 5.96046519e-008, -1.13020228e-007, -0.173648566, 0.98480773, -2.97719339e-007, -0.98480767, -0.173648566))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.502499998, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.409124941, 0.360375017))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-4.05311584e-006, 1.95058596, 0.253540456, -1, 1.02354932e-007, -1.49011612e-007, -1.17442823e-007, 0.258818656, 0.965925932, 1.3743427e-007, 0.965925992, -0.258818686))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.200000003, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.68847609, 0.419371486, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.207000002, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(7.74860382e-007, -1.99747372, 0.400373936, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 0.25, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.4375, 0.25))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -1.18813586, 0.908314347, -1, -1.16559704e-008, -1.49011612e-007, -1.31319965e-007, 0.544638991, 0.838670731, 7.13820114e-008, 0.838670731, -0.544638932))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.405000031, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.35976434, -0.0312459469, 1.86352515, -1.49011612e-007, -0.500000238, 0.866025269, 1, -3.47141249e-009, 1.70059607e-007, -8.20235115e-008, 0.866025269, 0.500000238))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.409124911, 0.268375039))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.03983688e-006, 1.82663035, 1.68847704, -1, 2.51590194e-007, -1.49011612e-007, -2.54842973e-007, -0.500000179, 0.866025329, 1.43377648e-007, 0.866025269, 0.500000179))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.698124886, 0.372374952))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.455000013, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.200000003, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.08616257e-006, 1.6884762, -0.278747916, 1, -1.86023797e-007, 5.96046519e-008, -5.96047443e-008, -4.97983308e-007, 1, -1.86023769e-007, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.330124885, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(7.74860382e-007, 2.75683522, 1.15006804, 1, 2.61612684e-007, -5.96046519e-008, -4.6201059e-008, 0.386711121, 0.922201037, 2.64309278e-007, -0.922201037, 0.386711121))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 1, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.200000003, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.90734863e-006, 1.20410335, -0.1381253, 1, -1.30388145e-007, 5.96046519e-008, -5.96047158e-008, -4.97983308e-007, 1, -1.30388116e-007, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.13575315, -0.0312504768, 1.638713, 0, 0.707106888, 0.707106709, -1, -1.57551966e-007, 1.57552009e-007, 2.2281219e-007, -0.707106709, 0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-0.999259949, -0.0312482715, -0.496301651, 8.94069814e-008, 0.707106769, -0.707106829, 1, -2.08849031e-007, -8.2408441e-008, -2.0595013e-007, -0.707106829, -0.707106709))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.200000003, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.96695328e-006, 1.20410311, 0.278748631, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.745124936, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.96046448e-008, 0.302499771, 0.0937513113, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.415125012, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, -0.659994602, 0.135124326, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.630125046, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.14576721e-006, 1.25361502, 0.392871499, -1, 9.86020154e-008, -1.49011612e-007, -1.49011655e-007, -4.38377924e-007, 1, 9.86019515e-008, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.395000011, 0.75, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.248124972, 0.311374992))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.96046448e-008, 0.954994917, 0.140751123, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.25999999, 0.375, 0.21875))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -1.50817347, 0.125254035, -1, 6.68158862e-008, -1.49011612e-007, -1.4901164e-007, -4.97983194e-007, 1, 6.68158151e-008, 1, 4.97983194e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.300000012, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.35512504, 0.283374995))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.96046448e-008, 0.91299367, 0.281997681, -1, 9.86020154e-008, -1.49011612e-007, -1.49011655e-007, -4.38377924e-007, 1, 9.86019515e-008, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.203125, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, -0.781131983, 0.0222299099, -1, 2.86555604e-007, -5.96046519e-008, -1.08459133e-007, -0.173648685, 0.98480773, 2.71851889e-007, 0.98480773, 0.173648685))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.35512504, 0.416375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, 0.522374153, 0.125002146, -1, 9.86020154e-008, -1.49011612e-007, -1.49011655e-007, -4.38377924e-007, 1, 9.86019515e-008, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0.99925971, -0.0312514305, -0.496301413, 0, -0.707106709, 0.707106829, -1, 1.69960003e-007, 1.69959961e-007, -2.40359725e-007, -0.707106888, -0.707106769))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.643000007, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.51446462, -0.0312519073, 0.511714339, 0, -4.38378066e-007, 1, -1, 2.45074915e-007, 1.0743547e-013, -2.45074915e-007, -1, -4.38378066e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.54112494, 0.367374986))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.57627869e-007, -1.79205251, -0.0442371368, 1, 1.5625281e-007, -2.68220901e-007, -2.68220987e-007, 6.17193848e-007, -1, -1.56252639e-007, 1, 6.17193905e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.600000024))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.630125046, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, -0.552494049, 0.0937507153, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Mid gray","Part",Vector3.new(0.275000006, 0.216124982, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.78813934e-007, 0.63488543, 0.590048075, -1, 2.21816833e-007, 5.96046519e-008, -1.14701351e-007, -0.707106829, 0.707106769, 1.98995039e-007, 0.707106769, 0.707106829))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.309124947, 0.343375027))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.9935112e-006, 1.40163493, 1.65097666, -1, 2.51590194e-007, -1.49011612e-007, -2.54842973e-007, -0.500000179, 0.866025329, 1.43377648e-007, 0.866025269, 0.500000179))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.998124957, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, 0.428994179, 0.0937510729, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.405125052, 0.211375013))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, 0.446621895, 0.0734990835, -1, 9.86020154e-008, -1.49011612e-007, -1.49011655e-007, -4.38377924e-007, 1, 9.86019515e-008, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.413124949, 0.622375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.7285347e-006, 0.967765272, 0.720929861, -1, 2.21816833e-007, 5.96046519e-008, -1.14701351e-007, -0.707106829, 0.707106769, 1.98995039e-007, 0.707106769, 0.707106829))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.275000006, 0.320124894, 0.316374987))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.457500011, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.322125077, 0.363375008))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.84774399e-006, 0.960361481, 0.0573717356, 1, -6.68157512e-008, -5.96046519e-008, 5.96046164e-008, -4.97983308e-007, 1, -6.68157796e-008, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.51412493, 0.622375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.96695328e-006, 1.51446474, -0.287093759, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.204125047, 0.210375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, -1.12023759, -0.0676275492, -1, -2.06059703e-008, 0, -7.19086588e-015, 3.48970019e-007, -1, 2.06059703e-008, -1, -3.48970019e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.261124998, 0.245374992))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0, -0.201990128, 0.0982512236, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.375, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.206125051, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.38418579e-007, -0.137369633, 0.0937509537, -1, 9.86020154e-008, -1.49011612e-007, -1.49011655e-007, -4.38377924e-007, 1, 9.86019515e-008, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.578125, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.63588333e-006, -1.29723644, 0.0231808424, 1, -1.86023783e-007, -5.96046519e-008, 5.96045879e-008, -3.48969991e-007, 1, -1.86023797e-007, -1, -3.48969991e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.25999999, 0.225500003, 0.210125014))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-0.00167286396, 0.746741295, -0.00556850433, -1, 6.68158222e-008, -5.96046519e-008, 5.96046803e-008, 4.38378009e-007, -1, -6.68157938e-008, -1, -4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.214125022, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.81469727e-006, 0.381998301, -0.135124564, -1, -5.23922843e-008, 1.49011612e-007, -1.4901164e-007, 4.97983251e-007, -1, 5.23922097e-008, -1, -4.97983251e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.560000002, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.270000011, 0.21875, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.35113907e-006, -1.64879727, 0.0388069153, 1, -1.86023783e-007, -5.96046519e-008, 5.96045879e-008, -3.48969991e-007, 1, -1.86023797e-007, -1, -3.48969991e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.200000003, 0.449500024, 0.236624971))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0, -1.14855242, -0.0782039165, -1, 1.1814204e-007, -5.96046519e-008, -8.81511255e-008, -0.258819431, 0.965925753, 9.8689604e-008, 0.965925813, 0.258819431))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.200000003, 0.46875, 0.220999971))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -1.17250943, 0.949309707, -1, -1.16559704e-008, -1.49011612e-007, -1.31319965e-007, 0.544638991, 0.838670731, 7.13820114e-008, 0.838670731, -0.544638932))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.35212487, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.96695328e-006, 1.7106328, -4.67702293, 1, -5.28256834e-008, 3.27825546e-007, -1.54116776e-007, -0.948323309, 0.317305803, 2.94122714e-007, -0.317305803, -0.948323369))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.5, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.288000047, 0.200000003, 0.27837503))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.00251865, -0.0312470198, -0.784425139, -5.96046448e-008, 0.362437576, 0.932008028, 1, 8.8373362e-008, 2.95864595e-008, -7.16414377e-008, 0.932008028, -0.362437606))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.200000003, 0.217000008, 0.200375021))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-007, -3.18676305, -1.53718555, 1, 8.19928516e-008, -2.68220901e-007, -2.15646111e-007, -0.386710614, -0.922201157, -1.79337775e-007, 0.922201157, -0.386710614))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 0.200000003, 0.600000024))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.49000001, 0.200000003, 0.290374994))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.73874784, -0.0312489271, 0.358844757, -8.94069814e-008, -0.0130901812, 0.999914408, 1, 5.69744678e-008, 9.01605191e-008, -5.81498085e-008, 0.999914408, 0.0130901812))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.24712491, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.37090683e-006, 3.7712388, 4.10999966, 1, 2.20300279e-007, -3.27825546e-007, 7.26464435e-008, 0.713250935, 0.70090878, 3.88232309e-007, -0.70090884, 0.713250995))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.600000024, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.621124864, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.96046448e-007, 3.43644333, -0.254856586, 1, 2.8833017e-007, 5.96046519e-008, -4.31625189e-008, -0.0566928945, 0.998391747, 2.91245613e-007, -0.998391688, -0.0566928908))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 1, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.940000057, 0.200000003, 0.285374999))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.0734067, -0.0312533975, 4.65720272, 1.49011626e-007, 0.694658399, -0.719339788, -1, 3.30585053e-008, -1.75226305e-007, -9.79421202e-008, 0.719339788, 0.694658399))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.84512496, 0.422374964))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.76837158e-007, 3.25642681, 0.00496280193, 1, 2.88228279e-007, 5.96046519e-008, -5.96046021e-008, -1.70154109e-007, 1, 2.88228279e-007, -1, -1.70154095e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 1.04612494, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.03983688e-006, 6.0806818, -0.48661232, 1, 2.83280116e-007, 0, 3.20681721e-008, -0.113203041, 0.993571877, 2.81459165e-007, -0.993571937, -0.113203049))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.899999976, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.49000001, 0.200000003, 0.290374994))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.73874784, -0.0312509537, 0.358844757, 0, 0.0130901793, -0.999914348, -1, -5.85088848e-008, -7.65957409e-010, -5.85139013e-008, 0.999914408, 0.0130901802))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 1.46012485, 0.422374964))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.05311584e-006, 5.85410023, -0.495341063, 1, 2.75573711e-007, 1.49011612e-007, -1.16857876e-007, -0.113203339, 0.993571877, 2.90670897e-007, -0.993571937, -0.113203347))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.210000038, 0.200000003, 0.285374999))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-0.630329967, -0.0312533975, 7.20098686, 1.11758709e-008, 0.99984777, -0.017452918, -1, 8.5759515e-009, -1.49042407e-007, -1.48870043e-007, 0.0174529161, 0.99984777))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(1.78499997, 0.200000003, 0.301375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.64131165, -0.0312466621, 0.814543009, -1.78813963e-007, -0.104528897, 0.994521916, 1, 6.1102142e-008, 1.86221044e-007, -8.02329012e-008, 0.994521916, 0.104528897))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.678124905, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.96046448e-007, 5.27017689, -0.0733480453, 1, 2.8833017e-007, 5.96046519e-008, -4.31626219e-008, -0.0566925369, 0.998391747, 2.91245584e-007, -0.998391688, -0.0566925332))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.800000012, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.210000038, 0.200000003, 0.285374999))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0.630329847, -0.0312465429, 7.20098686, -9.87201929e-008, -0.99984777, 0.017452918, 1, -9.613413e-008, 1.49012436e-007, -1.47311923e-007, 0.0174529161, 0.99984777))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.47012496, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.11272049e-006, 4.9387393, -4.49442863, 1, 2.42971879e-007, 2.68220901e-007, -1.46989407e-008, -0.713250041, 0.700909734, 3.61609949e-007, -0.700909734, -0.713250101))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.699999988, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.288000047, 0.200000003, 0.27837503))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.00251842, -0.0312527418, -0.784425259, -2.98023224e-008, -0.362437576, -0.932008028, -1, -3.9197058e-008, 4.7219352e-008, -5.36460405e-008, 0.932008028, -0.362437606))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.533124864, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.01327896e-006, 4.10316849, -0.103866458, 1, 2.8833017e-007, 5.96046519e-008, -4.31625473e-008, -0.0566928051, 0.998391747, 2.91245584e-007, -0.998391688, -0.0566928014))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.899999976, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.200000003, 0.217000008, 0.200375021))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -3.33085537, -1.5976094, 1, 8.19928516e-008, -2.68220901e-007, -2.15646111e-007, -0.386710614, -0.922201157, -1.79337775e-007, 0.922201157, -0.386710614))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 0.200000003, 0.600000024))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.235124931, 1.6693753))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-4.64916229e-006, -0.673488855, 5.65330791, -1, 2.57733284e-008, -4.1723257e-007, 2.16240803e-008, -0.993572056, -0.11320243, -4.17468186e-007, -0.113202423, 0.993571997))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.480124891, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.01327896e-006, 2.6059866, 0.051631093, 1, 2.90808202e-007, 5.96046519e-008, -5.96046306e-008, -8.07461475e-008, 1, 2.90808202e-007, -1, -8.07461333e-008))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 1, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.235124931, 1.6693753))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-4.29153442e-006, -0.399590373, 4.02885008, -1, 2.75204592e-009, -4.1723257e-007, 2.09061284e-008, -0.998391747, -0.0566919968, -4.16717569e-007, -0.0566919968, 0.998391747))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.237124875, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.08616257e-006, 2.20885611, -3.10965157, 1, 1.22782865e-007, 3.27825546e-007, -8.59755218e-008, -0.82164669, 0.569997251, 3.39342648e-007, -0.569997191, -0.821646631))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.800000012, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 1.65712488, 0.359375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.1920929e-006, 4.40055227, -0.0314526558, 1, 2.82533193e-007, 5.96046519e-008, -4.34911662e-008, -0.0566928945, 0.998391747, 2.85457958e-007, -0.998391688, -0.0566928908))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.488124937, 0.359375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(9.53674316e-007, 2.57349205, 0.495863676, 1, 2.95756422e-007, 5.96046519e-008, -9.27020594e-008, 0.113203131, 0.993571877, 2.87107866e-007, -0.993571937, 0.113203138))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.655375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.84774399e-006, 1.02953684, 2.8258214, -1, -1.09740803e-007, -3.27825546e-007, -2.40661642e-008, -0.923879445, 0.382683516, -3.44867317e-007, 0.382683575, 0.923879564))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.200000003, 0.217000008, 0.200375021))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -3.40289879, -1.62781823, 1, 8.19928516e-008, -2.68220901e-007, -2.15646111e-007, -0.386710614, -0.922201157, -1.79337775e-007, 0.922201157, -0.386710614))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 0.200000003, 0.600000024))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.488124937, 0.418375015))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.07288361e-006, 2.60998273, -0.0503669977, 1, 2.90808202e-007, 5.96046519e-008, -5.96046306e-008, -8.07461475e-008, 1, 2.90808202e-007, -1, -8.07461333e-008))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.200000003, 0.217000008, 0.200375021))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -3.25880861, -1.56739795, 1, 8.19928516e-008, -2.68220901e-007, -2.15646111e-007, -0.386710614, -0.922201157, -1.79337775e-007, 0.922201157, -0.386710614))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 0.200000003, 0.600000024))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.265124857, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.1920929e-007, 3.70434904, 2.44769764, 1, 3.05401159e-007, -1.49011612e-007, -3.84168999e-008, 0.537299871, 0.843391299, 3.37636607e-007, -0.843391299, 0.537299871))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.899999976, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.618124902, 0.209375009))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.07288361e-006, 2.67497754, -0.154865503, 1, 2.90808202e-007, 5.96046519e-008, -5.96046306e-008, -8.07461475e-008, 1, 2.90808202e-007, -1, -8.07461333e-008))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.484124899, 0.227375031))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.13248825e-006, 2.07749343, -1.55897069, -1, 2.0314171e-007, -1.49011612e-007, 3.82758287e-008, 0.707107008, 0.70710659, 2.49009986e-007, 0.70710659, -0.707106948))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 0.300000012, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.454124868, 0.214375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.09944153e-006, 4.72574425, -0.500342607, 1, 2.72365185e-007, 1.49011612e-007, -1.17221134e-007, -0.113203213, 0.993571877, 2.87482976e-007, -0.993571877, -0.113203213))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 0.899999976, 0.100000001))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 1.65712488, 0.422374964))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.25169754e-006, 4.40054798, -0.205949783, 1, 2.82533193e-007, 5.96046519e-008, -4.34911662e-008, -0.0566928945, 0.998391747, 2.85457958e-007, -0.998391688, -0.0566928908))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.446125001, 0.496375084))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.7285347e-006, 0.313133836, 6.93109894, -1, 3.38840884e-008, 5.96046519e-008, -3.38840529e-008, -1, 5.74912178e-007, 5.96046661e-008, 5.74912178e-007, 1))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.421999991, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.558792, -0.0312539935, -0.45239532, 2.98023224e-008, -0.707106769, -0.707106829, -1, -7.48441451e-008, 3.26972902e-008, -7.60432783e-008, 0.707106829, -0.707106709))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.277124941, 0.702375054))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.76837158e-007, -2.44779181, 0.103008986, 1, 2.03386463e-007, -1.49011612e-007, -1.4901174e-007, 6.17194019e-007, -1, -2.03386378e-007, 1, 6.17194075e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 0.5, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.422124922, 0.412375003))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.31130219e-006, -1.70811987, 0.370481491, 1, 1.56259688e-007, -2.68220901e-007, -2.99524515e-007, 0.258819312, -0.965925872, -8.15145142e-008, 0.965925872, 0.258819312))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.207000002, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.7285347e-006, -1.7005955, 0.278747916, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.421999991, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.55879188, -0.0312462449, -0.452395201, 5.96046448e-008, 0.707106769, 0.707106829, 1, -4.38479519e-009, -7.99089008e-008, -5.34036033e-008, 0.707106829, -0.707106709))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.275000006, 0.204124942, 0.464375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.36441803e-007, -2.27592182, 0.103008866, 1, 2.03386463e-007, -1.49011612e-007, -1.4901174e-007, 6.17194019e-007, -1, -2.03386378e-007, 1, 6.17194075e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.23299998, 0.295375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.08616257e-006, -0.537618876, 2.27821803, -1, 3.50292382e-008, 2.68220901e-007, -3.50290357e-008, -1, 7.53727932e-007, 2.6822093e-007, 7.53727932e-007, 1))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.418375015))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.54972076e-006, 1.79147363, 1.84832418, -1, -2.19832074e-007, -2.68220901e-007, -3.42159723e-008, -0.707107008, 0.70710659, -3.45105576e-007, 0.70710659, 0.707106948))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1.04999995, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Institutional white","Part",Vector3.new(0.275000006, 0.200124964, 0.287375033))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-6.55651093e-007, -0.200989008, 2.46776938, -1, 3.38840884e-008, 5.96046519e-008, -3.38840529e-008, -1, 5.74912178e-007, 5.96046661e-008, 5.74912178e-007, 1))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 1, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.216999978, 0.295375019))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-007, -0.42824471, 2.46571684, -1, 3.50217348e-008, 2.68220901e-007, -3.50215323e-008, -1, 7.53727875e-007, 2.6822093e-007, 7.53727875e-007, 1))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.75, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.418375015))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.1920929e-007, 1.93505025, 1.70474756, 1, 1.8804613e-007, -2.68220901e-007, 5.6691988e-008, 0.707107067, 0.707106471, 3.22629546e-007, -0.707106531, 0.707107067))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1.04999995, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.207000002, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.7285347e-006, -1.70059586, -0.138124347, -1, -1.71600149e-007, 5.96046519e-008, -5.96047229e-008, 4.38378009e-007, -1, 1.71600121e-007, -1, -4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.331124961, 0.412375003))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.98023224e-007, -1.41137242, -1.47533894, 1, 1.56260029e-007, -2.68220901e-007, -7.91682311e-008, -0.707106948, -0.70710665, -3.00153374e-007, 0.70710665, -0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.709124923, 0.47437498))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.25169754e-006, -1.87605298, 0.196760774, 1, 1.5625281e-007, -2.68220901e-007, -2.68220987e-007, 6.17193848e-007, -1, -1.56252639e-007, 1, 6.17193905e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.277124912, 0.227375031))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.15904617e-006, 2.51099396, -0.945535302, -1, 2.51590308e-007, -1.49011612e-007, -3.25266569e-009, 0.50000006, 0.866025388, 2.92389416e-007, 0.866025448, -0.50000006))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 0.300000012, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Institutional white","Part",Vector3.new(0.275000006, 0.200124964, 0.287375033))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.01327896e-006, 0.00686681271, 2.46776795, 1, 4.04674836e-008, 5.96046519e-008, -4.04674481e-008, 1, -5.74912178e-007, -5.96046803e-008, 5.74912178e-007, 1))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.560000002, 1, 0.899999976))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.84512496, 0.359375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.17232513e-007, 3.25642681, 0.179460406, 1, 2.88228279e-007, 5.96046519e-008, -5.96046021e-008, -1.70154109e-007, 1, 2.88228279e-007, -1, -1.70154095e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.453000009, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.95527112, -0.0312464833, 0.483453929, 1.19209275e-007, 0.258818507, 0.965925932, 1, -8.24298763e-009, -1.21205815e-007, -2.34081945e-008, 0.965925932, -0.258818507))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.453000009, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.95527112, -0.0312538147, 0.483453929, -2.98023224e-008, -0.258818537, -0.965925992, -1, -2.11072013e-008, 3.65092774e-008, -2.98372704e-008, 0.965925932, -0.258818537))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.25999999, 0.3125, 0.320125014))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-0.00167268515, -1.01674032, 0.0665671825, -1, -2.06061035e-008, 5.96046519e-008, 5.96046661e-008, -4.97983308e-007, 1, -2.06060733e-008, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.698124886, 0.732374966))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.425000012, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.698124886, 0.534374952))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.452499986, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.368124902, 0.378374994))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.20537186e-006, 1.49373317, 0.509495497, -1, 1.54237696e-007, -1.49011612e-007, -1.49011683e-007, -4.38377924e-007, 1, 1.54237625e-007, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.567124963, 0.311374992))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.96695328e-006, 0.994490385, 0.140751123, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.418250024, 0.25))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.96046448e-008, -1.13293266, -0.127015591, -1, 1.1814204e-007, -5.96046519e-008, -8.81511255e-008, -0.258819431, 0.965925753, 9.8689604e-008, 0.965925813, 0.258819431))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.25))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.403124899, 0.352375001))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.14576721e-006, 1.55247092, -0.700873375, -1, 3.75780473e-009, -1.49011612e-007, -1.02709933e-007, 0.707106948, 0.707106709, 1.08024309e-007, 0.70710665, -0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(1.625, 0.200000003, 0.296375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.97657108, -0.0312469006, 0.569297791, -1.78813934e-007, -0.0523363948, 0.99862951, 1, 7.44965192e-008, 1.82963561e-007, -8.39700789e-008, 0.99862957, 0.0523363985))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.940000057, 0.200000003, 0.285374999))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.0734067, -0.0312458873, 4.6572032, -2.38418608e-007, -0.694658399, 0.719339788, 1, -7.77344482e-008, 2.56373596e-007, -1.22174583e-007, 0.719339788, 0.694658399))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(1.625, 0.200000003, 0.296375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.97657156, -0.0312528014, 0.569297791, 8.94069672e-008, 0.0523363948, -0.99862957, -1, -7.9065849e-008, -9.36733713e-008, -8.38600229e-008, 0.99862957, 0.0523363948))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 1.66212487, 0.359375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.84774399e-006, 5.95509291, -0.320841074, 1, 2.75573711e-007, 1.49011612e-007, -1.16857876e-007, -0.113203339, 0.993571877, 2.90670897e-007, -0.993571937, -0.113203347))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(1.78499997, 0.200000003, 0.301375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.64131165, -0.0312528014, 0.814543009, 8.94069672e-008, 0.104528897, -0.994521856, -1, -7.01918026e-008, -9.72769385e-008, -7.99755355e-008, 0.994521916, 0.104528904))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.204125047, 0.207375005))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.78813934e-006, -1.16710985, 0.175246477, -1, -2.06059703e-008, 0, -7.19086588e-015, 3.48970019e-007, -1, 2.06059703e-008, -1, -3.48970019e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.5, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.223124996, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.96046448e-008, -0.964124441, -0.0247514248, 1, -3.01422034e-007, 5.96046519e-008, -3.31073302e-008, 0.0871552527, 0.99619478, -3.05469911e-007, -0.99619478, 0.0871552527))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.244125068, 0.416375011))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.1920929e-007, -0.686996341, -0.125002146, -1, -5.23922274e-008, 1.49011612e-007, -1.49011626e-007, 3.48969991e-007, -1, 5.23921742e-008, -1, -3.48969991e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.206125051, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0, 0.168619156, -0.0937508345, -1, -5.23922559e-008, 1.49011612e-007, -1.4901164e-007, 4.97983251e-007, -1, 5.23921813e-008, -1, -4.97983251e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.560000002, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.398124993, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.84774399e-006, 1.4540993, 0.200625658, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.239124984, 0.205375016))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, 1.85597229, 0.341248155, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.698124886, 0.534374952))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.452499986, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.315999985, 0.310375005))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.68220901e-006, 2.08321929, -0.579118371, 1, -3.05231737e-007, 5.96046519e-008, -5.96048082e-008, -4.97983308e-007, 1, -3.05231708e-007, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0.99925971, -0.0312514305, -0.496301413, 0, -0.707106709, 0.707106829, -1, 1.69960003e-007, 1.69959961e-007, -2.40359725e-007, -0.707106888, -0.707106769))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.207000002, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-7.74860382e-007, -1.99747372, -0.297748566, -1, -1.71600149e-007, 5.96046519e-008, -5.96047229e-008, 4.38378009e-007, -1, 1.71600121e-007, -1, -4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 0.25, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.311124951, 0.267374992))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(2.14576721e-006, -1.94385314, 0.47499609, 1, -6.68158364e-008, 5.96046519e-008, 5.96046803e-008, 4.38378009e-007, -1, 6.6815808e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.495000005, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Bright blue","Part",Vector3.new(0.275000006, 0.200000003, 0.213375002))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.96695328e-006, 1.71972692, -0.297746897, 1, -1.86023797e-007, 5.96046519e-008, -5.96047443e-008, -4.97983308e-007, 1, -1.86023769e-007, -1, -4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 0.25, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.643000007, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.51446462, -0.0312519073, 0.511714339, 0, -4.38378066e-007, 1, -1, 2.45074915e-007, 1.0743547e-013, -2.45074915e-007, -1, -4.38378066e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.496000022, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.13575315, -0.0312535167, 1.63871276, -5.96046448e-008, -0.707106888, -0.707106709, 1, 1.651742e-007, -2.49467973e-007, 2.93196308e-007, -0.707106709, 0.707106888))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.643000007, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.51446474, -0.0312479734, 0.511714339, 5.96046519e-008, 4.38378066e-007, -1, 1, -2.45074915e-007, 5.96045453e-008, -2.45074887e-007, -1, -4.38378095e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.577124953, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.96695328e-006, 1.2623533, 0.27874887, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 0.870000005, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.304124922, 0.267374992))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.14576721e-006, 1.6403501, 0.474995613, -1, 1.54237696e-007, -1.49011612e-007, -1.49011683e-007, -4.38377924e-007, 1, 1.54237625e-007, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.495000005, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.330124915, 0.226374999))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.2649765e-006, 1.84085846, 0.585492015, -1, 1.54237696e-007, -1.49011612e-007, -1.49011683e-007, -4.38377924e-007, 1, 1.54237625e-007, 1, 4.38377953e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.25999999, 0.578125, 0.21875))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0.00167268515, 1.04017782, 0.125254273, 1, 2.06060218e-008, 5.96046519e-008, 5.96046448e-008, 3.48969991e-007, -1, -2.06060431e-008, 1, 3.48969991e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.300000012, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.239124984, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.90734863e-006, 1.85597229, 0.341248155, -1, 2.73445636e-007, -5.96046519e-008, -5.96047869e-008, -4.97983308e-007, 1, 2.73445607e-007, 1, 4.97983308e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.423000038, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(1.828511, -0.0312466025, 1.86352599, -1.49011612e-007, -0.500000238, 0.866025269, 1, -3.47173224e-009, 1.70059423e-007, -8.20231492e-008, 0.866025269, 0.500000238))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.275000006, 0.23712492, 0.375375003))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.76837158e-007, -2.23306799, -0.714783967, 1, 1.28876025e-007, -1.49011612e-007, -8.8350177e-008, -0.38268286, -0.923879802, -1.76090154e-007, 0.923879862, -0.38268289))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.410999984, 0.469375014))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(7.15255737e-007, -2.25397205, 0.350374818, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 0.850000024, 0.699999988))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.293000042, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(0.930041909, -0.0312547088, 2.61983705, 2.68220924e-006, -0.866025388, 0.500000238, 1, 1.34954996e-006, -3.0269282e-006, 1.94662152e-006, 0.500000238, 0.866025388))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.315999985, 0.303375006))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(3.75509262e-006, -2.0832181, 0.73186779, 1, 8.41783816e-008, -5.96046519e-008, -5.96046874e-008, 4.38378009e-007, -1, -8.41783532e-008, 1, 4.38378009e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.275000006, 0.698124886, 0.638374984))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-2.02655792e-006, 1.51446426, -0.0117214918, -1, 2.45074915e-007, -5.96046519e-008, -5.96047798e-008, -5.27786028e-007, 1, 2.45074887e-007, 1, 5.27786028e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.449999988, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.293000042, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-0.930041909, -0.03124547, 2.61983705, -2.75671505e-006, 0.866025388, -0.500000238, -1, -1.43972136e-006, 3.0197582e-006, 1.89532614e-006, 0.500000238, 0.866025329))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.275000006, 0.238124937, 0.381375015))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-006, -2.16469121, -0.908047557, -1, -9.70897673e-008, -1.49011612e-007, 1.00514129e-007, 0.382683396, -0.923879564, 1.46723522e-007, -0.923879564, -0.382683367))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.524999976, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.235124931, 0.586375237))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-4.70876694e-006, -4.59392071, 4.83900547, -1, 3.01723389e-007, -3.27825546e-007, 2.23408545e-008, -0.700909495, -0.713250279, -4.44980344e-007, -0.713250279, 0.700909495))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1.04999995, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.28125, 0.234375))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-5.96046448e-008, -1.44312787, -0.230922222, 1, -1.99133694e-007, -5.96046519e-008, 9.3278274e-008, 0.173647881, 0.984807849, -1.85758211e-007, -0.984807849, 0.173647881))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.5, 1.04999995, 0.400000006))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,"Royal purple","Part",Vector3.new(0.423000038, 0.200000003, 0.280375004))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.82851136, -0.0312532187, 1.86352599, 5.96046448e-008, 0.500000238, -0.866025329, -1, -3.57638221e-008, -8.94738008e-008, -7.57092948e-008, 0.866025269, 0.500000238))
mesh("SpecialMesh",Part,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.300000012, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.287124902, 0.227375031))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-3.03983688e-006, 2.52654123, 0.448077202, -1, 2.51590194e-007, -1.49011612e-007, -1.49011683e-007, -2.59562086e-007, 1, 2.51590166e-007, 1, 2.59562114e-007))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.349999994, 1, 1))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.22512494, 0.42337501))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(5.36441803e-007, 2.19158387, 0.875249863, 1, 2.87006458e-007, -5.96046519e-008, -2.30892709e-008, 0.279828936, 0.960049868, 2.92219624e-007, -0.960049927, 0.279828966))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.400000006, 1, 0.5))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.408374965))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(4.76837158e-007, -2.34476542, -0.473634839, 1, 1.52993096e-007, -1.49011612e-007, -1.04336792e-007, -0.258818269, -0.965926051, -1.86346938e-007, 0.965926051, -0.258818269))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1.04999995, 0.800000012))
Part=part(Enum.FormFactor.Custom,m,Enum.Material.Metal,0,0,"Black","Part",Vector3.new(0.275000006, 0.221124932, 0.408374965))
Partweld=weld(m,rarmor,Part,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-1.1920929e-006, -2.29170871, -0.671645045, -1, -1.21206767e-007, -1.49011612e-007, 1.12563526e-007, 0.258819103, -0.965925813, 1.55643789e-007, -0.965925813, -0.258819103))
mesh("SpecialMesh",Part,Enum.MeshType.Brick,"",Vector3.new(0, 0, 0),Vector3.new(0.550000012, 1.04999995, 0.800000012))
Hitbox=part(Enum.FormFactor.Symmetric,m,Enum.Material.Plastic,0,1,"Medium stone grey","Hitbox",Vector3.new(0.519832134, 7.60096073, 0.172954172))
Hitboxweld=weld(m,Handle,Hitbox,CFrame.new(0, 0, 0, -1, 2.17809955e-007, -5.96046519e-008, -5.96047656e-008, -4.97983308e-007, 1, 2.17809927e-007, 1, 4.97983308e-007),CFrame.new(-4.90843725, -0.0829741955, 0.0609716177, 0, -6.82671129e-008, -1, 1.1055932e-007, 1, -6.82671129e-008, 1, -1.1055932e-007, 7.547565e-015))



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



local Particle = it("ParticleEmitter",nil)
Particle.Enabled = false
Particle.LightEmission = 0.8
Particle.Rate = 150
Particle.ZOffset = 1
Particle.Rotation = NumberRange.new(-180, 180)

--ParticleEmitter({Speed = 5, RotSpeed = NumberRange.new(-15, 15), Drag = 0, Size1 = 1, Size2 = 5, Lifetime1 = 1, Lifetime2 = 1.5, Parent = Torso, Emit = 100, Offset = 360, Enabled = false, Color1 = C3(1,1,1), Color2 = C3(1,1,1), Texture = ""})
function ParticleEmitter(Table)
	local PRTCL = Particle:Clone()
	local Color1 = Table.Color1 or C3(1,1,1)
	local Color2 = Table.Color2 or C3(1,1,1)
	local Speed = Table.Speed or 5
	local Drag = Table.Drag or 0
	local Size1 = Table.Size1 or 1
	local Size2 = Table.Size2 or 5
	local Lifetime1 = Table.Lifetime1 or 1
	local Lifetime2 = Table.Lifetime2 or 1.5
	local Parent = Table.Parent or Torso
	local Emit = Table.Emit or 100
	local Offset = Table.Offset or 360
	local Acel = Table.Acel or VT(0,0,0)
	local Enabled = Table.Enabled or false
	local Texture = Table.Texture or "281983280"
	local RotS = Table.RotSpeed or NumberRange.new(-15, 15)
	local Trans1 = Table.Transparency1 or 0
	local Trans2 = Table.Transparency2 or 0
	PRTCL.Parent = Parent
	PRTCL.RotSpeed = RotS
	PRTCL.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,Trans1),NumberSequenceKeypoint.new(1,Trans2)})
	PRTCL.Texture = "http://www.roblox.com/asset/?id="..Texture
	PRTCL.Color = ColorSequence.new(Color1,Color2)
	PRTCL.Size = NumberSequence.new(Size1,Size2)
	PRTCL.Lifetime = NumberRange.new(Lifetime1,Lifetime2)
	PRTCL.Speed = NumberRange.new(Speed)
	PRTCL.VelocitySpread = Offset
	PRTCL.Drag = Drag
	PRTCL.Acceleration = Acel
	if Enabled == false then
		PRTCL:Emit(Emit)
		game:GetService("Debris"):AddItem(PRTCL,Lifetime2)
	else
		PRTCL.Enabled = true
	end
	return PRTCL
end

-- Functions are Ready!

local dashing = false
local floatmode = false
local OWS = hum.WalkSpeed
local equipped = false
Humanoid.Name = "NEPTUNIA"
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
Instance.new("ForceField",char).Visible = false
Humanoid.Animator.Parent = nil





local hh = (char['Right Leg'].Size.Y+char.HumanoidRootPart.Size.Y/2)
local smokepart = Instance.new('Part',root)
smokepart.Size = Vector3.new(0.5,0,1.5)
smokepart.CanCollide = false
smokepart.Locked = true
smokepart.Transparency = 1
local skpartweld = Instance.new('Weld',smokepart)
skpartweld.Part0 = smokepart
skpartweld.Part1 = root
skpartweld.C0 = CFrame.new(0,hh,0)
local rK = false
local DBT = false
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






local Sitt = false
------------------
function equip()
	attack = true
	equipped = true
	m.Parent = char
	for i = 0, 9 do
		slash(math.random(10,50)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.05,0.01,0.05),math.random(25,50)/250,BrickColor.new("White"))
	end
	CFuncs["Sound"].Create("rbxassetid://1368637781", rarmor, 2.5, 1.25)
	CFuncs["Sound"].Create("rbxassetid://200633077", rarmor, 1, 1)
	CFuncs["Sound"].Create("rbxassetid://169380495", rarmor, 0.5, 1.1)
	sphere2(5,"Add",root.CFrame,vt(5,5,5),0.25,0.25,0.25,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	sphere2(6,"Add",root.CFrame,vt(5,5,5),0.25,0.25,0.25,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	hum.CameraOffset = vt(0,0,0)
	----swordweld.Part0 = rarm
	OWS = hum.WalkSpeed
	attack = false
end

function unequip()
	attack = true
	equipped = false
	m.Parent = nil
	hum.WalkSpeed = 0
	hum.WalkSpeed = 16
	OWS = hum.WalkSpeed
	CFuncs["Sound"].Create("rbxassetid://200633029", rarmor, 1, 1)
	----swordweld.C1=clerp(----swordweld.C1,cf(-3,0,-0.5)*angles(math.rad(0),math.rad(0),math.rad(-40)),.5)
	----swordweld.Part0 = tors
	attack = false
end

------------------
function attackone()
	attack = true
	hum.WalkSpeed = 4
	for i = 0, 2, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-40),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(5)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0.1,0.1,0)*angles(math.rad(0),math.rad(0),math.rad(40)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(-40)),.3)
		RW.C0=clerp(RW.C0,cf(1.25,0.5,-0.65)*angles(math.rad(100),math.rad(0),math.rad(-23)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(110),math.rad(0),math.rad(-85)),.3)
		----swordweld.C1=clerp(----swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		--HandleWeld.C0=clerp(HandleWeld.C0,cf(-0.7,-0.4,-.8)*angles(math.rad(-80),math.rad(12),math.rad(50)),.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(90),math.rad(0)),.3)

	end
	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*4
	MagniDamage(hitb, 4, 24,30, 0, "Normal",153092213)
	CFuncs["Sound"].Create("rbxassetid://200633196", rarmor, 1, 1.05)
	CFuncs["Sound"].Create("rbxassetid://200633108", rarmor, 1.5, 1.025)
	CFuncs["Sound"].Create("rbxassetid://234365549", rarmor, 1, 1)
	for i = 0, 1, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(50),math.rad(0)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(-0.1,-0.25,0)*angles(math.rad(10),math.rad(0),math.rad(-50)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(50)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(70)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(100),math.rad(0),math.rad(-50)),.3)
		----swordweld.C1=clerp(----swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
	end
	hitb:Destroy()
	attack = false
	hum.WalkSpeed = 24
end
function attacktwo()
	attack = true
	hum.WalkSpeed = 4
	for i = 0, 1, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(20),math.rad(5)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(-0.1,0.1,0)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(40)),.3)
		RW.C0=clerp(RW.C0,cf(1.25,0.5,-0.65)*angles(math.rad(100),math.rad(0),math.rad(-23)),.3)
		LW.C0=clerp(LW.C0,cf(-0.5,0.5,-0.25)*angles(math.rad(90),math.rad(0),math.rad(40)),.3)
		----swordweld.C1=clerp(----swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(180),math.rad(0)),.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(-90),math.rad(0)),.3)


	end
	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*4
	MagniDamage(hitb, 4, 24,30, 0, "Normal",153092213)
	CFuncs["Sound"].Create("rbxassetid://200633281", rarmor, 1, 1.05)
	CFuncs["Sound"].Create("rbxassetid://161006195", rarmor, 1.5, 1.025)
	for i = 0, 1, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-30),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0.2,-0.25,0)*angles(math.rad(10),math.rad(0),math.rad(90)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0),math.rad(-90)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(80),math.rad(0),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(100),math.rad(0),math.rad(-50)),.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(-5),math.rad(-70),math.rad(0)),.3)

	end
	attack = false
	hum.WalkSpeed = 24
end
function attackthree()
	attack = true
	hum.WalkSpeed = 30
	for i = 0,3 do
		swait()
		--	CFuncs.Sound.Create("rbxassetid://596439421", ra, 2, 1)
		CFuncs.Sound.Create("rbxassetid://3932508290", ra, 2, 1)
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(0),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 6, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(45),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(90),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(135),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(180),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(225),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(270),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
		for i = 0, 1 do
			swait()
			local Alpha = .7
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(-5),math.rad(315),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1.2,-1.1,-0.2)*angles(math.rad(15),math.rad(0),math.rad(-5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(40)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1,0.3,-0.6)*angles(math.rad(65),math.rad(0),math.rad(-40)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-10),math.rad(0),math.rad(0))*necko,Alpha)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0.7,-0.3,-0.4)*angles(math.rad(-60),math.rad(0),math.rad(-90)),.3)
			coroutine.resume(coroutine.create(function()MagniDamage(root, 4, 5, 10, 0.3, "Knockdown",0)end))
		end
	end
	hum.WalkSpeed = 26
	attack = false
end


--Animation thinks
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor
Rad = math.rad
local Player_Size = 1
--Animations
function Taunt1()
	attack = true
	hum.WalkSpeed = 0
	for i = 0, 9, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(6),math.rad(0 - 2 * math.cos(sine / 42)),math.rad(20 - 6 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, cf(1.5* Player_Size, 0.5 + 0.06 * Sin(sine / 20)* Player_Size, 0* Player_Size) * angles(Rad(-9), Rad(0), Rad(155 + 25 * Sin(sine / 2.5))), 0.12)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	attack = false
	hum.WalkSpeed = 17
end

function TPose()
	attack = true
	hum.WalkSpeed = 0
	for i = 0, 22, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.01,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.35,0.6,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.1)
		LW.C0=clerp(LW.C0,cf(-1.35,0.6,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.1)
	end
	attack = false
	hum.WalkSpeed = 17
end

function Dabbelike()
	--	chatfunc("Sanes dab.", BrickColor.new("Really black").Color)
	attack = true
	hum.WalkSpeed = 0
	--   Cso("577475178", char, 10, 1)
	for i = 0,13,0.1 do
		swait()
		Torso.Neck.C0=clerp(tors.Neck.C0,necko*angles(math.rad(35),math.rad(0),math.rad(0)),.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.5+0.1*math.sin(sine/30), -0.6) * angles(math.rad(-0), math.rad(10), math.rad(-110)), 0.1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5+0.1*math.sin(sine/30), 0.055*math.cos(sine/20)) * angles(math.rad(-0), math.rad(-10), math.rad(-105)), 0.1)
	end
	attack = false
	hum.WalkSpeed = 17
end

function Yep()
	attack = true
	hum.WalkSpeed = 0
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-25), Rad(5), Rad(0)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	---	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(25), Rad(5), Rad(0)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-25), Rad(5), Rad(0)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(25), Rad(5), Rad(0)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	attack = false
	hum.WalkSpeed = 17
end

function idk()
	attack = true
	hum.WalkSpeed = 0
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(-5), Rad(35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, cf(1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(46 + 4.5 * Sin(sine / 12))), 0.1)
		LW.C0 = clerp(LW.C0, cf(-1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(-46 - 4.5 * Sin(sine / 12))), 0.1)
	end
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(5), Rad(-35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, cf(1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(46 + 4.5 * Sin(sine / 12))), 0.1)
		LW.C0 = clerp(LW.C0, cf(-1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(-46 - 4.5 * Sin(sine / 12))), 0.1)
	end
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(-5), Rad(35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, cf(1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(46 + 4.5 * Sin(sine / 12))), 0.1)
		LW.C0 = clerp(LW.C0, cf(-1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(-46 - 4.5 * Sin(sine / 12))), 0.1)
	end
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(5), Rad(-35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
		RW.C0 = clerp(RW.C0, cf(1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(46 + 4.5 * Sin(sine / 12))), 0.1)
		LW.C0 = clerp(LW.C0, cf(-1.5 * Player_Size, 0.5 + 0.02 * Sin(sine / 12)* Player_Size, 0* Player_Size) * angles(Rad(125), Rad(-.6), Rad(-46 - 4.5 * Sin(sine / 12))), 0.1)
	end
	attack = false
	hum.WalkSpeed = 17
end

function Nope()
	attack = true
	hum.WalkSpeed = 0
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(-5), Rad(35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(5), Rad(-35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(-5), Rad(35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,9,1 do
		swait()
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(5), Rad(5), Rad(-35)), 0.3)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
	end
	attack = false
	hum.WalkSpeed = 17
end


function Think()
	attack = true
	hum.WalkSpeed = 0
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,20,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko* cf(0, 0, 0 + ((1* Player_Size) - 1)) * angles(Rad(20), Rad(0), Rad(-5 - 15 * Sin(sine / 20))), 0.2)
		RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
		RW.C0 = clerp(RW.C0, cf(1.1* Player_Size, 0.5 + 0.05 * Sin(sine / 12)* Player_Size, -0.5* Player_Size) * angles(Rad(180), Rad(6), Rad(-56)), 0.1)
		LW.C0 = clerp(LW.C0, cf(-1* Player_Size, 0.1 + 0.05 * Sin(sine / 12)* Player_Size, -0.5* Player_Size) * angles(Rad(45), Rad(6), Rad(86)), 0.1)

	end

	attack = false
	hum.WalkSpeed = 17
end

function Point()
	attack = true
	hum.WalkSpeed = 0
	--	Cso("3030266811", hed, 10, 1)
	for i = 0,10,0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(0 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(0 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),-0.1 + 0.05 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-10)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10 + 2.5 * math.cos(sine / 29.5)),math.rad(0),math.rad(-10)),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(90 + 2.5 * math.cos(sine / 25)),math.rad(0),math.rad(-10 - 2.5 * math.cos(sine / 25))),.1)

	end

	attack = false
	hum.WalkSpeed = 17
end

function Relax()
	attack = true
	hum.WalkSpeed = 0
	root.Anchored = true
	Sitt = true
	repeat
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, -2) * angles(math.rad(-30), math.rad(0), math.rad(0)), 0.1)
		Torso.Neck.C0 = clerp(tors.Neck.C0, necko* cf(0, 0, 0 + ((1) - 1)) * angles(math.rad(30 - 2.5 * math.sin(sine / 20)), math.rad(0 - 5 * math.sin(sine / 40)), math.rad(0)), 0.1)
		RH.C0 = clerp(RH.C0, cf(1, -0.9, 0) * angles(math.rad(65), math.rad(90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
		LH.C0 = clerp(LH.C0, cf(-1, -0.5, 0) * angles(math.rad(35), math.rad(-90), math.rad(0)) * angles(math.rad(-6.5), math.rad(0), math.rad(0)), 0.08)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 + 3 * math.cos(sine / 26)),math.rad(-20 - 3 * math.cos(sine / 24)),math.rad(20 - 5 * math.cos(sine / 34))),.1)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 3 * math.cos(sine / 25)),math.rad(10 + 3 * math.cos(sine / 24)),math.rad(-10 + 5 * math.cos(sine / 34))),.1)
		--LW.C0=clerp(LW.C0,cf(-1,0.35 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(67 - 7 * math.cos(sine / 66)),math.rad(2 - 3 * math.cos(sine / 59)),math.rad(67 - 4 * math.cos(sine / 45))),.2)

	until Sitt == false
	root.Anchored = false
	hum.WalkSpeed = 18
	attack = false
end

------------------

function Sippy()
	attack = true
	hum.WalkSpeed = 0
	JarModel.Parent = char
	CFuncs["Sound"].Create("rbxassetid://1420260652", root, 3, 1)
	for i = 0, 7, 0.1 do
		swait()
		--	handlexweld.C0=clerp(handlexweld.C0,cf(1,-0.25,1)*angles(math.rad(90),math.rad(-80),math.rad(20)),.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(-10),math.rad(1 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-0.5),math.rad(0),math.rad(-1 - 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.01 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(1 - 1 * math.cos(sine / 32)),math.rad(0),math.rad(-20)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10 - 5 * math.sin(sine / 20)),math.rad(0 + 2 * math.cos(sine / 58)),math.rad(20 + 1 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
		LW.C0 = clerp(LW.C0, cf(-1.5, 0.4 + 0.05 * math.sin(sine / 42), 0.1) * angles(math.rad(125), math.rad(0), math.rad(45)), 0.1)
	end
	local ParticleEmitter1 = Instance.new("ParticleEmitter",tors)
	ParticleEmitter1.Transparency = NumberSequence.new(0.5,1,1)
	ParticleEmitter1.Size = NumberSequence.new(0,4.0838565826416,7.5078544616699,10.347219467163,12.672625541687,14.550189971924,16.041475296021,17.203493118286,18.08869934082,18.744993209839,19.215721130371,19.539680480957,19.751104354858,19.879682540894,19.950540542603,19.984256744385,19.996852874756,19.999795913696,20,20)
	ParticleEmitter1.Color = ColorSequence.new(Color3.new(0.196078, 1, 0.196078),Color3.new(0.196078, 1, 0.196078))
	ParticleEmitter1.Enabled = false
	ParticleEmitter1.LightEmission = 1
	ParticleEmitter1.Texture = "rbxassetid://1084965356"
	ParticleEmitter1.Lifetime = NumberRange.new(0.60000002384186, 0.60000002384186)
	ParticleEmitter1.Rate = 1000
	ParticleEmitter1.Speed = NumberRange.new(0, 0)
	ParticleEmitter1.Color = ColorSequence.new(Color3.new(0.196078, 1, 0.196078),Color3.new(0.196078, 1, 0.196078))
	local ParticleEmitter2 = Instance.new("ParticleEmitter",tors)
	--ParticleEmitter2.Name = "Icon"
	--ParticleEmitter2.Parent = Folder0
	ParticleEmitter2.Transparency = NumberSequence.new(0,0,1)
	ParticleEmitter2.Size = NumberSequence.new(1,1)
	ParticleEmitter2.Color = ColorSequence.new(Color3.new(0.196078, 1, 0.196078),Color3.new(0.196078, 1, 0.196078))
	ParticleEmitter2.Enabled = true
	ParticleEmitter2.LightEmission = 1
	ParticleEmitter2.Texture = "rbxassetid://1084979589"
	ParticleEmitter2.Acceleration = Vector3.new(0, 10, 0)
	ParticleEmitter2.Lifetime = NumberRange.new(0.69999998807907, 1)
	ParticleEmitter2.Rate = 1000
	ParticleEmitter2.Speed = NumberRange.new(50, 50)
	ParticleEmitter2.VelocitySpread = 90
	ParticleEmitter2.Color = ColorSequence.new(Color3.new(0.196078, 1, 0.196078),Color3.new(0.196078, 1, 0.196078))
	local ParticleEmitter4 = Instance.new("ParticleEmitter",tors)
	ParticleEmitter4.Transparency = NumberSequence.new(0.75,1,1)
	ParticleEmitter4.Size = NumberSequence.new(3,3)
	ParticleEmitter4.Color = ColorSequence.new(Color3.new(0.392157, 1, 0.392157),Color3.new(0.392157, 1, 0.392157))
	ParticleEmitter4.Enabled = true
	ParticleEmitter4.LightEmission = 1
	ParticleEmitter4.Texture = "rbxassetid://867619398"
	ParticleEmitter4.ZOffset = 1.5
	ParticleEmitter4.Lifetime = NumberRange.new(1, 1)
	ParticleEmitter4.Rate = 1000
	ParticleEmitter4.Speed = NumberRange.new(50, 50)
	ParticleEmitter4.VelocitySpread = 90
	ParticleEmitter4.Color = ColorSequence.new(Color3.new(0.392157, 1, 0.392157),Color3.new(0.392157, 1, 0.392157))

	CFuncs["Sound"].Create("rbxassetid://170791927", root, 3, 1)
	CFuncs["Sound"].Create("rbxassetid://575768878", root, 3, 1)
	wait(.15)
	coroutine.wrap(function()
		ParticleEmitter1.Enabled = false
		ParticleEmitter2.Enabled = false
		ParticleEmitter4.Enabled = false
		wait(5)
		ParticleEmitter1:Remove()
		ParticleEmitter2:Remove()
		ParticleEmitter4:Remove()
	end)()
	JarModel.Parent = nil
	hum.WalkSpeed = 16
	attack = false
end


function eightbitmegablade()
	attack = true
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	CFuncs["Sound"].Create("rbxassetid://1368583274", larm, 4.5, 1.2)
	local OverCut = false
	cam.CameraSubject = Humanoid
	cam.CameraType = "Scriptable"
	coroutine.resume(coroutine.create(function()
		while true do
			swait()
			if OverCut == false then
				cam.CFrame = lerp(cam.CFrame, root.CFrame * cf(1, 1.5, -6) * ceuler(math.rad(10), math.rad(170), math.rad(-20)), 0.1)
			else
				break
			end
		end
	end))
	for i = 0, 10, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0),math.rad(-6)),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(30),math.rad(3)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-50)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15),math.rad(5),math.rad(50)),.3)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-13),math.rad(-40),math.rad(20)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(170),math.rad(10),math.rad(0)),.3)
		--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
	end
	OverCut = true
	local orb = Instance.new("Part", char)
	orb.Anchored = true
	orb.BrickColor = BrickColor.new("Toothpaste")
	orb.CanCollide = false
	orb.FormFactor = 3
	orb.Name = "Ring"
	orb.Material = "Neon"
	orb.Size = Vector3.new(1, 1, 1)
	orb.Transparency = 0.5
	orb.TopSurface = 0
	orb.BottomSurface = 0
	local orbm = Instance.new("SpecialMesh", orb)
	orbm.MeshType = "FileMesh"
	orbm.MeshId = "rbxassetid://361629844"
	orbm.Scale = vt(30,60,60)
	orb.CFrame = root.CFrame*CFrame.new(0,50,0)
	for i = 0, 24 do
	end
	ParticleEmitter({Transparency1 = 0.3, Transparency2 = 1, Speed = 125, Acel = VT(0,0,0), RotSpeed = NumberRange.new(-15, 15), Drag = 0.4, Size1 = 15, Size2 = 32, Lifetime1 = 0.4, Lifetime2 = 1, Parent = orb, Emit = 300, Offset = 360, Enabled = false, Color1 = MRC_A.Color, Color2 = MRC_B.Color, Texture = 296874871})
	sphere2(2,"Add",orb.CFrame,vt(10,10,10),0.5,0.5,0.5,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	sphere2(3,"Add",orb.CFrame,vt(10,10,10),0.75,0.75,0.75,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	sphere2(4,"Add",orb.CFrame,vt(10,10,10),1,1,1,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
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
			CFuncs["Sound"].Create("rbxassetid://763717897", orb, 10, 1)
			CFuncs["Sound"].Create("rbxassetid://1295446488", orb, 9, 0.75)
			for i = 0, 24 do
			end
			--ParticleEmitter({Transparency1 = 0.3, Transparency2 = 1, Speed = 125, Acel = VT(0,0,0), RotSpeed = NumberRange.new(-15, 15), Drag = 0.4, Size1 = 15, Size2 = 32, Lifetime1 = 0.4, Lifetime2 = 1, Parent = orb, Emit = 300, Offset = 360, Enabled = false, Color1 = MRC_A.Color, Color2 = MRC_B.Color, Texture = 296874871})
			sphere2(1,"Add",orb.CFrame,vt(12,12,12),1,1,1,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
			sphere2(1.5,"Add",orb.CFrame,vt(12,12,12),1.1,1.1,1.1,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
			sphere2(2,"Add",orb.CFrame,vt(12,12,12),1.2,1.2,1.2,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
			orb.Anchored = true
			orb.Transparency = 1
			coroutine.resume(coroutine.create(function()
				for i = 0, 4, 0.1 do
					swait()
					hum.CameraOffset = vt(math.random(-10,10)/25,math.random(-10,10)/25,math.random(-10,10)/25)
				end
				hum.CameraOffset = vt(0,0,0)
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
	attack = false
	hum.WalkSpeed = 24
	hum.JumpPower = 50
end

function spinnyblade()
	attack = true
	hum.WalkSpeed = 1
	hum.JumpPower = 0
	CFuncs["Sound"].Create("rbxassetid://1368583274", root, 4.5, 1)
	local bgui = Instance.new("BillboardGui",root)
	bgui.Size = UDim2.new(25, 0, 25, 0)
	local imgc = Instance.new("ImageLabel",bgui)
	imgc.BackgroundTransparency = 1
	imgc.ImageTransparency = 1
	imgc.Size = UDim2.new(1,0,1,0)
	imgc.Image = "rbxassetid://997291547"
	imgc.ImageColor3 = Color3.new(0,0.5,1)
	local imgc2 = imgc:Clone()
	imgc2.Parent = bgui
	imgc2.Position = UDim2.new(-0.5,0,-0.5,0)
	imgc2.Size = UDim2.new(2,0,2,0)
	imgc2.ImageColor3 = Color3.new(0.5,0,1)
	for i = 0, 10, 0.1 do
		swait()
		imgc.ImageTransparency = imgc.ImageTransparency - 0.01
		imgc.Rotation = imgc.Rotation + 1
		imgc2.ImageTransparency = imgc2.ImageTransparency - 0.01
		imgc2.Rotation = imgc2.Rotation - 1
		bgui.Size = bgui.Size - UDim2.new(0.25, 0, 0.25, 0)
		--slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.1,0.01,0.1),math.random(25,50)/250,BrickColor.new("Bright Red"))
		--sphere2(5,"Add",rarmor.CFrame*CFrame.new(math.random(-8,-2),0,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.1,0.1),0,0.1,0,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color)
		hum.CameraOffset = vt(math.random(-10,10)/50,math.random(-10,10)/50,math.random(-10,10)/50)
		--sphereMK(5,math.random(4,25)/45,"Add",root.CFrame*CFrame.new(math.random(-15,15),-20,math.random(-15,15))*CFrame.Angles(math.rad(90 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),0.75,0.75,20,-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)
		--sphereMK(5,math.random(1,15)/45,"Add",root.CFrame*CFrame.new(math.random(-15,15),-20,math.random(-15,15))*CFrame.Angles(math.rad(90 + math.random(-25,25)),math.rad(math.random(-25,25)),math.rad(math.random(-25,25))),0.75,0.75,20,-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)
		--waveEff(5,"Add","In",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-360,360)),0),vt(15,0.25,15),-0.075,0.05,BrickColor.new("Bright Red"))
		RH.C0=clerp(RH.C0,cf(1,-0.5,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-40),math.rad(10)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(20)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0.1,0.2,-0.3)*angles(math.rad(10),math.rad(0),math.rad(50)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(-50)),.3)
		RW.C0=clerp(RW.C0,cf(1.25,0.5,-0.65)*angles(math.rad(100),math.rad(0),math.rad(-23)),.3)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(110),math.rad(0),math.rad(-85)),.3)
		--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(90),math.rad(0)),.3)

	end
	imgc.ImageTransparency = 1
	hum.CameraOffset = vt(0,0,0)
	waveEff(2,"Add","Out",root.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(6,10,6),0.5,0.8,BrickColor.new("White"))
	waveEff(3,"Add","Out",root.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(6,10,6),0.5,0.4,BrickColor.new("White"))
	waveEff(4,"Add","Out",root.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(6,10,6),0.5,0.2,BrickColor.new("White"))
	waveEff(5,"Add","Out",root.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(6,10,6),0.5,0.1,BrickColor.new("White"))
	waveEff(6,"Add","Out",root.CFrame*CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),0),vt(6,10,6),0.5,0.05,BrickColor.new("White"))
	for i = 0, 9 do
		--slash(math.random(10,25)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,0,math.random(-30,15))*CFrame.Angles(math.rad(90 + math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.1,0.01,0.1),math.random(75,250)/250,BrickColor.new("Bright Red"))
	end
	local v = Instance.new("BodyVelocity",root)--EgibleParts[i].Parent:FindFirstChild('Torso'))
	v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
	-- v.Velocity = (root.CFrame.lookVector + Vector3.new(0,0.025,0)) * 90
	v.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	CFuncs["Sound"].Create("rbxassetid://430315987", root, 1.5, 1)
	CFuncs["Sound"].Create("rbxassetid://1295446488", root, 3, 1)
	for x = 0, 14 do
		CFuncs["Sound"].Create("rbxassetid://200633281", rarmor, 1, 1.05)
		CFuncs["Sound"].Create("rbxassetid://161006195", rarmor, 1.5, 1.025)
		MagniDamage(tors, 10, 60,85, 0, "Normal",153092213)
		CFuncs["Sound"].Create("rbxassetid://200632992", rarmor, 1.25, 1)
		--slash(5,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,3,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.05,0.01,0.05),math.random(1,10)/100,BrickColor.new("Bright Red"))
		for i = 0, 1, 0.6 do
			swait()
			v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
			--sphereMK(2,-1,"Add",root.CFrame*CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-3,8))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,0.5,math.random(5,25),-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)
			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(0),math.rad(0),math.rad(90)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(-60)),.3)
			RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
		end
		--slash(5,2.5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,3,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.05,0.01,0.05),math.random(1,10)/100,BrickColor.new("Bright red"))
		CFuncs["Sound"].Create("rbxassetid://200632992", rarmor, 1.25, 1)
		MagniDamage(tors, 10, 60,85, 0, "Normal",153092213)
		for i = 0, 1, 0.6 do
			swait()
			v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
			--sphereMK(2,-1,"Add",root.CFrame*CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-3,8))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,0.5,math.random(5,25),-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)
			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(-60)),.3)
			RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
		end
		--slash(5,2.5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,3,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.05,0.01,0.05),math.random(1,10)/100,BrickColor.new("Bright Red"))
		CFuncs["Sound"].Create("rbxassetid://200632992", rarmor, 1.25, 1)
		MagniDamage(tors, 10, 60,85, 0, "Normal",153092213)
		for i = 0, 1, 0.6 do
			swait()
			v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
			--sphereMK(2,-1,"Add",root.CFrame*CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-3,8))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,0.5,math.random(5,25),-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)
			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(180),math.rad(0),math.rad(90)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(-60)),.3)
			RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
		end
		--slash(5,2.5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,3,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.05,0.01,0.05),math.random(1,10)/100,BrickColor.new("Bright red"))
		CFuncs["Sound"].Create("rbxassetid://200632992", rarmor, 1.25, 1)
		MagniDamage(tors, 10, 60,85, 0, "Normal",153092213)
		for i = 0, 1, 0.6 do
			swait()
			v.Velocity = root.CFrame.lookVector + root.CFrame.lookVector*200
			--sphereMK(2,-1,"Add",root.CFrame*CFrame.new(math.random(-8,8),math.random(-8,8),math.random(-3,8))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,0.5,math.random(5,25),-0.0075,BrickColor.new("Bright Red"),BrickColor.new("Bright Red").Color,0)

			RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.2)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3)*angles(math.rad(270),math.rad(0),math.rad(90)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(-60)),.3)
			RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(-90)),.3)
			HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
		end
	end
	v:Destroy()
	hum.WalkSpeed = 0
	for i = 0, 5, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-0.6,-0.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(20),math.rad(-12)),.2)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0.1,0.2,-0.35)*angles(math.rad(10),math.rad(0),math.rad(-40)),.2)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5),math.rad(0),math.rad(40)),.2)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(110)),.2)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0)*angles(math.rad(45),math.rad(0),math.rad(-20)),.2)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
	end
	bgui:Destroy()
	attack = false
	hum.WalkSpeed = 24
	hum.JumpPower = 50
end




function Shortbladespin()
	attack = true
	hum.WalkSpeed = 4
	hum.JumpPower = 0
	CFuncs["Sound"].Create("rbxassetid://1368598393", rarmor, 2, 1)
	CFuncs["Sound"].Create("rbxassetid://1368583274", rarmor, 2.5, 1)
	for x = 0, 9 do
		--slash(5,5,true,"Round","Add","Out",rarmor.CFrame*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),vt(0.05,0.01,0.05),0.05,BrickColor.new("White"))
		--CFuncs["Sound"].Create("rbxassetid://200633108", rarmor, 2, 1.05)
		--CFuncs["Sound"].Create("rbxassetid://234365573", rarmor, 2.5, 1.025)
		--slash(5,5,true,"Round","Add","Out",rarmor.CFrame*CFrame.new(0,0,0)*CFrame.Angles(0,0,0),vt(0.05,0.01,0.05),0.05,BrickColor.new("White"))

	end
	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*8
	hitb.CFrame = hitb.CFrame*CFrame.new(0,1,0)
	MagniDamage(hitb, 8, 92,158, 0, "Normal",153092213)
	sphere2(5,"Add",hitb.CFrame,vt(2.1,2.1,2),-0.02,-0.02,5,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",hitb.CFrame,vt(2,2,2),-0.02,-0.02,4,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	for i = 0, 24 do
		--slash(math.random(20,100)/10,5,true,"Round","Add","Out",hitb.CFrame*CFrame.new(0,0,math.random(-60,60))*CFrame.Angles(math.rad(90),0,0),vt(0.01,0.01,0.01),math.random(10,100)/1000,BrickColor.new("White"))
	end
	CFuncs["Sound"].Create("rbxassetid://313205954", root, 4,1)
	--CFuncs["Sound"].Create("rbxassetid://1368637781", rarmor, 4,1)
	--CFuncs["Sound"].Create("rbxassetid://763718160", rarmor, 5, 1.1)
	CFuncs["Sound"].Create("rbxassetid://782353443", rarmor, 6, 1)
	--CFuncs["Sound"].Create("rbxassetid://1548538202", rarmor, 4,1)
	for i = 0, 2, 0.1 do
		swait()
		MagniDamage(hitb, 8, 92,158, 0, "Normal",153092213)
		hum.CameraOffset = vt(math.random(-10,10)/25,math.random(-10,10)/25,math.random(-10,10)/25)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-20),math.rad(-10)),.9)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(0)),.9)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,0)*angles(math.rad(0),math.rad(0),math.rad(80)),.9)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(-80)),.9)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(90),math.rad(0),math.rad(70)),.9)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-60)),.9)
		--HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-0.7,-0.9)*angles(math.rad(-90),math.rad(0),math.rad(0)),.3)

	end
	hum.CameraOffset = vt(0,0,0)
	hitb:Destroy()
	attack = false
	hum.WalkSpeed = 24
	hum.JumpPower = 50
end



function SuperBoost()
	attack = true
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	wng1a.Transparency = wng1a.Transparency - 1
	wng1b.Transparency = wng1b.Transparency - 1
	wng2a.Transparency = wng2a.Transparency - 1
	wng2b.Transparency = wng2b.Transparency - 1
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1.5,1.5,1.5,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1,1,1,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	CFuncs["Sound"].Create("rbxassetid://1368637781", root, 7.5, 1)
	for i = 0, 2, 0.1 do
		swait()
		hum.CameraOffset = vt(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)
		root.Velocity = vt(0,0,0)
		--slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,250)/250,BrickColor.new("White"))
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end
	CFuncs["Sound"].Create("rbxassetid://477843807", root, 7, 1.05)
	local lat1 = Instance.new("Attachment",larm)
	lat1.Position = Vector3.new(1,-1,0.5)
	local lat2 = Instance.new("Attachment",larm)
	lat2.Position = Vector3.new(-1,-1,-0.5)
	local rat1 = Instance.new("Attachment",rarm)
	rat1.Position = Vector3.new(1,-1,-0.5)
	local rat2 = Instance.new("Attachment",rarm)
	rat2.Position = Vector3.new(-1,-1,0.5)
	local tl1 = Instance.new('Trail',larm)
	tl1.Attachment0 = lat1
	tl1.Attachment1 = lat2
	tl1.Texture = "http://www.roblox.com/asset/?id=1049219073"
	tl1.LightEmission = 1
	tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.05, 0),NumberSequenceKeypoint.new(1, 1)})
	tl1.Color = ColorSequence.new(BrickColor.new('Royal purple').Color,BrickColor.new('Cyan').Color)
	tl1.Lifetime = 5
	local tl2 = tl1:Clone()
	tl2.Attachment0 = rat1
	tl2.Attachment1 = rat2
	tl2.Parent = rarm
	hum.JumpPower = 500
	hum.Jump = true
	swait()
	hum.JumpPower = 0
	root.Velocity = vt(0,250,0) + root.CFrame.lookVector*250
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.3,5,0.3,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.2,4,0.2,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	for i = 0, 49 do
		--waveEff(math.random(10,100)/10,"Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-360,360)),0),vt(15,0.25,15),math.random(25,250)/250,0.25,BrickColor.new("White"))
		--slash(math.random(10,100)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.01,0.01,0.01),math.random(50,500)/250,BrickColor.new("White"))
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 2, 0.1 do
			swait()
			root.CFrame = root.CFrame + root.CFrame.lookVector*7.5
			hum.CameraOffset = vt(math.random(-10,10)/50,math.random(-10,10)/50,math.random(-10,10)/50)
		end
		hum.CameraOffset = vt(0,0,0)
		wait(3)
		tl1.Enabled = false
		tl2.Enabled = false
		game:GetService("Debris"):AddItem(tl1, 5)
		game:GetService("Debris"):AddItem(tl2, 5)
		game:GetService("Debris"):AddItem(rat1, 5)
		game:GetService("Debris"):AddItem(rat2, 5)
		game:GetService("Debris"):AddItem(lat1, 5)
		game:GetService("Debris"):AddItem(lat2, 5)
	end))
	CFuncs["Sound"].Create("rbxassetid://1295446488", root, 10, 1)
	for i = 0, 3, 0.1 do
		swait()

		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(30)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.75,0)*angles(math.rad(40),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(20)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(-20)),.4)
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 99 do
			swait()
			wng1a.Transparency = wng1a.Transparency + 0.01
			wng1b.Transparency = wng1b.Transparency + 0.01
			wng2a.Transparency = wng2a.Transparency + 0.01
			wng2b.Transparency = wng2b.Transparency + 0.01
		end
	end))
	attack = false
	if equipped == false then
		hum.WalkSpeed = 16
	else
		hum.WalkSpeed = 24
	end
	hum.JumpPower = 50
end

function enerwave()
	attack=true
	for i=0,1,0.1 do
		swait()
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(0)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1,0.5,-.5)*angles(math.rad(0),math.rad(-80),math.rad(-80))*angles(math.rad(-75),0,math.rad(0)),.4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.45, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(-25)), 0.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-1,-1)*angles(math.rad(-90),math.rad(0),math.rad(0)),.4)
	end
	CFuncs["Sound"].Create("rbxassetid://540358153", root, 7.5, 1)
	local lb = Instance.new("Part")
	lb.Parent = char
	lb.Material = "Neon"
	lb.Color = BrickColor.new("Royal purple").Color
	lb.CanCollide = false
	lb.CFrame = Torso.CFrame + Torso.CFrame.lookVector*5
	lb.Transparency = 0
	lb.Size = vt(15,0.6,3)
	local tra2 = Instance.new("ParticleEmitter",lb)
	tra2.Texture = "http://www.roblox.com/asset/?id=745304849"
	tra2.LightEmission = 1
	tra2.Color = ColorSequence.new(lb.BrickColor.Color)
	tra2.Rate = 500000000000
	tra2.Lifetime = NumberRange.new(0.5)
	tra2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,3,0),NumberSequenceKeypoint.new(1,0,0)})
	tra2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
	tra2.Speed = NumberRange.new(0)
	tra2.Rotation = NumberRange.new(-500,500)
	tra2.VelocitySpread = 90000
	tra2.RotSpeed = NumberRange.new(-500,500)
	local thing = Instance.new("SpecialMesh",lb)
	thing.MeshType = "Sphere"
	lb.Touched:connect(function(hit)   MagniDamage(lb, 5, 40,60, 0, "Normal",153092213) end) 

	local bv = Instance.new("BodyVelocity")
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = Torso.CFrame.lookVector *150
	bv.Parent = lb
	for i=0,2,0.1 do
		swait()
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(30)),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-.5)*angles(math.rad(0),math.rad(0),math.rad(-30)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(0),math.rad(70),math.rad(90))*angles(math.rad(-75),0,math.rad(0)),.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.45, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(-25)), 0.3)
		HandleWeld.C0=clerp(HandleWeld.C0,cf(0,-1,-1)*angles(math.rad(-90),math.rad(0),math.rad(0)),.4)
	end
	attack = false
	wait(1)
	lb:Destroy()
end

function superjump()
	attack = true
	hum.JumpPower = 500
	wng1a.Transparency = wng1a.Transparency - 1
	wng1b.Transparency = wng1b.Transparency - 1
	wng2a.Transparency = wng2a.Transparency - 1
	wng2b.Transparency = wng2b.Transparency - 1
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1.5,1.5,1.5,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1,1,1,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	CFuncs["Sound"].Create("rbxassetid://1368637781", root, 7.5, 1)
	for i = 0, 2, 0.1 do
		swait()
		hum.CameraOffset = vt(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)
		root.Velocity = vt(0,0,0)
		--slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,250)/250,BrickColor.new("White"))
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end
	CFuncs["Sound"].Create("rbxassetid://477843807", root, 7, 1.05)
	local lat1 = Instance.new("Attachment",larm)
	lat1.Position = Vector3.new(1,-1,0.5)
	local lat2 = Instance.new("Attachment",larm)
	lat2.Position = Vector3.new(-1,-1,-0.5)
	local rat1 = Instance.new("Attachment",rarm)
	rat1.Position = Vector3.new(1,-1,-0.5)
	local rat2 = Instance.new("Attachment",rarm)
	rat2.Position = Vector3.new(-1,-1,0.5)
	local tl1 = Instance.new('Trail',larm)
	tl1.Attachment0 = lat1
	tl1.Attachment1 = lat2
	tl1.Texture = "http://www.roblox.com/asset/?id=1049219073"
	tl1.LightEmission = 1
	tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.05, 0),NumberSequenceKeypoint.new(1, 1)})
	tl1.Color = ColorSequence.new(BrickColor.new('Royal purple').Color,BrickColor.new('Cyan').Color)
	tl1.Lifetime = 5
	local tl2 = tl1:Clone()
	tl2.Attachment0 = rat1
	tl2.Attachment1 = rat2
	tl2.Parent = rarm
	hum.JumpPower = 500
	hum.Jump = true
	swait()
	hum.JumpPower = 500
	hum.WalkSpeed = 120
	root.Velocity = vt(0,250,0) + root.CFrame.lookVector*250
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.3,5,0.3,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.2,4,0.2,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	for i = 0, 49 do
		--waveEff(math.random(10,100)/10,"Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-360,360)),0),vt(15,0.25,15),math.random(25,250)/250,0.25,BrickColor.new("White"))
		--slash(math.random(10,100)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.01,0.01,0.01),math.random(50,500)/250,BrickColor.new("White"))
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 2, 0.1 do
			swait()
			hum.CameraOffset = vt(math.random(-10,10)/50,math.random(-10,10)/50,math.random(-10,10)/50)
		end
		hum.CameraOffset = vt(0,0,0)
		wait(3)
		tl1.Enabled = false
		tl2.Enabled = false
		game:GetService("Debris"):AddItem(tl1, 5)
		game:GetService("Debris"):AddItem(tl2, 5)
		game:GetService("Debris"):AddItem(rat1, 5)
		game:GetService("Debris"):AddItem(rat2, 5)
		game:GetService("Debris"):AddItem(lat1, 5)
		game:GetService("Debris"):AddItem(lat2, 5)
	end))
	CFuncs["Sound"].Create("rbxassetid://1295446488", root, 10, 1)
	for i = 0, 3, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(30)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.75,0)*angles(math.rad(40),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(20)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(-20)),.4)
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 99 do
			swait()
			wng1a.Transparency = wng1a.Transparency + 0.01
			wng1b.Transparency = wng1b.Transparency + 0.01
			wng2a.Transparency = wng2a.Transparency + 0.01
			wng2b.Transparency = wng2b.Transparency + 0.01
		end
	end))
	attack = false
	if equipped == false then
		hum.WalkSpeed = 16
	else
		hum.WalkSpeed = 24
	end
	hum.JumpPower = 50
end

function superjump2()
	attack = true
	hum.JumpPower = 500
	wng1a.Transparency = wng1a.Transparency - 1
	wng1b.Transparency = wng1b.Transparency - 1
	wng2a.Transparency = wng2a.Transparency - 1
	wng2b.Transparency = wng2b.Transparency - 1
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1.5,1.5,1.5,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame,vt(1,1,1),1,1,1,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	CFuncs["Sound"].Create("rbxassetid://1368637781", root, 7.5, 1)
	for i = 0, 2, 0.1 do
		swait()
		hum.CameraOffset = vt(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)
		root.Velocity = vt(0,0,0)
		--slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,250)/250,BrickColor.new("White"))
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(40)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.5,-1)*angles(math.rad(20),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(4),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(40)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(10),math.rad(0),math.rad(-40)),.4)
	end

	local bv = Instance.new("BodyVelocity") 
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = cf(root.Position,root.CFrame*cf(0,1,-4).p).lookVector*125
	bv.Parent = root
	local GYRO = Instance.new("BodyGyro",root)
	GYRO.D = 4
	GYRO.P = 40000
	GYRO.MaxTorque = vt(0,4000000,0)
	GYRO.CFrame = cf(root.Position,root.CFrame*cf(0,0,-10).p)
	CFuncs["Sound"].Create("rbxassetid://477843807", root, 7, 1)
	--CFuncs["Sound"].Create("rbxassetid://477843807", root, 7, 1.05)
	local lat1 = Instance.new("Attachment",larm)
	lat1.Position = Vector3.new(1,-1,0.5)
	local lat2 = Instance.new("Attachment",larm)
	lat2.Position = Vector3.new(-1,-1,-0.5)
	local rat1 = Instance.new("Attachment",rarm)
	rat1.Position = Vector3.new(1,-1,-0.5)
	local rat2 = Instance.new("Attachment",rarm)
	rat2.Position = Vector3.new(-1,-1,0.5)
	local tl1 = Instance.new('Trail',larm)
	tl1.Attachment0 = lat1
	tl1.Attachment1 = lat2
	tl1.Texture = "http://www.roblox.com/asset/?id=1049219073"
	tl1.LightEmission = 1
	tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.05, 0),NumberSequenceKeypoint.new(1, 1)})
	tl1.Color = ColorSequence.new(BrickColor.new('Royal purple').Color,BrickColor.new('Cyan').Color)
	tl1.Lifetime = 5
	local tl2 = tl1:Clone()
	tl2.Attachment0 = rat1
	tl2.Attachment1 = rat2
	tl2.Parent = rarm
	hum.JumpPower = 500
	hum.Jump = true
	swait()
	hum.JumpPower = 500
	hum.WalkSpeed = 120
	root.Velocity = vt(0,250,0) + root.CFrame.lookVector*250
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.3,5,0.3,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(-45),0,0),vt(25,1,25),0.2,4,0.2,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
	for i = 0, 49 do
	end
	coroutine.resume(coroutine.create(function()
		for i = 0, 2, 0.1 do
			swait()
			hum.CameraOffset = vt(math.random(-10,10)/50,math.random(-10,10)/50,math.random(-10,10)/50)
		end
		hum.CameraOffset = vt(0,0,0)
		wait(3)
		tl1.Enabled = false
		tl2.Enabled = false
		game:GetService("Debris"):AddItem(tl1, 5)
		game:GetService("Debris"):AddItem(tl2, 5)
		game:GetService("Debris"):AddItem(rat1, 5)
		game:GetService("Debris"):AddItem(rat2, 5)
		game:GetService("Debris"):AddItem(lat1, 5)
		game:GetService("Debris"):AddItem(lat2, 5)
	end))
	CFuncs["Sound"].Create("rbxassetid://1295446488", root, 10, 1)
	for i = 0, 3, 0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-20)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(30)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.75,0)*angles(math.rad(40),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-20),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(20)),.4)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(-30),math.rad(0),math.rad(-20)),.4)
	end
	bv:Remove()
	GYRO:Remove()
	coroutine.resume(coroutine.create(function()
		for i = 0, 99 do
			swait()
			wng1a.Transparency = wng1a.Transparency + 0.01
			wng1b.Transparency = wng1b.Transparency + 0.01
			wng2a.Transparency = wng2a.Transparency + 0.01
			wng2b.Transparency = wng2b.Transparency + 0.01
		end
	end))
	attack = false
	if equipped == false then
		hum.WalkSpeed = 16
	else
		hum.WalkSpeed = 24
	end
	hum.JumpPower = 50
end
waveEff(5,"Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-360,360)),0),vt(5,0.25,5),0.05,0.015,BrickColor.new("Cyan"))
waveEff(5,"Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,math.rad(math.random(-360,360)),0),vt(10,0.25,10),0.05,0.015,BrickColor.new("Royal purple"))


local CurId = 1
------------------


local attacktype = 1
mouse.Button1Down:connect(function()
	if equipped == true then
		if attack == false and attacktype == 1 then
			attacktype = 2
			attackone()
		elseif attack == false and attacktype == 2 then
			attacktype = 3
			attacktwo()
		elseif attack == false and attacktype == 3 then
			attacktype = 1
			attackthree()
  --[[elseif attack == false and attacktype == 4 then
    attacktype = 1
    --attackfour()]]--
		end
	end
end)
mouse.KeyDown:connect(function(k)
	if k == "f" and attack == false and equipped == false then
		equip()
	elseif k == "f" and attack == false and equipped == true then
		unequip()
	end
	if k == "r" and attack == false then
		superjump2()
	end
	if k == "t" and attack == false then
		Sippy()
	end


	if (attack == false) or Sitt == true then
		if k == "b" then
			if Sitt == false then
				Relax()
			elseif Sitt == true then
				Sitt = false
			end
		end
	end

	if k == "m" then	



		--[

		if CurId == 20 then
			ORGID = 14638577578
			ned.Text = "NEPTUNIAN V"
			textt.Text = 'NEPTUNIAN'
			ffg.Text = 'V'
			warn("Playing SONG 1")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			Theme.Volume = 5
			CurId = 1
		elseif  CurId == 1 then
			warn("Playing SONG 2")
			ORGID = 434996568
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 2
		elseif  CurId == 2 then
			ORGID = 1585580500
			warn("Playing SONG 3")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 3
		elseif  CurId == 3 then
			ORGID = 295861420
			warn("Playing SONG 4")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 4
		elseif  CurId == 4 then
			ORGID = 2308087170
			warn("Playing SONG 5")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 5
		elseif  CurId == 5 then
			ORGID = 1582197512
			warn("Playing SONG 6")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 6
		elseif  CurId == 6 then
			ORGID = 150486669
			warn("Playing SONG 7")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 7
		elseif  CurId == 7 then
			ORGID = 150611165
			warn("Playing SONG 8")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 8
		elseif  CurId == 8 then
			ORGID = 1282795536
			warn("Playing SONG 9")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 9
		elseif  CurId == 9 then
			ORGID = 317193115
			warn("Playing SONG 10")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 10
		elseif  CurId == 10 then
			ORGID = 1372475373
			warn("Playing SONG 11")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 11
		elseif  CurId == 11 then
			ORGID = 1535319653
			warn("Playing SONG 12")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 12
		elseif  CurId == 12 then
			ORGID = 1287331033
			warn("Playing SONG 13")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 13
		elseif  CurId == 13 then
			ORGID = 406699293
			warn("Playing SONG 14")
			Theme.SoundId = "rbxassetid://" ..ORGID
			Theme.TimePosition = 0
			CurId = 14
		end 


		--]]
	end
	if equipped == true then
		if k == "z" and attack == false then
			spinnyblade()
		end
		if k == "e" and attack == false then
			Shortbladespin()
		end
		if k == "q" and attack == false then
			enerwave()
		end
		if k == "x" and attack == false then
			eightbitmegablade()
		end
	end


	if k == "l" and muter == false then
		muter = true
		Theme.Volume = 0
	elseif k == "l" and muter == true then
		muter = false
		Theme.Volume = 5
	end
end)
plr.Chatted:connect(function(message)
	if message:sub(1,7) == "/e wave" and equipped == false then
		Taunt1()
	elseif message:sub(1,5) == "/e no" and equipped == false then
		Nope()
	elseif message:sub(1,6) == "/e yes" and equipped == false then
		Yep()
	elseif message:sub(1,6) == "/e dab" and equipped == false then
		Dabbelike()
	elseif message:sub(1,8) == "/e think" and equipped == false then
		Think()
	elseif message:sub(1,6) == "/e idk" and equipped == false then
		idk()
	elseif message:sub(1,8) == "/e point" and equipped == false then
		Point()
	elseif message:sub(1,8) == "/e tpose" and equipped == false then
		TPose()
	elseif message:sub(1,7) == "skipto/" then
		Theme.TimePosition = message:sub(8)
	end
end)

sphere2(5,"Add",root.CFrame,vt(5,5,5),0.25,0.25,0.25,BrickColor.new("Cyan"),BrickColor.new("Cyan").Color)
sphere2(6,"Add",root.CFrame,vt(5,5,5),0.25,0.25,0.25,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
MegaBossChat("NEPTUNIAN VV",MRC_A.Color,3)

------------------------------------------------


idleanim=.4
while true do
	swait()
	if muter == false then
		--Theme.Volume = 5
	else
		--Theme.Volume = 0
	end

	sine = sine + change

	imlb.Rotation = imlb.Rotation + 3
	--	imlbb.Rotation = imlbb.Rotation - 1
	imlb2.Rotation = imlb2.Rotation - 1
	local sidevec = math.clamp((root.Velocity*root.CFrame.rightVector).X+(root.Velocity*root.CFrame.rightVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
	local forwardvec =  math.clamp((root.Velocity*root.CFrame.lookVector).X+(root.Velocity*root.CFrame.lookVector).Z,-hum.WalkSpeed,hum.WalkSpeed)
	local sidevelocity = sidevec/hum.WalkSpeed
	local forwardvelocity = forwardvec/hum.WalkSpeed


	local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
	local velderp=RootPart.Velocity.y
	hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
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
		if RootPart.Velocity.y > 1 and hitfloor==nil then 
			Anim="Jump"
			if attack==false then
				RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-tors.Velocity.Y/6),math.rad(0),math.rad(0)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-2.5),math.rad(0),math.rad(0)),.1)
				RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(25)),.1)
				LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(-25)),.1)
				if equipped == false then
					--swordweld.C1=clerp(--swordweld.C1,cf(-3,0,-0.5)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
				else
					--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
				end
			end
		elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
			Anim="Fall"
			if attack==false then
				RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-tors.Velocity.Y/6),math.rad(0),math.rad(0)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(0),math.rad(0)),.1)
				RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(55)),.1)
				LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(-55)),.1)
				if equipped == false then
					--swordweld.C1=clerp(--swordweld.C1,cf(-3,0,-0.5)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
				else
					--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
				end
			end
		elseif torvel<1 and hitfloor~=nil then
			Anim="Idle"
			if attack==false then
				if equipped == false then
					smokt.Enabled = false

					RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(-15),math.rad(0 + 2 * math.cos(sine / 20))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(1),math.rad(0 - 2 * math.cos(sine / 20))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.02 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(30 + 3 * math.cos(sine / 40))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2),math.rad(0 - 7 * math.cos(sine / 40)),math.rad(-30 - 3 * math.cos(sine / 40))),.1)
					RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-6 + 5 * math.cos(sine / 26)),math.rad(-10 - 6 * math.cos(sine / 24)),math.rad(13 - 5 * math.cos(sine / 34))),.1)
					LW.C0=clerp(LW.C0,cf(-1.4,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 1 * math.cos(sine / 25)),math.rad(10 + 2 * math.cos(sine / 24)),math.rad(10 + 2 * math.cos(sine / 34))),.1)
					--swordweld.C1=clerp(--swordweld.C1,cf(-3,0,-0.5)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
					HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
				else
					smokt.Enabled = false

					RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20)  - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2 * math.cos(sine / 40)),math.rad(0 - 6 * math.cos(sine / 40)),math.rad(-6 + 2 * math.cos(sine / 20) - 6 * math.cos(sine / 40))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20) - 0.02 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 - 2 * math.cos(sine / 40)),math.rad(10 - 6 * math.cos(sine / 40)),math.rad(3 - 2 * math.cos(sine / 20) - 3 * math.cos(sine / 40))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.02 * math.cos(sine / 40),0 - 0.06 * math.cos(sine / 40),-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 2 * math.cos(sine / 20)),math.rad(0 + 2 * math.cos(sine / 40)),math.rad(-20 + 6 * math.cos(sine / 40))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(6),math.rad(0 - 2 * math.cos(sine / 42)),math.rad(20 - 6 * math.cos(sine / 40))),.1)
					RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 + 3 * math.cos(sine / 26)),math.rad(-20 - 3 * math.cos(sine / 24)),math.rad(20 - 5 * math.cos(sine / 34))),.1)
					LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.05 * math.cos(sine / 28),0.1)*angles(math.rad(-13 - 3 * math.cos(sine / 25)),math.rad(10 + 3 * math.cos(sine / 24)),math.rad(-10 + 5 * math.cos(sine / 34))),.1)
					--swordweld.C1=clerp(--swordweld.C1,cf(0,1,0)*angles(math.rad(0),math.rad(130),math.rad(0)),.3)
					HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
				end
			end
		elseif torvel>2 and torvel<42 and hitfloor~=nil then
			Anim="Walk"
			if attack==false then
				if equipped == false then
					smokt.Enabled = true
					RH.C0=clerp(RH.C0,cf(1,-0.75 - 0/2 * math.cos(10 / 10),0+ forwardvelocity/2 * math.cos(50-sine / 10))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(sidevelocity*35 * math.cos(sine / 10)),math.rad(0),math.rad(0 - forwardvelocity*70 * math.cos(sine / 10))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-0.75 + 0/2 * math.cos(10 / 10),0- forwardvelocity/2 * math.cos(50-sine / 10))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(sidevelocity*35 * math.cos(sine / 10)),math.rad(0),math.rad(0 - forwardvelocity*70 * math.cos(sine / 10))),.1)

					--RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 45 * math.cos(sine / 8))),.1)
					--LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 45 * math.cos(sine / 8))),.1)

					--			    RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, -0.175 + 0.10 * math.cos(sine / 6) + -math.sin(sine / 6) / 7) * angles(math.rad(forwardvelocity*3 + 2.5 * math.cos(sine / 3.5)), math.rad(-sidevelocity*10) - root.RotVelocity.Y / 75, math.rad(4 * math.cos(sine / 7))), 0.15)

					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 + 0.05 * math.cos(sine / 4))*angles(math.rad(forwardvelocity*5 + 3 * math.cos(sine / 4)),math.rad(-sidevelocity*10),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5 - 5 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 10 * math.cos(sine / 8))),.1)
					--RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 50 * math.cos(sine / 8)),math.rad(0),math.rad(5 - 10 * math.cos(sine / 4))),.1)
					--LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)
					RW.C0=clerp(RW.C0,cf(1.4,0.5,0)*angles(math.rad(0-forwardvelocity*7+ forwardvelocity*70 * math.cos(sine / 10)),math.rad(0),math.rad(10)),.1)
					LW.C0=clerp(LW.C0,cf(-1.4,0.5,0)*angles(math.rad(0-forwardvelocity*7- forwardvelocity*70 * math.cos(sine / 10)),math.rad(0),math.rad(-10)),.1)

					--swordweld.C1=clerp(--swordweld.C1,cf(-3,0,-0.5)*angles(math.rad(0),math.rad(0),math.rad(-40)),.3)
				else
					smokt.Enabled = true
					RH.C0=clerp(RH.C0,cf(1,-0.75 - 0/2 * math.cos(10 / 10),0+ forwardvelocity/2 * math.cos(50-sine / 10))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(sidevelocity*35 * math.cos(sine / 10)),math.rad(0),math.rad(0 - forwardvelocity*70 * math.cos(sine / 10))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-0.75 + 0/2 * math.cos(10 / 10),0- forwardvelocity/2 * math.cos(50-sine / 10))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(sidevelocity*35 * math.cos(sine / 10)),math.rad(0),math.rad(0 - forwardvelocity*70 * math.cos(sine / 10))),.1)

					--RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 60 * math.cos(sine / 8))),.1)
					--LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 60 * math.cos(sine / 8))),.1)
					--RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 + 0.05 * math.cos(sine / 4))*angles(math.rad(forwardvelocity*5 + 3 * math.cos(sine / 4)),math.rad(-sidevelocity*10),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)

					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,0 + 0.15 * math.cos(sine / 4))*angles(math.rad(forwardvelocity*10 - 3 * math.cos(sine / 4)),math.rad(-sidevelocity*10),math.rad(-10 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 + 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5 + 3 * math.cos(sine / 57)),math.rad(10 - hed.RotVelocity.Y*1.5 + 5 * math.cos(sine / 8))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(-10),math.rad(0),math.rad(15 - 2 * math.cos(sine / 34))),.1)
					LW.C0=clerp(LW.C0,cf(-1.4,0.5,0)*angles(math.rad(0-forwardvelocity*7- forwardvelocity*70 * math.cos(sine / 10)),math.rad(0),math.rad(-10)),.1)

					--LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)
					HandleWeld.C0=clerp(HandleWeld.C0,cf(0,0,0)*angles(math.rad(5),math.rad(-40),math.rad(0)),.3)
				end
			end
		elseif torvel>=42 and hitfloor~=nil then
			Anim="Run"
			if attack==false then
				smokt.Enabled = true
				RH.C0=clerp(RH.C0,cf(1,-0.8 - 0.25 * math.sin(sine / 2.5),-0.25 - 0.3 * math.sin(sine / 2.5))*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 120 * math.sin(sine / 5))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-0.8 + 0.25 * math.sin(sine / 2.5),-0.25 + 0.3 * math.sin(sine / 2.5))*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 120 * math.sin(sine / 5))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.25 + 0.25 * math.sin(sine / 2.5))*angles(math.rad(20),math.rad(0),math.rad(0 - 15 * math.sin(sine / 5))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10 + 2.5 * math.sin(sine / 2.5)),math.rad(0),math.rad(0 + 15 * math.sin(sine / 5))),.1)
				RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-20),math.rad(-20 + 3 * math.cos(sine / 6)),math.rad(15)),.3)
				LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.5 * math.cos(sine / 6))*angles(math.rad(0 + 140 * math.cos(sine / 6)),math.rad(0),math.rad(-5 + 20 * math.cos(sine / 3))),.1)

				--RH.C0=clerp(RH.C0,cf(1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 85 * math.cos(sine / 6))),.1)
				--LH.C0=clerp(LH.C0,cf(-1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 85 * math.cos(sine / 6))),.1)
				--RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(15 - 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 6))),.1)
				--Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-2.5 + 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 10 * math.cos(sine / 6))),.1)
				--RW.C0=clerp(RW.C0,cf(1.4+0.25*math.cos(sine/5),0.5+0.25*math.cos(sine/5),-0.2+0.5*math.cos(sine/5))*angles(math.rad(20-60*math.cos(sine/5)),math.rad(0),math.rad(-4+30*math.cos(sine/5))),.3)
				--LW.C0=clerp(LW.C0,cf(-1.4+0.25*math.cos(sine/5),0.5-0.25*math.cos(sine/5),-0.2-0.5*math.cos(sine/5))*angles(math.rad(20+60*math.cos(sine/5)),math.rad(0),math.rad(4+30*math.cos(sine/5))),.3)
			end
		end
	end
end

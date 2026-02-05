--// Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// ScreenGui
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// Layers
local LoadingLayer = Instance.new("Frame")
LoadingLayer.Size = UDim2.fromScale(1,1)
LoadingLayer.BackgroundColor3 = Color3.fromRGB(0,0,0)
LoadingLayer.Parent = gui

local PersistentLayer = Instance.new("Frame")
PersistentLayer.Size = UDim2.fromScale(1,1)
PersistentLayer.BackgroundTransparency = 1
PersistentLayer.Parent = gui

--// Premium Font
local premiumFont
pcall(function()
	premiumFont = Font.new("rbxasset://fonts/families/Montserrat.json")
end)

------------------------------------------------
-- BORDER EFFECT
------------------------------------------------
local border = Instance.new("UIStroke")
border.Thickness = 3
border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
border.Parent = LoadingLayer

local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(200,140,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(100,0,180))
}
grad.Parent = border

task.spawn(function()
	while border.Parent do
		grad.Rotation = (grad.Rotation + 1) % 360
		task.wait(0.03)
	end
end)

------------------------------------------------
-- TITLE
------------------------------------------------
local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1,0.2)
title.Position = UDim2.fromScale(0,0.33)
title.BackgroundTransparency = 1
title.Text = "Swiftz Store"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(220,220,220)
title.Parent = LoadingLayer
title.TextTransparency = 1
if premiumFont then title.FontFace = premiumFont end

TweenService:Create(title,TweenInfo.new(1),{TextTransparency = 0}):Play()

------------------------------------------------
-- LOADING BAR (PREMIUM)
------------------------------------------------
local barBG = Instance.new("Frame")
barBG.Size = UDim2.fromScale(0.5,0.022)
barBG.Position = UDim2.fromScale(0.25,0.56)
barBG.BackgroundColor3 = Color3.fromRGB(25,25,25)
barBG.BorderSizePixel = 0
barBG.Parent = LoadingLayer
Instance.new("UICorner",barBG)

local bar = Instance.new("Frame")
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(180,90,255)
bar.BorderSizePixel = 0
bar.Parent = barBG
Instance.new("UICorner",bar)

------------------------------------------------
-- LOOP TEXT
------------------------------------------------
local loopText = Instance.new("TextLabel")
loopText.Size = UDim2.fromScale(1,0.05)
loopText.Position = UDim2.fromScale(0,0.61)
loopText.BackgroundTransparency = 1
loopText.TextScaled = true
loopText.TextColor3 = Color3.fromRGB(170,170,170)
loopText.Parent = LoadingLayer
loopText.TextTransparency = 1
if premiumFont then loopText.FontFace = premiumFont end

local messages = {
	"Swiftz Store No.1",
	"I Love Swiftz",
	"Credit : x2sxqz_"
}

task.spawn(function()
	local i = 1
	while loopText.Parent do
		loopText.Text = messages[i]
		TweenService:Create(loopText,TweenInfo.new(0.4),{TextTransparency = 0}):Play()
		task.wait(1.5)
		TweenService:Create(loopText,TweenInfo.new(0.4),{TextTransparency = 1}):Play()
		task.wait(0.4)
		i = i % #messages + 1
	end
end)

------------------------------------------------
-- DUST EFFECT (SMALL + GLOW)
------------------------------------------------
for i = 1,70 do
	local d = Instance.new("Frame")
	d.Size = UDim2.fromOffset(1.5,1.5)
	d.Position = UDim2.fromScale(math.random(),math.random())
	d.BackgroundColor3 = Color3.fromRGB(255,255,255)
	d.BackgroundTransparency = 0.3
	d.BorderSizePixel = 0
	d.Parent = LoadingLayer
	d.AnchorPoint = Vector2.new(0.5,0.5)

	local glow = Instance.new("UIStroke",d)
	glow.Thickness = 1
	glow.Transparency = 0.75

	task.spawn(function()
		while d.Parent do
			TweenService:Create(d,
				TweenInfo.new(8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
				{Position = UDim2.fromScale(math.random(),math.random())}
			):Play()
			task.wait(8)
		end
	end)
end

------------------------------------------------
-- LOADING PROCESS
------------------------------------------------
for i = 1,100 do
	bar.Size = UDim2.fromScale(i/100,1)
	task.wait(0.1)
end

------------------------------------------------
-- FADE OUT LOADING LAYER ONLY
------------------------------------------------
for _,v in ipairs(LoadingLayer:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v,TweenInfo.new(1),{TextTransparency = 1}):Play()
	elseif v:IsA("Frame") then
		TweenService:Create(v,TweenInfo.new(1),{BackgroundTransparency = 1}):Play()
	end
end

task.wait(1)
LoadingLayer:Destroy()

------------------------------------------------
-- CREDIT (PERSISTENT)
------------------------------------------------
local credit = Instance.new("TextLabel")
credit.Size = UDim2.fromScale(1,0.05)
credit.Position = UDim2.fromScale(0,0.02)
credit.BackgroundTransparency = 1
credit.Text = "Credit : x2sxqz"
credit.TextScaled = true
credit.TextColor3 = Color3.fromRGB(130,130,130)
credit.Parent = PersistentLayer
if premiumFont then credit.FontFace = premiumFont end

------------------------------------------------
-- RUN SCRIPT
------------------------------------------------
getgenv().Key = "MARU-7UYK5-WG09B-9XWD-QRJUI-FLVM"
getgenv().id = "861943643006435339"
_G.Script_Language = "Thai"

loadstring(game:HttpGet(
"https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"
))()

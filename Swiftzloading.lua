pcall(function()

-- SERVICES
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SwiftzLoading_FINAL"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- BACKGROUND
------------------------------------------------
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.Parent = gui

------------------------------------------------
-- BORDER EFFECT (SAFE)
------------------------------------------------
local borders = {}
local borderSize = 3

local function makeBorder(pos,size)
	local f = Instance.new("Frame")
	f.BackgroundColor3 = Color3.fromRGB(180,110,255)
	f.BorderSizePixel = 0
	f.Position = pos
	f.Size = size
	f.Parent = bg
	return f
end

borders[1] = makeBorder(UDim2.new(0,0,0,0),UDim2.new(1,0,0,borderSize))
borders[2] = makeBorder(UDim2.new(0,0,1,-borderSize),UDim2.new(1,0,0,borderSize))
borders[3] = makeBorder(UDim2.new(0,0,0,0),UDim2.new(0,borderSize,1,0))
borders[4] = makeBorder(UDim2.new(1,-borderSize,0,0),UDim2.new(0,borderSize,1,0))

task.spawn(function()
	local t = false
	while bg.Parent do
		for _,b in ipairs(borders) do
			TweenService:Create(
				b,
				TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
				{BackgroundColor3 = t and Color3.fromRGB(120,60,200) or Color3.fromRGB(200,130,255)}
			):Play()
		end
		t = not t
		task.wait(1.5)
	end
end)

------------------------------------------------
-- TITLE
------------------------------------------------
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.2,0)
title.Position = UDim2.new(0,0,0.32,0)
title.BackgroundTransparency = 1
title.Text = "Swiftz Store"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(220,220,220)
title.TextTransparency = 1
title.Parent = bg

TweenService:Create(title,TweenInfo.new(1),{TextTransparency = 0}):Play()

------------------------------------------------
-- LOADING BAR (PREMIUM SAFE)
------------------------------------------------
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.5,0,0.025,0)
barBG.Position = UDim2.new(0.25,0,0.55,0)
barBG.BackgroundColor3 = Color3.fromRGB(35,35,35)
barBG.BorderSizePixel = 0
barBG.Parent = bg
Instance.new("UICorner",barBG)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(180,90,255)
bar.BorderSizePixel = 0
bar.Parent = barBG
Instance.new("UICorner",bar)

------------------------------------------------
-- LOOP TEXT
------------------------------------------------
local loopText = Instance.new("TextLabel")
loopText.Size = UDim2.new(1,0,0.05,0)
loopText.Position = UDim2.new(0,0,0.62,0)
loopText.BackgroundTransparency = 1
loopText.TextScaled = true
loopText.TextColor3 = Color3.fromRGB(170,170,170)
loopText.TextTransparency = 1
loopText.Parent = bg

local texts = {
	"Swiftz Store No.1",
	"I Love Swiftz",
	"Credit : x2sxqz_"
}

task.spawn(function()
	local i = 1
	while loopText.Parent do
		loopText.Text = texts[i]
		TweenService:Create(loopText,TweenInfo.new(0.4),{TextTransparency = 0}):Play()
		task.wait(1.6)
		TweenService:Create(loopText,TweenInfo.new(0.4),{TextTransparency = 1}):Play()
		task.wait(0.4)
		i = i % #texts + 1
	end
end)

------------------------------------------------
-- DUST EFFECT
------------------------------------------------
for i = 1,60 do
	local d = Instance.new("Frame")
	d.Size = UDim2.new(0,1.5,0,1.5)
	d.Position = UDim2.new(math.random(),0,math.random(),0)
	d.BackgroundColor3 = Color3.fromRGB(255,255,255)
	d.BackgroundTransparency = 0.5
	d.BorderSizePixel = 0
	d.Parent = bg

	task.spawn(function()
		while d.Parent do
			TweenService:Create(
				d,
				TweenInfo.new(8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
				{Position = UDim2.new(math.random(),0,math.random(),0)}
			):Play()
			task.wait(8)
		end
	end)
end

------------------------------------------------
-- LOADING PROCESS
------------------------------------------------
for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	task.wait(0.1)
end

------------------------------------------------
-- FADE OUT LOADING
------------------------------------------------
TweenService:Create(bg,TweenInfo.new(1),{BackgroundTransparency = 1}):Play()
task.wait(1)
bg:Destroy()

------------------------------------------------
-- CREDIT (PERSISTENT)
------------------------------------------------
local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1,0,0.05,0)
credit.Position = UDim2.new(0,0,0.02,0)
credit.BackgroundTransparency = 1
credit.Text = "Credit : x2sxqz"
credit.TextScaled = true
credit.TextColor3 = Color3.fromRGB(140,140,140)
credit.Parent = gui

task.spawn(function()
	local t = false
	while credit.Parent do
		TweenService:Create(
			credit,
			TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
			{TextColor3 = t and Color3.fromRGB(110,110,110) or Color3.fromRGB(170,170,170)}
		):Play()
		t = not t
		task.wait(1.2)
	end
end)

------------------------------------------------
-- RUN SCRIPT
------------------------------------------------

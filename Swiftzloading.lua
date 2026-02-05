--// Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SwiftzLoading"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// Background
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.Parent = gui

--// Title
local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1,0.2)
title.Position = UDim2.fromScale(0,0.35)
title.BackgroundTransparency = 1
title.Text = "Swiftz Store"
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(200,200,200)
title.TextTransparency = 1
title.Parent = bg

--// Loading Bar BG
local barBG = Instance.new("Frame")
barBG.Size = UDim2.fromScale(0.5,0.025)
barBG.Position = UDim2.fromScale(0.25,0.55)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBG.BorderSizePixel = 0
barBG.Parent = bg
barBG.BackgroundTransparency = 1

--// Loading Bar
local bar = Instance.new("Frame")
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(180,180,180)
bar.BorderSizePixel = 0
bar.Parent = barBG

--// Percent Text
local percent = Instance.new("TextLabel")
percent.Size = UDim2.fromScale(1,0.05)
percent.Position = UDim2.fromScale(0,0.6)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.GothamMedium
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(200,200,200)
percent.TextTransparency = 1
percent.Parent = bg

--// Fade In
TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 0}):Play()
TweenService:Create(barBG, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
TweenService:Create(percent, TweenInfo.new(1), {TextTransparency = 0}):Play()

--// Loading Process
for i = 1,100 do
	bar.Size = UDim2.fromScale(i/100,1)
	percent.Text = i.."%"
	task.wait(0.1) -- 100 x 0.1 = 10 วินาที
end

--// Fade Out
local fadeInfo = TweenInfo.new(1)
TweenService:Create(bg, fadeInfo, {BackgroundTransparency = 1}):Play()
TweenService:Create(title, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(percent, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(barBG, fadeInfo, {BackgroundTransparency = 1}):Play()
TweenService:Create(bar, fadeInfo, {BackgroundTransparency = 1}):Play()

task.wait(2)
gui:Destroy()

--// Run Script
getgenv().Key = "MARU-7UYK5-WG09B-9XWD-QRJUI-FLVM"
getgenv().id = "861943643006435339"
_G.Script_Language = "Thai"
loadstring(game:HttpGet(
"https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"
))()

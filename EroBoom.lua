-- 極致爆音播放器 v2.0（超小、可拖、圓角、2秒內爆音）

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "EarrapeGUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主框架（超小巧）
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 50)  -- 縮小到極致
frame.Position = UDim2.new(0, 20, 0, 20)  -- 左上角起始
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Parent = gui

-- 圓角邊緣（超圓潤）
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- 漸變陰影效果
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 35))
}
gradient.Rotation = 45
gradient.Parent = frame

-- 標題（小巧）
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "💥爆音"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- 播放按鈕（閃爍效果）
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.9, 0, 0.55, 0)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
button.Text = "BOOM!"
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

local btnGradient = Instance.new("UIGradient")
btnGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 30, 30))
}
btnGradient.Rotation = 90
btnGradient.Parent = button

-- 按鈕閃爍動畫
local tween = game:GetService("TweenService")
local flash = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local flashTween = tween:Create(button, flash, {BackgroundColor3 = Color3.fromRGB(255, 150, 100)})
flashTween:Play()

-- 超強爆音 ID 列表（全部 ≤2秒，極致 loud）
local soundIds = {
    1846368080,  -- Vine Boom (0.8s)
    1839246711,  -- Scream (1.2s) 
    643297811,   -- Beat drop (1.5s)
    392813570,   -- Airhorn (1s)
    231219412,   -- Siren (0.9s)
    130774314,   -- Pirate (1.8s)
    454451340,   -- Recorder (1.1s)
    6897686359,  -- New loud (0.7s)
    6555905311,  -- Bass boost (1.4s)
    16190760005  -- Cowbell (0.6s)
}

-- 播放超爆音函數（多重疊加 + 極速）
local function playEarrape()
    local randomId = soundIds[math.random(1, #soundIds)]
    
    -- 疊加3個聲音 = 150音量等級！💥
    for i = 1, 3 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. randomId
        sound.Volume = 50  -- 瘋狂大聲！
        sound.PlayOnRemove = true  -- 即時播放
        sound.Parent = game-- 極致爆音播放器 v2.0（超小、可拖、圓角、2秒內爆音）

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "EarrapeGUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主框架（超小巧）
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 50)  -- 縮小到極致
frame.Position = UDim2.new(0, 20, 0, 20)  -- 左上角起始
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Parent = gui

-- 圓角邊緣（超圓潤）
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- 漸變陰影效果
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 35))
}
gradient.Rotation = 45
gradient.Parent = frame

-- 標題（小巧）
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "💥爆音"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- 播放按鈕（閃爍效果）
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.9, 0, 0.55, 0)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
button.Text = "BOOM!"
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

local btnGradient = Instance.new("UIGradient")
btnGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 30, 30))
}
btnGradient.Rotation = 90
btnGradient.Parent = button

-- 按鈕閃爍動畫
local tween = game:GetService("TweenService")
local flash = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local flashTween = tween:Create(button, flash, {BackgroundColor3 = Color3.fromRGB(255, 150, 100)})
flashTween:Play()

-- 超強爆音 ID 列表（全部 ≤2秒，極致 loud）
local soundIds = {
    1846368080,  -- Vine Boom (0.8s)
    1839246711,  -- Scream (1.2s) 
    643297811,   -- Beat drop (1.5s)
    392813570,   -- Airhorn (1s)
    231219412,   -- Siren (0.9s)
    130774314,   -- Pirate (1.8s)
    454451340,   -- Recorder (1.1s)
    6897686359,  -- New loud (0.7s)
    6555905311,  -- Bass boost (1.4s)
    16190760005  -- Cowbell (0.6s)
}

-- 播放超爆音函數（多重疊加 + 極速）
local function playEarrape()
    local randomId = soundIds[math.random(1, #soundIds)]
    
    -- 疊加3個聲音 = 150音量等級！💥
    for i = 1, 3 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. randomId
        sound.Volume = 50  -- 瘋狂大聲！
        sound.PlayOnRemove = true  -- 即時播放
        sound.Parent = game

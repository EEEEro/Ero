-- 極致爆音播放器 v2.2（瞬發連發版 + 預載入）

local player = game.Players.LocalPlayer
local debris = game:GetService("Debris")
local contentProvider = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "EarrapeGUI_Instant"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999

-- 主框架
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 50)
frame.Position = UDim2.new(0.5, -60, 0.1, 0) -- 初始居中偏上
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- 標題
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 極速爆音 v2.2"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- 按鈕
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.9, 0, 0.5, 0)
button.Position = UDim2.new(0.05, 0, 0.45, 0)
button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
button.Text = "BOOM!"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 5)
btnCorner.Parent = button

-- 拖拽系統
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- 音源 ID 與預載入
local soundIds = {
    1846368080, 1839246711, 643297811, 392813570, 
    231219412, 130774314, 454451340, 6897686359, 
    6555905311, 16190760005
}

-- 執行預載入（這會讓點擊時不需要等待下載）
for _, id in pairs(soundIds) do
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. id
    contentProvider:PreloadAsync({s})
end

-- 爆音核心函數
local function playEarrape()
    local randomId = soundIds[math.random(1, #soundIds)]
    
    -- 一次點擊生成 8 個音源疊加，暴力美學
    for i = 1, 8 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. randomId
        sound.Volume = 10 
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        
        -- 極速清理，不佔空間
        debris:AddItem(sound, 2)
    end
end

-- 使用 MouseButton1Down 代替 Click，反應更快
button.MouseButton1Down:Connect(playEarrape)

-- 按鈕閃爍特效
spawn(function()
    while true do
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(0.1)
        button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(0.1)
    end
end)

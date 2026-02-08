-- 極致爆音播放器 v2.3（瞬發連發 + 關閉按鈕版）

local player = game.Players.LocalPlayer
local debris = game:GetService("Debris")
local contentProvider = game:GetService("ContentProvider")
local userInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "EarrapeGUI_V2.3"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999

-- 主框架
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 130, 0, 60) -- 稍微加大一點點以容納關閉按鈕
frame.Position = UDim2.new(0.5, -65, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- 標題
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 0.4, 0)
title.Position = UDim2.new(0.05, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = "💥 爆音 v2.3"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- 【新增】關閉按鈕 (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0) -- 圓形按鈕
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Down:Connect(function()
    gui:Destroy() -- 直接刪除整個 GUI 關閉腳本
end)

-- 播放按鈕
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.9, 0, 0.4, 0)
button.Position = UDim2.new(0.05, 0, 0.5, 0)
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

for _, id in pairs(soundIds) do
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. id
    contentProvider:PreloadAsync({s})
end

-- 爆音核心函數
local function playEarrape()
    local randomId = soundIds[math.random(1, #soundIds)]
    for i = 1, 8 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. randomId
        sound.Volume = 10 
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        debris:AddItem(sound, 2)
    end
end

button.MouseButton1Down:Connect(playEarrape)

-- 按鈕閃爍特效
spawn(function()
    while gui.Parent do
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(0.1)
        button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(0.1)
    end
end)

-- 極致爆音播放器 v2.1 完整版（修復播放、新增拖拽、自動清理）

local player = game.Players.LocalPlayer
local debris = game:GetService("Debris")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "EarrapeGUI_Fixed"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999 -- 確保在最上層

-- 主框架
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 50)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true -- 允許交互
frame.Draggable = true -- 舊版屬性（部分環境仍支援）
frame.Parent = gui

-- 圓角
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- 標題
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "💥 爆音 v2.1"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- 播放按鈕
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.9, 0, 0.45, 0)
button.Position = UDim2.new(0.05, 0, 0.45, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
button.Text = "BOOM!"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

-- 簡單的拖拽邏輯補強 (支援 PC/手機)
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

-- 音源列表
local soundIds = {
    1846368080, 1839246711, 643297811, 392813570, 
    231219412, 130774314, 454451340, 6897686359, 
    6555905311, 16190760005
}

-- 播放函數
local function playEarrape()
    local randomId = soundIds[math.random(1, #soundIds)]
    
    -- 疊加播放以達到極限音量
    for i = 1, 5 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. randomId
        sound.Volume = 10 -- Roblox 單個音量上限通常有效值為 10，疊加更有用
        sound.PlaybackSpeed = 1 -- 保持原速爆音
        sound.Parent = game:GetService("SoundService") -- 必須放在 Service 裡
        sound:Play()
        
        -- 播放完後自動銷毀，避免卡頓
        debris:AddItem(sound, 3) 
    end
end

button.MouseButton1Click:Connect(playEarrape)

-- 按鈕動畫
spawn(function()
    while true do
        button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(0.5)
        button.BackgroundColor3 = Color3.fromRGB(255, 150, 100)
        task.wait(0.5)
    end
end)

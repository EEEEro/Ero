-- 簡單爆音隨機播放器（本地最大音量）

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "爆音迷因播放器"
title.TextColor3 = Color3.new(1, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0.5, 0)
button.Position = UDim2.new(0.1, 0, 0.35, 0)
button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
button.Text = "播放隨機爆音！"
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Font = Enum.Font.SourceSansBold
button.Parent = frame

-- 爆音 ID 列表（可自行增加）
local soundIds = {
    1846368080,
    1839246711,
    643297811,
    285334243,
    454451340,
    130774314,
    392813570,
    231219412,
    4138780964,
    16190760005,
    -- 你可以加更多，例如 6897686359, 6555905311 等
}

button.MouseButton1Click:Connect(function()
    -- 隨機選一個 ID
    local randomId = soundIds[math.random(1, #soundIds)]
    
    -- 建立聲音（放在 PlayerGui 比較保險，本地播放）
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. randomId
    sound.Volume = 10          -- 最大音量（甚至可以試 100，但 10 已經很爆了）
    sound.Looped = false
    sound.Parent = player.PlayerGui  -- 或 game.SoundService
    
    -- 強制播放
    sound:Play()
    
    -- 可選：播完自動刪除，避免卡
    game.Debris:AddItem(sound, 10)
    
    print("播放爆音 ID: " .. randomId)
end)

print("爆音按鈕已載入！點紅色按鈕試試～")

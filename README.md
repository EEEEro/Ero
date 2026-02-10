-- 這只是示意，實際要自己找對 path 才行
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- 假設你找到槍的 handle 或 model
for _, gun in pairs(workspace:GetDescendants()) do
    if gun:IsA("Model") and gun:FindFirstChild("Handle") and gun.Handle:FindFirstChildOfClass("MeshPart") then
        -- 強制換材質（範例）
        local part = gun.Handle
        part.Material = Enum.Material.Neon  -- 或其他
        part.Color = Color3.fromRGB(255, 0, 255)  -- 亂數顏色之類
        -- 如果有 Texture / Decal 就替換 TextureID
        -- part.TextureID = "rbxassetid://很帥的貼圖id"
    end
end

-- 或監聽 Backpack / Character 變化再換

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- پاککرنا هابێ بەرێ ئەگەر هەبیت
if playerGui:FindFirstChild("SeeyouHub") then playerGui.SeeyouHub:Destroy() end

-- دروستکرنا مێنیوی
local ScreenGui = Instance.new("ScreenGui", playerGui)
ScreenGui.Name = "SeeyouHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true

-- ناڤێ هابێ
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "SEEYOU HUB V10.9"
Title.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- دوگمەیا Speed
local SpeedBtn = Instance.new("TextButton", Frame)
SpeedBtn.Size = UDim2.new(0, 260, 0, 40)
SpeedBtn.Position = UDim2.new(0.5, -130, 0.2, 0)
SpeedBtn.Text = "Speed: 50"
SpeedBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.MouseButton1Click:Connect(function() player.Character.Humanoid.WalkSpeed = 50 end)

-- دوگمەیا Invisible (Teleport Far)
local InvBtn = Instance.new("TextButton", Frame)
InvBtn.Size = UDim2.new(0, 260, 0, 40)
InvBtn.Position = UDim2.new(0.5, -130, 0.4, 0)
InvBtn.Text = "Invisible (Teleport)"
InvBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
InvBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local isInvisible = false
InvBtn.MouseButton1Click:Connect(function()
    if not isInvisible then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -5000, 0)
        InvBtn.Text = "Back to Map"
        isInvisible = true
    else
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        InvBtn.Text = "Invisible (Teleport)"
        isInvisible = false
    end
end)

-- دوگمەیا ESP (Simple)
local ESPBtn = Instance.new("TextButton", Frame)
ESPBtn.Size = UDim2.new(0, 260, 0, 40)
ESPBtn.Position = UDim2.new(0.5, -130, 0.6, 0)
ESPBtn.Text = "Toggle ESP"
ESPBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
ESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

ESPBtn.MouseButton1Click:Connect(function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = Instance.new("Highlight", p.Character)
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
        end
    end
end)

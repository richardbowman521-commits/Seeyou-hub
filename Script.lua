local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Sidebar = Instance.new("Frame")
local ContentFrame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "SeeyouHubV10"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true

TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
TopBar.Size = UDim2.new(0, 500, 0, 35)

Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.03, 0, 0, 0)
Title.Size = UDim2.new(0, 300, 0, 35)
Title.Text = "SEEYOU HUB v10.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left

Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Sidebar.Position = UDim2.new(0, 0, 0, 35)
Sidebar.Size = UDim2.new(0, 130, 0, 285)

ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ContentFrame.Position = UDim2.new(0, 130, 0, 35)
ContentFrame.Size = UDim2.new(0, 370, 0, 285)

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Parent = Sidebar
AvatarImage.BackgroundTransparency = 1
AvatarImage.Position = UDim2.new(0.15, 0, 0.05, 0)
AvatarImage.Size = UDim2.new(0, 90, 0, 90)
local player = game.Players.LocalPlayer
local userId = player.UserId
AvatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"

local Tab1Btn = Instance.new("TextButton")
Tab1Btn.Parent = Sidebar
Tab1Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Tab1Btn.Position = UDim2.new(0.05, 0, 0.4, 0)
Tab1Btn.Size = UDim2.new(0, 115, 0, 35)
Tab1Btn.Text = "Character"
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Btn.TextSize = 14

local Tab2Btn = Instance.new("TextButton")
Tab2Btn.Parent = Sidebar
Tab2Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Tab2Btn.Position = UDim2.new(0.05, 0, 0.55, 0)
Tab2Btn.Size = UDim2.new(0, 115, 0, 35)
Tab2Btn.Text = "Players Target"
Tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2Btn.TextSize = 14

local CharacterTab = Instance.new("Frame")
CharacterTab.Parent = ContentFrame
CharacterTab.BackgroundTransparency = 1
CharacterTab.Size = UDim2.new(1, 0, 1, 0)
CharacterTab.Visible = true

local PlayersTab = Instance.new("Frame")
PlayersTab.Parent = ContentFrame
PlayersTab.BackgroundTransparency = 1
PlayersTab.Size = UDim2.new(1, 0, 1, 0)
PlayersTab.Visible = false

Tab1Btn.MouseButton1Click:Connect(function()
    CharacterTab.Visible = true
    PlayersTab.Visible = false
end)

Tab2Btn.MouseButton1Click:Connect(function()
    CharacterTab.Visible = false
    PlayersTab.Visible = true
end)

local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = CharacterTab
SpeedButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
SpeedButton.Position = UDim2.new(0.05, 0, 0.05, 0)
SpeedButton.Size = UDim2.new(0, 150, 0, 40)
SpeedButton.Text = "Speed X60"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 60
    end
end)

local JumpButton = Instance.new("TextButton")
JumpButton.Parent = CharacterTab
JumpButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
JumpButton.Position = UDim2.new(0.52, 0, 0.05, 0)
JumpButton.Size = UDim2.new(0, 150, 0, 40)
JumpButton.Text = "Jump Power 100"
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)

JumpButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 100
    end
end)

local FlyButton = Instance.new("TextButton")
FlyButton.Parent = CharacterTab
FlyButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
FlyButton.Position = UDim2.new(0.05, 0, 0.25, 0)
FlyButton.Size = UDim2.new(0, 150, 0, 40)
FlyButton.Text = "Fly (Float)"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local flying = false
local bv = nil
FlyButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if not flying then
            flying = true
            bv = Instance.new("BodyVelocity")
            bv.Parent = player.Character.HumanoidRootPart
            bv.Velocity = Vector3.new(0, 2, 0)
            bv.MaxForce = Vector3.new(0, math.huge, 0)
            FlyButton.Text = "Fly: ON"
        else
            flying = false
            if bv then bv:Destroy() end
            FlyButton.Text = "Fly (Float)"
        end
    end
end)

local InvisibilityButton = Instance.new("TextButton")
InvisibilityButton.Parent = CharacterTab
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
InvisibilityButton.Position = UDim2.new(0.52, 0, 0.25, 0)
InvisibilityButton.Size = UDim2.new(0, 150, 0, 40)
InvisibilityButton.Text = "Invisible (Local)"
InvisibilityButton.TextColor3 = Color3.fromRGB(255, 255, 255)

InvisibilityButton.MouseButton1Click:Connect(function()
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = 1
            elseif part:IsA("Accessory") and part:FindFirstChild("Handle") then
                part.Handle.Transparency = 1
            end
        end
    end
end)

local TargetBox = Instance.new("TextBox")
TargetBox.Parent = PlayersTab
TargetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TargetBox.Position = UDim2.new(0.05, 0, 0.05, 0)
TargetBox.Size = UDim2.new(0, 315, 0, 40)
TargetBox.Text = "Enter Player Name Here"
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.TextSize = 14

local TeleportButton = Instance.new("TextButton")
TeleportButton.Parent = PlayersTab
TeleportButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
TeleportButton.Position = UDim2.new(0.05, 0, 0.25, 0)
TeleportButton.Size = UDim2.new(0, 150, 0, 40)
TeleportButton.Text = "Teleport To"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)

TeleportButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text:lower()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Name:lower():sub(1, #targetName) == targetName and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
            end
            break
        end
    end
end)

local SpectateButton = Instance.new("TextButton")
SpectateButton.Parent = PlayersTab
SpectateButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
SpectateButton.Position = UDim2.new(0.52, 0, 0.25, 0)
SpectateButton.Size = UDim2.new(0, 150, 0, 40)
SpectateButton.Text = "Spectate Player"
SpectateButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local spectating = false
SpectateButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text:lower()
    local cam = workspace.CurrentCamera
    if not spectating then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Name:lower():sub(1, #targetName) == targetName and p.Character and p.Character:FindFirstChild("Humanoid") then
                cam.CameraSubject = p.Character.Humanoid
                spectating = true
                SpectateButton.Text = "Stop Spectate"
                break
            end
        end
    else
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            cam.CameraSubject = player.Character.Humanoid
        end
        spectating = false
        SpectateButton.Text = "Spectate Player"
    end
end)

-- دوگمەیا ئێکێ: ئەنیمەیشنا دۆڵفینی یا گشتی (یا بەری نوکە)
local BangButton = Instance.new("TextButton")
BangButton.Parent = PlayersTab
BangButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
BangButton.Position = UDim2.new(0.05, 0, 0.45, 0)
BangButton.Size = UDim2.new(0, 150, 0, 40)
BangButton.Text = "Bang (Dolphin)"
BangButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local banging = false
local bangLoop = nil

BangButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text:lower()
    if not banging then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Name:lower():sub(1, #targetName) == targetName and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                banging = true
                BangButton.Text = "Stop Bang"
                
                bangLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local speed = 14
                        local forwardBackward = math.sin(tick() * speed) * 0.9
                        local upDown = math.cos(tick() * speed) * 0.6
                        local rotationAngle = math.sin(tick() * speed) * 0.25

                        player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame 
                            * CFrame.new(0, upDown - 0.2, 1.1 + forwardBackward) 
                            * CFrame.Angles(rotationAngle, 0, 0)
                    end
                end)
                break
            end
        end
    else
        banging = false
        BangButton.Text = "Bang (Dolphin)"
        if bangLoop then bangLoop:Disconnect() end
    end
end)

-- دوگمەیا دووێ یا نوو: لڤین ل هەمبەر دەڤ و سەرێ یاریزانی
local MouthBangButton = Instance.new("TextButton")
MouthBangButton.Parent = PlayersTab
MouthBangButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
MouthBangButton.Position = UDim2.new(0.52, 0, 0.45, 0)
MouthBangButton.Size = UDim2.new(0, 150, 0, 40)
MouthBangButton.Text = "Bang (Mouth Target)"
MouthBangButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local mouthBanging = false
local mouthLoop = nil

MouthBangButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text:lower()
    if not mouthBanging then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Name:lower():sub(1, #targetName) == targetName and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                mouthBanging = true
                MouthBangButton.Text = "Stop Mouth"
                
                mouthLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local speed = 16 -- خێراییەکا گونجای بۆ ڤێ لڤینێ
                        -- لڤینا چوون پێش و پاش ل بەردەم سەر و دەڤێ یاریزانێ دی
                        local moveInAndOut = math.sin(tick() * speed) * 0.7 
                        
                        -- دانانا جهێ کاراکتەری ڕێک ل بەردەم سەرێ یاریزانی (گۆڕینی دووری و بەرزی بۆ هەمبەر دەڤی)
                        player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame 
                            * CFrame.new(0, 0.8, -1.0 - moveInAndOut) 
                            * CFrame.Angles(0, math.pi, 0) -- زڤڕاندنا کاراکتەری بۆ هندێ ڕو ب ڕو بن
                    end
                end)
                break
            end
        end
    else
        mouthBanging = false
        MouthBangButton.Text = "Bang (Mouth Target)"
        if mouthLoop then mouthLoop:Disconnect() end
    end
end)


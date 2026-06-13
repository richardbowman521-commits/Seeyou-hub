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
Title.Text = "SEEYOU HUB v10.4"
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

-- 1. خێرایی
local SpeedInput = Instance.new("TextBox")
SpeedInput.Parent = CharacterTab
SpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedInput.Position = UDim2.new(0.05, 0, 0.05, 0)
SpeedInput.Size = UDim2.new(0, 170, 0, 35)
SpeedInput.Text = "Speed (Default: 16)"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 12
SpeedInput.ClearTextOnFocus = true

local SetSpeedButton = Instance.new("TextButton")
SetSpeedButton.Parent = CharacterTab
SetSpeedButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
SetSpeedButton.Position = UDim2.new(0.55, 0, 0.05, 0)
SetSpeedButton.Size = UDim2.new(0, 140, 0, 35)
SetSpeedButton.Text = "Set Speed"
SetSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local customSpeed = nil
SetSpeedButton.MouseButton1Click:Connect(function()
    local speedValue = tonumber(SpeedInput.Text)
    if speedValue then
        customSpeed = speedValue
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speedValue
        end
    end
end)

-- 2. بازدان
local JumpInput = Instance.new("TextBox")
JumpInput.Parent = CharacterTab
JumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
JumpInput.Position = UDim2.new(0.05, 0, 0.22, 0)
JumpInput.Size = UDim2.new(0, 170, 0, 35)
JumpInput.Text = "Jump Height (e.g. 15)"
JumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpInput.TextSize = 12
JumpInput.ClearTextOnFocus = true

local SetJumpButton = Instance.new("TextButton")
SetJumpButton.Parent = CharacterTab
SetJumpButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
SetJumpButton.Position = UDim2.new(0.55, 0, 0.22, 0)
SetJumpButton.Size = UDim2.new(0, 140, 0, 35)
SetJumpButton.Text = "Set Jump"
SetJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local customJump = nil
SetJumpButton.MouseButton1Click:Connect(function()
    local jumpValue = tonumber(JumpInput.Text)
    if jumpValue then
        customJump = jumpValue
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local hum = player.Character.Humanoid
            hum.UseJumpPower = false
            hum.JumpHeight = jumpValue
            hum.JumpPower = jumpValue * 7
        end
    end
end)

-- 3. فڕین
local FlyInput = Instance.new("TextBox")
FlyInput.Parent = CharacterTab
FlyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyInput.Position = UDim2.new(0.05, 0, 0.39, 0)
FlyInput.Size = UDim2.new(0, 170, 0, 35)
FlyInput.Text = "Fly Speed (Default: 2)"
FlyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyInput.TextSize = 12
FlyInput.ClearTextOnFocus = true

local FlyButton = Instance.new("TextButton")
FlyButton.Parent = CharacterTab
FlyButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
FlyButton.Position = UDim2.new(0.55, 0, 0.39, 0)
FlyButton.Size = UDim2.new(0, 140, 0, 35)
FlyButton.Text = "Fly: OFF"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local flying = false
local bv = nil
FlyButton.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        if not flying then
            flying = true
            FlyButton.Text = "Fly: ON"
            bv = Instance.new("BodyVelocity")
            bv.Parent = player.Character.HumanoidRootPart
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            
            spawn(function()
                while flying and player.Character and player.Character:FindFirstChild("HumanoidRootPart") do
                    local flySpeed = tonumber(FlyInput.Text) or 2
                    bv.Velocity = player.Character.Humanoid.MoveDirection * (flySpeed * 20) + Vector3.new(0, 2, 0)
                    task.wait()
                end
            end)
        else
            flying = false
            FlyButton.Text = "Fly: OFF"
            if bv then bv:Destroy() end
        end
    end
end)

-- 4. چاککرنا بنەڕەتی یا Shift Lock (سیستەمێ فەرمی و سۆک یێ ڕۆبلۆکس)
local ShiftLockButton = Instance.new("TextButton")
ShiftLockButton.Parent = CharacterTab
ShiftLockButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
ShiftLockButton.Position = UDim2.new(0.05, 0, 0.58, 0)
ShiftLockButton.Size = UDim2.new(0, 170, 0, 35)
ShiftLockButton.Text = "Shift Lock: OFF"
ShiftLockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShiftLockButton.TextSize = 13

local shiftLockEnabled = false

-- دروستکردنا نیشانەکا بچووک (Crosshair) بۆ ناڤەڕاستا شاشێ کاتێ لۆک دبیت
local CenterDot = Instance.new("Frame")
CenterDot.Size = UDim2.new(0, 6, 0, 6)
CenterDot.Position = UDim2.new(0.5, -3, 0.5, -3)
CenterDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CenterDot.BackgroundTransparency = 0.3
CenterDot.Visible = false
CenterDot.Parent = ScreenGui

ShiftLockButton.MouseButton1Click:Connect(function()
    local camera = workspace.CurrentCamera
    if not shiftLockEnabled then
        shiftLockEnabled = true
        ShiftLockButton.Text = "Shift Lock: ON"
        CenterDot.Visible = true
        
        -- بەکارئینانا سیستەمێ فەرمی یێ MouseLock یێ ڕۆبلۆکس بۆ لڤینا سۆک
        pcall(function()
            player.DevEnableMouseLock = true
            game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.LockCenter
        end)
    else
        shiftLockEnabled = false
        ShiftLockButton.Text = "Shift Lock: OFF"
        CenterDot.Visible = false
        pcall(function()
            player.DevEnableMouseLock = false
            game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
            camera.CameraType = Enum.CameraType.Custom
        end)
    end
end)

-- ٥. غەیبکرن
local InvisibilityButton = Instance.new("TextButton")
InvisibilityButton.Parent = CharacterTab
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
InvisibilityButton.Position = UDim2.new(0.55, 0, 0.58, 0)
InvisibilityButton.Size = UDim2.new(0, 140, 0, 35)
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

-- لۆپ بۆ پاراستنا خێرایی، بازدان، و ئاڕاستەیا کاراکتەری دگەل کامێرێ
game:GetService("RunService").RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        if customSpeed then hum.WalkSpeed = customSpeed end
        if customJump then
            hum.UseJumpPower = false
            hum.JumpHeight = customJump
        end
        
        -- ئەگەر Shift Lock کارا بوو، دێ کاراکتەری ل سەر ئاڕاستەیا کامێرێ ڕێک ئێخیت ب کەیفا تە بێ لۆک کرنا زوومێ
        if shiftLockEnabled and player.Character:FindFirstChild("HumanoidRootPart") then
            local camera = workspace.CurrentCamera
            local rootPart = player.Character.HumanoidRootPart
            local lookVector = camera.CFrame.LookVector
            
            -- سوڕاندنا کاراکتەری بەرەڤ جهێ کامێرێ سەیڕ دکەت، بەس ڕێ ددت کامێرە زووم ببیت
            local targetRotation = math.atan2(-lookVector.X, -lookVector.Z)
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, targetRotation, 0)
            
            -- پاراستنا زوومێ و سۆکییا کامێرێ
            camera.CameraType = Enum.CameraType.Custom
        end
    end
end)

-- بەشێ Players Target
local TargetBox = Instance.new("TextBox")
TargetBox.Parent = PlayersTab
TargetBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TargetBox.Position = UDim2.new(0.05, 0, 0.05, 0)
TargetBox.Size = UDim2.new(0, 315, 0, 40)
TargetBox.Text = "Enter Player Name Here"
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.TextSize = 14
TargetBox.ClearTextOnFocus = true

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

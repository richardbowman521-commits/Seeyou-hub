local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Sidebar = Instance.new("Frame")
local ContentFrame = Instance.new("Frame")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")⁠
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

-- ==================== CHARACTER TAB ====================
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
    if speedValue then customSpeed = speedValue end
end)

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
    if jumpValue then customJump = jumpValue end
end)

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

local ShiftLockButton = Instance.new("TextButton")
ShiftLockButton.Parent = CharacterTab
ShiftLockButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
ShiftLockButton.Position = UDim2.new(0.05, 0, 0.56, 0)
ShiftLockButton.Size = UDim2.new(0, 170, 0, 32)
ShiftLockButton.Text = "Shift Lock: OFF"
ShiftLockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShiftLockButton.TextSize = 13

local shiftLockEnabled = false
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

local InvisibilityButton = Instance.new("TextButton")
InvisibilityButton.Parent = CharacterTab
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
InvisibilityButton.Position = UDim2.new(0.55, 0, 0.56, 0)
InvisibilityButton.Size = UDim2.new(0, 140, 0, 32)
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

-- لڤاندنا دوگمەیا ESP بۆ خوارێ د بەشێ Character دا
local EspButton = Instance.new("TextButton")
EspButton.Parent = CharacterTab
EspButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
EspButton.Position = UDim2.new(0.05, 0, 0.73, 0)
EspButton.Size = UDim2.new(0, 325, 0, 35)
EspButton.Text = "ESP: OFF"
EspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EspButton.TextSize = 14

local espEnabled = false
local espFolder = Instance.new("Folder")
espFolder.Name = "SeeyouESP"
espFolder.Parent = game.CoreGui

local function createESP(p)
    if p == player then return end
    p.CharacterAdded:Connect(function(char)
        if not espEnabled then return end
        task.wait(0.5)
        
        if char:FindFirstChild("HumanoidRootPart") and not espFolder:FindFirstChild(p.Name) then
            local box = Instance.new("BoxHandleAdornment")
            box.Name = p.Name
            box.Size = Vector3.new(4, 6, 4)
            box.Color3 = Color3.fromRGB(255, 0, 0) -- ڕەنگێ سۆر بۆ چوارچۆڤەی
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Adornee = char.HumanoidRootPart
            box.Transparency = 0.5
            box.Parent = espFolder
            
            local bb = Instance.new("BillboardGui")
            bb.Name = p.Name .. "_Name"
            bb.Size = UDim2.new(0, 200, 0, 50)
            bb.AlwaysOnTop = true
            bb.StudsOffset = Vector3.new(0, 3.5, 0)
            bb.Adornee = char.HumanoidRootPart
            bb.Parent = espFolder
            
            local tl = Instance.new("TextLabel")
            tl.Size = UDim2.new(1, 0, 1, 0)
            tl.BackgroundTransparency = 1
            tl.Text = p.Name
            tl.TextColor3 = Color3.fromRGB(255, 255, 255)
            tl.TextSize = 12
            tl.Font = Enum.Font.SourceSansBold
            tl.Parent = bb
        end
    end)
end

EspButton.MouseButton1Click:Connect(function()
    if not espEnabled then
        espEnabled = true
        EspButton.Text = "ESP: ON"
        
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local char = p.Character
                local box = Instance.new("BoxHandleAdornment")
                box.Name = p.Name
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = Color3.fromRGB(255, 0, 0)
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Adornee = char.HumanoidRootPart
                box.Transparency = 0.5
                box.Parent = espFolder
                
                local bb = Instance.new("BillboardGui")
                bb.Name = p.Name .. "_Name"
                bb.Size = UDim2.new(0, 200, 0, 50)
                bb.AlwaysOnTop = true
                bb.StudsOffset = Vector3.new(0, 3.5, 0)
                bb.Adornee = char.HumanoidRootPart
                bb.Parent = espFolder
                
                local tl = Instance.new("TextLabel")
                tl.Size = UDim2.new(1, 0, 1, 0)
                tl.BackgroundTransparency = 1
                tl.Text = p.Name
                tl.TextColor3 = Color3.fromRGB(255, 255, 255)
                tl.TextSize = 12
                tl.Font = Enum.Font.SourceSansBold
                tl.Parent = bb
            end
        end
    else
        espEnabled = false
        EspButton.Text = "ESP: OFF"
        espFolder:ClearAllChildren()
    end
end)

game.Players.PlayerAdded:Connect(createESP)
game.Players.PlayerRemoving:Connect(function(p)
    if espFolder:FindFirstChild(p.Name) then espFolder[p.Name]:Destroy() end
    if espFolder:FindFirstChild(p.Name .. "_Name") then espFolder[p.Name .. "_Name"]:Destroy() end
end)

-- ==================== PLAYERS TARGET TAB ====================
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

-- ==================== LOOPS SYSTEM ====================
game:GetService("RunService").RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local hum = player.Character.Humanoid
        if customSpeed then hum.WalkSpeed = customSpeed end
        if customJump then
            hum.UseJumpPower = false
            hum.JumpHeight = customJump
        end
        
        -- سیستەمێ Shift Lock
        if shiftLockEnabled and player.Character:FindFirstChild("HumanoidRootPart") then
            local camera = workspace.CurrentCamera
            local rootPart = player.Character.HumanoidRootPart
            local lookVector = camera.CFrame.LookVector
            local targetRotation = math.atan2(-lookVector.X, -lookVector.Z)
            rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, targetRotation, 0)
            camera.CameraType = Enum.CameraType.Custom
        end
    end
end)

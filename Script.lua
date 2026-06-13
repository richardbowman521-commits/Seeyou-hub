local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")

local success, err = pcall(function()
    -- 1. پاککرنا مێنیویا کەڤن
    if playerGui:FindFirstChild("SeeyouHubV10") then playerGui.SeeyouHubV10:Destroy() end

    -- 2. دروستکرنا ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SeeyouHubV10"
    ScreenGui.Parent = playerGui -- ل ڤێرێ یا دڵنیایە
    ScreenGui.ResetOnSpawn = false

    -- 3. دروستکرنا MainFrame (هەمی کۆدێن تە یێن دی)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Name = "MainFrame"
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
    MainFrame.Size = UDim2.new(0, 500, 0, 320)
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- ئەڤە هەمی کۆدێن تە یێن (TopBar, Sidebar, هتد...) ل ڤێرێ زێدە بکە
    -- نموونە:
    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
    TopBar.Size = UDim2.new(1, 0, 0, 35)
    
    local Title = Instance.new("TextLabel", TopBar)
    Title.Text = "SEEYOU HUB v10.7"
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.new(1, 1, 1)

    -- کۆدێن تە یێن دی هەمیان ل ڤێرێ بێخە د ناڤ ڤی pcallـی دا
end)

if not success then
    warn("Seeyou Hub Error: " .. err)
end

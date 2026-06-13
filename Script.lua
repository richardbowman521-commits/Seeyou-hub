local success, err = pcall(function()
    -- ڤەگوهاستنا مێنیویێ بۆ PlayerGui (جهێ دروست)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- پاککرنا مێنیویا کەڤن ئەگەر هەبیت
    local existing = playerGui:FindFirstChild("SeeyouHubV10")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SeeyouHubV10"
    ScreenGui.Parent = playerGui 
    ScreenGui.ResetOnSpawn = false

    -- ڤێرێ هەمی کۆدێن خۆ یێن (MainFrame, TopBar, هتد...) ل دووڤ ئێک دابنە
    -- ئەڤە نموونەکا بچووکە:
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 500, 0, 320)
    MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Visible = true -- دڤێت یا true بیت
end)

if not success then
    warn("Seeyou Hub Error: " .. err)
end

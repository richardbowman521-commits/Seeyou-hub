-- Seeyou Hub V10.7 - Fixed Version
local success, err = pcall(function()
    
    -- 1. پاککرنا مێنیویا کەڤن (دا دوو مێنیو ل سەر ئێک نەبن)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local existing = playerGui:FindFirstChild("SeeyouHubV10")
    if existing then existing:Destroy() end

    -- 2. دروستکرنا مێنیویا نوو ل جهێ دروست (PlayerGui)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SeeyouHubV10"
    ScreenGui.Parent = playerGui -- ل ڤێرێ ب گۆڕی بۆ PlayerGui
    ScreenGui.ResetOnSpawn = false

    -- باقی کۆدێن تە ل ڤێرێ بێخە (هەمی سکریپتا تە یا دی ل ڤێرێ دمینیت)
    -- ... (کۆدێن خۆ ل ڤێرێ پەیست بکە) ...
    
end)

if not success then
    warn("Seeyou Hub Error: " .. err)
end

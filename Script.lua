-- ڤی کۆدێ دگەل یێن بەری نوو ل جهێ وێ دابنە
-- سیستەمێ Invisible (Server-side simulation)
local isInvisible = false
InvisibilityButton.MouseButton1Click:Connect(function()
    if not isInvisible then
        isInvisible = true
        InvisibilityButton.Text = "Visible (Hide)"
        -- ڤەشارتنا کاراکتەری ب برنا وی بۆ ژێر ئەردی یان جهەکێ دویر
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -500, 0)
        end
    else
        isInvisible = false
        InvisibilityButton.Text = "Invisible (Local)"
        -- زڤراندنا کاراکتەری بۆ جهێ ئاسایی
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
    end
end)

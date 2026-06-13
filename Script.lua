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
end)-- دوگمەیا Invisible
local InvButton = Instance.new("TextButton", Frame)
InvButton.Size = UDim2.new(0, 300, 0, 50)
InvButton.Position = UDim2.new(0.5, -150, 0.7, 0)
InvButton.Text = "Invisible (Local)"
InvButton.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
InvButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InvButton.ZIndex = 101

InvButton.MouseButton1Click:Connect(function()
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = 1
            end
        end
    end
end)


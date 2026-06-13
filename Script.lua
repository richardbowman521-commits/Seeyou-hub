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
        if player.
            
            Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
    end
end)-- دوگمەیا Invisible
-- ڤێ دوگمێ ل جهێ یێ بەری دابنە
local InvButton = Instance.new("TextButton", Frame)
InvButton.Size = UDim2.new(0, 300, 0, 50)
InvButton.Position = UDim2.new(0.5, -150, 0.7, 0)
InvButton.Text = "Invisible (Teleport Far)"
InvButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0) -- ڕەنگێ سۆر
InvButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InvButton.ZIndex = 101

local isFar = false
InvButton.MouseButton1Click:Connect(function()
    if not isFar then
        isFar = true
        InvButton.Text = "Back to Map"
        -- برنا تە بۆ جهەکێ زۆر دویر (ئەردێ نەدیتن)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -5000, 0)
    else
        isFar = false
        InvButton.Text = "Invisible (Teleport Far)"
        -- زڤراندنا تە بۆ جهێ یاریێ
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
    end
end)

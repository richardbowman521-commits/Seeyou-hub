print("1 - سکریپت دەست پێ کر")
-- ...
-- ل ناڤا سکریپتا خۆ، ل جهێن جودا (وەک پشتی MainFrame و پشتی TopBar)
print("2 - مێنیو هاتە چێکرن")
-- دەستپێکا پاراستنێ
local success, err = pcall(
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    if existing then existing:Destroy() end

    -- (ل ڤێرێ هەمی سکریپتا خۆ یا کەڤن پەیست بکە)
    -- ب تنێ کۆدێن خۆ یێن دی ل ڤێرێ پەیست بکە 

end)

-- ئەگەر سکریپت یا خەلەت بیت، دێ ئاگاداریەکێ دەت
if not success then
    warn("Seeyou Hub Error: " .. err)
end

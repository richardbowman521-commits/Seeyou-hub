local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local flying = false
local speed = 50 -- ل ڤێرێ دشێی لێزاتیا خۆ بگۆڕی
local bv = nil

-- دوگمەیا Fly (ئەگەر تە دڤێت ل سەر دوگمەیەکێ بیت)
local function startFly()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        flying = true
        
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = hrp
        
        local bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp
        
        spawn(function()
            while flying do
                local cam = workspace.CurrentCamera
                bv.Velocity = ((cam.CFrame.LookVector * (speed)) + (Vector3.new(0, 0, 0)))
                bg.CFrame = cam.CFrame
                task.wait()
            end
        end)
    end
end

local function stopFly()
    flying = false
    if bv then bv:Destroy() end
    if player.Character and player.Character.HumanoidRootPart:FindFirstChild("BodyGyro") then
        player.Character.HumanoidRootPart.BodyGyro:Destroy()
    end
end

-- ئەڤە کلیلێ ل ڤێ "Fly"ـێ دکەت (تەنێ ل سەر "F" ب دابنە)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        if not flying then
            startFly()
        else
            stopFly()
        end
    end
end)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local topbarPlus = playerGui:WaitForChild("TopbarPlus")
local topbarContainer = topbarPlus:WaitForChild("TopbarContainer")
local unnamedIcon = topbarContainer:WaitForChild("UnnamedIcon")
local dropdownContainer = unnamedIcon:WaitForChild("DropdownContainer")
local dropdownFrame = dropdownContainer:WaitForChild("DropdownFrame")

local charFrame = Instance.new("Frame")
charFrame.Name = "Char"
charFrame.Parent = dropdownFrame
charFrame.BackgroundTransparency = 1
charFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
charFrame.BorderSizePixel = 1
charFrame.LayoutOrder = 14
charFrame.Size = UDim2.new(1, 0, 0, 32)
charFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
charFrame.ZIndex = 1

local iconButton = Instance.new("TextButton")
iconButton.Name = "IconButton"
iconButton.Parent = charFrame
iconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
iconButton.BackgroundTransparency = 0.5
iconButton.BorderSizePixel = 0
iconButton.Text = ""
iconButton.TextScaled = false
iconButton.TextSize = 8
iconButton.TextTransparency = 1
iconButton.TextWrapped = false
iconButton.Position = UDim2.new(0, 0, 0, 0)
iconButton.Size = UDim2.new(1, 0, 1, 0)
iconButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconButton.Font = Enum.Font.Legacy
iconButton.LayoutOrder = 0

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Parent = iconButton
iconImage.AnchorPoint = Vector2.new(0, 0.5)
iconImage.BackgroundTransparency = 1
iconImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconImage.BorderSizePixel = 1
iconImage.Image = "rbxassetid://124873920211628"
iconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconImage.ImageRectOffset = Vector2.new(0, 0)
iconImage.ImageRectSize = Vector2.new(0, 0)
iconImage.ImageTransparency = 0
iconImage.LayoutOrder = 0
iconImage.Position = UDim2.new(0, 12, 0, 15)
iconImage.Size = UDim2.new(0, 24, 0, 24)
iconImage.SizeConstraint = Enum.SizeConstraint.RelativeXY
iconImage.TileSize = UDim2.new(1, 0, 1, 0)
iconImage.SliceScale = 1
iconImage.ZIndex = 11

local iconLabel = Instance.new("TextLabel")
iconLabel.Name = "IconLabel"
iconLabel.Parent = iconButton
iconLabel.AnchorPoint = Vector2.new(0, 0.5)
iconLabel.BackgroundTransparency = 1
iconLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
iconLabel.BorderSizePixel = 1
iconLabel.Font = Enum.Font.GothamMedium
iconLabel.LayoutOrder = 0
iconLabel.Text = "Hacker(Saitama)"
iconLabel.TextColor3 = Color3.fromRGB(100, 0, 0)
iconLabel.TextSize = 14
iconLabel.TextScaled = false
iconLabel.TextTransparency = 0
iconLabel.TextWrapped = false
iconLabel.TextXAlignment = Enum.TextXAlignment.Left
iconLabel.TextYAlignment = Enum.TextYAlignment.Center
iconLabel.Position = UDim2.new(0, 44, 0, 15)
iconLabel.Size = UDim2.new(1, -56, 0, 7)
iconLabel.TextStrokeTransparency = 1
iconLabel.ZIndex = 11

local function onErrorNotification()
    game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIFICATION";
        Text = "YOU'RE ALREADY PLAYING AS THIS CHARACTER.";
        Icon = "";
        Duration = 5;
    })
end

local function handleIconButtonClick()
    --code here fr
game.StarterGui:SetCore("SendNotification", {
Title = "NOTIFACATION";
Text = "Character based on Combat's God";
Duration = 5;
})

-- Tool creation
local tool = Instance.new("Tool")
tool.Name = "Light Fist"
tool.RequiresHandle = false
tool.Parent = game.Players.LocalPlayer.Backpack

-- Function to add the neon parts and affect health
local function onEquipped()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Create the red neon parts for both arms
    local function createArmPart(side)
        local armPart = Instance.new("Part")
        armPart.Name = side.." Arm Cover"
        armPart.Size = Vector3.new(1.1, 2.1, 1.1) -- Adjust size as needed
        armPart.Anchored = false
        armPart.CanCollide = false
        armPart.BrickColor = BrickColor.new("Bright brown")
        armPart.Material = Enum.Material.Neon
        armPart.Transparency = 0.5
        armPart.Parent = character

        -- Get the arm's position and orientation
        local arm = character[side.." Arm"]
        local armCFrame = arm.CFrame
        local armLookVector = armCFrame.LookVector -- Direction the arm is facing

        -- Position the arm part in front of the arm, adjusting based on arm orientation
        armPart.Position = armCFrame.Position + armLookVector * 0 -- 1.5 can be adjusted for the distance
        armPart.CFrame = CFrame.new(armPart.Position, armPart.Position + armLookVector) -- Face the same direction as the arm

        -- Attach the part to the arm
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = arm
        weld.Part1 = armPart
        weld.Parent = armPart

        -- Fade out the arm part after 5 seconds
        game:GetService("TweenService"):Create(
            armPart,
            TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Transparency = 1}
        ):Play()

        -- Destroy the arm part after the fade
        game:GetService("Debris"):AddItem(armPart, 5)
    end

    -- Add parts for both left and right arms
    createArmPart("Right")
    createArmPart("Left")

    -- Reduce health by 2
    humanoid.Health = humanoid.Health - 2

    -- Create the cooldown TextLabel
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Size = UDim2.new(0, 200, 0, 50)  -- Size the label
    textLabel.Position = UDim2.new(0, 10, 0.5, -25)  -- Position it to the left of the camera
    textLabel.Text = ""
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red text
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.Arcade -- Use Arcade-like font
    textLabel.BackgroundTransparency = 1

    -- Wait for 5 seconds before allowing the tool to be used again
    wait(5)
    textLabel.Text = ""  -- Update the text after cooldown
    humanoid.Health = humanoid.Health + 1
    wait(2)
    humanoid.Health = humanoid.Health + 1

    -- Remove the cooldown TextLabel
    game:GetService("Debris"):AddItem(screenGui, 1)
end

tool.Equipped:Connect(onEquipped)

-- Adrenaline Boost Tool Script
local tool = Instance.new("Tool")
tool.Name = "Adrenaline Boost(NOT WORKED)"
tool.RequiresHandle = true
tool.Parent = game.Players.LocalPlayer.Backpack

-- Function to activate the tool
local function onActivated()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Create a BodyVelocity object to apply forward movement
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)  -- Set a high force to make it move
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Start with zero velocity
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    
    -- Function to update BodyVelocity based on the player's movement
    local function updateVelocity()
        while true do
            -- If the player is moving
            if humanoid.MoveDirection.Magnitude > 0 then
                -- Set the velocity based on the direction the player is moving with speed 56
                bodyVelocity.Velocity = humanoid.MoveDirection * 222
            else
                -- Stop the velocity if the player is not moving
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
            wait(0.1)  -- Update every 0.1 seconds
        end
    end

    -- Start updating the velocity
    updateVelocity()

    -- Wait for 10 seconds and then remove the BodyVelocity
    wait(10)
    bodyVelocity:Destroy()
end

tool.Activated:Connect(onActivated)
local LocalPlayer = game.Players.LocalPlayer

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("6").Base.Reuse.Visible = true

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("6").Base.Reuse.Text = "Speed Boost"

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("6").Base.Reuse.Reuse.Text = "Speed Boost"

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("5").Base.Reuse.Visible = true

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("5").Base.Reuse.Text = "Causes A Bit Damage"

LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("5").Base.Reuse.Reuse.Text = "Causes A Bit Damage"

-- // VERIFIED FROM SEABLUE \\ --
-- \\ VERIFIED FROM SEABLUE // --

--[[Move And Ultimate Names]]

--[[Created By Uzi Also I Used STemplate Too, Thank You For Reading]]

local move1 = "The Power Of Punch"

local move2 = "Barrage"

local move3 = "Rest Of The Meeting"

local move4 = "Soon"

local ultimate = "Rest Warrior You Fight Is Over"

--[[ONLY SAITAMA]]

local ult1 = "Stoic Bomb"

local ult2 = "Unlimited Flex Works"

local ult3 = "Five Seasons"

local ult4 = "20-20-20 Dropkick"

--[[Animations]]

--[[Move 1]]

local animationId = 10468665991 --[[The Fricking Id That Will Get The Track]]


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end

local s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://16945691441"
s.Volume = 5
s.PlaybackSpeed = 5
s.TimePosition = 4.7
s:Play()
local s1 = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s1.SoundId = "rbxassetid://16945593216"
s1.Volume = 5
s1.PlaybackSpeed = 1
s1.TimePosition = 4.7
s1:Play()

local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://18897120868" --[[Find an Id Is Somewhere Idk What's Going On In My Life]]

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0.9--[[The Start Time Bitc]]


Anim:Play()

Anim:AdjustSpeed(1) --[[DOES LITERALLY NOTHING]]

Anim.TimePosition = startTime



    end

end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[END OF MOVE 1 ANIM]]

--[[Move 2]]



local animationId = 10466974800 --[[The Fricking Id That Will Get The Track]]


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end

local s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://16945691441"
s.Volume = 5
s.PlaybackSpeed = 1
s.TimePosition = 0
s:Play()
local s1 = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s1.SoundId = "rbxassetid://16945593216"
s1.Volume = 5
s1.PlaybackSpeed = 1
s1.TimePosition = 0
s1:Play()

local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://16945550029" --[[Find an Id Is Somewhere Idk What's Going On In My Life]]

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 1 --[[The Start Time Bitc]]


Anim:Play()

Anim:AdjustSpeed(0) --[[DOES LITERALLY NOTHING]]

Anim.TimePosition = startTime

Anim:AdjustSpeed(1.8) --[[Speed Yeah Yeah.]]
wait(1.7)
Anim:Stop()
wait(1)
s1:Stop()
s:Stop()


    end

end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[END OF MOVE 2 ANIM]]

--[[Move 3]]



local animationId = 10471336737 --[[The Fricking Id That Will Get The Track]]


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then


local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end

local s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://16944636115"
s.Volume = 5
s.PlaybackSpeed = 1
s.TimePosition = 0
s:Play()

local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://16944265635" --[[Find an Id Is Somewhere Idk What's Going On In My Life]]

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 --[[The Start Time Bitc]]


Anim:Play()

Anim:AdjustSpeed(0) --[[DOES LITERALLY NOTHING]]

Anim.TimePosition = startTime

Anim:AdjustSpeed(1) --[[Speed Yeah Yeah.]]
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(5) -- Emit 20 particles
        end
    end
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(5) -- Emit 20 particles
        end
    end
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(5) -- Emit 20 particles
        end
    end
local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end

local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end

wait(0.3)
local s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://16944654440"
s.Volume = 5
s.PlaybackSpeed = 1
s.TimePosition = 0
s:Play()
local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://18435383478" --[[Find an Id Is Somewhere Idk What's Going On In My Life]]

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 --[[The Start Time Bitc]]


Anim:Play()

Anim:AdjustSpeed(0) --[[DOES LITERALLY NOTHING]]

Anim.TimePosition = startTime

Anim:AdjustSpeed(1) --[[Speed Yeah Yeah.]]
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(8) -- Emit 20 particles
        end
    end
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(5) -- Emit 20 particles
        end
    end
local boom1 = game.ReplicatedStorage.Resources.KJEffects["LegSweepHit"].Hit:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(5) -- Emit 20 particles
        end
    end
local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end

local hit1 = game.ReplicatedStorage.Resources.KJEffects["lastkick"].Attachment:Clone()
hit1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end


    end

end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[END OF MOVE 3 ANIMATION]]

--[[Move 4]]


local animationId = 12510170988

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onAnimationPlayed(animationTrack)
if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
for _, animTrack in pairs(humanoid:GetPlayingAnimationTracks()) do
animTrack:Stop()
end
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
local s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://17325303798"
s.Volume = 5
s.PlaybackSpeed = 1.8
s.TimePosition = 0
s:Play()
local newAnimation = Instance.new("Animation")
newAnimation.AnimationId = "rbxassetid://17325254223"
local newAnimTrack = humanoid:LoadAnimation(newAnimation)
local startTime = 0
newAnimTrack:Play()
newAnimTrack:AdjustSpeed(0)
newAnimTrack.TimePosition = startTime
newAnimTrack:AdjustSpeed(1.8)
local boom1 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningpartysmoke:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(3) -- Emit 20 particles
        end
    end
local collateral1 = game.ReplicatedStorage.Resources.KJEffects["spinnyweenyspinner"].Attachment:Clone()
collateral1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral2 = game.ReplicatedStorage.Resources.KJEffects["spinnyweenyspinner"].Emit:Clone()
collateral2.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral3 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningparty:Clone()
collateral3.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral4 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningpartysmoke:Clone()
collateral4.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end


wait(0.5)


local player = game.Players.LocalPlayer
local playerCharacter = player.Character or player.CharacterAdded:Wait()

local replicatedStorage = game:GetService("ReplicatedStorage")
local resourcesFolder = replicatedStorage:WaitForChild("Resources")
local kjEffectsFolder = resourcesFolder:WaitForChild("KJEffects")
local thingNearOne = kjEffectsFolder:WaitForChild("SpinnerDownMesh")
local mesh = thingNearOne:WaitForChild("Mesh")

if mesh then
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1  -- Set the part's transparency
    part.Parent = game.Workspace

    local meshClone = mesh:Clone()
    meshClone.Parent = part

    local decal = Instance.new("Decal")
    decal.Texture = "rbxassetid://9572542664"
    decal.Face = Enum.NormalId.Front
    decal.Parent = part

    local humanoidRootPart = playerCharacter:WaitForChild("HumanoidRootPart")
    local offset = Vector3.new(0, 5, 0)
    part.CFrame = CFrame.new(humanoidRootPart.Position + offset) * CFrame.Angles(math.rad(-2000), 0, 190)

    wait(0.3)
    part:Destroy()
else
    warn("Mesh not found inside thingNearOne.")
end


local boom1 = game.ReplicatedStorage.Resources.KJEffects["SpinningSmoke"].Smoke:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(60) -- Emit 20 particles
        end
    end
local leap1 = game.ReplicatedStorage.Resources.KJEffects["LeapParticles"].Leap:Clone()
leap1.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(leap1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local collateral1 = game.ReplicatedStorage.Resources.KJEffects["spinnyweenyspinner"].Attachment:Clone()
collateral1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral2 = game.ReplicatedStorage.Resources.KJEffects["spinnyweenyspinner"].Emit:Clone()
collateral2.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral3 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningparty:Clone()
collateral3.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral4 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningpartysmoke:Clone()
collateral4.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral5 = game.ReplicatedStorage.Resources.KJEffects["spinbeam"].beam2:Clone()
collateral5.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral5:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral6 = game.ReplicatedStorage.Resources.KJEffects["ColateralImapct"].HitTwo:Clone()
collateral6.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral6:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral7 = game.ReplicatedStorage.Resources.KJEffects["ColateralImapctTest"].HitTwo:Clone()
collateral7.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral7:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local collateral8 = game.ReplicatedStorage.Resources.KJEffects["ColateralImapctTest2"].HitTwo:Clone()
collateral8.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(collateral8:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(2) -- Emit 20 particles
        end
    end
local fine3 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch2:Clone()
fine3.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(fine3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local boom1 = game.ReplicatedStorage.Resources.KJEffects["ImpactEffect2"].Attachment:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(3) -- Emit 20 particles
        end
    end

local boom1 = game.ReplicatedStorage.Resources.KJEffects["SpinningSmoke"].Smoke:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(20) -- Emit 20 particles
        end
    end

local boom1 = game.ReplicatedStorage.Resources.KJEffects["spinnerthing"].spinningpartysmoke:Clone()
boom1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]
    for _, child in ipairs(boom1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(3) -- Emit 20 particles
        end
    end
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[END OF MOVE 4 ANIM]]

--[[Ultimate Animations]]

loadstring(game:HttpGet("https://pastebin.com/raw/gthQ0iZQ"))()

--[[Wall combo]]


local animationId = 15955393872 --[[The Fricking Id That Will Get The Track]]


local player = game.Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")


local function onAnimationPlayed(animationTrack)

    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then

local p = game.Players.LocalPlayer

local Humanoid = p.Character:WaitForChild("Humanoid")


for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do

    animTrack:Stop()

end


local AnimAnim = Instance.new("Animation")

AnimAnim.AnimationId = "rbxassetid://140164642047188" --[[Find an Id Is Somewhere Idk What's Going On In My Life]]

local Anim = Humanoid:LoadAnimation(AnimAnim)


local startTime = 0 --[[The Start Time Bitc]]


Anim:Play()

Anim:AdjustSpeed(0) --[[DOES LITERALLY NOTHING]]

Anim.TimePosition = startTime

Anim:AdjustSpeed(1.8) --[[Speed Yeah Yeah.]]
wait(0.0033)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local ImpactFrames = Instance.new("Folder")
    ImpactFrames.Name = "ImpactFrames"
    ImpactFrames.Parent = ScreenGui
    
    local imageIds = {
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0",
        "rbxassetid://0"
    }
    
    for i = 1, 73 do
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Size = UDim2.new(0.005, 0, 0, 0)
        ImageLabel.Position = UDim2.new(0, 0, 0, 0)
        ImageLabel.ImageTransparency = 0
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Visible = true
        ImageLabel.Parent = ImpactFrames
        if imageIds[i] then
            ImageLabel.Image = imageIds[i]
        end
        task.wait()
    end
    
    for i = 1, 73 do
        ImpactFrames:GetChildren()[i].Size = UDim2.new(1, 0, 1, 100)
        ImpactFrames:GetChildren()[i].Position = UDim2.new(0, 0, 0, -100)
        task.wait(0.010)
        ImpactFrames:GetChildren()[i].ImageTransparency = 1
    end
    
    ScreenGui:Destroy()


    end

end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[END OF WALL COMBO ANIM]]

--[[M1's]]
local animations = {
    {originalID = "10469493270", newID = "17325510002", speed = 1.0},
    {originalID = "10469630950", newID = "17325513870", speed = 1.0},
    {originalID = "10469639222", newID = "17325522388", speed = 1.0},
    {originalID = "10469643643", newID = "17325537719", speed = 1.0},
}

local isReplacing = false -- Guard variable

local function replaceAnimations(humanoid)
    if isReplacing then return end -- Prevent recursion
    isReplacing = true

    for _, animData in ipairs(animations) do
        local animationTracks = humanoid:GetPlayingAnimationTracks()
        for _, track in ipairs(animationTracks) do
            if track.Animation.AnimationId == "rbxassetid://" .. animData.originalID then
                track:Stop()
                local newAnimation = Instance.new("Animation")
                newAnimation.AnimationId = "rbxassetid://" .. animData.newID
                local newTrack = humanoid:LoadAnimation(newAnimation)
                newTrack:Play()
                newTrack:AdjustSpeed(animData.speed)
            end
        end
    end

    isReplacing = false
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.AnimationPlayed:Connect(function()
    replaceAnimations(humanoid)
end)

--[[Ultimate]]


local animationId = 12447707844

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onAnimationPlayed(animationTrack)
if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId then
for _, animTrack in pairs(humanoid:GetPlayingAnimationTracks()) do
animTrack:Stop()
end
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
local player = game.Players.LocalPlayer
repeat wait() until player.Character.Humanoid
local humanoid = player.Character.Humanoid
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")

local soundeffect = Instance.new("Sound")
soundeffect.SoundId = "rbxassetid://17150550559"
soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
soundeffect:Play()
soundeffect.Volume = 3

local soundeffect = Instance.new("Sound")
soundeffect.SoundId = "rbxassetid://17150550302"
soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
soundeffect:Play()
soundeffect.Volume = 5

local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://78521642007560"

local playAnim = humanoid:LoadAnimation(anim)
anim.AnimationId = "rbxassetid://0"
playAnim:Play()

local fine = game.ReplicatedStorage.Resources.KJEffects["fine...1"].EnableBatch2:Clone()
fine.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(fine:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local fine3 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit"].EmitBatch3:Clone()
fine3.Parent = game.Players.LocalPlayer.Character["Torso"]
    for _, child in ipairs(fine3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD1:Clone()
red.Parent = game.Players.LocalPlayer.Character["Right Leg"]
    for _, child in ipairs(red:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red2 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD2:Clone()
red2.Parent = game.Players.LocalPlayer.Character["Left Leg"]
    for _, child in ipairs(red2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red3 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD3:Clone()
red3.Parent = game.Players.LocalPlayer.Character["Left Leg"]
    for _, child in ipairs(red3:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local red4 = game.ReplicatedStorage.Resources.KJEffects["fine...1"].REDDDD4:Clone()
red4.Parent = game.Players.LocalPlayer.Character["Right Leg"]
    for _, child in ipairs(red4:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
local Text = " "

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(2)
local Text = "Rest"

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(1.7)
local Text = "Warrior"

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(2)
local Text = "You Fight Is Over"

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(1.3)
local Text = "And Next Time You Wont Be So Lucky."

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 17, 17))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = true,
        Italic = true,
        Shake = {
            Enabled = true,
            Intensity = 5,
            Lifetime = 1
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(1.3)
fine:Destroy()
red:Destroy()
red2:Destroy()
red3:Destroy()
red4:Destroy()
local fine2 = game.ReplicatedStorage.Resources.KJEffects["fine...Emit2"].EmitBatch1:Clone()
fine2.Parent = game.Players.LocalPlayer.Character["Right Arm"]
    for _, child in ipairs(fine2:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(1) -- Emit 20 particles
        end
    end
wait(1.7)
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

--[[Extra]]

player.CharacterAdded:Connect(function(newCharacter)

    character = newCharacter

    humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    character.DescendantAdded:Connect(onBodyVelocityAdded)

   

    for _, descendant in pairs(character:GetDescendants()) do

        onBodyVelocityAdded(descendant)

    end

end)

wait(1)

--[[Ignore]]

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("1").Base

local ToolName = baseButton.ToolName


ToolName.Text = move1


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName


ToolName.Text = move2


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("3").Base

local ToolName = baseButton.ToolName


ToolName.Text = move3


local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("4").Base

local ToolName = baseButton.ToolName


ToolName.Text = move4


local Players = game:GetService("Players")

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")


local function findGuiAndSetText()

    local screenGui = playerGui:FindFirstChild("ScreenGui")

    if screenGui then

        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")

        if magicHealthFrame then

            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")

            if textLabel then

                textLabel.Text = ultimate

            end

        end

    end

end

playerGui.DescendantAdded:Connect(findGuiAndSetText)

findGuiAndSetText()

local Text = " "

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.06
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
local Animation = 17325160621
local StartTime = 0 -- what duration it starts like video
local Duration = 999 -- how much till the animation stops

local a = Instance.new("Animation")
a.AnimationId = "rbxassetid://" .. Animation
local p = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(a)
p:Play()
p.TimePosition = StartTime -- what duration it starts like video
p:AdjustSpeed(1)
task.delay(Duration, function() -- use task.delay instead of delay
    p:Stop()
end)

s = Instance.new("Sound", game.Players.LocalPlayer.Character.HumanoidRootPart)
s.SoundId = "rbxassetid://17325174223"
s:Play()
s.Volume = 5
s.PlaybackSpeed = 1

-- Create the phone parts
local phone

local function createPhone()
    phone = Instance.new("Model")
    phone.Name = "Phone"

    -- Create the top half of the phone
    local topHalf = Instance.new("Part")
    topHalf.Size = Vector3.new(1, 0.1, 1)
    topHalf.BrickColor = BrickColor.new("Dark stone grey")
    topHalf.Anchored = false
    topHalf.CanCollide = true
    topHalf.Material = Enum.Material.SmoothPlastic  -- Set to SmoothPlastic
    topHalf.Name = "TopHalf"
    topHalf.Parent = phone

    -- Create the bottom half of the phone
    local bottomHalf = Instance.new("Part")
    bottomHalf.Size = Vector3.new(1, 0.1, 1)
    bottomHalf.BrickColor = BrickColor.new("Dark stone grey")
    bottomHalf.Anchored = false
    bottomHalf.CanCollide = true
    bottomHalf.Material = Enum.Material.SmoothPlastic  -- Set to SmoothPlastic
    bottomHalf.Name = "BottomHalf"
    bottomHalf.Parent = phone

    -- Create text under the top half
    local topText = Instance.new("TextLabel")
    topText.Text = "Phone 2.0"
    topText.Size = UDim2.new(0, 100, 0, 50)
    topText.Position = UDim2.new(0.5, -50, 1, 0)
    topText.TextColor3 = Color3.fromRGB(255, 255, 255)
    topText.BackgroundTransparency = 1
    topText.Parent = topHalf

    -- Create text under the bottom half
    local bottomText = Instance.new("TextLabel")
    bottomText.Text = "Phone 2.0"
    bottomText.Size = UDim2.new(0, 100, 0, 50)
    bottomText.Position = UDim2.new(0.5, -50, 1, 0)
    bottomText.TextColor3 = Color3.fromRGB(255, 255, 255)
    bottomText.BackgroundTransparency = 1
    bottomText.Parent = bottomHalf

    -- Position the parts relative to each other
    topHalf.CFrame = CFrame.new(0, 0.1, 0) -- Position slightly above the bottom half
    bottomHalf.CFrame = CFrame.new(0, -0.1, 0) -- Slightly below topHalf

    return phone, topHalf, bottomHalf
end

-- Function to attach and drop the phone
local function attachPhone(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local rightArm = character:FindFirstChild("Right Arm")

    if rightArm then

        -- Create and prepare the phone
        local phone, topHalf, bottomHalf = createPhone()

        -- Parent the phone model to workspace for visibility
        phone.Parent = workspace

        -- Attach the phone parts to the right arm
        local weld1 = Instance.new("Weld")
        weld1.Part0 = rightArm
        weld1.Part1 = topHalf
        weld1.C0 = CFrame.new(0, -1, -0.5) -- Attach the top half slightly below the right arm
        weld1.Parent = topHalf

        local weld2 = Instance.new("Weld")
        weld2.Part0 = rightArm
        weld2.Part1 = bottomHalf
        weld2.C0 = CFrame.new(0, -1, 0.5) -- Attach the bottom half below the top half
        weld2.Parent = bottomHalf

        -- Wait for 1 second
        wait(1.3)

        -- Simulate dropping the phone
        weld1:Destroy()
        weld2:Destroy()

        -- Add a downward velocity to simulate a drop
        local dropForce = Vector3.new(0, 20, 50)
        topHalf.Velocity = dropForce
        bottomHalf.Velocity = dropForce
    else
        print("Right arm not found!") -- Debugging message
    end
end

-- Call the function to attach the phone
attachPhone(game.Players.LocalPlayer)  -- Test the function for the local player

local Text = "This Phone Is Useless Anyway"

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.1
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)

wait(1)

local Text = "Is Time Who Weak or Strong."

-- don't change anything here unless you know
local v22808 = require(game.ReplicatedStorage.Resources.UFW.TekrinnDialogue)
local v22811 = {
    {
        Text = Text,
        Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 17, 17)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            }),
        TextStrokeColor = Color3.new(0, 0, 0),
        Bold = false,
        Italic = false,
        Shake = {
            Enabled = false,
            Intensity = 1,
            Lifetime = 2
        },
        TypeSpeed = 0.09
    }
}
v22808.Speak(game.Players.LocalPlayer.Character, v22811)
wait(5)

-- Now destroy the phone after 5 seconds
if phone then
    phone:Destroy()
end
    local character = player.Character
    if not character then
        return
    end

    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun and scriptHasRun.Value then
        onErrorNotification()
        return
    end

    if not scriptHasRun then
        scriptHasRun = Instance.new("BoolValue")
        scriptHasRun.Name = "ScriptHasRun"
        scriptHasRun.Value = true
        scriptHasRun.Parent = character
    else
        scriptHasRun.Value = true
    end
end

iconButton.MouseButton1Click:Connect(handleIconButtonClick)

print("Script Loaded 0 cap")  -- Debug print to confirm script initialization

player.CharacterAdded:Connect(function(character)
    local scriptHasRun = character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end)

if player.Character then
    local scriptHasRun = player.Character:FindFirstChild("ScriptHasRun")
    if scriptHasRun then
        scriptHasRun.Value = false
    end
end

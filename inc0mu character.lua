local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Função para exibir uma mensagem na tela (menor)
local function showMessage(message, position)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0.4, 0, 0.05, 0) -- Tamanho menor
    textLabel.Position = position or UDim2.new(0.3, 0, 0.9, 0) -- Posição na parte inferior por padrão
    textLabel.Text = message
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    textLabel.BackgroundTransparency = 0.5
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Parent = screenGui

    -- Remover a mensagem após 5 segundos
    task.delay(5, function()
        screenGui:Destroy()
    end)
end

-- Função para verificar se o personagem é Shedletsky
local function checkShedletsky()
    local characterName = player.Character.Name
    if characterName ~= "Shedletsky" then
        showMessage("Oops, your current character isn't Guest1337. This script may not work correctly!", UDim2.new(0.3, 0, 0.5, 0))
        return false
    end
    return true
end

-- Função para remover itens específicos do personagem
local function removeSpecificItems()
    local itemsToRemove = {"EpicFace"}
    for _, itemName in ipairs(itemsToRemove) do
        local item = character:FindFirstChild(itemName)
        if item then
            item:Destroy()
        end
    end
end

-- Função para personalizar o personagem Guest1337
local function reskinShedletsky()
    if not checkShedletsky() then return end -- Verifica o personagem antes de continuar

    character = player.Character or player.CharacterAdded:Wait()

    -- Remover tudo do personagem antes de modificar
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Clothing") or item:IsA("ShirtGraphic") or item:IsA("Accessory") or item:IsA("BodyColors") or item:IsA("CharacterMesh") then
            item:Destroy()
        end
    end

    -- Remover itens específicos
    removeSpecificItems()

    -- Aplicar novas roupas
    local shirt = Instance.new("Shirt")
    shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=15367723134"
    shirt.Parent = character

    local pants = Instance.new("Pants")
    pants.PantsTemplate = "http://www.roblox.com/asset/?id=15367726386"
    pants.Parent = character

    -- Função para criar acessórios corretamente e fixá-los ao personagem
    local function addAccessory(name, meshId, textureId, parentPart, position, rotation, customWeldC0, customWeldC1)
        local accessory = Instance.new("Accessory")
        accessory.Name = name

        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.CanCollide = false
        handle.Anchored = false
        handle.Parent = accessory

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = meshId
        if textureId ~= "" then
            mesh.TextureId = textureId
        end
        mesh.Parent = handle

        local weld = Instance.new("Weld")
        weld.Part0 = handle
        weld.Part1 = character:FindFirstChild(parentPart)

        if customWeldC0 and customWeldC1 then
            weld.C0 = CFrame.new(unpack(customWeldC0))
            weld.C1 = CFrame.new(unpack(customWeldC1))
        else
            weld.C0 = CFrame.new(unpack(position)) * CFrame.Angles(math.rad(rotation[1]), math.rad(rotation[2]), math.rad(rotation[3]))
        end

        weld.Parent = handle
        accessory.Parent = character
    end

    -- Adicionar acessórios do Shedletsky
    addAccessory("bottomstacheAccessory", "rbxassetid://116013075029742", "rbxassetid://9881239897", "Head", 
        {0.000290870637, 0.439208955, 0.0450318456}, {0, 180, 0}, 
        {0.000290870637, 0.439208955, 0.0450318456, -1, 0, 0, 0, 1, 0, 0, 0, -1},
        {0, 0, -0.600000024, 1, 0, 0, 0, 1, 0, 0, 0, 1})

    addAccessory("DarkBlueDominus", "http://www.roblox.com/asset/?id=116013075029742", "http://www.roblox.com/asset/?id=451217406", "Head", 
        {8.65838956e-09, 0.150000095, -0.000272244215}, {0, 0, 0}, 
        {8.65838956e-09, 0.150000095, -0.000272244215, 1, 0, 0, 0, 1, 0, 0, 0, 1},
        {0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1})

    addAccessory("Classic Shirt", "rbxassetid://17606193368", "rbxassetid://15162947651", "Torso", 
        {0, 0.0070066452, -0.0800002217}, {0, 0, 0}, 
        {0, 0.0070066452, -0.0800002217, 1, 0, 0, 0, 1, 0, 0, 0, 1},
        {0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1})
end

-- Função para modificar o ExpressionHolder
local function modifyExpressionHolder()
    local expressionHolder = character:FindFirstChild("ExpressionHolder")
    if expressionHolder then
        local expression = expressionHolder:FindFirstChild("Expression")
        if expression then
            expression.Texture = "rbxassetid://139225455829885"
        end
    end
end

-- Função para substituir os arquivos no ReplicatedStorage
local function replaceShedletskyConfig()
    local ReplicatedStorage = game:GetService("ReplicatedStorage") 
    local Assets = ReplicatedStorage:WaitForChild("Assets") 
    local Skins = Assets:WaitForChild("Skins") 
    local Survivors = Skins:WaitForChild("Survivors") 
    local Shedletsky = Survivors:WaitForChild("Shedletsky") 
    
    local Incomu = Shedletsky:WaitForChild("Incomu") 
    local ModernShed = Shedletsky:WaitForChild("ModernShed") 
    
    local IncomuBehavior = Incomu:WaitForChild("Behavior") 
    local IncomuConfig = Incomu:WaitForChild("Config") 
    local ModernConfig = ModernShed:FindFirstChild("Config") 
    
    if ModernConfig then 
        ModernConfig:Destroy() 
    end
    
    local newBehavior = IncomuBehavior:Clone() 
    newBehavior.Parent = ModernShed
    
    local newConfig = IncomuConfig:Clone() 
    newConfig.Parent = ModernShed
end

-- Animação replacement script
local function setupAnimationReplacement()
    local Humanoid = character:WaitForChild("Humanoid")
    local temporaryAccessories = {}

    -- Função para adicionar acessórios temporários
    local function addTemporaryAccessories()
        -- Acessório 1
        local accessory1 = Instance.new("Accessory")
        accessory1.Name = "Handle1Accessory"
        
        local handle1 = Instance.new("Part")
        handle1.Name = "Handle"
        handle1.Size = Vector3.new(1, 1, 1)
        handle1.CanCollide = false
        handle1.Anchored = false
        handle1.Parent = accessory1

        local mesh1 = Instance.new("SpecialMesh")
        mesh1.MeshId = "rbxassetid://18311451417"
        mesh1.TextureId = "rbxassetid://18311451404"
        mesh1.Parent = handle1

        local weld1 = Instance.new("Weld")
        weld1.Part0 = handle1
        weld1.Part1 = character:FindFirstChild("Torso")
        weld1.C0 = CFrame.new(0.0126914978, -0.996208668, 0.266090393, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld1.C1 = CFrame.new(0, 0, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld1.Parent = handle1
        
        accessory1.Parent = character
        table.insert(temporaryAccessories, accessory1)

        -- Acessório 2
        local accessory2 = Instance.new("Accessory")
        accessory2.Name = "defaultAccessory"
        
        local handle2 = Instance.new("Part")
        handle2.Name = "Handle"
        handle2.Size = Vector3.new(1, 1, 1)
        handle2.CanCollide = false
        handle2.Anchored = false
        handle2.Parent = accessory2

        local mesh2 = Instance.new("SpecialMesh")
        mesh2.MeshId = "rbxassetid://15307041694"
        mesh2.TextureId = "rbxassetid://15304805258"
        mesh2.Parent = handle2

        local weld2 = Instance.new("Weld")
        weld2.Part0 = handle2
        weld2.Part1 = character:FindFirstChild("Head")
        weld2.C0 = CFrame.new(-0.0134687414, -0.721691132, 0.061955452, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld2.C1 = CFrame.new(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld2.Parent = handle2
        
        accessory2.Parent = character
        table.insert(temporaryAccessories, accessory2)

        -- Acessório 3
        local accessory3 = Instance.new("Accessory")
        accessory3.Name = "yuji rage headAccessory"
        
        local handle3 = Instance.new("Part")
        handle3.Name = "Handle"
        handle3.Size = Vector3.new(1, 1, 1)
        handle3.CanCollide = false
        handle3.Anchored = false
        handle3.Parent = accessory3

        local mesh3 = Instance.new("SpecialMesh")
        mesh3.MeshId = "rbxassetid://15120527457"
        mesh3.TextureId = "rbxassetid://15381228367"
        mesh3.Parent = handle3

        local weld3 = Instance.new("Weld")
        weld3.Part0 = handle3
        weld3.Part1 = character:FindFirstChild("Head")
        weld3.C0 = CFrame.new(-0.000453472137, -8.91685486e-05, 3.43322754e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld3.C1 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        weld3.Parent = handle3
        
        accessory3.Parent = character
        table.insert(temporaryAccessories, accessory3)
    end

    -- Função para remover acessórios temporários
    local function removeTemporaryAccessories()
        for _, accessory in ipairs(temporaryAccessories) do
            if accessory and accessory.Parent then
                accessory:Destroy()
            end
        end
        temporaryAccessories = {}
    end

    -- Função para substituir a animação
    local function replaceAnimation(oldId, newId)
        -- Verifica se o Humanoid existe
        if not Humanoid then
            warn("Humanoid não encontrado!")
            return
        end

        -- Obtém o Animator do Humanoid
        local Animator = Humanoid:FindFirstChildOfClass("Animator")
        if not Animator then
            warn("Animator não encontrado!")
            return
        end

        -- Itera sobre todas as animações carregadas no Animator
        for _, track in pairs(Animator:GetPlayingAnimationTracks()) do
            -- Verifica se a animação atual corresponde ao ID antigo
            if track.Animation and track.Animation.AnimationId == oldId then
                -- Adiciona os acessórios temporários
                addTemporaryAccessories()
                
                -- Cria uma nova animação com o ID novo
                local newAnimation = Instance.new("Animation")
                newAnimation.AnimationId = newId

                -- Substitui a animação antiga pela nova
                local newTrack = Animator:LoadAnimation(newAnimation)
                newTrack:Play()

                -- Para a animação antiga
                track:Stop()

                -- Conecta o evento para remover os acessórios quando a animação terminar
                newTrack.Stopped:Connect(removeTemporaryAccessories)
                
                break
            end
        end
    end

    -- IDs das animações
    local OLD_ANIMATION_ID = "rbxassetid://131257799030455"
    local NEW_ANIMATION_ID = "rbxassetid://131257799030455"

    -- Substitui a animação em um loop constante
    while true do
        replaceAnimation(OLD_ANIMATION_ID, NEW_ANIMATION_ID)
        task.wait(0.1) -- Verifica a cada 0.1 segundos
    end
end

-- Função para verificar o personagem e ativar o script
local function checkAndActivate()
    showMessage("Espere a nova partida e use o personagem Guest1337.", UDim2.new(0.3, 0, 0.5, 0)) -- Mensagem centralizada

    -- Executa imediatamente as modificações no ReplicatedStorage
    replaceShedletskyConfig()

    player.CharacterAdded:Connect(function()
        if player.Character.Name == "Shedletsky" then
            reskinShedletsky()
            modifyExpressionHolder()
            setupAnimationReplacement()
            showMessage("Shedletsky Inc0mu You Need Shed For this credit to Gustavosantt", UDim2.new(0.8, 0, 0.1, 0)) -- Mensagem no canto superior direito
        else
            local characterName = player.Character.Name
            showMessage("Você está usando o " .. characterName .. " em vez de Guest1337!", UDim2.new(0.3, 0, 0.5, 0))
        end
    end)
end

-- Executar automaticamente ao rodar o script
checkAndActivate()

-- Создание основного меню координат
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CoordinatesGUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "CoordinatesFrame"
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.05, 0, 0.05, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "Your Coordinates"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true
titleLabel.Parent = frame

local coordinatesLabel = Instance.new("TextLabel")
coordinatesLabel.Name = "CoordinatesLabel"
coordinatesLabel.Size = UDim2.new(1, 0, 0, 60)
coordinatesLabel.Position = UDim2.new(0, 0, 0, 20)
coordinatesLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
coordinatesLabel.TextColor3 = Color3.new(1, 1, 1)
coordinatesLabel.Text = "X: 0, Y: 0, Z: 0"
coordinatesLabel.Font = Enum.Font.SourceSans
coordinatesLabel.TextScaled = true
coordinatesLabel.TextXAlignment = Enum.TextXAlignment.Left
coordinatesLabel.TextYAlignment = Enum.TextYAlignment.Top
coordinatesLabel.Parent = frame


local addedCoordinatesScreenGui = Instance.new("ScreenGui")
addedCoordinatesScreenGui.Name = "AddedCoordinatesGUI"
addedCoordinatesScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local addedCoordinatesFrame = Instance.new("Frame")
addedCoordinatesFrame.Name = "AddedCoordinatesFrame"
addedCoordinatesFrame.Size = UDim2.new(0, 250, 0, 300) 
addedCoordinatesFrame.Position = UDim2.new(0.3, 0, 0.05, 0)
addedCoordinatesFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
addedCoordinatesFrame.Parent = addedCoordinatesScreenGui

local addedCoordinatesTitle = Instance.new("TextLabel")
addedCoordinatesTitle.Name = "AddedCoordinatesTitle"
addedCoordinatesTitle.Size = UDim2.new(1, 0, 0, 20)
addedCoordinatesTitle.Position = UDim2.new(0, 0, 0, 0)
addedCoordinatesTitle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
addedCoordinatesTitle.TextColor3 = Color3.new(1, 1, 1)
addedCoordinatesTitle.Text = "Added Coordinates"
addedCoordinatesTitle.Font = Enum.Font.SourceSansBold
addedCoordinatesTitle.TextScaled = true
addedCoordinatesTitle.Parent = addedCoordinatesFrame

local addedCoordinatesList = Instance.new("ScrollingFrame")
addedCoordinatesList.Name = "AddedCoordinatesList"
addedCoordinatesList.Size = UDim2.new(1, 0, 0.6, 0) 
addedCoordinatesList.Position = UDim2.new(0, 0, 0.1, 0)
addedCoordinatesList.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
addedCoordinatesList.CanvasSize = UDim2.new(0, 0, 0, 0)
addedCoordinatesList.ScrollBarThickness = 12
addedCoordinatesList.Parent = addedCoordinatesFrame


local listLayout = Instance.new("UIListLayout")
listLayout.Parent = addedCoordinatesList
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local coordinateEntries = {}
local entryHeight = 20
-- Кнопки
local copyButton = Instance.new("TextButton")
copyButton.Name = "CopyButton"
copyButton.Size = UDim2.new(1, 0, 0, 20)
copyButton.Position = UDim2.new(0, 0, 0.7, 0)
copyButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.Text = "Copy All"
copyButton.Font = Enum.Font.SourceSans
copyButton.TextScaled = true
copyButton.Parent = addedCoordinatesFrame

local teleportButton = Instance.new("TextButton")
teleportButton.Name = "TeleportButton"
teleportButton.Size = UDim2.new(1, 0, 0, 20)
teleportButton.Position = UDim2.new(0, 0, 0.77, 0)
teleportButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Text = "Teleport All"
teleportButton.Font = Enum.Font.SourceSans
teleportButton.TextScaled = true
teleportButton.Parent = addedCoordinatesFrame

local pasteButton = Instance.new("TextButton")
pasteButton.Name = "PasteButton"
pasteButton.Size = UDim2.new(1, 0, 0, 20)
pasteButton.Position = UDim2.new(0, 0, 0.84, 0)
pasteButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
pasteButton.TextColor3 = Color3.new(1, 1, 1)
pasteButton.Text = "Paste"
pasteButton.Font = Enum.Font.SourceSans
pasteButton.TextScaled = true
pasteButton.Parent = addedCoordinatesFrame

local clearButton = Instance.new("TextButton")
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(1, 0, 0, 20)
clearButton.Position = UDim2.new(0, 0, 0.91, 0)
clearButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
clearButton.TextColor3 = Color3.new(1, 1, 1)
clearButton.Text = "Clear"
clearButton.Font = Enum.Font.SourceSans
clearButton.TextScaled = true
clearButton.Parent = addedCoordinatesFrame


local function updateCoordinates()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local position = humanoidRootPart.Position
        coordinatesLabel.Text = string.format("X: %.1f, Y: %.1f, Z: %.1f", position.X, position.Y, position.Z)
    end
end


local function addCoordinatesToList()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local position = humanoidRootPart.Position
        local coordinateString = string.format("X: %.1f, Y: %.1f, Z: %.1f", position.X, position.Y, position.Z)

        local newEntry = Instance.new("TextLabel")
        newEntry.Size = UDim2.new(1, 0, 0, entryHeight)
        newEntry.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        newEntry.TextColor3 = Color3.new(1, 1, 1)
        newEntry.Text = coordinateString
        newEntry.Font = Enum.Font.SourceSans
        newEntry.TextScaled = true
        newEntry.Parent = addedCoordinatesList
        table.insert(coordinateEntries, newEntry)
        addedCoordinatesList.CanvasSize = UDim2.new(0, 0, 0, #coordinateEntries * entryHeight)
    end
end


local function copyAllCoordinates()
    local allCoordinatesText = ""
    for i, entry in ipairs(addedCoordinatesList:GetChildren()) do
        if entry:IsA("TextLabel") then

            local text = string.gsub(entry.Text, "^%s*(.-)%s*$", "%1")
            allCoordinatesText = allCoordinatesText .. text .. "\n"
        end
    end


    if setclipboard then
        setclipboard(allCoordinatesText)
    else
        warn("Clipboard functionality not supported.")
    end
end


local function teleportAllCoordinates()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local children = addedCoordinatesList:GetChildren()

        coroutine.wrap(function()
            for i = 2, #children do
                if children[i] and children[i]:IsA("TextLabel") then
                    local coordinateString = children[i].Text
                    local x, y, z = string.match(coordinateString, "X: (%S+), Y: (%S+), Z: (%S+)")

                    if x and y and z then
                        local position = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
                        humanoidRootPart.CFrame = CFrame.new(position)
                        wait(0.3)
                    end
                end
            end
        end)()
    end
end


local pasteMenu = Instance.new("Frame")
pasteMenu.Name = "PasteMenu"
pasteMenu.Size = UDim2.new(0.5, 0, 0.3, 0)
pasteMenu.Position = UDim2.new(0.25, 0, 0.35, 0)
pasteMenu.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
pasteMenu.Visible = false 
pasteMenu.Parent = addedCoordinatesScreenGui

local pasteTextBox = Instance.new("TextBox")
pasteTextBox.Name = "PasteTextBox"
pasteTextBox.Size = UDim2.new(0.9, 0, 0.6, 0)
pasteTextBox.Position = UDim2.new(0.05, 0, 0.1, 0)
pasteTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
pasteTextBox.TextColor3 = Color3.new(0, 0, 0)
pasteTextBox.Font = Enum.Font.SourceSans
pasteTextBox.TextScaled = true
pasteTextBox.Parent = pasteMenu

local addFromPasteButton = Instance.new("TextButton")
addFromPasteButton.Name = "AddFromPasteButton"
addFromPasteButton.Size = UDim2.new(0.4, 0, 0.2, 0)
addFromPasteButton.Position = UDim2.new(0.05, 0, 0.75, 0)
addFromPasteButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
addFromPasteButton.TextColor3 = Color3.new(1, 1, 1)
addFromPasteButton.Text = "Add"
addFromPasteButton.Font = Enum.Font.SourceSans
addFromPasteButton.TextScaled = true
addFromPasteButton.Parent = pasteMenu

local closePasteButton = Instance.new("TextButton")
closePasteButton.Name = "ClosePasteButton"
closePasteButton.Size = UDim2.new(0.4, 0, 0.2, 0)
closePasteButton.Position = UDim2.new(0.55, 0, 0.75, 0)
closePasteButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
closePasteButton.TextColor3 = Color3.new(1, 1, 1)
closePasteButton.Text = "Close"
closePasteButton.Font = Enum.Font.SourceSans
closePasteButton.TextScaled = true
closePasteButton.Parent = pasteMenu


local function pasteMenuTimer()
    wait(5)
    closePasteMenu()
end


local function closePasteMenu()
    pasteMenu.Visible = false
end


local function openPasteMenu()
    pasteMenu.Visible = true
    pasteTextBox.Text = ""
    pasteTextBox:CaptureFocus()
    coroutine.wrap(pasteMenuTimer)()
end


local function addPastedCoordinates()
    local pastedText = pasteTextBox.Text
    local coordinates = string.gmatch(pastedText, "X: (%S+), Y: (%S+), Z: (%S+)")

    for x, y, z in coordinates do
        local coordinateString = string.format("X: %s, Y: %s, Z: %s", x, y, z)
        local newEntry = Instance.new("TextLabel")
        newEntry.Size = UDim2.new(1, 0, 0, entryHeight)
        newEntry.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        newEntry.TextColor3 = Color3.new(1, 1, 1)
        newEntry.Text = coordinateString
        newEntry.Font = Enum.Font.SourceSans
        newEntry.TextScaled = true
        newEntry.Parent = addedCoordinatesList
        table.insert(coordinateEntries, newEntry)
        addedCoordinatesList.CanvasSize = UDim2.new(0, 0, 0, #coordinateEntries * entryHeight)
    end
end


local function clearCoordinates()
    for i, entry in ipairs(addedCoordinatesList:GetChildren()) do
        if entry:IsA("TextLabel") then
            entry:Destroy()
        end
    end
    coordinateEntries = {}
	addedCoordinatesList.CanvasSize = UDim2.new(0,0,0,0)
end


local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.Q then
        addCoordinatesToList()
    end
end)

-- Подключаем функции к кнопкам
copyButton.MouseButton1Click:Connect(copyAllCoordinates)
teleportButton.MouseButton1Click:Connect(teleportAllCoordinates)
pasteButton.MouseButton1Click:Connect(openPasteMenu)
addFromPasteButton.MouseButton1Click:Connect(addPastedCoordinates)
closePasteButton.MouseButton1Click:Connect(closePasteMenu)
clearButton.MouseButton1Click:Connect(clearCoordinates)

-- Обновление основных координат каждый кадр!
game:GetService("RunService").RenderStepped:Connect(updateCoordinates)
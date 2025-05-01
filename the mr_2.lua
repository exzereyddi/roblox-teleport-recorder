-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CoordinatesGUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.05, 0, 0.05, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "Your Coordinates"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true
titleLabel.Parent = frame

local coordinatesLabel = Instance.new("TextLabel")
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

local addedCoordinatesGui = Instance.new("ScreenGui")
addedCoordinatesGui.Name = "AddedCoordinatesGUI"
addedCoordinatesGui.Parent = game.Players.LocalPlayer.PlayerGui

local addedFrame = Instance.new("Frame")
addedFrame.Size = UDim2.new(0, 250, 0, 300)
addedFrame.Position = UDim2.new(0.3, 0, 0.05, 0)
addedFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
addedFrame.Parent = addedCoordinatesGui

local addedTitle = Instance.new("TextLabel")
addedTitle.Size = UDim2.new(1, 0, 0, 20)
addedTitle.Position = UDim2.new(0, 0, 0, 0)
addedTitle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
addedTitle.TextColor3 = Color3.new(1, 1, 1)
addedTitle.Text = "Added Coordinates"
addedTitle.Font = Enum.Font.SourceSansBold
addedTitle.TextScaled = true
addedTitle.Parent = addedFrame

local addedList = Instance.new("ScrollingFrame")
addedList.Size = UDim2.new(1, 0, 0.6, 0)
addedList.Position = UDim2.new(0, 0, 0.1, 0)
addedList.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
addedList.CanvasSize = UDim2.new(0, 0, 0, 0)
addedList.ScrollBarThickness = 12
addedList.Parent = addedFrame

local layout = Instance.new("UIListLayout")
layout.Parent = addedList
layout.SortOrder = Enum.SortOrder.LayoutOrder

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(1, 0, 0, 20)
copyButton.Position = UDim2.new(0, 0, 0.7, 0)
copyButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.Text = "Copy All"
copyButton.Font = Enum.Font.SourceSans
copyButton.TextScaled = true
copyButton.Parent = addedFrame

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(1, 0, 0, 20)
teleportButton.Position = UDim2.new(0, 0, 0.77, 0)
teleportButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Text = "Teleport All"
teleportButton.Font = Enum.Font.SourceSans
teleportButton.TextScaled = true
teleportButton.Parent = addedFrame

local pasteButton = Instance.new("TextButton")
pasteButton.Size = UDim2.new(1, 0, 0, 20)
pasteButton.Position = UDim2.new(0, 0, 0.84, 0)
pasteButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
pasteButton.TextColor3 = Color3.new(1, 1, 1)
pasteButton.Text = "Paste"
pasteButton.Font = Enum.Font.SourceSans
pasteButton.TextScaled = true
pasteButton.Parent = addedFrame

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(1, 0, 0, 20)
clearButton.Position = UDim2.new(0, 0, 0.91, 0)
clearButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
clearButton.TextColor3 = Color3.new(1, 1, 1)
clearButton.Text = "Clear"
clearButton.Font = Enum.Font.SourceSans
clearButton.TextScaled = true
clearButton.Parent = addedFrame

local coordinateEntries = {}
local entryHeight = 20

local function updateCoordinates()
	local player = game.Players.LocalPlayer
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local pos = character.HumanoidRootPart.Position
		coordinatesLabel.Text = string.format("X: %.1f, Y: %.1f, Z: %.1f", pos.X, pos.Y, pos.Z)
	end
end

local function removeEntry(entry)
	for i, v in ipairs(coordinateEntries) do
		if v == entry then
			table.remove(coordinateEntries, i)
			break
		end
	end
	entry:Destroy()
	addedList.CanvasSize = UDim2.new(0, 0, 0, #coordinateEntries * entryHeight)
end

local function createCoordinateEntry(text)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, 0, 0, entryHeight)
	container.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	container.ClipsDescendants = true
	container.Parent = addedList

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 1, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = Enum.Font.SourceSans
	label.TextScaled = true
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container

	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.new(0, 20, 1, 0)
	closeBtn.Position = UDim2.new(1, -20, 0, 0)
	closeBtn.BackgroundColor3 = Color3.new(0.6, 0.2, 0.2)
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	closeBtn.Text = "X"
	closeBtn.Font = Enum.Font.SourceSansBold
	closeBtn.TextScaled = true
	closeBtn.Visible = false
	closeBtn.Parent = container

	container.MouseEnter:Connect(function()
		container.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		closeBtn.Visible = true
	end)

	container.MouseLeave:Connect(function()
		container.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
		closeBtn.Visible = false
	end)

	closeBtn.MouseButton1Click:Connect(function()
		removeEntry(container)
	end)

	table.insert(coordinateEntries, container)
	addedList.CanvasSize = UDim2.new(0, 0, 0, #coordinateEntries * entryHeight)
end

local function addCoordinatesToList()
	local player = game.Players.LocalPlayer
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local pos = character.HumanoidRootPart.Position
		local coord = string.format("X: %.1f, Y: %.1f, Z: %.1f", pos.X, pos.Y, pos.Z)
		createCoordinateEntry(coord)
	end
end

local function copyAllCoordinates()
	local text = ""
	for _, entry in ipairs(coordinateEntries) do
		local label = entry:FindFirstChildOfClass("TextLabel")
		if label then text = text .. label.Text .. "\n" end
	end
	if setclipboard then setclipboard(text) end
end

local function teleportAllCoordinates()
	local player = game.Players.LocalPlayer
	local character = player.Character
	if not character then return end
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	coroutine.wrap(function()
		for _, entry in ipairs(coordinateEntries) do
			local label = entry:FindFirstChildOfClass("TextLabel")
			if label then
				local x, y, z = string.match(label.Text, "X: (%S+), Y: (%S+), Z: (%S+)")
				if x and y and z then
					root.CFrame = CFrame.new(Vector3.new(tonumber(x), tonumber(y), tonumber(z)))
					wait(0.7)
				end
			end
		end
	end)()
end

local function clearCoordinates()
	for _, entry in ipairs(coordinateEntries) do entry:Destroy() end
	coordinateEntries = {}
	addedList.CanvasSize = UDim2.new(0, 0, 0, 0)
end

local pasteMenu = Instance.new("Frame")
pasteMenu.Size = UDim2.new(0.5, 0, 0.3, 0)
pasteMenu.Position = UDim2.new(0.25, 0, 0.35, 0)
pasteMenu.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
pasteMenu.Visible = false
pasteMenu.Parent = addedCoordinatesGui

local pasteBox = Instance.new("TextBox")
pasteBox.Size = UDim2.new(0.9, 0, 0.6, 0)
pasteBox.Position = UDim2.new(0.05, 0, 0.1, 0)
pasteBox.BackgroundColor3 = Color3.new(1, 1, 1)
pasteBox.TextColor3 = Color3.new(0, 0, 0)
pasteBox.Font = Enum.Font.SourceSans
pasteBox.TextScaled = true
pasteBox.Parent = pasteMenu

local addPasteBtn = Instance.new("TextButton")
addPasteBtn.Size = UDim2.new(0.4, 0, 0.2, 0)
addPasteBtn.Position = UDim2.new(0.05, 0, 0.75, 0)
addPasteBtn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
addPasteBtn.TextColor3 = Color3.new(1, 1, 1)
addPasteBtn.Text = "Add"
addPasteBtn.Font = Enum.Font.SourceSans
addPasteBtn.TextScaled = true
addPasteBtn.Parent = pasteMenu

local closePasteBtn = Instance.new("TextButton")
closePasteBtn.Size = UDim2.new(0.4, 0, 0.2, 0)
closePasteBtn.Position = UDim2.new(0.55, 0, 0.75, 0)
closePasteBtn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
closePasteBtn.TextColor3 = Color3.new(1, 1, 1)
closePasteBtn.Text = "Close"
closePasteBtn.Font = Enum.Font.SourceSans
closePasteBtn.TextScaled = true
closePasteBtn.Parent = pasteMenu

local function openPasteMenu()
	pasteMenu.Visible = true
	pasteBox.Text = ""
	pasteBox:CaptureFocus()
	coroutine.wrap(function()
		wait(5)
		pasteMenu.Visible = false
	end)()
end

local function addPastedCoordinates()
	for x, y, z in string.gmatch(pasteBox.Text, "X: (%S+), Y: (%S+), Z: (%S+)") do
		createCoordinateEntry(string.format("X: %s, Y: %s, Z: %s", x, y, z))
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
		addCoordinatesToList()
	end
end)

copyButton.MouseButton1Click:Connect(copyAllCoordinates)
teleportButton.MouseButton1Click:Connect(teleportAllCoordinates)
pasteButton.MouseButton1Click:Connect(openPasteMenu)
addPasteBtn.MouseButton1Click:Connect(addPastedCoordinates)
closePasteBtn.MouseButton1Click:Connect(function() pasteMenu.Visible = false end)
clearButton.MouseButton1Click:Connect(clearCoordinates)

game:GetService("RunService").RenderStepped:Connect(updateCoordinates)
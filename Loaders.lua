local validKeys = {
    ["valid"] = true,
    ["notvalid"] = false
}


local thescript = [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pokelokbr/Dr.peste/main/mains"))()
]]

local gui = Instance.new("ScreenGui")
gui.Name = "AlphaHubGUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.Position = UDim2.new(0.5, -150, 0.5, -110)
frame.Size = UDim2.new(0, 300, 0, 220)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local blackOverlay = Instance.new("Frame")
blackOverlay.Name = "BlackOverlay"
blackOverlay.Parent = frame
blackOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blackOverlay.BackgroundTransparency = 0.7
blackOverlay.Size = UDim2.new(1, 0, 1, 0)

local background = Instance.new("ImageLabel")
background.Name = "Background"
background.Parent = frame
background.BackgroundTransparency = 1
background.Size = UDim2.new(1, 0, 1, 0)
background.Image = "http://www.roblox.com/asset/?id=16102119639"

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = frame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 10)
title.Font = Enum.Font.Ubuntu
title.Text = "vall Hub Private"
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.Parent = frame
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(0.5, 0, 0.5, 0)
logo.Position = UDim2.new(0.5, 0, 0, 35)
logo.AnchorPoint = Vector2.new(0.5, 0)
logo.Image = "http://www.roblox.com/asset/?id=15860672267"

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Font = Enum.Font.Ubuntu
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
closeButton.BackgroundTransparency = 0.9
closeButton.BorderSizePixel = 0

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local keyTextBox = Instance.new("TextBox")
keyTextBox.Name = "KeyTextBox"
keyTextBox.Parent = frame
keyTextBox.Size = UDim2.new(0.7, 0, 0, 30)
keyTextBox.Position = UDim2.new(0.5, -keyTextBox.Size.X.Offset / 2, 0.95, -35)
keyTextBox.AnchorPoint = Vector2.new(0.5, 1)
keyTextBox.PlaceholderText = "Enter Private Key"
keyTextBox.Font = Enum.Font.Ubuntu
keyTextBox.TextSize = 18
keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBox.BackgroundTransparency = 0.8

local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Parent = frame
buttonContainer.Size = UDim2.new(0.7, 0, 0, 30)
buttonContainer.Position = UDim2.new(0.5, -buttonContainer.Size.X.Offset / 2, 0.95, -3)
buttonContainer.AnchorPoint = Vector2.new(0.5, 1)
buttonContainer.BackgroundTransparency = 1

local function createButton(name, position, text)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = buttonContainer
    button.Size = UDim2.new(0.3, 0, 0, 30)
    button.Position = position
    button.Font = Enum.Font.Ubuntu
    button.Text = text
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.BackgroundTransparency = 0.9
    button.BorderSizePixel = 0
    return button
end

local loginButton = createButton("LoginButton", UDim2.new(0.35, 0, 0, 0), "Masuk Ke Script")
--local buyKeyButton = createButton("BuyKeyButton", UDim2.new(0.7, 0, 0, 0), "Buy KeyPrivate")

--getKeyButton.MouseButton1Click:Connect(function()
--    game.StarterGui:SetCore("SendNotification", {
--        Title = "vall Hub",
--        Text = "URL Get Private Key Berhasil Di Salin",
 --       Duration = 4
--    })
--end)

loginButton.MouseButton1Click:Connect(function()
    local enteredKey = keyTextBox.Text

    -- Memeriksa apakah kunci yang dimasukkan terdapat dalam daftar kunci yang valid
    if validKeys[enteredKey] then
        game.StarterGui:SetCore("SendNotification", {
            Title = "vall Hub",
            Text = "Key Valid...",
            Duration = 6
        })
      
        game.StarterGui:SetCore("SendNotification", {
            Title = "vall Hub",
            Text = "Selamat Datang Cuy!",
            Duration = 6
})
        loadstring(thescript)()  -- Menjalankan skrip jika kunci valid
        gui:Destroy()  -- Menghapus GUI setelah menjalankan skrip
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "vall Hub",
            Text = "Mampus Key Salah Kontol!!!!!!",
            Duration = 8
        })
    end
end)

--buyKeyButton.MouseButton1Click:Connect(function()
--    game.StarterGui:SetCore("SendNotification", {
--        Title = "vall Hub",
--        Text = "Gada Private Key Gak Di jual!!",
--        Duration = 4
--    })
--end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
   ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = "Key System"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = "Masukan Key untuk akses ke Script!!!"
Instructions.TextSize = 13
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "Masukan Key..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GetKey.Text = "Get Key"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(150, 150, 150)
GetKey.Parent = Frame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = GetKey

local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(0.35, 0, 0.15, 0)
CheckKey.Position = UDim2.new(0.55, 0, 0.7, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CheckKey.Text = "Check Key"
CheckKey.TextSize = 18
CheckKey.TextColor3 = Color3.fromRGB(150, 150, 150)
CheckKey.Parent = Frame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = CheckKey

GetKey.MouseButton1Click:Connect(function()
    setclipboard("key")
    
    -- Menampilkan notifikasi key berhasil di-copy
    game.StarterGui:SetCore("SendNotification", {
        Title = "<> vallHUB <>",
        Text = "Key Copy success",
        Duration = 8
    })
    
    -- Menampilkan notifikasi "Support dong Jan pake doang"
    game.StarterGui:SetCore("SendNotification", {
        Title = "<> vallHUB <>",
        Text = "Jan Lupa Beli Akun gw :>",
        Duration = 8
    })
end)


local function validateKey(key)
    return key == "key" -- Replace this with your key
end

local attempts = 0 -- Menghitung jumlah percobaan yang gagal

CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validateKey(enteredKey) then
        TextBox.PlaceholderText = "Key Valid!"
        TextBox.Text = ""
        wait(1)
        ScreenGui:Destroy()

        -- Menambahkan notifikasi saat kunci valid dimasukkan
        game.StarterGui:SetCore("SendNotification", {
            Title = "Login success!!",
            Text = "Nikmati SCnya!!",
            Duration = 8
        })

        -- Menjalankan skrip setelah kunci valid dimasukkan
        loadstring(game:HttpGet('https://raw.githubusercontent.com/charlesslim/vallHUB/main/vallh.lua'))()
    else
        TextBox.PlaceholderText = "Key salah. Coba Lagi."
        TextBox.Text = ""
        wait(1)
        TextBox.PlaceholderText = "Masukan Key..."
        TextBox.Text = ""
        
        -- Menghitung jumlah percobaan yang gagal
        attempts = attempts + 1
        if attempts >= 5 then
            -- Ter kick dari game setelah lima kali kesalahan
            game.Players.LocalPlayer:Kick("Jangan Coba2 Ngarang Key TOLOL!!!")
        end
    end
end)

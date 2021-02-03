
--[[
 ________  ___       ________      ___    ___ _______   ________          ________  ________  _____ ______   ________  ________  ________   ________   
|\   __  \|\  \     |\   __  \    |\  \  /  /|\  ___ \ |\   __  \        |\   ____\|\   __  \|\   _ \  _   \|\   __  \|\   __  \|\   ____\ |\   ____\    
\ \  \|\  \ \  \    \ \  \|\  \   \ \  \/  / | \   __/|\ \  \|\  \       \ \  \___|\ \  \|\  \ \  \\\__\ \  \ \  \|\  \ \  \|\  \ \  \___|_\ \  \___|_    
 \ \   ____\ \  \    \ \   __  \   \ \    / / \ \  \_|/_\ \   _  _\       \ \  \    \ \  \\\  \ \  \\|__| \  \ \   ____\ \   __  \ \_____  \\ \_____  \   
  \ \  \___|\ \  \____\ \  \ \  \   \/  /  /   \ \  \_|\ \ \  \\  \|       \ \  \____\ \  \\\  \ \  \    \ \  \ \  \___|\ \  \ \  \|____|\  \\|____|\  \  
   \ \__\    \ \_______\ \__\ \__\__/  / /      \ \_______\ \__\\ _\        \ \_______\ \_______\ \__\    \ \__\ \__\    \ \__\ \__\____\_\  \ ____\_\  \ 
    \|__|     \|_______|\|__|\|__|\___/ /        \|_______|\|__|\|__|        \|_______|\|_______|\|__|     \|__|\|__|     \|__|\|__|\_________\\_________\
                                 \|___|/                                                                                           \|_________\|_________|

    Made by foxwire121#5888(368756571481702401), with motivation from Yes#0007(579306070040641546)                                                                                                                                                 
--]]

--[[SETTINGS]]--
local TeamCheck = false
local debugMode = false --prints errors into ouput, may flood it

--[[GUI PARTS]]--

local Main
local Main_2
local Frame
local Frame_2
local UIAspectRatioConstraint
local hinge
local line
local UIAspectRatioConstraint_2
local UIAspectRatioConstraint_3
local UIAspectRatioConstraint_4
local UIAspectRatioConstraint_5
local UIAspectRatioConstraint_6
local UIAspectRatioConstraint_7
local UIAspectRatioConstraint_8
local UIAspectRatioConstraint_9
local TextLabel
local TextLabel_2
local TextLabel_3
local TextLabel_4
local savedHue
local SavedMapBigness
local DivideHueValueBy

function SendLocalMessage(Message,Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = "Player Compass",
        Text = tostring(Message),
        Duration = Duration
    })
end

function InsertGuis()
    SendLocalMessage('Waiting for the game to load',4)
    repeat wait() until game:IsLoaded()
    SendLocalMessage('Loading complete!',4)
    Main = Instance.new("ScreenGui")
    Main_2 = Instance.new("Frame")
    Frame = Instance.new("Frame")
    UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    Frame_2 = Instance.new("Frame")
    UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    hinge = Instance.new("Frame")
    line = Instance.new("Frame")
    UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
    TextLabel = Instance.new("TextLabel")
    UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
    TextLabel_2 = Instance.new("TextLabel")
    UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
    TextLabel_3 = Instance.new("TextLabel")
    UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
    TextLabel_4 = Instance.new("TextLabel")
    UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")

    Main.Name = game:GetService("HttpService"):GenerateGUID(false)
    Main.Parent = game:GetService("CoreGui")['RobloxLoadingGui']
    Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main_2.Name = "Main"
    Main_2.Parent = Main
    Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main_2.BackgroundTransparency = 1
    Main_2.Position = UDim2.new(0.0304449722, 0, 0.0640732348, 0)
    Main_2.Size = UDim2.new(0.151053861, 0, 0.292906165, 0)
    Main_2.ZIndex = 0

    Frame.Parent = Main_2
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.496124029, 0, 0.1953125, 0)
    Frame.Size = UDim2.new(0.00775193796, 0, 0.625, 0)

    UIAspectRatioConstraint.Parent = Frame
    UIAspectRatioConstraint.AspectRatio = 0.013

    Frame_2.Parent = Main_2
    Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(0.496124029, 0, 0.1953125, 0)
    Frame_2.Rotation = 90.000
    Frame_2.Size = UDim2.new(0.00775193796, 0, 0.625, 0)

    UIAspectRatioConstraint_2.Parent = Frame_2
    UIAspectRatioConstraint_2.AspectRatio = 0.013

    hinge.Name = "hinge"
    hinge.Parent = Main_2
    hinge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hinge.BackgroundTransparency = 1.000
    hinge.BorderSizePixel = 0
    hinge.Position = UDim2.new(0.496124029, 0, 0.4609375, 0)
    hinge.Size = UDim2.new(0.00775193796, 0, 0.078125, 0)
    hinge.ZIndex = 5

    line.Name = "line"
    line.Parent = hinge
    line.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0, 0, -3.5999999, 0)
    line.Size = UDim2.new(2, 0, 4.00000048, 0)

    UIAspectRatioConstraint_3.Parent = line
    UIAspectRatioConstraint_3.AspectRatio = 0.050

    UIAspectRatioConstraint_4.Parent = hinge
    UIAspectRatioConstraint_4.AspectRatio = 0.100

    TextLabel.Parent = Main_2
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.767441869, 0, 0.40625, 0)
    TextLabel.Size = UDim2.new(0.232558146, 0, 0.1953125, 0)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "E"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    UIAspectRatioConstraint_5.Parent = TextLabel
    UIAspectRatioConstraint_5.AspectRatio = 1.200

    TextLabel_2.Parent = Main_2
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0, 0, 0.40625, 0)
    TextLabel_2.Size = UDim2.new(0.232558146, 0, 0.1953125, 0)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = "W"
    TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.TextScaled = true
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextWrapped = true

    UIAspectRatioConstraint_6.Parent = TextLabel_2
    UIAspectRatioConstraint_6.AspectRatio = 1.200

    TextLabel_3.Parent = Main_2
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.395348847, 0, 0.8125, 0)
    TextLabel_3.Size = UDim2.new(0.232558146, 0, 0.1953125, 0)
    TextLabel_3.Font = Enum.Font.SourceSans
    TextLabel_3.Text = "S"
    TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.TextScaled = true
    TextLabel_3.TextSize = 14.000
    TextLabel_3.TextWrapped = true

    UIAspectRatioConstraint_7.Parent = TextLabel_3
    UIAspectRatioConstraint_7.AspectRatio = 1.200

    TextLabel_4.Parent = Main_2
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 1.000
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.Position = UDim2.new(0.395348847, 0, 0, 0)
    TextLabel_4.Size = UDim2.new(0.232558146, 0, 0.1953125, 0)
    TextLabel_4.Font = Enum.Font.SourceSans
    TextLabel_4.Text = "N"
    TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.TextScaled = true
    TextLabel_4.TextSize = 14.000
    TextLabel_4.TextWrapped = true

    UIAspectRatioConstraint_8.Parent = TextLabel_4
    UIAspectRatioConstraint_8.AspectRatio = 1.200

    UIAspectRatioConstraint_9.Parent = Main_2
    UIAspectRatioConstraint_9.AspectRatio = 1.008

    local UserInputService = game:GetService("UserInputService")

    local gui = Main_2

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

--[[MAIN SCRIPT]]--
_G.GetClosestPlayer = true
_G.LastKnownDirection = {}
local lowestMag
local realmag
local CurrentDirection = nil

function CalculateDegrees(Point1,Point2)
    local s,e = pcall(function()
        --point1 is localplayer
    --different in y over difference in x, in roblox: x1 - x2 / z1 - z2. then use tan to get the degrees from the angle
    --[[ local slope = (Point1.Position.Z - Point2.Position.Z)/(Point1.Position.X - Point2.Position.X)
    local Degrees = math.tan(slope)
    local realDegrees = math.deg(Degrees)
    print('Angle from player: '..realDegrees) ]]

    local degrees = math.atan2((Point1.Position.Z - Point2.Position.Z),(Point1.Position.X - Point2.Position.X))
    local realDegrees = math.deg(degrees*-1)+180
    --print(realDegrees)
    local Orientation = Point1.Orientation.Y
    --print(Orientation)
    local Diff = Orientation - realDegrees
    if (Diff > 180 and Diff < 270) or (Diff < -90 and Diff > -180) then
        CurrentDirection = "NorthWest"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff < 0 and Diff > -90) or (Diff > 270 and Diff < 360) then
        CurrentDirection = "NorthEast"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff > 0 and Diff < 90) or (Diff < -270 and Diff > -360) then
        CurrentDirection = "SouthEast"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff > 90 and Diff < 270) or (Diff < -180 and Diff > -270) then
        CurrentDirection = "SouthWest"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff == 90) or (Diff == -270) then
        CurrentDirection = "West"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff == -90) or (Diff == 270) then
        CurrentDirection = "East"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff == 180) or (Diff == -180) then
        CurrentDirection = "South"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    elseif (Diff == 360) or (Diff == -360) or (Diff == 0) then
        CurrentDirection = "North"
        table.insert(_G.LastKnownDirection,#_G.LastKnownDirection+1,CurrentDirection)
    end
    --print(CurrentDirection)
    if CurrentDirection == nil then
        CurrentDirection = _G.LastKnownDirection[#_G.LastKnownDirection+1]
    end
    hinge.Rotation = Diff+180-90
    local GetValue = 1-lowestMag/250
    if GetValue < 0 then GetValue = 0.004 end
    if GetValue >= 1 then GetValue = 0.996 end
    line.BackgroundColor3 = Color3.fromHSV(savedHue/1000, 1, GetValue)
    --[[ local tbl_main =
    {
        "Closest Player: ".._G.closestPlayer.Name..". Studs Away From Player: "..lowestMag..". Player Direction: "..CurrentDirection,
        "All"
    }
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(tbl_main)) ]]
    end)
    --if not s then print(e) end
end

function GetClosest()
    local s,e = pcall(function()
        for i,v in pairs(game.Players:GetPlayers()) do
            --add player specific checks here--
            if v.Name ~= game.Players.LocalPlayer.Name then
                --team check enabled or not
                if TeamCheck and v.Team then
                    if v.Team ~= game.Players.LocalPlayer.Team then
                        --print(i)
                        realmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        --print(realmag)
                        if i == 2 then
                            lowestMag = realmag
                            _G.closestPlayer = v
                        end
                        if i > 2 and realmag < lowestMag then
                            --print(realmag)
                            lowestMag = realmag
                            _G.closestPlayer = v
                        end
                    end
                else
                    --print(i)
                    realmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    --print(realmag)
                    if i == 2 then
                        lowestMag = realmag
                        _G.closestPlayer = v
                    end
                    if i > 2 and realmag < lowestMag then
                        --print(realmag)
                        lowestMag = realmag
                        _G.closestPlayer = v
                    end
                end
            end
        end
        --print('lowest mag: '..lowestMag)
        --print('Closest Player:'.._G.closestPlayer.Name)
        --check if player isnt nil
        if _G.closestPlayer then
            CalculateDegrees(game.Players.LocalPlayer.Character.HumanoidRootPart, _G.closestPlayer.Character.HumanoidRootPart)
        else
            return false
        end
    end)
    if not s and debugMode == true then
        print(e)
    end
end

function Initialize()
    --check exploit support for FileSaving API
    if readfile and writefile then
        local success, error = pcall(function()
            local SavedData = HttpServ:JSONDecode(readfile("PlayerCompassSettings.txt"))
            print(#savedData)
            SavedMapBigness = SavedData.mapType
            savedHue = SavedData.savedHue
        end)
        if not success then
            if string.find(error,"found") then
                SendLocalMessage("File not found",4)
                --warn("File error")
                --print("Writing")
                local HttpServ = game:GetService("HttpService")
                local UnsavedData = {
                    savedHue = 236;
                    mapType = "small map"
                }
                writefile("PlayerCompassSettings.txt", HttpServ:JSONEncode(UnsavedData))
                wait(5)
                --wait 5 secs and retry searching for newly made file
                local SavedData = HttpServ:JSONDecode(readfile("PlayerCompassSettings.txt"))
                print(#savedData)
                SavedMapBigness = SavedData.mapType
                savedHue = SavedData.savedHue
            end
        end
        --print(savedHue/1000)
        --print(SavedMapBigness)
        if SavedMapBigness == "small Map" then
            DivideHueValueBy = 70
        elseif SavedMapBigness == "medium Map" then
            DivideHueValueBy = 250
        elseif SavedMapBigness == "large Map" then
            DivideHueValueBy = 500
        end
    else
        warn("Exploit not supported!")
    end
    --get all the saved files using exploit API's

    InsertGuis()
    repeat
        wait(.1)
        GetClosest()
        --_G.GetClosestPlayer = false
    until _G.GetClosestPlayer ~= true
end

function CheckHealth()
    spawn(function()
        pcall(function()
            while wait() do
                if (game.Players.LocalPlayer.Character.Humanoid.Health <= 0) or (game.Players.LocalPlayer.Character.HumanoidRootPart == nil) then
                    game:GetService("CoreGui").Main:Destroy()
                    _G.getClosestPlayer = false
                    Initialize()
                end
            end
        end)
    end)
end

--[[START]]--

Initialize()
CheckHealth()

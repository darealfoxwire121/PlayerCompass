
--[[
    ______                           __  ____  ______ 
   / ____/___  ___  ____ ___  __  __/ / / / / / / __ \
  / __/ / __ \/ _ \/ __ `__ \/ / / / /_/ / / / / / / /
 / /___/ / / /  __/ / / / / / /_/ / __  / /_/ / /_/ / 
/_____/_/ /_/\___/_/ /_/ /_/\__, /_/ /_/\____/_____/  
                           /____/            
    Made by foxwire121#5888(368756571481702401)         
--]]

--TO DO--==========
--add wallcheck (Using the raycast already put out)

local Main
local Main2
local UIGradient
local IdealMouseOffsetX = -45 --keep it, should work on all types of screens, the games offest may differ though
local IdealMouseOffsetY = -45 -- same with this one

--change ideal mouse offsets in-game
game:GetService("UserInputService").InputBegan:Connect(function(input,nothing)
    if input.KeyCode == Enum.KeyCode.KeypadPlus then
        IdealMouseOffsetY = IdealMouseOffsetY - 1
    elseif input.KeyCode == Enum.KeyCode.KeypadMinus then
        IdealMouseOffsetY = IdealMouseOffsetY + 1
    elseif input.KeyCode == Enum.KeyCode.Minus then
        IdealMouseOffsetX = IdealMouseOffsetX - 1
    elseif input.KeyCode == Enum.KeyCode.Underscore then
        IdealMouseOffsetX = IdealMouseOffsetX + 1
    end
end)

function InsertRays(Point1,Point2)
    local raycastResult = workspace:Raycast(Point1.Position, Point2.Position)
    return raycastResult
end

function CheckRayCollision(Ray)
    ---check for player collision insert it here
    return true --return player instead of boolean
end

function Table(table,value)
    if not table then
        local newTable = {}
        table.insert(newTable,#newTable+1,value)
        return newTable
    end
    table.insert(table,#table+1,value)
end

function ChangeGuiColor(gui,color)
    if color == 'red' then
        local TS = game:GetService("TweenService")
        TS:Create(gui,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{BackgroundColor = Color3.new(255,0,0)}):Play()
    elseif color == 'white' then
        local TS = game:GetService("TweenService")
        TS:Create(gui,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{BackgroundColor = Color3.new(255,255,255)}):Play()
    end
end

function RotateGui(gui,Orientation)
    local TS = game:GetService("TweenService")
    TS:Create(gui,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Rotation = Orientation}):Play()
end

function ChangeFocusPlayerWallcheck(P1,P2)
    --check for player wallcheck
    _G.FocusedPlayer = CheckRayCollision(InsertRays(P1,P2)) -- insert player part here
end

function CheckGuiTransparent(gui)
    return (gui.BackgroundTransparency == 1)
end

function AnimateTransparency(gui,Transparency)
    local up = (Transparency <= 1 and Transparency > 0)
    repeat
        wait(.1)
        if up then
            gui.BackgroundTransparency = gui.BackgroundTransparency + 0.01
        else
            gui.BackgroundTransparency = gui.BackgroundTransparency - 0.01
        end
    until gui.BackgroundTransparency == Transparency
end

function SendLocalMessage(Message,Duration)
    game.StarterGui:SetCore("SendNotification",{
        Title = "EnemyHUD",
        Text = tostring(Message),
        Duration = (Duration or 4)
    })
end

function IsEnemyLookingAtPlayer(EnemyRotation,MagnitudeAngle)
    --the red color thing
    if ((EnemyRotation - MagnitudeAngle) < 45 and (EnemyRotation - MagnitudeAngle) > -45) or (((EnemyRotation - MagnitudeAngle) > -370) and (EnemyRotation - MagnitudeAngle) < -320) then
        return true
    end
end

function TransformMainGuiPosition()
    Main2.Position = UDim2.new(0,game.Players.LocalPlayer:GetMouse().X+IdealMouseOffsetX,0,game.Players.LocalPlayer:GetMouse().Y+IdealMouseOffsetY)
end

function GetUUID()
    return game:GetService("HttpService"):GenerateGUID(false)
end

function InsertGuis(ThemeNumber)
    pcall(function()
        SendLocalMessage('Waiting for the game to load')
        repeat
            wait()
        until game:IsLoaded()
        SendLocalMessage('Loaded')
        if ThemeNumber == 1 then
            --Insert gui here
            Main = Instance.new("ScreenGui")
            Main2 = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            UIGradient = Instance.new("UIGradient")
            local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
            
            --Properties:
            
            Main.Name = GetUUID()
            Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            Main2.Name = GetUUID()
            Main2.Parent = Main
            Main2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Main2.Position = UDim2.new(0, 377, 0, 168)
            Main2.Size = UDim2.new(0, 100, 0, 100)
            
            UICorner.CornerRadius = UDim.new(0, 50)
            UICorner.Parent = Main2
            
            UIGradient.Rotation = 90
            UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.08, 0.82), NumberSequenceKeypoint.new(0.14, 0.99), NumberSequenceKeypoint.new(0.19, 1.00), NumberSequenceKeypoint.new(0.43, 1.00), NumberSequenceKeypoint.new(0.67, 1.00), NumberSequenceKeypoint.new(0.99, 1.00), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
            UIGradient.Parent = Main2
            
            UIAspectRatioConstraint.Parent = Main2
            -----------------
        end
    end)
end

--[[MAIN SCRIPT]]--

_G.wallCheck = true
_G.wallCheckOverride = false
_G.GetFocusedPlayer = true
_G.LastKnownDirection = {}
local lowestMag
local realmag
local CurrentDirection = nil

function CalculateDegrees(Point1,Point2)
    pcall(function()
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
        --check for enemy's lookvector
        --print(Point2.Orientation.Y-90 - realDegrees)
        --if wallcheck then visible == true else it is transparent
        if IsEnemyLookingAtPlayer(Point2.Orientation.Y-90,realDegrees) then
            Main2.Rotation = Diff+90
            Main2.BackgroundColor3 = Color3.fromRGB(255,0,0)
        else
            Main2.Rotation = Diff+90
            Main2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        end
        --[[ local tbl_main =
        {
            "Closest Player: ".._G.FocusedPlayer.Name..". Studs Away From Player: "..lowestMag..". Player Direction: "..CurrentDirection,
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
                --team check enabled or 
                if #game:GetService("Teams"):GetDescendants() > 0 then
                    if (v.Team ~= game.Players.LocalPlayer.Team) or (game.Players[v.Name]:FindFirstChild('team').Value ~= game.Players.LocalPlayer['team'].Value) then
                        --[[added support for Energy Assault here]]--
                        --print(i)
                        realmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        --print(realmag)
                        if i == 2 then
                            lowestMag = realmag
                            _G.FocusedPlayer = v
                        end
                        if i > 2 and realmag < lowestMag then
                            --print(realmag)
                            lowestMag = realmag
                            _G.FocusedPlayer = v
                        end
                    end
                else
                    --print(i)
                    realmag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    --print(realmag)
                    if i == 2 then
                        lowestMag = realmag
                        _G.FocusedPlayer = v
                    end
                    if i > 2 and realmag < lowestMag then
                        --print(realmag)
                        lowestMag = realmag
                        _G.FocusedPlayer = v
                    end
                end
            end
        end
        --print('lowest mag: '..lowestMag)
        --print('Closest Player:'.._G.FocusedPlayer.Name)
        --check if player isnt nil
        if _G.FocusedPlayer then
            CalculateDegrees(game.Players.LocalPlayer.Character.Head, _G.FocusedPlayer.Character.Head)
        else
            return false
        end
    end)
end

function Initialize()
    pcall(function()
        InsertGuis(1)
        repeat
            wait()
            GetClosest()
            TransformMainGuiPosition()
            --_G.GetFocusedPlayer = false --default: comment this line, used for debugging the function: GetClosest()
        until _G.GetFocusedPlayer ~= true
    end)
end


--[[START]]--

Initialize()
    

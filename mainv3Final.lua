
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
--check ray collision

local Main
local Main2
local UIGradient
local IdealMouseOffsetX = -45 --keep it, should work on all types of screens, the games offest may differ though
local IdealMouseOffsetY = -45 -- same with this one
local openPlayers = {}
local dMode = false
_G.Message = false
local ExtraDelay = 0 --Please ignore this

function rPrint(Message)
    if dMode then
        rconsoleprint(Message)
    end
end

--change ideal mouse offsets in-game
game:GetService("UserInputService").InputBegan:Connect(function(input,nothing)
    if nothing then
        if input.KeyCode == Enum.KeyCode.KeypadPlus then
            IdealMouseOffsetY = IdealMouseOffsetY - 1
        elseif input.KeyCode == Enum.KeyCode.KeypadMinus then
            IdealMouseOffsetY = IdealMouseOffsetY + 1
        elseif input.KeyCode == Enum.KeyCode.Minus then
            IdealMouseOffsetX = IdealMouseOffsetX - 1
        elseif input.KeyCode == Enum.KeyCode.Underscore then
            IdealMouseOffsetX = IdealMouseOffsetX + 1
        end
    end
end)

function InsertRays(Point1,Point2)
    local raycastResult = workspace:Raycast(Point1.Position, Point2.Position)
    local rpars = RaycastParams.new()
    rpars.IgnoreWater = true
    return raycastResult
end

function CheckRayCollision(Rayresult,P1,P2)
    if Rayresult then
        rPrint("Ray hit target: "..Rayresult.Instance.Name)
    else
        return true
    end
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

function ClearTable(tableName)
    for i,v in pairs(tableName) do
        table.remove(tableName,i)
    end
end

function CheckEntriesTable(tableName)
    return #tableName or 0
end


--[[WALLCHECK]]--
function ChangeFocusPlayerWallcheck(P1,P2)
    --check for player wallcheck
    local newRay = InsertRays(P1,P2) 
    if CheckRayCollision(newRay,P1,P2) == true then
        table.insert(openPlayers,#openPlayers+1,game.Players:GetPlayerFromCharacter(P2.Parent))
    else
        rPrint('\nError with checkRayCollision')
    end
end

function CheckGuiTransparent(gui)
    return (gui.BackgroundTransparency == 1)
end

function AnimateTransparency(gui,Transparency)
    local up = (Transparency <= 1 and Transparency > 0)
    repeat
        wait(.1)
        if up then
            gui.BackgroundTransparency = gui.BackgroundTransparency + 0.015
        else
            gui.BackgroundTransparency = gui.BackgroundTransparency - 0.015
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
    return game:GetService("HttpService"):GenerateGUID(false) or tostring(math.pi+math.random(0,math.huge))
end

function InsertGuis(ThemeNumber)
    if not _G.Message then
        _G.Message = true
        SendLocalMessage('Waiting for the game to load')
        if dMode then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == 'Head' and v:IsA('BasePart') then
                    SendLocalMessage('This game is supported!')
                    break
                end
            end
        end
        repeat
            wait()
        until game:IsLoaded()
        wait(ExtraDelay)
        SendLocalMessage('Loaded')
    end
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
end

--[[MAIN SCRIPT]]--

_G.wallCheck = true
_G.GetFocusedPlayer = true
_G.LastKnownDirection = {}
--[[ local lowestMag
local realmag
local CurrentDirection = nil ]]

function GetClosest()
    local s,e = pcall(function()
        if CheckEntriesTable(openPlayers) > 0 then
            ClearTable(openPlayers)
        end
        --[[Closest Player function was here]]
        for i,v in pairs(game.Players:GetPlayers()) do
            ChangeFocusPlayerWallcheck(game.Players.LocalPlayer.Character.Head,v.Character.Head)
            if CheckEntriesTable(openPlayers) > 0 then
                rPrint(CheckEntriesTable(openPlayers))
                _G.FocusedPlayer = openPlayers[1]
            else
                rPrint('\nError: openPlayers list it empty')
                break
            end
            if _G.FocusedPlayer == nil and CheckGuiTransparent(Main2) == false then
                --set gui invisible
                AnimateTransparency(Main2,1)
            else
                rPrint('Name of current target: '.._G.FocusedPlayer.Name)
                --set gui visible
                AnimateTransparency(Main2,0)
            end
            local newDegrees = math.atan2((game.Players.LocalPlayer.Character.Head.Position.Z - _G.FocusedPlayer.Character.Head.Position.Z),(game.Players.LocalPlayer.Character.Head.Position.X - _G.FocusedPlayer.Character.Head.Position.X))
            local newRealDegrees = math.deg(newDegrees*-1)+180
            local newDiff = (game.Players.LocalPlayer.Character.Head.Orientation.Y - newRealDegrees)+90
            if IsEnemyLookingAtPlayer(_G.FocusedPlayer.Character.Head.Orientation.Y-90,newRealDegrees) then
                --enemy looking at player
                RotateGui(Main2,newDiff)
                ChangeGuiColor(Main2,'red')
            else
                RotateGui(Main2,newDiff)
                ChangeGuiColor(Main2,'white')
            end
        end
        --print('lowest mag: '..lowestMag)
        --print('Closest Player:'.._G.FocusedPlayer.Name)
        --check if player isnt nil
        --[[ if _G.FocusedPlayer then
            CalculateDegrees(game.Players.LocalPlayer.Character.Head, _G.FocusedPlayer.Character.Head)
        else
            return false
        end ]]
    end)
    if not s and dMode == true then
        rPrint(e)
        return
    end
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

spawn(function()
    while wait() do
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
            wait(5)
            Initialize()
        end
    end
end)

Initialize()

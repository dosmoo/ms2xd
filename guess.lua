getgenv().AUTO_GUESS_ENABLED = true

if not getgenv().AUTO_GUESS_ENABLED then return end
if getgenv().INITIALIZED then return end
getgenv().INITIALIZED = true

local GUI = (function()
    local uiObj

    for _, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
        if v.Name == "SurfaceGui" and v.Adornee ~= nil and v.Adornee.Name == "GuessThatPetBoard" then
            uiObj = v:WaitForChild("Frame"):WaitForChild("Main")
            break
        end
    end

    return uiObj
end)()
if not GUI then
    warn("Failed to retrieve GUI")
end

local lastGuess = ""
function make_work()
    if (game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position - Vector3.new(-2891.76, 17.8616, -134.314)).Magnitude > 16 then
        return
    end
    if not GUI:WaitForChild("Title").Text:match("Guess") then
        return
    end

    local PETFrame = GUI:FindFirstChild("Pet")
    if not PETFrame then
        return
    end

    local currentGuess = PETFrame:GetChildren()[1].Name
    if lastGuess == currentGuess then
        return
    end
    lastGuess = currentGuess

    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(currentGuess, "All")
end

-- dont_look_here
function dont_look_here()
    while getgenv().AUTO_GUESS_ENABLED do
        make_work()
        task.wait()
    end
    repeat
        task.wait()
    until getgenv().AUTO_GUESS_ENABLED == true

    dont_look_here()
end
dont_look_here() 

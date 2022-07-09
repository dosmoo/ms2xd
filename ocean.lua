while task.wait() do

    
    local args = {
        [1] = workspace.Worlds:FindFirstChild("Summer Fair").Fishing.Ocean.Part,
        [2] = Vector3.new(-3118.8125, -0.315055847, 87.1624756)
    }
    
    game:GetService("ReplicatedStorage").Events.FishingCast:FireServer(unpack(args))
    
    
 end

while task.wait() do

    
    local args = {
        [1] = workspace.Worlds:FindFirstChild("Summer Fair").Fishing.Pond.Part,
        [2] = Vector3.new(-2914.73706, 0.700042725, 255.070435)
    }
    
    game:GetService("ReplicatedStorage").Events.FishingCast:FireServer(unpack(args))
    
    
  end

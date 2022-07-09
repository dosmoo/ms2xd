while task.wait() do


    local args = {
        [1] = workspace.Worlds:FindFirstChild("Summer Fair").Fishing.River.Part,
        [2] = Vector3.new(-2923.441650390625, 1.200042724609375, 240.5873565673828)
    }

    game:GetService("ReplicatedStorage").Events.FishingCast:FireServer(unpack(args))


end

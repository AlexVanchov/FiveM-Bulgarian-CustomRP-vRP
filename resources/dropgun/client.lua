RegisterCommand("drop", function(source, args)
    if (IsPedArmed(GetPlayerPed(-1), 7)) then
        ClearPedTasks(GetPlayerPed(-1))
        playAnim("weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor")
        Citizen.Wait(1000)
        SetPedDropsInventoryWeapon(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), 0.0, 0.6, -0.9, 30)
        ClearPedTasks(GetPlayerPed(-1))
    end
end)

function playAnim(dict, name)
    local ped = GetPlayerPed(-1)
    loadAnimDict(dict)
    TaskPlayAnim(ped, dict, name, 8.0, 1.0, -1, 2, 0, 0, 0, 0)
end


function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
    return true
end
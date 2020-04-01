local Tunnel = module("vrp", "lib/Tunnel")
hudServer = Tunnel.getInterface("vrp_betterhud")

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(100)
        local thirst, hunger = hudServer.getBasics()
        SendNUIMessage({
            show = IsPauseMenuActive(),
            armor = GetPedArmour(GetPlayerPed(-1)),
            life = (GetEntityHealth(GetPlayerPed(-1))-100),
            thirst = thirst,
            hunger = hunger
        })
    end
end)
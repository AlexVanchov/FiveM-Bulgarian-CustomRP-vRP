Citizen.CreateThread(function()
	while true do
		Citizen.Wait(999999)
		if (GetEntityHealth(GetPlayerPed(-1)) < 159) then
		    RequestAnimSet("move_m@injured")
		    while not HasAnimSetLoaded("move_m@injured") do
			    Citizen.Wait(0)
		    end
		    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
		else
		    ResetPedMovementClipset(GetPlayerPed(-1))
            ResetPedWeaponMovementClipset(GetPlayerPed(-1))
		    ResetPedStrafeClipset(GetPlayerPed(-1))
		end
	end
end)
--------------------------------------------------------------------------------
--
--								VARIABLES
--
--------------------------------------------------------------------------------
enable_phone = true
showPhone = false


--------------------------------------------------------------------------------
--
--									Threads
--
--------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do Citizen.Wait(1)
		if IsPlayerPlayingAnimation() and showPhone then
			ePhoneHide()
			SetPedCanRagdoll(GetPlayerPed(-1), false)
		else
			SetPedCanRagdoll(GetPlayerPed(-1), true)
		end

		-- Hide phone if player is dead
		if IsPlayerDead(PlayerId()) then
			ePhoneHide()
		end

		-- Enable phone
		if enable_phone then
			if IsControlJustPressed(0, 311) then
				ePhoneShow()
			elseif IsControlJustPressed(0, 311) then
				ePhoneHide()
			elseif IsControlJustPressed(0, 177) then
				ePhoneHide()
			end
		end

		-- Hide phone if player holds a weapon
		if GetCurrentPedWeapon(GetPlayerPed(-1)) then
			ePhoneHide()
		end
	end
end)


--------------------------------------------------------------------------------
--
--									CALLBACKS
--
--------------------------------------------------------------------------------
RegisterNUICallback("phoneClose", function(data, cb)
	ePhoneHide()
end)

function IsPlayerPlayingAnimation()
	if IsPlayerClimbing(PlayerId()) or IsPlayerDead(PlayerId()) or
	IsPedCuffed(GetPlayerPed(-1)) or IsPedJumpingOutOfVehicle(GetPlayerPed(-1))
	or IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) or
	GetCurrentPedWeapon(GetPlayerPed(-1)) then
		return true
	else
		return false
	end
end

function ePhoneShow()
	if not showPhone then
		SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263)
		ePhoneInAnim()
		showPhone = true
	end
end

function ePhoneHide()
	if showPhone then
		ePhoneOutAnim()
		showPhone = false
	end
end

function IsPlayerUsingPhone()
	if showPhone then
		return true
	else
		return false
	end
end

--------------------------------------------------------------------------------
--
--									EVENTS
--
--------------------------------------------------------------------------------

RegisterNetEvent("telefon:deschide")
AddEventHandler("telefon:deschide", function()
	enable_phone = true
end)

RegisterNetEvent("telefon:inchide")
AddEventHandler("telefon:inchide", function()
	enable_phone = false
	ePhoneHide()
end)

RegisterNetEvent("telefon:arata")
AddEventHandler("telefon:arata", function()
	ePhoneShow()
end)

RegisterNetEvent("telefon:ascunde")
AddEventHandler("telefon:ascunde", function()
	ePhoneHide()
end)


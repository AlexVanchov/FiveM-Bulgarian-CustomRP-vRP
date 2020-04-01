--[[              
  /     \  _____     __| _/  ____   \______   \ ___.__.   ____    /     \  _____   _______ |  | __  ____  ________
 /  \ /  \ \__  \   / __ | _/ __ \   |    |  _/<   |  |  /  _ \  /  \ /  \ \__  \  \_  __ \|  |/ /_/ __ \ \___   /
/    Y    \ / __ \_/ /_/ | \  ___/   |    |   \ \___  | (  <_> )/    Y    \ / __ \_ |  | \/|    < \  ___/  /    / 
\____|__  /(____  /\____ |  \___  >  |______  / / ____|  \____/ \____|__  /(____  / |__|   |__|_ \ \___  >/_____ \
		\/      \/      \/      \/          \/  \/                      \/      \/              \/     \/       \/
		
------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--     Script made for Origin Network 24/01/2019     --
--   Copyright 2019 ©oMarkez. All rights reserved    --
--    LICENSE: GNU AFFERO GENERAL PUBLIC LICENSE	 --
-------------------------------------------------------

on_atm
Copyright (C) 2019  oMarkez

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

vRPCatm = {}
Tunnel.bindInterface("vRP_atm",vRPCatm)
Proxy.addInterface("vRP_atm",vRPCatm)
vRPSatm = Tunnel.getInterface("vRP_atm","vRP_atm")
vRP = Proxy.getInterface("vRP")

local open = false
local type = 'fleeca'

-- Notification
function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

-- Enter / Exit zones
Citizen.CreateThread(function ()
  SetNuiFocus(false, false)
	time = 500
	x = 1
  while true do
    Citizen.Wait(time)
		inMarker = false
		inBankMarker = false

    for i=1, #Config.ATMS, 1 do
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.ATMS[i].x, Config.ATMS[i].y, Config.ATMS[i].z, true) < 2  then
				x = i
				time = 0
				if ( Config.ATMS[i].b == nil ) then
					inMarker = true
					--hintToDisplay('Tryk ~INPUT_PICKUP~ for at bruge hæveautomaten!')
					drawTxt('[~g~E~s~] за достъп до банкомата', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255) 
				else
					inBankMarker = true
					type = Config.ATMS[i].t
					--hintToDisplay('Tryk ~INPUT_PICKUP~ for at tilgå banken!')
					drawTxt('[~g~E~s~] за достъп до банката', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255) 
				end
			elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.ATMS[x].x, Config.ATMS[x].y, Config.ATMS[x].z, true) > 4 then
				time = 500
			end
    end

	end
end)

-- Key event
Citizen.CreateThread(function ()
  while true do
    Wait(0)
		if IsControlJustReleased(0, 38) and inMarker then
			vRPSatm.hasAccountSetup({}, function(hasAcc)
				if(hasAcc == false)then
					vRPsatm.generatePinNumber({})
				else
					vRPSatm.getATMMoney({}, function(data)
						SetNuiFocus(true, true)
						open = true
						print(data)
						print(data[1])
						SendNUIMessage({
							action = "open",
							bank = data[1],
							cash = data[2],
							code = data[3]
						})
					end)
				end
			end)
		end
		if IsControlJustReleased(0, 38) and inBankMarker then
			vRPSatm.hasAccountSetup({}, function(hasAcc)
				if(hasAcc == false)then
					vRPsatm.generatePinNumber({function(callback)
						if callback == "ok" then
							print("ok")
						end
					end})
				else
					vRPSatm.getUserInfo({}, function(data)

						print(data[6])

						SetNuiFocus(true, true)
						open = true
						SendNUIMessage({
							action = "openBank",
							bank = data[4],
							cash = data[5],
							type = type,
							firstname = data[1],
							lastname = data[2],
							account = data[3],
							pin = data[6]
						})
					end)
				end
			end)
		end
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)


-- Insert money
RegisterNUICallback('insert', function(data, cb)
	cb('ok')
	vRPSatm.depositBankMoney({data.money})
end)

-- Take money
RegisterNUICallback('take', function(data, cb)
	cb('ok')
	vRPSatm.takeBankMoney({data.money})
end)

-- Create account
RegisterNUICallback('opretsubmit', function(data, cb)
	cb('ok')
	vRPSatm.createAcc({data.pin})
end)

RegisterNUICallback('login', function(data)
	print("login")
	vRPSatm.loginSubmit({data.brugernavn,data.kode})
end)

-- Create account
RegisterNUICallback('accerror', function(data, cb)
	cb('ok')
	vRPSatm.createAccError({data})
end)

-- Transfer money
RegisterNUICallback('transfer', function(data, cb)
	cb('ok')
	vRPSatm.transferBankMoney({data.money, data.account})
end)

-- Close the NUI/HTML window
RegisterNUICallback('escape', function(data, cb)
	SetNuiFocus(false, false)
	open = false
	cb('ok')
end)

-- Handles the error message
RegisterNUICallback('error', function(data, cb)
	SetNuiFocus(false, false)
	open = false
	cb('ok')
	ESX.ShowNotification('Машината работи ... Моля, изчакайте!')
end)

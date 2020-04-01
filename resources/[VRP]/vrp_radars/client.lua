--===============================================--===============================================
--= stationary radars based on 	https://github.com/DreanorGTA5Mods/StationaryRadar	         =
--===============================================--===============================================

local radares = {
{x = 379.68807983398, y = -1048.3527832031, z = 29.250692367554},
{x = -253.10794067383, y = -630.20385742188, z = 33.002685546875},
}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	for i = 1, #radares, 1 do
		local szBlip = AddBlipForCoord(zones[i].x, zones[i].y, zones[i].z)
		SetBlipAsShortRange(szBlip, true)
		SetBlipColour(szBlip, 59)  --Change the blip color: https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
		SetBlipSprite(szBlip, 184) -- Change the blip itself: https://marekkraus.sk/gtav/blips/list.html
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Ushev Radar") -- What it will say when you hover over the blip on your map.
		EndTextCommandSetBlipName(szBlip)
	end
end)

Citizen.CreateThread(function()


  while true do
    Wait(0)
	for k,v in pairs(radares) do
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player, true)
	if Vdist2(radares[k].x, radares[k].y, radares[k].z, coords["x"], coords["y"], coords["z"]) < 10 then
	Citizen.Trace("Преминавате през радар")
		checkSpeed()
	end
  end
 end
end)

  function checkSpeed()
  local pP = GetPlayerPed(-1)
  local speed = GetEntitySpeed(pP)
  local vehicle = GetVehiclePedIsIn(pP, false)
  local driver = GetPedInVehicleSeat(vehicle, -1)
  local maxspeed = 60
	local kmhspeed = math.ceil(speed*3.6)
		if kmhspeed > maxspeed and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarMulta')
			exports.pNotify:SetQueueMax("left", 1)
            exports.pNotify:SendNotification({
            text = "Бяхте глобен.",
            type = "error",
            timeout = 5000,
            layout = "centerLeft",
            queue = "left"
          })
	end
end

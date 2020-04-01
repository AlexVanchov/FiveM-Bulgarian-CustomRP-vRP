--===============================================--===============================================
--= stationary radars based on 	https://github.com/DreanorGTA5Mods/StationaryRadar	         =
--===============================================--===============================================

local radares = {
{x = -35.008335113526,y = -949.56164550782,z = 31.043756484986},
{x = 101.77703094482,y = -997.90447998046,z = 31.47999382019},
{x = 219.91159057618,y = -1039.9711914062,z = 29.46908378601},
{x = 398.1968383789,y = -1050.1112060546,z = 29.766105651856},
{x = -95.480522155762,y = -1136.4268798828,z = 25.827877044678},
{x = 781.53332519532,y = -1005.6907348632,z = 26.386632919312},
{x = 2064.2553710938,y = 3720.2802734375,z = 34.794765472412},
{x = 1855.7980957032,y = 3728.7204589844,z = 34.73433303833},
{x = 153.47106933594,y = 6527.2553710938,z = 33.422611236572},
{x = -176.1208190918,y = 6479.8413085938,z = 31.28803062439},
{x = -2719.9423828125,y = 2285.7397460938,z = 20.502052307128},
{x = -806.75518798828,y = 1342.7818603516,z = 254.78994750976},
{x = 2206.5444335938,y = 6042.3779296875,z = 52.099006652832},
{x = 1994.3084716796,y = 6234.48046875,z = 46.35856628418},
{x = 1952.263305664,y = 6218.712890625,z = 44.4587059021},
{x = -2173.5979003906,y = -347.05169677734,z = 13.180083274842},
{x = -1113.5874023438,y = 2666.4626464844,z = 19.769708633422}
}

Citizen.CreateThread(function()
  while true do
    Wait(0)
	for k,v in pairs(radares) do
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player, true)
	if Vdist2(radares[k].x, radares[k].y, radares[k].z, coords["x"], coords["y"], coords["z"]) < 20 then
	Citizen.Trace("estas pasando por un radar")
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
  local kmhspeed = math.ceil(speed*3.6)
  local int1 = 110
  local int2 = 140
  local int3 = 180
  local int4 = 210
  local int5 = 270
  local int6 = 350
	if kmhspeed > int1 and kmhspeed < int2 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarMulta')
			TriggerEvent("chatMessage", "[КАТ]", {174,0, 0}, "Вие бяхте глобен 50$ за превишена скорост!")
	end
		if kmhspeed > int2 and kmhspeed < int3 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarZulta')
			TriggerEvent("chatMessage", "[КАТ]", {174,0, 0}, "Вие бяхте глобен 150$ за превишена скорост!")
	end
			if kmhspeed > int3 and kmhspeed < int4 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarDulta')
			TriggerEvent("chatMessage", "[КАТ]", {174, 0, 0}, "Вие бяхте глобен 250$ за превишена скорост!")
	end
				if kmhspeed > int4 and kmhspeed < int5 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarBulta')
			TriggerEvent("chatMessage", "[КАТ]", {174,0, 0}, "Вие бяхте глобен 300$ за превишена скорост!")
	end
				if kmhspeed > int5 and kmhspeed < int6 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarHulta')
			TriggerEvent("chatMessage", "[КАТ]", {174, 0, 0}, "Вие бяхте глобен 450$ за превишена скорост!")
	end
				if kmhspeed > int6 and driver == pP then
			Citizen.Wait(250)
			TriggerServerEvent('cobrarFulta')
			TriggerEvent("chatMessage", "[КАТ]", {174, 0, 0}, "Вие бяхте глобен 600$ за превишена скорост!")
	end
end

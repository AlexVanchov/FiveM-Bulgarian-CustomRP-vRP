DG = {}
Tunnel.bindInterface("es_safezone",DG)
Proxy.addInterface("es_safezone",DG)
vRP = Proxy.getInterface("ESX")
DGserver = Tunnel.getInterface("es_safezone","es_safezone")

inSafeZone = false
safeZone = nil

safeZones = {
	-- {x, y, z, arie}
	["spital"] = {366.35552978516,-593.0092163086,28.69900894165, 30},
	["spital2"] = {280.56149291992,-1398.429321289,30.142204284668, 30},
	["spital3"] = {327.4808959961,-1459.7268066406,29.801872253418, 30},
	["spital4"] = {336.7253112793,-1390.1826171875,32.509269714356, 30},
	["politie"] = {439.81991577148,-990.33282470704,43.691638946534, 32},        
	["obshtinata"] = {-533.45013427734,-223.61305236816,37.649742126464, 55},
        ["spawna"] = {-1038.8934326172,-2736.8549804688,20.169269561768, 55}
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
		local px,py,pz = playerPos.x, playerPos.y, playerPos.z
		
		for i, v in pairs(safeZones)do
			x, y, z = v[1], v[2], v[3]
			radius = v[4]
			if(Vdist(x, y, z,px,py,pz) < radius)then
				inSafeZone = true
				safeZone = i
			end
		end
		if(safeZone ~= nil)then
			x2, y2, z2 = safeZones[safeZone][1], safeZones[safeZone][2], safeZones[safeZone][3]
			radius2 = safeZones[safeZone][4]
			if(Vdist(x2, y2, z2,px,py,pz) > radius2)then
				inSafeZone = false
				safeZone = nil
			end
		end
	end
end)

function vehPrs_drawTxt(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (inSafeZone == true)then
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			vehPrs_drawTxt("~e~Тук е ~g~SAFEZONE")
		end
	end
end)
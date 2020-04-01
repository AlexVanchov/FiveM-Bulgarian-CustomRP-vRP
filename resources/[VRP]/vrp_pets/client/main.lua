vRPserver = Tunnel.getInterface("vRP", "vrp_pets_client")
vRP = Proxy.getInterface("vRP")

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Config = {}

Config.Zones = {
	PetShop = {
		Pos = {
			x = 562.19805908203,
			y = 2741.3090820313,
			z = 41.868915557861
		},
		Sprite = 463,
		Display = 4,
		Scale = 1.0,
		Size = {
			x = 1.5,
			y = 1.5,
			z = 1.0
		},
		Color = {
			r = 204,
			g = 204,
			b = 0
		},
		Type = 1
	}
}

local GUI = {}
GUI.Time = 0

local ped = {}
local model = {}
local status = 100

local come = 0
local isAttached = false
local animation = {}

local objCoords = nil
local balle = false
local object = {}

local inanimation = false
local getball = false
local bool = false

RegisterNetEvent("vrp_pets:callPet")
AddEventHandler("vrp_pets:callPet", function (data)
	if (data == "chien") then
		model = -1788665315
		come = 1
		spawnpet()
	elseif (data == "chat") then
		model = 1462895032
		come = 1
		spawnpet()
	elseif (data == "loup") then
		model = 1682622302
		come = 1
		spawnpet()
	elseif (data == "lapin") then
		model = -541762431
		come = 1
		spawnpet()
	elseif (data == "husky") then
		model = 1318032802
		come = 1
		spawnpet()
	elseif (data == "cochon") then
		model = -1323586730
		come = 1
		spawnpet()
	elseif (data == "caniche") then
		model = 1125994524
		come = 1
		spawnpet()
	elseif (data == "carlin") then
		model = 1832265812
		come = 1
		spawnpet()
	elseif (data == "retriever") then
		model = 882848737
		come = 1
		spawnpet()
	elseif (data == "berger") then
		model = 1126154828
		come = 1
		spawnpet()
	elseif (data == "westie") then
		model = -1384627013
		come = 1
		spawnpet()
	end
end)

RegisterNetEvent("vrp_pets:givefood")
AddEventHandler("vrp_pets:givefood", function (data)
	local inventory = data
	local amount = 0
	local coords1 = GetEntityCoords(GetPlayerPed(-1))
	local coords2 = GetEntityCoords(ped)
	local distance = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, true)
	for k,v in pairs(inventory) do
		if k == 'croquettes' then
			amount = inventory[k].amount
		end
	end
	if distance < 5 then
		if amount >= 1 then
			if status < 100 then
				status = status + math.random(2, 15)
				vRP.notify("Deste comida ao teu animal de estimação.")
				TriggerServerEvent('vrp_pets:startHarvest')
				if status > 100 then
					status = 100
				end
				vRP.closeMenu()
			else
				vRP.notify("O teu animal de estimação já não tem fome.")
			end
		else
			vRP.notify("~sr~Não tens mais comida para o teu animal de estimação!~s~")
		end
	else
		vRP.notify("~r~O teu animal de estimação está demasiado longe!~s~")
	end
end)

RegisterNetEvent("vrp_pets:attachdettach")
AddEventHandler("vrp_pets:attachdettach", function ()
	if not IsPedSittingInAnyVehicle(ped) then
		if isAttached == false then
			attached()
			isAttached = true
		else
			detached()
			isAttached = false
		end
	else
		vRP.notify({"~r~You can\'t attach your pet in a car!~s~"})
	end
end)

RegisterNetEvent("vrp_pets:enterleaveveh")
AddEventHandler("vrp_pets:enterleaveveh", function ()
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
	local coords2 = GetEntityCoords(ped)
	local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, coords2.x,coords2.y,coords2.z,true)
	if not isInVehicle then
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			if distance < 8 then
				attached()
				Wait(200)
				if IsVehicleSeatFree(vehicle, 1) then
					SetPedIntoVehicle(ped, vehicle, 1)
					isInVehicle = true
				elseif IsVehicleSeatFree(vehicle, 2) then
					isInVehicle = true
					SetPedIntoVehicle(ped, vehicle, 2)
				elseif IsVehicleSeatFree(vehicle, 0) then
					isInVehicle = true
					SetPedIntoVehicle(ped, vehicle, 0)
				end 
				vRP.closeMenu()
			else
				vRP.notify({"~r~O teu animal de estimação está demasiado longe do carro!~s~"})
			end
		else
			vRP.notify({"É necessario estares dentro do carro!"})
		end
	else
		if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			SetEntityCoords(ped, coords.x, coords.y, coords.z, 1, 0, 0, 1)
			Wait(100)
			detached()
			isInVehicle = false
			vRP.closeMenu()
		else
			vRP.notify({"Ainda estás dentro de um carro."})
		end
	end
end)

RegisterNetEvent("vrp_pets:findball")
AddEventHandler("vrp_pets:findball", function ()
	object = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 190.0, GetHashKey('w_am_baseball'))
	if DoesEntityExist(object) then 
		balle = true
		objCoords = GetEntityCoords(object)
		TaskGoToCoordAnyMeans(ped, objCoords.x, objCoords.y, objCoords.z, 5.0, 0, 0, 786603, 0xbf800000)
		local GroupHandle = GetPlayerGroup(PlayerId())
		SetGroupSeparationRange(GroupHandle, 1.9)
		SetPedNeverLeavesGroup(ped, false)
	else
		vRP.notify({"Sem bolas restantes"})
	end
end)

RegisterNetEvent("vrp_pets:followme")
AddEventHandler("vrp_pets:followme", function ()
	local coords1 = GetEntityCoords(GetPlayerPed(-1))
	TaskGoToCoordAnyMeans(ped, coords1.x, coords1.y, coords1.z, 5.0, 0, 0, 786603, 0xbf800000)
end)

RegisterNetEvent("vrp_pets:goHome")
AddEventHandler("vrp_pets:goHome", function ()
	local GroupHandle = GetPlayerGroup(PlayerId())
	local coords= GetEntityCoords(GetPlayerPed(-1))
	SetGroupSeparationRange(GroupHandle, 1.9)
	SetPedNeverLeavesGroup(ped, false)
	TaskGoToCoordAnyMeans(ped, coords.x + 40, coords.y, coords.z, 5.0, 0, 0, 786603, 0xbf800000)
	Wait(5000)
	DeleteEntity(ped)
	come = 0
end)
RegisterNetEvent("vrp_pets:seat")
AddEventHandler("vrp_pets:seat", function (method)
	if method == 1 then
		RequestAnimDict('creatures@rottweiler@amb@world_dog_sitting@base')
		while not HasAnimDictLoaded('creatures@rottweiler@amb@world_dog_sitting@base') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base' ,8.0, -8, -1, 1, 0, false, false, false) 
		inanimation = true
	elseif method == 2 then
		RequestAnimDict('creatures@carlin@amb@world_dog_sitting@idle_a')
		while not HasAnimDictLoaded('creatures@carlin@amb@world_dog_sitting@idle_a') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@carlin@amb@world_dog_sitting@idle_a', 'idle_b' ,8.0, -8, -1, 1, 0, false, false, false)
		inanimation = true
	elseif method == 3 then
		RequestAnimDict('creatures@retriever@amb@world_dog_sitting@idle_a')
		while not HasAnimDictLoaded('creatures@retriever@amb@world_dog_sitting@idle_a') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@retriever@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
		inanimation = true
	end
end)

RegisterNetEvent("vrp_pets:laydown")
AddEventHandler("vrp_pets:laydown", function (method)
	if method == 1 then
		RequestAnimDict('creatures@rottweiler@amb@sleep_in_kennel@')
		while not HasAnimDictLoaded('creatures@rottweiler@amb@sleep_in_kennel@') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel' ,8.0, -8, -1, 1, 0, false, false, false)
		inanimation = true
	elseif method == 2 then
		RequestAnimDict('creatures@cat@amb@world_cat_sleeping_ground@idle_a')
		while not HasAnimDictLoaded('creatures@cat@amb@world_cat_sleeping_ground@idle_a') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
		inanimation = true
	elseif method == 3 then
		RequestAnimDict('creatures@coyote@amb@world_coyote_rest@idle_a')
		while not HasAnimDictLoaded('creatures@coyote@amb@world_coyote_rest@idle_a') do
			Wait(0)
		end
		TaskPlayAnim(ped, 'creatures@coyote@amb@world_coyote_rest@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
		inanimation = true
	end
end)

RegisterNetEvent("vrp_pets:standup")
AddEventHandler("vrp_pets:standup", function ()
	ClearPedTasks(ped)
	inanimation = false
end)

function OpenAnimal()
	TriggerServerEvent("vrp_pets:petMenu", status, come, isInVehicle)
end

RegisterNetEvent("vrp_pets:orders")
AddEventHandler("vrp_pets:orders", function (data)
	TriggerServerEvent("vrp_pets:ordersMenu", data, model, inanimation)
end)

Citizen.CreateThread(function()
	while true do
		Wait(30)
		if balle == true then
			local coords1 = GetEntityCoords(GetPlayerPed(-1))
			local coords2 = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(objCoords.x, objCoords.y, objCoords.z, coords2.x, coords2.y, coords2.z, true)
			local distance2 = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, true)
			if distance < 0.5 then
				AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 17188), 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
				TaskGoToCoordAnyMeans(ped, coords1.x, coords1.y, coords1.z, 5.0, 0, 0, 786603, 0xbf800000)
				balle = false
				getball = true
			end
		end
		if getball == true then
			local coords1 = GetEntityCoords(GetPlayerPed(-1))
			local coords2 = GetEntityCoords(ped)
			local distance2 = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, true)
			if distance2 < 1.5 then
				DetachEntity(object,false,false)
				Wait(50)
				SetEntityAsMissionEntity(object)
				DeleteEntity(object)
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BALL"), 1, false, true)
				local GroupHandle = GetPlayerGroup(PlayerId())
				SetGroupSeparationRange(GroupHandle, 999999.9)
				SetPedNeverLeavesGroup(ped, true)
				SetPedAsGroupMember(ped, GroupHandle)
				getball = false
			end
		end
	end
end)

function attached()
	local playerPed = GetPlayerPed(-1)
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 1.9)
	SetPedNeverLeavesGroup(ped, false)
	FreezeEntityPosition(ped, true)
end

function detached()
	local playerPed = GetPlayerPed(-1)
	local GroupHandle = GetPlayerGroup(PlayerId())
	SetGroupSeparationRange(GroupHandle, 999999.9)
	SetPedNeverLeavesGroup(ped, true)
	SetPedAsGroupMember(ped, GroupHandle)
	FreezeEntityPosition(ped, false)
end

function spawnpet()
	RequestModel(model)
	while(not HasModelLoaded(model)) do
		Citizen.Wait(1)
	end
	local playerPed = GetPlayerPed(-1)
	local LastPosition = GetEntityCoords(GetPlayerPed(-1))
	local GroupHandle = GetPlayerGroup(PlayerId())
	RequestAnimDict('rcmnigel1c')
	while not HasAnimDictLoaded('rcmnigel1c') do
		Wait(0)
	end
	TaskPlayAnim(GetPlayerPed(-1), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
	SetTimeout(5000, function() -- 5 secondes
		ped = CreatePed(28, model, LastPosition.x +1, LastPosition.y +1, LastPosition.z -1, 1, 1)
		SetPedAsGroupLeader(playerPed, GroupHandle)
		SetPedAsGroupMember(ped, GroupHandle)
		SetPedNeverLeavesGroup(ped, true)
		SetPedCanBeTargetted(ped, false)
		SetEntityAsMissionEntity(ped, true,true)
		status = math.random(40, 90)
		Wait(5)
		attached()
		Wait(5)
		detached()
	end)
end

Citizen.CreateThread(function()
	while true do
		Wait(math.random(60000, 120000))
		if come == 1 then
			status = status - 1
		end
		if status == 0 then
			TriggerServerEvent('vrp_pets:dead')
			DeleteEntity(ped)
			vRP.notify({"O teu animal de estimação está morto! Da proxima vez lembra-te de lhe dar comida"})
			come = 3
			status = "die"
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0, Keys['F9']) and (GetGameTimer() - GUI.Time) > 150 then
			OpenAnimal()
			GUI.Time = GetGameTimer()
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.PetShop.Pos.x, Config.Zones.PetShop.Pos.y, Config.Zones.PetShop.Pos.z)
	
	SetBlipSprite(blip, Config.Zones.PetShop.Sprite)
	SetBlipDisplay(blip, Config.Zones.PetShop.Display)
	SetBlipScale(blip, Config.Zones.PetShop.Scale)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Loja de Animais")
	EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coord = GetEntityCoords(GetPlayerPed(-1), true)
		if GetDistanceBetweenCoords(coord, Config.Zones.PetShop.Pos.x,Config.Zones.PetShop.Pos.y,Config.Zones.PetShop.Pos.z, false) < 5 then
			DisplayHelpText("Preciona [~g~E~s~] para abrir a loja de animais.")
			if IsControlJustPressed(0, Keys['E']) then
				buy_animal()
			end
		end
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlPressed(0, Keys['E']) and (GetGameTimer() - GUI.Time) > 150 then
				if CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
				CurrentAction = nil
				GUI.Time = GetGameTimer()
			end
		end
	end
end)

--function
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function buy_animal()
	TriggerServerEvent("vrp_pets:buypet")
end


-- Bal


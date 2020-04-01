----------------------------------------------
-- External Vehicle Commands, Made by TheBeast --
----------------------------------------------

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterCommand("trunk", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Багажникът е затворен.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Багажникът е отворен.")
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Багажникът е затворен.")
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Багажникът е отворен.")
            end
        else
            ShowInfo("[Vehicle] ~y~Твърде си далече от автомобила.")
        end
    end
end)

RegisterCommand("hood", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Капакът е затворен.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Капакът е отворен.")
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Капакът е затворен.")
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Капакът е отворен.")
            end
        else
            ShowInfo("[Vehicle] ~y~Твърде си далече от автомобила.")
        end
    end
end)

RegisterCommand("door", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Front Left Door
        door = 0
    elseif args[1] == "2" then -- Front Right Door
        door = 1
    elseif args[1] == "3" then -- Back Left Door
        door = 2
    elseif args[1] == "4" then -- Back Right Door
        door = 3
    else
        door = nil
        ShowInfo("Usage: ~n~~b~/door [door]")
        ShowInfo("~y~Възможни врати:")
        ShowInfo("1(Предна лява), 2(Предна дясна)")
        ShowInfo("3(Задна лява), 4(Задна дясна)")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                TriggerEvent("^*[Vehicle] ~g~Вратата е затворена.")
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                TriggerEvent("^*[Vehicle] ~g~Вратата е отворена.")
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    TriggerEvent("[Vehicle] ~g~Вратата е затворена.")
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    TriggerEvent("[Vehicle] ~g~Вратата е отворена.")
                end
            else
                TriggerEvent("[Vehicle] ~y~Твърде си далече от автомобила.")
            end
        end
    end
end)
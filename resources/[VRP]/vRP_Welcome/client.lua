--[[
    FiveM Scripts
	The Official HackerGeo Script 
	Credits - HackerGeo
	Website - www.HackerGeo.com
	GitHub - GITHUB.com/HackerGeo-sp1ne
	Steam - SteamCommunity.com/id/HackerGeo1
	Copyright 2019 ©HackerGeo. All rights served
]]

------------------------------------------------------WARNING-----------------------------------------------------
---------------------Do not reupload/re release any part of this script without my permission---------------------
------------------------------------------------------------------------------------------------------------------


function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~y~Welcome to Bulgarian Custom RP")
    PushScaleformMovieFunctionParameterString(announcestring)
	PopScaleformMovieFunctionVoid()
    return scaleform
end

Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
    if announcestring then
		scaleform = Initialize("mp_big_message_freemode")
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)

RegisterNetEvent('HG:Welcome')
AddEventHandler('HG:Welcome', function(user_id, faction, name, money, bmoney)
		announcestring = "~y~| ~w~ID: ~y~"..user_id.." ~y~| ~w~Job: ~y~"..faction.." ~y~| ~w~Name: ~y~"..name.." ~y~| ~w~Money: ~y~"..money.." ~y~| ~w~Bank: ~y~"..bmoney.." ~y~|"
        Citizen.Wait(10000)
        announcestring = false
end)

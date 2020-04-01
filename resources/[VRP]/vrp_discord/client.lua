------------------------CREDITS------------------------
--------- Script made by Vlad, DevStudios Owner -------
--      Script made for StreamForce Romania RP       --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("vRP:Discord")
		Citizen.Wait(10000000000000000)
	end
end)

RegisterNetEvent('vRP:Discord-rich')
AddEventHandler('vRP:Discord-rich', function(user_id, faction, name)
SetDiscordAppId(547419109072306187)-- Discord app ID
SetDiscordRichPresenceAsset('logo2') -- PNG file
SetDiscordRichPresenceAssetText('Bulgarian Custom RP') -- PNG text desc
SetRichPresence("[ID:"..user_id.."][Професия:"..faction.."][Име:"..name.. "] - | "..GetNumberOfPlayers().. "/32 |")
end)

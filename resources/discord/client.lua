Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(547419109072306187)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo2')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Custom RP')
       
        --Here you will have to put the image name for the "small" icon.
        --SetDiscordRichPresenceAssetSmall('logo')
		SetRichPresence('Custom Cars & Mods')
        --Here you can add hover text for the "small" icon.
        --SetDiscordRichPresenceAssetSmallText('BG Custom')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
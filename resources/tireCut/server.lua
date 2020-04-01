RegisterServerEvent("SlashTires:TargetClient")
AddEventHandler("SlashTires:TargetClient", function(client, tireIndex)
	TriggerClientEvent("SlashTires:SlashClientTire", client, tireIndex)
end)
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_stationaryRadars")

RegisterServerEvent('chatMessage')
AddEventHandler('chatMessage')



RegisterServerEvent('cobrarMulta')
AddEventHandler('cobrarMulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local multa = 50
	TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 50$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,multa})
end
end)

RegisterServerEvent('cobrarZulta')
AddEventHandler('cobrarZulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local zulta = 150
	TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 150$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,zulta})
end
end)

RegisterServerEvent('cobrarDulta')
AddEventHandler('cobrarDulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local dulta = 250
    TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 250$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,dulta})
end
end)

RegisterServerEvent('cobrarBulta')
AddEventHandler('cobrarBulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local bulta = 350
	TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 300$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,bulta})
end
end)

RegisterServerEvent('cobrarHulta')
AddEventHandler('cobrarHulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local hulta = 450
	TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 450$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,hulta})
end
end)

RegisterServerEvent('cobrarFulta')
AddEventHandler('cobrarFulta', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local fulta = 600
	TriggerEvent("chatMessage", "КАТ", { 255,0,0}, "Вие бяхте глобен 600$ за превишена скорост!")
	if vRP.hasPermission({user_id,"emservice.camera"}) then
        vRPclient._notify(player,{"Вие сте градски служител. Глобата ви се премахва!"})    		
	else
	vRP.tryFullPayment({user_id,fulta})
end
end)
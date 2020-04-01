local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/fix" then
	  local user_id = vRP.getUserId({source})
	  local player = vRP.getUserSource({user_id})
	  --Police Roles
	  if vRP.hasGroup({user_id,"cop"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Deputy Sheriff"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Sheriff"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"K9"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Police Captain"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Police Detective"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Police Lieutenant"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Police Sergeant"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
      elseif vRP.hasGroup({user_id,"State Trooper"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"SWAT"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Chief of Police"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);	  
	  elseif vRP.hasGroup({user_id,"Police Officer"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
		--Other Roles
	  elseif vRP.hasGroup({user_id,"Mafia"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Mechanic"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  --EMS Roles
	  elseif vRP.hasGroup({user_id,"ems"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"EMS Chief"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);	 
	  elseif vRP.hasGroup({user_id,"EMS Paramedic"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"owner"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);			
	  end
	end
end)
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPjb = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
Tunnel.bindInterface("vrp_legal",vRPjb)

TriggerClientEvent("desempregado")
AddEventHandler("desempregado", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Desempregado")
	vRPclient._notify(source,"Agora você é um Desempregado")
  end
end)

TriggerClientEvent("pescador")
AddEventHandler("pescador", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Pescador")
	vRPclient._notify(source, "Agora você é um Pescador")
  end
end)

TriggerClientEvent("taxi")
AddEventHandler("taxi", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Taxi")
	vRPclient._notify(source, "Agora você é um Taxista")
  end
end)

TriggerClientEvent("mecanico")
AddEventHandler("mecanico", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Mecânico")
	vRPclient._notify(source, "Agora você é um Mecânico")
  end
end)

TriggerClientEvent("transportador")
AddEventHandler("transportador", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Transportador de Valores")
	vRPclient._notify(source, "Agora você é um Transportador de Valores")
  end
end)

TriggerClientEvent("onibus")
AddEventHandler("onibus", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Motorista de Ônibus")
	vRPclient._notify(source, "Agora você é um Motorista de Ônibus")
  end
end)

TriggerClientEvent("eletricista")
AddEventHandler("eletricista", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Eletricista")
	vRPclient._notify(source, "Agora você é um Eletricista")
  end
end)

TriggerClientEvent("motoboy")
AddEventHandler("motoboy", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Moto Boy")
	vRPclient._notify(source, "Agora você é um Moto Boy")
  end
end)

TriggerClientEvent("mineradima")
AddEventHandler("mineradima", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Minerador Diamante")
	vRPclient._notify(source, "Agora você é um Minerador de Diamantes")
  end
end)

TriggerClientEvent("mineraouro")
AddEventHandler("mineraouro", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Minerador Ouro")
	vRPclient._notify(source, "Agora você é um Minerador de Ouro")
  end
end)

TriggerClientEvent("mineracobre")
AddEventHandler("mineracobre", function()
  local source = source
  local user_id = vRP.getUserId(source)
  
  if vRP.hasGroup(user_id, "user") then
	vRP.addUserGroup(user_id, "Minerador Cobre")
	vRPclient._notify(source, "Agora você é um Minerador de Cobre")
  end
end)

--[[TriggerClientEvent("cacador")
AddEventHandler("cacador", function()
  local source = source
  local user_id = vRP.getUserId({source})
  
  if vRP.hasGroup({user_id, "user"}) then
	vRP.addUserGroup({user_id, "Caçador"})
	vRPclient._notify(source, {"Agora você é um Caçador"})
  end
end)--]]

--[[TriggerClientEvent("caminhoneiro")
AddEventHandler("caminhoneiro", function()
  local source = source
  local user_id = vRP.getUserId({source})
  
  if vRP.hasGroup({user_id, "user"}) then
	vRP.addUserGroup({user_id, "Caminhoneiro"})
	vRPclient._notify(source, {"Agora você é um Caminhoneiro")
  end
end)--]]



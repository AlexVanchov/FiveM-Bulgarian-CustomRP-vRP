local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local htmlEntities = module("vrp", "lib/htmlEntities")
vRPhk = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_hotkeys")
HKclient = Tunnel.getInterface("vrp_hotkeys","vrp_hotkeys")
Tunnel.bindInterface("vrp_hotkeys",vRPhk)
-- USE FOR NECESSARY SERVER FUNCTIONS

--they need to be the same as the ones in vrp/cfg/phone.lua
--so if the ems service is like "emergency" or "EMS", that service must be in that cfg so it can send a service Alert!
emsServices = {"emergency"}

function vRPhk.test(msg)
  print("msg "..msg.." received from "..source)
  return 42
end

function vRPhk.docsOnline()
  local docs = vRP.getUsersByPermission({"emscheck.revive"})
  return #docs
end


--edit by fenton
function vRPhk.canSkipComa()
  local user_id = vRP.getUserId({source})
  return vRP.hasPermission({user_id,"player.skip_coma"})
end

function vRPhk.helpComa(x,y,z)
  for k,v in pairs(emsServices) do
  vRP.sendServiceAlert({source,v,x,y,z,"Help! I've fallen and can't get up!"}) -- people will change this message anyway haha
  end
end



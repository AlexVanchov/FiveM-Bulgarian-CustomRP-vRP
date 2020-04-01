local Proxy = module("vrp", "lib/Proxy")
local Tunnel =  module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
tHud = {}
Tunnel.bindInterface("vrp_betterhud", tHud)

function tHud.getBasics()
    local user_id = vRP.getUserId(source)
    return vRP.getThirst(user_id), vRP.getHunger(user_id)
end
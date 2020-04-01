--[[
Developed by Leo SHK
Version 1.1
]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatrules")

local cfg = module("vrp_chatrules", "cfg/config")
local cfgcmd = cfg.chatcmd
local cfgrules = cfg.chatgroups
local cfgu = cfg.chatuserdefault
local cfgad = cfg.ad

RegisterServerEvent('chatrules:ad')
AddEventHandler('chatrules:ad', function()
  local r = math.random(1, #cfgad)
  TriggerClientEvent('chatMessage', -1, cfgad[r].display, { cfgad[r].r, cfgad[r].g, cfgad[r].b }, cfgad[r].text)
end)



AddEventHandler('chatMessage', function(source, name, msg)
  CancelEvent()
  local user_id = vRP.getUserId({source})

  if user_id ~= nil then
    vRP.getUserIdentity({user_id, function (identity)
      sm = stringsplit(msg, " ");

      local iscmd = false

      for r=1, #cfgcmd do
        if sm[1] == cfgcmd[r].cmd then
          print(cfgcmd[r].cmd)
          if vRP.hasPermission({user_id,cfgcmd[r].permission}) then
            iscmd = true
            if cfgcmd[r].userdb then
              local dbfirstname = identity.firstname
              local dbname = identity.name
              name = dbfirstname .." "..dbname

            end
            if cfgcmd[r].anonymous then
              name = ""
            end
            TriggerClientEvent('chatMessage', -1, cfgcmd[r].display.." " .. name.." ", { cfgcmd[r].r, cfgcmd[r].g, cfgcmd[r].b }, string.sub(msg,string.len(cfgcmd[r].cmd)+1))
          end
        end
      end

      if string.find(sm[1], "/", 1) and not iscmd then
        table.remove(sm, 1)
        msg = nil
      end

      if not iscmd and msg ~= nil then
        local ing = false
        for v=1, #cfgrules do
          if vRP.hasPermission({user_id,cfgrules[v].permission}) then
            if cfgrules[v].userdb then
              local dbfirstname = identity.firstname
              local dbname = identity.name
              name = dbfirstname .." "..dbname
            end
            ing = true
            TriggerClientEvent('chatMessage', -1, cfgrules[v].display.." " .. name.." ", { cfgrules[v].r, cfgrules[v].g, cfgrules[v].b }, msg)

          end
        end
        if not ing then
          if cfgu.userdb then
            local dbfirstname = identity.firstname
            local dbname = identity.name
            name = dbfirstname .." "..dbname
          end
          TriggerClientEvent('chatMessage', -1, cfgu.display.." " .. name.." ", { cfgu.r, cfgu.g, cfgu.b }, msg)
        end
      end
    end})
  end
end)

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

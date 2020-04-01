--[[              
  /     \  _____     __| _/  ____   \______   \ ___.__.   ____    /     \  _____   _______ |  | __  ____  ________
 /  \ /  \ \__  \   / __ | _/ __ \   |    |  _/<   |  |  /  _ \  /  \ /  \ \__  \  \_  __ \|  |/ /_/ __ \ \___   /
/    Y    \ / __ \_/ /_/ | \  ___/   |    |   \ \___  | (  <_> )/    Y    \ / __ \_ |  | \/|    < \  ___/  /    / 
\____|__  /(____  /\____ |  \___  >  |______  / / ____|  \____/ \____|__  /(____  / |__|   |__|_ \ \___  >/_____ \
		\/      \/      \/      \/          \/  \/                      \/      \/              \/     \/       \/
		
------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--     Script made for Origin Network 24/01/2019     --
--   Copyright 2019 ©oMarkez. All rights reserved    --
--    LICENSE: GNU AFFERO GENERAL PUBLIC LICENSE	 --
-------------------------------------------------------

on_atm
Copyright (C) 2019  oMarkez

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vrpMySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_atm")

vRPSatm = {}
Tunnel.bindInterface("vRP_atm",vRPSatm)
Proxy.addInterface("vRP_atm",vRPSatm)
vRPvRPSatmC = Tunnel.getInterface("vRP_atm","vRP_atm")

--vrpMySQL.createCommand("vRP/get_user_bank_acc","SELECT bankPin FROM vrp_users WHERE id = @user_id")
--vrpMySQL.createCommand("vRP/set_bank_pin","UPDATE vrp_users SET bankPin = @bankPin WHERE id = @user_id")
--vrpMySQL.createCommand("vRP/get_ply_identity", "SELECT firstname, name, user_id FROM vrp_user_identities WHERE user_id = @id")
  
-- Get money
function vRPSatm.getATMMoney()
	thePlayer = source
	user_id = vRP.getUserId({thePlayer})
	local result = MySQL.Sync.fetchAll("SELECT bankPin FROM vrp_users WHERE id = @user_id", {
		['@user_id'] = user_id
	})
	for k,v in pairs(result) do
		plydata = {
			[1] = vRP.getBankMoney({user_id}),
			[2] = vRP.getMoney({user_id}),
			[3] = v.bankPin
		}
	end
	return plydata
end

-- Get user info
function vRPSatm.getUserInfo()
	thePlayer = source
	user_id = vRP.getUserId({thePlayer})
	local result = MySQL.Sync.fetchAll("SELECT firstname,name,user_id FROM vrp_user_identities WHERE user_id = @user_id", {
		['@user_id'] = user_id
	})
	local result2 = MySQL.Sync.fetchAll("SELECT bankPin FROM vrp_users WHERE id = @user_id", {
		['@user_id'] = user_id
	})
	for k,v in pairs(result) do
		for i,p in pairs(result2) do

			print(p.bankPin)

			local atmUserData = {
				[1] = v.firstname, 
				[2] = v.name, 
				[3] = v.user_id,
				[4] = math.floor(vRP.getBankMoney({v.user_id})),
				[5] = math.floor(vRP.getMoney({v.user_id})),
				[6] = p.bankPin
			}

			return atmUserData
		end
	end
end

-- Check item
function vRPSatm.hasAccountSetup()
	thePlayer = source
	user_id = vRP.getUserId({thePlayer})
	
	local result = MySQL.Sync.fetchAll("SELECT bankPin FROM vrp_users WHERE id = @user_id", {
		['@user_id'] = user_id
   	})
	if result ~= nil and result ~= "" and result ~= "0" and result ~= 0 then
		return true
	else
		return false
	end
end

-- Insert money
function vRPSatm.depositBankMoney(amount)
	thePlayer = source
	user_id = vRP.getUserId({thePlayer})

--	print(amount)
--	print(tonumber(amount))
	
	if(tonumber(amount) > 0) and (tonumber(amount))then
		local amount = tonumber(amount)
		local cash = vRP.getMoney({user_id})
		if cash >= amount then
			vRP.setMoney({user_id, cash-amount})
			vRP.giveBankMoney({user_id,amount})
			vRPclient.notify(thePlayer, {"~g~Внесе ".. amount.." лв в ДСК!"})
			local money = vRP.getBankMoney({user_id})
			TriggerClientEvent("vRP:updateBalanceGc", thePlayer, money)
			print("ID: "..user_id.." Deposited "..amount.." leva")
		else
			vRPclient.notify(thePlayer, {"~r~Няма достатъчно пари!"})
		end
	end
end

-- Take money
function vRPSatm.takeBankMoney(amount)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	
	if(tonumber(amount) > 0) and (tonumber(amount))then
		local moneyInPlayer = vRP.getMoney({user_id})
		local money = vRP.getBankMoney({user_id})
			if(tonumber(money-amount)>=0)then
				vRPclient.notify(thePlayer, {"~g~Изтегли: ".. amount.." лв от ДСК"})
				
				--TriggerClientEvent("vRP:updateBalanceGc", thePlayer, money)
				vRP.setBankMoney({user_id, tonumber(money)-tonumber(amount)})
				
				vRP.setMoney({user_id, tonumber(moneyInPlayer)+tonumber(amount)})
				print("ID: "..user_id.." Withdrawed "..amount.." leva")
			end
	else
		vRPclient.notify(thePlayer, {"~g~Нямаш достатъчно пари"})
	end
end

-- Transfer money
function vRPSatm.transferBankMoney(amount, receiver)
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	
	local bankMoney = vRP.getBankMoney({user_id})
	
	if(tonumber(amount) > 0) and (tonumber(amount))then
		if(receiver == user_id)then
			if(tonumber(amount) <= bankMoney)then
				receiver = tonumber(receiver)
				theTarget = vRP.getUserSource({receiver})
				if(theTarget)then
					tBankMoney = vRP.getBankMoney({receiver})
					vRP.setBankMoney({user_id, bankMoney-amount})
					vRP.setBankMoney({receiver, tBankMoney+amount})
					vRP.getUserIdentity({receiver, function(identity)
						vRPclient.notify(thePlayer, {"Du overøte ".. amount.." DKK til ".. identity.firstname.. " ".. identity.name.." ["..receiver.."]"})
						local money = vRP.getBankMoney({user_id})
						TriggerClientEvent("vRP:updateBalanceGc", thePlayer, money)
					end})
					vRP.getUserIdentity({user_id, function(identity)
						vRPclient.notify(theTarget, {"["..user_id.."]".. identity.firstname.. " ".. identity.name.. "oveførte dig "..amount.. " DKK"})
					end})
				else
					vRPclient.notify(thePlayer, {"~r~Player not online"})
				end
			else
				vRPclient.notify(thePlayer, {"~r~Ikke nok penge!"})
			end
		else
			vRPclient.notify(thePlayer, {"~r~Хакер мазеннн"})
		end
	end
end

function vRPSatm.createAcc(pin)
	if pin ~= nil then
		local user_id = vRP.getUserId({source})

		MySQL.Sync.execute("UPDATE vrp_users SET bankPin = @pin WHERE id = @user_id", { 
			['@user_id'] = user_id,
			["@pin"] = pin
		})

		vRPclient.notify(source, {"Честито! Вашата банкова сметка вече е създадена! <br /> PIN: ".. pin})
	else
		vRPclient.notify(source, {"Невалиден ПИН"})
	end
end

function vRPSatm.createAccError()
	local user_id = vRP.getUserId({source})
	vRPclient.notify(source, {"Вашето първо и последно име"})
end

function vRPSatm.loginSubmit(brugernavn,kode)
	print("runs func")
end


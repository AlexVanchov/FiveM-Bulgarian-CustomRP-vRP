local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_legacyfuel")

RegisterServerEvent('LegacyFuel:PayFuel')
AddEventHandler('LegacyFuel:PayFuel', function(price)
	local user_id = vRP.getUserId({source})
	local amount  = round(price, 0)

	vRP.tryPayment({user_id,amount})
end)

local Vehicles = {
	{vmodel = 'nil', plate = 'nil', fuel = 100}
}

RegisterServerEvent('LegacyFuel:UpdateServerFuelTable')
AddEventHandler('LegacyFuel:UpdateServerFuelTable', function(vmodel, plate, fuel)
	local found = false

	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].vmodel == vmodel then 
			found = true
			
			if fuel ~= Vehicles[i].fuel then
				table.remove(Vehicles, i)
				table.insert(Vehicles, {vmodel = vmodel, plate = plate, fuel = fuel})
			end
			break 
		end
	end

	if not found then
		table.insert(Vehicles, {vmodel = vmodel, plate = plate, fuel = fuel})
	end
end)

RegisterServerEvent('LegacyFuel:CheckServerFuelTable')
AddEventHandler('LegacyFuel:CheckServerFuelTable', function(plate, vmodel)
	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].vmodel == vmodel then
			local vehInfo = {vmodel = Vehicles[i].vmodel, plate = Vehicles[i].plate, fuel = Vehicles[i].fuel}
			TriggerClientEvent('LegacyFuel:ReturnFuelFromServerTable', source, vehInfo)
			break
		end
	end
end)

RegisterServerEvent('LegacyFuel:CheckCashOnHand')
AddEventHandler('LegacyFuel:CheckCashOnHand', function()
	local user_id = vRP.getUserId({source})
	local cb 	  = vRP.getMoney({user_id})

	TriggerClientEvent('LegacyFuel:RecieveCashOnHand', source, cb)
end)

function round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

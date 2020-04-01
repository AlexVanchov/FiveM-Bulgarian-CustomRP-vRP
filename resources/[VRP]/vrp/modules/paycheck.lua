local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
	  local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"reporter.paycheck") then
		vRP.giveBankMoney(user_id,3000)
		vRPclient.notifyPicture(source,{"CHAR_YOUTUBE",1,"YouTube",false,"Payday: ~g~$3000"})
	end	

	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveBankMoney(user_id,3000)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3000"})
	end		
	-- EMS Paychecks	
	if vRP.hasPermission(user_id,"emsChief.paycheck") then
		vRP.giveBankMoney(user_id,4000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EMS Department",false,"Payday: ~g~$4000"})
	end
	if vRP.hasPermission(user_id,"emsLieutenant.paycheck") then
		vRP.giveBankMoney(user_id,3500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EMS Department",false,"Payday: ~g~$3500"})
	end
	if vRP.hasPermission(user_id,"emsMedic.paycheck") then
		vRP.giveBankMoney(user_id,3000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EMS Department",false,"Payday: ~g~$3000"})
	end
	if vRP.hasPermission(user_id,"emsSearchRescue.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"EMS Department",false,"Payday: ~g~$2000"})
	end
	-- end EMS Paychecks
	if vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveBankMoney(user_id,1000)
		vRPclient.notifyPicture(source,{"CHAR_LS_CUSTOMS",1,"Repair Company",false,"Payday: ~g~$1000"})
	end
	if vRP.hasPermission(user_id,"Chief.paycheck") then
		vRP.giveBankMoney(user_id,1200)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$1200"})
	end
	if vRP.hasPermission(user_id,"Commander.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"mafia.paycheck") then
		vRP.giveMoney(user_id,5000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Mafia",false,"Stolen money: ~g~$5000"})
	end	
	if vRP.hasPermission(user_id,"Captain.paycheck") then
		vRP.giveBankMoney(user_id,3800)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3800"})
	end
	if vRP.hasPermission(user_id,"Lieutenant.paycheck") then
		vRP.giveBankMoney(user_id,3800)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3800"})
	end
	if vRP.hasPermission(user_id,"Detective.paycheck") then
		vRP.giveBankMoney(user_id,3800)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3800"})
	end
	if vRP.hasPermission(user_id,"Sergeant.paycheck") then
		vRP.giveBankMoney(user_id,3800)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3800"})
	end
	if vRP.hasPermission(user_id,"Deputy.paycheck") then
		vRP.giveBankMoney(user_id,3500)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Police Department",false,"Payday: ~g~$3500"})
	end
	if vRP.hasPermission(user_id,"uber.paycheck") then
		vRP.giveBankMoney(user_id,700)
		vRPclient.notifyPicture(source,{"CHAR_TAXI",1,"UBER",false,"Payday: ~g~$700"})
	end
	if vRP.hasPermission(user_id,"Lawyer.paycheck") then
		vRP.giveBankMoney(user_id,4000)
		vRPclient.notifyPicture(source,{"CHAR_LS_TOURIST_BOARD",1,"Lawyer",false,"Payday: ~g~$4000"})
	end
	if vRP.hasPermission(user_id,"delivery.paycheck") then
		vRP.giveBankMoney(user_id,1000)
		vRPclient.notifyPicture(source,{"CHAR_MP_MORS_MUTUAL",1,"Delivery Company",false,"Payday: ~g~$1000"})
	end
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		vRP.giveBankMoney(user_id,300)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"",false,"Payday: ~g~$300"})
	end
	if vRP.hasPermission(user_id,"SWAT.paycheck") then
		vRP.giveBankMoney(user_id,3500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Police Department",false,"Payday: ~g~$3500"})
	end
	if vRP.hasPermission(user_id,"sheriff.paycheck") then
		vRP.giveBankMoney(user_id,4000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Police Department",false,"Payday: ~g~$4000"})
	end
	if vRP.hasPermission(user_id,"Cadet.paycheck") then
		vRP.giveBankMoney(user_id,3000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Police Department",false,"Payday: ~g~$3000"})
	end
	if vRP.hasPermission(user_id,"trafficguard.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Police Department",false,"Payday: ~g~$2500"})
	end
	-- if vRP.hasPermission(user_id,"santa.paycheck") then
		-- vRP.giveBankMoney(user_id,2000)
		-- vRPclient.notify(source,{"Payday: $2000"})
	-- end
	if vRP.hasPermission(user_id,"bankdriver.paycheck") then
		vRP.giveBankMoney(user_id,700)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Bank Driver",false,"Payday: ~g~$700"})
	end
	if vRP.hasPermission(user_id,"pilot.paycheck") then
		vRP.giveBankMoney(user_id,1300)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Airline Company",false,"Payday: ~g~$1300"})
	end
	if vRP.hasPermission(user_id,"ups.paycheck") then
		vRP.giveBankMoney(user_id,900)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"UPS Company",false,"Payday: ~g~$900"})
	end
	if vRP.hasPermission(user_id,"air.paycheck") then
		vRP.giveBankMoney(user_id,1300)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Airline Company",false,"Payday: ~g~$1300"})
	end
	if vRP.hasPermission(user_id,"trash.paycheck") then
		vRP.giveBankMoney(user_id,500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Trash Collector",false,"Payday: ~g~$500"})
	end
end)

RegisterServerEvent('paycheck:bonus')
AddEventHandler('paycheck:bonus', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.giveBankMoney(user_id,250)
		vRPclient.notifyPicture(source,{"CHAR_FACEBOOK",1,"Facebook Money",false,"Gift for play: ~g~$250"})
	end
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.getMoney(user_id,25)
		vRPclient.notify(source,{"Tax: R$-25"})
	end
end)

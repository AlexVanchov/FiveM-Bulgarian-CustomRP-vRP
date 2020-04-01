---------- VARIABLES ----------


local treatment = false


local timer = false


local blips = {
  {name="Hospital", id=80, x= 338.85, y= -1394.56, z= 31.51, color= 1},
  {name="Hospital", id=80, x= -449.67, y= -340.83, z= 33.50, color= 1},
  {name="Hospital", id=80, x= 477.10494995117, y= -981.83264160156, z= 24.9147605896, color= 1}, --477.10494995117,-981.83264160156,24.9147605896 police
}


---------- FONCTIONS ----------


function Notify(text)
  SetNotificationTextEntry('STRING')
  AddTextComponentString(text)
  DrawNotification(false, false)
end


function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


function ConfigLang(lang)
  local lang = lang
  if lang == "FR" then
    lang_string = {
      text1 = "Appuyer sur ~INPUT_VEH_HORN~ pour être soigné ~r~(~h~~g~500$~r~)",
      text2 = "Le ~h~~g~docteur ~s~va te ~h~~r~soigner~s~, ~h~~b~soit patient~s~.",
      text3 = "Tu n'as pas besoin d'être ~h~~r~soigner~s~.",
      text4 = "Tu as été ~h~~r~soigné~s~.",
      text5 = "Tu as ~h~~r~bougé~s~, le ~h~~g~docteur~s~ n'as pas pu te ~h~~r~soigner~s~ !",
  }

  elseif lang == "EN" then
    lang_string = {
      text1 = "Press ~INPUT_VEH_HORN~ to be treated ~r~(~h~~g~500$~r~)",
      text2 = "The ~h~~g~doctor ~s~will ~h~~r~treat~s~ you, ~h~~b~be patient~s~.",
      text3 = "You don't need ~h~~r~treatment~s~.",
      text4 = "The ~h~~g~doctor ~h~~r~treated~s~ you.",
      text5 = "~h~You have ~h~~r~moved away~s~, the ~h~~g~doctor~s~ could not ~h~~r~heal~s~ you !",
  }
  end
end


---------- CITIZEN ----------

Citizen.CreateThread(function()
  for _, item in pairs(blips) do
    item.blip = AddBlipForCoord(item.x, item.y, item.z)
    SetBlipSprite(item.blip, item.id)
    SetBlipColour(item.blip, item.color)
    SetBlipAsShortRange(item.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(item.name)
    EndTextCommandSetBlipName(item.blip)
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, item in pairs(blips) do
	  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 20 then
        DrawMarker(0, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 2 then
          ShowInfo(lang_string.text1, 0)
          if (IsControlJustPressed(1,38)) and (GetEntityHealth(GetPlayerPed(-1)) < 200) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
            Notify(lang_string.text2)
            treatment = true
          end
        end
      end
      if (IsControlJustPressed(1,38)) and (GetEntityHealth(GetPlayerPed(-1)) == 200) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
        Notify(lang_string.text3)
      end
      if treatment == true then
	    Citizen.Wait(15000)
        timer = true
	  end
      if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
        TriggerServerEvent('hospital:price')
        SetEntityHealth(GetPlayerPed(-1), 200)
        Notify(lang_string.text4)
        treatment = false
        timer = false
      end
      if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) > 2) then
        Notify(lang_string.text5)
        treatment = false
        timer = false            
      end
    end 
  end       
end)

Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
    end

      local hospitalped =  CreatePed(4, 0xd47303ac, 338.85, -1394.56, 31.51, 49.404, false, true)
      SetEntityHeading(hospitalped, 49.404)
      FreezeEntityPosition(hospitalped, true)
      SetEntityInvincible(hospitalped, true)
      SetBlockingOfNonTemporaryEvents(hospitalped, true)
end)


AddEventHandler("playerSpawned", function()
    local lang = "EN"
    ConfigLang(lang)
end)

---------- CREATED BY BOARO ----------


---------- RUINER ISLAND ----------

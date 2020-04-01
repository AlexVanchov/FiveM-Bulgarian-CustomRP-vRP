--===============================================
--= Drug Script- Onlyserenity				 	=
--===============================================

local selling = false
local secondsRemaining = 0
local rejected = false

Citizen.CreateThread(function()
while true do
  if selling then
    Citizen.Wait(1000)
    if(secondsRemaining > 0)then
      secondsRemaining = secondsRemaining - 1
    end
  end

  Citizen.Wait(0)
end
end)

currentped = nil
local has = true
Citizen.CreateThread(function()

while true do
  Wait(0)
  local player = GetPlayerPed(-1)
  local playerloc = GetEntityCoords(player, 0)
  local handle, ped = FindFirstPed()
  local success
  repeat
    success, ped = FindNextPed(handle)
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
    if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
      if DoesEntityExist(ped)then
        if IsPedDeadOrDying(ped) == false then
          if IsPedInAnyVehicle(ped) == false then
            local pedType = GetPedType(ped)
            if pedType ~= 28 and IsPedAPlayer(ped) == false then
              currentped = pos
              if distance <= 4 and ped  ~= GetPlayerPed(-1) and ped ~= oldped then
                if IsControlJustPressed(1, 74) then
                  -- Citizen.Trace("See if wants to buy")
                  if has then
                    oldped = ped
                    SetEntityAsMissionEntity(ped)
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped,true)
                    local random = math.random(1, 12)
                    if random == 3 or random == 7 or random == 11 or random == 5 then
                      exports.pNotify:SetQueueMax("left", 1)
                      exports.pNotify:SendNotification({
                        text = "Ми неще дрога",
                        type = "error",
                        timeout = math.random(300, 3500),
                        layout = "centerLeft",
                        queue = "left"
                      })
                      selling = false
                      SetEntityAsMissionEntity(ped)
                      SetPedAsNoLongerNeeded(ped)
                      local randomReport = math.random(1, 5)
						if randomReport == 3 then
						  local plyPos = GetEntityCoords(GetPlayerPed(-1))
						  TriggerServerEvent('vRP_drugNPC:policia',plyPos.x, plyPos.y, plyPos.z)
						end
                    elseif random ~= 3 or random ~= 7 or random ~= 11 or random ~= 5 then
                      TaskStandStill(ped, 9.0)
                      pos1 = GetEntityCoords(ped)
                      TriggerEvent("currentlySelling")
					  TriggerServerEvent('drugs:item')
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  until not success
  EndFindPed(handle)
end
end)

local blah = false
Citizen.CreateThread(function()

while true do
  Wait(0)
  local player = GetPlayerPed(-1)

  if selling then
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Negotiating: ~b~" .. secondsRemaining .. "~w~ seconds remaining", 255, 255, 255, 255)
    local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance > 6 then
      exports.pNotify:SetQueueMax("left", 1)
      exports.pNotify:SendNotification({
        text = "Sale Canceled: You're far away now.",
        type = "error",
        timeout = math.random(100, 3500),
        layout = "centerLeft",
        queue = "left"
      })
      selling = false

      SetEntityAsMissionEntity(oldped)
      SetPedAsNoLongerNeeded(oldped)
    end
    if secondsRemaining == 0 then
      blah = true
      local pid = PlayerPedId()
      SetEntityAsMissionEntity(oldped)
      RequestAnimDict("amb@prop_human_bum_bin@idle_b")
      while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
        TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
        Wait(750)
        StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
        SetPedAsNoLongerNeeded(oldped)
      end
    end
    if rejected then
      drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Person ~r~rejected ~w~your offer ~r~", 255, 255, 255, 255)
    end
  end
  end)

  Citizen.CreateThread(function()

  while true do
    Wait(0)
    if blah then
      TriggerServerEvent('drugs:money')
      blah = false
      selling = false
    end
  end
  end)



  RegisterNetEvent('currentlySelling')
  AddEventHandler('currentlySelling', function()
  selling = true
  secondsRemaining = 10
  end)

  RegisterNetEvent('cancel')
  AddEventHandler('cancel', function()
  blah = false
  end)

  RegisterNetEvent('done')
  AddEventHandler('done', function()
  selling = false

  secondsRemaining = 0

  end)

  function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
  end

  function DrawSpecialText(m_text)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(250, 1)
  end


  function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
  end

  RegisterNetEvent('nomore')
  AddEventHandler('nomore', function()
  has = false
  end)


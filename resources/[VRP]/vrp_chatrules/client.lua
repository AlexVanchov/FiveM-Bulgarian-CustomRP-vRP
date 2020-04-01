
local adon = true
local adtime = 5 -- minutes

if adon then
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(adtime * 60000)
      TriggerServerEvent('chatrules:ad')
    end
  end)
end

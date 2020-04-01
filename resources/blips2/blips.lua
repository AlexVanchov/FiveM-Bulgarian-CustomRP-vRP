
local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
-- Postes de polices
{title="Дървар", colour=21, id=285, x=-582.984375, y=5359.9150390625, z=70.242919921875},  -- -582.984375,5359.9150390625,70.242919921875
{title="Дървар", colour=21, id=285, x=-580.0170288086, y=5276.4233398438, z=70.264877319336},  -- -580.0170288086,5276.4233398438,70.264877319336
{title="Дървар", colour=21, id=285, x=-497.21310424804, y=5299.390625, z=80.610038757324}  -- -497.21310424804,5299.390625,80.610038757324
}

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 1.0)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
  {title="San Andreas Gang", colour=84, id=441, x=1365.5704345703, y=-577.87469482422, z=74.380264282227},
  {title="Vagos Gang", colour=84, id=441, x=333.71691894531, y=-2037.8930664063, z=21.097738265991},
  {title="Mafia Соленцево", colour=47, id=84, x=-1805.7919921875, y=433.7053527832, z=138.06114196777}, -- -1805.7919921875,433.7053527832,138.06114196777
  {title="Rich Gang", colour=84, id=441, x=-927.61187744141, y=175.60478210449, z=66.497741699219},  -- -927.61187744141,175.60478210449,66.497741699219
  {title="Factory Gang", colour=84, id=441, x=1155.3002929688, y=-1326.6574707031, z=34.731269836426}  -- 1155.3002929688,-1326.6574707031,34.731269836426
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
-- Postes de polices
{title="Zone", colour=2, id=1, x=1365.5704345703, y=-577.87469482422, z=74.380264282227},
{title="Zone", colour=2, id=1, x=333.71691894531, y=-2037.8930664063, z=21.097738265991},
{title="Mafia Zone", colour=1, id=1, x=-1805.7919921875, y=433.7053527832, z=138.06114196777},
{title="Zone", colour=2, id=1, x=-927.61187744141, y=175.60478210449, z=66.497741699219},
{title="Zone", colour=2, id=1, x=1155.3002929688, y=-1326.6574707031, z=34.731269836426}
}

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 3.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Тунинг Сервиз", colour=75, id=72, x=-210.4983215332, y=-1317.3449707031, z=43.427940368652}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Тунинг Сервиз", colour=42, id=72, x=732.64373779297, y=-1089.0834960938, z=29.699953079224}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Тунинг Сервиз", colour=42, id=72, x=-336.18408203125, y=-137.22038269043, z=60.444530487061}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Тунинг Сервиз", colour=42, id=72, x=-1155.6254882813, y=-2007.1301269531, z=18.504007339478}
  } 

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	{title="Тунинг Сервиз", colour=42, id=72, x=1178.8117675781, y=2638.3559570313, z=44.118740081787}
  } 

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices 
	{title="Тунинг Сервиз", colour=42, id=72, x=110.12259674072, y=6627.2524414063, z=31.787244796753}
  } 

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices 
	{title="Летище", colour=26, id=43, x=-1454.3540039063, y=-2482.4790039063, z=31.787244796753}
  } 

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
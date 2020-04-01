local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
    {title="Radar", colour=4, id=184, x = -35.008335113526, y = -949.56164550782,z = 31.043756484986},
    {title="Radar", colour=4, id=184, x = 101.77703094482, y = -997.90447998046, z = 31.47999382019},
    {title="Radar", colour=4, id=184, x = 219.91159057618, y = -1039.9711914062, z = 29.46908378601},
    {title="Radar", colour=4, id=184, x = 398.1968383789, y = -1050.1112060546, z = 29.766105651856},
    {title="Radar", colour=4, id=184, x = -95.480522155762, y = -1136.4268798828, z = 25.827877044678},
    {title="Radar", colour=4, id=184, x = 781.53332519532, y = -1005.6907348632, z = 26.386632919312},
    {title="Radar", colour=4, id=184, x = 2064.2553710938, y = 3720.2802734375, z = 34.794765472412},
    {title="Radar", colour=4, id=184, x = 1855.7980957032, y = 3728.7204589844, z = 34.73433303833},
    {title="Radar", colour=4, id=184, x = 153.47106933594, y = 6527.2553710938, z = 33.422611236572},
    {title="Radar", colour=4, id=184, x = -176.1208190918, y = 6479.8413085938, z = 31.28803062439},
    {title="Radar", colour=4, id=184, x = -2719.9423828125, y = 2285.7397460938, z = 20.502052307128},
    {title="Radar", colour=4, id=184, x = -806.75518798828, y = 1342.7818603516, z = 254.78994750976},
    {title="Radar", colour=4, id=184, x = 2206.5444335938, y = 6042.3779296875, z = 52.099006652832},
    {title="Radar", colour=4, id=184, x = 1994.3084716796, y = 6234.48046875, z = 46.35856628418},
    {title="Radar", colour=4, id=184, x = 1952.263305664, y = 6218.712890625, z = 44.4587059021},
    {title="Radar", colour=4, id=184, x = -2173.5979003906, y = -347.05169677734, z = 13.180083274842},
    {title="Radar", colour=4, id=184, x = -1113.5874023438, y = 2666.4626464844, z = 19.769708633422}
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
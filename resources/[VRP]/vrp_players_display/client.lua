Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local jucatori = 0
		for i = 0, 31 do
		    if NetworkIsPlayerActive(i) then
		        jucatori = jucatori+1
		    end
		end
		jucatori_hud(0.505, 0.85, 1.0,1.0,0.75, "~w~Играчи на линия:~y~ "..jucatori, 255, 255, 255, 255)
	end
end)

function jucatori_hud(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
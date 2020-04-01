-- Customizable Variables
MAX_INCREASE = 1.5 -- Maximum increase in temperature between time changes
MIN_INCREASE = 0.2 -- Minimum increase in temperature between time changes
RAND_FLUC = 0.2 -- How much the temperature will fluctuate when equal to the Min or Max temperature
START_INCREASE_HR = 4 -- When the temperature will start increasing based on the time of day (4 am is default)
STOP_INCREASE_HR = 16 -- When the temperature will stop increasing based on the time of day (4 pm is default)

-- First value in array is Max and Min temp for Jan. Second is for Feb. and so on
MonthData = {
	{36, 20}, -- January
	{41, 24}, -- February
	{53, 34}, -- March
	{65, 43}, -- April
	{75, 54}, -- May
	{82, 61}, -- June
	{86, 66}, -- July
	{85, 64}, -- August
	{78, 58}, -- September
	{66, 46}, -- October
	{53, 37}, -- November
	{43, 28}, -- December
}

 -- DO NOT CHANGE --
AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}


Citizen.CreateThread(function()
	local init_hr = GetClockHours()
	local weather = Citizen.InvokeNative(0x564B884A05EC45A3)
	local init_w = getWeatherStringFromHash(weather)
	local init_m = GetClockMonth()

	temp = calcTemp( init_w, init_m, init_hr )
	while true do
		Wait(1)
			local years = GetClockYear()
			local months = GetClockMonth()
			local days = GetClockDayOfWeek()
			local hours = GetClockHours()
			local minutes = GetClockMinutes()
			local seconds = GetClockSeconds()
			local weather = Citizen.InvokeNative(0x564B884A05EC45A3)
			local w = getWeatherStringFromHash(weather)
			
			if (hours ~= init_hr or w ~= init_w) then
				temp = calcTemp( w, months, hours )
				init_hr = hours
				init_w = w
			end
	end
end)

Citizen.CreateThread(function()
		Citizen.Wait(1000)
	while true do
		Citizen.Wait(1)
		drawTxt(0.675, 1.384, 1.0,1.0,0.45, "~r~Temp: ~y~" .. string.format("%0.1f", tostring(temp)) .. " °F  |  " .. string.format("%0.1f", tostring(FtoC(temp))) .. " °C", 185, 185, 185, 255)
	end
end)

function getWeatherStringFromHash( hash )
	local w = '?'
	for i = 1, # AvailableWeatherTypes, 1 do
		if hash == GetHashKey(AvailableWeatherTypes[i]) then
			w = AvailableWeatherTypes[i]
		end
	end
	return w
end

function calcTemp( weth, mth, hr )
	local Max = MonthData[mth][1]
	local Min = MonthData[mth][2]
	local AbsMax
	local AbsMin
	local curTemp
	
	if weth == 'SNOW' or weth == 'BLIZZARD' or weth == 'SNOWLIGHT' or weth == 'XMAS' then
		AbsMax = 32 -- Using just below 32 since the temp will fluctuate by about 5
		AbsMin = -20
	elseif weth == 'EXTRASUNNY' then
		AbsMax = Max + 20
		AbsMin = Min + 20
	elseif weth == 'SMOG' then
		AbsMax = Max + 10
		AbsMin = Min + 10
	elseif weth == 'FOGGY' or weth == 'CLOUDS' or weth == 'THUNDER' or weth == 'HALLOWEEN' then
		AbsMax = Max - 10
		AbsMin = Min - 10
	else
		AbsMax = Max
		AbsMin = Min
	end
	
	curTemp = randf(AbsMin, AbsMax)
	
	if (hr >= START_INCREASE_HR and hr < STOP_INCREASE_HR) then
		if curTemp >= AbsMax then
			curTemp = AbsMax + randf(-RAND_FLUC, RAND_FLUC)
		else
			curTemp = curTemp + randf(MIN_INCREASE, MAX_INCREASE)
		end
	else
		if curTemp <= AbsMin then
			curTemp = AbsMin + randf(-RAND_FLUC, RAND_FLUC)
		else
			curTemp = curTemp - randf(MIN_INCREASE, MAX_INCREASE)
		end
	end
	return curTemp
end

function genSeed()
	return (GetClockYear() + GetClockMonth() + GetClockDayOfWeek())
end

function randf(low, high)
	math.randomseed(GetClockDayOfMonth() + GetClockYear() + GetClockMonth() + GetClockHours())
    return low	 + math.random()  * (high - low);
end

local disabled = false
AddEventHandler("showHud", function(show)
	disabled = not show
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(4)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function FtoC( f )
	return ((f - 32) * (5 / 9))
end
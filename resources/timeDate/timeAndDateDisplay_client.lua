local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = false

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = ""
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. "~b~ " .. hour .. ":" .. minute .. " |"
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " "
		end
		if displayDate == true then
			CalculateDateToDisplay()
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end
		
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.30, 0.30)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextWrap(0,0.95)
		SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.173, 0.83)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()
	
	if dayOfWeek == 0 then
		dayOfWeek = "Неделя"
	elseif dayOfWeek == 1 then
		dayOfWeek = "Понеделник"
	elseif dayOfWeek == 2 then
		dayOfWeek = "Вторник"
	elseif dayOfWeek == 3 then
		dayOfWeek = "Сряда"
	elseif dayOfWeek == 4 then
		dayOfWeek = "Четвъртък"
	elseif dayOfWeek == 5 then
		dayOfWeek = "Петък"
	elseif dayOfWeek == 6 then
		dayOfWeek = "Събота"
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()
	
	if month == 0 then
		month = "Януари"
	elseif month == 1 then
		month = "Февруари"
	elseif month == 2 then
		month = "Март"
	elseif month == 3 then
		month = "Април"
	elseif month == 4 then
		month = "Май"
	elseif month == 5 then
		month = "Юни"
	elseif month == 6 then
		month = "Юли"
	elseif month == 7 then
		month = "Август"
	elseif month == 8 then
		month = "Септември"
	elseif month == 9 then
		month = "Октомври"
	elseif month == 10 then
		month = "Ноември"
	elseif month == 11 then
		month = "Декември"
	end
end

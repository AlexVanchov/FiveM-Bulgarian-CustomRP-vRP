--DarkWeb Message
RegisterCommand("dw", function(source, args, raw)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "^0[^1Dark^7Web:^0] ^3[^1SECRET^3]", { 30, 144, 255 }, message)
end)

--112 Message
RegisterCommand("112", function(source, args, raw)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
    TriggerClientEvent('chatMessage', -1, "^0[^3112:^0] ^2[^1" .. GetPlayerName(source) .."^2]", { 30, 144, 255 }, message)
end)

--Dispatch Message
RegisterCommand("dispatch", function(source, args, raw)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "^0[^4Dispatch:^0] ^0[^3" .. GetPlayerName(source) .."^0]", { 30, 144, 255 }, message)
end)

--OOC Message
RegisterCommand("ooc", function(source, args, raw)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "^0[^3Out^2Of^1RP:^0] ^5[^2" .. GetPlayerName(source) .."^5]", { 128, 128, 128 }, message)
end)

--fb Message
RegisterCommand("fb", function(source, args, raw)
    if #args <= 0 then return end
    local message = table.concat(args, " ")
	TriggerClientEvent('chatMessage', -1, "^0[^4Facebook^0]: ^4[^0" .. GetPlayerName(source) .."^4]", { 128, 128, 128 }, message)
end)

--Chat Proximity
AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = GetPlayerName(source)
	TriggerClientEvent("sendProxMsg", -1, source, name, message)
    end
    CancelEvent()
end)

--Function
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

--Console Message
 print "Putki vash sum!"
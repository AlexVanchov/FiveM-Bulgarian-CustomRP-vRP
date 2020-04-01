AddEventHandler('chatMessage', function(source, n, msg)
    local args = stringsplit(msg, ' ')
        
    if string.lower(args[1]) == "/emotes" then
        TriggerClientEvent("emote:display", source)
        CancelEvent()
    elseif string.lower(args[1]) == "/emote" then
        if args[2] ~= nil then
            TriggerClientEvent("emote:invoke", source, args[2])
        else
            TriggerClientEvent("chatMessage", source, "ERROR", {255,0,0}, "^7Use \"^3/emotes^7\" to display all of the emotes")
        end
        CancelEvent()
    elseif string.lower(args[1]) == "/cancelemote" then
        TriggerClientEvent("emote:cancelnow", source)
        CancelEvent()
    end
end)
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

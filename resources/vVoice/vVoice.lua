local voiceChatProximity = "veryclose" -- default: veryclose
-- valid options are: veryclose, close, nearby, distant, far, veryfar, global.
local voiceEnabled = true
local allowProximityChange = true -- Allow people to change the chat proximity using /voice distance <proximity>
local allowVoiceToggle = true -- Allow people to disable voice chat for themseleves using /voice toggle



















----------------- CODE DON'T TOUCH!!!! ---------------------

RegisterCommand("voice", function(source, args, rawCommand)
    if args[1] == "toggle" then
        if allowVoiceToggle then
            voiceEnabled = not voiceEnabled
            TriggerEvent('chatMessage', '', {255,255,255}, "^4Voice Chat is " .. (voiceEnabled == true and "^2enabled" or "^8disabled") .. "^4.")
        else
            TriggerEvent('chatMessage', '', {255,255,255}, "^4The ability to toggle voice chat is disabled, disable voice chat in your GTA V settings instead.")
        end
    elseif args[1] == "distance" then
        if allowProximityChange then
            if args[2] == "veryclose" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "close" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "nearby" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "distant" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "far" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "veryfar" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "global" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            else
                sendUsageMessage()
            end
        else
            TriggerEvent('chatMessage', '', {255,255,255}, "^4The ability to change the proximity has been disabled, contact the server owner if you believe that this is an error.")
        end
    else
        sendUsageMessage()
    end
end)

function sendUsageMessage()
    TriggerEvent('chatMessage', '', {255,255,255}, "^8Usage: ^0/voice [toggle|distance] <veryclose, close, nearby, distant, far, veryfar, global>")
end

local prox = 0.01

RegisterNetEvent("changeProximity")
AddEventHandler('changeProximity', function(vprox)
    if vprox == "veryclose" then
        prox = 25.01
    elseif vprox == "close" then
        prox = 75.01
    elseif vprox == "nearby" then
        prox = 200.01
    elseif vprox == "distant" then
        prox = 500.01
    elseif vprox == "far" then
        prox = 2500.01
    elseif vprox == "veryfar" then
        prox = 8000.01
    elseif vprox == "global" then
        prox = 0.00
    end
end)

function getProximity()
    if voiceChatProximity == "veryclose" then
        prox = 25.01
    elseif voiceChatProximity == "close" then
        prox = 75.01
    elseif voiceChatProximity == "nearby" then
        prox = 200.01
    elseif voiceChatProximity == "distant" then
        prox = 500.01
    elseif voiceChatProximity == "far" then
        prox = 2500.01
    elseif voiceChatProximity == "veryfar" then
        prox = 8000.01
    elseif voiceChatProximity == "global" then
        prox = 0.00
    end
end
getProximity()

function displayText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 1.0)
    SetTextScale(1.0, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandDisplayText("STRING") -- old: SetTextEntry()
    AddTextComponentSubstringPlayerName(text) -- old: AddTextComponentString
    EndTextCommandDisplayText(posx, posy) -- old: DrawText()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        NetworkSetTalkerProximity(prox)
        NetworkClearVoiceChannel()
        NetworkSetVoiceActive(voiceEnabled)
        local playersTalking = {'empty'}
        if voiceEnabled then
            local count = 1
            for i=0,31 do
                if NetworkIsPlayerTalking(i) then
                    playersTalking[count] = GetPlayerName(i)
                    count = count + 1
                end
            end
            if playersTalking[1] ~= "empty" then
                displayText("Сега говори:", 0, 255, 255, 255, 255, 0.5, 0.0)
                count = 0
                for k,v in pairs(playersTalking) do
                    displayText("~f~" .. v, 0, 255, 255, 255, 255, 0.5, 0.025 + (0.025*(count)))
                    count = count + 1
                end
            end
        end
    end
end)
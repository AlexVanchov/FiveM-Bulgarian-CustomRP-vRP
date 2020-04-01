-- more emotes available at https://pastebin.com/6mrYTdQv
local emotes = {
    ['smoke'] = "WORLD_HUMAN_SMOKING",
    ['cop'] = "WORLD_HUMAN_COP_IDLES",
    ['lean'] = "WORLD_HUMAN_LEANING",
    ['sit'] = "WORLD_HUMAN_PICNIC",
    ['stupor'] = "WORLD_HUMAN_STUPOR",
    ['sunbathe2'] = "WORLD_HUMAN_SUNBATHE_BACK",
    ['sunbathe'] = "WORLD_HUMAN_SUNBATHE",
    ['medic'] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
    ['clipboard'] = "WORLD_HUMAN_CLIPBOARD",
    ['party'] = "WORLD_HUMAN_PARTYING",
    ['kneel'] = "CODE_HUMAN_MEDIC_KNEEL",
    ['notepad'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
    ['weed'] = "WORLD_HUMAN_SMOKING_POT",
    ['impatient'] = "WORLD_HUMAN_STAND_IMPATIENT",
    ['fish'] = "WORLD_HUMAN_STAND_FISHING",
    ['weld'] = "WORLD_HUMAN_WELDING",
    ['photography'] = "WORLD_HUMAN_PAPARAZZI",
    ['film'] = "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
    ['cheer'] = "WORLD_HUMAN_CHEERING",
    ['binoculars'] = "WORLD_HUMAN_BINOCULARS",
    ['flex'] = "WORLD_HUMAN_MUSCLE_FLEX",
    ['weights'] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
    ['yoga'] = "WORLD_HUMAN_YOGA"
}

--[[------------------------------------------------------------------------------------------------

                    DON'T TOUCH BELOW THIS UNLESS YOU KNOW WHAT YOU ARE DOING

------------------------------------------------------------------------------------------------]]--

-- Draws a simple notification
function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Registering all of the events called by the server
RegisterNetEvent("emote:invoke")
RegisterNetEvent("emote:cancelnow")
RegisterNetEvent("emote:display")

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1)) -- Registering whether or not the player is in an active scenario


function cancelEmote() -- Cancels the emote slowly
    ClearPedTasks(GetPlayerPed(-1))
    emotePlaying = false
end
function cancelEmoteNow() -- Cancels the emote immediately
    ClearPedTasksImmediately(GetPlayerPed(-1))
    emotePlaying = false
end

function displayEmotes()
    local index = 0 -- Current index
    local display = "^7" -- Text to display

    for name, value in pairs(emotes) do -- Adding the emote names to the display var
        index = index + 1
        if index == 1 then
            display = display..name
        else
            display = display..", "..name
        end
    end

    TriggerEvent("chatMessage", "EMOTES", {255,0,0}, "") -- Saying "EMOTES:" in red
    TriggerEvent("chatMessage", "", {0,0,0}, display) -- Displaying the emotes in white
end
function playEmote(emoteDic) -- Plays an emote from the given name dictionary
    if not DoesEntityExist(GetPlayerPed(-1)) then -- Return of the ped doesn't exist
        return false
    end

    if IsPedInAnyVehicle(GetPlayerPed(-1)) then -- Returns if the player is in any vehicle
        drawNotification("~r~You must leave the vehicle first")
        return false
    end

    local pedHoldingWeapon = IsPedArmed(GetPlayerPed(-1), 7)
    if pedHoldingWeapon then -- If the player is holding weapon, remove it
        SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263, true)
        drawNotification("Please put away your weapon first next time!")
    end

    TaskStartScenarioInPlace(GetPlayerPed(-1), emoteDic, 0, true) -- Start the scenario
    emotePlaying = true
    return true
end

AddEventHandler("emote:invoke", function(name)
    if emotes[name] ~= nil then -- Checking if the name is in the dictionary
        if playEmote(emotes[name]) then -- Playing the emote from the dictionary
            drawNotification("Playing the emote \""..name.."\"")
        end
    else
        TriggerEvent("chatMessage", "ERROR", {255,0,0}, "Invalid emote name") -- Saying if the name wasn't in the dictionary
    end
end)
AddEventHandler("emote:display", function()
    displayEmotes() -- Displays all of the emotes
end)
AddEventHandler("emote:cancelnow", function()
    cancelEmoteNow() -- Cancels the emote immediately
end)

Citizen.CreateThread(function()
    while true do

        if emotePlaying then
            if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
                cancelEmote() -- Cancels the emote if the player is moving
            end
        end

        Citizen.Wait(0)
    end
end)
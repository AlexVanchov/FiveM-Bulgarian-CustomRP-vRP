--[[
    vrp_ladderhud
    Copyright C 2018  MarmotaGit
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local thirst, hunger = 0, 0

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(100)
        SendNUIMessage({
            show = IsPauseMenuActive(),
            thirst = thirst,
            hunger = hunger
        })
    end
end)

RegisterNetEvent("vrp_ladderhud:updateBasics")
AddEventHandler("vrp_ladderhud:updateBasics", function(rHunger, rThirst)
    hunger, thirst = rHunger, rThirst
end)
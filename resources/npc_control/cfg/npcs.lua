--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

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

cfg = {}

cfg.density = {
	peds = 0.001,
	vehicles = 0.001
}
--[[
cfg.peds = { -- these peds wont show up anywhere, they will be removed and their vehicles deleted
  "s_m_y_cop_01",
  "s_f_y_sheriff_01",
  "s_m_y_sheriff_01",
  "s_m_y_hwaycop_01",
  "s_m_y_swat_01",
  "s_m_m_snowcop_01",
  "s_m_m_paramedic_01",
  "s_m_y_ranger_01",
  "s_f_y_ranger_01",
  "g_f_y_families_01",
  "famdd_01",
  "g_m_y_famca_01",
  "s_f_y_cop_01",
  "s_m_y_dealer_01",
  "doaman",
  "s_m_m_ciasec_01",
  "clay",
  "g_m_m_chicold_01",
  "casey",
  "s_m_y_blackops_01",
  "s_m_y_blackops_02",
  "s_m_y_blackops_03",
  "s_m_m_bouncer_01",
  "g_m_y_ballaeast_01",
  "g_m_y_ballaorig_01",
  "ballasog",
  "g_m_y_ballasout_01"

}]]

cfg.noguns = { -- these peds wont have any weapons
}

cfg.nodrops = { -- these peds wont drop their weapons when killed
}


-- WORK IN PROGRESS // DOES NOT WORK
cfg.vehs = { -- these vehicles wont show up anywhere, they will be removed unless a player is in the driver seat
  "police",
  "policet",
  "sheriff",
  "fbi",
  "pranger",
  "riot",
  "pbus"
}
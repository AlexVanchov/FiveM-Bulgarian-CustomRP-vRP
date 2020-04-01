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

--      height: 50px;
--      width: 50px;
--	  top: 180px;
--      right: 20px;

--  top: 155px;
--  right: 20px;
--  font-size: 20px;
-- 240
-- 270

local cfg = {}

cfg.firstjob = false -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
.div_job{
  position: absolute;
  top: 150px;
  right: 20px;
  font-size: 20px;
  font-weight: bold;
  font-style: italic;
  color: white;
  text-shadow: 3px 3px 2px rgba(0, 0, 0, 0.80);
}
]]

-- icon display css
cfg.icon_display_css = [[
.div_job_icon{
  position: absolute;
}
]]

-- list of ["group"] => css for icons
cfg.group_icons = {
  ["Police Officer"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Police UnderCover"] = [[
    .div_job_icon{
      content: url(https://imgur.com/mvGAL20.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Police Captain"] = [[
    .div_job_icon{
      content: url(https://imgur.com/FA2AfIf.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["SWAT"] = [[
    .div_job_icon{
      content: url(https://imgur.com/74ujFr7.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Agent FBI"] = [[
    .div_job_icon{
      content: url(https://imgur.com/wBRfNaD.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Police Sergeant"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Police Detective"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Cadet"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["State Trooper"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Deputy Sheriff"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Police Lieutenant"] = [[
    .div_job_icon{
      content: url(https://imgur.com/wkRXkJe.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Dispatcher"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Chief of Police"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Erch26X.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Sheriff"] = [[
    .div_job_icon{
      content: url(https://imgur.com/wpmLqcM.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Fisher"] = [[
    .div_job_icon{
      content: url(https://imgur.com/NZqhlak.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Cargo Pilot"] = [[
    .div_job_icon{
      content: url(https://imgur.com/srmr2ZH.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Delivery"] = [[
    .div_job_icon{
      content: url(https://imgur.com/NXjU4YC.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Fan Courier"] = [[
    .div_job_icon{
      content: url(https://imgur.com/NXjU4YC.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Medical Transport"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Mb1EyZb.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Airline Pilot"] = [[
    .div_job_icon{
      content: url(https://imgur.com/zx0Lh2U.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Weapons Smuggler"] = [[
    .div_job_icon{
      content: url(https://imgur.com/2iMA2Ys.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["EMS Chief"] = [[
    .div_job_icon{
      content: url(https://imgur.com/KhhGjZA.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["EMS Paramedic"] = [[
    .div_job_icon{
      content: url(https://imgur.com/ipRqg4f.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["EMS Lieutenant"] = [[
    .div_job_icon{
      content: url(https://imgur.com/KhhGjZA.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["EMS Search and Rescue"] = [[
    .div_job_icon{
      content: url(https://imgur.com/UHTCeuA.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
    ["Bounty Hunter"] = [[
    .div_job_icon{
      content: url(https://imgur.com/BrHTyVN.png);
      height: 80px;
      width: 80px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Mechanic"] = [[
    .div_job_icon{
      content: url(https://imgur.com/JZiYJVc.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Forger"] = [[
    .div_job_icon{
      content: url(https://imgur.com/NiK0A6v.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["UBER"] = [[
    .div_job_icon{
      content: url(https://imgur.com/4lwNwkm.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Unemployed"] = [[
    .div_job_icon{
      content: url(https://cdn2.iconfinder.com/data/icons/mixed-rounded-flat-icon/512/briefcase-512.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Trash Collector"] = [[
    .div_job_icon{
      content: url(https://imgur.com/deGxeWT.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Lawyer"] = [[
    .div_job_icon{
      content: url(https://imgur.com/K0CQXbA.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Bankdriver"] = [[
    .div_job_icon{
      content: url(https://imgur.com/Q541aRG.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Drug Dealer"] = [[
    .div_job_icon{
      content: url(https://imgur.com/XeXAFsr.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Hacker"] = [[
    .div_job_icon{
      content: url(https://imgur.com/MIkf9nd.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Judge"] = [[
    .div_job_icon{
      content: url(https://imgur.com/KASiV3L.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Pizza"] = [[
    .div_job_icon{
      content: url(https://imgur.com/oGERpi4.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Mushroom Science"] = [[
    .div_job_icon{
      content: url(https://imgur.com/6QQEZIz.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
    ["Hooker"] = [[
    .div_job_icon{
      content: url(http://icons.iconarchive.com/icons/th3-prophetman/gta/256/Hooker-icon.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Builder"] = [[
    .div_job_icon{
      content: url(https://imgur.com/WqE090t.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],
  ["Poacher"] = [[
    .div_job_icon{
      content: url(https://imgur.com/JK6fWo2.png);
      height: 50px;
      width: 50px;
	  top: 175px;
      right: 20px;
    }
  ]],-- this is an example, add more under it using the same model, leave the } at the end.
}
return cfg


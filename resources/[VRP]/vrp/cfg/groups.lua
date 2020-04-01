
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["owner"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are Owner."}) end},
    "player.group.add",
	"admin.godmode",
	"nike.cloakroom",
    "player.group.remove",
    "player.givemoney",
	"player.blips",
	"create.biz",
	"holdup.police",
    "player.giveitem"
  },
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are Superadmin."}) end},
    "player.group.add",
	"nike.cloakroom",
    "player.group.remove",
	"player.blips",
	"create.biz",
    "player.giveitem"
  },
  ["admin"] = {
    "player.group.add",
	"nike.cloakroom",
    "player.group.remove",
    "admin.tickets",
    "admin.announce",
	"admin.menu",
	"admin.easy_unjail",
	"admin.spikes",
	-- "admin.godmode",
	"admin.spawnveh",
	"admin.deleteveh",
	"player.tptowaypoint",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
	"create.biz",
    "player.tpto"
  },
  ["miniadmin"] = {
    "admin.tickets",
    "admin.announce",
	"admin.menu",
	"admin.deleteveh",
	"player.tptowaypoint",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
	"create.biz",
    "player.tpto"
  },
     -- ["god"] = {
    -- "admin.god" -- reset survivals/health periodically
  -- },
  
  ["recruiter"] = {
    "player.list",
	"player.group.add",
    "player.group.remove"
    },
  ["mod"] = {
	"admin.tickets",
    "admin.announce",
    "player.list",
    "player.kick",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
  ["helper"] = {
	"admin.tickets",
    "player.kick",
    "player.coords",
    "player.tptome",
	"emergency.revive",
    "player.tpto"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    "player.calladmin",
	"player.fix_haircut",
	"player.check",
	--"mugger.mug",
    "police.askid",
    "police.store_weapons",
	"player.skip_coma",
	"player.store_money",
	"player.check",
	"player.loot",
	"player.player_menu",
	"player.userlist",
    "police.seizable",	-- can be seized
	"user.paycheck"
  },
  ["eventer"] = {
    "police.menu_interaction",
	"police.drag",
	"police.easy_cuff"
  },
  ["shief"] = {
	"player.group.add",
    "player.group.remove"
	},
	["Carpenter"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте дърводелец."}) end
	},
	"drug.mixer",
	"drug.grower",
    "carpenter.job",
    "black.asmg",
    "ammo.tank",
    "ammo.asmg",
    "carpenter.paycheck",
    "vehicle.repair",
    "drugseller.market",
    "harvest.weed",
    "black.cocaine"
    },
  ["Fisher"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Fisherman."}) end
	},
	"mission.delivery.fish",
    "fisher.service",
	"fisher.vehicle"
    },
		["Cargo Pilot"] = {
			_config = { gtype = "job",
		onspawn = function(player) vRPclient.notify(player,{"Вие сте товарен пилот."}) end
		},
		"mission.pilot.cargo",
		"pilot.vehicle",
		"pilot.paycheck",
		"drug.mixer",
			"ammo.tank",
			"black.asmg",
			"ammo.asmg",
			"vehicle.repair",
		"drug.grower",
			"black.cocaine",
			"drugseller.market",
			"harvest.weed"
			},
			["Airline Pilot"] = {
				_config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"Вие сте пилот."}) end
			},
				"airlines.service",
			"air.vehicle",
				"vehicle.repair",
			"air.paycheck",
			"drug.mixer",
				"black.cocaine",
				"ammo.asmg",
				"black.asmg",
				"ammo.tank",
			"drug.grower",
				"drugseller.market",
				"harvest.weed"
			},
  ["Mafia"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a member of the mafia."}) end
	},
	"police.menu",		-- Acces to the police menu to use all of the things below.
	"police.easy_cuff", -- Acces to cuff someone
	"police.putinveh", -- Acces to put a handcuff player in a vehicle.
    "police.getoutveh", -- Acces to take out a handcuff player from a vehicle
	"police.store_weapons", -- Acces to store weapons
	"mafia.vehicle", -- Acces to the garage.
	"mafia.whitelisted", -- Whitelisted group
	"mafia.paycheck", -- Paycheck ( if you want)
    "drugseller.market",
    "ammo.tank",
    "ammo.ak47",
    "vehicle.repair",
	"black.ak47",
    "harvest.weed",
    "mission.delivery.fish",
    "black.cocaine",
	"drug.mixer",
	"drug.grower"
  },
  ["Mafia Chief"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a member of the mafia."}) end
	},
	"police.menu",		-- Acces to the police menu to use all of the things below.
	"police.easy_cuff", -- Acces to cuff someone
	"police.putinveh", -- Acces to put a handcuff player in a vehicle.
    "police.getoutveh", -- Acces to take out a handcuff player from a vehicle
	"police.store_weapons", -- Acces to store weapons
	"mafia.vehicle", -- Acces to the garage.
	"mafia.whitelisted", -- Whitelisted group
	"mafia.paycheck", -- Paycheck ( if you want)
    "drugseller.market",
    "ammo.tank",
    "ammo.ak47",
    "vehicle.repair",
	"black.ak47",
    "harvest.weed",
    "mission.delivery.fish",
    "black.cocaine",
	"drug.mixer",
	"drug.grower"
  },
  ["Mafia Worker"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a member of the mafia."}) end
	},
    --"police.menu",		-- Acces to the police menu to use all of the things below.
	--"police.easy_cuff", -- Acces to cuff someone
	--"police.drag",		-- Acces to drag a a cuffed person
	--"police.putinveh", -- Acces to put a handcuff player in a vehicle.
    --"police.getoutveh", -- Acces to take out a handcuff player from a vehicle
	  "police.menu",		-- Acces to the police menu to use all of the things below.
	"police.easy_cuff", -- Acces to cuff someone
	"police.putinveh", -- Acces to put a handcuff player in a vehicle.
    "police.getoutveh", -- Acces to take out a handcuff player from a vehicle
	"police.store_weapons", -- Acces to store weapons
	"mafia.vehicle", -- Acces to the garage.
	"mafia.paycheck", -- Paycheck ( if you want)
    "drugseller.market",
    "ammo.tank",
    "ammo.ak47",
    "mission.delivery.fish",
    "harvest.weed",
	"black.ak47",
    "vehicle.repair",
    "black.cocaine",
	"drug.mixer",
	"drug.grower"
	},
	["Black Dealer"] = {
    _config = { gtype = "job",
	    onspawn = function(player) vRPclient.notify(player,{"Вие сте търговец на черния наркотик."}) end
	  },
    "mission.delivery.fish",
	"drug.mixer",
	"drug.grower",
    "black.cocaine",
    "vehicle.repair",
    "ammo.tank",
    "black.asmg",
    "drugseller.market",
    "ammo.asmg",
    "harvest.weed"
  },
  ["Medical Transport"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вече транспортирате медицинска трева."}) end
	},
	"mission.delivery.medical",
    "medical.service",
	"medical.vehicle",
	"medical.paycheck",
	"drug.mixer",
    "ammo.asmg",
    "ammo.tank",
    "vehicle.repair",
    "black.asmg",
    "black.cocaine",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
    },
  ["Weapons Smuggler"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Weapons Smuggler."}) end
	},
	"mission.weapons.smuggler",
    "smuggler.service"
    },
  ["Police Officer"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "Officer.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	--"player.list",
	"police.paycheck",
	"police.mission",
	--"player.blips",
	"holdup.police",
	"police.menu_interaction"
  },
  ["Police Detective"] = {  
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "Detective.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	--"player.list",
	"Detective.paycheck",
	"police.menu_interaction",
	--"player.blips",
	"holdup.police",
	"police.mission"
  },
  ["EMS Chief"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте началник на EMS."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "vehicle.repair",
	"emergency.cloakroom",
	"emscheck.revive",
    "radio.police",
    "emservice.camera",
	"emergency.vehicle",
	"emergency.market",
	"ems.loadshop",
	"emsChief.paycheck"
  },
  ["EMS Paramedic"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте EMS Paramedic."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "vehicle.repair",
	"emscheck.revive",
    "radio.police",
    "emservice.camera",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.loadshop",
	"emsMedic.paycheck"
  },
  ["EMS Lieutenant"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте EMS Lieutenant."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "radio.police",
    "vehicle.repair",
	"emergency.cloakroom",
    "emservice.camera",
	"emergency.vehicle",
	"emergency.market",
	"emscheck.revive",
	"ems.loadshop",
	"emsLieutenant.paycheck"
  },
  ["EMS Search and Rescue"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте EMS Новобранец."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "radio.police",
	"emergency.cloakroom",
    "vehicle.repair",
	"emscheck.revive",
    "emservice.camera",
	"emergency.vehicle",
	"emergency.market",
	"ems.loadshop",
	"emsSearchRescue.paycheck"
  },
  -- reporter
  ["News Reporter"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Reporter"}) end
	},
	"police.pc",
	--"police.wanted",
    --"emergency.shop",
    --"emergency.service",
	"emergency.vehicle",
	--"player.list",
	"police.menu_interaction",
	--"emsMedic.paycheck",
	"holdup.police",
	"player.blips"
  },
  
  ["Mechanic"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте механик."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
	"mission.repair.satellite_dishes",
	"mission.repair.wind_turbines",
    "vehicle.repair",
	"repair.vehicle",
	"repair.market",
	"repair.paycheck",
    "ammo.tank",
    "ammo.asmg",
    "black.asmg",
    "black.cocaine",
	"drug.mixer",
    "Tow Truck Company",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
  },
  ["Forger"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте фалшификатор, отидете да получите няколко кредитни карти от хакерите."}) end
	},
    "fraud.credit_cards",
	"forger.mission",
	"drug.mixer",
	"drug.grower",
    "drugseller.market",
    "vehicle.repair",
    "harvest.weed",
    "ammo.tank",
    "black.cocaine",
	"drug.mixer",
    "ammo.asmg",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
  },
  ["Taxi Driver"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Taxi Driver."}) end
	},
	"uber.service",
	"uber.vehicle",
	"uber.mission",
	"uber.paycheck",
    "ammo.asmg",
    "vehicle.repair",
	"drug.mixer",
    "ammo.tank",
    "black.cocaine",
	"drug.grower",
    "black.asmg",
    "drugseller.market",
    "harvest.weed"
  },
  ["Drive Coursor"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Drive Coursor, PRESS DEL TO START MISSIONS. Salary : $2000."}) end
	},
    "uber.service",
	"uber.vehicle",
	"uber.paycheck"
  },
  ["UPS"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте куриер."}) end
	},
    "ups.cloakroom",
	"harvest.parcels",
	"ups.vehicle",
	"mission.delivery.parcels",
    "vehicle.repair",
    "ammo.asmg",
    "black.asmg",
    "black.cocaine",
    "ammo.tank",
	"ups.paycheck",
	"drug.mixer",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
  },
 -- ["Gunrunning"] = {
   -- _config = { gtype = "job",
	--onspawn = function(player) vRPclient.notify(player,{"Coming soon, Please wait!"}) end
  --}
--},
  ["Unemployed"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Unemployed, go to Department of Jobs."}) end
	},
	"citizen.paycheck"
  },
  ["Food Panda"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Food Panda Driver."}) end
	},
	"mission.delivery.food",
	"delivery.vehicle",
    "repair.service",
    "emergency.market",
	"delivery.paycheck",
	"vehicle.repair",
	"ammo.asmg",
	"black.asmg",
	"ammo.tank",
	"black.cocaine",
"drug.mixer",
"drug.grower",
	"drugseller.market",
	"harvest.weed"
  },
  ["Trash Collector"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Trash Collector, Salary : $2000."}) end
	},
	"mission.collect.trash", -- mission permission
	"trash.vehicle", -- garage permission
	"trash.paycheck", -- paycheck permission
	"drug.mixer",
    "black.cocaine",
    "ammo.tank",
    "ammo.asmg",
	"repair.vehicle",
    "black.asmg",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
  },
  ["Lawyer"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Lawyer, Salary : $2000."}) end
	},
	"Lawyer.vehicle",
	"Lawyer.whitelisted",
	"Lawyer.cloakroom",
	"Lawyer.paycheck"
  },
  ["Drug Dealer"] = {
    _config = { gtype = "job",
	    onspawn = function(player) vRPclient.notify(player,{"Вие сте търговец на наркотици."}) end
	  },
    "mission.drugseller.weed",
    "drugseller.market",
    "harvest.weed",
    "vehicle.repair",
    "ammo.asmg",
	"drug.mixer",
    "ammo.tank",
    "black.asmg",
    "black.cocaine",
	"drug.grower"
  },
	["Drug Mixer"] = {
    _config = { gtype = "job",
			onspawn = function(player) vRPclient.notify(player,{"You are a Drug Mixer."}) end
	  },
		"harvest.cleancoca"
	},
  -- ["Santa"] = {
    -- _config = { gtype = "job",
	    -- onspawn = function(player) vRPclient.notify(player,{"You are Santa, ho ho ho."}) end
	  -- },
    -- "mission.santa", -- What mission Santa has
    -- "santa.vehicle", -- Access to his garage
	-- "santa.paycheck", -- How much santa gets paid per 15 mins
	-- "santa.cloakroom", -- Santa's cloakroom
    -- "harvest.presents" -- What he gathers (item transformers.lua)
  -- },
  ["Hacker"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Вие сте хакер."}) end
	},
	"mission.hacker.information",
	"hacker.hack",
	"hacker.credit_cards",
	"drug.mixer",
	"drug.grower",
    "drugseller.market",
    "vehicle.repair",
    "ammo.asmg",
    "harvest.weed",
    "black.asmg",
    "ammo.tank",
	"drug.mixer",
    "black.cocaine",
	"drug.grower",
    "drugseller.market",
    "harvest.weed"
  },
  ["Bankdriver"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Bank Driver. Salary: $2000."}) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },
  ["Judge"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Judge. Salary : $5000"}) end
	},
	"judge.paycheck",
	"Judge.whitelisted"
  },
  ["Weapon Dealer"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Weapon Dealer"}) end
	},
	"weapon.whitelisted",
	"mafia.loadshop"
  },
  ["Cadet"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Cadet.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"Cadet.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
  ["SWAT"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"SWAT.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"SWAT.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
  ["Chief of Police"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Chief.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Chief.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
  ["Bounty Hunter"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Bounty.cloakroom",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "Bounty.vehicle",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Bounty.vehicle",
	"Bounty.loadshop",
	"police.menu_interaction",
	"holdup.police",
	"cop.whitelisted"
  },
  ["Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"sheriff.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"sheriff.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
  ["K9"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"sheriff.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"sheriff.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
  ["State Trooper"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	 "Commander.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Commander.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
    ["Deputy Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Deputy.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Deputy.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
      ["Police Captain"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Captain.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Captain.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
    ["Police Lieutenant"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Lieutenant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Lieutenant.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
      ["Police Detective"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Detective.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Detective.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
    ["Police Sergeant"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Sergeant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Sergeant.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },
      ["Dispatcher"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
    "police.pc",
    "police.check",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Dispatch.paycheck",
	"police.menu_interaction",
	"holdup.police",
	"police.mission"
  },


  -- ["trafficguard"] = {
    -- _config = { gtype = "job",
	  -- onjoin = function(player) vRPclient.setCop(player,{true}) end,
      -- onspawn = function(player) vRPclient.setCop(player,{true}) end,
      -- onleave = function(player) vRPclient.setCop(player,{false}) end
	-- },
	-- "police.cloakroom",
    -- "police.pc",
    -- "police.handcuff",
    -- "police.putinveh",
    -- "police.getoutveh",
    -- "police.check",
    -- "police.service",
    -- "police.wanted",
    -- "police.seize.weapons",
    -- "police.seize.items",
    -- "police.jail",
    -- "police.fine",
    -- "police.announce",
    -- "-police.store_weapons",
    -- "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	-- "police.vehicle",
	-- "police.loadshop",
	-- "cop.whitelisted",
	-- "trafficguard.paycheck"
  -- },
  
  
  -- whitelist group for police, emergency and president jobs / add player to this group and user can view the job selection / search in the map
  -- moderator=president / president is guy from the server give a player group cop ems moderator when admin is offline / sallary : $10.000
  ["cop"] = {
    "cop.whitelisted"
  },
  ["Exotic Car Dealer"] = {
   	_config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"You are an Exotic Car Dealer"}) end
	},
	"exotic.whitelisted",
    "exotic.vehicle",
    "player.group.add",
    "player.group.remove"
    --"player.list"
  },
  ["buyer"] = {  
    "exotic.vehicle"
  },
  ["mafia"] = {
	"mafia.whitelisted"
  },
  ["weapon"] = {
	"weapon.whitelisted"
  },
  ["ems"] = {  
    "ems.whitelisted"
  },
  ["moderator"] = {
    "president.whitelisted"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin",
	"recruiter"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Job Selector"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "Taxi Driver",
    "Mechanic",
	"Food Panda",
	"Bankdriver",
	"UPS",
	"Fisher",
	"Medical Transport",
    "Unemployed"
  },
  ["Police job"] = { -- Alta Street
    _config = {x = 447.35137939453, y = -975.57592773438, z = 30.689584732056, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"K9",
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Police job 2"] = { -- Sandy Shores
    _config = {x = 1857.5961914063, y = 3688.8952636719, z = 34.267040252686, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"K9",
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Police job 3"] = { -- Paleto Bay
    _config = {x = -449.00927734375, y = 6017.1953125, z = 31.716377258301, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"K9",
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Emergency job"] = { -- Spawn Hospital
    _config = {x =  249.50639343262, y = -1375.0694580078, z = 39.534378051758, blipid = 351, blipcolor = 3, permissions = {"ems.whitelisted"} },
    "EMS Chief",
    "EMS Lieutenant",
    "EMS Search and Rescue",
	"EMS Paramedic",
	"Unemployed"
  },
  ["Mafia2"] = {
    _config = {x =  1391.9857177734, y = 3603.3562011719, z = 38.94193649292, blipid = 181, blipcolor = 50, permissions = {"mafia.whitelisted"} }, -- UPDATE THE COORDINATES
	"Mafia Chief",
	"Mafia",
	"Mafia Worker",
	"Unemployed"
  },
  ["Mafia"] = {  -- -203.17590332032,-1328.2637939454,34.894367218018
    _config = {x =  -203.17590332032, y = -1328.2637939454, z = 34.894367218018, blipid = 181, blipcolor = 50, permissions = {"mafia.whitelisted"} }, -- UPDATE THE COORDINATES
	"Mafia Chief",
	"Mafia",
	"Mafia Worker",
	"Unemployed"
	},
	["Black Dealer"] = {
    _config = {x = -2168.5673828125, y = 5197.142578125, z = 17.028638839722, blipid = 84, blipcolor = 49},
    "Black Dealer",
  },
  ["Weapons"] = {  -- 24.043367385864,-1107.708984375,29.79702949524
    _config = {x =  24.043367385864, y = -1107.708984375, z = 29.79702949524, blipid = 119, blipcolor = 76, permissions = {"weapon.whitelisted"} }, -- UPDATE THE COORDINATES
	"Weapon Dealer",
	"Unemployed"
  },
  ["Lawyer"] = {
    _config = {x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466, blipid = 351, blipcolor = 7, permissions = {"Lawyer.whitelisted"} },
    "Lawyer",
	"Unemployed"
  },
  ["drugseller job"] = {
    _config = {x = 1865.1586914063, y = 3749.4343261719, z = 33.046268463135, blipid = 277, blipcolor = 4},
    "Drug Dealer",
    "Unemployed"
	},
	["Drug Mixer Job"] = {
    _config = {x = 2205.3178710938, y = 5569.5913085938, z = 53.727096557617, blipid = 0, blipcolor = 0}, 
    "Drug Mixer",
		"Unemployed"
	},
  ["Smuggler job"] = {
    _config = {x = 283.10546875, y = 6788.7104492188, z = 15.695198059082, blipid =  150, blipcolor = 4},
    "Weapons Smuggler",
    "Unemployed"
  },
  ["Airline Pilot"] = {
    _config = {x = -759.6591796875, y = -1515.3978271484, z = 4.9768991470337, blipid =  307, blipcolor = 4},
	"Airline Pilot",
    "Unemployed"
  },
  ["Cargo Pilot"] = {
    _config = {x = -928.89624023438, y = -2937.396484375, z = 13.945074081421,blipid = 472, blipcolor = 4},
	"Cargo Pilot",
    "Unemployed"
  },
  ["Trash Collector"] = {
    _config = {x = 750.05029296875, y = -1402.9224853516, z = 26.549806594849,blipid = 318, blipcolor = 2}, -- Job starts here
	"Trash Collector",
    "Unemployed"
  },
  ["Judge"] = {
    _config = {x = -59.127178192139, y = 359.25082397461, z = 113.05643463135, blipid = 351, blipcolor = 7, permissions = {"Judge.whitelisted"} },
    "Judge",
	"Unemployed"
  },
  ["Forger"] = {
    _config = {x = 388.61703491211, y = 3587.1179199219, z = 33.292263031006, blipid = 472, blipcolor = 4},
    "Forger",
	"Unemployed"
  },
  ["Hacker job"] = {
    _config = {x = 705.682189941406, y = -966.919067382813, z = 30.3953418731689, blipid = 521, blipcolor = 72},
    "Hacker",
    "Unemployed"
  }
  
}

return cfg

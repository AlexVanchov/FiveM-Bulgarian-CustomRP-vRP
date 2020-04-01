
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  -- example of harvest item transformer
    {
    name="Fishing", -- menu name
    permissions = {"mission.delivery.fish"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=743.19586181641,y=3895.3967285156,z=30.5, 
    radius=3, height=1.5, -- area
    recipes = {
      ["Catch some Catfish"] = { -- action name
        description="Trying to catch some Catfish", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["catfish"] = 1
        }
      },
      ["Catch some Bass"] = { -- action name
        description="Trying to catch some Bass", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["bass"] = 1
        }
      }
    }
  },
       {
    name="Trash Collector", -- menu name
    permissions = {"mission.collect.trash"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=805.77130126953,y=-1078.0639648438,z=28.55744934082,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather Trash"] = { -- action name
        description="Gathering Trash...", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["trash"] = 1
        }
      }
    }
  },
      {
    name="Weapons Smuggler", -- menu name
    permissions = {"mission.weapons.smuggler"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=-343.28500366211,y=6098.6586914063,z=31.327739715576,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather AK's"] = { -- action name
        description="Grabbing AK's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["AK47"] = 1
        }
      },
      ["Gather M4A1"] = { -- action name
        description="Grabbing M4's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["M4A1"] = 1
        }
      }
    }
  },
      {
    name="Medical Transport", -- menu name
    permissions = {"mission.delivery.medical"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=2213.0520019531,y=5577.5981445313,z=53.795757293701,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather Medical Weed"] = { -- action name
        description="Gathering Medical Weed", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["Medical Weed"] = 1
        }
      }
	 }
  },
   {
    name="UPS", -- menu name
    permissions = {"harvest.parcels"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=76.495727539063,y=-27.030916213989,z=68.562599182129,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather Parcels"] = { -- action name
        description="Gathering Parcels", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["parcels"] = 1
        }
      }
	 }
  },
  {
     name="Coca Leaves Farm", -- menu name
     permissions = {"harvest.cocaleaves"}, -- you can add permissions
     r=0,g=125,b=255, -- color
     max_units=1000,
     units_per_minute=1000,
     x=2408.5302734375,y=3031.4604492188,z=48.152572631836, -- UPDATE THIS  2408.5302734375,3031.4604492188,48.152572631836
     radius=2, height=1.5, -- area
     recipes = {
      ["Gather Coca Leaves"] = { -- action name
         description="Gathering Coca Leaves", -- action description
         in_money=0, -- money taken per unit
         out_money=0, -- money earned per unit
         reagents={}, -- items taken per unit
         products={ -- items given per unit
           ["cocaleaves"] = 1
         }
       }
	  }
   },
   {
    name="Benzoil Farm", -- menu name
    permissions = {"harvest.benzoilmetilecgonina"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=1000,
    units_per_minute=1000,
    x=1668.8928222656,y=4969.03125,z=42.262279510498, -- UPDATE THIS  -- 1668.8928222656,4969.03125,42.262279510498
    radius=2, height=1.5, -- area
    recipes = {
     ["Gather Benzo"] = { -- action name
        description="Gathering Benzo", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["benzoilmetilecgonina"] = 1
        }
      }
   }
  },
  --{
    --name="Water bottles/tacos tree", -- menu name
    -- permissions = {"harvest.water_bottle_tacos"}, -- you can add permissions
    --r=0,g=125,b=255, -- color
    --max_units=100000,
    --units_per_minute=100000,
    --x=-1692.6646728516,y=-1086.3079833984,z=13.152559280396, -- pos
    --radius=5, height=1.5, -- area
    --recipes = {
      --["Harvest water"] = { -- action name
        --description="Harvest some water bottles.", -- action description
        --in_money=0, -- money taken per unit
        --out_money=0, -- money earned per unit
        --reagents={}, -- items taken per unit
        --products={ -- items given per unit
          --["water"] = 1
        --}
      --},
      --["Harvest tacos"] = { -- action name
        --description="Harvest some tacos.", -- action description
        --in_money=0, -- money taken per unit
        --out_money=0, -- money earned per unit
        --reagents={}, -- items taken per unit
        --products={ -- items given per unit
          --["tacos"] = 1
        --}
      --}
    --}
    --, onstart = function(player,recipe) end, -- optional start callback
    -- onstep = function(player,recipe) end, -- optional step callback
    -- onstop = function(player,recipe) end -- optional stop callback
  --},
  {
    name="Body training", -- menu name
    r=255,g=125,b=0, -- color
    max_units=35,
    units_per_minute=35,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Тренираш"] = { -- action name
        description="Increase your strength.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 0.1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Hacker", -- menu name
	permissions = {"hacker.credit_cards"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=800,
    units_per_minute=800,
    x=707.357238769531,y=-966.98876953125,z=30.4128551483154,
    radius=2, height=1.0, -- area
    recipes = {
      ["Хакваш внимавай"] = { -- action name
        description="Hacking credit cards.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["credit"] = 1,
		["dirty_money"] = 2
		}, -- items given per unit
        aptitudes={ -- optional
          ["hacker.hacking"] = 0.1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Forger", -- menu name
	permissions = {"fraud.credit_cards"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=800,
    units_per_minute=800,
    x=1272.7305908203,y=-1711.9899902344,z=54.771453857422,
    radius=2, height=1.0, -- area
    recipes = {
      ["Правиш фалшиви карти"] = { -- action name
        description="Forging fake ID's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		["credit"] = 1
		}, -- items taken per unit
        products={
		["fake_id"] = 1    
		}, -- items given per unit
        aptitudes={}
      }
    }
  },
  {
    name="Driver License", -- menu name
    r=255,g=125,b=0, -- color
    max_units=10,
    units_per_minute=1,
    x=437.0460510254,y=-979.29113769532,z=30.68967628479,         -- 437.0460510254,-979.29113769532,30.68967628479 
    radius=2, height=1.0, -- area
    recipes = {
      ["Driver"] = { -- action name
       description="Buy a Driver License.", -- action description`
        in_money=150, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["driver"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Bank Driver Mission", -- menu name
	permissions = {"bankdriver.money"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=236.87298583984,y=217.09535217285,z=106.28678894043,
    radius=2, height=1.0, -- area
    recipes = {
      ["Bank Money"] = { -- action name
       description="Get a money bank for mission.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bank_money"] = 500000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Collect Cargo", -- menu name
	permissions = {"mission.pilot.cargo"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=1618.9204101563,y=3227.7058105469,z=40.411529541016,
    radius=2, height=1.0, -- area
    recipes = {
      ["Cargo"] = { -- action name
       description="Collecting Cargo...", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["cargo"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Coca Mixer", -- menu name
	permissions = {"harvest.cleancoca"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=171.97718811036,y=-2220.6970214844,z=90.789329528808,  -- 171.97718811036,2220.6970214844,90.789329528808
    radius=2, height=1.0, -- area
    recipes = {
      ["Clean Coca"] = { -- action name
       description="Mixing coca", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
          ["cocaleaves"] = 1,
          ["benzoilmetilecgonina"] = 1
        }, -- items taken per unit
        products={
		["cleancoca"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
        name="Black Cocaine", -- menu name
	permissions = {"black.cocaine"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1000,
    units_per_minute=1000,
    x=2433.2937011718,y=4968.6201171875,z=42.347602844238,
    radius=2, height=1.0, -- area
    recipes = {
      ["Правиш черна кока"] = { -- action name
        description="Смесване на съставките", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		["cleancocaine"] = 1,
		["blackleaves"] = 1
		}, -- items taken per unit
        products={
		["blackcocaine"] = 1
		}, -- items given per unit
        aptitudes={}
      }
    }
  },
  {
    name="ASMG Незаконно", -- menu name
permissions = {"black.asmg"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=15,
units_per_minute=15,
x=57.573810577392,y=3689.7468261718,z=39.902755737304, 
radius=2, height=1.0, -- area
recipes = {
  ["Правиш Оръжие"] = { -- action name
    description="Сглобяване на частите", -- action description
    in_money=0, -- money taken per unit
    out_money=0, -- money earned per unit
    reagents={
["bodyasmg"] = 50, 
["spusukasmg"] = 50,
["duloasmg"] = 50
}, -- items taken per unit
    products={
["wbody|WEAPON_ASSAULTSMG"] = 1,
["wammo|WEAPON_ASSAULTSMG"] = 1
}, -- items given per unit
    aptitudes={}
  }
}
},
{
  name="АК47 Незаконно", -- menu name
permissions = {"black.ak47"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=15,
units_per_minute=15,
x=3236.849609375,y=-172.72645568848,z=16.927841186524,
radius=2, height=1.0, -- area
recipes = {
["Правиш Оръжие"] = { -- action name
  description="Сглобяване на частите", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["bodyak47"] = 85,
["duloak47"] = 85,
["spusukak47"] = 85,
["projinaak47"] = 85
}, -- items taken per unit
  products={
["wbody|WEAPON_ASSAULTRIFLE"] = 1,
["wammo|WEAPON_ASSAULTRIFLE"] = 1
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Special Paper", -- menu name
permissions = {"carpenter.job"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=55,
units_per_minute=30,
x=-582.984375,y=5359.9150390625,z=70.242919921875,
radius=2, height=1.0, -- area
recipes = {
["Правиш специялна хартия"] = { -- action name
  description="Правиш хартията", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["wsawdust"] = 1
}, -- items taken per unit
  products={
["spaper"] = 1
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Нарязване на дъски", -- menu name
permissions = {"carpenter.job"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=640,
units_per_minute=640,
x=-580.0170288086,y=5276.4233398438,z=70.264877319336,
radius=2, height=1.0, -- area
recipes = {
["Правиш ги на стърготини"] = { -- action name
  description="Правене на стърготини", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["cboards"] = 1
}, -- items taken per unit
  products={
["wsawdust"] = 1
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Make Documents for Gun", -- menu name
permissions = {"documents.job"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=35,
units_per_minute=20,
x=459.74005126954,y=-989.19348144532,z=24.914869308472,
radius=2, height=1.0, -- area
recipes = {
["Правиш документи за оръжие"] = { -- action name
  description="Пишеш документ", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["spaper"] = 2
}, -- items taken per unit
  products={
["razreshitelno1"] = 1,
["razreshitelno2"] = 1,
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Правиш патрон", -- menu name
permissions = {"ammo.ak47"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=20,
units_per_minute=20,
x=3233.1506347656,y=-173.42526245118,z=16.478744506836,
radius=2, height=1.0, -- area
recipes = {
["Правиш патрон за AK"] = { -- action name
  description="Патрон за АК47", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["gunpowder"] = 1,
["ecartridge"] = 1
}, -- items taken per unit
  products={
["wammo|WEAPON_ASSAULTRIFLE"] = 1
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Правиш патрон", -- menu name
permissions = {"ammo.asmg"}, -- you can add permissions
r=255,g=125,b=0, -- color
max_units=20,
units_per_minute=20,
x=57.407848358154,y=3693.1459960938,z=39.921314239502,
radius=2, height=1.0, -- area
recipes = {
["Правиш патрон за ASMG"] = { -- action name
  description="Патрон за ASMG", -- action description
  in_money=0, -- money taken per unit
  out_money=0, -- money earned per unit
  reagents={
["gunpowder"] = 1,
["ecartridge"] = 1
}, -- items taken per unit
  products={
["wammo|WEAPON_ASSAULTSMG"] = 1
}, -- items given per unit
  aptitudes={}
}
}
},
{
  name="Винетка за Автомобил", -- menu name
  r=255,g=125,b=0, -- color
  max_units=1,
  units_per_minute=1,
  x=-537.97863769532,y=-208.98712158204,z=37.649837493896, 
  radius=2, height=1.0, -- area
 recipes = {
    ["Винетка"] = { -- action name
     description="Купи Винетка.", -- action description`
      in_money=1000, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={
  ["vignette"] = 2
  }, -- items given per unit
      aptitudes={} -- optional
    }
  }
},
 -- {
   -- name="Robbery Bank", -- menu name
   -- r=255,g=125,b=0, -- color
   -- max_units=600,
   -- units_per_minute=1,
   -- x=265.94982910156,y=213.54983520508,z=101.68338775635,
   -- radius=2, height=1.0, -- area
   -- recipes = {
     -- ["Bank Money"] = { -- action name
      -- description="get the money.", -- action description
       -- in_money=0, -- money taken per unit
       -- out_money=0, -- money earned per unit
      --  reagents={}, -- items taken per unit
      --  products={
	--	["dirty_money"] = 0
	--	}, -- items given per unit
       -- aptitudes={} -- optional
     -- }
   -- }
 -- },
  {
    name="Drug Lab", -- menu name
	permissions = {"harvest.weed"}, -- job drug dealer required to use
    r=0,g=255,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=-77.722381591797,y=6223.626953125,z=31.089864730835, -- pos (needed for public use lab tools)
    radius=1.1, height=1.5, -- area
    recipes = {
      ["cocaine"] = { -- action name
        description="make cocaine", -- action description
        in_money=500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={ -- items taken per unit
          ["benzoilmetilecgonina"] = 1
        },
        products={ -- items given per unit
          ["cocaine"] = 3
        },
        aptitudes={ -- optional
          ["laboratory.cocaine"] = 3, -- "group.aptitude", give 1 exp per unit
          ["science.chemicals"] = 6
        }
      },
      ["weed"] = { -- action name
        description="make weed", -- action description
        in_money=500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={ -- items taken per unit
          ["seeds"] = 1
        },
        products={ -- items given per unit
          ["weed"] = 3
        },
        aptitudes={ -- optional
          ["laboratory.weed"] = 3, -- "group.aptitude", give 1 exp per unit
          ["science.chemicals"] = 6
        }
      },
      ["lsd"] = { -- action name
          description="make lsd", -- action description
          in_money=500, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={ -- items taken per unit
            ["harness"] = 1
          },
          products={ -- items given per unit
            ["lsd"] = 3
          },
          aptitudes={ -- optional
            ["laboratory.lsd"] = 3, -- "group.aptitude", give 1 exp per unit
            ["science.chemicals"] = 6
          }
        }
      }
    }
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["weed field"] = {
    def = {
      name="Weed field", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["seeds"] = 1
          }
        }
      }
    },
    positions = {
      {2208.0104980469,5577.6987304688,53.739212036133}
    }
  },
  ["cocaine dealer"] = {
    def = {
      name="Cocaine Dealer", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["benzoilmetilecgonina"] = 1
          }
        }
      }
    },
    positions = {
      {-631.00543212891,-229.42568969727,38.057052612305}
    }
  },
  ["lsd bar"] = {
    def = {
      name="LSD Bar", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
      			["harness"] = 1
          }
        }
      }
    },
    positions = {
      {1992.5993652344,3044.1806640625,47.215068817139}
    }
  },
  ["blackleaves"] = {
    def = {
        name="Black leaves", -- menu name
	permissions = {"black.cocaine"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=650,
    units_per_minute=650,
    x=-1644.985961914,y=4531.0395507812,z=39.85499572754,
    radius=2, height=1.0, -- area
    recipes = {
      ["Береш"] = { -- action name
        description="Набавяне на съставки.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["blackleaves"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {-1644.985961914,4531.0395507812,39.85499572754}
    }
  },
  ["bodyasmg"] = {
    def = {
        name="Тяло на АСМГ", -- menu name
	permissions = {"black.asmg"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=318.2846069336,y=2885.8955078125,z=46.382835388184,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bodyasmg"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {318.2846069336,2885.8955078125,46.382835388184}
    }
  },
  ["duloasmg"] = {
    def = {
        name="Дуло на АСМГ", -- menu name
	permissions = {"black.asmg"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=-301.16748046875,y=2539.5434570312,z=74.577697753906,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["duloasmg"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {-301.16748046875,2539.5434570312,74.577697753906}
    }
  },
  ["spusukasmg"] = {
    def = {
        name="Скусък на АСМГ", -- menu name
	permissions = {"black.asmg"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=-262.90914916992,y=2233.4643554688,z=117.9080657959,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["spusukasmg"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {-262.90914916992,2233.4643554688,117.9080657959}
    }
  },
  ["bodyak47"] = {
    def = {
        name="Тяло на калашника", -- menu name
	permissions = {"black.ak47"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=-1603.4786376954,y=4592.5625,z=41.072982788086,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bodyak47"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {-1603.4786376954,4592.5625,41.072982788086}
    }
  },
  ["duloak47"] = {
    def = {
        name="Дуло на калашника", -- menu name
	permissions = {"black.ak47"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=1346.3233642578,y=4389.6611328125,z=44.34375,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["duloak47"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {1346.3233642578,4389.6611328125,44.34375}
    }
  },
  ["spusukak47"] = {
    def = {
        name="Спусък на калашника", -- menu name
	permissions = {"black.ak47"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=57.189086914062,y=3690.3840332032,z=39.921287536622,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["spusukak47"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {57.189086914062,3690.3840332032,39.921287536622}
    }
  },
  ["projinaak47"] = {
    def = {
        name="Прожина за калашника", -- menu name
	permissions = {"black.ak47"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=135.6383972168,y=-1183.6245117188,z=29.501337051392,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш части"] = { -- action name
        description="Набавяне на част.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["projinaak47"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {135.6383972168,-1183.6245117188,29.501337051392}
    }
  },
  ["cboards"] = {
    def = {
        name="Цепене на дъски", -- menu name
	permissions = {"carpenter.job"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=250,
    units_per_minute=250,
    x=-497.21310424804,y=5299.390625,z=80.610038757324,
    radius=2, height=1.0, -- area
    recipes = {
      ["Цепене на дъски"] = { -- action name
        description="Цепиш дъски.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["cboards"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {-497.21310424804,5299.390625,80.610038757324}
    }
  },
  ["gunpowder"] = {
    def = {
        name="Набавяне на барут", -- menu name
	permissions = {"ammo.tank"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=93.02727508545,y=3755.2888183594,z=40.773155212402,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш барут"] = { -- action name
        description="Набавяш барут.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["gunpowder"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {93.02727508545,3755.2888183594,40.773155212402}
    }
  },
  ["ecartridge"] = {
    def = {
        name="Набавяш гилзи", -- menu name
	permissions = {"ammo.tank"}, -- you can add permissions                          
    r=255,g=125,b=0, -- color
    max_units=25,
    units_per_minute=25,
    x=2428.3776855468,y=3083.2534179688,z=48.709663391114,
    radius=2, height=1.0, -- area
    recipes = {
      ["Набавяш празни гилзи"] = { -- action name
        description="Набавяш барут.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["ecartridge"] = 1
		}, -- items given per unit
		aptitudes={}
      }
    }
  },
      positions = {
      {2428.3776855468,3083.2534179688,48.709663391114}
    }
  },
  ["police1"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {439.57083129883,-995.072265625,30.689596176147} -- Mission Row
    }
  },
  ["police2"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {1851.6605224609,3690.6713867188,34.267044067383} -- Sandy Shores
    }
  },
  ["police3"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {-449.43395996094,6010.796875,31.716377258301} -- Paleto
    }
  },
  ["ems"] = {
    def = {
      name="Medical Report", -- menu name
      permissions = {"ems.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["ems_report"] = 1
          }
        }
      }
    },
    positions = {
      {-272.08700561523,27.639623641968,54.752536773682},
      {465.04064941406,3569.1174316406,33.238555908203},
      {-1145.8566894531,4939.5083007813,222.2686920166}
    }
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["weed field"] = 18000,
	["lsd bar"] = 35000
  },
  positions = {
    {2208.0104980469,5577.6987304688,53.739212036133},
    {-631.00543212891,-229.42568969727,38.057052612305},
	{1992.5993652344,3044.1806640625,47.215068817139}
  },
  interval = 60, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg

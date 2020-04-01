
local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {
  ["food"] = {
    _config = {blipid=52, blipcolor=2},

    -- list itemid => price
    -- Drinks
    ["milk"] = 3,
    ["water"] = 1,
    ["coffee"] = 2,
    ["tea"] = 2,
    ["icetea"] = 2,
    ["orangejuice"] = 2,
    ["cocacola"] = 2,
    ["redbull"] = 3,
    ["lemonade"] = 3,
    ["vodka"] = 30,

    --Food
    ["bread"] = 2,
    ["donut"] = 3,
    ["tacos"] = 5,
    ["sandwich"] = 3,
    ["kebab"] = 5,
    ["pdonut"] = 10,
  },
  ["foodPanda"] = {
    _config = {blipid=206, blipcolor=48, permissions={"emergency.market"}},

    -- list itemid => price
    -- Drinks
    ["milk"] = 0,
    ["water"] = 0,
    ["coffee"] = 0,
    ["tea"] = 0,
    ["icetea"] = 0,
    ["orangejuice"] = 0,
    ["cocacola"] = 0,
    ["redbull"] = 0,
    ["lemonade"] = 0,
    ["vodka"] = 0,

    --Food
    ["bread"] = 0,
    ["donut"] = 0,
    ["tacos"] = 0,
    ["sandwich"] = 0,
    ["kebab"] = 0,
    ["pdonut"] = 0,
  },
  --["drugstore"] = {
  --  _config = {blipid=51, blipcolor=2},
  --  ["pills"] = 500
  --},
  ["emergencyloadout"] = {
    _config = {blipid=51, blipcolor=68, permissions={"emergency.market"}},
    ["medkit"] = 0,
    ["pills"] = 0
  },
  ["plantation"] = {
    _config = {blipid=473, blipcolor=4, permissions={"drugseller.market"}},
    ["seeds"] = 500,
	["benzoilmetilecgonina"] = 800,
	["harness"] = 1000
  },
  ["tools"] = {
    _config = {blipid=402, blipcolor=47, permissions={"repair.market"}},
    ["repairkit"] = 50
  }
}

-- list of markets {type,x,y,z}

cfg.markets = {
  {"foodPanda",47.15929031372,-999.51971435546,29.35163116455},
  {"food",128.1410369873, -1286.1120605469, 29.281036376953},
  {"food",-47.522762298584,-1756.85717773438,29.4210109710693},
  {"food",25.7454013824463,-1345.26232910156,29.4970207214355}, 
  {"food",1135.57678222656,-981.78125,46.4157981872559}, 
  {"food",1163.53820800781,-323.541320800781,69.2050552368164}, 
  {"food",374.190032958984,327.506713867188,103.566368103027}, 
  {"food",2555.35766601563,382.16845703125,108.622947692871}, 
  {"food",2676.76733398438,3281.57788085938,55.2411231994629}, 
  {"food",1960.50793457031,3741.84008789063,32.3437385559082},
  {"food",1393.23828125,3605.171875,34.9809303283691}, 
  {"food",1166.18151855469,2709.35327148438,38.15771484375}, 
  {"food",547.987609863281,2669.7568359375,42.1565132141113}, 
  {"food",1698.30737304688,4924.37939453125,42.0636749267578}, 
  {"food",1729.54443359375,6415.76513671875,35.0372200012207}, 
  {"food",-3243.9013671875,1001.40405273438,12.8307056427002}, 
  {"food",-2967.8818359375,390.78662109375,15.0433149337769}, 
  {"food",-3041.17456054688,585.166198730469,7.90893363952637}, 
  {"food",-1820.55725097656,792.770568847656,138.113250732422}, 
  {"food",-1486.76574707031,-379.553985595703,40.163387298584}, 
  {"food",-1223.18127441406,-907.385681152344,12.3263463973999}, 
  {"food",-707.408996582031,-913.681701660156,19.2155857086182},
  --{"drugstore",356.5361328125,-593.474304199219,28.7820014953613},
  {"emergencyloadout",242.42835998535,-1382.1253662109,39.534385681152}, -- spawn
  {"emergencyloadout",1841.4317626953,3673.5891113281,34.276752471924}, -- Sandy Shores
  {"emergencyloadout",-243.3074798584,6326.2265625,32.426181793213}, -- Paleto Bay
  {"plantation",1789.86682128906,3896.16943359375,34.3892250061035},
  {"tools",408.95471191406,-1622.8607177734,29.291942596436}
}

return cfg

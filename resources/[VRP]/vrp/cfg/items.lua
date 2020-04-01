-- define items, see the Inventory API on github

local cfg = {}
-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here
cfg.items = {
  ["benzoilmetilecgonina"] = {"Benzoilmetilecgonina", "Some Benzoic acid ester.", nil, 0.01}, -- no choices
  ["seeds"] = {"Семена", "Some Weed seeds.", nil, 0.01}, -- no choices
  ["harness"] = {"Harness", "Some Harness Lysergsäurediethylamid.", nil, 0.01}, -- no choices
  ["AK47"] = {"AK47", "A Russian masterpeice.", nil, 0.01}, -- no choices
  ["M4A1"] = {"M4A1", "Helps give non-Americans freedom.", nil, 0.01}, -- no choices
  ["credit"] = {"Крадени Карти", "Credit card.", nil, 0.01}, -- no choices
  ["driver"] = {"Шофиорска Книжка", "license card.", nil, 0.01}, -- no choices
  ["bank_money"] = {"Пари в банката", "лв.", nil, 0},
  ["trash"] = {"Боклук", "It fucking stinks!", nil, 0},  -- no choices
  ["fake_id"] = {"Фълшиви Лични Карти", "It just says Mcluvin.", nil, 0}, -- no choices
  ["police_report"] = {"Police Доклади", "Take it to the Bank Manager.", nil, 0},  -- no choices
  ["ems_report"] = {"EMS Доклади", "Take it to the Hospital.", nil, 0}, -- no choices
  ["cargo"] = {"Карго", "Порно с ма*ка ти", nil, 0},
  ["pass"] = {"Билет за събитие", "Пазете до напускане", nil, 0},
  ["medal"] = {"Медал за участие", "", nil, 0},
  ["key_pd_boss"] = {"Ключове за ШЕФ", "", nil, 0.01},
  ["key_lspd"] = {"Ключове за РПУ", "", nil, 0.01},  -- no choices
  ["blackcocaine"] = {"Black Cocaine","Sell as Delivery.", nil, 0.13}, -- no choices
  ["blackleaves"] = {"Black Coco leaves","Ingredients for black cocaine.", nil, 0.03}, -- no choices
  ["bodyasmg"] = {"Body for ASMG","Body for ASMG.", nil, 0.10}, -- no choices
  ["duloasmg"] = {"Dulo for ASMG","Dulo for ASMG.", nil, 0.08}, -- no choices
  ["spusukasmg"] = {"Trigger for ASMG","Trigger for ASMG.", nil, 0.03}, -- no choices
  ["bodyak47"] = {"Body for AK47","Body for AK47.", nil, 0.20}, -- no choices
  ["duloak47"] = {"Dulo for AK47","Dulo for AK47.", nil, 0.10}, -- no choices
  ["spusukak47"] = {"Trigger for AK47","Trigger for AK47.", nil, 0.02}, -- no choices
  ["spaper"] = {"Special Paper","Special Paper for Documents.", nil, 0.06}, -- no choices
  ["cboards"] = {"Chopped boards","Chopped boards for paper.", nil, 0.08}, -- no choices projinaak47
  ["wsawdust"] = {"Wood Sawdust","Wood Sawdust for paper.", nil, 0.05}, -- no choices
  ["projinaak47"] = {"Spring for AK47","Spring for AK47.", nil, 0.02}, -- no choices
  ["gunpowder"] = {"Gunpowder","Gunpowder for gun.", nil, 0.04}, -- no choices
  ["ecartridge"] = {"Empty cartridge","Empty cartridge for gun.", nil, 0.02}, -- no choices
  ["vignette"] = {"Винетка", "Винетка за лек автомобил", nil, 0.01}, -- no choices
  ["razreshitelno1"] = {"Разрешително1", "Разрешително за среден калибър", nil, 0.01}, -- no choices
  ["razreshitelno2"] = {"Разрешително2", "Разрешително за висок калибър", nil, 0.01}, -- no choices
}

-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg

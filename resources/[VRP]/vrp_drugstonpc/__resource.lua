resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "vRP_drugsToNpc -- thanks to onlyserenity"

dependency "vrp"

client_scripts{ 
  "Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
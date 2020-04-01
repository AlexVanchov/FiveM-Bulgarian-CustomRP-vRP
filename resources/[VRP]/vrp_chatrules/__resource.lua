description "vrp_chatrules"

dependency "vrp"

client_scripts{
  "client.lua"
}

server_scripts{
  "@vrp/lib/utils.lua",
  "server.lua"
}

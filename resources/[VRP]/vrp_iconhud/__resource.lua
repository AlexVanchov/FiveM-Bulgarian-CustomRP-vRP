-- Credits: Marmota#2533
ui_page "ui.html"

files {
    "ui.html",
    "ui.css",
    "ui.js",
    "heartbeat-solid.svg",
    "shield-alt-solid.svg"
}

client_scripts{
    "@vrp/lib/utils.lua",
    "client.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server.lua"
}
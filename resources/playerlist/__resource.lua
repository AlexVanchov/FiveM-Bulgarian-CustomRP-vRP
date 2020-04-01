server_script {
	"@mysql-async/lib/MySQL.lua",
	'@vrp/lib/utils.lua'
}

client_script {
	'lib/Tunnel.lua',
    'lib/Proxy.lua',
    'playerlist.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
}
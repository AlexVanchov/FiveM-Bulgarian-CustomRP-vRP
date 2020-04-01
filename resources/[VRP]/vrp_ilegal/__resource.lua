resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

files {
	"nui/ui.html",
    "nui/background.jpg",
    "nui/img/bg.png",
   	"nui/ui.js",
   	"nui/gothicb.ttf",
   	"nui/signpainter.ttf",
   	"nui/bootstrap.min.js",
   	"nui/bootstrap.min.css",
	"nui/ui.css",
		 "nui/responsive.css",
		 "nui/img/add.png",
		 "nui/img/logo.png",
		 "nui/empregos.html",
		 "nui/style-job.css",
}

client_script {
  '@vrp/lib/utils.lua',
  'click.lua',
}

server_script {
  '@vrp/lib/utils.lua',
  'server.lua'
}

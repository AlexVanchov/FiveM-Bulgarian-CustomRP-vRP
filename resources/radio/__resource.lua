resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" { url = "http://stream.metacast.eu/radio1rock.opus", volume = 0.3 , name = "Radio 1 Rock" }
supersede_radio "RADIO_02_POP" { url = "http://stream.metacast.eu/city.opus", volume = 0.3 , name = "Radio City" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://stream.metacast.eu/nrj.opus", volume = 0.3, name = "Radio NRJ" }
supersede_radio "RADIO_04_PUNK" { url = "http://stream.metacast.eu/veronika.opus", volume = 0.3, name = "Radio Veronika" }
supersede_radio "RADIO_05_TALK_01" { url = "http://stream.radioreklama.bg/radio1.opus", volume = 0.3 , name = "Radio 1" }
supersede_radio "RADIO_06_COUNTRY" { url = "http://stream.metacast.eu/bgradio.opus", volume = 0.3 , name = "BG Radio" }
supersede_radio "RADIO_07_DANCE_01" { url = "http://www.katrafm.net:8000/live", volume = 0.3, name = "KatraFM Radio" }
supersede_radio "RADIO_08_MEXICAN" { url = "http://193.108.24.21:8000/fresh", volume = 0.3  ,name = "Radio Fresh" }
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "http://193.108.24.6:8000/zrock", volume = 0.3, name = "Radio ZRock" }
supersede_radio "RADIO_12_REGGAE" { url = "http://193.108.24.21:8000/fmplus", volume = 0.3, name = "Radio FM Plus" }
supersede_radio "RADIO_13_JAZZ" { url = "http://stream.radioreklama.bg/avtoradio.ogg", volume = 0.3, name = "Avtoradio" }
supersede_radio "RADIO_14_DANCE_02" { url = "http://online.focus-radio.net:8100/sofia", volume = 0.3, name = "Radio Focus" }
supersede_radio "RADIO_15_MOTOWN" { url = "http://alpharadio.bg:8000/stream", volume = 0.3, name = "Alpha Radio" }
supersede_radio "RADIO_20_THELAB" { url = "http://193.108.24.6:8000/melody", volume = 0.3, name = "Radio Melody" }
supersede_radio "RADIO_16_SILVERLAKE" { url = "http://play.rsmedia.net/severozapad", volume = 0.3, name = "Radio Severozapad" }
supersede_radio "RADIO_17_FUNK" { url = "http://stream.radiok2.bg:8000/rk2", volume = 0.3, name = "Radio K2" }
supersede_radio "RADIO_18_90S_ROCK" { url = "http://play.onlinedjradio.com:8000/live", volume = 0.3, name = "DJ Radio" }
supersede_radio "RADIO_11_TALK_02" { url = "http://stream.radioreklama.bg:80/nova128", volume = 0.3, name = "Radio Nova" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js",
	"hud.ytd"
	
}


local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 1000
cfg.open_bank = 9000

cfg.display_css = [[
.div_money{
  position: absolute;
  top: 35px;
  right: 10px;
  font-size: 30px;
  font-family: "Roboto", sans-serif;
  font-weight: bold;
  color: #0aa846;
  text-shadow: rgb(0, 0, 0) 2px 0px 0px, rgb(0, 0, 0) 1.75px 0.966667px 0px, rgb(0, 0, 0) 1.08333px 1.68333px 0px, rgb(0, 0, 0) 0.133333px 2px 0px, rgb(0, 0, 0) -0.833333px 1.81667px 0px, rgb(0, 0, 0) -1.6px 1.2px 0px, rgb(0, 0, 0) -1.98333px 0.283333px 0px, rgb(0, 0, 0) -1.86667px -0.7px 0px, rgb(0, 0, 0) -1.3px -1.51667px 0px, rgb(0, 0, 0) -0.416667px -1.95px 0px, rgb(0, 0, 0) 0.566667px -1.91667px 0px, rgb(0, 0, 0) 1.41667px -1.41667px 0px, rgb(0, 0, 0) 1.91667px -0.566667px 0px;
 
}
.div_bmoney{
  position: absolute;
  top: 63px;
  right: 10px;
  font-size: 30px;
  font-family: "Roboto", sans-serif;
  font-weight: bold;
  color: #00aeff;
  text-shadow: rgb(0, 0, 0) 2px 0px 0px, rgb(0, 0, 0) 1.75px 0.966667px 0px, rgb(0, 0, 0) 1.08333px 1.68333px 0px, rgb(0, 0, 0) 0.133333px 2px 0px, rgb(0, 0, 0) -0.833333px 1.81667px 0px, rgb(0, 0, 0) -1.6px 1.2px 0px, rgb(0, 0, 0) -1.98333px 0.283333px 0px, rgb(0, 0, 0) -1.86667px -0.7px 0px, rgb(0, 0, 0) -1.3px -1.51667px 0px, rgb(0, 0, 0) -0.416667px -1.95px 0px, rgb(0, 0, 0) 0.566667px -1.91667px 0px, rgb(0, 0, 0) 1.41667px -1.41667px 0px, rgb(0, 0, 0) 1.91667px -0.566667px 0px;
  
}

.div_money .symbol{
  font-size: 30px;
  color: #0aa846;
  content: url('https://i.imgur.com/NWBbQdF.png');  
 
}

.div_bmoney .symbol{
  font-size: 30px;
  color: #00aeff;
  content: url('https://i.imgur.com/eKwXBLL.png'); 
  
}
]]

return cfg

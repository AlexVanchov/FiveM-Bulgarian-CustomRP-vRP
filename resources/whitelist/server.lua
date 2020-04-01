

local WhiteList = {}
local Discord = "ENTER_DISCORD"






 local notwhitelisted = "Не си в whitelist-а на сървъра. За да те удобрим ела в: discord.gg/UTfeaX"..Discord
 local steamiderr = "Error: we can't find your steamID"
 local trouve = false 


 AddEventHandler("playerConnecting", function(playerName, setKickReason)

    local steamID = GetPlayerIdentifiers(source)[1] or false
     print("Whitelist: "..playerName.."["..steamID.."] try to connect")


       if not steamID then

        setKickReason(steamiderr)
        CancelEvent()

        print("Whitelist: "..playerName.." kicked, no IDSteam")


       end


       local result = MySQL.Sync.fetchAll('SELECT * FROM whitelist')

        for i=1, #result, 1 do
            local id   = result[i].identifier
        
            table.insert(WhiteList, tostring(id))
            --print ("Trouve dans la bdd : " ..id)
            --print ("Tente de se conencter : "..steamID)
        end

      for i=1, #WhiteList, 1 do
       --print(tostring(WhiteList[i]))
       --print(tostring(steamID))

          if(tostring(WhiteList[i]) == tostring(steamID))then
              trouve = true


         end



      end


      --print(trouve)
      if(trouve)then 
           print("Whitelist: "..playerName.."["..steamID.."]  joined , whitelisted")
           trouve = false
           WhiteList = {}

                   
      else
                 setKickReason(notwhitelisted)
                    CancelEvent()

                    print("Whitelist: "..playerName.."["..steamID.."] kicked, no whitelisted ")
                    trouve = false
                    WhiteList = {}
                    return


                 

      end


end)
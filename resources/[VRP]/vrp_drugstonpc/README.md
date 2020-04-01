# vrp_drugstonpc
Original creator: https://github.com/onlyserenity/drugsToNPCs

Tested with dRP a.k.a Dunko's vRP

Key to sell is "H", you can change on line 44 the (1, 74) to whatever control you want.

In order for this to actually work on your server you'll need to change the item names, I was testing with tacos so I have tacos.
Change "tacos" to whatever your joint name is, remember to keep it between "".
```
	if not vRP.tryGetInventoryItem({user_id,"tacos",1,notify}) then
```

To change how much dirty money per joint take a look at line 23, change the values 20 & 600. (20,600) means that it choses a random nubmer between 20 & 600 to give the user.
```
	local cant = math.random(20,600)
```

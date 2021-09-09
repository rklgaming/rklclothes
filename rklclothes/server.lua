ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('getmynewbiepackm')
AddEventHandler('getmynewbiepackm', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('tshirt', 1, {accessories = 15, accessories2 = 0, description = 'This is a Thirst 15 0'})
	xPlayer.addInventoryItem('torso', 1, {accessories = 158, accessories2 = 0, description = 'This is a Torso 158 0'})
	xPlayer.addInventoryItem('arms', 1, {accessories = 1, accessories2 = 0, description = 'This is a Arms 1 0'})
	xPlayer.addInventoryItem('pants', 1, {accessories = 140, accessories2 = 2, description = 'This is a Pants 140 2'})
	xPlayer.addInventoryItem('shoes', 1, {accessories = 85, accessories2 = 0, description = 'This is a Shoes 85 0'})
	xPlayer.removeInventoryItem('newbie', 1)

end)



RegisterServerEvent('getmynewbiepackf')
AddEventHandler('getmynewbiepackf', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('tshirt', 1, {accessories = 0, accessories2 = 0, description = 'This is a Thirst 0 0'})
	xPlayer.addInventoryItem('torso', 1, {accessories = 117, accessories2 = 5, description = 'This is a Torso 117 0'})
	xPlayer.addInventoryItem('arms', 1, {accessories = 1, accessories2 = 0, description = 'This is a Arms 1 0'})
	xPlayer.addInventoryItem('pants', 1, {accessories = 35, accessories2 = 0, description = 'This is a Pants 140 2'})
	xPlayer.addInventoryItem('shoes', 1, {accessories = 85, accessories2 = 0, description = 'This is a Shoes 85 0'})
	xPlayer.removeInventoryItem('newbie', 1)
end)


RegisterServerEvent('policenuniform')
AddEventHandler('policenuniform', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('tshirt', 1, {accessories = 17, accessories2 = 1, description = 'This is a Thirst 17 1'})
	xPlayer.addInventoryItem('torso', 1, {accessories = 110, accessories2 = 1, description = 'This is a Torso 110 1'})
	xPlayer.addInventoryItem('arms', 1, {accessories = 11, accessories2 = 0, description = 'This is a Arms 11 0'})
	xPlayer.addInventoryItem('jeans', 1, {accessories = 59, accessories2 = 0, description = 'This is a Jeans 59 0'})
	xPlayer.addInventoryItem('shoes', 1, {accessories = 10, accessories2 = 0, description = 'This is a Shoes 10 0'})
	xPlayer.addInventoryItem('helmet', 1, {accessories = 125, accessories2 = 17, description = 'This is a Helmet 125 17'})
	xPlayer.removeInventoryItem('policeuniform',1)
end)









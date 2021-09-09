ESX          = nil

torso = false
tshirt = false
arms = false
ears = false
pants = false
shoes = false
hat = false
bag = false
bracelet = false
watches = false
mask = false
glasses = false
chain = false
hair = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
        while true do
            TriggerEvent('rklrklclothes:cheecking')
             Citizen.Wait(5000)
        end
end)
RegisterNetEvent('rklrklclothes:cheecking')
AddEventHandler('rklrklclothes:cheecking', function()
    local player = PlayerPedId()
    local inventory = exports['linden_inventory']:SearchItems({'helmet','torso','tshirt','arms','ears','jeans','shoes','helmet','bag','bracelet','watches','chain','mask','glasses'})
    if inventory then
      for name, data in pairs(inventory) do
          local count = 0
          for _, v in pairs(data) do
              if v.slot then
                 -- print(v.slot..' contains '..v.count..' '..name..' '..json.encode(v.metadata))
                  count = count + v.count
              end
          end
         
           if count <= 0 and name == 'helmet' then
                ClearPedProp(player, 0)
            elseif count <= 0 and name == 'torso' then
                SetPedComponentVariation(player, 11, 15, 0, 3)
            elseif count <= 0 and name == 'tshirt' then
                SetPedComponentVariation(player, 8, -1, 0, 2)
            elseif count <= 0 and name == 'arms' then
                SetPedComponentVariation(player, 3, 15, 0, 0)
            elseif count <= 0 and name == 'ears' then
                ClearPedProp(player, 2)
            elseif count <= 0 and name == 'jeans' then
                SetPedComponentVariation(player, 4, 14, 1, 2)
            elseif count <= 0 and name == 'shoes' then
                SetPedComponentVariation(player, 6, 45, 0, 2)
            elseif count <= 0 and name == 'bracelet' then
                ClearPedProp(player,7)
            elseif count <= 0 and name == 'bag' then
                SetPedComponentVariation(player, 5, 0, 0, 2)
            elseif count <= 0 and name == 'watches' then
                ClearPedProp(player,6)
            elseif count <= 0 and name == 'chain' then
                SetPedComponentVariation(player, 7, 0, 0, 2)
            elseif count <= 0 and name == 'mask' then
                SetPedComponentVariation(PlayerPedId(), 1, -1, 0, 2)
            elseif count <= 0 and name == 'glasses' then
                ClearPedProp(player, 1)
         end
      end
    end
end)



function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent('rklrklclothes:newbie')
AddEventHandler('rklrklclothes:newbie', function()
   
   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
    if skin.sex == 0 then
        TriggerServerEvent('getmynewbiepackm')
    else
        TriggerServerEvent('getmynewbiepackf')
    end
end)
end)

RegisterNetEvent('rklrklclothes:policenuniform')
AddEventHandler('rklrklclothes:policenuniform', function(item, wait, cb)
   TriggerServerEvent('policenuniform')
end)

RegisterNetEvent('rklrklclothes:hair')
AddEventHandler('rklrklclothes:hair', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not hair then

	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	mask = true
	SetPedComponentVariation(PlayerPedId(), 2, skin1, skin2, 0)
	elseif hair then

	mask = false
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(PlayerPedId(), 2, -1, 0, 2)
	end
end)


RegisterNetEvent('rklrklclothes:mask')
AddEventHandler('rklrklclothes:mask', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not mask then
	maskonoff()
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	mask = true
	SetPedComponentVariation(PlayerPedId(), 1, skin1, skin2, 0)
	elseif mask then
	maskonoff()
	mask = false
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(PlayerPedId(), 1, -1, 0, 2)
	end
end)

RegisterNetEvent('rklclothes:ears')
AddEventHandler('rklclothes:ears', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
	local skin2 = metadata.accessories2

	
	
	if not ears then
	earsonoff()
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ears = true
	SetPedPropIndex(PlayerPedId(), 2, skin1, skin2, 2)
	elseif ears then
	earsonoff()
	ears = false
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(player, 2)
	end
end)



RegisterNetEvent('rklclothes:glasses')
AddEventHandler('rklclothes:glasses', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
	local skin2 = metadata.accessories2

	
	
	if not glasses then
	glassesonoff()
	Wait(600)
	ClearPedSecondaryTask(player)
	glasses = true
	SetPedPropIndex(player, 1, skin1, skin2, 2) 
	elseif glasses then
	glassesonoff()
	glasses = false
	Wait(600)
	ClearPedSecondaryTask(player)
	ClearPedProp(player, 1)
	end
end)


RegisterNetEvent('rklclothes:helmet')
AddEventHandler('rklclothes:helmet', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	
	if not hat then
	hatofon()
	Wait (600)
	ClearPedSecondaryTask(player)
	hat = true
	
	SetPedPropIndex(player, 0, skin1, skin2, true)
	elseif hat then
	hatofon()
	hat = false
	Wait (600)
	ClearPedSecondaryTask(player)
	ClearPedProp(player, 0)
	end
	
	
end)


RegisterNetEvent('rklclothes:tshirt')
AddEventHandler('rklclothes:tshirt', function(item, wait, cb)
	local player = PlayerPedId()
	local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
	local skin1 = metadata.accessories
	 local skin2 = metadata.accessories2

	 
	 
	if not tshirt then
	tshirtonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	tshirt = true
	SetPedComponentVariation(player, 8, skin1, skin2, 0)
--	SetPedComponentVariation(PlayerPedId(), 3, 12, 0, 0) -- If you want to add a t-shirt, don’t touch this because it’s for the arms
	elseif tshirt then
	tshirtonoff()
	tshirt = false
	Wait (600)
	ClearPedSecondaryTask(player)
	SetPedComponentVariation(player, 8, -1, 0, 2)
	--SetPedComponentVariation(player, 3, 15, 0, 0)
	end
end)

RegisterNetEvent('rklclothes:arms')
AddEventHandler('rklclothes:arms', function(item, wait, cb)
	local player = PlayerPedId()
	local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
	local skin1 = metadata.accessories
	 local skin2 = metadata.accessories2

	 
	 
	if not arms then
	armsonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	arms = true
	SetPedComponentVariation(PlayerPedId(), 3, skin1, skin2, 0) 
	elseif arms then
	armsonoff()
	arms = false
	Wait (600)
	ClearPedSecondaryTask(player)

	SetPedComponentVariation(player, 3, 15, 0, 0)
	end
end)


RegisterNetEvent('rklclothes:torso')
AddEventHandler('rklclothes:torso', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2
	if not torso then
	torsoonoff()
	Wait(600)
	ClearPedSecondaryTask(player)
	torso = true
	SetPedComponentVariation(player, 11, skin1, skin2, 3) 
	--SetPedComponentVariation(player, 3, 12, 0, 0)
	elseif torso then
	torso = false
	torsoonoff()
	Wait(600)
	ClearPedSecondaryTask(player)
	SetPedComponentVariation(player, 11, 15, 0, 3)
	--SetPedComponentVariation(player, 3, 15, 0, 0)
	end
end)




RegisterNetEvent('rklclothes:jeans')
AddEventHandler('rklclothes:jeans', function(item, wait, cb)
    local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
	local skin2 = metadata.accessories2

	
	
	if not pants then
	jeansonoff()
	Wait(600)
	ClearPedSecondaryTask(player)
	pants = true
	SetPedComponentVariation(player, 4, skin1, skin2, 0) 
	elseif pants then
	jeansonoff()
	pants = false
	Wait(600)
	ClearPedSecondaryTask(player)
	SetPedComponentVariation(player, 4, 14, 1, 2)
	end


end)

RegisterNetEvent('rklclothes:shoes')
AddEventHandler('rklclothes:shoes', function(item, wait, cb)
	local player = PlayerPedId()
	local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
	local skin1 = metadata.accessories
	local skin2 = metadata.accessories2
 
	 
	 
	 if not shoes then
	 shoesonoff()
	 Wait(600)
	 ClearPedSecondaryTask(player)
	 shoes = true
	 SetPedComponentVariation(player, 6, skin1, skin2, 2) 
	 elseif shoes then
	 shoesonoff()
	 shoes = false
	 Wait(600)
	 ClearPedSecondaryTask(player)
	 SetPedComponentVariation(player, 6, 45, 0, 2)
	 end


end)
RegisterNetEvent('rklclothes:bag')
AddEventHandler('rklclothes:bag', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not bag then
	bagonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	bag = true
	SetPedComponentVariation(player, 5, skin1, skin2, 0)
	elseif bag then
	bagonoff()
	bag = false
	Wait (600)
	ClearPedSecondaryTask(player)
	SetPedComponentVariation(player, 5, 0, 0, 2)
	end
end)


RegisterNetEvent('rklclothes:watches')
AddEventHandler('rklclothes:watches', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not watches then
	watchesonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	watches = true
	SetPedPropIndex(player, 6, skin1, skin2, 0)
	elseif watches then
	watches = false
	Wait (600)
	ClearPedSecondaryTask(player)
	ClearPedProp(player,6)
	end
end)


RegisterNetEvent('rklclothes:chain')
AddEventHandler('rklclothes:chain', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not chain then
	chainonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	chain = true
	SetPedComponentVariation(player, 7, skin1, skin2, 0)
	elseif chain then
	chainonoff()
	chain = false
	Wait (600)
	SetPedComponentVariation(player, 7, 0, 0, 2)
	ClearPedProp(player,6)
	end
end)


RegisterNetEvent('rklclothes:bracelet')
AddEventHandler('rklclothes:bracelet', function(item, wait, cb)
   local player = PlayerPedId()
   local metadata = ESX.GetPlayerData().inventory[item.slot].metadata
   local skin1 = metadata.accessories
   local skin2 = metadata.accessories2

	if not bracelet then
	braceletonoff()
	Wait (600)
	ClearPedSecondaryTask(player)
	bracelet = true
	SetPedPropIndex(player, 7, skin1, skin2, 0)
	elseif bracelet then
	braceletonoff()
	bracelet = false
	Wait (600)
	ClearPedSecondaryTask(player)
	ClearPedProp(player,7)
	end
end)




		function torsoonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
                    Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "clothingtie", -- https://alexguirre.github.io/animations-list/
                            animationName = "try_tie_negative_a",
                        },
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function hatofon()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "missheist_agency2ahelmet", -- https://alexguirre.github.io/animations-list/
                            animationName = "take_off_helmet_stand",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
				function maskonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "mp_masks@standard_car@ds@", -- https://alexguirre.github.io/animations-list/
                            animationName = "put_on_mask",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function earsonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "mp_cp_stolen_tut", -- https://alexguirre.github.io/animations-list/
                            animationName = "b_think",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function tshirtonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "clothingtie", -- https://alexguirre.github.io/animations-list/
                            animationName = "try_tie_negative_a",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function armsonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "nmt_3_rcm-10", -- https://alexguirre.github.io/animations-list/
                            animationName = "cs_nigel_dual-10",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
				function jeansonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "re@construction", -- https://alexguirre.github.io/animations-list/
                            animationName = "out_of_breath",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
				function shoesonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "random@domestic", -- https://alexguirre.github.io/animations-list/
                            animationName = "pickup_low",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
				function bagonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "anim@heists@ornate_bank@grab_cash", -- https://alexguirre.github.io/animations-list/
                            animationName = "intro",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function watchesonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "nmt_3_rcm-10", -- https://alexguirre.github.io/animations-list/
                            animationName = "cs_nigel_dual-10",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function chainonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "clothingtie", -- https://alexguirre.github.io/animations-list/
                            animationName = "try_tie_positive_a",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function braceletonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "nmt_3_rcm-10", -- https://alexguirre.github.io/animations-list/
                            animationName = "cs_nigel_dual-10",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			function glassesonoff()
			exports.rprogress:Custom({
                    Async = true,
                    x = 0.5,
                    y = 0.5,
                    From = 0,
                    To = 100,
                    Duration = 1000,
                    Radius = 60,
                    Stroke = 10,
                    MaxAngle = 360,
                    Rotation = 0,
                    Easing = "easeLinear",
                    Label = "",
                    LabelPosition = "right",
                    Color = "rgba(255, 255, 255, 1.0)",
                    BGColor = "rgba(0, 0, 0, 0.4)",
					
                      
						Animation = {
                            --scenario = "WORLD_HUMAN_AA_SMOKE", -- https://pastebin.com/6mrYTdQv
                            animationDictionary = "clothingspecs", -- https://alexguirre.github.io/animations-list/
                            animationName = "take_off",
                        },
						
                    DisableControls = {
                        Mouse = false,
                        Player = false,
                        Vehicle = false
                    }                                
                })
                 
			end
			
			

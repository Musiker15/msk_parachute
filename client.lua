ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    ESX.PlayerData = ESX.GetPlayerData()
end)

-- Parachute
RegisterNetEvent('esx_extraitems:getparachute')
AddEventHandler('esx_extraitems:getparachute', function()
	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then  
		  SetPedComponentVariation (playerPed, 5, 63, 0)
		else  
		  SetPedComponentVariation (playerPed, 5, 63, 0)
		end  
	end)
end)

RegisterNetEvent('esx_extraitems:delparachute')
AddEventHandler('esx_extraitems:delparachute', function()
	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then  
		  SetPedComponentVariation (playerPed, 5, 0, 0)
		else  
		  SetPedComponentVariation (playerPed, 5, 0, 0)
		end  
	end)
end)
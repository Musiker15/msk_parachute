ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Parachute
RegisterNetEvent('esx_parachute:getparachute')
AddEventHandler('esx_parachute:getparachute', function()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.bags_1 ~= 63 then
            TriggerEvent('skinchanger:change', "bags_1", 63)
            TriggerEvent('skinchanger:change', "bags_2", 0)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end
    end)
end)

RegisterNetEvent('esx_parachute:delparachute')
AddEventHandler('esx_parachute:delparachute', function()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.bags_1 ~= 82 then
            TriggerEvent('skinchanger:change', "bags_1", 0)
            TriggerEvent('skinchanger:change', "bags_2", 0)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end
    end)
end)

if Config.GiveParachute = true then
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
       	local playerPed = PlayerPedId()

    	if IsPedInAnyHeli(playerPed) or IsPedInAnyPlane(playerPed) then
			TriggerServerEvent('esx_parachute:setparachute')
        end
    end
end)
else
end

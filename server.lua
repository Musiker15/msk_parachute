ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Parachute
ESX.RegisterUsableItem('parachute', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if not xPlayer.hasWeapon("GADGET_PARACHUTE") then
		TriggerClientEvent('esx_extraitems:getparachute', source)
		xPlayer.addWeapon('GADGET_PARACHUTE', 1)
		xPlayer.removeInventoryItem("parachute", 1)
		xPlayer.addInventoryItem("noparachute", 1)
		xPlayer.showNotification(_U('used_parachute'))
	else
		xPlayer.showNotification(_U('has_parachute'))
	end
end)

ESX.RegisterUsableItem('noparachute', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.hasWeapon("GADGET_PARACHUTE") then
		TriggerClientEvent("esx_extraitems:delparachute", source)
		xPlayer.removeWeapon('GADGET_PARACHUTE', 1)
		xPlayer.addInventoryItem("parachute", 1)
		xPlayer.removeInventoryItem("noparachute", 1)
		xPlayer.showNotification(_U('used_noparachute'))
	elseif not xPlayer.hasWeapon("GADGET_PARACHUTE") then
		TriggerClientEvent("esx_extraitems:delparachute", source)
		xPlayer.removeInventoryItem("noparachute", 1)
  	end
end)

---- GitHub Updater ----
if Config.VersionChecker then
	function GetCurrentVersion()
		return GetResourceMetadata( GetCurrentResourceName(), "version" )
	end

	local CurrentVersion = GetCurrentVersion()
	local resourceName = "^4["..GetCurrentResourceName().."]^0"

	PerformHttpRequest('https://raw.githubusercontent.com/Musiker15/parachute/main/VERSION', function(Error, NewestVersion, Header)
		print("###############################")
    	if CurrentVersion == NewestVersion then
	    	print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    	elseif CurrentVersion ~= NewestVersion then
        	print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
	    	print('^5Newest Version: ^2' .. NewestVersion .. '^0 - ^6Download here: ^9https://github.com/Musiker15/parachute/releases/tag/v'.. NewestVersion .. '^0')
    	end
		print("###############################")
	end)
else
	print("###############################")
	print(resourceName .. '^2 ✓ Resource started^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
	print("###############################")
end
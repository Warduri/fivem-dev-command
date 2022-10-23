print("^2Script commandes pour dev | Version 1.0 | créateur : Jules Vance")

ShowNotificationTicker = function(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(0, 1)
end

RegisterCommand('getpos', function()
    local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
    SendNUIMessage({
        type = 'clipboard',
        data = '' .. vec(coords.x, coords.y, coords.z)
    })
    ShowNotificationTicker('~b~Coordonnée copiée ! ' .. vec(coords.x, coords.y, coords.z))
end)
TriggerEvent('chat:addSuggestion', '/getpos', 'Copier votre position actuelle', {})

RegisterCommand('getheading', function()
    local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
    SendNUIMessage({
        type = 'clipboard',
        data = 'heading( ' .. heading .. ' )'
    })
    ShowNotificationTicker('~b~Heading copiée ! ' .. heading)
end)
TriggerEvent('chat:addSuggestion', '/getheading', 'Copier votre direction (heading) actuelle', {})

RegisterCommand('getcarname', function()
	local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	local veh = GetEntityModel(Vehicle)
	local vehicle_name = GetDisplayNameFromVehicleModel(veh)
	
	if(Vehicle == 0)
	then
	   ShowNotificationTicker("Vous n'etes dans aucun véhicule.")
	else
		SendNUIMessage({
		type = 'clipboard',
		data = 'véhicule = ' .. vehicle_name
		})
		ShowNotificationTicker('~b~Nom du véhicule copiée ! ' .. vehicle_name)
	end 
end)
TriggerEvent('chat:addSuggestion', '/getcarname', 'Copier le nom de votre voiture actuelle', {})
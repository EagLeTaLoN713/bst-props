local town_hash = nil

local function IsTownBanned()
	for k,v in pairs(Config.BannedTowns) do
		if town_hash == GetHashKey(v) then
			return true
		end
	end
	return false
end

local status = false

local tent = 0
local campfire = 0 
local bedroll = 0
local wood = 0
local flint = 0
local tentlarge = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        -- Set the active zone
        town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 1)
    end
end)

RegisterNetEvent('syn:tent')
AddEventHandler('syn:tent', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_SLEDGEHAMMER'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, "You're placing a tent...")
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, -1.55))
    local prop = CreateObject(GetHashKey("s_tentbison01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop
end)

RegisterNetEvent('syn:tentlarge')
AddEventHandler('syn:tentlarge', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if tentlarge ~= 0 then
        SetEntityAsMissionEntity(tentlarge)
        DeleteObject(tentlarge)
        tentlarge = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_SLEDGEHAMMER'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, "You're placing a large tent...")
    Citizen.Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("p_tentnorth01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tentlarge = prop
end)

RegisterNetEvent('syn:deadwood')
AddEventHandler('syn:deadwood', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if deadwood ~= 0 then
        SetEntityAsMissionEntity(deadwood)
        DeleteObject(deadwood)
        deadwood = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    exports['progressBars']:startUI(10000, "You're placing some kindling...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("p_kindlingpile01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    deadwood = prop
end)



RegisterNetEvent('syn:flint')
AddEventHandler('syn:flint', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if flint ~= 0 then
        SetEntityAsMissionEntity(flint)
        DeleteObject(flint)
        DeleteObject(deadwood)
        flint = 0
        
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
    exports['progressBars']:startUI(10000, "You're starting a fire...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfirefresh01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    flint = prop
end)

RegisterNetEvent('syn:campfire')
AddEventHandler('syn:campfire', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "You're placing a campfire...")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

end)

RegisterNetEvent('syn:bedroll')
AddEventHandler('syn:bedroll', function()
    if IsTownBanned() == false then
        TriggerEvent("vorp:TipRight", "Restricted Area", 7000)
        return
    end

    if bedroll ~= 0 then
        SetEntityAsMissionEntity(bedroll)
        DeleteObject(bedroll)
        bedroll = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
    exports['progressBars']:startUI(5000, "You're placing your bedroll...")
    Citizen.Wait(5000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_bedindian01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    bedroll = prop

end)

------------------- Commands to remove/disabled prop -------------------
RegisterCommand('dtent', function(source, args, rawCommand)
    if tent == 0 then
     --   print("No hay tienda.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
		TriggerServerEvent('syn:additem', "tent")
        
    end
end)

RegisterCommand('dtentlarge', function(source, args, rawCommand)
    if tentlarge == 0 then
     --   print("No hay tienda.")
    else
        SetEntityAsMissionEntity(tentlarge)
        DeleteObject(tentlarge)
        tentlarge = 0
		TriggerServerEvent('syn:additem', "tentlarge")
        
    end
end)


RegisterCommand('dbedroll', function(source, args, rawCommand)
    if bedroll == 0 then
     --   print("There is no bedroll.")
    else
        SetEntityAsMissionEntity(bedroll)
        DeleteObject(bedroll)
        bedroll = 0
		TriggerServerEvent('syn:additem', "bedroll")
        
    end
end)

RegisterCommand('dfire', function(source, args, rawCommand)
    if flint == 0 then
     --   print("There is no campfire.")
    else
        SetEntityAsMissionEntity(flint)
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), 7000, true, false, false, false)
        TriggerEvent("vorp:TipRight", "Putting out the campfire...", 7000)
        Wait(7000)
        ClearPedTasksImmediately(PlayerPedId())
        DeleteObject(flint)
        DeleteObject(deadwood)
        flint = 0
        deadwood = 0
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
        local prop = CreateObject(GetHashKey("p_campfiredebris01x"), x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        fireout = prop
		
    
    end
end)


RegisterCommand('dcampfire', function(source, args, rawCommand)
    if campfire == 0 then
     --   print("There is no campfire.")
    else
        SetEntityAsMissionEntity(campfire)
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), 7000, true, false, false, false)
        TriggerEvent("vorp:TipRight", "Putting out the campfire...", 7000)
        Wait(7000)
        ClearPedTasksImmediately(PlayerPedId())
        DeleteObject(campfire)
        campfire = 0
       
		TriggerServerEvent('syn:additem', "campfire")
        
    end
end, false)

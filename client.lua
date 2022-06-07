local town_hash = nil



local status = false

local tent = 0
local campfire = 0 
local bedroll = 0
local wood = 0
local flint = 0
local tentlarge = 0



RegisterNetEvent('syn:tent')
AddEventHandler('syn:tent', function()
   

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


local Anims = {

    
    ["craft"] = {
        dict = "mech_inventory@crafting@fallbacks",
        name = "full_craft_and_stow", 
        flag = 24
},
    ["campfire"] = {
            dict = "script_campfire@lighting_fire@male_male",
           name = "light_fire_b_p2_male_b", 
            flag = 24
	},
    ["kindling"] = {
        dict = "script_common@shared_scenarios@kneel@rummage@male_a@idle_a",
       name = "idle_b", 
        flag = 24
},
    ["bedroll"] = {
    dict = "script_common@shared_scenarios@kneel@rummage@male_a@idle_a",
    name = "idle_b", 
    flag = 24
},
    ["crouch"] = {
        dict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@kneel1@male_a",
       name = "kneel1_trans_log1", 
        flag = 24
},
  
}

function PlayAnimation(ped, anim)
	if not DoesAnimDictExist(anim.dict) then
		return
	end

	RequestAnimDict(anim.dict)

	while not HasAnimDictLoaded(anim.dict) do
		Wait(0)
	end

	TaskPlayAnim(ped, anim.dict, anim.name, 1.0, 1.0, -1, anim.flag, 0, false, false, false, '', false)

	RemoveAnimDict(anim.dict)
end

RegisterNetEvent('syn:deadwood')
AddEventHandler('syn:deadwood', function()
   

    if deadwood ~= 0 then
        SetEntityAsMissionEntity(deadwood)
        DeleteObject(deadwood)
        deadwood = 0
    end
    local ped = PlayerPedId()

    Citizen.Wait(10)
    
   
    --AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.02, 0.01, 0.05, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
    
    
    PlayAnimation(ped, Anims["crouch"])
    Wait(3000)
    PlayAnimation(ped, Anims["kindling"])
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 12000, false, false, false, false)
    exports['progressBars']:startUI(Config.CraftTime, "You're placing some kindling...")
    Citizen.Wait(Config.CraftTime)
    
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("p_kindlingpile01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    deadwood = prop
end)



RegisterNetEvent('syn:flint')
AddEventHandler('syn:flint', function()
   

    if flint ~= 0 then
        SetEntityAsMissionEntity(flint)
        DeleteObject(flint)
        DeleteObject(deadwood)
        flint = 0
        
    end
    local ped = PlayerPedId()

    Citizen.Wait(10)
    
   
    --AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.02, 0.01, 0.05, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
    
    
    PlayAnimation(ped, Anims["crouch"])
    Wait(3000)
    PlayAnimation(ped, Anims["campfire"])
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 12000, false, false, false, false)
    exports['progressBars']:startUI(Config.CraftTime, "You're lighting the kindling...")
    Citizen.Wait(Config.CraftTime)
    
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfirefresh01x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    flint = prop
end)

-----DISABLED IF YOU USE bcc-crafting or syn_crafting
--[[RegisterNetEvent('syn:campfire')
AddEventHandler('syn:campfire', function()
    

    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end
    local ped = PlayerPedId()
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, ped, 2, 1)
    Citizen.Wait(10)
    
   
    --AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.02, 0.01, 0.05, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
    
    
    PlayAnimation(ped, Anims["crouch"])
    Wait(3000)
    PlayAnimation(ped, Anims["campfire"])
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 12000, false, false, false, false)
    exports['progressBars']:startUI(Config.CraftTime, "Placing your Campfire...")
    Citizen.Wait(Config.CraftTime)
    
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    
    local prop = CreateObject(GetHashKey(Config.PlaceableCampfire), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

end)]]

RegisterNetEvent('syn:bedroll')
AddEventHandler('syn:bedroll', function()
    

    if bedroll ~= 0 then
        SetEntityAsMissionEntity(bedroll)
        DeleteObject(bedroll)
        bedroll = 0
        local ped = PlayerPedId()
    
        Citizen.InvokeNative(0xFCCC886EDE3C63EC, ped, 2, 1)
        Citizen.Wait(10)
        
       
        --AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.02, 0.01, 0.05, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
        
        
        PlayAnimation(ped, Anims["crouch"])
        Wait(3000)
        PlayAnimation(ped, Anims["kindling"])
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 12000, false, false, false, false)
        exports['progressBars']:startUI(Config.CraftTime, "Placing your BedRoll...")
        Citizen.Wait(Config.CraftTime)
        
        ClearPedTasksImmediately(PlayerPedId())
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
        
        local prop = CreateObject(GetHashKey(Config.PlaceableCampfire), x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        bedroll = prop
    end
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
       
		
        
    end
end, false)

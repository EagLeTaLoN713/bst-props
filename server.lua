local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()

    Citizen.Wait(1000)


    VorpInv.RegisterUsableItem("campfire", function(data)
        VorpInv.subItem(data.source, "campfire", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a campfire", 5000)
        TriggerClientEvent("syn:campfire", data.source)
    end)
    VorpInv.RegisterUsableItem("tentlarge", function(data)
        VorpInv.subItem(data.source, "tentlarge", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a large tent", 5000)
        TriggerClientEvent("syn:tentlarge", data.source)
    end)

    VorpInv.RegisterUsableItem("deadwood", function(data)
        VorpInv.subItem(data.source, "deadwood", 1)
       TriggerClientEvent("vorp:TipRight", data.source, "You're placing kindling", 5000)
        TriggerClientEvent("syn:deadwood", data.source)
    end)

    VorpInv.RegisterUsableItem("flint", function(data)
        VorpInv.subItem(data.source, "flint", 1)
       TriggerClientEvent("vorp:TipRight", data.source, "You're lighting your fire", 5000)
        TriggerClientEvent("syn:flint", data.source)
    end)
------------------
VorpInv.RegisterUsableItem("bedroll", function(data)
        VorpInv.subItem(data.source, "bedroll", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a bedroll", 5000)
        TriggerClientEvent("syn:bedroll", data.source)
    end)
------------

    VorpInv.RegisterUsableItem("tent", function(data)
        TriggerClientEvent("syn_changingroom:canplace",data.source)
    end)

end)

RegisterNetEvent("syn:puttent")
AddEventHandler("syn:puttent", function()
    local _source = source
    VorpInv.subItem(_source, "tent", 1)
    TriggerClientEvent("vorp:TipRight", _source, "You're placing a tent", 5000)
    TriggerClientEvent("syn:tent", _source)
end)

RegisterNetEvent("syn:additem")
AddEventHandler("syn:additem", function(item)
    local _source = source
    VorpInv.addItem(source, item, 1)
end)

AddEventHandler('syn:additem', function(Item)
        if Item == 'bedroll' then
          VorpInv.addItem(source, "bedroll", 0)
          TriggerClientEvent("vorp:TipRight", source, "You've got your bedroll back", 5000)
        elseif Item == 'tent' then
          VorpInv.addItem(source, "tent", 0)
          TriggerClientEvent("vorp:TipRight", source, "You've got your tent back", 5000)
        elseif Item == 'tentlarge' then
            VorpInv.addItem(source, "tentlarge", 0)
            TriggerClientEvent("vorp:TipRight", source, "You've got your large tent back", 5000)
        end
      end)

local QBCore = exports['qb-core']:GetCoreObject()
local bones = {'bonnet', 'boot'}

CreateThread(function()
    exports['qb-target']:AddTargetBone(bones, {
        options = {
            ["Impound"] = {
                icon = "fas fa-lock",
                label = "Impound Request",
                event = "dynyx-impound:client:OpenImpoundMenu",
                distance = 1.3
            }
        }
    })
end)


RegisterNetEvent('dynyx-impound:client:OpenImpoundMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Vehicle Scuff",
            txt = "Vehicle in an unrecoverable state.",
            params = {
                event = "dynyx-impound:client:VehicleScuff",
            }
        },
        {
            header = "Parking Violation",
            txt = "Vehicle parked in an restricted or unauthorized place.",
            params = {
                event = "dynyx-impound:client:ParkingViolation",
            }
        },
        {
            header = "Police Impound",
            txt = "Sends vehicle to police impound lot.",
            params = {
                event = "dynyx-impound:client:PDImpound",
            }
        },
    })
end)

RegisterNetEvent('dynyx-impound:client:VehicleScuff', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("dynyx-impound:server:VehicS")
        QBCore.Functions.Notify("Impound Request Accepted", "success")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('dynyx-impound:client:ParkingViolation', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("dynyx-impound:server:ParkingVio")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('dynyx-impound:client:PDImpound', function()
    TriggerServerEvent("dynyx-impound:server:PDIm")
    QBCore.Functions.Notify("Impound Request Accepted", "success")
end)
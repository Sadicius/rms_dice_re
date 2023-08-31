local RSGCore = exports['rsg-core']:GetCoreObject()
--local diceProp = nil

-- Función para cerrar la interfaz del dado
local function CloseDiceInterface()
    SetNuiFocus(false, false)
    SendNUIMessage({ show = false })
    ClearPedSecondaryTask(PlayerPedId())
    --SetEntityAsMissionEntity(diceProp)
    --DeleteObject(diceProp)
end

 -- Función para abrir la interfaz del dado
local function OpenDiceInterface()
    local ped = PlayerPedId()
    local ped_coords = GetEntityCoords(ped)
    
    SetNuiFocus(true, true)
    SendNUIMessage({ 
        show = true;
})
end

-- Callback para cerrar la interfaz del dado
RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)

-- Callback para manejar la acción de escape
RegisterNUICallback('escape', function(data, cb)
    local ped = PlayerPedId()
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNetEvent('rms_dice:client:OpenDice')
AddEventHandler('rms_dice:client:OpenDice', function(diceNumber)
    -- Ahora la función OpenDice recibe el argumento diceNumber
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_PICKUP_WEAPON_THROWN_TOMAHAWK_ANCIENT'), -1, true, false, false, false)
    OpenDiceInterface()
end)


-- Evento para cerrar la interfaz del dado
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        CloseDiceInterface()
    end
end)

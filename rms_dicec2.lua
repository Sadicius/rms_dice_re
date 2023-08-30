local RSGCore = exports['rsg-core']:GetCoreObject()
local diceProp = nil

-- Función para reproducir una animación
local function PlayAnimation(dict, name, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(dict)
end

-- Función para cerrar la interfaz del dado
local function CloseDiceInterface()
    SetNuiFocus(false, false)
    SendNUIMessage({ show = false })
    ClearPedSecondaryTask(PlayerPedId())
    SetEntityAsMissionEntity(diceProp)
    DeleteObject(diceProp)
end

-- Función para abrir la interfaz del dado
local function OpenDiceInterface(diceName)
    local ped = PlayerPedId()
    local ped_coords = GetEntityCoords(ped)
    SetNuiFocus(true, true)
    SendNUIMessage({
        show = true,
        dice = diceName,
    })
end

-- Callback para manejar la acción de escape
RegisterNUICallback('escape', function(data, cb)
    local ped = PlayerPedId()
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Evento para activar una animación relacionada con el dado
RegisterNetEvent("rms_dice:ToggleDiceAnim")
AddEventHandler("rms_dice:ToggleDiceAnim", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_PICKUP_WEAPON_THROWN_TOMAHAWK_ANCIENT'), -1, true, false, false, false)
end)

-- Evento para abrir la interfaz del dado
RegisterNetEvent('rms_dice:client:OpenDice')
AddEventHandler('rms_dice:client:OpenDice', function(diceName)
    OpenDiceInterface(diceName)
end)

-- Evento para cerrar la interfaz del dado
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        CloseDiceInterface()
    end
end)

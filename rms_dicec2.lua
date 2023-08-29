local RSGCore = exports['rsg-core']:GetCoreObject()

local dadoActivo = 'dice' -- Este valor se actualiza cuando se elige un dado específico
local diceNumber = math.random(1, 6)

-- Evento para mostrar el menú de elección de dados
RegisterNetEvent("rms_dice:Client:DiceChoosed")
AddEventHandler("rms_dice:Client:DiceChoosed", function(dadoActivo)
    SendNUIMessage({
        open = true,
        class = 'choose',
        data = dadoActivo,
    })
end)

-- Callback para recibir el número del dado activo desde la interfaz
RegisterNUICallback('NumerodadoActivo', function(data)
    local dadoActivo = data.DadoActivo
    local diceNumber = data.DiceNumber -- Recibe el número del dado desde el servidor

    TriggerServerEvent('rms_dice:Server:GetDado', dadoActivo, diceNumber)
end)

--[[ -- Evento para activar la animación de lanzamiento del dado
RegisterNetEvent("rms_dice:randomDice")
AddEventHandler("rms_dice:randomDice", function()
    local diceNumber = math.random(1, 6) -- Genera un número aleatorio de 1 a 6
    print('Número del dado:', diceNumber)
    TriggerServerEvent('rms_dice:Server:rewardice', diceNumber)
end) ]]

-- Evento personalizado para establecer el número del dado en el lado del cliente
RegisterNetEvent("rms_dice:Client:SetDiceNumber")
AddEventHandler("rms_dice:Client:SetDiceNumber", function(diceNumber)
    -- Aquí puedes usar diceNumber para cualquier propósito en el lado del cliente
    -- Por ejemplo, puedes activar la animación del dado o mostrar el número en la interfaz del usuario
end)

-- Callback para cerrar la interfaz del dado
RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)

-- Evento para activar una animación relacionada con el dado (ejemplo)
RegisterNetEvent("rms_dice:ToggleDiceAnim")
AddEventHandler("rms_dice:ToggleDiceAnim", function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_PICKUP_WEAPON_THROWN_TOMAHAWK_ANCIENT'), -1, true, false, false, false)
end)

-- Define una función personalizada en el lado del cliente para llamar a flipDice()
RegisterNetEvent("rms_dice:Client:StartDiceAnimation")
AddEventHandler("rms_dice:Client:StartDiceAnimation", function()
    TriggerEvent("FlipDice")
end)

-- Exportación de funciones para su uso en otros scripts
exports('openDice', openDice)
exports('closeDice', closeDice)
exports('showDice', showDice)

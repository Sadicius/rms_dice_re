local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent('rms_dice:server:SendDiceNumber')
AddEventHandler('rms_dice:server:SendDiceNumber', function(diceNumber)
    -- The 'diceNumber' variable now contains the result from the client
    print("Received dice number from client: " .. diceNumber)
end)

-- Función para generar un número aleatorio de 1 a 6
local function RollDice()
    return math.random(1, 6)
end

-- Función para manejar la acción del jugador al usar un dado
local function UseDice(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    local diceNumber = RollDice()

    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('rms_dice:ToggleDiceAnim', source)
        Citizen.Wait(2000)
        local mensajeChat = "¡El resultado del dado es: " .. diceNumber .. "!"
        TriggerClientEvent('chatMessage', -1, mensajeChat)
        TriggerClientEvent('rms_dice:Client:SetDiceNumber', source, diceNumber) -- Envía el resultado del dado al cliente
    end
end

-- Evento para abrir la interfaz del dado
CreateThread(function()
    RSGCore.Functions.CreateUseableItem("dice", function(source)
        TriggerClientEvent("rms_dice:client:OpenDice", source)
    end)
end)


-- Evento para manejar el uso del dado por el jugador
RSGCore.Functions.CreateUseableItem("dice", function(source, item)
    UseDice(source, item)
end)
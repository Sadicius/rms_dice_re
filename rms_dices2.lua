local RSGCore = exports['rsg-core']:GetCoreObject()


-- Evento personalizado para recibir el número del dado y notificar al jugador
RegisterNetEvent("rms_dice:Server:GetDado")
AddEventHandler("rms_dice:Server:GetDado", function(dadoActivo, diceNumber)
    local source 

    TriggerClientEvent("rms_dice:Client:StartDiceAnimation", source, diceNumber)
    TriggerClientEvent('rms_dice:randomDice', source, diceNumber)
    TriggerClientEvent('RSGCore:Notify', source, "Obtuviste el número " .. diceNumber)
end)

-- Creación de un elemento usable (ejemplo)
RSGCore.Functions.CreateUseableItem("dice", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        -- Generar un número aleatorio de 1 a 6 para el dado
        --local diceNumber = math.random(1, 6)
        TriggerClientEvent('rms_dice:Client:SetDiceNumber', -1, diceNumber)

        TriggerClientEvent('rms_dice:ToggleDiceAnim', source)
        TriggerClientEvent('rms_dice:Client:UseDice', source, diceNumber)
        TriggerClientEvent("rms_dice:Client:StartDiceAnimation", source, diceNumber)

        Wait(2000)
        local mensajeChat = "¡El resultado del dado es: " .. diceNumber .. "!"
        TriggerClientEvent('chatMessage', -1, mensajeChat)
        local mensajeRol = "¡El resultado del dado es: " .. diceNumber .. "!"
        TriggerClientEvent('RSGCore:triggerDisplay', -1, mensajeRol, source, "do") 
    end
end)

--[[ local RSGCore = exports['rsg-core']:GetCoreObject()
local globalDiceNumber = 0 -- Generar un número aleatorio de 1 a 6

-- Evento para activar la animación de lanzamiento del dado
RegisterNetEvent("rms_dice:randomDice")
AddEventHandler("rms_dice:randomDice", function()
    local diceNumber = math.random(1, 6) -- Genera un número aleatorio de 1 a 6
    
    -- Almacena el número en la variable global
    globalDiceNumber = diceNumber

    print('Número del dado:', diceNumber)

    -- Envía el número del dado al cliente
    TriggerClientEvent('rms_dice:Client:SetDiceNumber', -1, globalDiceNumber)

    -- Luego, puedes utilizar globalDiceNumber en otras partes de tu código
end)

-- Si deseas acceder a globalDiceNumber desde otras partes de server.lua, simplemente utiliza esa variable global.


-- Evento para obtener el número del dado y notificar al jugador
RegisterServerEvent('rms_dice:Server:GetDado')
AddEventHandler('rms_dice:Server:GetDado', function(dadoActivo)
    local source = source
    
    TriggerClientEvent('rms_dice:randomDice', diceNumber)

    -- Verificar si se eligió un dado activo (puedes usar dadoActivo para alguna lógica adicional aquí)

    TriggerClientEvent('RSGCore:Notify', source, "Obtuviste el número "..diceNumber)

    -- Enviar el número del dado al cliente
    TriggerClientEvent('rms_dice:Client:SetDiceNumber', source, diceNumber)
end)

-- Creación de un elemento usable (ejemplo)
RSGCore.Functions.CreateUseableItem("dice", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then

        -- Generar un número aleatorio de 1 a 6 para el dado
        local diceNumber = math.random(1, 6)
        -- TriggerClientEvent('rms_dice:randomDice', diceNumber)
        -- También puedes enviar el resultado a la interfaz del cliente si es necesario
        -- TriggerClientEvent('rms_dice:Client:SetDiceNumber', source, diceNumber)

        -- Activar una animación relacionada con el dado (ejemplo)
        TriggerClientEvent('rms_dice:ToggleDiceAnim', source)

        -- Llamar a la función personalizada en el lado del cliente para iniciar la animación
        --TriggerClientEvent("rms_dice:Client:StartDiceAnimation", source)

        -- Esperar un momento antes de mostrar el resultado (esto podría no ser necesario)
        Wait(2000)

        -- Enviar el resultado del dado a todos los jugadores
        local mensajeChat = "¡El resultado del dado es: " .. diceNumber .. "!"
        TriggerClientEvent('chatMessage', -1, mensajeChat)

        -- Enviar el resultado del dado como un evento para el rol
        local mensajeRol = "¡El resultado del dado es: " .. diceNumber .. "!"
        TriggerClientEvent('RSGCore:triggerDisplay', -1, mensajeRol, source, "do")

        
    end
end)





 ]]
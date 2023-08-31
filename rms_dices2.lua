local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("dice", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    --local diceNumber = math.random(1, 6)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        -- Generar un número aleatorio de 1 a 6 para el dado
        TriggerClientEvent("rms_dice:client:OpenDice", source)
        Wait(2000)
        --local mensajeRol = "¡El resultado del dado es: " .. diceNumber .. "!"
        --TriggerClientEvent('RSGCore:triggerDisplay', -1, mensajeRol, source, "do") 
    end
end)

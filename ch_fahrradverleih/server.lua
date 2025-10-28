ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("ch-fahrradverleih:buyBike")
AddEventHandler("ch-fahrradverleih:buyBike", function(model, price, spawn)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent("ch-fahrradverleih:spawnBike", source, model, spawn)
        xPlayer.showNotification("Du hast ein ~g~" .. model .. "~s~ für $" .. price .. " gemietet.")
    else
        xPlayer.showNotification("~r~Du hast nicht genug Geld.")
    end
end)

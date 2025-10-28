ESX = exports["es_extended"]:getSharedObject()

-- Blips erstellen
Citizen.CreateThread(function()
    if Config.ShowBlips then
        for _, v in pairs(Config.Stations) do
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, Config.BlipSprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.BlipScale)
            SetBlipColour(blip, Config.BlipColor)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.BlipName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- Marker & Interaktion
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Stations) do
            local dist = #(playerCoords - v.coords)

            if dist < Config.DrawDistance then
                sleep = 0
                DrawMarker(
                    Config.MarkerType,
                    v.coords.x, v.coords.y, v.coords.z - 1.0,
                    0, 0, 0, 0, 0, 0,
                    Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
                    Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a,
                    false, true, 2, false, false, false, false
                )

                if dist < 1.5 then
                    ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~, um ein Fahrrad zu leihen")

                    if IsControlJustReleased(0, Config.InteractKey) then
                        OpenBikeMenu(v)
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

-- Menü öffnen
function OpenBikeMenu(station)
    local elements = {}

    for _, bike in pairs(station.bikes) do
        table.insert(elements, {
            label = bike.label .. " - $" .. bike.price,
            value = bike.model,
            price = bike.price
        })
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bike_menu', {
        title    = "🚲 Fahrradverleih",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent("ch-fahrradverleih:buyBike", data.current.value, data.current.price, station.spawn)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

-- Fahrrad spawnen
RegisterNetEvent("ch-fahrradverleih:spawnBike")
AddEventHandler("ch-fahrradverleih:spawnBike", function(model, spawn)
    local playerPed = PlayerPedId()
    local vehicleHash = GetHashKey(model)

    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Citizen.Wait(10)
    end

    local vehicle = CreateVehicle(vehicleHash, spawn.x, spawn.y, spawn.z, spawn.w, true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetVehicleNumberPlateText(vehicle, "BIKE"..math.random(100,999))
    SetVehicleDirtLevel(vehicle, 0.0)
    SetEntityAsMissionEntity(vehicle, true, true)

    ESX.ShowNotification("Du hast dein Fahrrad erhalten! Viel Spaß 🚴")
end)

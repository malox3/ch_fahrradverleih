Config = {}

-- Blip-Einstellungen
Config.ShowBlips = true
Config.BlipSprite = 226       -- Fahrrad-Icon
Config.BlipColor = 2          -- Grün
Config.BlipScale = 0.8
Config.BlipName = "Fahrradverleih"

-- Marker-Einstellungen
Config.MarkerType = 38
Config.MarkerSize = {x = 0.5, y = 0.5, z = 0.5}
Config.MarkerColor = {r = 255, g = 255, b = 255, a = 255} -- RGBA
Config.DrawDistance = 10.0
Config.InteractKey = 38 -- Taste E

-- Fahrradverleih-Stationen
Config.Stations = {
    {
        coords = vector3(121.6181, -893.6104, 31.3481), -- Menüposition
        spawn = vector4(125.3556, -890.8011, 30.3521, 271.7602), -- Spawnpunkt
        bikes = {
            {label = "BMX", model = "bmx", price = 50},
            {label = "Cruiser", model = "cruiser", price = 70},
            {label = "Fixter", model = "fixter", price = 90},
            {label = "Scorcher", model = "scorcher", price = 100}
        }
    },

    {
        coords = vector3(-1218.5302, -1499.9871, 5.3400),
        spawn = vector4(-1221.5642, -1501.0259, 4.3596, 127.5703),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    },

    {
        coords = vector3(-342.7579, -95.2963, 46.6640),
        spawn = vector4(-345.6610, -94.5542, 45.6640, 74.1115),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    },

    {
        coords = vector3(1849.0597, 3675.9363, 34.7874),
        spawn = vector4(1847.0396, 3672.3960, 33.7017, 212.0475),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    },
    
    {
        coords = vector3(1850.8887, 3677.2097, 34.8137),
        spawn = vector4(1847.3461, 3672.1609, 33.7006, 206.9390),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    },
 
    {
        coords = vector3(1694.5405, 4920.6230, 43.2316),
        spawn = vector4(1692.4164, 4918.6636, 42.0782, 157.1717),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    },

    {
        coords = vector3(125.4166, 6632.3081, 32.8792),
        spawn = vector4(127.6173, 6633.2798, 31.8572, 224.7889 ),
        bikes = {
            {label = "BMX", model = "bmx", price = 40},
            {label = "Fixter", model = "fixter", price = 85}
        }
    }
}




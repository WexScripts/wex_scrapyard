WEX = {}
WEX.Debug = false    -- Set to false in production   --  Enable or disable debug mode
WEX.NotifyType = 'ox' -- 'ox' or 'esx' or 'custom'  --  change in client/cl_edit.lua
WEX.PoliceAlert = 'custom' --  'cd' or 'custom'         --  change in client/cl_edit.lua
WEX.PoliceJobs = {'police'} --  List of police jobs for alerts
WEX.PercentageToAlertPolice = 35 --  Percentage chance to alert police when scrapping a vehicle
WEX.OxInv = true -- Set to false if you are not using ox_inventory
WEX.MaxParts = 7 -- Maximum number of parts that can be scrapped from a vehicle

WEX.Yards = {
    ['scrapyard1'] = {
        coords = vector3(-507.3185, -1724.1366, 19.3270), -- Example coordinates
        size = vector3(5.0, 5.0, 5.0), -- Example size
        blip = { -- Table or false
            sprite = 478, -- Example blip sprite
            color = 2, -- Example blip color
            scale = 1.0, -- Example blip scale
            name = 'Scrapyard', -- Blip name
        },
    },
    ['scrapyard2'] = {
        coords = vector3(2000.0, -3000.0, 30.0), -- Example coordinates
        size = vector3(50.0, 50.0, 5.0), -- Example size
        blip = { -- Table or false
            sprite = 478, -- Example blip sprite
            color = 2, -- Example blip color
            scale = 1.0, -- Example blip scale
            name = 'Scrapyard', -- Blip name
        },
    },
}

WEX.Sell = {
    ['Sell1'] = {
        coords = vector4(000.0, -2000.0, 30.0, 0.0), -- Example coordinates
        itemsToSell = {
            { item = 'scrap_metal', price = 50 }, -- Example item and price
            { item = 'old_parts', price = 30 }, -- Example item and price
        },
        blip = {  -- Table or false
            sprite = 478, -- Example blip sprite
            color = 2, -- Example blip color
            scale = 1.0, -- Example blip scale
            name = 'Sell Point', -- Blip name
        },
    }
}
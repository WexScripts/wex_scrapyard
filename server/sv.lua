local ox_inventory = exports.ox_inventory


RegisterNetEvent('wex_scrapyard:givescrap', function(id)
    local randomNumber = math.random(1, 8)
    if randomNumber > 4 then
        -- give scrap metal
        addItem(id,"scrapmetal", randomNumber)
    elseif randomNumber == 1 then
        -- give hood
        addItem(id,"hood", 1)
    elseif randomNumber == 2 then
        -- give wheel
        addItem(id,"wheel", 4)
    elseif randomNumber == 3 then
        -- give door
        addItem(id,"door", 4)
    end
end)


function addItem(id,item, count)
    if WEX.OxInv then
        exports.ox_inventory:AddItem(id,item, count)
    else
        -- add function to add item to inventory if not using ox_inventory
    end
end


function dbug(message)
    if Config.Debug then
        print('DEBUG: ' .. message)
    end
end
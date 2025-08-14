

function notify(title, message, type, duration)
    if WEX.NotifyType == 'ox' then
        lib.notify({
            title = title,
            description = message,
            type = type or 'info',
        })
    elseif WEX.NotifyType == 'esx' then
      ESX.ShowNotification(message, type, duration, title)
    else 
        -- Custom notification here
    end
end

function callPoliceAlert()
    local randomChance = math.random(1, 100)
    if randomChance <= WEX.PercentageToAlertPolice then
        if WEX.PoliceAlert == 'custom' then
            -- Custom police alert logic here
        elseif WEX.PoliceAlert == 'cd' then

            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = WEX.PoliceJobs,
                coords = data.coords,
                title = 'Illegal  vehicle scrapping',
                message = 'A ' .. data.sex .. ' scrapping a vehicle ' .. data.street,
                flash = 0,
                unique_id = data.unique_id,
                sound = 1,
                blip = {
                    sprite = 431,
                    scale = 1.2,
                    colour = 3,
                    flashes = false,
                    text = '911 - Illegal  vehicle scrapping',
                    time = 5,
                    radius = 0
                }
            })
        end
        dbug('Alert is send to police')
        notify('Scrapyard', 'Someone call the police', 'error', 1500)
    end
    dbug('Police alert triggered with chance: ' .. randomChance)
end

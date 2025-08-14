local inproccess = false
local done = 0
local max = WEX.MaxParts - 1
-- Yards




local scrapOptions = {{
    name = 'scrap1',
    icon = 'fa-solid fa-wrench',
    label = 'Scrap Vehicle',
    onSelect = function(data)
        if done == max then
            lib.progressBar({
                duration = 2000,
                label = 'removing a car part...',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    move = true,
                    combat = true,
                },
                anim = {
                        dict = 'missmechanic',
                        clip = 'work2_base'
                },
                prop = {
                   model = "prop_tool_spanner01",
                    pos = vec3(0.03, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                }
            })
            done = 7
            TriggerServerEvent('wex_scrapyard:givescrap', cache.serverId)
            exports.ox_target:removeLocalEntity(data.entity, 'scrap1')
            DeleteEntity(data.entity)
            dbug('Scrapping completed, deleted entity: ' .. data.entity)
            done = 0
            notify('Scrapyard', 'You have scrapped the vehicle', 'success', 1500)
            callPoliceAlert()
        else
            lib.progressBar({
                duration = 2000,
                label = 'removing a car part...',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    move = true,
                    combat = true,
                },
                anim = {
                        dict = 'missmechanic',
                        clip = 'work2_base'
                },
                prop = {
                   model = "prop_tool_spanner01",
                    pos = vec3(0.03, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                }
            })
            done = done + 1
            TriggerServerEvent('wex_scrapyard:givescrap', cache.serverId)
            notify('Scrapyard', 'Done '..done..'/ '..WEX.MaxParts..'', 'success', 1500)
            callPoliceAlert()
            dbug('Scrapping in progress: ' .. done)
        end
    end
},
}







function onEnterYard(self)
    local isinvehicel = IsPedInAnyVehicle(PlayerPedId(), false)
    if isinvehicel then 
        lib.showTextUI('[E] - Start scrapping vehicle')
        dbug('Entered scrapyard: ' .. self.id)
    end
end

function onExitYard(self)
    lib.hideTextUI()
    dbug('Exited scrapyard: ' .. self.id)
end


function insideYard(self)
    --    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local vehicle = cache.vehicle

    if vehicle then
        if IsControlJustReleased(0, 38) then -- E key
            local vehicleModel = GetEntityModel(vehicle)
            local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
            exports.ox_target:addLocalEntity(joaat(vehicle), scrapOptions)
            FreezeEntityPosition(joaat(vehicle), true)
            TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
            lib.hideTextUI()
            dbug('Scrap options added for vehicle: ' .. vehicle)
            notify('Scrapyard', 'start dismantling the vehicle', 'success', 1500)
        end
    else
        lib.hideTextUI()
    end
end



for k, v in pairs(WEX.Yards) do
    if v.blip then
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipColour(blip, v.blip.color)
        SetBlipScale(blip, v.blip.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blip.name)
        EndTextCommandSetBlipName(blip)
    end
    lib.zones.box({
        coords = v.coords,
        size = v.size,
        rotatio = 0.0,
        onEnter = onEnterYard,
        onExit = onExitYard,
        inside = insideYard,
        debug = WEX.Debug

    })
    CreateThread(function()
        while true do
            Wait(1)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords)
            if cache.vehicle and distance < 20.0 then
              DrawMarker(2, v.coords.x, v.coords.y, v.coords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, --[[ barva ]] 255, 255, 255, 70, false, true, 2, nil, nil, false)
            end
        end
    end)
end




-- debug

function dbug(message)
    if WEX.Debug then
        print('^3 [DEBUG]^7 ' .. message)
    end   
end
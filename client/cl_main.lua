local harvest = false
local treatment = false
local pack = false
local sell = false

local cooldown = false
local interval = 2000

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

local function startCooldown()
    cooldown = true
    Citizen.SetTimeout(interval, function() cooldown = false end)
end

function textInfo(txt)
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(txt)
    EndTextCommandPrint(0 and math.ceil(0) or 0, true)
end

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local player = PlayerPedId()
        local player_coords = GetEntityCoords(player)
        for k, v in pairs(Config.drugs) do
            pos = v.harvestPosition
            color = v.RGBColor
            local distance = GetDistanceBetweenCoords(player_coords, pos.x, pos.y, pos.z, true)
            if distance <= 12.0 then
                wait= 0
                DrawMarker(6, pos.x, pos.y, pos.z, 0.0, 0.0, 9.0, 0.0, 0.0, 0.0, 1.0, 1.5, 1.0, color.r, color.g, color.b, 250, false, false, 2, false, false, false, false)
            end
            if distance <= 1.3 then
                wait = 0
                if not harvest then
                    ESX.ShowHelpNotification(_U('start_harvest', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            startCooldown()
                            harvest = true
                            item = 'pain'
                            FreezeEntityPosition(player, true)
                            TriggerServerEvent("drugs_system:harvest", harvest, v.itemHarvest, v.itemHarvestLimit)
                        end
                    end
                else
                    textInfo(_U('progress_harvest'))
                    ESX.ShowHelpNotification(_U('stop_harvest', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            harvest = false
                            FreezeEntityPosition(player, false)
                            TriggerServerEvent("drugs_system:harvest", harvest, v.itemHarvest, v.itemHarvestLimit)
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local player = PlayerPedId()
        local player_coords = GetEntityCoords(player)
        for k, v in pairs(Config.drugs) do
            pos = v.treatmentPosition
            color = v.RGBColor
            local distance = GetDistanceBetweenCoords(player_coords, pos.x, pos.y, pos.z, true)
            if distance <= 12.0 then
                wait= 0
                DrawMarker(6, pos.x, pos.y, pos.z, 0.0, 0.0, 9.0, 0.0, 0.0, 0.0, 1.0, 1.5, 1.0, color.r, color.g, color.b, 250, false, false, 2, false, false, false, false)
            end
            if distance <= 1.3 then
                wait = 0
                if not treatment then
                    ESX.ShowHelpNotification(_U('start_treatment', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            startCooldown()
                            treatment = true
                            item = 'pain'
                            FreezeEntityPosition(player, true)
                            TriggerServerEvent("drugs_system:treatment", treatment, v.itemTreatment, v.itemHarvest, v.itemTreatmentLimit)
                        end
                    end
                else
                    textInfo(_U('progress_treatment'))
                    ESX.ShowHelpNotification(_U('stop_treatment', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            treatment = false
                            FreezeEntityPosition(player, false)
                            TriggerServerEvent("drugs_system:treatment", treatment, v.itemTreatment, v.itemHarvest, v.itemTreatmentLimit)
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local player = PlayerPedId()
        local player_coords = GetEntityCoords(player)
        for k, v in pairs(Config.drugs) do
            pos = v.packPosition
            color = v.RGBColor
            local distance = GetDistanceBetweenCoords(player_coords, pos.x, pos.y, pos.z, true)
            if distance <= 12.0 then
                wait= 0
                DrawMarker(6, pos.x, pos.y, pos.z, 0.0, 0.0, 9.0, 0.0, 0.0, 0.0, 1.0, 1.5, 1.0, color.r, color.g, color.b, 250, false, false, 2, false, false, false, false)
            end
            if distance <= 1.3 then
                wait = 0
                if not pack then
                    ESX.ShowHelpNotification(_U('start_pack', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            startCooldown()
                            pack = true
                            item = 'pain'
                            FreezeEntityPosition(player, true)
                            TriggerServerEvent("drugs_system:pack", pack, v.itemPack, v.itemTreatment, v.itemPackLimit)
                        end
                    end
                else
                    textInfo(_U('progress_pack'))
                    ESX.ShowHelpNotification(_U('stop_pack', v.txtColor, v.txtColor), 1)
                    if IsControlJustPressed(1, 51) then
                        if not cooldown then
                            pack = false
                            FreezeEntityPosition(player, false)
                            TriggerServerEvent("drugs_system:pack", pack, v.itemPack, v.itemTreatment, v.itemPackLimit)
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local player = PlayerPedId()
        local player_coords = GetEntityCoords(player)
        for k, v in pairs(Config.drugs) do
            if v.sell then
                pos = v.sellPosition
                color = v.RGBColor
                local distance = GetDistanceBetweenCoords(player_coords, pos.x, pos.y, pos.z, true)
                if distance <= 12.0 then
                    wait= 0
                    DrawMarker(6, pos.x, pos.y, pos.z, 0.0, 0.0, 9.0, 0.0, 0.0, 0.0, 1.0, 1.5, 1.0, color.r, color.g, color.b, 250, false, false, 2, false, false, false, false)
                end
                if distance <= 1.3 then
                    wait = 0
                    if not sell then
                        ESX.ShowHelpNotification(_U('start_sell', v.txtColor, v.txtColor), 1)
                        if IsControlJustPressed(1, 51) then
                            if not cooldown then
                                startCooldown()
                                sell = true
                                item = 'pain'
                                FreezeEntityPosition(player, true)
                                TriggerServerEvent("drugs_system:sell", sell, v.itemPack, v.sellPrice)
                            end
                        end
                    else
                        textInfo(_U('progress_sell'))
                        ESX.ShowHelpNotification(_U('stop_sell', v.txtColor, v.txtColor), 1)
                        if IsControlJustPressed(1, 51) then
                            if not cooldown then
                                sell = false
                                FreezeEntityPosition(player, false)
                                TriggerServerEvent("drugs_system:sell", sell, v.itemPack, v.sellPrice)
                            end
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

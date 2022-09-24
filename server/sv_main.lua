print('^1Script by^7 Foltone#6290')

ESX = nil

local playerHarvest = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function harvestAction(source, item, limit)
    if playerHarvest[source] == true then
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(item).count >= limit then
            TriggerClientEvent('esx:showNotification', source, _U('max_limite'))
            return
        else
            SetTimeout(2000, function()
                xPlayer.addInventoryItem(item, 1)
                harvestAction(source, item, limit)
            end)
        end
    else
        return
    end
end

RegisterServerEvent("drugs_system:harvest")
AddEventHandler("drugs_system:harvest", function(harvest, item, limit)
    local _source = source
	if _source == false then
        print('glitch')
		playerHarvest[_source]=false
	else
        if harvest then
            TriggerClientEvent('esx:showNotification', _source, '~g~start')
            playerHarvest[_source]=true
            harvestAction(_source, item, limit)
        else
            playerHarvest[_source]=false
            TriggerClientEvent('esx:showNotification', _source, '~r~stop')
        end
	end
end)

local function treatmentAction(source, itemtreatment, itemharvest, limit)
    if playerHarvest[source] == true then
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(itemtreatment).count >= limit then
            TriggerClientEvent('esx:showNotification', source, _U('max_limite'))
            return
        else
            if xPlayer.getInventoryItem(itemharvest).count < 2 then
                TriggerClientEvent('esx:showNotification', source, _U('dont_have_enough', ESX.GetItemLabel(itemharvest)))
                return
            else
                if xPlayer.getInventoryItem(itemtreatment).count >= 10 then
                    TriggerClientEvent('esx:showNotification', source, _U('max_limite'))
                    return
                else
                    SetTimeout(2000, function()
                        xPlayer.removeInventoryItem(itemharvest, 2)
                        xPlayer.addInventoryItem(itemtreatment, 1)
                        treatmentAction(source, itemtreatment, itemharvest, limit)
                    end)
                end
            end
        end
    else
        return
    end
end

RegisterServerEvent("drugs_system:treatment")
AddEventHandler("drugs_system:treatment", function(treatment, itemtreatment, itemharvest, limit)

    local _source = source
	if _source == false then
        print('glitch')
		playerHarvest[_source]=false
	else
        if treatment then
            TriggerClientEvent('esx:showNotification', _source, '~g~start')
            playerHarvest[_source]=true
            treatmentAction(_source, itemtreatment, itemharvest, limit)
        else
            playerHarvest[_source]=false
            TriggerClientEvent('esx:showNotification', _source, '~r~stop')
        end
	end
end)

local function packAction(source, itempack, itemtreatment, limit)
    if playerHarvest[source] == true then
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(itempack).count >= limit then
            TriggerClientEvent('esx:showNotification', source, _U('max_limite'))
            return
        else
            if xPlayer.getInventoryItem(itemtreatment).count < 3 then
                TriggerClientEvent('esx:showNotification', source, _U('dont_have_enough', ESX.GetItemLabel(itemtreatment)))
                return
            else
                if xPlayer.getInventoryItem(itempack).count >= 10 then
                    TriggerClientEvent('esx:showNotification', source, _U('max_limite'))
                    return
                else
                    SetTimeout(2000, function()
                        xPlayer.removeInventoryItem(itemtreatment, 3)
                        xPlayer.addInventoryItem(itempack, 1)
                        packAction(source, itempack, itemtreatment, limit)
                    end)
                end
            end
        end
    else
        return
    end
end

RegisterServerEvent("drugs_system:pack")
AddEventHandler("drugs_system:pack", function(pack, itempack, itemtreatment, limit)
    local _source = source
	if _source == false then
        print('glitch')
		playerHarvest[_source]=false
	else
        if pack then
            TriggerClientEvent('esx:showNotification', _source, '~g~start')
            playerHarvest[_source]=true
            packAction(_source, itempack, itemtreatment, limit)
        else
            playerHarvest[_source]=false
            TriggerClientEvent('esx:showNotification', _source, '~r~stop')
        end
	end
end)

local function sellAction(source, item, price)
    if playerHarvest[source] == true then            
        local xPlayer  = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(item).count <= 0 then
            TriggerClientEvent('esx:showNotification', source, _U('nothing_left_sell'))
            return
        else
            SetTimeout(2000, function()
                xPlayer.removeInventoryItem(item, 1)
                xPlayer.addAccountMoney("black_money", price)
                sellAction(source, item, price)
            end)
        end
    else
        return
    end
end

RegisterServerEvent("drugs_system:sell")
AddEventHandler("drugs_system:sell", function(sell, item, price)
    local _source = source
	if _source == false then
        print('glitch')
		playerHarvest[_source]=false
	else
        if sell then
            TriggerClientEvent('esx:showNotification', _source, '~g~start')
            playerHarvest[_source]=true
            sellAction(_source, item, price)
        else
            playerHarvest[_source]=false
            TriggerClientEvent('esx:showNotification', _source, '~r~stop')
        end
	end
end)

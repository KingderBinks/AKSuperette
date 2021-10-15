ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('apuapuapuapuapua')
AddEventHandler('apuapuapuapuapua', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()
    if playerMoney >= (item.Price) then
		xPlayer.addInventoryItem(item.Value, 1)
        xPlayer.removeMoney(item.Price)
        TriggerClientEvent('esx:showNotification', source, '~g~Banque : ~w~Vous avez payé '..item.Price..'')
    else
		TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter ~g~1x ' .. item.Label .. '~s~' .. ' il vous manque ' .. '~r~' .. item.Price - playerMoney .. '$')
    end
end)

RegisterServerEvent('locaulocaloaca')
AddEventHandler('locaulocaloaca', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= (item.Price) then

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigneron', function(account)
        societyAccount = account
        end)

		xPlayer.addInventoryItem(item.Value, 1)
        xPlayer.removeMoney(item.Price)
        societyAccount.addMoney (item.Price)
        TriggerClientEvent('esx:showNotification', source, '~g~Banque : ~w~Vous avez payé '..item.Price..'')
    else
		TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter ~g~1x ' .. item.Label .. '~s~' .. ' il vous manque ' .. '~r~' .. item.Price - playerMoney .. '$')
    end
end)

RegisterServerEvent('tabloctabcwshlast')
AddEventHandler('tabloctabcwshlast', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= (item.Price) then

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tabac', function(account)
        societyAccount = account
        end)

		xPlayer.addInventoryItem(item.Value, 20)
        xPlayer.removeMoney(item.Price)
        societyAccount.addMoney (item.Price)
        TriggerClientEvent('esx:showNotification', source, '~g~Banque : ~w~Vous avez payé '..item.Price..'')
    else
		TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter ~g~1x ' .. item.Label .. '~s~' .. ' il vous manque ' .. '~r~' .. item.Price - playerMoney .. '$')
    end
end)

RegisterServerEvent('brrrbrbrrbrrrloc')
AddEventHandler('brrrbrbrrbrrrloc', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= (item.Price) then

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_brasseur', function(account)
        societyAccount = account
        end)

		xPlayer.addInventoryItem(item.Value, 20)
        xPlayer.removeMoney(item.Price)
        societyAccount.addMoney (item.Price)
        TriggerClientEvent('esx:showNotification', source, '~g~Banque : ~w~Vous avez payé '..item.Price..'')
    else
		TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheter ~g~1x ' .. item.Label .. '~s~' .. ' il vous manque ' .. '~r~' .. item.Price - playerMoney .. '$')
    end
end)

QBox = GetResourceState('qbx_core') == 'started' and true or false

if not QBox then return end

Fr = {}
Framework = true

Fr.usersTable = "players"
Fr.identificatorTable = "citizenid"
Fr.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'

Fr.IsPlayerDead = function(source)
    local Player = Fr.getPlayerFromId(source)
    return Player.PlayerData.metadata["isdead"]
end

Fr.getPlayerFromId = function(...)
    return exports.qbx_core:GetPlayer(...)
end

Fr.ManageDirtyMoney = function(xPlayer, action, amount)
    if action == "add" then
        return exports.qbx_core:AddMoney(xPlayer.PlayerData.source, 'cash', amount)
    else
        return exports.qbx_core:RemoveMoney(xPlayer.PlayerData.source, 'cash', amount)
    end
end

Fr.GetIndentifier = function(source)
    local xPlayer = Fr.getPlayerFromId(source)
    return xPlayer.PlayerData.citizenid
end

Fr.addItem = function(xPlayer, itemname, quantity)
    return exports.ox_inventory:AddItem(xPlayer.PlayerData.source, itemname, quantity)
end

Fr.removeItem = function(xPlayer, itemname, quantity)
    return exports.ox_inventory:RemoveItem(xPlayer.PlayerData.source, itemname, quantity)
end

Fr.getItem = function(xPlayer, itemname)
    local item = exports.ox_inventory:GetItem(xPlayer.PlayerData.source, itemname)
    local table
    if item then
        table = { amount = item.amount, name = itemname, weight = item.weight, label = item.label }
    else
        table = { amount = 0, name = itemname, weight = 0, label = "" }
    end
    return table
end
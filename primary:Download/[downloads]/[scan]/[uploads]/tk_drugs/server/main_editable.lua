function Notify(src, text, notifyType)
    if Config.NotificationType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = notifyType, text = text})
    elseif Config.NotificationType == 'ox' then
        lib.notify(src, {
            title = 'Drugs',
            description = text,
            type = notifyType
        })
    else
        ShowNotification(src, text, notifyType)
    end
end

function Webhook(message)
    local webhookLink = '' -- place your webhook link here on this line inside the quotes
    if not webhookLink or webhookLink == '' then return end

    local msg = {{["color"] = Config.WebhookColor, ["title"] = "**".. _U('webhook_title') .."**", ["description"] = message, ["footer"] = { ["text"] = os.date("%d.%m.%y Time: %X")}}}
    PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({embeds = msg}), { ['Content-Type'] = 'application/json' })
end

---Player successfully purchased items from a shop
---@param playerId number The ID of the player who made the purchase
---@param shopIndex number The index of the shop from which the items were purchased
---@param items table A table containing the items that were purchased
function PurchasedShopItems(playerId, shopIndex, items)

end

---Player sold drugs to a ped
---@param xPlayer table The player object
---@param drugName string The name of the drug that was sold
---@param amount number The amount of the drug that was sold
---@param price number The total price for the sold drugs
function SoldDrugs(xPlayer, drugName, amount, price)
    AddAccountMoney(xPlayer, Config.Selling.moneyType, price)
end

---Player harvested a plant
---@param xPlayer table The player object
---@param plantConfig table The configuration of the plant being harvested
function HarvestPlant(xPlayer, plantConfig)
    for _,v in pairs(plantConfig.yield) do
        local random = math.random(1, 100)
        if random <= v.chance then
            local amount = math.random(v.amount.min, v.amount.max)
            if amount > 0 then
                AddItem(xPlayer, v.item, amount)
            end
        end
    end
end

function GetPoliceAmount()
    local amount = 0

    for _,playerId in pairs(GetPlayers()) do
        local xPlayer = GetPlayerFromId(playerId)
        if xPlayer then
            local job = GetJobName(xPlayer)
            if Config.PoliceJobs[job] then
                amount += 1
            end
        end
    end

    return amount
end
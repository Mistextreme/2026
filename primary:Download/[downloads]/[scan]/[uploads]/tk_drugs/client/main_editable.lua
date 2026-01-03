local doingProgress = false

local function StopProgress(ped, anim, obj, ptfx)
    if DoesEntityExist(obj) then DeleteEntity(obj) end

    if anim then
        ClearPedTasks(ped)
    end

    if ptfx then
        StopParticleFxLooped(ptfx, false)
    end

    doingProgress = false
end

function DoProgress(anim, duration)
    local ped = PlayerPedId()

    if doingProgress or IsPedInAnyVehicle(ped, true) or IsEntityDead(ped) then return end
    doingProgress = true

    if anim?.dict and not Utils.LoadDict(anim.dict) then return end

    duration = anim?.duration or duration or 5000
    local startTime = GetGameTimer()
    local controls = {20, 21, 30, 31, 32, 33, 34, 35, 24, 48, 257, 25, 263, 22, 44, 37, 288, 289, 170, 167, 318, 137, 36, 47, 264, 257, 266, 267, 268, 269, 140, 141, 142, 143, 75, 73}

    local obj, ptfx

    if anim?.prop?.model then
        if not Utils.LoadModel(anim.prop.model) then return end

        local pos = anim.prop.pos or vec3(0.0, 0.0, 0.0)
        local rot = anim.prop.rot or vec3(0.0, 0.0, 0.0)

        local pC = GetEntityCoords(ped)
        obj = CreateObject(anim.prop.model, pC.x, pC.y, pC.z + 0.2, true, true, true)
        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, anim.prop.bone), pos, rot, true, true, false, true, 1, true)
    end

    if anim?.ptfx?.name then
        if not Utils.LoadPtfx(anim.ptfx.asset) then return end

        local offset = anim.ptfx.offset vec3(0.0, 0.0, 0.0)
        local rot = anim.ptfx.rot or vec3(0.0, 0.0, 0.0)
        local color = anim.ptfx.color or {r = 1.0, g = 1.0, b = 1.0}

        UseParticleFxAsset(anim.ptfx.asset)
        ptfx = StartNetworkedParticleFxLoopedOnEntityBone(anim.ptfx.name, obj, offset, rot, GetEntityBoneIndexByName(anim.ptfx.name, 'VFX'), anim.ptfx.scale, false, false, false)
        SetParticleFxLoopedColour(ptfx, color.r, color.g, color.b, false)
    end

    if anim?.scenario then
        TaskStartScenarioInPlace(ped, anim.scenario, 0, true)
    end

    while true do
        for _,v in pairs(controls) do DisableControlAction(0, v, true) end

        if anim?.dict and anim?.name and not IsEntityPlayingAnim(ped, anim.dict, anim.name, 3) then
            TaskPlayAnim(ped, anim.dict, anim.name, 2.0, 2.0, -1, anim.flag or 49, 0, false, false, false)
        end

        if IsDisabledControlJustPressed(0, 73) or IsEntityDead(ped) then
            StopProgress(ped, anim, obj, ptfx)
            return false
        end

        if startTime + duration < GetGameTimer() then
            StopProgress(ped, anim, obj, ptfx)
            return true
        end

        Wait(0)
    end
end

local function GetLineCount(str)
    local lines = 1
    for i = 1, #str do
        local c = str:sub(i, i)
        if c == '\n' then lines = lines + 1 end
    end

    return lines
end

function Draw3DText(coords, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 410
    local lineCount = GetLineCount(text)
    DrawRect(0.0, 0.0+0.0125*lineCount, 0.017+factor, 0.03*lineCount, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function Notify(text, notifyType)
    if Config.NotificationType == 'mythic' then
        exports['mythic_notify']:DoHudText(notifyType, text)
    elseif Config.NotificationType == 'ox' then
        lib.notify({
            title = 'Drugs',
            description = text,
            type = notifyType
        })
    else
        ShowNotification(text, notifyType)
    end
end

function DisplayHelpText(text)
    AddTextEntry('help_text', text)
    DisplayHelpTextThisFrame('help_text', false)
end

function ShowTextUI(text)
    if Config.UseOxLib then
        lib.showTextUI(text, {position = 'right-center'})
    else
        exports['qb-core']:DrawText(text, 'left')
    end
end

function HideTextUI()
    if Config.UseOxLib then
        lib.hideTextUI()
    else
        exports['qb-core']:HideText()
    end
end

local function ConvertTargetOptions(options)
    local data = {options = options, distance = options[1]?.distance or 2.0}

    for k,v in ipairs(data.options) do
        v.num = k
        v.action = v.onSelect
        v.distance = nil
        v.onSelect = nil
    end

    return data
end

function AddEntityZone(entity, options)
    if Config.Target == 'ox' then
        exports.ox_target:addLocalEntity(entity, options)
    else
        local formattedOptions = ConvertTargetOptions(options)
        exports['qb-target']:AddTargetEntity(entity, formattedOptions)
    end
end

function RemoveEntityZone(entity)
    if Config.Target == 'ox' then
        exports.ox_target:removeLocalEntity(entity)
    else
        exports['qb-target']:RemoveTargetEntity(entity)
    end
end

function AddGlobalPed(options)
    if Config.Target == 'ox' then
        exports.ox_target:addGlobalPed(options)
    else
        local formattedOptions = ConvertTargetOptions(options)
        exports['qb-target']:AddGlobalPed(formattedOptions)
    end
end

---Called before drug selling menu is opened
---@param ped number Entity player is trying to sell drugs to
---@return boolean canSell whether the player can sell drugs
function CanSellDrugs(ped)
    return true
end

---Called when trying to sell a specific drug
---@param ped number Entity player is trying to sell drugs to
---@param itemName string Name of the drug
---@param amount number Amount of the drug
---@return boolean canSell whether the player can sell the drug
function CanSellDrug(ped, itemName, amount)
    return true
end

---Handles sending the drugs player has to UI
---@return table drugs List of drugs player has
function GetPlayerDrugs()
    local drugs = {}
    Utils.Debug('GetPlayerDrugs')

    for _,item in pairs(Config.Selling.items) do
        Utils.Debug('check item', item.name)
        local count = GetItemAmount(item.name)
        Utils.Debug('count', count)
        if count > 0 then
            local price = math.random(item.price.min, item.price.max)
            Utils.Debug('price', price)
            Utils.Debug('image', string.format(Config.ImageFormat, item.name))
            Utils.Debug('label', GetItemLabel(item.name))
            drugs[#drugs+1] = {
                name = item.name,
                label = GetItemLabel(item.name),
                count = count,
                price = price,
                image = string.format(Config.ImageFormat, item.name)
            }
        end
    end

    Utils.Debug('drugs', drugs)
    return drugs
end

---Called when trying to sell drugs
---@param targetPed number Entity player is trying to sell drugs to
---@param drugName string Name of the drug
---@param amount number Amount of the drug
---@param expectedPrice number Expected price of the drug
---@param favoriteEffects table List of favorite effects
---@return boolean success true if the drug sale was successful
function DoDrugSale(targetPed, drugName, amount, expectedPrice, favoriteEffects)
    local ped = PlayerPedId()
    local animDict, animName = 'mp_safehouselost@', 'package_dropoff'
    local drugModel, moneyModel = Config.Selling.props?.drug or 'prop_meth_bag_01', Config.Selling.props?.money or 'prop_anim_cash_note'

    Utils.LoadModel(drugModel)
    Utils.LoadModel(moneyModel)

    PlayPedAmbientSpeechNative(targetPed, 'Generic_Hi', 'Speech_Params_Force')
    TaskTurnPedToFaceEntity(ped, targetPed, 500)
    TaskTurnPedToFaceEntity(targetPed, ped, 500)
    Wait(1000)

    local drugObj = SpawnProp(drugModel, GetEntityCoords(ped), 0.0, false)
    local moneyObj = SpawnProp(moneyModel, GetEntityCoords(targetPed), 0.0, false)
    AttachEntityToEntity(drugObj, ped, 90, 0.07, 0.01, -0.01, 136.33, 50.23, -50.26, true, true, false, true, 1, true)
    AttachEntityToEntity(moneyObj, targetPed, GetPedBoneIndex(targetPed, 28422), 0.07, 0, -0.01, 18.12, 7.21, -12.44, true, true, false, true, 1, true)

    PlayAnim(ped, animDict, animName, -1, 32, 0.0, 4500)
    PlayAnim(targetPed, animDict, animName, -1, 32, 0.0, 4500)
    Wait(2500)

    DeleteEntity(drugObj)
    DeleteEntity(moneyObj)
    Wait(2000)

    ClearPedTasks(ped)
    ClearPedTasks(targetPed)
    PlayPedAmbientSpeechNative(targetPed, 'Generic_Thanks', 'Speech_Params_Force')

    return true
end

---Called when trying to place equipment
---@param equipmentIndex string Index of equipment in Config.EquipmentItems
---@return boolean canPlace true if the equipment can be placed
function CanPlaceEquipment(equipmentIndex)
    return true
end

---Called before you start placing a plant AND when you are actually placing it (running in a loop)
---@param configIndex string Index of plant in Config.Plants
---@param coords? vector3 Coordinates of the plant
---@param plants? table List of plants already placed
---@return boolean canPlace true if the plant can be placed
function CanPlacePlant(configIndex, coords, plants)
    return true
end

---Called when trying to place a lamp
---@param configIndex string Index of lamp in Config.Lamps
---@return boolean canPlace true if the lamp can be placed
function CanPlaceLamp(configIndex)
    return true
end

---Called when trying to remove equipment
---@param data table Data of the equipment
---@return boolean canRemove true if the equipment can be removed
function CanRemoveEquipment(data)
    return true
end

---Called when trying to remove a plant
---@param data table Data of the plant
---@return boolean canRemove true if the plant can be removed
function CanRemovePlant(data)
    return true
end

---Called when trying to remove a lamp
---@param data table Data of the lamp
---@return boolean canRemove true if the lamp can be removed
function CanRemoveLamp(data)
    return true
end

---Called when trying to use equipment
---@param data table Data of the equipment
---@return boolean canUse true if the equipment can be used
function CanUseEquipment(data)
    return true
end

---Called when trying to open a plant menu
---@param data table Data of the plant
---@return boolean canOpen true if the plant menu can be opened
function CanOpenPlantMenu(data)
    return true
end

---Called when trying to open a shop
---@param shopData table Data of the shop
---@return boolean canOpen true if the shop can be opened
function CanOpenShop(shopData)
    return true
end

---Sends the shop data to the UI
---@param shopData table Data of the shop
---@return table items List of items in the shop
function GetShopItems(shopData)
    local items = {}

    for _,item in pairs(shopData.items) do
        items[#items+1] = {
            name = item.name,
            label = GetItemLabel(item.name),
            price = item.price,
            description = item.description,
            image = Config.ImageFormat and string.format(Config.ImageFormat, item.name) or Config.ImagePath .. '/' .. item.name .. '.png'
        }
    end

    return items
end

---Plays the greeting voice line of the shopkeeper
---@param shopData table Data of the shop
function PlayShopPedVoiceLine(ped, shopData)
    PlayPedAmbientSpeechNative(ped, 'GENERIC_HI', 'SPEECH_PARAMS_FORCE')
end

---Player starts placing equipment/plant/lamp
---@param data table Data of the equipment/plant/lamp
function StartPlacingEquipment(data)

end

---Player cancels/places the equipment/plant/lamp
---@param data table Data of the equipment/plant/lamp
function StopPlacingEquipment(data)

end

function AlertPolice(coords)
    if Config.Dispatch == 'tk' then
        exports.tk_dispatch:addCall({
            title = 'Drug Sale',
            code = '10-58',
            priority = 'Priority 3',
            coords = coords,
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = 3,
                sprite = 51,
                scale = 1.0,
            },
            jobs = {'police'}
        })
    else
        local streetName,_ = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        streetName = GetStreetNameFromHashKey(streetName)
        local gender = GetGender()

        TriggerServerEvent('tk_drugs:alertPolice', coords, streetName, gender)
    end
end

RegisterNetEvent('tk_drugs:alertPolice', function(coords, street, gender)
    local blipSettings = Config.Selling.blip

    if blipSettings.playSound then
        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
    end

    Notify(_U('drugs_sold', gender, street))

    local alpha = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipSettings.sprite)
    SetBlipColour(blip, blipSettings.color)
    SetBlipAlpha(blip, alpha)
    SetBlipScale(blip, blipSettings.scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('drugs_sold_title'))
    EndTextCommandSetBlipName(blip)

    while alpha ~= 0 do
        Wait(100)

        alpha -= 1
        SetBlipAlpha(blip, alpha)

        if alpha <= 0 then
            RemoveBlip(blip)
        end
    end
end)

---Called when a custom drug effect is triggered
---@param effectName string name of the custom drug effect
function DoCustomDrugEffect(effectName)

end

---Called when a drug is consumed
---@param drugName string name of the drug consumed
---@param effects table list of effects from the drug
function DrugConsumed(drugName, effects)

end

---Returns the bucket for an object
---@param data table Data of the object
---@return number bucket
function GetObjectBucket(data)
    return data.bucket or 0
end
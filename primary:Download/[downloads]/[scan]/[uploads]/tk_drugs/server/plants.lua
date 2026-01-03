local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = {}
L1_1 = {}
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = GetPlayerFromId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = GetItemAmount
    L10_2 = L2_2
    L11_2 = L8_2.name
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = L8_2.amount
    if L9_2 < L10_2 then
      L9_2 = Notify
      L10_2 = A0_2
      L11_2 = _U
      L12_2 = "need_item_amount"
      L13_2 = L8_2.amount
      L14_2 = GetItemLabel
      L15_2 = L8_2.name
      L14_2, L15_2 = L14_2(L15_2)
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      L12_2 = "error"
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = false
      return L9_2
    end
  end
  L3_2 = true
  return L3_2
end
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Plants
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = CreateUsableItem
    L7_2 = L5_2.item
    function L8_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = L2_1
      L3_3 = A0_3
      L4_3 = L5_2.neededItems
      L2_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        return
      end
      L2_3 = TriggerClientEvent
      L3_3 = "tk_drugs:plantSeed"
      L4_3 = A0_3
      L5_3 = L4_2
      L2_3(L3_3, L4_3, L5_3)
    end
    L6_2(L7_2, L8_2)
  end
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Lamps
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = CreateUsableItem
    L7_2 = L5_2.item
    function L8_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = TriggerClientEvent
      L3_3 = "tk_drugs:placeLamp"
      L4_3 = A0_3
      L5_3 = L4_2
      L2_3(L3_3, L4_3, L5_3)
    end
    L6_2(L7_2, L8_2)
  end
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM tk_drugs_lamps"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = json
    L7_2 = L7_2.decode
    L8_2 = L6_2.coords
    L7_2 = L7_2(L8_2)
    L8_2 = vec3
    L9_2 = L7_2.x
    L10_2 = L7_2.y
    L11_2 = L7_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L8_2
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = L6_2.rotation
    L8_2 = L8_2(L9_2)
    L9_2 = vec3
    L10_2 = L8_2.x
    L11_2 = L8_2.y
    L12_2 = L8_2.z
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2 = L9_2
    L10_2 = L6_2.id
    L9_2 = L1_1
    L11_2 = {}
    L11_2.coords = L7_2
    L11_2.rotation = L8_2
    L12_2 = L6_2.plantId
    L11_2.plantId = L12_2
    L12_2 = L6_2.configIndex
    L11_2.configIndex = L12_2
    L12_2 = L6_2.bucket
    L11_2.bucket = L12_2
    L9_2[L10_2] = L11_2
  end
end
L5_1 = RegisterCallback
L6_1 = "tk_drugs:getLamps"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  repeat
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
    L2_2 = initDone
  until L2_2
  L2_2 = A1_2
  L3_2 = L1_1
  L2_2(L3_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "tk_drugs:placeLamp"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = source
  L5_2 = GetPlayerFromId
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = Config
  L6_2 = L6_2.Lamps
  L6_2 = L6_2[A0_2]
  if not L6_2 then
    return
  end
  L7_2 = GetItemAmount
  L8_2 = L5_2
  L9_2 = L6_2.item
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 < 1 then
    L7_2 = Notify
    L8_2 = L4_2
    L9_2 = _U
    L10_2 = "need_item_amount"
    L11_2 = 1
    L12_2 = GetItemLabel
    L13_2 = L6_2.item
    L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L10_2 = "error"
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = RemoveItem
  L8_2 = L5_2
  L9_2 = L6_2.item
  L10_2 = 1
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = vec3
  L8_2 = A1_2.x
  L9_2 = A1_2.y
  L10_2 = A1_2.z
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  A1_2 = L7_2
  L7_2 = GetPlayerRoutingBucket
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  L8_2 = MySQL
  L8_2 = L8_2.Sync
  L8_2 = L8_2.insert
  L9_2 = [[
        INSERT INTO
            tk_drugs_lamps (coords, rotation, configIndex, plantId, bucket)
        VALUES (?, ?, ?, ?, ?)
    ]]
  L10_2 = {}
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = A1_2
  L11_2 = L11_2(L12_2)
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = A2_2
  L12_2 = L12_2(L13_2)
  L13_2 = A0_2
  L14_2 = A3_2
  L15_2 = L7_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    return
  end
  L9_2 = L1_1
  L10_2 = {}
  L10_2.coords = A1_2
  L10_2.rotation = A2_2
  L10_2.plantId = A3_2
  L10_2.configIndex = A0_2
  L10_2.bucket = L7_2
  L9_2[L8_2] = L10_2
  L9_2 = TriggerClientEvent
  L10_2 = "tk_drugs:addLamp"
  L11_2 = -1
  L12_2 = L8_2
  L13_2 = L1_1
  L13_2 = L13_2[L8_2]
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = Webhook
  L10_2 = _U
  L11_2 = "webhook_action"
  L12_2 = Utils
  L12_2 = L12_2.GetIdentifiers
  L13_2 = L4_2
  L12_2 = L12_2(L13_2)
  L13_2 = "Place Lamp"
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L1_1
  L15_2 = L15_2[L8_2]
  L16_2 = {}
  L16_2.indent = true
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "tk_drugs:removeLamp"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = GetPlayerFromId
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.configIndex
  L4_2 = Config
  L4_2 = L4_2.Lamps
  L4_2 = L4_2[L3_2]
  L5_2 = L4_2.item
  L6_2 = Utils
  L6_2 = L6_2.Debug
  L7_2 = "Remove Lamp"
  L8_2 = A0_2
  L9_2 = L3_2
  L10_2 = L4_2
  L11_2 = L5_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = AddItem
  L7_2 = L2_2
  L8_2 = L5_2
  L9_2 = 1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = Notify
    L7_2 = L1_2
    L8_2 = _U
    L9_2 = "not_enough_space"
    L8_2 = L8_2(L9_2)
    L9_2 = "error"
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = Webhook
  L7_2 = _U
  L8_2 = "webhook_action"
  L9_2 = Utils
  L9_2 = L9_2.GetIdentifiers
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L10_2 = "Remove Lamp"
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L1_1
  L12_2 = L12_2[A0_2]
  L13_2 = {}
  L13_2.indent = true
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = MySQL
  L6_2 = L6_2.Sync
  L6_2 = L6_2.execute
  L7_2 = "DELETE FROM tk_drugs_lamps WHERE id = ?"
  L8_2 = {}
  L9_2 = A0_2
  L8_2[1] = L9_2
  L6_2(L7_2, L8_2)
  L6_2 = L1_1
  L6_2[A0_2] = nil
  L6_2 = Utils
  L6_2 = L6_2.Debug
  L7_2 = "Removed Lamp"
  L8_2 = A0_2
  L9_2 = L1_1
  L9_2 = L9_2[A0_2]
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = TriggerClientEvent
  L7_2 = "tk_drugs:removeLamp"
  L8_2 = -1
  L9_2 = A0_2
  L6_2(L7_2, L8_2, L9_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "tk_drugs:placePlant"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = source
  L4_2 = GetPlayerFromId
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = Config
  L5_2 = L5_2.Plants
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    return
  end
  L6_2 = L2_1
  L7_2 = L3_2
  L8_2 = L5_2.neededItems
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    return
  end
  L6_2 = GetItemAmount
  L7_2 = L4_2
  L8_2 = L5_2.item
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 < 1 then
    L6_2 = Notify
    L7_2 = L3_2
    L8_2 = _U
    L9_2 = "need_item_amount"
    L10_2 = 1
    L11_2 = GetItemLabel
    L12_2 = L5_2.item
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L11_2(L12_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    L9_2 = "error"
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = pairs
  L7_2 = L5_2.neededItems
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.remove
    if L12_2 then
      L12_2 = RemoveItem
      L13_2 = L4_2
      L14_2 = L11_2.name
      L15_2 = L11_2.amount
      L12_2(L13_2, L14_2, L15_2)
    end
  end
  L6_2 = RemoveItem
  L7_2 = L4_2
  L8_2 = L5_2.item
  L9_2 = 1
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = vec3
  L7_2 = A1_2.x
  L8_2 = A1_2.y
  L9_2 = A1_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  A1_2 = L6_2
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L7_2 = GetPlayerRoutingBucket
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L8_2 = MySQL
  L8_2 = L8_2.Sync
  L8_2 = L8_2.insert
  L9_2 = [[
        INSERT INTO 
            tk_drugs_plants (configIndex, coords, rotation, placeTime, water, fertilizer, lastResourceUpdate, bucket) 
        VALUES
            (?, ?, ?, ?, ?, ?, ?, ?)
    ]]
  L10_2 = {}
  L11_2 = A0_2
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L13_2 = json
  L13_2 = L13_2.encode
  L14_2 = A2_2
  L13_2 = L13_2(L14_2)
  L14_2 = L6_2
  L15_2 = 50
  L16_2 = 50
  L17_2 = L6_2
  L18_2 = L7_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L10_2[7] = L17_2
  L10_2[8] = L18_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    return
  end
  L9_2 = L0_1
  L10_2 = {}
  L10_2.configIndex = A0_2
  L10_2.coords = A1_2
  L10_2.rotation = A2_2
  L10_2.placeTime = L6_2
  L10_2.lastStage = 1
  L10_2.water = 50
  L10_2.fertilizer = 50
  L10_2.lastResourceUpdate = L6_2
  L10_2.bucket = L7_2
  L9_2[L8_2] = L10_2
  L9_2 = TriggerClientEvent
  L10_2 = "tk_drugs:addPlant"
  L11_2 = -1
  L12_2 = L8_2
  L13_2 = L0_1
  L13_2 = L13_2[L8_2]
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = Webhook
  L10_2 = _U
  L11_2 = "webhook_action"
  L12_2 = Utils
  L12_2 = L12_2.GetIdentifiers
  L13_2 = L3_2
  L12_2 = L12_2(L13_2)
  L13_2 = "Place Plant"
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L0_1
  L15_2 = L15_2[L8_2]
  L16_2 = {}
  L16_2.indent = true
  L14_2, L15_2, L16_2, L17_2, L18_2 = L14_2(L15_2, L16_2)
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
L5_1(L6_1, L7_1)
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = 0
  L3_2 = 1
  L4_2 = 1
  L5_2 = #A0_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = A0_2[L7_2]
    L8_2 = L8_2.time
    L2_2 = L2_2 + L8_2
    if A1_2 >= L2_2 then
      L3_2 = L7_2 + 1
    end
  end
  return L3_2
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = MySQL
  L1_2 = L1_2.Sync
  L1_2 = L1_2.execute
  L2_2 = "DELETE FROM tk_drugs_plants WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2(L2_2, L3_2)
  L1_2 = L0_1
  L1_2[A0_2] = nil
  L1_2 = TriggerClientEvent
  L2_2 = "tk_drugs:removePlant"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = Config
  L1_2 = L1_2.PlantSettings
  L1_2 = L1_2.removeLamps
  if not L1_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.plantId
    if L7_2 == A0_2 then
      L7_2 = MySQL
      L7_2 = L7_2.Sync
      L7_2 = L7_2.execute
      L8_2 = "DELETE FROM tk_drugs_lamps WHERE id = ?"
      L9_2 = {}
      L10_2 = L5_2
      L9_2[1] = L10_2
      L7_2(L8_2, L9_2)
      L7_2 = L1_1
      L7_2[L5_2] = nil
      L7_2 = TriggerClientEvent
      L8_2 = "tk_drugs:removeLamp"
      L9_2 = -1
      L10_2 = L5_2
      L7_2(L8_2, L9_2, L10_2)
    end
  end
end
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM tk_drugs_plants"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.id
    L8_2 = L6_2.configIndex
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = L6_2.coords
    L9_2 = L9_2(L10_2)
    L10_2 = vec3
    L11_2 = L9_2.x
    L12_2 = L9_2.y
    L13_2 = L9_2.z
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2 = L10_2
    L10_2 = json
    L10_2 = L10_2.decode
    L11_2 = L6_2.rotation
    L10_2 = L10_2(L11_2)
    L11_2 = vec3
    L12_2 = L10_2.x
    L13_2 = L10_2.y
    L14_2 = L10_2.z
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    L10_2 = L11_2
    L11_2 = L6_2.placeTime
    L12_2 = os
    L12_2 = L12_2.time
    L12_2 = L12_2()
    L12_2 = L12_2 - L11_2
    L13_2 = L5_1
    L14_2 = Config
    L14_2 = L14_2.Plants
    L14_2 = L14_2[L8_2]
    L14_2 = L14_2.stages
    L15_2 = L12_2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = Config
    L14_2 = L14_2.Plants
    L14_2 = L14_2[L8_2]
    L14_2 = L14_2.stages
    L14_2 = #L14_2
    if L13_2 > L14_2 then
      L14_2 = Webhook
      L15_2 = _U
      L16_2 = "webhook_action"
      L17_2 = "Server"
      L18_2 = "Plant Died (Stage was higher than max stage) (LoadPlants)"
      L19_2 = json
      L19_2 = L19_2.encode
      L20_2 = L0_1
      L20_2 = L20_2[L7_2]
      L21_2 = {}
      L21_2.indent = true
      L19_2, L20_2, L21_2 = L19_2(L20_2, L21_2)
      L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L14_2 = L6_1
      L15_2 = L7_2
      L14_2(L15_2)
    else
      L14_2 = L0_1
      L15_2 = {}
      L15_2.configIndex = L8_2
      L15_2.coords = L9_2
      L15_2.rotation = L10_2
      L15_2.placeTime = L11_2
      L15_2.lastStage = L13_2
      L16_2 = L6_2.water
      if not L16_2 then
        L16_2 = 50
      end
      L15_2.water = L16_2
      L16_2 = L6_2.fertilizer
      if not L16_2 then
        L16_2 = 50
      end
      L15_2.fertilizer = L16_2
      L16_2 = L6_2.lastResourceUpdate
      if not L16_2 then
        L16_2 = L11_2
      end
      L15_2.lastResourceUpdate = L16_2
      L16_2 = L6_2.bucket
      L15_2.bucket = L16_2
      L14_2[L7_2] = L15_2
    end
  end
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.plantId
    if L7_2 == A0_2 then
      L7_2 = Config
      L7_2 = L7_2.Lamps
      L7_2 = L7_2.default_lamp
      L8_2 = L7_2.growthMultiplier
      return L8_2
    end
  end
  L1_2 = 1.0
  return L1_2
end
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = os
  L0_2 = L0_2.time
  L0_2 = L0_2()
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if not L6_2 then
    else
      L7_2 = L6_2.lastResourceUpdate
      if not L7_2 then
        L7_2 = L6_2.placeTime
      end
      L7_2 = L0_2 - L7_2
      L7_2 = L7_2 / 60
      L8_2 = Config
      L8_2 = L8_2.PlantSettings
      L8_2 = L8_2.waterDecayRate
      L8_2 = L8_2 * L7_2
      L9_2 = Config
      L9_2 = L9_2.PlantSettings
      L9_2 = L9_2.fertilizerDecayRate
      L9_2 = L9_2 * L7_2
      L10_2 = math
      L10_2 = L10_2.max
      L11_2 = 0
      L12_2 = L6_2.water
      L12_2 = L12_2 - L8_2
      L10_2 = L10_2(L11_2, L12_2)
      L6_2.water = L10_2
      L10_2 = math
      L10_2 = L10_2.max
      L11_2 = 0
      L12_2 = L6_2.fertilizer
      L12_2 = L12_2 - L9_2
      L10_2 = L10_2(L11_2, L12_2)
      L6_2.fertilizer = L10_2
      L6_2.lastResourceUpdate = L0_2
      L10_2 = MySQL
      L10_2 = L10_2.Async
      L10_2 = L10_2.execute
      L11_2 = "UPDATE tk_drugs_plants SET water = ?, fertilizer = ?, lastResourceUpdate = ? WHERE id = ?"
      L12_2 = {}
      L13_2 = L6_2.water
      L14_2 = L6_2.fertilizer
      L15_2 = L6_2.lastResourceUpdate
      L16_2 = L5_2
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L12_2[4] = L16_2
      L10_2(L11_2, L12_2)
      L10_2 = L6_2.water
      if not (L10_2 <= 0) then
        L10_2 = L6_2.fertilizer
        if not (L10_2 <= 0) then
          goto lbl_82
        end
      end
      L10_2 = Webhook
      L11_2 = _U
      L12_2 = "webhook_action"
      L13_2 = "Server"
      L14_2 = "Plant Died (Water or Fertilizer <= 0)"
      L15_2 = json
      L15_2 = L15_2.encode
      L16_2 = L0_1
      L16_2 = L16_2[L5_2]
      L17_2 = {}
      L17_2.indent = true
      L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2)
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L10_2 = L6_1
      L11_2 = L5_2
      L10_2(L11_2)
      ::lbl_82::
      L10_2 = Wait
      L11_2 = 10
      L10_2(L11_2)
    end
  end
end
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = pairs
  L1_2 = L0_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = Config
    L6_2 = L6_2.Plants
    L7_2 = L5_2.configIndex
    L6_2 = L6_2[L7_2]
    if not L6_2 then
    else
      L7_2 = os
      L7_2 = L7_2.time
      L7_2 = L7_2()
      L8_2 = L5_2.placeTime
      L7_2 = L7_2 - L8_2
      L8_2 = L8_1
      L9_2 = L4_2
      L8_2 = L8_2(L9_2)
      L9_2 = L7_2 * L8_2
      L10_2 = L5_1
      L11_2 = L6_2.stages
      L12_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = L6_2.stages
      L11_2 = #L11_2
      if L10_2 > L11_2 then
        L11_2 = Webhook
        L12_2 = _U
        L13_2 = "webhook_action"
        L14_2 = "Server"
        L15_2 = "Plant Died (Stage was higher than max stage) (UpdatePlantGrowth)"
        L16_2 = json
        L16_2 = L16_2.encode
        L17_2 = L0_1
        L17_2 = L17_2[L4_2]
        L18_2 = {}
        L18_2.indent = true
        L16_2, L17_2, L18_2 = L16_2(L17_2, L18_2)
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
        L11_2 = L6_1
        L12_2 = L4_2
        L11_2(L12_2)
      else
        L11_2 = L5_2.lastStage
        if not L11_2 then
          L11_2 = 1
        end
        if L10_2 ~= L11_2 then
          L5_2.lastStage = L10_2
          L12_2 = TriggerClientEvent
          L13_2 = "tk_drugs:updatePlant"
          L14_2 = -1
          L15_2 = L4_2
          L16_2 = L5_2.configIndex
          L17_2 = L10_2
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
        end
      end
    end
  end
end
L11_1 = RegisterCallback
L12_1 = "tk_drugs:getPlants"
function L13_1(A0_2, A1_2)
  local L2_2, L3_2
  repeat
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
    L2_2 = initDone
  until L2_2
  L2_2 = A1_2
  L3_2 = L0_1
  L2_2(L3_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterCallback
L12_1 = "tk_drugs:getOsTime"
function L13_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L2_2(L3_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterCallback
L12_1 = "tk_drugs:getPlantData"
function L13_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = L0_1
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = nil
    L4_2(L5_2)
    return
  end
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = L3_2.placeTime
  L5_2 = L4_2 - L5_2
  L6_2 = L8_1
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L7_2 = L5_2 * L6_2
  L8_2 = Config
  L8_2 = L8_2.Plants
  L9_2 = L3_2.configIndex
  L8_2 = L8_2[L9_2]
  L9_2 = L5_1
  L10_2 = L8_2.stages
  L11_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = nil
  L11_2 = L8_2.stages
  L11_2 = #L11_2
  if L9_2 < L11_2 then
    L11_2 = 0
    L12_2 = 1
    L13_2 = L3_2.lastStage
    L14_2 = 1
    for L15_2 = L12_2, L13_2, L14_2 do
      L16_2 = L8_2.stages
      L16_2 = L16_2[L15_2]
      L16_2 = L16_2.time
      L11_2 = L11_2 + L16_2
    end
    L12_2 = L3_2.placeTime
    L12_2 = L12_2 + L11_2
    L10_2 = L12_2 - L4_2
    if L10_2 < 0 then
      L10_2 = 0
    end
  end
  L11_2 = type
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  if "number" == L11_2 then
    L11_2 = math
    L11_2 = L11_2.ceil
    L12_2 = L10_2 / L6_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      goto lbl_65
      L10_2 = L11_2 or L10_2
    end
  end
  L10_2 = nil
  ::lbl_65::
  L11_2 = A1_2
  L12_2 = {}
  L13_2 = L3_2.configIndex
  L12_2.configIndex = L13_2
  L13_2 = L3_2.water
  L12_2.water = L13_2
  L13_2 = L3_2.fertilizer
  L12_2.fertilizer = L13_2
  L12_2.currentStage = L9_2
  L12_2.nextStageTime = L10_2
  L11_2(L12_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "tk_drugs:updatePlantWater"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L3_2 = GetPlayerFromId
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = Config
  L4_2 = L4_2.PlantSettings
  L4_2 = L4_2.water
  L4_2 = L4_2.item
  L5_2 = Config
  L5_2 = L5_2.PlantSettings
  L5_2 = L5_2.water
  L5_2 = L5_2.amount
  if not L5_2 then
    L5_2 = 1
  end
  L6_2 = GetItemAmount
  L7_2 = L3_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if L5_2 > L6_2 then
    L6_2 = Notify
    L7_2 = L1_2
    L8_2 = _U
    L9_2 = "need_item_amount"
    L10_2 = L5_2
    L11_2 = GetItemLabel
    L12_2 = L4_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L9_2 = "error"
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = RemoveItem
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = L5_2
  L6_2(L7_2, L8_2, L9_2)
  L2_2.water = 100
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L2_2.lastResourceUpdate = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.Async
  L6_2 = L6_2.execute
  L7_2 = "UPDATE tk_drugs_plants SET water = ?, lastResourceUpdate = ? WHERE id = ?"
  L8_2 = {}
  L9_2 = L2_2.water
  L10_2 = L2_2.lastResourceUpdate
  L11_2 = A0_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2(L7_2, L8_2)
  L6_2 = Webhook
  L7_2 = _U
  L8_2 = "webhook_action"
  L9_2 = Utils
  L9_2 = L9_2.GetIdentifiers
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L10_2 = "Water Plant"
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L2_2
  L13_2 = {}
  L13_2.indent = true
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "tk_drugs:updatePlantFertilizer"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L3_2 = GetPlayerFromId
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = Config
  L4_2 = L4_2.PlantSettings
  L4_2 = L4_2.fertilizer
  L4_2 = L4_2.item
  L5_2 = Config
  L5_2 = L5_2.PlantSettings
  L5_2 = L5_2.fertilizer
  L5_2 = L5_2.amount
  if not L5_2 then
    L5_2 = 1
  end
  L6_2 = GetItemAmount
  L7_2 = L3_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if L5_2 > L6_2 then
    L6_2 = Notify
    L7_2 = L1_2
    L8_2 = _U
    L9_2 = "need_item_amount"
    L10_2 = L5_2
    L11_2 = GetItemLabel
    L12_2 = L4_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L9_2 = "error"
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = RemoveItem
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = L5_2
  L6_2(L7_2, L8_2, L9_2)
  L2_2.fertilizer = 100
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L2_2.lastResourceUpdate = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.Async
  L6_2 = L6_2.execute
  L7_2 = "UPDATE tk_drugs_plants SET fertilizer = ?, lastResourceUpdate = ? WHERE id = ?"
  L8_2 = {}
  L9_2 = L2_2.fertilizer
  L10_2 = L2_2.lastResourceUpdate
  L11_2 = A0_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2(L7_2, L8_2)
  L6_2 = Webhook
  L7_2 = _U
  L8_2 = "webhook_action"
  L9_2 = Utils
  L9_2 = L9_2.GetIdentifiers
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L10_2 = "Fertilize Plant"
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L2_2
  L13_2 = {}
  L13_2.indent = true
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "tk_drugs:harvestPlant"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = GetPlayerFromId
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.Plants
  L5_2 = L3_2.configIndex
  L4_2 = L4_2[L5_2]
  L5_2 = L3_2.lastStage
  L6_2 = L4_2.stages
  L6_2 = #L6_2
  if L5_2 < L6_2 then
    return
  end
  L5_2 = pairs
  L6_2 = L4_2.yield
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = CanCarryItem
    L12_2 = L2_2
    L13_2 = L10_2.item
    L14_2 = L10_2.amount
    L14_2 = L14_2.min
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    if not L11_2 then
      L11_2 = Notify
      L12_2 = L1_2
      L13_2 = _U
      L14_2 = "not_enough_space"
      L13_2 = L13_2(L14_2)
      L14_2 = "error"
      L11_2(L12_2, L13_2, L14_2)
      return
    end
  end
  L5_2 = HarvestPlant
  L6_2 = L2_2
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = L6_1
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = Webhook
  L6_2 = _U
  L7_2 = "webhook_action"
  L8_2 = Utils
  L8_2 = L8_2.GetIdentifiers
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  L9_2 = "Harvest Plant"
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L3_2
  L12_2 = {}
  L12_2.indent = true
  L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L11_1(L12_1, L13_1)
L11_1 = RegisterNetEvent
L12_1 = "tk_drugs:removePlant"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = source
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L3_2 = L6_1
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = Webhook
  L4_2 = _U
  L5_2 = "webhook_action"
  L6_2 = Utils
  L6_2 = L6_2.GetIdentifiers
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L7_2 = "Remove Plant"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L2_2
  L10_2 = {}
  L10_2.indent = true
  L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L11_1(L12_1, L13_1)
function L11_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3
    while true do
      L0_3 = L10_1
      L0_3()
      L0_3 = L9_1
      L0_3()
      L0_3 = Wait
      L1_3 = Config
      L1_3 = L1_3.PlantSettings
      L1_3 = L1_3.updateInterval
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
L12_1 = {}
L12_1.LoadPlants = L7_1
L12_1.RegisterItems = L3_1
L12_1.LoadLamps = L4_1
L12_1.PlantTickLoop = L11_1
Plants = L12_1

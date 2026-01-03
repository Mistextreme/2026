local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.EquipmentItems
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = Config
    L6_2 = L6_2.DebugMode
    if L6_2 then
      L6_2 = print
      L7_2 = "Registering item"
      L8_2 = L4_2
      L9_2 = L5_2.item
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = CreateUsableItem
    L7_2 = L5_2.item
    function L8_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = Config
      L2_3 = L2_3.DebugMode
      if L2_3 then
        L2_3 = print
        L3_3 = "Placing equipment"
        L4_3 = A0_3
        L5_3 = L4_2
        L2_3(L3_3, L4_3, L5_3)
      end
      L2_3 = TriggerClientEvent
      L3_3 = "tk_drugs:placeEquipment"
      L4_3 = A0_3
      L5_3 = L4_2
      L2_3(L3_3, L4_3, L5_3)
    end
    L6_2(L7_2, L8_2)
  end
end
L2_1 = RegisterNetEvent
L3_1 = "tk_drugs:placeEquipment"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = source
  L4_2 = GetPlayerFromId
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = Config
  L5_2 = L5_2.EquipmentItems
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    return
  end
  L6_2 = L5_2.item
  L7_2 = GetItemAmount
  L8_2 = L4_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 <= 0 then
    return
  end
  L7_2 = RemoveItem
  L8_2 = L4_2
  L9_2 = L6_2
  L10_2 = 1
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = vec3
  L8_2 = A1_2.x
  L9_2 = A1_2.y
  L10_2 = A1_2.z
  L10_2 = L10_2 + 1.0
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  A1_2 = L7_2
  L7_2 = GetPlayerRoutingBucket
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L8_2 = MySQL
  L8_2 = L8_2.Sync
  L8_2 = L8_2.insert
  L9_2 = [[
        INSERT INTO
            tk_drugs_equipment (configIndex, coords, rotation, bucket)
        VALUES
            (?, ?, ?, ?)
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
  L14_2 = L7_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    return
  end
  L9_2 = L0_1
  L10_2 = {}
  L10_2.configIndex = A0_2
  L10_2.coords = A1_2
  L10_2.rotation = A2_2
  L10_2.bucket = L7_2
  L9_2[L8_2] = L10_2
  L9_2 = TriggerClientEvent
  L10_2 = "tk_drugs:addEquipment"
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
  L13_2 = "Place Equipment"
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L0_1
  L15_2 = L15_2[L8_2]
  L16_2 = {}
  L16_2.indent = true
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM tk_drugs_equipment"
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
    L11_2 = L0_1
    L12_2 = {}
    L12_2.configIndex = L8_2
    L12_2.coords = L9_2
    L12_2.rotation = L10_2
    L13_2 = L6_2.bucket
    L12_2.bucket = L13_2
    L11_2[L7_2] = L12_2
  end
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Removing equipment"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = MySQL
  L1_2 = L1_2.Sync
  L1_2 = L1_2.execute
  L2_2 = "DELETE FROM tk_drugs_equipment WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2(L2_2, L3_2)
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Equipment removed from database"
    L3_2 = A0_2
    L4_2 = L0_1
    L4_2 = L4_2[A0_2]
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = L0_1
  L1_2[A0_2] = nil
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Equipment removed from memory"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = TriggerClientEvent
  L2_2 = "tk_drugs:removeEquipment"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
end
L4_1 = RegisterNetEvent
L5_1 = "tk_drugs:removeEquipment"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = source
  L3_2 = GetPlayerFromId
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Config
  L4_2 = L4_2.DebugMode
  if L4_2 then
    L4_2 = print
    L5_2 = "Removing equipment"
    L6_2 = A0_2
    L7_2 = L0_1
    L7_2 = L7_2[A0_2]
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.configIndex
  L5_2 = Config
  L5_2 = L5_2.DebugMode
  if L5_2 then
    L5_2 = print
    L6_2 = "configIndex"
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
  end
  if not L4_2 then
    L5_2 = L3_1
    L6_2 = A0_2
    L5_2(L6_2)
    return
  end
  L5_2 = Config
  L5_2 = L5_2.EquipmentItems
  L5_2 = L5_2[L4_2]
  L6_2 = Config
  L6_2 = L6_2.DebugMode
  if L6_2 then
    L6_2 = print
    L7_2 = "configData"
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  if not L5_2 then
    L6_2 = L3_1
    L7_2 = A0_2
    L6_2(L7_2)
    return
  end
  L6_2 = L5_2.item
  L7_2 = Config
  L7_2 = L7_2.DebugMode
  if L7_2 then
    L7_2 = print
    L8_2 = "item"
    L9_2 = A0_2
    L10_2 = L4_2
    L11_2 = L6_2
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  if not L6_2 then
    L7_2 = L3_1
    L8_2 = A0_2
    L7_2(L8_2)
    return
  end
  L7_2 = AddItem
  L8_2 = L3_2
  L9_2 = L6_2
  L10_2 = 1
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = Notify
    L8_2 = L2_2
    L9_2 = _U
    L10_2 = "not_enough_space"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L3_1
  L8_2 = A0_2
  L7_2(L8_2)
  L7_2 = Webhook
  L8_2 = _U
  L9_2 = "webhook_action"
  L10_2 = Utils
  L10_2 = L10_2.GetIdentifiers
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = "Remove Equipment"
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L0_1
  L13_2 = L13_2[A0_2]
  L14_2 = {}
  L14_2.indent = true
  L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterCallback
L5_1 = "tk_drugs:getEquipment"
function L6_1(A0_2, A1_2)
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
L4_1(L5_1, L6_1)
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L5_2 == A0_2 then
      return L6_2
    end
  end
  L1_2 = nil
  return L1_2
end
L5_1 = {}
L5_1.LoadEquipment = L2_1
L5_1.RegisterItems = L1_1
L5_1.GetEquipmentById = L4_1
Equipment = L5_1

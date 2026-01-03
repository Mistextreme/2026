local L0_1, L1_1, L2_1, L3_1
L0_1 = false
frameworkLoaded = false
initDone = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = Equipment
  L0_2 = L0_2.LoadEquipment
  L0_2()
  L0_2 = Plants
  L0_2 = L0_2.LoadPlants
  L0_2()
  L0_2 = Plants
  L0_2 = L0_2.LoadLamps
  L0_2()
  L0_2 = Effects
  L0_2 = L0_2.RegisterItems
  L0_2()
  L0_2 = Plants
  L0_2 = L0_2.RegisterItems
  L0_2()
  L0_2 = Equipment
  L0_2 = L0_2.RegisterItems
  L0_2()
  L0_2 = Zones
  L0_2 = L0_2.CheckRoutingBuckets
  L0_2()
  L0_2 = Plants
  L0_2 = L0_2.PlantTickLoop
  L0_2()
  initDone = true
end
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2
  repeat
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
    L0_2 = frameworkLoaded
  until L0_2
  L0_2 = L0_1
  L0_2()
end
L1_1(L2_1)
L1_1 = RegisterNetEvent
L2_1 = "tk_drugs:completeRecipe"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = source
  L4_2 = GetPlayerFromId
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = Utils
  L5_2 = L5_2.Debug
  L6_2 = "completeRecipe"
  L7_2 = L4_2
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L4_2 then
    return
  end
  if A2_2 <= 0 then
    return
  end
  L5_2 = Equipment
  L5_2 = L5_2.GetEquipmentById
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = Utils
  L6_2 = L6_2.Debug
  L7_2 = "equipment"
  L8_2 = L5_2
  L9_2 = Config
  L9_2 = L9_2.EquipmentLocations
  L9_2 = L9_2[A0_2]
  L6_2(L7_2, L8_2, L9_2)
  if not L5_2 then
    L6_2 = Config
    L6_2 = L6_2.EquipmentLocations
    L6_2 = L6_2[A0_2]
    if not L6_2 then
      return
    end
  end
  L6_2 = L5_2
  if L6_2 then
    L6_2 = L6_2.configIndex
  end
  if not L6_2 then
    L6_2 = Config
    L6_2 = L6_2.EquipmentLocations
    L6_2 = L6_2[A0_2]
    if L6_2 then
      L6_2 = L6_2.configIndex
    end
  end
  L7_2 = Utils
  L7_2 = L7_2.Debug
  L8_2 = "configIndex"
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  if not L6_2 then
    return
  end
  L7_2 = Config
  L7_2 = L7_2.EquipmentItems
  L7_2 = L7_2[L6_2]
  L8_2 = Utils
  L8_2 = L8_2.Debug
  L9_2 = "configData"
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
  if L7_2 then
    L8_2 = L7_2.recipes
    if L8_2 then
      goto lbl_73
    end
  end
  do return end
  ::lbl_73::
  L8_2 = L7_2.recipes
  L8_2 = L8_2[A1_2]
  L9_2 = Utils
  L9_2 = L9_2.Debug
  L10_2 = "recipe"
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  if not L8_2 then
    return
  end
  L9_2 = pairs
  L10_2 = L8_2.need
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = GetItemAmount
    L16_2 = L4_2
    L17_2 = L14_2.name
    L15_2 = L15_2(L16_2, L17_2)
    L16_2 = Utils
    L16_2 = L16_2.Debug
    L17_2 = "item"
    L18_2 = L14_2
    L19_2 = L15_2
    L20_2 = L14_2.amount
    L20_2 = L20_2 * A2_2
    L16_2(L17_2, L18_2, L19_2, L20_2)
    L16_2 = L14_2.amount
    L16_2 = L16_2 * A2_2
    if L15_2 < L16_2 then
      return
    end
  end
  L9_2 = pairs
  L10_2 = L8_2.get
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = CanCarryItem
    L16_2 = L4_2
    L17_2 = L14_2.name
    L18_2 = L14_2.amount
    L18_2 = L18_2 * A2_2
    L15_2 = L15_2(L16_2, L17_2, L18_2)
    if not L15_2 then
      return
    end
  end
  L9_2 = pairs
  L10_2 = L8_2.need
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = Utils
    L15_2 = L15_2.Debug
    L16_2 = "removeItem"
    L17_2 = L14_2.name
    L18_2 = L14_2.amount
    L18_2 = L18_2 * A2_2
    L15_2(L16_2, L17_2, L18_2)
    L15_2 = RemoveItem
    L16_2 = L4_2
    L17_2 = L14_2.name
    L18_2 = L14_2.amount
    L18_2 = L18_2 * A2_2
    L15_2(L16_2, L17_2, L18_2)
  end
  L9_2 = Wait
  L10_2 = 500
  L9_2(L10_2)
  L9_2 = pairs
  L10_2 = L8_2.get
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = Utils
    L15_2 = L15_2.Debug
    L16_2 = "addItem"
    L17_2 = L14_2.name
    L18_2 = L14_2.amount
    L18_2 = L18_2 * A2_2
    L15_2(L16_2, L17_2, L18_2)
    L15_2 = AddItem
    L16_2 = L4_2
    L17_2 = L14_2.name
    L18_2 = L14_2.amount
    L18_2 = L18_2 * A2_2
    L15_2(L16_2, L17_2, L18_2)
  end
  L9_2 = Utils
  L9_2 = L9_2.Debug
  L10_2 = "completed recipe"
  L11_2 = L4_2
  L12_2 = A0_2
  L13_2 = A1_2
  L14_2 = A2_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = Webhook
  L10_2 = _U
  L11_2 = "webhook_action"
  L12_2 = Utils
  L12_2 = L12_2.GetIdentifiers
  L13_2 = L3_2
  L12_2 = L12_2(L13_2)
  L13_2 = "Complete Recipe"
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L8_2
  L16_2 = {}
  L16_2.indent = true
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L14_2(L15_2, L16_2)
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "tk_drugs:alertPolice"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = pairs
  L4_2 = GetPlayers
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2()
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = tonumber
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L8_2 = L9_2
    L9_2 = GetPlayerFromId
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L10_2 = GetJobName
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      L11_2 = Config
      L11_2 = L11_2.PoliceJobs
      L11_2 = L11_2[L10_2]
      if L11_2 then
        L11_2 = TriggerClientEvent
        L12_2 = "tk_drugs:alertPolice"
        L13_2 = L8_2
        L14_2 = A0_2
        L15_2 = A1_2
        L16_2 = A2_2
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)

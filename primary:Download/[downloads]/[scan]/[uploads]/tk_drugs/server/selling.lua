local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ipairs
  L2_2 = Config
  L2_2 = L2_2.Selling
  L2_2 = L2_2.items
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.name
    if L7_2 == A0_2 then
      return L5_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = 5000
L7_1 = 2000
L8_1 = 20
L9_1 = Config
L9_1 = L9_1.Selling
L9_1 = L9_1.interactionDistance
L9_1 = L9_1 + 2.0
L10_1 = Config
L10_1 = L10_1.Selling
L10_1 = L10_1.interactionDistance
L10_1 = L10_1 + 2.0
L11_1 = 0.95
function L12_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L2_2 = L2_2 - L1_2
  L3_2 = L6_1
  L3_2 = L2_2 < L3_2
  return L3_2
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L5_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L2_2 = L2_2 - L1_2
  L3_2 = L7_1
  L3_2 = L2_2 < L3_2
  return L3_2
end
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L3_2 = L1_2 - L2_2
    L4_2 = 60000
    if not (L3_2 > L4_2) then
      goto lbl_16
    end
  end
  L3_2 = L4_1
  L3_2[A0_2] = 0
  L3_2 = L5_1
  L3_2[A0_2] = L1_2
  ::lbl_16::
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = 0
  end
  L4_2 = L8_1
  L4_2 = L3_2 >= L4_2
  return L4_2
end
function L15_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if "string" == L1_2 then
      goto lbl_10
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_10::
  L1_2 = L0_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = true
  return L2_2
end
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A0_2 then
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not ("number" ~= L2_2 or A0_2 <= 0) then
      goto lbl_12
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_12::
  L2_2 = L0_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = Config
  L3_2 = L3_2.Selling
  L3_2 = L3_2.items
  L3_2 = L3_2[L2_2]
  L4_2 = L3_2.maxAmount
  if A0_2 > L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = true
  return L4_2
end
function L17_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A1_2 then
    L4_2 = type
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if not ("number" ~= L4_2 or A1_2 <= 0) then
      goto lbl_12
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_12::
  L4_2 = L0_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.Selling
  L5_2 = L5_2.items
  L5_2 = L5_2[L4_2]
  L6_2 = L5_2.price
  L6_2 = L6_2.min
  L6_2 = L6_2 * A3_2
  L7_2 = L5_2.price
  L7_2 = L7_2.max
  L7_2 = L7_2 * A3_2
  if A1_2 < L6_2 or A1_2 > L7_2 then
    L8_2 = false
    return L8_2
  end
  L8_2 = A1_2 / L7_2
  L9_2 = L11_1
  if L8_2 > L9_2 then
    L9_2 = print
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = "[TK_DRUGS] Suspicious price detected for player ID %s: %s %dx for %d\226\130\172 (%.1f%% of max)"
    L12_2 = A0_2
    L13_2 = A2_2
    L14_2 = A3_2
    L15_2 = A1_2
    L16_2 = L8_2 * 100
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
  L9_2 = true
  return L9_2
end
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = ipairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if "string" ~= L7_2 then
      L7_2 = false
      return L7_2
    end
  end
  L1_2 = true
  return L1_2
end
function L19_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not ("number" ~= L1_2 or A0_2 <= 0) then
      goto lbl_12
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_12::
  L1_2 = true
  return L1_2
end
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = Utils
  L3_2 = L3_2.GetIdentifiers
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = {}
  L4_2.reason = A1_2
  L4_2.data = A2_2
  L5_2 = print
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "[TK_DRUGS] Possible Cheater: %s - Player Data: %s"
  L8_2 = A1_2
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L3_2
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = Webhook
  L6_2 = _U
  L7_2 = "webhook_cheater"
  L8_2 = L3_2
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L4_2
  L11_2 = {}
  L11_2.indent = true
  L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L21_1 = RegisterCallback
L22_1 = "tk_drugs:hasPedBeenSoldTo"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = A1_2
  L4_2 = L2_1
  L4_2 = L4_2[A2_2]
  L3_2(L4_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterCallback
L22_1 = "tk_drugs:getPoliceAmount"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "getting police amount"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
  end
  L2_2 = A1_2
  L3_2 = GetPoliceAmount
  L3_2, L4_2 = L3_2()
  L2_2(L3_2, L4_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNetEvent
L22_1 = "tk_drugs:sellDrugs"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L5_2 = source
  L6_2 = GetPlayerFromId
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid player"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L12_1
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  if L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Sale cooldown violation"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L15_1
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid drug name"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L16_1
  L8_2 = A1_2
  L9_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid amount"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L17_1
  L8_2 = L5_2
  L9_2 = A2_2
  L10_2 = A0_2
  L11_2 = A1_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  if not L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid price"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L18_1
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid effects"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L10_2.effects = A3_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L19_1
  L8_2 = A4_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Invalid netId"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L10_2.netId = A4_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = GetPoliceAmount
  L7_2 = L7_2()
  L8_2 = Config
  L8_2 = L8_2.Selling
  L8_2 = L8_2.minPolice
  if L7_2 < L8_2 then
    L7_2 = Notify
    L8_2 = L5_2
    L9_2 = _U
    L10_2 = "not_enough_police"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = GetItemAmount
  L8_2 = L6_2
  L9_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2)
  if A1_2 > L7_2 then
    L7_2 = L20_1
    L8_2 = L5_2
    L9_2 = "Insufficient items"
    L10_2 = {}
    L10_2.drugName = A0_2
    L10_2.amount = A1_2
    L10_2.expectedPrice = A2_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = NetworkGetEntityFromNetworkId
  L8_2 = A4_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetGameTimer
  L8_2 = L8_2()
  L8_2 = L8_2 + 2000
  while true do
    L9_2 = DoesEntityExist
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = GetGameTimer
    L9_2 = L9_2()
    if not (L8_2 > L9_2) then
      break
    end
    L9_2 = Wait
    L10_2 = 100
    L9_2(L10_2)
  end
  L9_2 = DoesEntityExist
  L10_2 = L7_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = L20_1
    L10_2 = L5_2
    L11_2 = "Invalid ped entity"
    L12_2 = {}
    L12_2.drugName = A0_2
    L12_2.amount = A1_2
    L12_2.expectedPrice = A2_2
    L12_2.netId = A4_2
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = GetEntityCoords
  L10_2 = GetPlayerPed
  L11_2 = L5_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L10_2(L11_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L10_2 = GetEntityCoords
  L11_2 = L7_2
  L10_2 = L10_2(L11_2)
  L10_2 = L9_2 - L10_2
  L10_2 = #L10_2
  L11_2 = L9_1
  if L10_2 > L11_2 then
    L11_2 = L20_1
    L12_2 = L5_2
    L13_2 = "Distance violation"
    L14_2 = {}
    L14_2.drugName = A0_2
    L14_2.amount = A1_2
    L14_2.expectedPrice = A2_2
    L14_2.distance = L10_2
    L11_2(L12_2, L13_2, L14_2)
    return
  end
  L11_2 = L2_1
  L11_2 = L11_2[A4_2]
  if not L11_2 then
    L11_2 = L20_1
    L12_2 = L5_2
    L13_2 = "Ped not in sold list"
    L14_2 = {}
    L14_2.drugName = A0_2
    L14_2.amount = A1_2
    L14_2.expectedPrice = A2_2
    L14_2.netId = A4_2
    L11_2(L12_2, L13_2, L14_2)
    return
  end
  L11_2 = Config
  L11_2 = L11_2.Selling
  L11_2 = L11_2.items
  L12_2 = L0_1
  L13_2 = A0_2
  L12_2 = L12_2(L13_2)
  L11_2 = L11_2[L12_2]
  L12_2 = A2_2
  L13_2 = Config
  L13_2 = L13_2.Drugs
  L13_2 = L13_2[A0_2]
  if L13_2 then
    L13_2 = L13_2.effects
  end
  if not L13_2 then
    L13_2 = {}
  end
  L14_2 = 0
  L15_2 = ipairs
  L16_2 = A3_2 or L16_2
  if not A3_2 then
    L16_2 = {}
  end
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
  for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
    L21_2 = L1_1
    L22_2 = L13_2
    L23_2 = L20_2
    L21_2 = L21_2(L22_2, L23_2)
    if L21_2 then
      L21_2 = math
      L21_2 = L21_2.floor
      L22_2 = L12_2 * 0.1
      L21_2 = L21_2(L22_2)
      L14_2 = L14_2 + L21_2
    end
  end
  L12_2 = L12_2 + L14_2
  L15_2 = RemoveItem
  L16_2 = L6_2
  L17_2 = A0_2
  L18_2 = A1_2
  L15_2(L16_2, L17_2, L18_2)
  L15_2 = SoldDrugs
  L16_2 = L6_2
  L17_2 = A0_2
  L18_2 = A1_2
  L19_2 = L12_2
  L15_2(L16_2, L17_2, L18_2, L19_2)
  L15_2 = L2_1
  L15_2[A4_2] = true
  L15_2 = L3_1
  L16_2 = GetGameTimer
  L16_2 = L16_2()
  L15_2[L5_2] = L16_2
  L15_2 = GetItemLabel
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L16_2 = Notify
  L17_2 = L5_2
  L18_2 = _U
  L19_2 = "drug_sale_success"
  L20_2 = A1_2
  L21_2 = L15_2
  L22_2 = L12_2
  L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
  L19_2 = "success"
  L16_2(L17_2, L18_2, L19_2)
  L16_2 = {}
  L16_2.item = A0_2
  L16_2.amount = A1_2
  L16_2.price = L12_2
  L16_2.effects = A3_2
  L17_2 = Webhook
  L18_2 = _U
  L19_2 = "webhook_action"
  L20_2 = Utils
  L20_2 = L20_2.GetIdentifiers
  L21_2 = L5_2
  L20_2 = L20_2(L21_2)
  L21_2 = "Sell Drugs"
  L22_2 = json
  L22_2 = L22_2.encode
  L23_2 = L16_2
  L24_2 = {}
  L24_2.indent = true
  L22_2, L23_2, L24_2 = L22_2(L23_2, L24_2)
  L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNetEvent
L22_1 = "tk_drugs:addPed"
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = L19_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = L20_1
    L3_2 = L1_2
    L4_2 = "Invalid addPed netId"
    L5_2 = {}
    L5_2.netId = A0_2
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = L13_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = L20_1
    L3_2 = L1_2
    L4_2 = "AddPed cooldown violation"
    L5_2 = {}
    L5_2.netId = A0_2
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = L14_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = L20_1
    L3_2 = L1_2
    L4_2 = "AddPed rate limit exceeded"
    L5_2 = {}
    L5_2.netId = A0_2
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = DoesEntityExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = L20_1
    L4_2 = L1_2
    L5_2 = "AddPed invalid entity"
    L6_2 = {}
    L6_2.netId = A0_2
    L3_2(L4_2, L5_2, L6_2)
    return
  end
  L3_2 = GetEntityCoords
  L4_2 = GetPlayerPed
  L5_2 = L1_2
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = GetEntityCoords
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L3_2 - L4_2
  L4_2 = #L4_2
  L5_2 = L10_1
  if L4_2 > L5_2 then
    L5_2 = L20_1
    L6_2 = L1_2
    L7_2 = "AddPed distance violation"
    L8_2 = {}
    L8_2.netId = A0_2
    L8_2.distance = L4_2
    L5_2(L6_2, L7_2, L8_2)
    return
  end
  L5_2 = L4_1
  L6_2 = L4_1
  L6_2 = L6_2[L1_2]
  if not L6_2 then
    L6_2 = 0
  end
  L6_2 = L6_2 + 1
  L5_2[L1_2] = L6_2
  L5_2 = L2_1
  L5_2[A0_2] = true
end
L21_1(L22_1, L23_1)
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = Wait
    L1_2 = 300000
    L0_2(L1_2)
    L0_2 = GetGameTimer
    L0_2 = L0_2()
    L1_2 = pairs
    L2_2 = L3_1
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L0_2 - L6_2
      L8_2 = 600000
      if L7_2 > L8_2 then
        L7_2 = L3_1
        L7_2[L5_2] = nil
      end
    end
    L1_2 = pairs
    L2_2 = L5_1
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L0_2 - L6_2
      L8_2 = 120000
      if L7_2 > L8_2 then
        L7_2 = L4_1
        L7_2[L5_2] = nil
        L7_2 = L5_1
        L7_2[L5_2] = nil
      end
    end
  end
end
L21_1(L22_1)

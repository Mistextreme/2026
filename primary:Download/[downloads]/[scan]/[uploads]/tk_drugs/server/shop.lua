local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "tk_drugs:purchaseCart"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = source
  L3_2 = GetPlayerFromId
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Config
  L4_2 = L4_2.Shops
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.Shops
  L4_2 = L4_2[A0_2]
  L5_2 = 0
  L6_2 = {}
  L7_2 = pairs
  L8_2 = A1_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = nil
    L14_2 = pairs
    L15_2 = L4_2.items
    L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
    for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
      L20_2 = L19_2.name
      if L20_2 == L11_2 then
        L13_2 = L19_2
        break
      end
    end
    if not L13_2 then
      return
    end
    L14_2 = L13_2.price
    L14_2 = L14_2 * L12_2
    L5_2 = L5_2 + L14_2
    L14_2 = #L6_2
    L14_2 = L14_2 + 1
    L15_2 = {}
    L15_2.name = L11_2
    L15_2.amount = L12_2
    L16_2 = L13_2.price
    L15_2.price = L16_2
    L6_2[L14_2] = L15_2
  end
  L7_2 = GetAccountMoney
  L8_2 = L3_2
  L9_2 = L4_2.moneyType
  L7_2 = L7_2(L8_2, L9_2)
  if L5_2 > L7_2 then
    L7_2 = Notify
    L8_2 = L2_2
    L9_2 = _U
    L10_2 = "not_enough_money"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = pairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = CanCarryItem
    L14_2 = L3_2
    L15_2 = L12_2.name
    L16_2 = L12_2.amount
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    if not L13_2 then
      L13_2 = Notify
      L14_2 = L2_2
      L15_2 = _U
      L16_2 = "not_enough_space"
      L15_2 = L15_2(L16_2)
      L16_2 = "error"
      L13_2(L14_2, L15_2, L16_2)
      return
    end
  end
  L7_2 = RemoveAccountMoney
  L8_2 = L3_2
  L9_2 = L4_2.moneyType
  L10_2 = L5_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = ipairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = AddItem
    L14_2 = L3_2
    L15_2 = L12_2.name
    L16_2 = L12_2.amount
    L13_2(L14_2, L15_2, L16_2)
  end
  L7_2 = PurchasedShopItems
  L8_2 = L2_2
  L9_2 = A0_2
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = Notify
  L8_2 = L2_2
  L9_2 = _U
  L10_2 = "purchase_successful"
  L11_2 = L5_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = "success"
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = Webhook
  L8_2 = _U
  L9_2 = "webhook_action"
  L10_2 = Utils
  L10_2 = L10_2.GetIdentifiers
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = "Shop Purchase"
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L6_2
  L14_2 = {}
  L14_2.indent = true
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L12_2(L13_2, L14_2)
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
end
L0_1(L1_1, L2_1)

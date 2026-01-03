local L0_1, L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Drugs
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = CreateUsableItem
    L7_2 = L4_2
    function L8_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3
      L1_3 = GetPlayerFromId
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      L2_3 = TriggerClientEvent
      L3_3 = "tk_drugs:applyEffects"
      L4_3 = A0_3
      L5_3 = L4_2
      L2_3(L3_3, L4_3, L5_3)
      L2_3 = RemoveItem
      L3_3 = L1_3
      L4_3 = L4_2
      L5_3 = 1
      L2_3(L3_3, L4_3, L5_3)
    end
    L6_2(L7_2, L8_2)
  end
end
L1_1 = {}
L1_1.RegisterItems = L0_1
Effects = L1_1

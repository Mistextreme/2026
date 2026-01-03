local L0_1, L1_1, L2_1
L0_1 = {}
function L1_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = ipairs
      L1_3 = GetPlayers
      L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3 = L1_3()
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = GetPlayerRoutingBucket
        L7_3 = L5_3
        L6_3 = L6_3(L7_3)
        L7_3 = L0_1
        L7_3 = L7_3[L5_3]
        if not L7_3 or L7_3 ~= L6_3 then
          L8_3 = L0_1
          L8_3[L5_3] = L6_3
          L8_3 = TriggerClientEvent
          L9_3 = "tk_drugs:setRoutingBucket"
          L10_3 = L5_3
          L11_3 = L6_3
          L8_3(L9_3, L10_3, L11_3)
        end
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
L2_1 = {}
L2_1.CheckRoutingBuckets = L1_1
Zones = L2_1

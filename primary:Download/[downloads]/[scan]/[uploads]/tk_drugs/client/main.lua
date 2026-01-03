local L0_1, L1_1, L2_1, L3_1
L0_1 = false
frameworkLoaded = false
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Equipment
  L0_2 = L0_2.GetEquipment
  L0_2 = L0_2()
  L1_2 = Equipment
  L1_2 = L1_2.Init
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = Plants
  L1_2 = L1_2.GetPlants
  L1_2 = L1_2()
  L2_2 = Plants
  L2_2 = L2_2.GetLamps
  L2_2 = L2_2()
  L3_2 = Plants
  L3_2 = L3_2.Init
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = Zones
  L3_2 = L3_2.Init
  L3_2()
  L3_2 = Selling
  L3_2 = L3_2.Init
  L3_2()
  L3_2 = Shop
  L3_2 = L3_2.Init
  L3_2()
  L3_2 = true
  L0_1 = L3_2
end
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2
  repeat
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
    L0_2 = frameworkLoaded
  until L0_2
  L0_2 = L1_1
  L0_2()
end
L2_1(L3_1)

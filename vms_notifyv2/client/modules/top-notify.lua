local L0_1, L1_1, L2_1, L3_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.soundNative
  if L1_2 then
    L1_2 = A0_2.soundNative
    L1_2 = L1_2[1]
    if L1_2 then
      A0_2.soundFile = nil
      L1_2 = PlaySoundFrontend
      L2_2 = A0_2.soundNative
      L2_2 = L2_2[1]
      L3_2 = A0_2.soundNative
      L3_2 = L3_2[2]
      L4_2 = A0_2.soundNative
      L4_2 = L4_2[3]
      L5_2 = A0_2.soundNative
      L5_2 = L5_2[4]
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "openTopNotification"
  L2_2.data = A0_2
  L1_2(L2_2)
end
L1_1 = exports
L2_1 = "TopNotification"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "vms_notifyv2:TopNotification"
L3_1 = L0_1
L1_1(L2_1, L3_1)

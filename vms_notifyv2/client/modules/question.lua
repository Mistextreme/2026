local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = false
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = L0_1
  if not L2_2 then
    L2_2 = true
    L0_1 = L2_2
    L2_2 = {}
    L3_2 = type
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      L3_2 = A0_2.preset
      if L3_2 then
        L3_2 = Config
        L3_2 = L3_2.QuestionsPresets
        L4_2 = A0_2.preset
        L3_2 = L3_2[L4_2]
        if L3_2 then
          L3_2 = deepCopy
          L4_2 = Config
          L4_2 = L4_2.QuestionsPresets
          L5_2 = A0_2.preset
          L4_2 = L4_2[L5_2]
          L3_2 = L3_2(L4_2)
          L2_2 = L3_2
          L3_2 = pairs
          L4_2 = A0_2
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L2_2[L7_2] = L8_2
          end
        end
      end
    else
      L2_2 = A0_2
    end
    if not A1_2 then
      L3_2 = Config
      A1_2 = L3_2.DefaultQuestionKeys
    end
    L2_2.keys = A1_2
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.action = "openQuestion"
    L4_2.data = L2_2
    L3_2(L4_2)
    while true do
      L3_2 = L0_1
      if not L3_2 then
        break
      end
      L3_2 = pairs
      L4_2 = A1_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = IsControlJustPressed
        L10_2 = 0
        L11_2 = L8_2.control
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L9_2 = SendNUIMessage
          L10_2 = {}
          L10_2.action = "closeQuestion"
          L11_2 = L8_2.control
          L10_2.button = L11_2
          L9_2(L10_2)
          L9_2 = false
          L0_1 = L9_2
          L9_2 = tostring
          L10_2 = L8_2.control
          return L9_2(L10_2)
        end
      end
      L3_2 = Citizen
      L3_2 = L3_2.Wait
      L4_2 = 2
      L3_2(L4_2)
    end
  else
    L2_2 = false
    return L2_2
  end
end
L2_1 = exports
L3_1 = "Question"
L4_1 = L1_1
L2_1(L3_1, L4_1)
L2_1 = {}
L3_1 = {}
L4_1 = "vms_notify"
L5_1 = "Question"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L1_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.color = A2_2
  L5_2.icon = A3_2
  return L4_2(L5_2)
end
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L2_1[1] = L3_1
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
for L7_1, L8_1 in L3_1, L4_1, L5_1, L6_1 do
  L9_1 = AddEventHandler
  L10_1 = "__cfx_export_%s_%s"
  L11_1 = L10_1
  L10_1 = L10_1.format
  L12_1 = L8_1[1]
  L13_1 = L8_1[2]
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  function L11_1(A0_2)
    local L1_2, L2_2
    L1_2 = A0_2
    L2_2 = L8_1
    L2_2 = L2_2[3]
    L1_2(L2_2)
  end
  L9_1(L10_1, L11_1)
end

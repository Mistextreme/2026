local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = {}
  if not A1_2 then
    L3_2 = {}
    A1_2 = L3_2
  end
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["textui.style"]
    if L0_3 then
      L0_3 = Config
      L0_3 = L0_3.TextUIPresets
      L1_3 = NOTIFY_CACHE
      L1_3 = L1_3["textui.style"]
      L0_3 = L0_3[L1_3]
      if L0_3 then
        L0_3 = deepCopy
        L1_3 = Config
        L1_3 = L1_3.TextUIPresets
        L2_3 = NOTIFY_CACHE
        L2_3 = L2_3["textui.style"]
        L1_3 = L1_3[L2_3]
        L0_3 = L0_3(L1_3)
        L2_2 = L0_3
      end
    end
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["textui.size"]
    if L0_3 then
      L0_3 = L2_2.customCSS
      if not L0_3 then
        L0_3 = {}
        L2_2.customCSS = L0_3
      end
      L0_3 = L2_2.customCSS
      L0_3 = L0_3.background
      if not L0_3 then
        L0_3 = L2_2.customCSS
        L1_3 = {}
        L0_3.background = L1_3
      end
      L0_3 = nil
      L1_3 = NOTIFY_CACHE
      L1_3 = L1_3["textui.size"]
      if L1_3 then
        L1_3 = tonumber
        L2_3 = NOTIFY_CACHE
        L2_3 = L2_3["textui.size"]
        L1_3 = L1_3(L2_3)
        if L1_3 > 1.0 then
          L0_3 = L1_3
          L2_3 = L2_2.customCSS
          L2_3 = L2_3.background
          L2_3.scale = L0_3
        end
      end
    end
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["textui.sound"]
    L2_2.soundFile = L0_3
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["textui.sound_volume"]
    L2_2.soundVolume = L0_3
  end
  L4_2 = Config
  L4_2 = L4_2.PlayerSettingsPriority
  if not L4_2 then
    L4_2 = L3_2
    L4_2()
  end
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = A1_2.preset
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.TextUIPresets
      L5_2 = A1_2.preset
      L4_2 = L4_2[L5_2]
      if L4_2 then
        L4_2 = deepCopy
        L5_2 = Config
        L5_2 = L5_2.TextUIPresets
        L6_2 = A1_2.preset
        L5_2 = L5_2[L6_2]
        L4_2 = L4_2(L5_2)
        L2_2 = L4_2
      end
    end
  end
  L4_2 = Config
  L4_2 = L4_2.PlayerSettingsPriority
  if L4_2 then
    L4_2 = L3_2
    L4_2()
  end
  L2_2.message = A0_2
  L4_2 = L2_2.soundNative
  if L4_2 then
    L4_2 = L2_2.soundNative
    L4_2 = L4_2[1]
    if L4_2 then
      L2_2.soundFile = nil
      L4_2 = PlaySoundFrontend
      L5_2 = L2_2.soundNative
      L5_2 = L5_2[1]
      L6_2 = L2_2.soundNative
      L6_2 = L6_2[2]
      L7_2 = L2_2.soundNative
      L7_2 = L7_2[3]
      L8_2 = L2_2.soundNative
      L8_2 = L8_2[4]
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "showTextUI"
  L5_2.data = L2_2
  L4_2(L5_2)
end
L1_1 = exports
L2_1 = "ShowTextUI"
L3_1 = L0_1
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = data
  if not L1_2 then
    L1_2 = {}
    data = L1_2
  end
  L1_2 = data
  L1_2.message = A0_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "updateTextUI"
  L3_2 = data
  L2_2.data = L3_2
  L1_2(L2_2)
end
L2_1 = exports
L3_1 = "UpdateTextUI"
L4_1 = L1_1
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "closeTextUI"
  L0_2(L1_2)
end
L3_1 = exports
L4_1 = "HideTextUI"
L5_1 = L2_1
L3_1(L4_1, L5_1)
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = "interact"
L7_1 = "Open"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1[1] = L5_1
L3_1.ShowTextUI = L4_1
L4_1 = {}
L5_1 = {}
L6_1 = "interact"
L7_1 = "Close"
function L8_1()
  local L0_2, L1_2
  L0_2 = L2_1
  return L0_2()
end
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1[1] = L5_1
L3_1.HideTextUI = L4_1
L4_1 = pairs
L5_1 = L3_1
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
for L8_1, L9_1 in L4_1, L5_1, L6_1, L7_1 do
  L10_1 = pairs
  L11_1 = L9_1
  L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1)
  for L14_1, L15_1 in L10_1, L11_1, L12_1, L13_1 do
    L16_1 = AddEventHandler
    L17_1 = "__cfx_export_%s_%s"
    L18_1 = L17_1
    L17_1 = L17_1.format
    L19_1 = L15_1[1]
    L20_1 = L15_1[2]
    L17_1 = L17_1(L18_1, L19_1, L20_1)
    function L18_1(A0_2)
      local L1_2, L2_2
      L1_2 = A0_2
      L2_2 = L15_1
      L2_2 = L2_2[3]
      L1_2(L2_2)
    end
    L16_1(L17_1, L18_1)
  end
end

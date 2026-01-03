local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
NOTIFY_CACHE = L0_1
L1_1 = false
L2_1 = RegisterNuiCallback
L3_1 = "loaded"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "load"
  L3_2 = Config
  L3_2 = L3_2.Language
  L2_2.lang = L3_2
  L3_2 = Config
  L3_2 = L3_2.DefaultPosition
  L2_2.defaultPos = L3_2
  L3_2 = Config
  L3_2 = L3_2.Skew
  L2_2.useSkew = L3_2
  L1_2(L2_2)
  if A0_2 then
    L1_2 = next
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = pairs
      L2_2 = A0_2
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        if not L6_2 or "null" == L6_2 or "EMPTY_VALUE" == L6_2 then
          L7_2 = NOTIFY_CACHE
          L7_2[L5_2] = nil
        else
          L7_2 = NOTIFY_CACHE
          L7_2[L5_2] = L6_2
        end
      end
    end
  end
end
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = deepCopy
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L1_2[L6_2] = L8_2
    else
      L1_2[L6_2] = L7_2
    end
  end
  return L1_2
end
deepCopy = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = L1_1
  L0_2 = not L0_2
  L1_1 = L0_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L2_2 = L1_1
  if L2_2 then
    L2_2 = "openCustomizationMenu"
    if L2_2 then
      goto lbl_14
    end
  end
  L2_2 = "closeCustomizationMenu"
  ::lbl_14::
  L1_2.action = L2_2
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = L1_1
  L2_2 = L1_1
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "closeTextUI"
  L0_2(L1_2)
end
L3_1 = Config
L3_1 = L3_1.EnableCustomizationMenu
if L3_1 then
  L3_1 = Config
  L3_1 = L3_1.CustomizationMenuCommand
  if L3_1 then
    L3_1 = RegisterCommand
    L4_1 = Config
    L4_1 = L4_1.CustomizationMenuCommand
    L5_1 = L2_1
    L3_1(L4_1, L5_1)
    L3_1 = Config
    L3_1 = L3_1.CustomizationMenuKey
    if L3_1 then
      L3_1 = RegisterKeyMapping
      L4_1 = Config
      L4_1 = L4_1.CustomizationMenuCommand
      L5_1 = Config
      L5_1 = L5_1.CustomizationMenuDescription
      L6_1 = "keyboard"
      L7_1 = Config
      L7_1 = L7_1.CustomizationMenuKey
      L3_1(L4_1, L5_1, L6_1, L7_1)
    end
  end
end
L3_1 = RegisterNuiCallback
L4_1 = "close"
function L5_1()
  local L0_2, L1_2
  L0_2 = L2_1
  L0_2()
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNuiCallback
L4_1 = "previewNotification"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = nil
  L2_2 = A0_2.size
  if L2_2 then
    L2_2 = tonumber
    L3_2 = A0_2.size
    L2_2 = L2_2(L3_2)
    if L2_2 > 1.0 then
      L1_2 = L2_2
    end
  end
  L2_2 = {}
  L3_2 = A0_2.style
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.NotificationsPresets
    L4_2 = A0_2.style
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L3_2 = deepCopy
      L4_2 = Config
      L4_2 = L4_2.NotificationsPresets
      L5_2 = A0_2.style
      L4_2 = L4_2[L5_2]
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
  end
  if L1_2 then
    L3_2 = L2_2.customCSS
    if not L3_2 then
      L3_2 = {}
      L2_2.customCSS = L3_2
    end
    L3_2 = L2_2.customCSS
    L3_2 = L3_2.background
    if not L3_2 then
      L3_2 = L2_2.customCSS
      L4_2 = {}
      L3_2.background = L4_2
    end
    L3_2 = L2_2.customCSS
    L3_2 = L3_2.background
    L3_2.scale = L1_2
    L3_2 = L2_2.customCSS
    L3_2 = L3_2.background
    L4_2 = L1_2
    L5_2 = "em"
    L4_2 = L4_2 .. L5_2
    L3_2["margin-top"] = L4_2
  end
  L3_2 = Config
  L3_2 = L3_2.CustomizationMenuPreview
  L3_2 = L3_2.notification
  L3_2 = L3_2.title
  L2_2.title = L3_2
  L3_2 = Config
  L3_2 = L3_2.CustomizationMenuPreview
  L3_2 = L3_2.notification
  L3_2 = L3_2.description
  L2_2.description = L3_2
  L3_2 = Config
  L3_2 = L3_2.CustomizationMenuPreview
  L3_2 = L3_2.notification
  L3_2 = L3_2.time
  L2_2.time = L3_2
  L3_2 = Config
  L3_2 = L3_2.CustomizationMenuPreview
  L3_2 = L3_2.notification
  L3_2 = L3_2.colorsList
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 1
  L6_2 = #L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L3_2[L4_2]
  L2_2.color = L5_2
  L5_2 = Config
  L5_2 = L5_2.CustomizationMenuPreview
  L5_2 = L5_2.notification
  L5_2 = L5_2.iconsList
  L6_2 = math
  L6_2 = L6_2.random
  L7_2 = 1
  L8_2 = #L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L5_2[L6_2]
  L2_2.icon = L7_2
  L7_2 = A0_2.sound
  if L7_2 then
    L7_2 = A0_2.sound
    L2_2.soundFile = L7_2
  end
  L7_2 = A0_2.soundVolume
  if L7_2 then
    L7_2 = A0_2.soundVolume
    L2_2.soundVolume = L7_2
  end
  L7_2 = L2_2.soundNative
  if L7_2 then
    L7_2 = L2_2.soundNative
    L7_2 = L7_2[1]
    if L7_2 then
      L2_2.soundFile = nil
      L7_2 = PlaySoundFrontend
      L8_2 = L2_2.soundNative
      L8_2 = L8_2[1]
      L9_2 = L2_2.soundNative
      L9_2 = L9_2[2]
      L10_2 = L2_2.soundNative
      L10_2 = L10_2[3]
      L11_2 = L2_2.soundNative
      L11_2 = L11_2[4]
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L7_2 = SendNUIMessage
  L8_2 = {}
  L8_2.action = "openNotification"
  L8_2.data = L2_2
  L9_2 = {}
  L10_2 = A0_2.id
  L9_2.id = L10_2
  L10_2 = A0_2.position
  L9_2.position = L10_2
  L10_2 = A0_2.margin
  L9_2.margin = L10_2
  L8_2.settings = L9_2
  L7_2(L8_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNuiCallback
L4_1 = "previewTextUI"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = nil
  L2_2 = A0_2.size
  if L2_2 then
    L2_2 = tonumber
    L3_2 = A0_2.size
    L2_2 = L2_2(L3_2)
    if L2_2 > 1.0 then
      L1_2 = L2_2
    end
  end
  L2_2 = {}
  L3_2 = A0_2.style
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.TextUIPresets
    L4_2 = A0_2.style
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L3_2 = deepCopy
      L4_2 = Config
      L4_2 = L4_2.TextUIPresets
      L5_2 = A0_2.style
      L4_2 = L4_2[L5_2]
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
  end
  if L1_2 then
    L3_2 = L2_2.customCSS
    if not L3_2 then
      L3_2 = {}
      L2_2.customCSS = L3_2
    end
    L3_2 = L2_2.customCSS
    L3_2 = L3_2.background
    if not L3_2 then
      L3_2 = L2_2.customCSS
      L4_2 = {}
      L3_2.background = L4_2
    end
    L3_2 = L2_2.customCSS
    L3_2 = L3_2.background
    L3_2.scale = L1_2
  end
  L3_2 = Config
  L3_2 = L3_2.CustomizationMenuPreview
  L3_2 = L3_2.textui
  L3_2 = L3_2.message
  L2_2.message = L3_2
  L3_2 = A0_2.sound
  if L3_2 then
    L3_2 = A0_2.sound
    L2_2.soundFile = L3_2
  end
  L3_2 = A0_2.soundVolume
  if L3_2 then
    L3_2 = A0_2.soundVolume
    L2_2.soundVolume = L3_2
  end
  L3_2 = L2_2.soundNative
  if L3_2 then
    L3_2 = L2_2.soundNative
    L3_2 = L3_2[1]
    if L3_2 then
      L2_2.soundFile = nil
      L3_2 = PlaySoundFrontend
      L4_2 = L2_2.soundNative
      L4_2 = L4_2[1]
      L5_2 = L2_2.soundNative
      L5_2 = L5_2[2]
      L6_2 = L2_2.soundNative
      L6_2 = L6_2[3]
      L7_2 = L2_2.soundNative
      L7_2 = L7_2[4]
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "showTextUI"
  L4_2.data = L2_2
  L5_2 = {}
  L6_2 = A0_2.position
  L5_2.position = L6_2
  L6_2 = A0_2.marginHorizontal
  L5_2.marginHorizontal = L6_2
  L6_2 = A0_2.marginVertical
  L5_2.marginVertical = L6_2
  L4_2.settings = L5_2
  L3_2(L4_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNuiCallback
L4_1 = "updatedCache"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if not L6_2 or "null" == L6_2 or "EMPTY_VALUE" == L6_2 then
      L7_2 = NOTIFY_CACHE
      L7_2[L5_2] = nil
    else
      L7_2 = NOTIFY_CACHE
      L7_2[L5_2] = L6_2
    end
  end
end
L3_1(L4_1, L5_1)

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = {}
  function L6_2()
    local L0_3, L1_3, L2_3
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["notification.style"]
    if L0_3 then
      L0_3 = Config
      L0_3 = L0_3.NotificationsPresets
      L1_3 = NOTIFY_CACHE
      L1_3 = L1_3["notification.style"]
      L0_3 = L0_3[L1_3]
      if L0_3 then
        L0_3 = deepCopy
        L1_3 = Config
        L1_3 = L1_3.NotificationsPresets
        L2_3 = NOTIFY_CACHE
        L2_3 = L2_3["notification.style"]
        L1_3 = L1_3[L2_3]
        L0_3 = L0_3(L1_3)
        L5_2 = L0_3
      end
    end
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["notification.size"]
    if L0_3 then
      L0_3 = L5_2.customCSS
      if not L0_3 then
        L0_3 = {}
        L5_2.customCSS = L0_3
      end
      L0_3 = L5_2.customCSS
      L0_3 = L0_3.background
      if not L0_3 then
        L0_3 = L5_2.customCSS
        L1_3 = {}
        L0_3.background = L1_3
      end
      L0_3 = nil
      L1_3 = NOTIFY_CACHE
      L1_3 = L1_3["notification.size"]
      if L1_3 then
        L1_3 = tonumber
        L2_3 = NOTIFY_CACHE
        L2_3 = L2_3["notification.size"]
        L1_3 = L1_3(L2_3)
        if L1_3 > 1.0 then
          L0_3 = L1_3
          L2_3 = L5_2.customCSS
          L2_3 = L2_3.background
          L2_3.scale = L0_3
        end
      end
    end
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["notification.sound"]
    L5_2.soundFile = L0_3
    L0_3 = NOTIFY_CACHE
    L0_3 = L0_3["notification.sound_volume"]
    L5_2.soundVolume = L0_3
  end
  L7_2 = Config
  L7_2 = L7_2.PlayerSettingsPriority
  if not L7_2 then
    L7_2 = L6_2
    L7_2()
  end
  if A0_2 then
    L7_2 = type
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    if "table" ~= L7_2 then
      L5_2.title = A0_2
      L5_2.description = A1_2
      L5_2.time = A2_2
      L5_2.color = A3_2
      L5_2.icon = A4_2
    else
      L7_2 = type
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      if "table" == L7_2 then
        L7_2 = A0_2.preset
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.NotificationsPresets
          L8_2 = A0_2.preset
          L7_2 = L7_2[L8_2]
          if L7_2 then
            L7_2 = deepCopy
            L8_2 = Config
            L8_2 = L8_2.NotificationsPresets
            L9_2 = A0_2.preset
            L8_2 = L8_2[L9_2]
            L7_2 = L7_2(L8_2)
            L5_2 = L7_2
            L7_2 = pairs
            L8_2 = A0_2
            L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
            for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
              L5_2[L11_2] = L12_2
            end
          end
        else
          L7_2 = pairs
          L8_2 = A0_2
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
            L5_2[L11_2] = L12_2
          end
        end
      end
    end
  end
  L7_2 = Config
  L7_2 = L7_2.PlayerSettingsPriority
  if L7_2 then
    L7_2 = L6_2
    L7_2()
  end
  L7_2 = L5_2.soundNative
  if L7_2 then
    L7_2 = L5_2.soundNative
    L7_2 = L7_2[1]
    if L7_2 then
      L5_2.soundFile = nil
      L7_2 = PlaySoundFrontend
      L8_2 = L5_2.soundNative
      L8_2 = L8_2[1]
      L9_2 = L5_2.soundNative
      L9_2 = L9_2[2]
      L10_2 = L5_2.soundNative
      L10_2 = L10_2[3]
      L11_2 = L5_2.soundNative
      L11_2 = L11_2[4]
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L7_2 = SendNUIMessage
  L8_2 = {}
  L8_2.action = "openNotification"
  L8_2.data = L5_2
  L7_2(L8_2)
end
L1_1 = exports
L2_1 = "Notification"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "vms_notifyv2:Notification"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = {}
L2_1 = {}
L3_1 = "vms_notify"
L4_1 = "Notification"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2
  L5_2 = L0_1
  L6_2 = {}
  L6_2.title = A0_2
  L6_2.description = A1_2
  L6_2.time = A2_2
  L6_2.color = A3_2
  L6_2.icon = A4_2
  return L5_2(L6_2)
end
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L3_1 = {}
L4_1 = "esx_notify"
L5_1 = "Notify"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L0_1
  L4_2 = {}
  L4_2.description = A2_2
  L4_2.time = A1_2
  L4_2.preset = A0_2
  return L3_2(L4_2)
end
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L4_1 = {}
L5_1 = "mythic_notify"
L6_1 = "DoShortHudText"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L3_2 = {}
  L3_2.description = A1_2
  L3_2.time = 1000
  L3_2.preset = A0_2
  return L2_2(L3_2)
end
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L5_1 = {}
L6_1 = "mythic_notify"
L7_1 = "DoHudText"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L3_2 = {}
  L3_2.description = A1_2
  L3_2.time = 2500
  L3_2.preset = A0_2
  return L2_2(L3_2)
end
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L6_1 = {}
L7_1 = "mythic_notify"
L8_1 = "DoLongHudText"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L3_2 = {}
  L3_2.description = A1_2
  L3_2.time = 5000
  L3_2.preset = A0_2
  return L2_2(L3_2)
end
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L7_1 = {}
L8_1 = "mythic_notify"
L9_1 = "DoCustomHudText"
function L10_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L0_1
  L4_2 = {}
  L4_2.description = A1_2
  L4_2.time = A2_2
  L4_2.preset = A0_2
  return L3_2(L4_2)
end
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L8_1 = {}
L9_1 = "okokNotify"
L10_1 = "Alert"
function L11_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L9_1 = {}
L10_1 = "brutal_notify"
L11_1 = "SendAlert"
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L9_1[1] = L10_1
L9_1[2] = L11_1
L9_1[3] = L12_1
L10_1 = {}
L11_1 = "origen_notify"
L12_1 = "ShowNotification"
function L13_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L2_2 = {}
  L2_2.description = A0_2
  return L1_2(L2_2)
end
L10_1[1] = L11_1
L10_1[2] = L12_1
L10_1[3] = L13_1
L11_1 = {}
L12_1 = "wasabi_notify"
L13_1 = "notify"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2
  L7_2 = L0_1
  L8_2 = {}
  L8_2.title = A0_2
  L8_2.description = A1_2
  L8_2.time = A2_2
  L8_2.preset = A3_2
  L8_2.icon = A5_2
  return L7_2(L8_2)
end
L11_1[1] = L12_1
L11_1[2] = L13_1
L11_1[3] = L14_1
L12_1 = {}
L13_1 = "cm-notification"
L14_1 = "Alert"
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L12_1[1] = L13_1
L12_1[2] = L14_1
L12_1[3] = L15_1
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L2_1 = pairs
L3_1 = L1_1
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
for L6_1, L7_1 in L2_1, L3_1, L4_1, L5_1 do
  L8_1 = AddEventHandler
  L9_1 = "__cfx_export_%s_%s"
  L10_1 = L9_1
  L9_1 = L9_1.format
  L11_1 = L7_1[1]
  L12_1 = L7_1[2]
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  function L10_1(A0_2)
    local L1_2, L2_2
    L1_2 = A0_2
    L2_2 = L7_1
    L2_2 = L2_2[3]
    L1_2(L2_2)
  end
  L8_1(L9_1, L10_1)
end
L2_1 = {}
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2
  L5_2 = L0_1
  L6_2 = {}
  L6_2.title = A0_2
  L6_2.description = A1_2
  L6_2.time = A2_2
  L6_2.color = A3_2
  L6_2.icon = A4_2
  return L5_2(L6_2)
end
L2_1["vms_notify:Notification"] = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    return
  end
  L1_2 = L0_1
  L2_2 = {}
  L3_2 = A0_2.text
  L2_2.description = L3_2
  L3_2 = A0_2.length
  L2_2.time = L3_2
  L3_2 = A0_2.type
  L2_2.preset = L3_2
  return L1_2(L2_2)
end
L2_1["mythic_notify:client:SendAlert"] = L3_1
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L2_1["okokNotify:Alert"] = L3_1
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L2_1["brutal_notify:SendAlert"] = L3_1
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2
  L7_2 = L0_1
  L8_2 = {}
  L8_2.title = A0_2
  L8_2.description = A1_2
  L8_2.time = A2_2
  L8_2.preset = A3_2
  L8_2.icon = A5_2
  return L7_2(L8_2)
end
L2_1["wasabi_notify:notify"] = L3_1
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = L0_1
  L5_2 = {}
  L5_2.title = A0_2
  L5_2.description = A1_2
  L5_2.time = A2_2
  L5_2.preset = A3_2
  return L4_2(L5_2)
end
L2_1["cm-notification:Alert"] = L3_1
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
for L7_1, L8_1 in L3_1, L4_1, L5_1, L6_1 do
  L9_1 = RegisterNetEvent
  L10_1 = L7_1
  L9_1(L10_1)
  L9_1 = AddEventHandler
  L10_1 = L7_1
  L11_1 = L8_1
  L9_1(L10_1, L11_1)
end

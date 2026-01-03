local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L2_2 = {}
    L3_2 = pairs
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L0_1
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L2_2[L7_2] = L9_2
    end
    return L2_2
  elseif "function" == L1_2 then
    L2_2 = tostring
    L3_2 = A0_2
    return L2_2(L3_2)
  elseif "userdata" == L1_2 then
    L2_2 = tostring
    L3_2 = A0_2
    return L2_2(L3_2)
  else
    return A0_2
  end
end
function L1_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Config
  L0_2 = L0_2.DebugMode
  if not L0_2 then
    return
  end
  L0_2 = {}
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = ...
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = type
    L6_2 = L0_2[L4_2]
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      L6_2 = L0_1
      L7_2 = L0_2[L4_2]
      L6_2 = L6_2(L7_2)
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = L6_2
      L9_2 = {}
      L9_2.indent = true
      L7_2 = L7_2(L8_2, L9_2)
      L0_2[L4_2] = L7_2
    elseif "vector3" == L5_2 or "vector4" == L5_2 then
      L6_2 = tostring
      L7_2 = L0_2[L4_2]
      L6_2 = L6_2(L7_2)
      L0_2[L4_2] = L6_2
    else
      L6_2 = tostring
      L7_2 = L0_2[L4_2]
      L6_2 = L6_2(L7_2)
      L0_2[L4_2] = L6_2
    end
  end
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L2_2 = "[%s]"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = print
  L4_2 = L2_2
  L5_2 = table
  L5_2 = L5_2.unpack
  L6_2 = L0_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = math
  L1_2 = L1_2.rad
  L2_2 = A0_2.z
  L1_2 = L1_2(L2_2)
  L2_2 = math
  L2_2 = L2_2.rad
  L3_2 = A0_2.x
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = math
  L4_2 = L4_2.sin
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L4_2 = -L4_2
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = math
  L6_2 = L6_2.cos
  L7_2 = L2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2 * L5_2
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = math
  L6_2 = L6_2.abs
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = L2_2
  L7_2, L8_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2)
  L5_2 = L5_2 * L6_2
  L6_2 = math
  L6_2 = L6_2.sin
  L7_2 = L2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  return L3_2
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = GetGameplayCamRot
  L1_2 = L1_2()
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = GetFollowPedCamViewMode
  L3_2 = L3_2()
  L4_2 = nil
  if 4 == L3_2 then
    L5_2 = GetGameplayCamCoord
    L5_2 = L5_2()
    L4_2 = L5_2
  else
    L5_2 = GetEntityCoords
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L6_2 = vector3
    L7_2 = L5_2.x
    L8_2 = L5_2.y
    L9_2 = L5_2.z
    L9_2 = L9_2 + 1.2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
  end
  L5_2 = L2_1
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = {}
  L7_2 = L4_2.x
  L8_2 = L5_2.x
  L8_2 = L8_2 * A0_2
  L7_2 = L7_2 + L8_2
  L6_2.x = L7_2
  L7_2 = L4_2.y
  L8_2 = L5_2.y
  L8_2 = L8_2 * A0_2
  L7_2 = L7_2 + L8_2
  L6_2.y = L7_2
  L7_2 = L4_2.z
  L8_2 = L5_2.z
  L8_2 = L8_2 * A0_2
  L7_2 = L7_2 + L8_2
  L6_2.z = L7_2
  L7_2 = StartShapeTestSweptSphere
  L8_2 = L4_2.x
  L9_2 = L4_2.y
  L10_2 = L4_2.z
  L11_2 = L6_2.x
  L12_2 = L6_2.y
  L13_2 = L6_2.z
  L14_2 = 0.2
  L15_2 = 339
  L16_2 = L2_2
  L17_2 = 4
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L8_2 = GetShapeTestResult
  L9_2 = L7_2
  L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
  L13_2 = L9_2
  L14_2 = L10_2
  L15_2 = L12_2
  return L13_2, L14_2, L15_2
end
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = #A0_2
  if 0 == L1_2 then
    return A0_2
  end
  L2_2 = A0_2 / L1_2
  return L2_2
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = math
  L1_2 = L1_2.deg
  L2_2 = math
  L2_2 = L2_2.asin
  L3_2 = A0_2.z
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L2_2 = math
  L2_2 = L2_2.deg
  L3_2 = math
  L3_2 = L3_2.atan2
  L4_2 = A0_2.x
  L5_2 = A0_2.y
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = vector3
  L4_2 = L1_2
  L5_2 = 0.0
  L6_2 = L2_2
  return L3_2(L4_2, L5_2, L6_2)
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = HasAnimDictLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = RequestAnimDict
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 10000
  while true do
    L2_2 = HasAnimDictLoaded
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    if not (L1_2 > L2_2) then
      break
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
  L2_2 = HasAnimDictLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = error
    L3_2 = "Failed to load anim dict \"%s\""
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = HasAnimDictLoaded
  L3_2 = A0_2
  return L2_2(L3_2)
end
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "number" ~= L1_2 or not A0_2 then
    L1_2 = joaat
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    A0_2 = L1_2
  end
  L1_2 = HasModelLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    return A0_2
  end
  L1_2 = RequestModel
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 10000
  while true do
    L2_2 = HasModelLoaded
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    if not (L1_2 > L2_2) then
      break
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
  L2_2 = HasModelLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = error
    L3_2 = "Failed to load model \"%s\""
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = HasModelLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = A0_2
  end
  return L2_2
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = HasNamedPtfxAssetLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = RequestNamedPtfxAsset
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 10000
  while true do
    L2_2 = HasNamedPtfxAssetLoaded
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    if not (L1_2 > L2_2) then
      break
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
  L2_2 = HasNamedPtfxAssetLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = error
    L3_2 = "Failed to load ptfx \"%s\""
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = HasNamedPtfxAssetLoaded
  L3_2 = A0_2
  return L2_2(L3_2)
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2
  while "k" do
    L2_2 = string
    L2_2 = L2_2.gsub
    L3_2 = L1_2
    L4_2 = "^(-?%d+)(%d%d%d)"
    L5_2 = "%1,%2"
    L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
    k = L3_2
    L1_2 = L2_2
    L2_2 = k
    if 0 == L2_2 then
      break
    end
  end
  return L1_2
end
function L10_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  if A1_2 then
    L5_2 = GetEntityCoords
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_11
    end
  end
  L5_2 = nil
  ::lbl_11::
  if A2_2 then
    L6_2 = GetEntityRotation
    L7_2 = A0_2
    L8_2 = 2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      goto lbl_20
    end
  end
  L6_2 = nil
  ::lbl_20::
  L7_2 = Citizen
  L7_2 = L7_2.CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L4_2
      L0_3 = L0_3 - L1_3
      L1_3 = math
      L1_3 = L1_3.min
      L2_3 = A3_2
      L2_3 = L0_3 / L2_3
      L3_3 = 1.0
      L1_3 = L1_3(L2_3, L3_3)
      L2_3 = A1_2
      if L2_3 then
        L2_3 = L5_2
        if L2_3 then
          L2_3 = vector3
          L3_3 = L5_2.x
          L4_3 = A1_2.x
          L5_3 = L5_2.x
          L4_3 = L4_3 - L5_3
          L4_3 = L4_3 * L1_3
          L3_3 = L3_3 + L4_3
          L4_3 = L5_2.y
          L5_3 = A1_2.y
          L6_3 = L5_2.y
          L5_3 = L5_3 - L6_3
          L5_3 = L5_3 * L1_3
          L4_3 = L4_3 + L5_3
          L5_3 = L5_2.z
          L6_3 = A1_2.z
          L7_3 = L5_2.z
          L6_3 = L6_3 - L7_3
          L6_3 = L6_3 * L1_3
          L5_3 = L5_3 + L6_3
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L3_3 = SetEntityCoords
          L4_3 = A0_2
          L5_3 = L2_3.x
          L6_3 = L2_3.y
          L7_3 = L2_3.z
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L11_3 = false
          L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
        end
      end
      L2_3 = A2_2
      if L2_3 then
        L2_3 = L6_2
        if L2_3 then
          L2_3 = vector3
          L3_3 = L6_2.x
          L4_3 = A2_2.x
          L5_3 = L6_2.x
          L4_3 = L4_3 - L5_3
          L4_3 = L4_3 * L1_3
          L3_3 = L3_3 + L4_3
          L4_3 = L6_2.y
          L5_3 = A2_2.y
          L6_3 = L6_2.y
          L5_3 = L5_3 - L6_3
          L5_3 = L5_3 * L1_3
          L4_3 = L4_3 + L5_3
          L5_3 = L6_2.z
          L6_3 = A2_2.z
          L7_3 = L6_2.z
          L6_3 = L6_3 - L7_3
          L6_3 = L6_3 * L1_3
          L5_3 = L5_3 + L6_3
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L3_3 = SetEntityRotation
          L4_3 = A0_2
          L5_3 = L2_3.x
          L6_3 = L2_3.y
          L7_3 = L2_3.z
          L8_3 = 2
          L9_3 = true
          L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
        end
      end
      if L1_3 >= 1.0 then
        break
      end
    end
  end
  L7_2(L8_2)
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = GetDisabledControlNormal
  L1_2 = 0
  L2_2 = 239
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = GetDisabledControlNormal
  L2_2 = 0
  L3_2 = 240
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetWorldCoordFromScreenCoord
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 and L3_2 then
    L4_2 = 1.0
    L5_2 = L3_2 * L4_2
    L5_2 = L2_2 + L5_2
    L6_2 = true
    L7_2 = L5_2
    return L6_2, L7_2
  else
    L4_2 = false
    L5_2 = nil
    return L4_2, L5_2
  end
end
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = nil
  L2_2 = nil
  L3_2 = DoesCamExist
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = GetCamCoord
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2
    L3_2 = GetCamRot
    L4_2 = A0_2
    L5_2 = 2
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
  else
    L3_2 = GetGameplayCamCoord
    L3_2 = L3_2()
    L1_2 = L3_2
    L3_2 = GetGameplayCamRot
    L4_2 = 2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  L3_2 = GetDisabledControlNormal
  L4_2 = 0
  L5_2 = 239
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = GetDisabledControlNormal
  L5_2 = 0
  L6_2 = 240
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = GetWorldCoordFromScreenCoord
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2)
  if L5_2 and L6_2 then
    L7_2 = L6_2 * 1000.0
    L7_2 = L5_2 + L7_2
    L8_2 = StartShapeTestRay
    L9_2 = L1_2.x
    L10_2 = L1_2.y
    L11_2 = L1_2.z
    L12_2 = L7_2.x
    L13_2 = L7_2.y
    L14_2 = L7_2.z
    L15_2 = 16
    L16_2 = PlayerPedId
    L16_2 = L16_2()
    L17_2 = 0
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L9_2 = GetShapeTestResult
    L10_2 = L8_2
    L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
    if L10_2 and L13_2 then
      L14_2 = DoesEntityExist
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 then
        return L13_2
      end
    end
  end
  L7_2 = nil
  return L7_2
end
function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = math
  L2_2 = L2_2.rad
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = math
  L3_2 = L3_2.cos
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = math
  L4_2 = L4_2.sin
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = vector3
  L6_2 = A0_2.x
  L6_2 = L6_2 * L3_2
  L7_2 = A0_2.y
  L7_2 = L7_2 * L4_2
  L6_2 = L6_2 - L7_2
  L7_2 = A0_2.x
  L7_2 = L7_2 * L4_2
  L8_2 = A0_2.y
  L8_2 = L8_2 * L3_2
  L7_2 = L7_2 + L8_2
  L8_2 = A0_2.z
  return L5_2(L6_2, L7_2, L8_2)
end
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A2_2 then
    A2_2 = 0.0
  end
  L3_2 = GetEntityMatrix
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  L7_2 = SetEntityMatrix
  L8_2 = A0_2
  L9_2 = L3_2 * A1_2
  L10_2 = L4_2 * A1_2
  L11_2 = L5_2 * A1_2
  L12_2 = vec3
  L13_2 = 0
  L14_2 = 0
  L15_2 = A2_2
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L12_2 = L6_2 - L12_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
function L15_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = CreateObject
  L5_2 = L7_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = A1_2.x
  L7_2 = A1_2.y
  L8_2 = A1_2.z
  L9_2 = true
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  if A2_2 then
    L5_2 = SetEntityRotation
    L6_2 = L4_2
    L7_2 = A2_2.x
    L8_2 = A2_2.y
    L9_2 = A2_2.z
    L10_2 = 2
    L11_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  end
  L5_2 = SetEntityCollision
  L6_2 = L4_2
  L7_2 = true
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  if A3_2 then
    L5_2 = SetEntityDynamic
    L6_2 = L4_2
    L7_2 = true
    L5_2(L6_2, L7_2)
    L5_2 = ActivatePhysics
    L6_2 = L4_2
    L5_2(L6_2)
  end
  return L4_2
end
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = CreateCam
  L3_2 = "DEFAULT_SCRIPTED_CAMERA"
  L4_2 = true
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = SetCamCoord
  L4_2 = L2_2
  L5_2 = A0_2.x
  L6_2 = A0_2.y
  L7_2 = A0_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetCamRot
  L4_2 = L2_2
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L8_2 = 2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = RenderScriptCams
  L4_2 = true
  L5_2 = false
  L6_2 = 0
  L7_2 = true
  L8_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  return L2_2
end
function L17_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if not A2_2 then
    A2_2 = 0.001
  end
  L3_2 = Citizen
  L3_2 = L3_2.CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    while true do
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 10
      L0_3(L1_3)
      L0_3 = GetEntityCoords
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      L1_3 = L0_3.z
      L2_3 = A1_2
      if L1_3 > L2_3 then
        L1_3 = SetEntityCoords
        L2_3 = A0_2
        L3_3 = L0_3.x
        L4_3 = L0_3.y
        L5_3 = L0_3.z
        L6_3 = A2_2
        L5_3 = L5_3 - L6_3
        L6_3 = false
        L7_3 = false
        L8_3 = false
        L9_3 = false
        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      else
        L1_3 = math
        L1_3 = L1_3.abs
        L2_3 = L0_3.z
        L3_3 = A1_2
        L2_3 = L2_3 - L3_3
        L1_3 = L1_3(L2_3)
        L2_3 = 0.1
        if L1_3 > L2_3 then
          L1_3 = SetEntityCoords
          L2_3 = A0_2
          L3_3 = L0_3.x
          L4_3 = L0_3.y
          L5_3 = A1_2
          L6_3 = false
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
          break
        else
          break
        end
      end
    end
  end
  L3_2(L4_2)
end
function L18_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = SetMouseCursorVisible
  L5_2 = true
  L4_2(L5_2)
  L4_2 = SetMouseCursorThisFrame
  L4_2()
  L4_2 = L12_1
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = type
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      if "table" == L5_2 then
        L5_2 = ipairs
        L6_2 = A0_2
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
          L11_2 = type
          L12_2 = L10_2
          L11_2 = L11_2(L12_2)
          if "table" == L11_2 then
            L11_2 = L10_2.object
            if L11_2 then
              L11_2 = L10_2.object
            end
          end
          if L11_2 == L4_2 or L10_2 == L4_2 then
            L11_2 = SetMouseCursorStyle
            L12_2 = A1_2
            L11_2(L12_2)
            return
          end
        end
      end
    end
  end
  L5_2 = SetMouseCursorStyle
  L6_2 = A2_2
  L5_2(L6_2)
end
function L19_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = GetDisabledControlNormal
  L1_2 = 0
  L2_2 = 239
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = GetDisabledControlNormal
  L2_2 = 0
  L3_2 = 240
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetWorldCoordFromScreenCoord
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = L3_2 * 8
  L4_2 = L2_2 + L4_2
  return L4_2
end
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = GetDisabledControlNormal
  L1_2 = 0
  L2_2 = 239
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = GetDisabledControlNormal
  L2_2 = 0
  L3_2 = 240
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetWorldCoordFromScreenCoord
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = L3_2 * 8
  L4_2 = L2_2 + L4_2
  L5_2 = StartShapeTestLosProbe
  L6_2 = L2_2.x
  L7_2 = L2_2.y
  L8_2 = L2_2.z
  L9_2 = L4_2.x
  L10_2 = L4_2.y
  L11_2 = L4_2.z
  L12_2 = 1
  L13_2 = PlayerPedId
  L13_2 = L13_2()
  L14_2 = 4
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  while true do
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    L6_2 = GetShapeTestResult
    L7_2 = L5_2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    if 1 ~= L6_2 then
      L10_2 = L8_2
      L11_2 = L9_2
      return L10_2, L11_2
    end
  end
end
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L4_2 = true
  L5_2 = 1.0
  L6_2 = true
  L7_2 = nil
  L8_2 = GetGameTimer
  L8_2 = L8_2()
  L9_2 = false
  L10_2 = nil
  L11_2 = pairs
  L12_2 = A0_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L7_1
    L18_2 = L16_2.model
    L17_2 = L17_2(L18_2)
    if not L17_2 then
      return
    end
  end
  L11_2 = {}
  L12_2 = PlayerPedId
  L12_2 = L12_2()
  L13_2 = GetEntityCoords
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  L14_2 = 10
  L15_2 = pairs
  L16_2 = A0_2
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
  for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
    L21_2 = CreateObjectNoOffset
    L22_2 = L20_2.model
    L23_2 = L13_2
    L24_2 = false
    L25_2 = true
    L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
    repeat
      L22_2 = Wait
      L23_2 = 0
      L22_2(L23_2)
      L22_2 = DoesEntityExist
      L23_2 = L21_2
      L22_2 = L22_2(L23_2)
    until L22_2
    L22_2 = SetEntityAlpha
    L23_2 = L21_2
    L24_2 = 102
    L25_2 = false
    L22_2(L23_2, L24_2, L25_2)
    L22_2 = SetEntityCollision
    L23_2 = L21_2
    L24_2 = false
    L25_2 = false
    L22_2(L23_2, L24_2, L25_2)
    L22_2 = L20_2.offset
    if not L22_2 then
      L22_2 = vec3
      L23_2 = 0.0
      L24_2 = 0.0
      L25_2 = 0.0
      L22_2 = L22_2(L23_2, L24_2, L25_2)
    end
    L23_2 = L13_1
    L24_2 = L22_2
    L25_2 = GetEntityHeading
    L26_2 = L11_2[1]
    if L26_2 then
      L26_2 = L26_2.obj
    end
    if not L26_2 then
      L26_2 = L12_2
    end
    L25_2, L26_2, L27_2, L28_2, L29_2 = L25_2(L26_2)
    L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L22_2 = L23_2
    L23_2 = SetEntityCoordsNoOffset
    L24_2 = L21_2
    L25_2 = L13_2 + L22_2
    L26_2 = false
    L23_2(L24_2, L25_2, L26_2)
    L23_2 = SetEntityRotation
    L24_2 = L21_2
    L25_2 = 0.0
    L26_2 = 0.0
    L27_2 = 0.0
    L28_2 = 2
    L29_2 = true
    L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L23_2 = #L11_2
    L23_2 = L23_2 + 1
    L24_2 = {}
    L24_2.obj = L21_2
    L24_2.offset = L22_2
    L11_2[L23_2] = L24_2
  end
  L15_2 = CreateThread
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    while true do
      L0_3 = L4_2
      if not L0_3 then
        break
      end
      L0_3 = L3_1
      L1_3 = L14_2
      L1_3 = L1_3 + 0.0
      L0_3, L1_3 = L0_3(L1_3)
      L2_3 = GetEntityCoords
      L3_3 = L12_2
      L2_3 = L2_3(L3_3)
      L13_2 = L2_3
      L2_3 = A2_2
      if L2_3 then
        L2_3 = nil
        L10_2 = L2_3
        L2_3 = pairs
        L3_3 = A2_2
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = L1_3.xy
          L9_3 = L7_3.coords
          L9_3 = L9_3.xy
          L8_3 = L8_3 - L9_3
          L8_3 = #L8_3
          L9_3 = 0.8
          if L8_3 < L9_3 then
            L8_3 = math
            L8_3 = L8_3.abs
            L9_3 = L1_3.z
            L10_3 = L7_3.coords
            L10_3 = L10_3.z
            L9_3 = L9_3 - L10_3
            L8_3 = L8_3(L9_3)
            L9_3 = 1.5
            if L8_3 < L9_3 then
              L1_3 = L7_3.coords
              L8_3 = L7_3.id
              L10_2 = L8_3
              break
            end
          end
        end
      end
      if L0_3 then
        L2_3 = vec3
        L3_3 = 0
        L4_3 = 0
        L5_3 = 0
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        if L1_3 ~= L2_3 then
          L2_3 = L13_2
          L2_3 = L1_3 - L2_3
          L2_3 = #L2_3
          if not (L2_3 >= 4.0) then
            L2_3 = A3_2
            if not L2_3 then
              goto lbl_92
            end
            L2_3 = A3_2
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            if L2_3 then
              goto lbl_92
            end
          end
        end
      end
      L2_3 = pairs
      L3_3 = L11_2
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = SetEntityDrawOutline
        L9_3 = L7_3.obj
        L10_3 = true
        L8_3(L9_3, L10_3)
        L8_3 = SetEntityDrawOutlineColor
        L9_3 = 255
        L10_3 = 0
        L11_3 = 0
        L12_3 = 255
        L8_3(L9_3, L10_3, L11_3, L12_3)
      end
      L2_3 = false
      L9_2 = L2_3
      goto lbl_111
      ::lbl_92::
      L2_3 = pairs
      L3_3 = L11_2
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = SetEntityDrawOutline
        L9_3 = L7_3.obj
        L10_3 = true
        L8_3(L9_3, L10_3)
        L8_3 = SetEntityDrawOutlineColor
        L9_3 = 0
        L10_3 = 255
        L11_3 = 0
        L12_3 = 255
        L8_3(L9_3, L10_3, L11_3, L12_3)
      end
      L2_3 = true
      L9_2 = L2_3
      ::lbl_111::
      L2_3 = L6_2
      if L2_3 then
        L2_3 = L7_2
        if L2_3 then
          L2_3 = L7_2
          L2_3 = L2_3 - L1_3
          L2_3 = #L2_3
          L3_3 = 0.06
          if not (L2_3 >= L3_3) then
            goto lbl_145
          end
        end
        L7_2 = L1_3
        L2_3 = pairs
        L3_3 = L11_2
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = L13_1
          L9_3 = L7_3.offset
          L10_3 = GetEntityHeading
          L11_3 = L11_2
          L11_3 = L11_3[1]
          L11_3 = L11_3.obj
          L10_3, L11_3, L12_3 = L10_3(L11_3)
          L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
          L9_3 = SetEntityCoordsNoOffset
          L10_3 = L7_3.obj
          L11_3 = L1_3 + L8_3
          L9_3(L10_3, L11_3)
        end
      end
      ::lbl_145::
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
    end
  end
  L15_2(L16_2)
  L15_2 = CreateThread
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L4_2
      if not L0_3 then
        break
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 194
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = false
        L4_2 = L0_3
        L0_3 = pairs
        L1_3 = L11_2
        L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
        for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
          L6_3 = DeleteObject
          L7_3 = L5_3.obj
          L6_3(L7_3)
        end
        L0_3 = A1_2
        L0_3()
      else
        L0_3 = IsDisabledControlJustPressed
        L1_3 = 0
        L2_3 = 38
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = L9_2
          if L0_3 then
            L0_3 = GetEntityCoords
            L1_3 = L11_2
            L1_3 = L1_3[1]
            L1_3 = L1_3.obj
            L0_3 = L0_3(L1_3)
            L1_3 = L11_2
            L1_3 = L1_3[1]
            L1_3 = L1_3.offset
            L0_3 = L0_3 - L1_3
            L1_3 = GetEntityRotation
            L2_3 = L11_2
            L2_3 = L2_3[1]
            L2_3 = L2_3.obj
            L1_3 = L1_3(L2_3)
            L2_3 = false
            L4_2 = L2_3
            L2_3 = pairs
            L3_3 = L11_2
            L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
            for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
              L8_3 = DeleteObject
              L9_3 = L7_3.obj
              L8_3(L9_3)
            end
            L2_3 = A1_2
            L3_3 = L0_3
            L4_3 = L1_3
            L5_3 = L10_2
            L2_3(L3_3, L4_3, L5_3)
        end
        else
          L0_3 = IsDisabledControlJustPressed
          L1_3 = 0
          L2_3 = 49
          L0_3 = L0_3(L1_3, L2_3)
          if L0_3 then
            L0_3 = L6_2
            L0_3 = not L0_3
            L6_2 = L0_3
          else
            L0_3 = IsDisabledControlPressed
            L1_3 = 0
            L2_3 = 44
            L0_3 = L0_3(L1_3, L2_3)
            if L0_3 then
              L0_3 = GetGameTimer
              L0_3 = L0_3()
              L1_3 = L8_2
              L1_3 = L1_3 + 130
              if L0_3 >= L1_3 then
                L0_3 = GetGameTimer
                L0_3 = L0_3()
                L8_2 = L0_3
                L0_3 = math
                L0_3 = L0_3.max
                L1_3 = L5_2
                L1_3 = L1_3 - 0.1
                L2_3 = 0.2
                L0_3 = L0_3(L1_3, L2_3)
                L5_2 = L0_3
            end
            else
              L0_3 = IsDisabledControlPressed
              L1_3 = 0
              L2_3 = 45
              L0_3 = L0_3(L1_3, L2_3)
              if L0_3 then
                L0_3 = GetGameTimer
                L0_3 = L0_3()
                L1_3 = L8_2
                L1_3 = L1_3 + 130
                if L0_3 >= L1_3 then
                  L0_3 = GetGameTimer
                  L0_3 = L0_3()
                  L8_2 = L0_3
                  L0_3 = math
                  L0_3 = L0_3.min
                  L1_3 = L5_2
                  L1_3 = L1_3 + 0.1
                  L2_3 = 3.0
                  L0_3 = L0_3(L1_3, L2_3)
                  L5_2 = L0_3
              end
              else
                L0_3 = IsControlJustPressed
                L1_3 = 0
                L2_3 = 14
                L0_3 = L0_3(L1_3, L2_3)
                if L0_3 then
                  L0_3 = pairs
                  L1_3 = L11_2
                  L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
                  for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
                    L6_3 = GetEntityRotation
                    L7_3 = L5_3.obj
                    L6_3 = L6_3(L7_3)
                    L7_3 = vec3
                    L8_3 = 0.0
                    L9_3 = 0.0
                    L10_3 = L5_2
                    L10_3 = 5.0 * L10_3
                    L7_3 = L7_3(L8_3, L9_3, L10_3)
                    L6_3 = L6_3 - L7_3
                    L7_3 = SetEntityRotation
                    L8_3 = L5_3.obj
                    L9_3 = L6_3
                    L7_3(L8_3, L9_3)
                  end
                else
                  L0_3 = IsControlJustPressed
                  L1_3 = 0
                  L2_3 = 15
                  L0_3 = L0_3(L1_3, L2_3)
                  if L0_3 then
                    L0_3 = pairs
                    L1_3 = L11_2
                    L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
                    for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
                      L6_3 = GetEntityRotation
                      L7_3 = L5_3.obj
                      L6_3 = L6_3(L7_3)
                      L7_3 = vec3
                      L8_3 = 0.0
                      L9_3 = 0.0
                      L10_3 = L5_2
                      L10_3 = 5.0 * L10_3
                      L7_3 = L7_3(L8_3, L9_3, L10_3)
                      L6_3 = L6_3 + L7_3
                      L7_3 = SetEntityRotation
                      L8_3 = L5_3.obj
                      L9_3 = L6_3
                      L7_3(L8_3, L9_3)
                    end
                  end
                end
              end
            end
          end
        end
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L15_2(L16_2)
end
function L22_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L3_2 = 255
  while true do
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L4_2 = L4_2 - L2_2
    L5_2 = math
    L5_2 = L5_2.min
    L6_2 = L4_2 / A1_2
    L7_2 = 1.0
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = 1
    L7_2 = L7_2 - L5_2
    L7_2 = L3_2 * L7_2
    L6_2 = L6_2(L7_2)
    L7_2 = SetEntityAlpha
    L8_2 = A0_2
    L9_2 = L6_2
    L10_2 = false
    L7_2(L8_2, L9_2, L10_2)
    if L5_2 >= 1.0 then
      break
    end
  end
end
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Config
  L1_2 = L1_2.DisabledAreas
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.coords
    L8_2 = A0_2 - L8_2
    L8_2 = #L8_2
    L9_2 = L7_2.radius
    if L8_2 < L9_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
L24_1 = IsDuplicityVersion
L24_1 = L24_1()
if not L24_1 then
  L24_1 = false
  L25_1 = false
  L26_1 = true
  function L27_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2
    L2_2 = SetNuiFocus
    L3_2 = A0_2
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "setVisible"
    L4_2 = {}
    L4_2.visible = A0_2
    L4_2.page = A1_2
    L3_2.data = L4_2
    L2_2(L3_2)
  end
  function L28_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2
    L1_2 = L25_1
    if L1_2 then
      return
    end
    L1_2 = L24_1
    if not L1_2 then
      L1_2 = true
      L24_1 = L1_2
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.action = "init"
      L3_2 = {}
      L4_2 = Config
      L3_2.config = L4_2
      L4_2 = Locales
      L5_2 = Config
      L5_2 = L5_2.Locale
      L4_2 = L4_2[L5_2]
      L3_2.locales = L4_2
      L2_2.data = L3_2
      L1_2(L2_2)
    end
    L1_2 = true
    L25_1 = L1_2
    L1_2 = L27_1
    L2_2 = true
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  function L29_1()
    local L0_2, L1_2
    L0_2 = L25_1
    if not L0_2 then
      return
    end
    L0_2 = false
    L25_1 = L0_2
    L0_2 = L27_1
    L1_2 = false
    L0_2(L1_2)
  end
  function L30_1()
    local L0_2, L1_2
    L0_2 = L26_1
    if L0_2 then
      L0_2 = L25_1
      L0_2 = not L0_2
    end
    return L0_2
  end
  function L31_1(A0_2)
    local L1_2
    L26_1 = A0_2
  end
  L32_1 = RegisterNUICallback
  L33_1 = "hideUI"
  function L34_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = L29_1
    L2_2()
    L2_2 = Shop
    L2_2 = L2_2.EndShopping
    L2_2()
    L2_2 = Selling
    L2_2 = L2_2.EndSelling
    L2_2()
    L2_2 = Plants
    L2_2 = L2_2.EndPlantInteraction
    L2_2()
    L2_2 = Mixer
    L2_2 = L2_2.CleanupMixing
    L2_2()
    L2_2 = A1_2
    L3_2 = 1
    L2_2(L3_2)
  end
  L32_1(L33_1, L34_1)
  L32_1 = RegisterCommand
  L33_1 = "openUI"
  L34_1 = L28_1
  L35_1 = false
  L32_1(L33_1, L34_1, L35_1)
  L32_1 = {}
  L32_1.RayCastGamePlayCamera = L3_1
  L32_1.Normalize = L4_1
  L32_1.GetRotationFromDirection = L5_1
  L32_1.LoadDict = L6_1
  L32_1.LoadModel = L7_1
  L32_1.loadModel = L7_1
  L32_1.LoadPtfx = L8_1
  L32_1.GroupDigits = L9_1
  L32_1.LerpEntity = L10_1
  L32_1.RotationToDirection = L2_1
  L32_1.GetMouseWorldPosition = L11_1
  L32_1.GetEntityAtCursor = L12_1
  L32_1.RotateVector = L13_1
  L32_1.SetEntityScale = L14_1
  L32_1.CreateObjectWithPhysics = L15_1
  L32_1.SetupCustomCamera = L16_1
  L32_1.ApplyGravityToEntity = L17_1
  L32_1.UpdateMouseCursor = L18_1
  L32_1.StartPlacingObject = L21_1
  L32_1.OpenUI = L28_1
  L32_1.CloseUI = L29_1
  L32_1.CanInteract = L30_1
  L32_1.SetCanInteract = L31_1
  L32_1.FadeOutEntity = L22_1
  L32_1.IsInDisabledArea = L23_1
  L32_1.Debug = L1_1
  Utils = L32_1
else
  function L24_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
    L2_2 = {}
    L3_2 = A0_2
    L4_2 = A1_2
    L3_2 = L3_2 .. L4_2
    L4_2 = L3_2
    L3_2 = L3_2.gmatch
    L5_2 = "(.-)"
    L6_2 = A1_2
    L5_2 = L5_2 .. L6_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
    for L7_2 in L3_2, L4_2, L5_2, L6_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L2_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
    return L2_2
  end
  function L25_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    L1_2 = GetPlayerIdentifiers
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = {}
    L2_2.id = A0_2
    L3_2 = GetPlayerName
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2.name = L3_2
    L3_2 = GetIdentifier
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2.serverIdentifier = L3_2
    L3_2 = GetEntityCoords
    L4_2 = GetPlayerPed
    L5_2 = A0_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L2_2.coords = L3_2
    L3_2 = pairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L24_1
      L10_2 = L8_2
      L11_2 = ":"
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = L9_2[1]
      L11_2 = L9_2[2]
      L2_2[L10_2] = L11_2
    end
    L3_2 = json
    L3_2 = L3_2.encode
    L4_2 = L2_2
    L5_2 = {}
    L5_2.indent = true
    return L3_2(L4_2, L5_2)
  end
  L26_1 = {}
  L26_1.GroupDigits = L9_1
  L26_1.GetIdentifiers = L25_1
  L26_1.Debug = L1_1
  Utils = L26_1
end

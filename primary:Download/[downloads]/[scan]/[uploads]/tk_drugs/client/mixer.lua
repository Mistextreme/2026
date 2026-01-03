local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = false
L4_1 = {}
L5_1 = nil
L6_1 = nil
L7_1 = {}
L8_1 = nil
L9_1 = nil
L10_1 = false
L11_1 = 0
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Utils
  L1_2 = L1_2.RotateVector
  L2_2 = vector3
  L3_2 = 0.0
  L4_2 = -1.0
  L5_2 = 1.2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L9_1
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = A0_2 + L1_2
  L2_2 = CreateCam
  L3_2 = "DEFAULT_SCRIPTED_CAMERA"
  L4_2 = true
  L2_2 = L2_2(L3_2, L4_2)
  L2_1 = L2_2
  L2_2 = SetCamCoord
  L3_2 = L2_1
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = vector3
  L3_2 = 0.0
  L4_2 = 0.0
  L5_2 = 0.0
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L2_2 = A0_2 + L2_2
  L3_2 = PointCamAtCoord
  L4_2 = L2_1
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetCamUseShallowDofMode
  L4_2 = L2_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetCamNearDof
  L4_2 = L2_1
  L5_2 = 0.3
  L3_2(L4_2, L5_2)
  L3_2 = SetCamFarDof
  L4_2 = L2_1
  L5_2 = 2.0
  L3_2(L4_2, L5_2)
  L3_2 = SetCamDofStrength
  L4_2 = L2_1
  L5_2 = 0.8
  L3_2(L4_2, L5_2)
  L3_2 = RenderScriptCams
  L4_2 = true
  L5_2 = true
  L6_2 = 500
  L7_2 = true
  L8_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3
    while true do
      L0_3 = L2_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = SetLocalPlayerInvisibleLocally
      L1_3 = true
      L0_3(L1_3)
    end
  end
  L3_2(L4_2)
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = true
    L3_2 = 500
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L2_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L2_1 = L0_2
  end
  L0_2 = SetLocalPlayerVisibleLocally
  L1_2 = true
  L0_2(L1_2)
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L0_2 = Utils
  L0_2 = L0_2.SetCanInteract
  L1_2 = true
  L0_2(L1_2)
  L0_2 = pairs
  L1_2 = L4_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DoesEntityExist
    L7_2 = L5_2.object
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = DeleteEntity
      L7_2 = L5_2.object
      L6_2(L7_2)
    end
  end
  L0_2 = {}
  L4_1 = L0_2
  L0_2 = {}
  L7_1 = L0_2
  L0_2 = nil
  L5_1 = L0_2
  L0_2 = false
  L3_1 = L0_2
  L0_2 = nil
  L0_1 = L0_2
  L0_2 = nil
  L1_1 = L0_2
  L0_2 = Utils
  L0_2 = L0_2.CloseUI
  L0_2()
end
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = L3_1
  if L4_2 then
    return
  end
  L4_2 = true
  L3_1 = L4_2
  L0_1 = A0_2
  L1_1 = A3_2
  L8_1 = A1_2
  L9_1 = A2_2
  L4_2 = false
  L10_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L11_1 = L4_2
  L4_2 = Utils
  L4_2 = L4_2.SetCanInteract
  L5_2 = false
  L4_2(L5_2)
  L4_2 = TaskTurnPedToFaceCoord
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  L6_2 = A1_2.x
  L7_2 = A1_2.y
  L8_2 = A1_2.z
  L9_2 = 500
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = Wait
  L5_2 = 500
  L4_2(L5_2)
  L4_2 = Utils
  L4_2 = L4_2.LoadDict
  L5_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L4_2(L5_2)
  L4_2 = TaskPlayAnim
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  L6_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L7_2 = "machinic_loop_mechandplayer"
  L8_2 = 8.0
  L9_2 = -8.0
  L10_2 = -1
  L11_2 = 17
  L12_2 = 0
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L4_2 = L12_1
  L5_2 = A1_2
  L4_2(L5_2)
  L4_2 = SetLocalPlayerInvisibleLocally
  L5_2 = true
  L4_2(L5_2)
  L4_2 = Utils
  L4_2 = L4_2.OpenUI
  L5_2 = "mixer"
  L4_2(L5_2)
end
OpenMixer = L14_1
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Config
  L1_2 = L1_2.EquipmentItems
  L2_2 = L1_1
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L2_2 = L1_2.recipes
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = pairs
  L3_2 = L1_2.recipes
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = pairs
    L9_2 = L7_2.need
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2.name
      if L14_2 == A0_2 then
        return L13_2
      end
    end
  end
  L2_2 = nil
  return L2_2
end
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L1_2 = 0.3
  L2_2 = {}
  L4_1 = L2_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L8_2 % 2
    if 1 == L10_2 then
      L10_2 = table
      L10_2 = L10_2.insert
      L11_2 = L2_2
      L12_2 = L9_2
      L10_2(L11_2, L12_2)
    else
      L10_2 = table
      L10_2 = L10_2.insert
      L11_2 = L3_2
      L12_2 = L9_2
      L10_2(L11_2, L12_2)
    end
  end
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L14_1
    L11_2 = L9_2.name
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L11_2 = L10_2.model
      if L11_2 then
        L11_2 = -0.7
        L12_2 = 0.3
        L13_2 = L8_1
        L14_2 = Utils
        L14_2 = L14_2.RotateVector
        L15_2 = vector3
        L16_2 = L11_2
        L17_2 = L8_2 - 1
        L17_2 = L17_2 * L12_2
        L18_2 = 0.0
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L16_2 = L9_1
        L14_2 = L14_2(L15_2, L16_2)
        L13_2 = L13_2 + L14_2
        L14_2 = Utils
        L14_2 = L14_2.CreateObjectWithPhysics
        L15_2 = L10_2.model
        L16_2 = L13_2
        L17_2 = nil
        L18_2 = false
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L4_1
        L17_2 = {}
        L18_2 = L9_2.name
        L17_2.name = L18_2
        L18_2 = L9_2.amount
        L17_2.amount = L18_2
        L17_2.object = L14_2
        L15_2(L16_2, L17_2)
        L15_2 = Config
        L15_2 = L15_2.EquipmentItems
        L16_2 = L1_1
        L15_2 = L15_2[L16_2]
        L15_2 = L15_2.objects
        L15_2 = L15_2[1]
        L15_2 = L15_2.model
        L16_2 = GetClosestObjectOfType
        L17_2 = L8_1
        L18_2 = 2.0
        L19_2 = L15_2
        L20_2 = false
        L21_2 = false
        L22_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L17_2 = SetEntityNoCollisionEntity
        L18_2 = L14_2
        L19_2 = L16_2
        L20_2 = false
        L17_2(L18_2, L19_2, L20_2)
        L17_2 = SetEntityNoCollisionEntity
        L18_2 = L16_2
        L19_2 = L14_2
        L20_2 = false
        L17_2(L18_2, L19_2, L20_2)
      end
    end
  end
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L14_1
    L11_2 = L9_2.name
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L11_2 = L10_2.model
      if L11_2 then
        L11_2 = 0.7
        L12_2 = 0.3
        L13_2 = L8_1
        L14_2 = Utils
        L14_2 = L14_2.RotateVector
        L15_2 = vector3
        L16_2 = L11_2
        L17_2 = L8_2 - 1
        L17_2 = L17_2 * L12_2
        L18_2 = 0.0
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L16_2 = L9_1
        L14_2 = L14_2(L15_2, L16_2)
        L13_2 = L13_2 + L14_2
        L14_2 = Utils
        L14_2 = L14_2.CreateObjectWithPhysics
        L15_2 = L10_2.model
        L16_2 = L13_2
        L17_2 = nil
        L18_2 = false
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L4_1
        L17_2 = {}
        L18_2 = L9_2.name
        L17_2.name = L18_2
        L18_2 = L9_2.amount
        L17_2.amount = L18_2
        L17_2.object = L14_2
        L15_2(L16_2, L17_2)
        L15_2 = Config
        L15_2 = L15_2.EquipmentItems
        L16_2 = L1_1
        L15_2 = L15_2[L16_2]
        L15_2 = L15_2.objects
        L15_2 = L15_2[1]
        L15_2 = L15_2.model
        L16_2 = GetClosestObjectOfType
        L17_2 = L8_1
        L18_2 = 2.0
        L19_2 = L15_2
        L20_2 = false
        L21_2 = false
        L22_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L17_2 = SetEntityNoCollisionEntity
        L18_2 = L14_2
        L19_2 = L16_2
        L20_2 = false
        L17_2(L18_2, L19_2, L20_2)
        L17_2 = SetEntityNoCollisionEntity
        L18_2 = L16_2
        L19_2 = L14_2
        L20_2 = false
        L17_2(L18_2, L19_2, L20_2)
      end
    end
  end
end
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = L7_1
    L0_2 = #L0_2
    if 0 ~= L0_2 then
      goto lbl_10
    end
  end
  L0_2 = nil
  do return L0_2 end
  ::lbl_10::
  L0_2 = Config
  L0_2 = L0_2.EquipmentItems
  L1_2 = L1_1
  L0_2 = L0_2[L1_2]
  if L0_2 then
    L1_2 = L0_2.recipes
    if L1_2 then
      goto lbl_21
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_21::
  L1_2 = pairs
  L2_2 = L0_2.recipes
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = 0
    L8_2 = {}
    L9_2 = pairs
    L10_2 = L6_2.need
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = L14_2.name
      L16_2 = L14_2.amount
      L8_2[L15_2] = L16_2
    end
    L9_2 = pairs
    L10_2 = L7_1
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = L14_2.amount
      if not L15_2 then
        L15_2 = 1
      end
      L14_2.amount = L15_2
      L15_2 = L14_2.name
      L15_2 = L8_2[L15_2]
      if L15_2 then
        L15_2 = L14_2.amount
        L16_2 = L14_2.name
        L16_2 = L8_2[L16_2]
        if L15_2 >= L16_2 then
          L7_2 = L7_2 + 1
          L15_2 = L14_2.name
          L8_2[L15_2] = nil
        end
      end
    end
    L9_2 = L6_2.need
    L9_2 = #L9_2
    if L7_2 == L9_2 then
      L9_2 = L6_2
      L10_2 = L5_2
      return L9_2, L10_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L17_1(A0_2)
  local L1_2, L2_2
  L1_2 = #A0_2
  if 0 == L1_2 then
    return
  end
  L1_2 = Utils
  L1_2 = L1_2.CloseUI
  L1_2()
  L1_2 = L15_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 1000
  L1_2(L2_2)
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    while true do
      L0_3 = L3_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = SetLocalPlayerInvisibleLocally
      L1_3 = true
      L0_3(L1_3)
      L0_3 = ipairs
      L1_3 = {}
      L2_3 = 32
      L3_3 = 33
      L4_3 = 34
      L5_3 = 35
      L6_3 = 194
      L7_3 = 24
      L8_3 = 69
      L9_3 = 177
      L10_3 = 200
      L11_3 = 202
      L12_3 = 322
      L13_3 = 25
      L1_3[1] = L2_3
      L1_3[2] = L3_3
      L1_3[3] = L4_3
      L1_3[4] = L5_3
      L1_3[5] = L6_3
      L1_3[6] = L7_3
      L1_3[7] = L8_3
      L1_3[8] = L9_3
      L1_3[9] = L10_3
      L1_3[10] = L11_3
      L1_3[11] = L12_3
      L1_3[12] = L13_3
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = DisableControlAction
        L7_3 = 0
        L8_3 = L5_3
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
      end
      L0_3 = Utils
      L0_3 = L0_3.UpdateMouseCursor
      L1_3 = L4_1
      L2_3 = 3
      L3_3 = 0
      L4_3 = L2_1
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 177
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L13_1
        L0_3()
        break
      end
      L0_3 = L10_1
      if not L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L1_3 = L11_1
        L0_3 = L0_3 - L1_3
        L1_3 = 10000
        if L0_3 > L1_3 then
          L0_3 = Notify
          L1_3 = _U
          L2_3 = "help_add_to_mixer"
          L1_3 = L1_3(L2_3)
          L2_3 = "inform"
          L0_3(L1_3, L2_3)
          L0_3 = true
          L10_1 = L0_3
        end
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 69
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L11_1 = L0_3
        L0_3 = false
        L10_1 = L0_3
      end
      L0_3 = ipairs
      L1_3 = L4_1
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = L5_3.object
        L7_3 = L5_1
        if L6_3 == L7_3 then
          L6_3 = L5_1
          if L6_3 then
            goto lbl_98
          end
        end
        L6_3 = Utils
        L6_3 = L6_3.ApplyGravityToEntity
        L7_3 = L5_3.object
        L8_3 = L8_1.z
        L6_3(L7_3, L8_3)
        ::lbl_98::
      end
      L0_3 = L5_1
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        if L0_3 and L1_3 then
          L2_3 = SetEntityCoords
          L3_3 = L5_1
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        L2_3 = IsDisabledControlJustReleased
        L3_3 = 0
        L4_3 = 69
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = nil
          L5_1 = L2_3
        end
      else
        L0_3 = IsDisabledControlJustPressed
        L1_3 = 0
        L2_3 = 69
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = Utils
          L0_3 = L0_3.GetEntityAtCursor
          L1_3 = L2_1
          L0_3 = L0_3(L1_3)
          if L0_3 then
            L1_3 = pairs
            L2_3 = L4_1
            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
              L7_3 = L6_3.object
              if L0_3 == L7_3 then
                L7_3 = L6_3.object
                L5_1 = L7_3
                L7_3 = GetEntityRotation
                L8_3 = L6_3.object
                L7_3 = L7_3(L8_3)
                L6_1 = L7_3
                break
              end
            end
          end
        end
      end
      L0_3 = ipairs
      L1_3 = L4_1
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = DoesEntityExist
        L7_3 = L5_3.object
        L6_3 = L6_3(L7_3)
        if L6_3 then
          L7_3 = L5_3.name
          L6_3 = L7_1
          L6_3 = L6_3[L7_3]
          if not L6_3 then
            L6_3 = L5_1
            L7_3 = L5_3.object
            if L6_3 ~= L7_3 then
              L6_3 = GetEntityCoords
              L7_3 = L5_3.object
              L6_3 = L6_3(L7_3)
              L7_3 = L8_1
              L7_3 = L6_3 - L7_3
              L7_3 = #L7_3
              L8_3 = 0.25
              if L7_3 < L8_3 then
                L7_3 = PlaySoundFrontend
                L8_3 = -1
                L9_3 = "PICK_UP"
                L10_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
                L11_3 = 1
                L7_3(L8_3, L9_3, L10_3, L11_3)
                L7_3 = table
                L7_3 = L7_3.insert
                L8_3 = L7_1
                L9_3 = {}
                L10_3 = L5_3.name
                L9_3.name = L10_3
                L10_3 = L5_3.amount
                L9_3.amount = L10_3
                L7_3(L8_3, L9_3)
                L7_3 = DeleteEntity
                L8_3 = L5_3.object
                L7_3(L8_3)
                L7_3 = L7_1
                L7_3 = #L7_3
                L8_3 = L4_1
                L8_3 = #L8_3
                if L7_3 == L8_3 then
                  L7_3 = L16_1
                  L7_3, L8_3 = L7_3()
                  recipeIndex = L8_3
                  recipe = L7_3
                  L7_3 = recipe
                  if L7_3 then
                    L7_3 = Config
                    L7_3 = L7_3.EquipmentItems
                    L8_3 = L1_1
                    L7_3 = L7_3[L8_3]
                    L7_3 = L7_3.objects
                    L7_3 = L7_3[1]
                    L7_3 = L7_3.model
                    L8_3 = GetClosestObjectOfType
                    L9_3 = L8_1
                    L10_3 = 2.0
                    L11_3 = L7_3
                    L12_3 = false
                    L13_3 = false
                    L14_3 = false
                    L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
                    if L8_3 then
                      L9_3 = Utils
                      L9_3 = L9_3.LoadPtfx
                      L10_3 = "core"
                      L9_3(L10_3)
                      L9_3 = UseParticleFxAssetNextCall
                      L10_3 = "core"
                      L9_3(L10_3)
                      L9_3 = StartParticleFxLoopedOnEntity
                      L10_3 = "ent_amb_steam_pipe_hvy"
                      L11_3 = L8_3
                      L12_3 = 0.0
                      L13_3 = 0.0
                      L14_3 = 0.2
                      L15_3 = 0.0
                      L16_3 = 0.0
                      L17_3 = 0.0
                      L18_3 = 0.5
                      L19_3 = false
                      L20_3 = false
                      L21_3 = false
                      L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                    end
                    L9_3 = Wait
                    L10_3 = 5000
                    L9_3(L10_3)
                    if L8_3 then
                      L9_3 = RemoveParticleFxFromEntity
                      L10_3 = L8_3
                      L9_3(L10_3)
                    end
                    L9_3 = ClearPedTasks
                    L10_3 = PlayerPedId
                    L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3 = L10_3()
                    L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                    L9_3 = TriggerServerEvent
                    L10_3 = "tk_drugs:completeRecipe"
                    L11_3 = L0_1
                    L12_3 = recipeIndex
                    L13_3 = 1
                    L9_3(L10_3, L11_3, L12_3, L13_3)
                    L9_3 = L13_1
                    L9_3()
                    break
                  else
                    L7_3 = Notify
                    L8_3 = _U
                    L9_3 = "invalid_combination"
                    L8_3 = L8_3(L9_3)
                    L9_3 = "error"
                    L7_3(L8_3, L9_3)
                    L7_3 = L13_1
                    L7_3()
                    break
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2(L2_2)
end
L18_1 = RegisterNUICallback
L19_1 = "getMixerData"
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L2_2 = L1_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.success = false
    L2_2(L3_2)
    return
  end
  L2_2 = Config
  L2_2 = L2_2.EquipmentItems
  L3_2 = L1_1
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L3_2 = L2_2.recipes
    if L3_2 then
      goto lbl_25
    end
  end
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = false
  L3_2(L4_2)
  do return end
  ::lbl_25::
  L3_2 = {}
  L4_2 = {}
  L5_2 = pairs
  L6_2 = L2_2.recipes
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = pairs
    L12_2 = L10_2.need
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
      L17_2 = L16_2.name
      L17_2 = L4_2[L17_2]
      if not L17_2 then
        L17_2 = GetItemAmount
        L18_2 = L16_2.name
        L17_2 = L17_2(L18_2)
        L18_2 = L16_2.amount
        if L17_2 >= L18_2 then
          L18_2 = table
          L18_2 = L18_2.insert
          L19_2 = L3_2
          L20_2 = {}
          L21_2 = L16_2.name
          L20_2.name = L21_2
          L21_2 = GetItemLabel
          L22_2 = L16_2.name
          L21_2 = L21_2(L22_2)
          L20_2.label = L21_2
          L20_2.count = L17_2
          L21_2 = L16_2.amount
          L20_2.requiredAmount = L21_2
          L21_2 = Config
          L21_2 = L21_2.ImageFormat
          if L21_2 then
            L21_2 = string
            L21_2 = L21_2.format
            L22_2 = Config
            L22_2 = L22_2.ImageFormat
            L23_2 = L16_2.name
            L21_2 = L21_2(L22_2, L23_2)
            if L21_2 then
              goto lbl_79
            end
          end
          L21_2 = Config
          L21_2 = L21_2.ImagePath
          L22_2 = "/"
          L23_2 = L16_2.name
          L24_2 = ".png"
          L21_2 = L21_2 .. L22_2 .. L23_2 .. L24_2
          ::lbl_79::
          L20_2.image = L21_2
          L18_2(L19_2, L20_2)
          L18_2 = L16_2.name
          L4_2[L18_2] = true
        end
      end
    end
  end
  L5_2 = A1_2
  L6_2 = {}
  L6_2.success = true
  L7_2 = L2_2.name
  if not L7_2 then
    L7_2 = "Mixer"
  end
  L6_2.mixerName = L7_2
  L6_2.items = L3_2
  L7_2 = L2_2.recipes
  L6_2.recipes = L7_2
  L5_2(L6_2)
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNUICallback
L19_1 = "startMixing"
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.selectedItems
  if L2_2 then
    L3_2 = #L2_2
    if 0 ~= L3_2 then
      goto lbl_14
    end
  end
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = false
  L4_2.message = "You need to select at least one item"
  L3_2(L4_2)
  do return end
  ::lbl_14::
  L3_2 = L17_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = true
  L3_2(L4_2)
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNUICallback
L19_1 = "cancelMixing"
function L20_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L13_1
  L2_2()
  L2_2 = A1_2
  L3_2 = {}
  L2_2(L3_2)
end
L18_1(L19_1, L20_1)
L18_1 = {}
L19_1 = OpenMixer
L18_1.OpenMixer = L19_1
L18_1.CleanupMixing = L13_1
Mixer = L18_1

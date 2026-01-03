local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L0_1 = nil
L1_1 = {}
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = false
L7_1 = nil
L8_1 = nil
L9_1 = 0
L10_1 = false
L11_1 = 0
L12_1 = {}
L13_1 = {}
L14_1 = nil
L15_1 = 1
L16_1 = false
L17_1 = nil
L18_1 = nil
L19_1 = nil
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = vector3
  L3_2 = 0.0
  L4_2 = 1.0
  L5_2 = 0.5
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = Utils
  L3_2 = L3_2.RotateVector
  L4_2 = L2_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = A0_2 + L3_2
  L4_2 = CreateCam
  L5_2 = "DEFAULT_SCRIPTED_CAMERA"
  L6_2 = true
  L4_2 = L4_2(L5_2, L6_2)
  L0_1 = L4_2
  L4_2 = SetCamCoord
  L5_2 = L0_1
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = vector3
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = -0.3
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L4_2 = A0_2 + L4_2
  L5_2 = PointCamAtCoord
  L6_2 = L0_1
  L7_2 = L4_2.x
  L8_2 = L4_2.y
  L9_2 = L4_2.z
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = SetCamUseShallowDofMode
  L6_2 = L0_1
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetCamNearDof
  L6_2 = L0_1
  L7_2 = 0.3
  L5_2(L6_2, L7_2)
  L5_2 = SetCamFarDof
  L6_2 = L0_1
  L7_2 = 2.0
  L5_2(L6_2, L7_2)
  L5_2 = SetCamDofStrength
  L6_2 = L0_1
  L7_2 = 0.8
  L5_2(L6_2, L7_2)
  L5_2 = RenderScriptCams
  L6_2 = true
  L7_2 = true
  L8_2 = 500
  L9_2 = true
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3
    while true do
      L0_3 = L0_1
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
  L5_2(L6_2)
end
function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = pairs
  L1_2 = L12_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = DeleteEntity
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
  L0_2 = pairs
  L1_2 = L13_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = DeleteEntity
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L0_2 = Utils
  L0_2 = L0_2.SetCanInteract
  L1_2 = true
  L0_2(L1_2)
  L0_2 = {}
  L12_1 = L0_2
  L0_2 = {}
  L13_1 = L0_2
  L0_2 = nil
  L14_1 = L0_2
  L0_2 = nil
  L18_1 = L0_2
  L0_2 = false
  L6_1 = L0_2
  L0_2 = nil
  L19_1 = L0_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = true
    L3_2 = 500
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
    L0_2 = DestroyCam
    L1_2 = L0_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L0_1 = L0_2
  end
end
function L22_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = 1
  L5_2 = A0_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = math
    L8_2 = L8_2.random
    L9_2 = 40
    L10_2 = 80
    L8_2 = L8_2(L9_2, L10_2)
    L8_2 = L8_2 * 0.01
    L9_2 = math
    L9_2 = L9_2.random
    L10_2 = -30
    L11_2 = 30
    L9_2 = L9_2(L10_2, L11_2)
    L9_2 = L9_2 * 0.01
    L10_2 = vector3
    L11_2 = L8_2
    L12_2 = L9_2
    L13_2 = -0.15
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = Utils
    L11_2 = L11_2.RotateVector
    L12_2 = L10_2
    L13_2 = A3_2
    L11_2 = L11_2(L12_2, L13_2)
    L12_2 = A2_2 + L11_2
    L13_2 = Utils
    L13_2 = L13_2.CreateObjectWithPhysics
    L14_2 = A1_2
    L15_2 = L12_2
    L16_2 = nil
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    L14_2 = table
    L14_2 = L14_2.insert
    L15_2 = L12_1
    L16_2 = L13_2
    L14_2(L15_2, L16_2)
  end
end
function L23_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = 1
  L5_2 = A0_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = vector3
    L9_2 = -0.5
    L10_2 = 0.0
    L11_2 = L7_2 * 0.05
    L11_2 = L11_2 - 0.2
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = Utils
    L9_2 = L9_2.RotateVector
    L10_2 = L8_2
    L11_2 = A3_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = A2_2 + L9_2
    L11_2 = Utils
    L11_2 = L11_2.CreateObjectWithPhysics
    L12_2 = A1_2
    L13_2 = L10_2
    L14_2 = vector3
    L15_2 = 90.0
    L16_2 = 0.0
    L17_2 = 0.0
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L15_2 = true
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L13_1
    L14_2 = L11_2
    L12_2(L13_2, L14_2)
    L12_2 = FreezeEntityPosition
    L13_2 = L11_2
    L14_2 = true
    L12_2(L13_2, L14_2)
  end
  L4_2 = L13_1
  L4_2 = #L4_2
  if L4_2 > 0 then
    L4_2 = L13_1
    L5_2 = #L4_2
    L4_2 = L13_1
    L4_2 = L4_2[L5_2]
    L5_2 = vector3
    L6_2 = 0.0
    L7_2 = 0.0
    L8_2 = 0.0
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = Utils
    L6_2 = L6_2.RotateVector
    L7_2 = L5_2
    L8_2 = A3_2
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = A2_2 + L6_2
    L7_2 = SetEntityCoords
    L8_2 = L4_2
    L9_2 = L6_2.x
    L10_2 = L6_2.y
    L11_2 = L6_2.z
    L11_2 = L11_2 - 0.15
    L12_2 = false
    L13_2 = false
    L14_2 = false
    L15_2 = false
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L7_2 = SetEntityRotation
    L8_2 = L4_2
    L9_2 = 0.0
    L10_2 = 0.0
    L11_2 = A3_2 + 180.0
    L12_2 = 2
    L13_2 = true
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L4_2 = L13_1
  L4_2 = #L4_2
  L15_1 = L4_2
end
function L24_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L4_2 = L6_1
  if L4_2 then
    return
  end
  L4_2 = true
  L6_1 = L4_2
  L18_1 = A0_2
  L17_1 = A1_2
  L4_2 = false
  L10_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L11_1 = L4_2
  L4_2 = Config
  L4_2 = L4_2.EquipmentItems
  L4_2 = L4_2[A3_2]
  if L4_2 then
    L5_2 = L4_2.recipes
    if L5_2 then
      goto lbl_25
    end
  end
  L5_2 = L21_1
  L5_2()
  do return end
  ::lbl_25::
  L5_2 = nil
  L6_2 = 0
  L7_2 = nil
  L8_2 = pairs
  L9_2 = L4_2.recipes
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = true
    L15_2 = 0
    L16_2 = pairs
    L17_2 = L13_2.need
    L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
    for L20_2, L21_2 in L16_2, L17_2, L18_2, L19_2 do
      L22_2 = GetItemAmount
      L23_2 = L21_2.name
      L22_2 = L22_2(L23_2)
      L23_2 = L21_2.amount
      if L22_2 < L23_2 then
        L14_2 = false
        break
      else
        L15_2 = L15_2 + 1
      end
    end
    if L14_2 and L6_2 < L15_2 then
      L5_2 = L13_2
      L6_2 = L15_2
      L7_2 = L12_2
    end
  end
  if not L5_2 then
    L8_2 = Notify
    L9_2 = _U
    L10_2 = "not_required_items"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L8_2(L9_2, L10_2)
    L8_2 = L21_1
    L8_2()
    return
  end
  L19_1 = L5_2
  recipeIndex = L7_2
  L8_2 = L19_1.need
  L8_2 = L8_2[1]
  L8_2 = L8_2.model
  L9_2 = L19_1.need
  L9_2 = L9_2[2]
  L9_2 = L9_2.model
  L10_2 = math
  L10_2 = L10_2.min
  L11_2 = GetItemAmount
  L12_2 = L19_1.need
  L12_2 = L12_2[1]
  L12_2 = L12_2.name
  L11_2 = L11_2(L12_2)
  L12_2 = L19_1.need
  L12_2 = L12_2[1]
  L12_2 = L12_2.amount
  L12_2 = L12_2 * 10
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = math
  L11_2 = L11_2.min
  L12_2 = GetItemAmount
  L13_2 = L19_1.need
  L13_2 = L13_2[2]
  L13_2 = L13_2.name
  L12_2 = L12_2(L13_2)
  L13_2 = 10
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = L19_1.need
  L12_2 = L12_2[1]
  L12_2 = L12_2.amount
  if L10_2 < L12_2 or L11_2 < 1 then
    L12_2 = Notify
    L13_2 = _U
    L14_2 = "not_enough_items"
    L13_2 = L13_2(L14_2)
    L14_2 = "error"
    L12_2(L13_2, L14_2)
    L12_2 = L21_1
    L12_2()
    return
  end
  L12_2 = Utils
  L12_2 = L12_2.SetCanInteract
  L13_2 = false
  L12_2(L13_2)
  L12_2 = TaskTurnPedToFaceCoord
  L13_2 = PlayerPedId
  L13_2 = L13_2()
  L14_2 = L17_1.x
  L15_2 = L17_1.y
  L16_2 = L17_1.z
  L17_2 = 500
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = Wait
  L13_2 = 500
  L12_2(L13_2)
  L12_2 = Utils
  L12_2 = L12_2.LoadDict
  L13_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L12_2(L13_2)
  L12_2 = TaskPlayAnim
  L13_2 = PlayerPedId
  L13_2 = L13_2()
  L14_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L15_2 = "machinic_loop_mechandplayer"
  L16_2 = 8.0
  L17_2 = -8.0
  L18_2 = -1
  L19_2 = 17
  L20_2 = 0
  L21_2 = false
  L22_2 = false
  L23_2 = false
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L12_2 = A2_2
  L13_2 = L20_1
  L14_2 = A1_2
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = SetMouseCursorVisible
  L14_2 = true
  L13_2(L14_2)
  L13_2 = SetMouseCursorStyle
  L14_2 = 0
  L13_2(L14_2)
  L13_2 = L22_1
  L14_2 = L10_2
  L15_2 = L8_2
  L16_2 = L17_1
  L17_2 = L12_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = L23_1
  L14_2 = L11_2
  L15_2 = L9_2
  L16_2 = L17_1
  L17_2 = L12_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = GetGameTimer
  L13_2 = L13_2()
  L14_2 = GetGameTimer
  L14_2 = L14_2()
  L15_2 = CreateThread
  function L16_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L0_3 = 0
    L1_3 = 0
    while true do
      L2_3 = L6_1
      if not L2_3 then
        break
      end
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "isActive"
      L4_3 = L6_1
      L2_3(L3_3, L4_3)
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
      L2_3 = ipairs
      L3_3 = {}
      L4_3 = 24
      L5_3 = 32
      L6_3 = 33
      L7_3 = 34
      L8_3 = 35
      L9_3 = 194
      L10_3 = 24
      L11_3 = 69
      L12_3 = 177
      L13_3 = 200
      L14_3 = 202
      L15_3 = 322
      L16_3 = 25
      L3_3[1] = L4_3
      L3_3[2] = L5_3
      L3_3[3] = L6_3
      L3_3[4] = L7_3
      L3_3[5] = L8_3
      L3_3[6] = L9_3
      L3_3[7] = L10_3
      L3_3[8] = L11_3
      L3_3[9] = L12_3
      L3_3[10] = L13_3
      L3_3[11] = L14_3
      L3_3[12] = L15_3
      L3_3[13] = L16_3
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = DisableControlAction
        L9_3 = 0
        L10_3 = L7_3
        L11_3 = true
        L8_3(L9_3, L10_3, L11_3)
      end
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "disabled controls"
      L2_3(L3_3)
      L2_3 = ipairs
      L3_3 = L12_1
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = L14_1
        if L7_3 == L8_3 then
          L8_3 = L16_1
          if L8_3 then
            goto lbl_67
          end
        end
        L8_3 = Utils
        L8_3 = L8_3.Debug
        L9_3 = "applying gravity to drugObj"
        L10_3 = L7_3
        L8_3(L9_3, L10_3)
        L8_3 = Utils
        L8_3 = L8_3.ApplyGravityToEntity
        L9_3 = L7_3
        L10_3 = L17_1.z
        L10_3 = L10_3 - 0.15
        L8_3(L9_3, L10_3)
        ::lbl_67::
      end
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "applied gravity"
      L2_3(L3_3)
      L2_3 = Utils
      L2_3 = L2_3.UpdateMouseCursor
      L3_3 = L12_1
      L4_3 = 3
      L5_3 = 0
      L6_3 = L0_1
      L2_3(L3_3, L4_3, L5_3, L6_3)
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "updated mouse cursor"
      L2_3(L3_3)
      L2_3 = L10_1
      if not L2_3 then
        L2_3 = GetGameTimer
        L2_3 = L2_3()
        L3_3 = L11_1
        L2_3 = L2_3 - L3_3
        L3_3 = 10000
        if L2_3 > L3_3 then
          L2_3 = Notify
          L3_3 = _U
          L4_3 = "help_put_in_bag"
          L3_3 = L3_3(L4_3)
          L4_3 = "inform"
          L2_3(L3_3, L4_3)
          L2_3 = true
          L10_1 = L2_3
        end
      end
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "help notified"
      L2_3(L3_3)
      L2_3 = IsDisabledControlJustPressed
      L3_3 = 0
      L4_3 = 69
      L2_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        L2_3 = IsDisabledControlJustPressed
        L3_3 = 0
        L4_3 = 24
        L2_3 = L2_3(L3_3, L4_3)
        if not L2_3 then
          L2_3 = L16_1
          if not L2_3 then
            goto lbl_128
          end
        end
      end
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      L11_1 = L2_3
      L2_3 = false
      L10_1 = L2_3
      ::lbl_128::
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "reset timer"
      L2_3(L3_3)
      L2_3 = Utils
      L2_3 = L2_3.Debug
      L3_3 = "checking if control is just pressed"
      L4_3 = IsDisabledControlJustPressed
      L5_3 = 0
      L6_3 = 24
      L4_3 = L4_3(L5_3, L6_3)
      L5_3 = IsControlJustPressed
      L6_3 = 0
      L7_3 = 24
      L5_3 = L5_3(L6_3, L7_3)
      L6_3 = IsDisabledControlJustPressed
      L7_3 = 0
      L8_3 = 69
      L6_3 = L6_3(L7_3, L8_3)
      L7_3 = IsControlJustPressed
      L8_3 = 0
      L9_3 = 69
      L7_3 = L7_3(L8_3, L9_3)
      L8_3 = L16_1
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
      L2_3 = IsDisabledControlJustPressed
      L3_3 = 0
      L4_3 = 69
      L2_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        L2_3 = IsDisabledControlJustPressed
        L3_3 = 0
        L4_3 = 24
        L2_3 = L2_3(L3_3, L4_3)
        if not L2_3 then
          goto lbl_217
        end
      end
      L2_3 = L16_1
      if not L2_3 then
        L2_3 = Utils
        L2_3 = L2_3.Debug
        L3_3 = "IsDisabledControlJustPressed(0, 69) or IsDisabledControlJustPressed(0, 24) and not dragging"
        L2_3(L3_3)
        L2_3 = Utils
        L2_3 = L2_3.GetEntityAtCursor
        L3_3 = L0_1
        L2_3 = L2_3(L3_3)
        L3_3 = Utils
        L3_3 = L3_3.Debug
        L4_3 = "entity"
        L5_3 = L2_3
        L6_3 = DoesEntityExist
        L7_3 = L2_3
        L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L6_3(L7_3)
        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
        if L2_3 then
          L3_3 = DoesEntityExist
          L4_3 = L2_3
          L3_3 = L3_3(L4_3)
          if L3_3 then
            L3_3 = ipairs
            L4_3 = L12_1
            L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
            for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
              L9_3 = Utils
              L9_3 = L9_3.Debug
              L10_3 = "obj"
              L11_3 = L8_3
              L12_3 = L8_3 == L2_3
              L9_3(L10_3, L11_3, L12_3)
              if L8_3 == L2_3 then
                L9_3 = Utils
                L9_3 = L9_3.Debug
                L10_3 = "setting activeObj"
                L9_3(L10_3)
                L14_1 = L8_3
                L9_3 = true
                L16_1 = L9_3
                break
              end
            end
          end
        end
      end
      ::lbl_217::
      L2_3 = L16_1
      if L2_3 then
        L2_3 = L14_1
        if L2_3 then
          L2_3 = IsDisabledControlPressed
          L3_3 = 0
          L4_3 = 69
          L2_3 = L2_3(L3_3, L4_3)
          if not L2_3 then
            L2_3 = IsDisabledControlPressed
            L3_3 = 0
            L4_3 = 24
            L2_3 = L2_3(L3_3, L4_3)
            if not L2_3 then
              goto lbl_293
            end
          end
          L2_3 = GetGameTimer
          L2_3 = L2_3()
          L3_3 = L13_2
          L2_3 = L2_3 - L3_3
          L3_3 = 1000
          if L2_3 > L3_3 then
            L2_3 = GetGameTimer
            L2_3 = L2_3()
            L13_2 = L2_3
            L2_3 = Utils
            L2_3 = L2_3.Debug
            L3_3 = "start dragging"
            L4_3 = L16_1
            L5_3 = L14_1
            L6_3 = IsDisabledControlPressed
            L7_3 = 0
            L8_3 = 69
            L6_3 = L6_3(L7_3, L8_3)
            L7_3 = type
            L8_3 = L14_1
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L7_3(L8_3)
            L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
          end
          L2_3 = Utils
          L2_3 = L2_3.GetMouseWorldPosition
          L2_3, L3_3 = L2_3()
          L4_3 = GetGameTimer
          L4_3 = L4_3()
          L5_3 = L14_2
          L4_3 = L4_3 - L5_3
          L5_3 = 1000
          if L4_3 > L5_3 then
            L4_3 = GetGameTimer
            L4_3 = L4_3()
            L14_2 = L4_3
            L4_3 = Utils
            L4_3 = L4_3.Debug
            L5_3 = "success"
            L6_3 = L2_3
            L7_3 = L3_3
            L4_3(L5_3, L6_3, L7_3)
          end
          if L2_3 and L3_3 then
            L4_3 = SetEntityCoords
            L5_3 = L14_1
            L6_3 = L3_3.x
            L7_3 = L3_3.y
            L8_3 = L3_3.z
            L9_3 = false
            L10_3 = false
            L11_3 = false
            L12_3 = false
            L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          end
        end
      end
      ::lbl_293::
      L2_3 = L16_1
      if L2_3 then
        L2_3 = L14_1
        if L2_3 then
          L2_3 = IsDisabledControlJustReleased
          L3_3 = 0
          L4_3 = 69
          L2_3 = L2_3(L3_3, L4_3)
          if not L2_3 then
            L2_3 = IsDisabledControlJustReleased
            L3_3 = 0
            L4_3 = 24
            L2_3 = L2_3(L3_3, L4_3)
            if not L2_3 then
              goto lbl_317
            end
          end
          L2_3 = Utils
          L2_3 = L2_3.Debug
          L3_3 = "stopping dragging"
          L2_3(L3_3)
          L2_3 = false
          L16_1 = L2_3
        end
      end
      ::lbl_317::
      L2_3 = L14_1
      if L2_3 then
        L2_3 = L16_1
        if not L2_3 then
          L3_3 = L15_1
          L2_3 = L13_1
          L2_3 = L2_3[L3_3]
          if L2_3 then
            L2_3 = DoesEntityExist
            L4_3 = L15_1
            L3_3 = L13_1
            L3_3 = L3_3[L4_3]
            L2_3 = L2_3(L3_3)
            if L2_3 then
              L2_3 = GetEntityCoords
              L3_3 = L14_1
              L2_3 = L2_3(L3_3)
              L3_3 = GetEntityCoords
              L5_3 = L15_1
              L4_3 = L13_1
              L4_3 = L4_3[L5_3]
              L3_3 = L3_3(L4_3)
              L4_3 = L2_3 - L3_3
              L4_3 = #L4_3
              L5_3 = 0.15
              if L4_3 < L5_3 then
                L1_3 = L1_3 + 1
                L4_3 = DeleteEntity
                L5_3 = L14_1
                L4_3(L5_3)
                L4_3 = ipairs
                L5_3 = L12_1
                L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
                for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
                  L10_3 = L14_1
                  if L9_3 == L10_3 then
                    L10_3 = table
                    L10_3 = L10_3.remove
                    L11_3 = L12_1
                    L12_3 = L8_3
                    L10_3(L11_3, L12_3)
                    break
                  end
                end
                L4_3 = false
                L16_1 = L4_3
                L4_3 = nil
                L14_1 = L4_3
                L4_3 = L19_1.need
                L4_3 = L4_3[1]
                L4_3 = L4_3.amount
                if L1_3 >= L4_3 then
                  L4_3 = vector3
                  L5_3 = -0.5
                  L6_3 = 0.3
                  L7_3 = L0_3 * 0.05
                  L7_3 = L7_3 - 0.15
                  L4_3 = L4_3(L5_3, L6_3, L7_3)
                  L5_3 = L17_1
                  L6_3 = Utils
                  L6_3 = L6_3.RotateVector
                  L7_3 = L4_3
                  L8_3 = L12_2
                  L6_3 = L6_3(L7_3, L8_3)
                  L5_3 = L5_3 + L6_3
                  L6_3 = Utils
                  L6_3 = L6_3.LerpEntity
                  L8_3 = L15_1
                  L7_3 = L13_1
                  L7_3 = L7_3[L8_3]
                  L8_3 = L5_3
                  L9_3 = vector3
                  L10_3 = 90.0
                  L11_3 = 0.0
                  L12_3 = 0.0
                  L9_3 = L9_3(L10_3, L11_3, L12_3)
                  L10_3 = 500
                  L6_3(L7_3, L8_3, L9_3, L10_3)
                  L6_3 = PlaySoundFrontend
                  L7_3 = -1
                  L8_3 = "PICK_UP"
                  L9_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
                  L10_3 = 1
                  L6_3(L7_3, L8_3, L9_3, L10_3)
                  L0_3 = L0_3 + 1
                  L1_3 = 0
                  L6_3 = L15_1
                  if L6_3 > 1 then
                    L6_3 = Wait
                    L7_3 = 250
                    L6_3(L7_3)
                    L6_3 = L15_1
                    L6_3 = L6_3 - 1
                    L15_1 = L6_3
                    L6_3 = vector3
                    L7_3 = 0.0
                    L8_3 = 0.0
                    L9_3 = -0.15
                    L6_3 = L6_3(L7_3, L8_3, L9_3)
                    L7_3 = L17_1
                    L8_3 = Utils
                    L8_3 = L8_3.RotateVector
                    L9_3 = L6_3
                    L10_3 = L12_2
                    L8_3 = L8_3(L9_3, L10_3)
                    L7_3 = L7_3 + L8_3
                    L8_3 = Utils
                    L8_3 = L8_3.LerpEntity
                    L10_3 = L15_1
                    L9_3 = L13_1
                    L9_3 = L9_3[L10_3]
                    L10_3 = L7_3
                    L11_3 = nil
                    L12_3 = 500
                    L8_3(L9_3, L10_3, L11_3, L12_3)
                    L8_3 = SetEntityRotation
                    L10_3 = L15_1
                    L9_3 = L13_1
                    L9_3 = L9_3[L10_3]
                    L10_3 = 360.0
                    L11_3 = 0.0
                    L12_3 = L12_2
                    L12_3 = L12_3 + 180.0
                    L13_3 = 2
                    L14_3 = true
                    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
                  else
                    L6_3 = Wait
                    L7_3 = 1000
                    L6_3(L7_3)
                    L6_3 = TriggerServerEvent
                    L7_3 = "tk_drugs:completeRecipe"
                    L8_3 = L18_1
                    L9_3 = recipeIndex
                    L10_3 = L0_3
                    L6_3(L7_3, L8_3, L9_3, L10_3)
                    L6_3 = L21_1
                    L6_3()
                    break
                  end
                  L6_3 = L12_1
                  L6_3 = #L6_3
                  if 0 == L6_3 then
                    L6_3 = Wait
                    L7_3 = 1000
                    L6_3(L7_3)
                    L6_3 = TriggerServerEvent
                    L7_3 = "tk_drugs:completeRecipe"
                    L8_3 = L18_1
                    L9_3 = recipeIndex
                    L10_3 = L0_3
                    L6_3(L7_3, L8_3, L9_3, L10_3)
                    L6_3 = L21_1
                    L6_3()
                    break
                  end
                end
              end
            end
          end
        end
      end
      L2_3 = IsDisabledControlJustPressed
      L3_3 = 0
      L4_3 = 177
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = TriggerServerEvent
        L3_3 = "tk_drugs:completeRecipe"
        L4_3 = L18_1
        L5_3 = recipeIndex
        L6_3 = L0_3
        L2_3(L3_3, L4_3, L5_3, L6_3)
        L2_3 = L21_1
        L2_3()
        break
      end
    end
  end
  L15_2(L16_2)
end
function L25_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = L24_1
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L26_1 = AddEventHandler
L27_1 = "onResourceStop"
function L28_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = L21_1
    L1_2()
  end
end
L26_1(L27_1, L28_1)
L26_1 = {}
L26_1.OpenBagging = L25_1
L26_1.CleanupBagging = L21_1
WeedBagging = L26_1

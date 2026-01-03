local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = false
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = false
L9_1 = 0
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = DoesEntityExist
  L1_2 = L1_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L1_1
    L0_2(L1_2)
  end
  L0_2 = DoesEntityExist
  L1_2 = L2_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L2_1
    L0_2(L1_2)
  end
  L0_2 = DoesEntityExist
  L1_2 = L3_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L3_1
    L0_2(L1_2)
  end
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L0_2 = SetLocalPlayerVisibleLocally
  L1_2 = true
  L0_2(L1_2)
  L0_2 = Utils
  L0_2 = L0_2.SetCanInteract
  L1_2 = true
  L0_2(L1_2)
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
  L0_2 = false
  L4_1 = L0_2
  L0_2 = nil
  L5_1 = L0_2
  L0_2 = nil
  L6_1 = L0_2
  L0_2 = nil
  L7_1 = L0_2
  L0_2 = nil
  L1_1 = L0_2
  L0_2 = nil
  L2_1 = L0_2
  L0_2 = nil
  L3_1 = L0_2
  L0_2 = false
  L8_1 = L0_2
  L0_2 = 0
  L9_1 = L0_2
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = true
  L4_1 = L0_2
  L0_2 = Config
  L0_2 = L0_2.EquipmentItems
  L1_2 = L6_1
  L0_2 = L0_2[L1_2]
  L1_2 = GetEntityCoords
  L2_2 = L1_1
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityRotation
  L3_2 = L1_1
  L2_2 = L2_2(L3_2)
  L3_2 = 1.0
  L4_2 = 1.05
  L5_2 = 600
  L6_2 = GetGameTimer
  L6_2 = L6_2()
  L7_2 = CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    while true do
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L6_2
      L0_3 = L0_3 - L1_3
      L1_3 = L5_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L6_2
      L0_3 = L0_3 - L1_3
      L1_3 = L5_2
      L0_3 = L0_3 / L1_3
      L1_3 = L3_2
      L2_3 = L4_2
      L3_3 = L3_2
      L2_3 = L2_3 - L3_3
      L2_3 = L2_3 * L0_3
      L1_3 = L1_3 + L2_3
      L2_3 = GetEntityMatrix
      L3_3 = L3_1
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      L6_3 = SetEntityMatrix
      L7_3 = L3_1
      L8_3 = L2_3
      L9_3 = L3_3
      L10_3 = vec3
      L11_3 = L4_3.x
      L12_3 = L4_3.y
      L13_3 = L4_3.z
      L13_3 = L13_3 * L1_3
      L10_3 = L10_3(L11_3, L12_3, L13_3)
      L11_3 = L5_3
      L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
      L6_3 = Wait
      L7_3 = 10
      L6_3(L7_3)
    end
    L0_3 = DeleteEntity
    L1_3 = L1_1
    L0_3(L1_3)
    L0_3 = Wait
    L1_3 = 1000
    L0_3(L1_3)
    L0_3 = L0_2.cokeBrickModel
    L1_3 = Utils
    L1_3 = L1_3.LoadModel
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      return
    end
    L1_3 = Utils
    L1_3 = L1_3.RotateVector
    L2_3 = vec3
    L3_3 = -0.025
    L4_3 = -0.04
    L5_3 = 0.0
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    L3_3 = L2_2.z
    L1_3 = L1_3(L2_3, L3_3)
    L2_3 = L1_2
    L2_3 = L2_3 + L1_3
    L3_3 = CreateObject
    L4_3 = L0_3
    L5_3 = L2_3.x
    L6_3 = L2_3.y
    L7_3 = L2_3.z
    L8_3 = true
    L9_3 = false
    L10_3 = false
    L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L2_1 = L3_3
    L3_3 = SetEntityHeading
    L4_3 = L2_1
    L5_3 = L7_1
    L5_3 = L5_3 - 90.0
    L3_3(L4_3, L5_3)
    L3_3 = FreezeEntityPosition
    L4_3 = L2_1
    L5_3 = true
    L3_3(L4_3, L5_3)
    L3_3 = 1.0
    L3_2 = L3_3
    L3_3 = 0.95
    L4_2 = L3_3
    L3_3 = 600
    L5_2 = L3_3
    L3_3 = GetGameTimer
    L3_3 = L3_3()
    L6_2 = L3_3
    while true do
      L3_3 = GetGameTimer
      L3_3 = L3_3()
      L4_3 = L6_2
      L3_3 = L3_3 - L4_3
      L4_3 = L5_2
      if not (L3_3 < L4_3) then
        break
      end
      L3_3 = GetGameTimer
      L3_3 = L3_3()
      L4_3 = L6_2
      L3_3 = L3_3 - L4_3
      L4_3 = L5_2
      L3_3 = L3_3 / L4_3
      L4_3 = L3_2
      L5_3 = L3_2
      L6_3 = L4_2
      L5_3 = L5_3 - L6_3
      L5_3 = L5_3 * L3_3
      L4_3 = L4_3 - L5_3
      L5_3 = GetEntityMatrix
      L6_3 = L3_1
      L5_3, L6_3, L7_3, L8_3 = L5_3(L6_3)
      L9_3 = SetEntityMatrix
      L10_3 = L3_1
      L11_3 = L5_3
      L12_3 = L6_3
      L13_3 = vec3
      L14_3 = L7_3.x
      L15_3 = L7_3.y
      L16_3 = L7_3.z
      L16_3 = L16_3 * L4_3
      L13_3 = L13_3(L14_3, L15_3, L16_3)
      L14_3 = L8_3
      L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
      L9_3 = Wait
      L10_3 = 10
      L9_3(L10_3)
    end
    L3_3 = Wait
    L4_3 = 1000
    L3_3(L4_3)
    L3_3 = false
    L4_1 = L3_3
  end
  L7_2(L8_2)
end
function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  L5_1 = A0_2
  L6_1 = A3_2
  L7_1 = A2_2
  L4_2 = Config
  L4_2 = L4_2.EquipmentItems
  L5_2 = L6_1
  L4_2 = L4_2[L5_2]
  if not L4_2 then
    return
  end
  L5_2 = nil
  L6_2 = 0
  L7_2 = nil
  L8_2 = pairs
  L9_2 = Config
  L9_2 = L9_2.EquipmentItems
  L10_2 = L6_1
  L9_2 = L9_2[L10_2]
  L9_2 = L9_2.recipes
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
    return
  end
  recipeType = L5_2
  recipeIndex = L7_2
  L8_2 = L4_2.cokeBaseModel
  L9_2 = Utils
  L9_2 = L9_2.LoadModel
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    return
  end
  L9_2 = Utils
  L9_2 = L9_2.SetCanInteract
  L10_2 = false
  L9_2(L10_2)
  L9_2 = TaskTurnPedToFaceCoord
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = A1_2.x
  L12_2 = A1_2.y
  L13_2 = A1_2.z
  L14_2 = 500
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = Wait
  L10_2 = 500
  L9_2(L10_2)
  L9_2 = Utils
  L9_2 = L9_2.LoadDict
  L10_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L9_2(L10_2)
  L9_2 = TaskPlayAnim
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L12_2 = "machinic_loop_mechandplayer"
  L13_2 = 8.0
  L14_2 = -8.0
  L15_2 = -1
  L16_2 = 17
  L17_2 = 0
  L18_2 = false
  L19_2 = false
  L20_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L9_2 = SetLocalPlayerInvisibleLocally
  L10_2 = true
  L9_2(L10_2)
  L9_2 = vector3
  L10_2 = 0.0
  L11_2 = -1.0
  L12_2 = 0.0
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = Utils
  L10_2 = L10_2.RotateVector
  L11_2 = L9_2
  L12_2 = A2_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = A1_2 + L10_2
  L12_2 = CreateCam
  L13_2 = "DEFAULT_SCRIPTED_CAMERA"
  L14_2 = true
  L12_2 = L12_2(L13_2, L14_2)
  L0_1 = L12_2
  L12_2 = SetCamCoord
  L13_2 = L0_1
  L14_2 = L11_2.x
  L15_2 = L11_2.y
  L16_2 = L11_2.z
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = SetCamRot
  L13_2 = L0_1
  L14_2 = -20.0
  L15_2 = 0.0
  L16_2 = A2_2
  L17_2 = 2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = RenderScriptCams
  L13_2 = true
  L14_2 = true
  L15_2 = 500
  L16_2 = true
  L17_2 = true
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = vector3
  L13_2 = 0.05
  L14_2 = 0.0
  L15_2 = -0.7
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = Utils
  L13_2 = L13_2.RotateVector
  L14_2 = L12_2
  L15_2 = A2_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = A1_2 + L13_2
  L15_2 = CreateObject
  L16_2 = L8_2
  L17_2 = L14_2.x
  L18_2 = L14_2.y
  L19_2 = L14_2.z
  L20_2 = true
  L21_2 = false
  L22_2 = false
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  L1_1 = L15_2
  L15_2 = SetEntityRotation
  L16_2 = L1_1
  L17_2 = 0.0
  L18_2 = 0.0
  L19_2 = A2_2
  L20_2 = 2
  L21_2 = true
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L15_2 = FreezeEntityPosition
  L16_2 = L1_1
  L17_2 = true
  L15_2(L16_2, L17_2)
  L15_2 = GetEntityCoords
  L16_2 = L1_1
  L15_2 = L15_2(L16_2)
  L16_2 = GetEntityRotation
  L17_2 = L1_1
  L16_2 = L16_2(L17_2)
  L17_2 = Config
  L17_2 = L17_2.EquipmentItems
  L18_2 = L6_1
  L17_2 = L17_2[L18_2]
  L17_2 = L17_2.brickModel
  if not L17_2 then
    L17_2 = 64781110
  end
  L18_2 = Utils
  L18_2 = L18_2.LoadModel
  L19_2 = L17_2
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    return
  end
  L19_2 = Config
  L19_2 = L19_2.EquipmentItems
  L20_2 = L6_1
  L19_2 = L19_2[L20_2]
  L19_2 = L19_2.brickOffset
  L20_2 = Utils
  L20_2 = L20_2.RotateVector
  L21_2 = L19_2
  L22_2 = L7_1
  L20_2 = L20_2(L21_2, L22_2)
  L21_2 = L15_2 + L20_2
  L22_2 = CreateObject
  L23_2 = L18_2
  L24_2 = L21_2.x
  L25_2 = L21_2.y
  L26_2 = L21_2.z
  L26_2 = L26_2 + 0.1
  L27_2 = true
  L28_2 = false
  L29_2 = false
  L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L3_1 = L22_2
  L22_2 = SetEntityHeading
  L23_2 = L3_1
  L24_2 = L7_1
  L24_2 = L24_2 - 90.0
  L22_2(L23_2, L24_2)
  L22_2 = GetEntityRotation
  L23_2 = L3_1
  L22_2 = L22_2(L23_2)
  L23_2 = vec3
  L24_2 = L22_2.x
  L25_2 = L22_2.y
  L25_2 = L25_2 + 180.0
  L26_2 = L22_2.z
  L23_2 = L23_2(L24_2, L25_2, L26_2)
  L24_2 = SetEntityRotation
  L25_2 = L3_1
  L26_2 = L23_2.x
  L27_2 = L23_2.y
  L28_2 = L23_2.z
  L29_2 = 2
  L30_2 = true
  L24_2(L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
  L24_2 = FreezeEntityPosition
  L25_2 = L3_1
  L26_2 = true
  L24_2(L25_2, L26_2)
  L24_2 = true
  return L24_2
end
function L13_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = L4_1
  if L4_2 then
    return
  end
  L4_2 = false
  L8_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L9_1 = L4_2
  L4_2 = L12_1
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    return
  end
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = SetLocalPlayerInvisibleLocally
      L1_3 = true
      L0_3(L1_3)
      L0_3 = DoesEntityExist
      L1_3 = L1_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L4_1
        if not L0_3 then
          L0_3 = Utils
          L0_3 = L0_3.UpdateMouseCursor
          L1_3 = {}
          L2_3 = L1_1
          L1_3[1] = L2_3
          L2_3 = 3
          L3_3 = 2
          L4_3 = L0_1
          L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      else
        L0_3 = DoesEntityExist
        L1_3 = L2_1
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = L4_1
          if not L0_3 then
            L0_3 = Utils
            L0_3 = L0_3.UpdateMouseCursor
            L1_3 = {}
            L2_3 = L2_1
            L1_3[1] = L2_3
            L2_3 = 3
            L3_3 = 2
            L4_3 = L0_1
            L0_3(L1_3, L2_3, L3_3, L4_3)
          end
        end
      end
      L0_3 = L8_1
      if not L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L1_3 = L9_1
        L0_3 = L0_3 - L1_3
        L1_3 = 10000
        if L0_3 > L1_3 then
          L0_3 = DoesEntityExist
          L1_3 = L1_1
          L0_3 = L0_3(L1_3)
          if L0_3 then
            L0_3 = L4_1
            if not L0_3 then
              L0_3 = Notify
              L1_3 = _U
              L2_3 = "help_press_material"
              L1_3 = L1_3(L2_3)
              L2_3 = "inform"
              L0_3(L1_3, L2_3)
          end
          else
            L0_3 = DoesEntityExist
            L1_3 = L2_1
            L0_3 = L0_3(L1_3)
            if L0_3 then
              L0_3 = L4_1
              if not L0_3 then
                L0_3 = Notify
                L1_3 = _U
                L2_3 = "help_collect_product"
                L1_3 = L1_3(L2_3)
                L2_3 = "inform"
                L0_3(L1_3, L2_3)
              end
            end
          end
          L0_3 = true
          L8_1 = L0_3
        end
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 24
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L9_1 = L0_3
        L0_3 = false
        L8_1 = L0_3
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 24
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L4_1
        if not L0_3 then
          L0_3 = Utils
          L0_3 = L0_3.GetEntityAtCursor
          L1_3 = L0_1
          L0_3 = L0_3(L1_3)
          L1_3 = L1_1
          if L0_3 == L1_3 then
            L1_3 = L11_1
            L1_3()
          end
        end
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 177
      L0_3 = L0_3(L1_3, L2_3)
      if not L0_3 then
        L0_3 = IsDisabledControlJustPressed
        L1_3 = 0
        L2_3 = 194
        L0_3 = L0_3(L1_3, L2_3)
        if not L0_3 then
          goto lbl_130
        end
      end
      L0_3 = L10_1
      L0_3()
      do break end
      ::lbl_130::
      L0_3 = DoesEntityExist
      L1_3 = L2_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L4_1
        if not L0_3 then
          L0_3 = IsDisabledControlJustPressed
          L1_3 = 0
          L2_3 = 24
          L0_3 = L0_3(L1_3, L2_3)
          if L0_3 then
            L0_3 = Utils
            L0_3 = L0_3.GetEntityAtCursor
            L1_3 = L0_1
            L0_3 = L0_3(L1_3)
            L1_3 = L2_1
            if L0_3 == L1_3 then
              L1_3 = TriggerServerEvent
              L2_3 = "tk_drugs:completeRecipe"
              L3_3 = L5_1
              L4_3 = recipeIndex
              L5_3 = 1
              L1_3(L2_3, L3_3, L4_3, L5_3)
              L1_3 = L10_1
              L1_3()
              break
            end
          end
        end
      end
    end
  end
  L4_2(L5_2)
end
L14_1 = {}
L14_1.OpenPress = L13_1
L14_1.CleanupPress = L10_1
Press = L14_1
L14_1 = AddEventHandler
L15_1 = "onResourceStop"
function L16_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = L10_1
    L1_2()
  end
end
L14_1(L15_1, L16_1)

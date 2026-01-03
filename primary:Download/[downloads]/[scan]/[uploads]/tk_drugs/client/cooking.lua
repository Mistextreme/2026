local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = {}
L4_1 = nil
L5_1 = nil
L6_1 = 0
L7_1 = false
L8_1 = {}
L9_1 = 200
L10_1 = nil
L11_1 = nil
L12_1 = nil
L13_1 = false
L14_1 = nil
L15_1 = nil
L16_1 = {}
L17_1 = false
L18_1 = 0
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = vector3
  L3_2 = 0.0
  L4_2 = 1.0
  L5_2 = 0.9
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
  L12_1 = L4_2
  L4_2 = SetCamCoord
  L5_2 = L12_1
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = vector3
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = 0.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L4_2 = A0_2 + L4_2
  L5_2 = PointCamAtCoord
  L6_2 = L12_1
  L7_2 = L4_2.x
  L8_2 = L4_2.y
  L9_2 = L4_2.z
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = SetCamUseShallowDofMode
  L6_2 = L12_1
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetCamNearDof
  L6_2 = L12_1
  L7_2 = 0.3
  L5_2(L6_2, L7_2)
  L5_2 = SetCamFarDof
  L6_2 = L12_1
  L7_2 = 2.0
  L5_2(L6_2, L7_2)
  L5_2 = SetCamDofStrength
  L6_2 = L12_1
  L7_2 = 0.8
  L5_2(L6_2, L7_2)
  L5_2 = RenderScriptCams
  L6_2 = true
  L7_2 = true
  L8_2 = 500
  L9_2 = true
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = SetLocalPlayerInvisibleLocally
  L6_2 = true
  L5_2(L6_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3
    while true do
      L0_3 = L12_1
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
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
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
  L0_2 = L0_1
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L0_1
    L0_2(L1_2)
  end
  L0_2 = L2_1
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L2_1
    L0_2(L1_2)
  end
  L0_2 = L1_1
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L1_1
    L0_2(L1_2)
  end
  L0_2 = pairs
  L1_2 = L3_1
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
  L0_2 = ipairs
  L1_2 = L16_1
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
  L0_2 = L12_1
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = true
    L3_2 = 500
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L12_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L12_1 = L0_2
  end
  L0_2 = {}
  L3_1 = L0_2
  L0_2 = {}
  L16_1 = L0_2
  L0_2 = {}
  L8_1 = L0_2
  L0_2 = nil
  L4_1 = L0_2
  L0_2 = 0
  L6_1 = L0_2
  L0_2 = false
  L7_1 = L0_2
  L0_2 = false
  L13_1 = L0_2
  L0_2 = nil
  L14_1 = L0_2
  L0_2 = nil
  L15_1 = L0_2
end
function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = 0.2
  L1_2 = -0.8
  L2_2 = ipairs
  L3_2 = recipeType
  L3_2 = L3_2.need
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L11_1
    L9_2 = Utils
    L9_2 = L9_2.RotateVector
    L10_2 = vector3
    L11_2 = L6_2 - 1
    L11_2 = L11_2 * L0_2
    L11_2 = L1_2 + L11_2
    L12_2 = 0.0
    L13_2 = -0.15
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = tableHeading
    L9_2 = L9_2(L10_2, L11_2)
    L8_2 = L8_2 + L9_2
    L9_2 = L7_2.offset
    if L9_2 then
      L9_2 = L11_1
      L10_2 = Utils
      L10_2 = L10_2.RotateVector
      L11_2 = L7_2.offset
      L12_2 = tableHeading
      L10_2 = L10_2(L11_2, L12_2)
      L8_2 = L9_2 + L10_2
    end
    L9_2 = Utils
    L9_2 = L9_2.CreateObjectWithPhysics
    L10_2 = L7_2.model
    L11_2 = L8_2
    L12_2 = nil
    L13_2 = false
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L3_1
    L12_2 = {}
    L12_2.object = L9_2
    L13_2 = L7_2.name
    L12_2.name = L13_2
    L13_2 = L7_2.interactType
    L12_2.interactType = L13_2
    L13_2 = L7_2.model
    L12_2.model = L13_2
    L10_2(L11_2, L12_2)
    L10_2 = L7_2.interactType
    if "rotate" == L10_2 then
      L10_2 = L8_1
      L10_2[L9_2] = 0
    end
  end
  L2_2 = L11_1
  L3_2 = Utils
  L3_2 = L3_2.RotateVector
  L4_2 = vector3
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = -0.15
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = tableHeading
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 + L3_2
  L10_1 = L2_2
  L2_2 = Config
  L2_2 = L2_2.EquipmentItems
  L3_2 = L15_1
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.flaskModel
  if not L2_2 then
    L2_2 = "xm3_prop_xm3_lsd_tray_02a"
  end
  L3_2 = Utils
  L3_2 = L3_2.CreateObjectWithPhysics
  L4_2 = L2_2
  L5_2 = L10_1
  L6_2 = nil
  L7_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L0_1 = L3_2
  L3_2 = L11_1
  L4_2 = Utils
  L4_2 = L4_2.RotateVector
  L5_2 = vector3
  L6_2 = 0.5
  L7_2 = 0.0
  L8_2 = -0.15
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = tableHeading
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 + L4_2
  L4_2 = Config
  L4_2 = L4_2.EquipmentItems
  L5_2 = L15_1
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2.heaterModel
  if not L4_2 then
    L4_2 = "xm3_prop_xm3_lsd_appar_03a"
  end
  L5_2 = Utils
  L5_2 = L5_2.CreateObjectWithPhysics
  L6_2 = L4_2
  L7_2 = L3_2
  L8_2 = nil
  L9_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L2_1 = L5_2
end
function L22_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      return L6_2
    end
  end
  L2_2 = nil
  return L2_2
end
FindInTable = L22_1
function L22_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L4_2 = L13_1
  if L4_2 then
    return
  end
  L4_2 = true
  L13_1 = L4_2
  L14_1 = A0_2
  L15_1 = A3_2
  L11_1 = A1_2
  tableHeading = A2_2
  L4_2 = false
  L17_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L18_1 = L4_2
  L4_2 = Config
  L4_2 = L4_2.EquipmentItems
  L5_2 = L15_1
  L4_2 = L4_2[L5_2]
  if not L4_2 then
    L5_2 = L20_1
    L5_2()
    return
  end
  L5_2 = nil
  L6_2 = 0
  L7_2 = nil
  L8_2 = pairs
  L9_2 = Config
  L9_2 = L9_2.EquipmentItems
  L10_2 = L15_1
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
    L8_2 = L20_1
    L8_2()
    return
  end
  recipeType = L5_2
  recipeIndex = L7_2
  L8_2 = L19_1
  L9_2 = A1_2
  L10_2 = tableHeading
  L8_2(L9_2, L10_2)
  L8_2 = L21_1
  L8_2()
  L8_2 = Utils
  L8_2 = L8_2.SetCanInteract
  L9_2 = false
  L8_2(L9_2)
  L8_2 = TaskTurnPedToFaceCoord
  L9_2 = PlayerPedId
  L9_2 = L9_2()
  L10_2 = A1_2.x
  L11_2 = A1_2.y
  L12_2 = A1_2.z
  L13_2 = 500
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = Wait
  L9_2 = 500
  L8_2(L9_2)
  L8_2 = Utils
  L8_2 = L8_2.LoadDict
  L9_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L8_2(L9_2)
  L8_2 = TaskPlayAnim
  L9_2 = PlayerPedId
  L9_2 = L9_2()
  L10_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L11_2 = "machinic_loop_mechandplayer"
  L12_2 = 8.0
  L13_2 = -8.0
  L14_2 = -1
  L15_2 = 17
  L16_2 = 0
  L17_2 = false
  L18_2 = false
  L19_2 = false
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L8_2 = SetMouseCursorVisible
  L9_2 = true
  L8_2(L9_2)
  L8_2 = SetMouseCursorStyle
  L9_2 = 0
  L8_2(L9_2)
  L8_2 = 0
  L9_2 = recipeType
  L9_2 = L9_2.need
  L9_2 = #L9_2
  L10_2 = nil
  L11_2 = CreateThread
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    while true do
      L0_3 = L13_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
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
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 177
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L20_1
        L0_3()
        break
      end
      L0_3 = L8_2
      if L0_3 > 0 then
        L0_3 = DoesEntityExist
        L1_3 = L1_1
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          L0_3 = vector3
          L1_3 = 0.0
          L2_3 = 0.02
          L3_3 = 0.05
          L0_3 = L0_3(L1_3, L2_3, L3_3)
          L1_3 = GetEntityCoords
          L2_3 = L0_1
          L1_3 = L1_3(L2_3)
          L2_3 = Utils
          L2_3 = L2_3.RotateVector
          L3_3 = L0_3
          L4_3 = tableHeading
          L2_3 = L2_3(L3_3, L4_3)
          L1_3 = L1_3 + L2_3
          L10_2 = L1_3
          L1_3 = Utils
          L1_3 = L1_3.CreateObjectWithPhysics
          L2_3 = "prop_cs_sink_filler_03"
          L3_3 = L10_2
          L4_3 = nil
          L5_3 = false
          L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_1 = L1_3
          L1_3 = SetEntityAlpha
          L2_3 = L1_1
          L3_3 = 255
          L4_3 = false
          L1_3(L2_3, L3_3, L4_3)
          L1_3 = Utils
          L1_3 = L1_3.SetEntityScale
          L2_3 = L1_1
          L3_3 = 0.58
          L1_3(L2_3, L3_3)
        end
      end
      L0_3 = DoesEntityExist
      L1_3 = L1_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L8_2
        L1_3 = L9_2
        L0_3 = L0_3 / L1_3
        L1_3 = L10_2.z
        L2_3 = L0_3 * 0.05
        L1_3 = L1_3 + L2_3
        L2_3 = SetEntityCoords
        L3_3 = L1_1
        L4_3 = L10_2.x
        L5_3 = L10_2.y
        L6_3 = L1_3
        L7_3 = false
        L8_3 = false
        L9_3 = false
        L10_3 = false
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      end
      L0_3 = L8_2
      if 0 == L0_3 then
        L0_3 = DoesEntityExist
        L1_3 = L1_1
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = DeleteEntity
          L1_3 = L1_1
          L0_3(L1_3)
          L0_3 = nil
          L1_1 = L0_3
        end
      end
      L0_3 = {}
      L1_3 = pairs
      L2_3 = L3_1
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = DoesEntityExist
        L8_3 = L6_3.object
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L7_3 = table
          L7_3 = L7_3.insert
          L8_3 = L0_3
          L9_3 = L6_3.object
          L7_3(L8_3, L9_3)
          L7_3 = L4_1
          L8_3 = L6_3.object
          if L7_3 ~= L8_3 then
            L7_3 = L6_3.model
            if "prop_cs_script_bottle_01" == L7_3 then
              L7_3 = 0.0
              if L7_3 then
                goto lbl_148
              end
            end
            L7_3 = 0.12
            ::lbl_148::
            L8_3 = Utils
            L8_3 = L8_3.ApplyGravityToEntity
            L9_3 = L6_3.object
            L10_3 = A1_2.z
            L10_3 = L10_3 - L7_3
            L8_3(L9_3, L10_3)
          end
        end
      end
      L1_3 = L6_1
      L2_3 = recipeType
      L2_3 = L2_3.need
      L2_3 = #L2_3
      if L1_3 == L2_3 then
        L1_3 = L7_1
        if not L1_3 then
          L1_3 = {}
          L2_3 = L0_1
          L1_3[1] = L2_3
          L0_3 = L1_3
        else
          L1_3 = {}
          L2_3 = L2_1
          L1_3[1] = L2_3
          L0_3 = L1_3
        end
      end
      L1_3 = Utils
      L1_3 = L1_3.UpdateMouseCursor
      L2_3 = L0_3
      L3_3 = 3
      L4_3 = 0
      L5_3 = L12_1
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = L17_1
      if not L1_3 then
        L1_3 = GetGameTimer
        L1_3 = L1_3()
        L2_3 = L18_1
        L1_3 = L1_3 - L2_3
        L2_3 = 10000
        if L1_3 > L2_3 then
          L1_3 = L6_1
          L2_3 = recipeType
          L2_3 = L2_3.need
          L2_3 = #L2_3
          if L1_3 < L2_3 then
            L1_3 = L4_1
            if L1_3 then
              L1_3 = FindInTable
              L2_3 = L8_1
              L3_3 = L4_1
              L1_3 = L1_3(L2_3, L3_3)
              if L1_3 then
                L1_3 = Notify
                L2_3 = _U
                L3_3 = "help_rotate_bottle"
                L2_3 = L2_3(L3_3)
                L3_3 = "inform"
                L1_3(L2_3, L3_3)
                L1_3 = Notify
                L2_3 = _U
                L3_3 = "help_pour_into_flask"
                L2_3 = L2_3(L3_3)
                L3_3 = "inform"
                L1_3(L2_3, L3_3)
              else
                L1_3 = Notify
                L2_3 = _U
                L3_3 = "help_move_items"
                L2_3 = L2_3(L3_3)
                L3_3 = "inform"
                L1_3(L2_3, L3_3)
              end
            else
              L1_3 = Notify
              L2_3 = _U
              L3_3 = "help_move_items"
              L2_3 = L2_3(L3_3)
              L3_3 = "inform"
              L1_3(L2_3, L3_3)
            end
          else
            L1_3 = L7_1
            if not L1_3 then
              L1_3 = Notify
              L2_3 = _U
              L3_3 = "help_stir_mixture"
              L2_3 = L2_3(L3_3)
              L3_3 = "inform"
              L1_3(L2_3, L3_3)
            else
              L1_3 = Notify
              L2_3 = _U
              L3_3 = "help_heat_mixture"
              L2_3 = L2_3(L3_3)
              L3_3 = "inform"
              L1_3(L2_3, L3_3)
            end
          end
          L1_3 = true
          L17_1 = L1_3
        end
      end
      L1_3 = IsDisabledControlJustPressed
      L2_3 = 0
      L3_3 = 69
      L1_3 = L1_3(L2_3, L3_3)
      if not L1_3 then
        L1_3 = IsControlPressed
        L2_3 = 0
        L3_3 = 241
        L1_3 = L1_3(L2_3, L3_3)
        if not L1_3 then
          L1_3 = IsControlPressed
          L2_3 = 0
          L3_3 = 242
          L1_3 = L1_3(L2_3, L3_3)
          if not L1_3 then
            goto lbl_279
          end
        end
      end
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      L18_1 = L1_3
      L1_3 = false
      L17_1 = L1_3
      ::lbl_279::
      L1_3 = L4_1
      if L1_3 then
        L1_3 = L6_1
        L2_3 = recipeType
        L2_3 = L2_3.need
        L2_3 = #L2_3
        if L1_3 < L2_3 then
          L1_3 = L4_1
          L2_3 = L0_1
          if L1_3 ~= L2_3 then
            L1_3 = L4_1
            L2_3 = L2_1
            if L1_3 ~= L2_3 then
              L1_3 = Utils
              L1_3 = L1_3.GetMouseWorldPosition
              L1_3, L2_3 = L1_3()
              if L1_3 and L2_3 then
                L3_3 = SetEntityCoords
                L4_3 = L4_1
                L5_3 = L2_3.x
                L6_3 = L2_3.y
                L7_3 = L2_3.z
                L8_3 = false
                L9_3 = false
                L10_3 = false
                L11_3 = false
                L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
              end
              L3_3 = IsDisabledControlJustReleased
              L4_3 = 0
              L5_3 = 69
              L3_3 = L3_3(L4_3, L5_3)
              if L3_3 then
                L3_3 = nil
                L4_1 = L3_3
              end
              L3_3 = IsControlPressed
              L4_3 = 0
              L5_3 = 241
              L3_3 = L3_3(L4_3, L5_3)
              if L3_3 then
                L3_3 = GetEntityRotation
                L4_3 = L4_1
                L3_3 = L3_3(L4_3)
                L4_3 = SetEntityRotation
                L5_3 = L4_1
                L6_3 = L3_3.x
                L6_3 = L6_3 + 10.0
                L7_3 = L3_3.y
                L8_3 = L3_3.z
                L9_3 = 2
                L10_3 = true
                L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
                L4_3 = GetEntityRotation
                L5_3 = L4_1
                L4_3 = L4_3(L5_3)
                L5_1 = L4_3
              else
                L3_3 = IsControlPressed
                L4_3 = 0
                L5_3 = 242
                L3_3 = L3_3(L4_3, L5_3)
                if L3_3 then
                  L3_3 = GetEntityRotation
                  L4_3 = L4_1
                  L3_3 = L3_3(L4_3)
                  L4_3 = SetEntityRotation
                  L5_3 = L4_1
                  L6_3 = L3_3.x
                  L6_3 = L6_3 - 10.0
                  L7_3 = L3_3.y
                  L8_3 = L3_3.z
                  L9_3 = 2
                  L10_3 = true
                  L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
                  L4_3 = GetEntityRotation
                  L5_3 = L4_1
                  L4_3 = L4_3(L5_3)
                  L5_1 = L4_3
                else
                  L3_3 = L5_1
                  if L3_3 then
                    L3_3 = SetEntityRotation
                    L4_3 = L4_1
                    L5_3 = L5_1.x
                    L6_3 = L5_1.y
                    L7_3 = L5_1.z
                    L8_3 = 2
                    L9_3 = true
                    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
                  end
                end
              end
          end
        end
      end
      else
        L1_3 = IsDisabledControlJustPressed
        L2_3 = 0
        L3_3 = 69
        L1_3 = L1_3(L2_3, L3_3)
        if L1_3 then
          L1_3 = Utils
          L1_3 = L1_3.GetEntityAtCursor
          L2_3 = L12_1
          L1_3 = L1_3(L2_3)
          if L1_3 then
            L2_3 = {}
            L3_3 = pairs
            L4_3 = L3_1
            L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
            for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
              L9_3 = DoesEntityExist
              L10_3 = L8_3.object
              L9_3 = L9_3(L10_3)
              if L9_3 then
                L9_3 = table
                L9_3 = L9_3.insert
                L10_3 = L2_3
                L11_3 = L8_3.object
                L9_3(L10_3, L11_3)
              end
            end
            L3_3 = table
            L3_3 = L3_3.insert
            L4_3 = L2_3
            L5_3 = L0_1
            L3_3(L4_3, L5_3)
            L3_3 = table
            L3_3 = L3_3.insert
            L4_3 = L2_3
            L5_3 = L2_1
            L3_3(L4_3, L5_3)
            L3_3 = ipairs
            L4_3 = L2_3
            L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
            for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
              if L1_3 == L8_3 then
                L4_1 = L8_3
                L9_3 = GetEntityRotation
                L10_3 = L8_3
                L9_3 = L9_3(L10_3)
                L5_1 = L9_3
                break
              end
            end
          end
        end
      end
      L1_3 = pairs
      L2_3 = L3_1
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = DoesEntityExist
        L8_3 = L6_3.object
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L7_3 = L6_3.interactType
          if "move" == L7_3 then
            L7_3 = L6_3.object
            L8_3 = L4_1
            if L7_3 ~= L8_3 then
              L7_3 = GetEntityCoords
              L8_3 = L6_3.object
              L7_3 = L7_3(L8_3)
              L8_3 = L10_1
              L8_3 = L7_3 - L8_3
              L8_3 = #L8_3
              L9_3 = 0.2
              if L8_3 < L9_3 then
                L8_3 = DeleteEntity
                L9_3 = L6_3.object
                L8_3(L9_3)
                L8_3 = L8_2
                L8_3 = L8_3 + 1
                L8_2 = L8_3
                L8_3 = L6_1
                L8_3 = L8_3 + 1
                L6_1 = L8_3
                L8_3 = PlaySoundFrontend
                L9_3 = -1
                L10_3 = "PICK_UP"
                L11_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
                L12_3 = 1
                L8_3(L9_3, L10_3, L11_3, L12_3)
                L8_3 = table
                L8_3 = L8_3.remove
                L9_3 = L3_1
                L10_3 = L5_3
                L8_3(L9_3, L10_3)
                break
              end
          end
          else
            L7_3 = L6_3.interactType
            if "rotate" == L7_3 then
              L7_3 = L6_3.object
              L8_3 = L4_1
              if L7_3 == L8_3 then
                L7_3 = GetEntityCoords
                L8_3 = L6_3.object
                L7_3 = L7_3(L8_3)
                L8_3 = GetEntityRotation
                L9_3 = L6_3.object
                L8_3 = L8_3(L9_3)
                L9_3 = math
                L9_3 = L9_3.abs
                L10_3 = L8_3.x
                L9_3 = L9_3(L10_3)
                if L9_3 > 90.0 then
                  L9_3 = math
                  L9_3 = L9_3.abs
                  L10_3 = L8_3.x
                  L9_3 = L9_3(L10_3)
                  L10_3 = 270.0
                  if L9_3 < L10_3 then
                    L9_3 = L7_3.xy
                    L10_3 = L10_1.xy
                    L9_3 = L9_3 - L10_3
                    L9_3 = #L9_3
                    L10_3 = 0.2
                    if L9_3 < L10_3 then
                      L9_3 = math
                      L9_3 = L9_3.random
                      L9_3 = L9_3()
                      L10_3 = 0.05
                      if L9_3 <= L10_3 then
                        L9_3 = Utils
                        L9_3 = L9_3.LoadPtfx
                        L10_3 = "core"
                        L9_3(L10_3)
                        L9_3 = UseParticleFxAssetNextCall
                        L10_3 = "core"
                        L9_3(L10_3)
                        L9_3 = StartParticleFxNonLoopedOnEntity
                        L10_3 = "ent_sht_water"
                        L11_3 = L6_3.object
                        L12_3 = 0.0
                        L13_3 = 0.0
                        L14_3 = 0.1
                        L15_3 = 0.0
                        L16_3 = 0.0
                        L17_3 = 0.0
                        L18_3 = 0.1
                        L19_3 = false
                        L20_3 = false
                        L21_3 = false
                        L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                      end
                      L10_3 = L6_3.object
                      L9_3 = L8_1
                      L12_3 = L6_3.object
                      L11_3 = L8_1
                      L11_3 = L11_3[L12_3]
                      if not L11_3 then
                        L11_3 = 0
                      end
                      L11_3 = L11_3 + 1
                      L9_3[L10_3] = L11_3
                      L10_3 = L6_3.object
                      L9_3 = L8_1
                      L9_3 = L9_3[L10_3]
                      L10_3 = L9_1
                      if L9_3 >= L10_3 then
                        L9_3 = L8_2
                        L9_3 = L9_3 + 1
                        L8_2 = L9_3
                        L9_3 = DeleteEntity
                        L10_3 = L6_3.object
                        L9_3(L10_3)
                        L9_3 = L6_1
                        L9_3 = L9_3 + 1
                        L6_1 = L9_3
                        L9_3 = PlaySoundFrontend
                        L10_3 = -1
                        L11_3 = "PICK_UP"
                        L12_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
                        L13_3 = 1
                        L9_3(L10_3, L11_3, L12_3, L13_3)
                        L9_3 = table
                        L9_3 = L9_3.remove
                        L10_3 = L3_1
                        L11_3 = L5_3
                        L9_3(L10_3, L11_3)
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
      L1_3 = L6_1
      L2_3 = recipeType
      L2_3 = L2_3.need
      L2_3 = #L2_3
      if L1_3 == L2_3 then
        L1_3 = L7_1
        if not L1_3 then
          L1_3 = IsDisabledControlJustPressed
          L2_3 = 0
          L3_3 = 69
          L1_3 = L1_3(L2_3, L3_3)
          if L1_3 then
            L1_3 = Utils
            L1_3 = L1_3.GetEntityAtCursor
            L2_3 = L12_1
            L1_3 = L1_3(L2_3)
            L2_3 = L0_1
            if L1_3 == L2_3 then
              L2_3 = Utils
              L2_3 = L2_3.LoadPtfx
              L3_3 = "core"
              L2_3(L3_3)
              L2_3 = UseParticleFxAssetNextCall
              L3_3 = "core"
              L2_3(L3_3)
              L2_3 = StartParticleFxNonLoopedOnEntity
              L3_3 = "ent_sht_water"
              L4_3 = L0_1
              L5_3 = 0.0
              L6_3 = 0.0
              L7_3 = 0.0
              L8_3 = 0.0
              L9_3 = 0.0
              L10_3 = 0.0
              L11_3 = 1.0
              L12_3 = false
              L13_3 = false
              L14_3 = false
              L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
              L2_3 = Wait
              L3_3 = 2000
              L2_3(L3_3)
              L2_3 = true
              L7_1 = L2_3
              L2_3 = RemoveParticleFxFromEntity
              L3_3 = L0_1
              L2_3(L3_3)
              L2_3 = PlaySoundFrontend
              L3_3 = -1
              L4_3 = "PICK_UP"
              L5_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
              L6_3 = 1
              L2_3(L3_3, L4_3, L5_3, L6_3)
            end
          end
        end
      end
      L1_3 = L7_1
      if L1_3 then
        L1_3 = IsDisabledControlJustPressed
        L2_3 = 0
        L3_3 = 69
        L1_3 = L1_3(L2_3, L3_3)
        if L1_3 then
          L1_3 = Utils
          L1_3 = L1_3.GetEntityAtCursor
          L2_3 = L12_1
          L1_3 = L1_3(L2_3)
          L2_3 = L2_1
          if L1_3 == L2_3 then
            L2_3 = 0
            L8_2 = L2_3
            L2_3 = Utils
            L2_3 = L2_3.FadeOutEntity
            L3_3 = L1_1
            L4_3 = 200
            L2_3(L3_3, L4_3)
            L2_3 = DeleteEntity
            L3_3 = L1_1
            L2_3(L3_3)
            L2_3 = GetEntityCoords
            L3_3 = L2_1
            L2_3 = L2_3(L3_3)
            L3_3 = Utils
            L3_3 = L3_3.LoadPtfx
            L4_3 = "core"
            L3_3(L4_3)
            L3_3 = UseParticleFxAssetNextCall
            L4_3 = "core"
            L3_3(L4_3)
            L3_3 = StartParticleFxLoopedAtCoord
            L4_3 = "ent_amb_smoke_foundry"
            L5_3 = L2_3.x
            L6_3 = L2_3.y
            L7_3 = L2_3.z
            L7_3 = L7_3 + 0.1
            L8_3 = 0.0
            L9_3 = 0.0
            L10_3 = 0.0
            L11_3 = 0.1
            L12_3 = false
            L13_3 = false
            L14_3 = false
            L15_3 = false
            L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
            L4_3 = Wait
            L5_3 = 5000
            L4_3(L5_3)
            L4_3 = StopParticleFxLooped
            L5_3 = L3_3
            L6_3 = 0
            L4_3(L5_3, L6_3)
            L4_3 = Wait
            L5_3 = 1000
            L4_3(L5_3)
            L4_3 = TriggerServerEvent
            L5_3 = "tk_drugs:completeRecipe"
            L6_3 = L14_1
            L7_3 = recipeIndex
            L8_3 = 1
            L4_3(L5_3, L6_3, L7_3, L8_3)
            L4_3 = L20_1
            L4_3()
            return
          end
        end
      end
    end
  end
  L11_2(L12_2)
end
L23_1 = AddEventHandler
L24_1 = "onResourceStop"
function L25_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = L20_1
    L1_2()
  end
end
L23_1(L24_1, L25_1)
L23_1 = {}
L23_1.StartMethCooking = L22_1
L23_1.CleanUpMethCooking = L20_1
MethCooking = L23_1

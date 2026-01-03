local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = {}
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = false
L10_1 = 0
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = recipeType
  L1_2 = L1_2.need
  L1_2 = L1_2[1]
  L1_2 = L1_2.amount
  L2_2 = L6_1
  L3_2 = Utils
  L3_2 = L3_2.RotateVector
  L4_2 = vector3
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = -0.15
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L7_1
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 + L3_2
  L5_1 = L2_2
  L2_2 = Utils
  L2_2 = L2_2.CreateObjectWithPhysics
  L3_2 = "ch_prop_ch_tray_01a"
  L4_2 = L5_1
  L5_2 = nil
  L6_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L1_1 = L2_2
  L2_2 = SetEntityHeading
  L3_2 = L1_1
  L4_2 = L7_1
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L4_1 = L2_2
  L2_2 = 1
  L3_2 = L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = math
    L6_2 = L6_2.random
    L7_2 = -70
    L8_2 = -30
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = L6_2 / 100
    L7_2 = math
    L7_2 = L7_2.random
    L8_2 = -20
    L9_2 = 20
    L7_2 = L7_2(L8_2, L9_2)
    L7_2 = L7_2 / 100
    L8_2 = vector3
    L9_2 = L6_2
    L10_2 = L7_2
    L11_2 = 0.0
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L5_1
    L10_2 = Utils
    L10_2 = L10_2.RotateVector
    L11_2 = L8_2
    L12_2 = L7_1
    L10_2 = L10_2(L11_2, L12_2)
    L9_2 = L9_2 + L10_2
    L10_2 = Config
    L10_2 = L10_2.EquipmentItems
    L10_2 = L10_2[A0_2]
    L10_2 = L10_2.substanceModel
    if not L10_2 then
      L10_2 = 442539565
    end
    L11_2 = Utils
    L11_2 = L11_2.CreateObjectWithPhysics
    L12_2 = L10_2
    L13_2 = L9_2
    L14_2 = nil
    L15_2 = true
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L12_2 = Utils
    L12_2 = L12_2.SetEntityScale
    L13_2 = L11_2
    L14_2 = 0.01
    L12_2(L13_2, L14_2)
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = L4_1
    L14_2 = L11_2
    L12_2(L13_2, L14_2)
  end
  L2_2 = pairs
  L3_2 = L4_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = pairs
    L9_2 = L4_1
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      if L6_2 ~= L12_2 then
        L14_2 = SetEntityNoCollisionEntity
        L15_2 = L7_2
        L16_2 = L13_2
        L17_2 = false
        L14_2(L15_2, L16_2, L17_2)
      end
    end
  end
end
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Utils
  L2_2 = L2_2.RotateVector
  L3_2 = vector3
  L4_2 = 0.0
  L5_2 = -2.8
  L6_2 = 0.65
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = A0_2 + L2_2
  L3_2 = CreateCam
  L4_2 = "DEFAULT_SCRIPTED_CAMERA"
  L5_2 = true
  L3_2 = L3_2(L4_2, L5_2)
  L8_1 = L3_2
  L3_2 = SetCamCoord
  L4_2 = L8_1
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = vector3
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = -0.3
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L3_2 = A0_2 + L3_2
  L4_2 = PointCamAtCoord
  L5_2 = L8_1
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetCamUseShallowDofMode
  L5_2 = L8_1
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetCamNearDof
  L5_2 = L8_1
  L6_2 = 0.3
  L4_2(L5_2, L6_2)
  L4_2 = SetCamFarDof
  L5_2 = L8_1
  L6_2 = 2.0
  L4_2(L5_2, L6_2)
  L4_2 = SetCamDofStrength
  L5_2 = L8_1
  L6_2 = 0.8
  L4_2(L5_2, L6_2)
  L4_2 = RenderScriptCams
  L5_2 = true
  L6_2 = true
  L7_2 = 500
  L8_2 = true
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3
    while true do
      L0_3 = L8_1
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
  L4_2(L5_2)
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L8_1
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
    L1_2 = L8_1
    L2_2 = false
    L0_2(L1_2, L2_2)
  end
  L0_2 = nil
  L8_1 = L0_2
end
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = SetLocalPlayerVisibleLocally
  L3_2 = true
  L2_2(L3_2)
  L2_2 = ClearPedTasks
  L3_2 = PlayerPedId
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = Utils
  L2_2 = L2_2.SetCanInteract
  L3_2 = true
  L2_2(L3_2)
  L2_2 = L13_1
  L2_2()
  L2_2 = L0_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L0_1
    L2_2(L3_2)
  end
  L2_2 = L1_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L1_1
    L2_2(L3_2)
  end
  L2_2 = L2_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L2_1
    L2_2(L3_2)
  end
  L2_2 = L3_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L3_1
    L2_2(L3_2)
  end
  L2_2 = ipairs
  L3_2 = L4_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = DoesEntityExist
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = DeleteEntity
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  L2_2 = {}
  L4_1 = L2_2
  if A1_2 then
    L2_2 = Utils
    L2_2 = L2_2.Debug
    L3_2 = "completeRecipe"
    L4_2 = A0_2
    L5_2 = recipeIndex
    L6_2 = 1
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = TriggerServerEvent
    L3_2 = "tk_drugs:completeRecipe"
    L4_2 = A0_2
    L5_2 = recipeIndex
    L6_2 = 1
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  recipeType = nil
  recipeIndex = nil
end
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = Config
  L2_2 = L2_2.EquipmentItems
  L2_2 = L2_2[A1_2]
  L3_2 = ovenPos
  L4_2 = Utils
  L4_2 = L4_2.RotateVector
  L5_2 = vector3
  L6_2 = -0.33
  L7_2 = -0.25
  L8_2 = 0.5
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L7_1
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 + L4_2
  L5_1 = L3_2
  L3_2 = Utils
  L3_2 = L3_2.LerpEntity
  L4_2 = L1_1
  L5_2 = L5_1
  L6_2 = nil
  L7_2 = 500
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = Wait
  L4_2 = 500
  L3_2(L4_2)
  L3_2 = GetEntityCoords
  L4_2 = L1_1
  L3_2 = L3_2(L4_2)
  L4_2 = GetEntityRotation
  L5_2 = L1_1
  L6_2 = 2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = ipairs
  L6_2 = L4_1
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = Utils
    L11_2 = L11_2.FadeOutEntity
    L12_2 = L10_2
    L13_2 = 250
    L11_2(L12_2, L13_2)
    L11_2 = DeleteEntity
    L12_2 = L10_2
    L11_2(L12_2)
  end
  L5_2 = DeleteEntity
  L6_2 = L1_1
  L5_2(L6_2)
  L5_2 = vec3
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = 0.05
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L5_2 = L3_2 - L5_2
  L6_2 = Utils
  L6_2 = L6_2.CreateObjectWithPhysics
  L7_2 = "tr_prop_meth_tray_01a"
  L8_2 = L3_2
  L9_2 = L4_2
  L10_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L1_1 = L6_2
  L6_2 = L2_2.cookTime
  if not L6_2 then
    L6_2 = 10000
  end
  L7_2 = DoProgress
  L8_2 = nil
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L7_2 = L14_1
    L8_2 = A0_2
    L9_2 = false
    L7_2(L8_2, L9_2)
    return
  end
  L7_2 = vec3
  L8_2 = L6_1.x
  L9_2 = L6_1.y
  L10_2 = L6_1.z
  L10_2 = L10_2 - 0.15
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = Utils
  L8_2 = L8_2.LerpEntity
  L9_2 = L1_1
  L10_2 = L7_2
  L11_2 = nil
  L12_2 = 500
  L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2 = SetEntityCollision
  L9_2 = L1_1
  L10_2 = true
  L11_2 = true
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = FreezeEntityPosition
  L9_2 = L1_1
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = Wait
  L9_2 = 1000
  L8_2(L9_2)
  L8_2 = L2_2.hammering
  if not L8_2 then
    L8_2 = L14_1
    L9_2 = A0_2
    L10_2 = true
    L8_2(L9_2, L10_2)
    return
  end
  L8_2 = L6_1
  L9_2 = Utils
  L9_2 = L9_2.RotateVector
  L10_2 = vector3
  L11_2 = 0.5
  L12_2 = 0.0
  L13_2 = 0.0
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = L7_1
  L9_2 = L9_2(L10_2, L11_2)
  L8_2 = L8_2 + L9_2
  L9_2 = Utils
  L9_2 = L9_2.CreateObjectWithPhysics
  L10_2 = "prop_tool_hammer"
  L11_2 = L8_2
  L12_2 = nil
  L13_2 = true
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L3_1 = L9_2
  L9_2 = vector3
  L10_2 = -90.0
  L11_2 = 260.0
  L12_2 = 90.0
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = GetEntityRotation
  L11_2 = L3_1
  L12_2 = 2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = Utils
  L11_2 = L11_2.RotateVector
  L12_2 = L9_2
  L13_2 = L7_1
  L11_2 = L11_2(L12_2, L13_2)
  L10_2 = L10_2 + L11_2
  L11_2 = SetEntityRotation
  L12_2 = L3_1
  L13_2 = L10_2.x
  L14_2 = L10_2.y
  L15_2 = L10_2.z
  L16_2 = 2
  L17_2 = true
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2 = 0
  L12_2 = 0
  L13_2 = nil
  L14_2 = CreateThread
  function L15_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    while true do
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
      L0_3 = Utils
      L0_3 = L0_3.UpdateMouseCursor
      L1_3 = {}
      L2_3 = L3_1
      L1_3[1] = L2_3
      L2_3 = 3
      L3_3 = 0
      L4_3 = L8_1
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = SetEntityDynamic
      L1_3 = L3_1
      L2_3 = true
      L0_3(L1_3, L2_3)
      L0_3 = ActivatePhysics
      L1_3 = L3_1
      L0_3(L1_3)
      L0_3 = L13_2
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        if L0_3 and L1_3 then
          L2_3 = L1_3.z
          L3_3 = L6_1.z
          if L2_3 > L3_3 then
            L2_3 = SetEntityCoords
            L3_3 = L13_2
            L4_3 = L1_3.x
            L5_3 = L1_3.y
            L6_3 = L1_3.z
            L7_3 = false
            L8_3 = false
            L9_3 = false
            L10_3 = false
            L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
          end
        end
        L2_3 = IsDisabledControlJustReleased
        L3_3 = 0
        L4_3 = 69
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = nil
          L13_2 = L2_3
        end
      else
        L0_3 = IsDisabledControlJustPressed
        L1_3 = 0
        L2_3 = 69
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = Utils
          L0_3 = L0_3.GetEntityAtCursor
          L1_3 = L8_1
          L0_3 = L0_3(L1_3)
          if L0_3 then
            L1_3 = {}
            L2_3 = L3_1
            L1_3[1] = L2_3
            L2_3 = ipairs
            L3_3 = L1_3
            L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
            for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
              if L0_3 == L7_3 then
                L13_2 = L7_3
                break
              end
            end
          end
        end
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 177
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L14_1
        L1_3 = A0_2
        L2_3 = false
        L0_3(L1_3, L2_3)
        break
      end
      L0_3 = L13_2
      if L0_3 then
        L0_3 = IsDisabledControlPressed
        L1_3 = 0
        L2_3 = 69
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = GetEntityCoords
          L1_3 = L3_1
          L0_3 = L0_3(L1_3)
          L1_3 = L6_1
          L1_3 = L0_3 - L1_3
          L1_3 = #L1_3
          L2_3 = 0.3
          if L1_3 < L2_3 then
            L1_3 = GetEntitySpeed
            L2_3 = L3_1
            L1_3 = L1_3(L2_3)
            L2_3 = 1.1
            if L1_3 > L2_3 then
              L1_3 = GetGameTimer
              L1_3 = L1_3()
              L2_3 = L12_2
              L1_3 = L1_3 - L2_3
              L2_3 = 800
              if L1_3 > L2_3 then
                L1_3 = GetGameTimer
                L1_3 = L1_3()
                L12_2 = L1_3
                L1_3 = L11_2
                L1_3 = L1_3 + 1
                L11_2 = L1_3
                L1_3 = L11_2
                if 1 == L1_3 then
                  L1_3 = GetEntityCoords
                  L2_3 = L1_1
                  L1_3 = L1_3(L2_3)
                  L2_3 = GetEntityRotation
                  L3_3 = L1_1
                  L4_3 = 2
                  L2_3 = L2_3(L3_3, L4_3)
                  L3_3 = DeleteEntity
                  L4_3 = L1_1
                  L3_3(L4_3)
                  L3_3 = Utils
                  L3_3 = L3_3.CreateObjectWithPhysics
                  L4_3 = "tr_prop_meth_smashedtray_01_frag_"
                  L5_3 = L1_3
                  L6_3 = L2_3
                  L7_3 = false
                  L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
                  L1_1 = L3_3
                end
                L1_3 = L11_2
                if L1_3 >= 2 then
                  L1_3 = Utils
                  L1_3 = L1_3.FadeOutEntity
                  L2_3 = L1_1
                  L3_3 = 100
                  L1_3(L2_3, L3_3)
                  L1_3 = DeleteEntity
                  L2_3 = L1_1
                  L1_3(L2_3)
                  L1_3 = Wait
                  L2_3 = 250
                  L1_3(L2_3)
                  L1_3 = L14_1
                  L2_3 = A0_2
                  L3_3 = true
                  L1_3(L2_3, L3_3)
                  break
                end
              end
            end
          end
        end
      end
    end
  end
  L14_2(L15_2)
end
function L16_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L4_2 = nil
  L5_2 = 0
  L6_2 = nil
  L7_2 = pairs
  L8_2 = Config
  L8_2 = L8_2.EquipmentItems
  L8_2 = L8_2[A3_2]
  L8_2 = L8_2.recipes
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = true
    L14_2 = 0
    L15_2 = pairs
    L16_2 = L12_2.need
    L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
    for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
      L21_2 = GetItemAmount
      L22_2 = L20_2.name
      L21_2 = L21_2(L22_2)
      L22_2 = L20_2.amount
      if L21_2 < L22_2 then
        L13_2 = false
        break
      else
        L14_2 = L14_2 + 1
      end
    end
    if L13_2 and L5_2 < L14_2 then
      L4_2 = L12_2
      L5_2 = L14_2
      L6_2 = L11_2
    end
  end
  if not L4_2 then
    L7_2 = Notify
    L8_2 = _U
    L9_2 = "not_required_items"
    L8_2 = L8_2(L9_2)
    L9_2 = "error"
    L7_2(L8_2, L9_2)
    return
  end
  recipeType = L4_2
  recipeIndex = L6_2
  ovenPos = A1_2
  L7_1 = A2_2
  L7_2 = Utils
  L7_2 = L7_2.RotateVector
  L8_2 = vector3
  L9_2 = 0.0
  L10_2 = -1.6
  L11_2 = 0.0
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L7_1
  L7_2 = L7_2(L8_2, L9_2)
  L7_2 = A1_2 + L7_2
  L6_1 = L7_2
  L7_2 = false
  L9_1 = L7_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L10_1 = L7_2
  L7_2 = Utils
  L7_2 = L7_2.SetCanInteract
  L8_2 = false
  L7_2(L8_2)
  L7_2 = TaskTurnPedToFaceCoord
  L8_2 = PlayerPedId
  L8_2 = L8_2()
  L9_2 = A1_2.x
  L10_2 = A1_2.y
  L11_2 = A1_2.z
  L12_2 = 500
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = Wait
  L8_2 = 500
  L7_2(L8_2)
  L7_2 = Utils
  L7_2 = L7_2.LoadDict
  L8_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L7_2(L8_2)
  L7_2 = TaskPlayAnim
  L8_2 = PlayerPedId
  L8_2 = L8_2()
  L9_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L10_2 = "machinic_loop_mechandplayer"
  L11_2 = 8.0
  L12_2 = -8.0
  L13_2 = -1
  L14_2 = 17
  L15_2 = 0
  L16_2 = false
  L17_2 = false
  L18_2 = false
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L7_2 = L12_1
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2(L8_2, L9_2)
  L7_2 = SetLocalPlayerInvisibleLocally
  L8_2 = true
  L7_2(L8_2)
  L7_2 = L11_1
  L8_2 = A3_2
  L7_2(L8_2)
  L7_2 = CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3
    L0_3 = 0
    while true do
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
      L1_3 = ipairs
      L2_3 = {}
      L3_3 = 32
      L4_3 = 33
      L5_3 = 34
      L6_3 = 35
      L7_3 = 194
      L8_3 = 24
      L9_3 = 69
      L10_3 = 177
      L11_3 = 200
      L12_3 = 202
      L13_3 = 322
      L14_3 = 25
      L2_3[1] = L3_3
      L2_3[2] = L4_3
      L2_3[3] = L5_3
      L2_3[4] = L6_3
      L2_3[5] = L7_3
      L2_3[6] = L8_3
      L2_3[7] = L9_3
      L2_3[8] = L10_3
      L2_3[9] = L11_3
      L2_3[10] = L12_3
      L2_3[11] = L13_3
      L2_3[12] = L14_3
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = DisableControlAction
        L8_3 = 0
        L9_3 = L6_3
        L10_3 = true
        L7_3(L8_3, L9_3, L10_3)
      end
      L1_3 = IsDisabledControlJustPressed
      L2_3 = 0
      L3_3 = 177
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = L14_1
        L2_3 = A0_2
        L3_3 = false
        L1_3(L2_3, L3_3)
        return
      end
      L1_3 = ipairs
      L2_3 = L4_1
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = SetEntityDynamic
        L8_3 = L6_3
        L9_3 = true
        L7_3(L8_3, L9_3)
        L7_3 = ActivatePhysics
        L8_3 = L6_3
        L7_3(L8_3)
      end
      L1_3 = Utils
      L1_3 = L1_3.UpdateMouseCursor
      L2_3 = L4_1
      L3_3 = 3
      L4_3 = 0
      L5_3 = L8_1
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = L9_1
      if not L1_3 then
        L1_3 = GetGameTimer
        L1_3 = L1_3()
        L2_3 = L10_1
        L1_3 = L1_3 - L2_3
        L2_3 = 10000
        if L1_3 > L2_3 then
          L1_3 = Notify
          L2_3 = _U
          L3_3 = "help_move_items"
          L2_3 = L2_3(L3_3)
          L3_3 = "inform"
          L1_3(L2_3, L3_3)
          L1_3 = true
          L9_1 = L1_3
        end
      end
      L1_3 = IsDisabledControlJustPressed
      L2_3 = 0
      L3_3 = 69
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = GetGameTimer
        L1_3 = L1_3()
        L10_1 = L1_3
        L1_3 = false
        L9_1 = L1_3
      end
      L1_3 = IsDisabledControlJustPressed
      L2_3 = 0
      L3_3 = 69
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = Utils
        L1_3 = L1_3.GetEntityAtCursor
        L2_3 = L8_1
        L1_3 = L1_3(L2_3)
        L2_3 = ipairs
        L3_3 = L4_1
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          if L1_3 == L7_3 then
            L8_3 = L6_1
            L9_3 = Utils
            L9_3 = L9_3.RotateVector
            L10_3 = vector3
            L11_3 = math
            L11_3 = L11_3.random
            L12_3 = -5
            L13_3 = 5
            L11_3 = L11_3(L12_3, L13_3)
            L11_3 = L11_3 / 100
            L12_3 = math
            L12_3 = L12_3.random
            L13_3 = -5
            L14_3 = 5
            L12_3 = L12_3(L13_3, L14_3)
            L12_3 = L12_3 / 100
            L13_3 = 0.0
            L10_3 = L10_3(L11_3, L12_3, L13_3)
            L11_3 = L7_1
            L9_3 = L9_3(L10_3, L11_3)
            L8_3 = L8_3 + L9_3
            L9_3 = SetEntityCoords
            L10_3 = L7_3
            L11_3 = L8_3.x
            L12_3 = L8_3.y
            L13_3 = L8_3.z
            L14_3 = false
            L15_3 = false
            L16_3 = false
            L17_3 = false
            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
            L9_3 = PlaySoundFrontend
            L10_3 = -1
            L11_3 = "PICK_UP"
            L12_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
            L13_3 = 1
            L9_3(L10_3, L11_3, L12_3, L13_3)
            L0_3 = L0_3 + 1
            L9_3 = math
            L9_3 = L9_3.random
            L10_3 = -15
            L11_3 = 15
            L9_3 = L9_3(L10_3, L11_3)
            L9_3 = L9_3 / 100
            L10_3 = math
            L10_3 = L10_3.random
            L11_3 = -15
            L12_3 = 15
            L10_3 = L10_3(L11_3, L12_3)
            L10_3 = L10_3 / 100
            L11_3 = Config
            L11_3 = L11_3.EquipmentItems
            L12_3 = A3_2
            L11_3 = L11_3[L12_3]
            L11_3 = L11_3.substanceModel
            if 1137721765 == L11_3 then
              L11_3 = 0.0
              if L11_3 then
                goto lbl_176
              end
            end
            L11_3 = 0.1
            ::lbl_176::
            L12_3 = AttachEntityToEntity
            L13_3 = L7_3
            L14_3 = L1_1
            L15_3 = 0
            L16_3 = L9_3
            L17_3 = L10_3
            L18_3 = L11_3
            L19_3 = 0.0
            L20_3 = 0.0
            L21_3 = 0.0
            L22_3 = false
            L23_3 = false
            L24_3 = false
            L25_3 = false
            L26_3 = 2
            L27_3 = true
            L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
            L12_3 = SetEntityCollision
            L13_3 = L7_3
            L14_3 = false
            L15_3 = true
            L12_3(L13_3, L14_3, L15_3)
            L12_3 = SetEntityDynamic
            L13_3 = L7_3
            L14_3 = false
            L12_3(L13_3, L14_3)
            break
          end
        end
      end
      L1_3 = L4_1
      L1_3 = #L1_3
      if L0_3 == L1_3 then
        L1_3 = IsDisabledControlJustPressed
        L2_3 = 0
        L3_3 = 69
        L1_3 = L1_3(L2_3, L3_3)
        if L1_3 then
          L1_3 = L15_1
          L2_3 = A0_2
          L3_3 = A3_2
          L1_3(L2_3, L3_3)
          return
        end
      end
    end
  end
  L7_2(L8_2)
end
L17_1 = AddEventHandler
L18_1 = "onResourceStop"
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = L0_1
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = L0_1
      L1_2(L2_2)
    end
    L1_2 = L1_1
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = L1_1
      L1_2(L2_2)
    end
    L1_2 = L2_1
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = L2_1
      L1_2(L2_2)
    end
    L1_2 = L3_1
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = L3_1
      L1_2(L2_2)
    end
    L1_2 = ipairs
    L2_2 = L4_1
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = DoesEntityExist
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L7_2 = DeleteEntity
        L8_2 = L6_2
        L7_2(L8_2)
      end
    end
  end
end
L17_1(L18_1, L19_1)
L17_1 = {}
L17_1.OpenOven = L16_1
Oven = L17_1

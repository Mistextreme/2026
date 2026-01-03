local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = nil
L1_1 = {}
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = false
L7_1 = 1
L8_1 = false
L9_1 = 0
function L10_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L0_2 = Utils
  L0_2 = L0_2.SetCanInteract
  L1_2 = true
  L0_2(L1_2)
  L0_2 = pairs
  L1_2 = L1_1
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
  L1_1 = L0_2
  L0_2 = false
  L6_1 = L0_2
  L0_2 = nil
  L2_1 = L0_2
  L0_2 = nil
  L3_1 = L0_2
  L0_2 = nil
  L4_1 = L0_2
  L0_2 = nil
  L5_1 = L0_2
  L0_2 = 1
  L7_1 = L0_2
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
function L11_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_1 = A0_2
  L4_2 = vec3
  L5_2 = A1_2.x
  L6_2 = A1_2.y
  L7_2 = A1_2.z
  L7_2 = L7_2 - 0.95
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_1 = L4_2
  L4_1 = A2_2
  L5_1 = A3_2
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
  L7_2 = ipairs
  L8_2 = recipeType
  L8_2 = L8_2.need
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = Utils
    L13_2 = L13_2.LoadModel
    L14_2 = L12_2.model
    L13_2 = L13_2(L14_2)
    if not L13_2 then
      return
    end
    L14_2 = GetItemAmount
    L15_2 = L12_2.name
    L14_2 = L14_2(L15_2)
    L15_2 = L12_2.amount
    if L14_2 < L15_2 then
      L14_2 = Notify
      L15_2 = _U
      L16_2 = "not_required_items"
      L15_2 = L15_2(L16_2)
      L16_2 = "error"
      L14_2(L15_2, L16_2)
      L14_2 = false
      return L14_2
    end
    L14_2 = 1
    L15_2 = L12_2.amount
    L16_2 = 1
    for L17_2 = L14_2, L15_2, L16_2 do
      L18_2 = {}
      L19_2 = L12_2.name
      L18_2.name = L19_2
      L19_2 = L12_2.amount
      L18_2.amount = L19_2
      L19_2 = L12_2.model
      L18_2.model = L19_2
      L18_2.placed = false
      L20_2 = L7_1
      L19_2 = L1_1
      L19_2[L20_2] = L18_2
      L19_2 = L7_1
      L19_2 = L19_2 + 1
      L7_1 = L19_2
    end
  end
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
  L7_2 = vector3
  L8_2 = 0.0
  L9_2 = -1.0
  L10_2 = 0.5
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = Utils
  L8_2 = L8_2.RotateVector
  L9_2 = L7_2
  L10_2 = A2_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = A1_2 + L8_2
  L10_2 = CreateCam
  L11_2 = "DEFAULT_SCRIPTED_CAMERA"
  L12_2 = true
  L10_2 = L10_2(L11_2, L12_2)
  L0_1 = L10_2
  L10_2 = SetCamCoord
  L11_2 = L0_1
  L12_2 = L9_2.x
  L13_2 = L9_2.y
  L14_2 = L9_2.z
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = SetCamRot
  L11_2 = L0_1
  L12_2 = -30.0
  L13_2 = 0.0
  L14_2 = A2_2
  L15_2 = 2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = RenderScriptCams
  L11_2 = true
  L12_2 = false
  L13_2 = 0
  L14_2 = true
  L15_2 = true
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = CreateThread
  function L11_2()
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
  L10_2(L11_2)
  L10_2 = true
  return L10_2
end
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = true
  L6_1 = L0_2
  L0_2 = Notify
  L1_2 = _U
  L2_2 = "processing"
  L1_2 = L1_2(L2_2)
  L2_2 = "inform"
  L0_2(L1_2, L2_2)
  L0_2 = Utils
  L0_2 = L0_2.LoadPtfx
  L1_2 = "core"
  L0_2(L1_2)
  L0_2 = UseParticleFxAssetNextCall
  L1_2 = "core"
  L0_2(L1_2)
  L0_2 = StartParticleFxLoopedAtCoord
  L1_2 = "ent_amb_smoke_foundry"
  L2_2 = L3_1.x
  L3_2 = L3_1.y
  L4_2 = L3_1.z
  L4_2 = L4_2 + 0.1
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = 0.1
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L12_2 = false
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L1_2 = 6000
  L2_2 = L7_1
  L2_2 = L1_2 / L2_2
  L3_2 = 1
  L4_2 = L7_1
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = Wait
    L8_2 = L2_2
    L7_2(L8_2)
    L7_2 = L1_1
    L7_2 = L7_2[L6_2]
    if L7_2 then
      L8_2 = L7_2.object
      if L8_2 then
        L8_2 = DoesEntityExist
        L9_2 = L7_2.object
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = Utils
          L8_2 = L8_2.FadeOutEntity
          L9_2 = L7_2.object
          L10_2 = 400
          L8_2(L9_2, L10_2)
          L8_2 = DeleteEntity
          L9_2 = L7_2.object
          L8_2(L9_2)
          L8_2 = L1_1
          L8_2 = L8_2[L6_2]
          L8_2.object = nil
        end
      end
    end
  end
  L3_2 = StopParticleFxLooped
  L4_2 = L0_2
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L3_2 = TriggerServerEvent
  L4_2 = "tk_drugs:completeRecipe"
  L5_2 = L2_1
  L6_2 = recipeIndex
  L7_2 = 1
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = L10_1
  L3_2()
  L3_2 = true
  return L3_2
end
function L13_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = L6_1
  if L4_2 then
    return
  end
  L4_2 = false
  L8_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L9_1 = L4_2
  L4_2 = L11_1
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    return
  end
  L4_2 = 1
  L5_2 = true
  L6_2 = L1_1
  L6_2 = L6_2[L4_2]
  L7_2 = Utils
  L7_2 = L7_2.CreateObjectWithPhysics
  L8_2 = L6_2.model
  L9_2 = vec3
  L10_2 = A1_2.x
  L11_2 = A1_2.y
  L12_2 = A1_2.z
  L12_2 = L12_2 + 1.0
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = nil
  L11_2 = true
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L6_2.object = L7_2
  L7_2 = CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    while true do
      L0_3 = L4_2
      L1_3 = L1_1
      L1_3 = #L1_3
      if not (L0_3 <= L1_3) then
        break
      end
      L0_3 = DoesEntityExist
      L2_3 = L4_2
      L1_3 = L1_1
      L1_3 = L1_3[L2_3]
      L1_3 = L1_3.object
      L0_3 = L0_3(L1_3)
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
      L0_3 = L8_1
      if not L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L1_3 = L9_1
        L0_3 = L0_3 - L1_3
        L1_3 = 10000
        if L0_3 > L1_3 then
          L0_3 = Notify
          L1_3 = _U
          L2_3 = "help_add_to_cauldron"
          L1_3 = L1_3(L2_3)
          L2_3 = "inform"
          L0_3(L1_3, L2_3)
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
      L0_3 = L5_2
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        if L0_3 and L1_3 then
          L2_3 = SetEntityCoords
          L4_3 = L4_2
          L3_3 = L1_1
          L3_3 = L3_3[L4_3]
          L3_3 = L3_3.object
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        L2_3 = GetEntityCoords
        L4_3 = L4_2
        L3_3 = L1_1
        L3_3 = L3_3[L4_3]
        L3_3 = L3_3.object
        L2_3 = L2_3(L3_3)
        L3_3 = IsDisabledControlJustPressed
        L4_3 = 0
        L5_3 = 24
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L2_3.xy
          L4_3 = L3_1.xy
          L3_3 = L3_3 - L4_3
          L3_3 = #L3_3
          L4_3 = 0.2
          if L3_3 < L4_3 then
            L3_3 = false
            L5_2 = L3_3
            while true do
              L3_3 = math
              L3_3 = L3_3.abs
              L4_3 = L2_3.z
              L5_3 = L3_1.z
              L4_3 = L4_3 - L5_3
              L3_3 = L3_3(L4_3)
              L4_3 = 0.02
              if not (L3_3 > L4_3) then
                break
              end
              L3_3 = Wait
              L4_3 = 10
              L3_3(L4_3)
              L3_3 = GetEntityCoords
              L5_3 = L4_2
              L4_3 = L1_1
              L4_3 = L4_3[L5_3]
              L4_3 = L4_3.object
              L3_3 = L3_3(L4_3)
              L2_3 = L3_3
              L3_3 = Utils
              L3_3 = L3_3.ApplyGravityToEntity
              L5_3 = L4_2
              L4_3 = L1_1
              L4_3 = L4_3[L5_3]
              L4_3 = L4_3.object
              L5_3 = L3_1.z
              L6_3 = 0.002
              L3_3(L4_3, L5_3, L6_3)
            end
            L4_3 = L4_2
            L3_3 = L1_1
            L3_3 = L3_3[L4_3]
            L3_3.placed = true
            L3_3 = Wait
            L4_3 = 500
            L3_3(L4_3)
            L3_3 = PlaySoundFrontend
            L4_3 = -1
            L5_3 = "PICK_UP"
            L6_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
            L7_3 = 1
            L3_3(L4_3, L5_3, L6_3, L7_3)
            L3_3 = L4_2
            L3_3 = L3_3 + 1
            L4_2 = L3_3
            L3_3 = L4_2
            L4_3 = L7_1
            if L3_3 < L4_3 then
              L3_3 = true
              L5_2 = L3_3
              L4_3 = L4_2
              L3_3 = L1_1
              L3_3 = L3_3[L4_3]
              L6_2 = L3_3
              L3_3 = Utils
              L3_3 = L3_3.CreateObjectWithPhysics
              L4_3 = L6_2.model
              L5_3 = vec3
              L6_3 = A1_2.x
              L7_3 = A1_2.y
              L8_3 = A1_2.z
              L8_3 = L8_3 + 1.0
              L5_3 = L5_3(L6_3, L7_3, L8_3)
              L6_3 = nil
              L7_3 = true
              L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
              L6_2.object = L3_3
            else
              L3_3 = Config
              L3_3 = L3_3.EquipmentItems
              L4_3 = L5_1
              L3_3 = L3_3[L4_3]
              if L3_3 then
                L4_3 = L12_1
                L4_3()
                break
              end
            end
          end
        end
        L3_3 = IsDisabledControlJustPressed
        L4_3 = 0
        L5_3 = 322
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L10_1
          L3_3()
          break
        end
      end
    end
  end
  L7_2(L8_2)
end
L14_1 = {}
L14_1.OpenCauldron = L13_1
L14_1.CleanupCauldron = L10_1
Cauldron = L14_1

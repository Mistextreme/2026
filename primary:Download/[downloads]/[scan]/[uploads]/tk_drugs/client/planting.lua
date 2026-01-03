local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = 300
L7_1 = 0
L8_1 = false
L9_1 = false
L10_1 = 0
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = DoesCamExist
  L1_2 = L5_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = false
    L3_2 = 0
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L5_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L5_1 = L0_2
  end
end
function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = false
  L8_1 = L0_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = ClearPedTasks
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = SetLocalPlayerVisibleLocally
  L2_2 = true
  L1_2(L2_2)
  L1_2 = SetLocalPlayerInvisibleLocally
  L2_2 = false
  L1_2(L2_2)
  L1_2 = Utils
  L1_2 = L1_2.SetCanInteract
  L2_2 = true
  L1_2(L2_2)
  L1_2 = L11_1
  L1_2()
  L1_2 = DoesEntityExist
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = L0_1
    L1_2(L2_2)
  end
  L1_2 = DoesEntityExist
  L2_2 = L4_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = L4_1
    L1_2(L2_2)
  end
  L1_2 = DoesEntityExist
  L2_2 = L2_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = L2_1
    L1_2(L2_2)
  end
  L1_2 = DoesEntityExist
  L2_2 = L3_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = L3_1
    L1_2(L2_2)
  end
  L1_2 = nil
  L0_1 = L1_2
  mudBag = nil
  L1_2 = nil
  L2_1 = L1_2
  L1_2 = nil
  L4_1 = L1_2
  L1_2 = nil
  L3_1 = L1_2
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L2_2 = Config
  L2_2 = L2_2.PlantSettings
  L2_2 = L2_2.water
  L2_2 = L2_2.model
  L3_2 = Utils
  L3_2 = L3_2.LoadModel
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = CreateObject
  L5_2 = L3_2
  L6_2 = A0_2.x
  L7_2 = A0_2.y
  L8_2 = A0_2.z
  L9_2 = true
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L3_1 = L4_2
  L4_2 = 0
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    while true do
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = DoesEntityExist
      L1_3 = L3_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        if L0_3 and L1_3 then
          L2_3 = SetEntityCoords
          L3_3 = L3_1
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        L2_3 = GetEntityRotation
        L3_3 = L3_1
        L2_3 = L2_3(L3_3)
        L3_3 = GetEntityCoords
        L4_3 = L3_1
        L3_3 = L3_3(L4_3)
        L4_3 = math
        L4_3 = L4_3.abs
        L5_3 = L2_3.x
        L4_3 = L4_3(L5_3)
        if L4_3 > 90.0 then
          L4_3 = math
          L4_3 = L4_3.abs
          L5_3 = L2_3.x
          L4_3 = L4_3(L5_3)
          L5_3 = 270.0
          if L4_3 < L5_3 then
            L4_3 = L3_3.xy
            L5_3 = A0_2.xy
            L4_3 = L4_3 - L5_3
            L4_3 = #L4_3
            L5_3 = 0.3
            if L4_3 < L5_3 then
              L4_3 = math
              L4_3 = L4_3.random
              L4_3 = L4_3()
              L5_3 = 0.05
              if L4_3 <= L5_3 then
                L4_3 = Utils
                L4_3 = L4_3.LoadPtfx
                L5_3 = "core"
                L4_3(L5_3)
                L4_3 = UseParticleFxAssetNextCall
                L5_3 = "core"
                L4_3(L5_3)
                L4_3 = Config
                L4_3 = L4_3.PlantSettings
                L4_3 = L4_3.water
                L4_3 = L4_3.fxOffset
                L5_3 = Utils
                L5_3 = L5_3.RotateVector
                L6_3 = L4_3
                L7_3 = GetEntityHeading
                L8_3 = L3_1
                L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L7_3(L8_3)
                L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
                L6_3 = StartParticleFxNonLoopedOnEntity
                L7_3 = "ent_sht_water"
                L8_3 = L3_1
                L9_3 = L5_3.x
                L10_3 = L5_3.y
                L11_3 = L5_3.z
                L12_3 = 0.0
                L13_3 = 0.0
                L14_3 = 0.0
                L15_3 = 0.1
                L16_3 = false
                L17_3 = false
                L18_3 = false
                L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
              end
              L4_3 = math
              L4_3 = L4_3.min
              L5_3 = L4_2
              L5_3 = L5_3 + 1
              L6_3 = L6_1
              L4_3 = L4_3(L5_3, L6_3)
              L4_2 = L4_3
          end
        end
        else
          L4_3 = RemoveParticleFxFromEntity
          L5_3 = L3_1
          L4_3(L5_3)
        end
      end
      L0_3 = IsControlPressed
      L1_3 = 0
      L2_3 = 241
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = GetEntityRotation
        L1_3 = L3_1
        L0_3 = L0_3(L1_3)
        L1_3 = Config
        L1_3 = L1_3.PlantSettings
        L1_3 = L1_3.water
        L1_3 = L1_3.rotateOffset
        L1_3 = L0_3 + L1_3
        L2_3 = SetEntityRotation
        L3_3 = L3_1
        L4_3 = L1_3.x
        L5_3 = L1_3.y
        L6_3 = L1_3.z
        L7_3 = 2
        L8_3 = true
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
      else
        L0_3 = IsControlPressed
        L1_3 = 0
        L2_3 = 242
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = GetEntityRotation
          L1_3 = L3_1
          L0_3 = L0_3(L1_3)
          L1_3 = Config
          L1_3 = L1_3.PlantSettings
          L1_3 = L1_3.water
          L1_3 = L1_3.rotateOffset
          L1_3 = L0_3 - L1_3
          L2_3 = SetEntityRotation
          L3_3 = L3_1
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = 2
          L8_3 = true
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
        end
      end
      L0_3 = L4_2
      L1_3 = L6_1
      if L0_3 >= L1_3 then
        L0_3 = DeleteEntity
        L1_3 = L3_1
        L0_3(L1_3)
        L0_3 = nil
        L3_1 = L0_3
        L0_3 = L1_2
        L1_3 = L0_3
        L0_3 = L0_3.resolve
        L2_3 = true
        L0_3(L1_3, L2_3)
        break
      end
    end
  end
  L5_2(L6_2)
  L5_2 = Citizen
  L5_2 = L5_2.Await
  L6_2 = L1_2
  return L5_2(L6_2)
end
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = promise
  L2_2 = L2_2.new
  L2_2 = L2_2()
  L3_2 = Utils
  L3_2 = L3_2.LoadModel
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = CreateObject
  L5_2 = L3_2
  L6_2 = A0_2.x
  L7_2 = A0_2.y
  L8_2 = A0_2.z
  L9_2 = true
  L10_2 = true
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L1_1 = L4_2
  L4_2 = 0
  L7_1 = L4_2
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    while true do
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = DoesEntityExist
      L1_3 = L1_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        if L0_3 and L1_3 then
          L2_3 = SetEntityCoords
          L3_3 = L1_1
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        L2_3 = GetEntityRotation
        L3_3 = L1_1
        L2_3 = L2_3(L3_3)
        L3_3 = GetEntityCoords
        L4_3 = L1_1
        L3_3 = L3_3(L4_3)
        L4_3 = math
        L4_3 = L4_3.abs
        L5_3 = L2_3.x
        L4_3 = L4_3(L5_3)
        if L4_3 > 90.0 then
          L4_3 = math
          L4_3 = L4_3.abs
          L5_3 = L2_3.x
          L4_3 = L4_3(L5_3)
          L5_3 = 270.0
          if L4_3 < L5_3 then
            L4_3 = L3_3.xy
            L5_3 = A0_2.xy
            L4_3 = L4_3 - L5_3
            L4_3 = #L4_3
            L5_3 = 0.3
            if L4_3 < L5_3 then
              L4_3 = math
              L4_3 = L4_3.random
              L4_3 = L4_3()
              L5_3 = 0.05
              if L4_3 <= L5_3 then
                L4_3 = Utils
                L4_3 = L4_3.LoadPtfx
                L5_3 = "core"
                L4_3(L5_3)
                L4_3 = UseParticleFxAssetNextCall
                L5_3 = "core"
                L4_3(L5_3)
                L4_3 = Config
                L4_3 = L4_3.PlantSettings
                L4_3 = L4_3.fertilizer
                L4_3 = L4_3.fxOffset
                L5_3 = Utils
                L5_3 = L5_3.RotateVector
                L6_3 = L4_3
                L7_3 = GetEntityHeading
                L8_3 = L1_1
                L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L7_3(L8_3)
                L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
                L6_3 = StartParticleFxNonLoopedOnEntity
                L7_3 = "ent_col_rocks"
                L8_3 = L1_1
                L9_3 = L5_3.x
                L10_3 = L5_3.y
                L11_3 = L5_3.z
                L12_3 = 0.0
                L13_3 = 0.0
                L14_3 = 0.0
                L15_3 = 0.1
                L16_3 = false
                L17_3 = false
                L18_3 = false
                L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
              end
              L4_3 = math
              L4_3 = L4_3.min
              L5_3 = L7_1
              L5_3 = L5_3 + 1
              L6_3 = L6_1
              L4_3 = L4_3(L5_3, L6_3)
              L7_1 = L4_3
              L4_3 = L7_1
              L5_3 = L6_1
              if L4_3 == L5_3 then
                L4_3 = RemoveParticleFxFromEntity
                L5_3 = L0_1
                L4_3(L5_3)
              end
          end
        end
        else
          L4_3 = RemoveParticleFxFromEntity
          L5_3 = L1_1
          L4_3(L5_3)
        end
        L4_3 = IsControlPressed
        L5_3 = 0
        L6_3 = 241
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = GetEntityRotation
          L5_3 = L1_1
          L4_3 = L4_3(L5_3)
          L5_3 = Config
          L5_3 = L5_3.PlantSettings
          L5_3 = L5_3.fertilizer
          L5_3 = L5_3.rotateOffset
          L5_3 = L4_3 + L5_3
          L6_3 = SetEntityRotation
          L7_3 = L1_1
          L8_3 = L5_3.x
          L9_3 = L5_3.y
          L10_3 = L5_3.z
          L11_3 = 2
          L12_3 = true
          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
        else
          L4_3 = IsControlPressed
          L5_3 = 0
          L6_3 = 242
          L4_3 = L4_3(L5_3, L6_3)
          if L4_3 then
            L4_3 = GetEntityRotation
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            L5_3 = Config
            L5_3 = L5_3.PlantSettings
            L5_3 = L5_3.fertilizer
            L5_3 = L5_3.rotateOffset
            L5_3 = L4_3 + L5_3
            L6_3 = SetEntityRotation
            L7_3 = L1_1
            L8_3 = L5_3.x
            L9_3 = L5_3.y
            L10_3 = L5_3.z
            L11_3 = 2
            L12_3 = true
            L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          end
        end
      end
      L0_3 = L7_1
      L1_3 = L6_1
      if L0_3 >= L1_3 then
        L0_3 = DeleteEntity
        L1_3 = L1_1
        L0_3(L1_3)
        L0_3 = nil
        L1_1 = L0_3
        L0_3 = L2_2
        L1_3 = L0_3
        L0_3 = L0_3.resolve
        L2_3 = true
        L0_3(L1_3, L2_3)
        break
      end
    end
  end
  L4_2(L5_2)
  L4_2 = Citizen
  L4_2 = L4_2.Await
  L5_2 = L2_2
  return L4_2(L5_2)
end
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = promise
  L3_2 = L3_2.new
  L3_2 = L3_2()
  L4_2 = true
  L8_1 = L4_2
  L4_2 = false
  L9_1 = L4_2
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L10_1 = L4_2
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetEntityForwardVector
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2 * 2.0
  L7_2 = L5_2 + L7_2
  L7_2 = A0_2 or L7_2
  if not A0_2 then
    L8_2 = vector3
    L9_2 = L7_2.x
    L10_2 = L7_2.y
    L11_2 = L5_2.z
    L11_2 = L11_2 - 1.0
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L8_2
  end
  L8_2 = Utils
  L8_2 = L8_2.LoadModel
  L9_2 = "bkr_prop_weed_plantpot_stack_01b"
  L8_2 = L8_2(L9_2)
  L9_2 = CreateObject
  L10_2 = L8_2
  L11_2 = L7_2.x
  L12_2 = L7_2.y
  L13_2 = L7_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L0_1 = L9_2
  L9_2 = SetEntityHeading
  L10_2 = L0_1
  L11_2 = GetEntityHeading
  L12_2 = L4_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L11_2(L12_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  if A1_2 then
    L9_2 = SetEntityRotation
    L10_2 = L0_1
    L11_2 = A1_2.x
    L12_2 = A1_2.y
    L13_2 = A1_2.z
    L14_2 = 2
    L15_2 = true
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L9_2 = Utils
  L9_2 = L9_2.SetCanInteract
  L10_2 = false
  L9_2(L10_2)
  L9_2 = TaskTurnPedToFaceCoord
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = A0_2.x
  L12_2 = A0_2.y
  L13_2 = A0_2.z
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
  L12_2 = 1.5
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = GetEntityHeading
  L11_2 = L0_1
  L10_2 = L10_2(L11_2)
  L11_2 = Utils
  L11_2 = L11_2.RotateVector
  L12_2 = L9_2
  L13_2 = L10_2
  L11_2 = L11_2(L12_2, L13_2)
  L11_2 = L7_2 + L11_2
  L12_2 = CreateCam
  L13_2 = "DEFAULT_SCRIPTED_CAMERA"
  L14_2 = true
  L12_2 = L12_2(L13_2, L14_2)
  L5_1 = L12_2
  L12_2 = SetCamCoord
  L13_2 = L5_1
  L14_2 = L11_2.x
  L15_2 = L11_2.y
  L16_2 = L11_2.z
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = SetCamRot
  L13_2 = L5_1
  L14_2 = -30.0
  L15_2 = 0.0
  L16_2 = L10_2
  L17_2 = 2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = RenderScriptCams
  L13_2 = true
  L14_2 = false
  L15_2 = 0
  L16_2 = true
  L17_2 = true
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = CreateThread
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
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
      L0_3 = L7_1
      if L0_3 > 0 then
        L0_3 = DoesEntityExist
        L1_3 = L4_1
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          L0_3 = Utils
          L0_3 = L0_3.LoadModel
          L1_3 = "prop_pile_dirt_04"
          L0_3 = L0_3(L1_3)
          L1_3 = vector3
          L2_3 = 0.02
          L3_3 = 0.05
          L4_3 = 1.0
          L1_3 = L1_3(L2_3, L3_3, L4_3)
          L2_3 = Utils
          L2_3 = L2_3.RotateVector
          L3_3 = L1_3
          L4_3 = GetEntityHeading
          L5_3 = L0_1
          L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L4_3(L5_3)
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
          L3_3 = GetEntityCoords
          L4_3 = L0_1
          L3_3 = L3_3(L4_3)
          L3_3 = L3_3 + L2_3
          L7_2 = L3_3
          L3_3 = CreateObject
          L4_3 = L0_3
          L5_3 = L7_2.x
          L6_3 = L7_2.y
          L7_3 = L7_2.z
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
          L4_1 = L3_3
          L3_3 = SetEntityCollision
          L4_3 = L4_1
          L5_3 = false
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = Utils
          L3_3 = L3_3.SetEntityScale
          L4_3 = L4_1
          L5_3 = 0.04
          L3_3(L4_3, L5_3)
        end
      end
      L0_3 = DoesEntityExist
      L1_3 = L4_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L7_1
        L1_3 = L6_1
        L0_3 = L0_3 / L1_3
        L0_3 = L0_3 - 1.0
        L1_3 = L7_2.z
        L1_3 = L1_3 - 0.5
        L2_3 = L0_3 * 0.5
        L1_3 = L1_3 + L2_3
        L2_3 = SetEntityCoords
        L3_3 = L4_1
        L4_3 = L7_2.x
        L5_3 = L7_2.y
        L6_3 = L1_3
        L7_3 = false
        L8_3 = false
        L9_3 = false
        L10_3 = false
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      end
      L0_3 = L7_1
      if 0 == L0_3 then
        L0_3 = DoesEntityExist
        L1_3 = L4_1
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = DeleteEntity
          L1_3 = L4_1
          L0_3(L1_3)
          L0_3 = nil
          L4_1 = L0_3
        end
      end
    end
  end
  L12_2(L13_2)
  L12_2 = true
  L13_2 = Config
  L13_2 = L13_2.PlantSettings
  L13_2 = L13_2.fertilizer
  L13_2 = L13_2.model
  L14_2 = L14_1
  L15_2 = L7_2
  L16_2 = L13_2
  L14_2 = L14_2(L15_2, L16_2)
  if not L14_2 then
    return
  end
  L14_2 = CreateThread
  function L15_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    while true do
      L0_3 = L8_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = L7_1
      L1_3 = L6_1
      if L0_3 >= L1_3 then
        L0_3 = DoesEntityExist
        L1_3 = L2_1
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          L0_3 = A2_2
          if L0_3 then
            L0_3 = L0_3.budModel
          end
          if not L0_3 then
            L0_3 = "bkr_prop_weed_bud_01b"
          end
          L1_3 = Utils
          L1_3 = L1_3.LoadModel
          L2_3 = L0_3
          L1_3 = L1_3(L2_3)
          L2_3 = vector3
          L3_3 = 0.0
          L4_3 = 0.0
          L5_3 = -1.0
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L3_3 = Utils
          L3_3 = L3_3.RotateVector
          L4_3 = L2_3
          L5_3 = GetEntityHeading
          L6_3 = L0_1
          L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L5_3(L6_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          L4_3 = GetEntityCoords
          L5_3 = L0_1
          L4_3 = L4_3(L5_3)
          L4_3 = L4_3 + L3_3
          L5_3 = CreateObject
          L6_3 = L1_3
          L7_3 = L4_3.x
          L8_3 = L4_3.y
          L9_3 = L4_3.z
          L10_3 = true
          L11_3 = true
          L12_3 = false
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
          L2_1 = L5_3
        end
      end
      L0_3 = L9_1
      if not L0_3 then
        L0_3 = GetGameTimer
        L0_3 = L0_3()
        L1_3 = L10_1
        L0_3 = L0_3 - L1_3
        L1_3 = 10000
        if L0_3 > L1_3 then
          L0_3 = L7_1
          L1_3 = L6_1
          if L0_3 < L1_3 then
            L0_3 = DoesEntityExist
            L1_3 = L1_1
            L0_3 = L0_3(L1_3)
            if L0_3 then
              L0_3 = Notify
              L1_3 = _U
              L2_3 = "help_rotate_bottle"
              L1_3 = L1_3(L2_3)
              L2_3 = "inform"
              L0_3(L1_3, L2_3)
              L0_3 = Notify
              L1_3 = _U
              L2_3 = "help_pour_into_flask"
              L1_3 = L1_3(L2_3)
              L2_3 = "inform"
              L0_3(L1_3, L2_3)
          end
          else
            L0_3 = DoesEntityExist
            L1_3 = L2_1
            L0_3 = L0_3(L1_3)
            if L0_3 then
              L0_3 = Notify
              L1_3 = _U
              L2_3 = "help_plant_seed"
              L1_3 = L1_3(L2_3)
              L2_3 = "inform"
              L0_3(L1_3, L2_3)
            else
              L0_3 = DoesEntityExist
              L1_3 = L3_1
              L0_3 = L0_3(L1_3)
              if L0_3 then
                L0_3 = Notify
                L1_3 = _U
                L2_3 = "help_pour_water"
                L1_3 = L1_3(L2_3)
                L2_3 = "inform"
                L0_3(L1_3, L2_3)
              end
            end
          end
          L0_3 = true
          L9_1 = L0_3
        end
      end
      L0_3 = IsDisabledControlJustPressed
      L1_3 = 0
      L2_3 = 69
      L0_3 = L0_3(L1_3, L2_3)
      if not L0_3 then
        L0_3 = IsControlPressed
        L1_3 = 0
        L2_3 = 241
        L0_3 = L0_3(L1_3, L2_3)
        if not L0_3 then
          L0_3 = IsControlPressed
          L1_3 = 0
          L2_3 = 242
          L0_3 = L0_3(L1_3, L2_3)
          if not L0_3 then
            goto lbl_135
          end
        end
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L10_1 = L0_3
      L0_3 = false
      L9_1 = L0_3
      ::lbl_135::
      L0_3 = DoesEntityExist
      L1_3 = L2_1
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = Utils
        L0_3 = L0_3.GetMouseWorldPosition
        L0_3, L1_3 = L0_3()
        L2_3 = L12_2
        if L2_3 and L0_3 and L1_3 then
          L2_3 = SetEntityCoords
          L3_3 = L2_1
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L10_3 = false
          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        end
        L2_3 = IsDisabledControlJustPressed
        L3_3 = 0
        L4_3 = 69
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L12_2
          L2_3 = not L2_3
          L12_2 = L2_3
        end
        L2_3 = GetEntityCoords
        L3_3 = L2_1
        L2_3 = L2_3(L3_3)
        L3_3 = L7_2
        L3_3 = L2_3 - L3_3
        L3_3 = #L3_3
        L4_3 = 0.3
        if L3_3 < L4_3 then
          L3_3 = L12_2
          if not L3_3 then
            L3_3 = Wait
            L4_3 = 500
            L3_3(L4_3)
            L3_3 = DeleteEntity
            L4_3 = L2_1
            L3_3(L4_3)
            L3_3 = L13_1
            L4_3 = L7_2
            L3_3 = L3_3(L4_3)
            if L3_3 then
              L3_3 = L3_2
              L4_3 = L3_3
              L3_3 = L3_3.resolve
              L5_3 = true
              L3_3(L4_3, L5_3)
            else
              L3_3 = L3_2
              L4_3 = L3_3
              L3_3 = L3_3.resolve
              L5_3 = false
              L3_3(L4_3, L5_3)
            end
            L3_3 = L12_1
            L3_3()
            break
          end
        end
        L3_3 = Utils
        L3_3 = L3_3.ApplyGravityToEntity
        L4_3 = L2_1
        L5_3 = L7_2.z
        L5_3 = L5_3 - 0.5
        L6_3 = 5.0E-4
        L3_3(L4_3, L5_3, L6_3)
      end
    end
  end
  L14_2(L15_2)
  L14_2 = Citizen
  L14_2 = L14_2.Await
  L15_2 = L3_2
  return L14_2(L15_2)
end
L16_1 = {}
L16_1.StartWeedPlanting = L15_1
L16_1.PourWater = L13_1
L16_1.PourSubstance = L14_1
Planting = L16_1

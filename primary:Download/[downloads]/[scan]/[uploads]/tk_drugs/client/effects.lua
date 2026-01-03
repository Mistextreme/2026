local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if not A2_2 then
    A2_2 = 1.49
  end
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = SetRunSprintMultiplierForPlayer
    L1_3 = PlayerId
    L1_3 = L1_3()
    L2_3 = A2_2
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = A1_2
    L0_3(L1_3)
    L0_3 = SetRunSprintMultiplierForPlayer
    L1_3 = PlayerId
    L1_3 = L1_3()
    L2_3 = 1.0
    L0_3(L1_3, L2_3)
    L0_3 = SetPedMoveRateOverride
    L1_3 = PlayerId
    L1_3 = L1_3()
    L2_3 = 1.0
    L0_3(L1_3, L2_3)
    L0_3 = SetPedMoveRateOverride
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = 1.0
    L0_3(L1_3, L2_3)
  end
  L3_2(L4_2)
end
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = A0_2
    L0_3 = L0_3 + L1_3
    while true do
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      if not (L0_3 > L1_3) then
        break
      end
      L1_3 = RestorePlayerStamina
      L2_3 = PlayerId
      L2_3 = L2_3()
      L3_3 = 1.0
      L1_3(L2_3, L3_3)
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
  end
  L1_2(L2_2)
end
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if not A2_2 then
    A2_2 = 5
  end
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = A1_2
    L0_3 = L0_3 + L1_3
    while true do
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      if not (L0_3 > L1_3) then
        break
      end
      L1_3 = GetEntityHealth
      L2_3 = A0_2
      L1_3 = L1_3(L2_3)
      L2_3 = GetEntityMaxHealth
      L3_3 = A0_2
      L2_3 = L2_3(L3_3)
      if L1_3 < L2_3 then
        L2_3 = SetEntityHealth
        L3_3 = A0_2
        L4_3 = A2_2
        L4_3 = L1_3 + L4_3
        L2_3(L3_3, L4_3)
      end
      L2_3 = Wait
      L3_3 = 2000
      L2_3(L3_3)
    end
  end
  L3_2(L4_2)
end
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = GetPedArmour
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = SetPedArmour
  L5_2 = A0_2
  L6_2 = math
  L6_2 = L6_2.min
  L7_2 = L3_2 + A2_2
  L8_2 = 100
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = RequestAnimSet
    L1_3 = "MOVE_M@DRUNK@VERYDRUNK"
    L0_3(L1_3)
    while true do
      L0_3 = HasAnimSetLoaded
      L1_3 = "MOVE_M@DRUNK@VERYDRUNK"
      L0_3 = L0_3(L1_3)
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = SetPedMovementClipset
    L1_3 = A0_2
    L2_3 = "MOVE_M@DRUNK@VERYDRUNK"
    L3_3 = 1.0
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A1_2
    L0_3(L1_3)
    L0_3 = ResetPedMovementClipset
    L1_3 = A0_2
    L2_3 = 0
    L0_3(L1_3, L2_3)
  end
  L2_2(L3_2)
end
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "DrugsDrivingIn"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "DrugsDrivingIn"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = A0_2
    L0_3 = L0_3 + L1_3
    while true do
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      if not (L0_3 > L1_3) then
        break
      end
      L1_3 = SetSuperJumpThisFrame
      L2_3 = PlayerId
      L2_3 = L2_3()
      L1_3(L2_3)
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
  end
  L1_2(L2_2)
end
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "FocusIn"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "FocusIn"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "DrugsMichaelAliensFightIn"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "DrugsMichaelAliensFightIn"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "Rampage"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "Rampage"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L10_1()
  local L0_2, L1_2, L2_2
  L0_2 = ShakeGameplayCam
  L1_2 = "MEDIUM_EXPLOSION_SHAKE"
  L2_2 = 1.0
  L0_2(L1_2, L2_2)
end
function L11_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "PeyoteIn"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "PeyoteIn"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L12_1(A0_2)
  local L1_2, L2_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = AnimpostfxPlay
    L1_3 = "DMT_flight_intro"
    L2_3 = A0_2
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = AnimpostfxStop
    L1_3 = "DMT_flight_intro"
    L0_3(L1_3)
  end
  L1_2(L2_2)
end
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = Wait
  L1_2 = 2500
  L0_2(L1_2)
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = 2
  L3_2 = AddExplosion
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L7_2 = L2_2
  L8_2 = 1.0
  L9_2 = true
  L10_2 = false
  L11_2 = 1.0
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = Config
    L9_2 = L9_2.EffectDurations
    L9_2 = L9_2[L8_2]
    if not L9_2 then
      L9_2 = 60000
    end
    L10_2 = Config
    L10_2 = L10_2.EffectAmounts
    if L10_2 then
      L10_2 = Config
      L10_2 = L10_2.EffectAmounts
      if L10_2 then
        L10_2 = L10_2[L8_2]
      end
      if L10_2 then
        goto lbl_25
      end
    end
    L10_2 = 1
    ::lbl_25::
    if "RunningSpeedIncrease" == L8_2 then
      L11_2 = L0_1
      L12_2 = L2_2
      L13_2 = L9_2
      L14_2 = L10_2
      L11_2(L12_2, L13_2, L14_2)
    elseif "InfiniteStamina" == L8_2 then
      L11_2 = L1_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "HealthRegen" == L8_2 then
      L11_2 = L2_1
      L12_2 = L2_2
      L13_2 = L9_2
      L14_2 = L10_2
      L11_2(L12_2, L13_2, L14_2)
    elseif "ArmorBoost" == L8_2 then
      L11_2 = L3_1
      L12_2 = L2_2
      L13_2 = L9_2
      L14_2 = L10_2
      L11_2(L12_2, L13_2, L14_2)
    elseif "DrunkEffect" == L8_2 then
      L11_2 = L4_1
      L12_2 = L2_2
      L13_2 = L9_2
      L11_2(L12_2, L13_2)
    elseif "BlurredVision" == L8_2 then
      L11_2 = L5_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "SuperJump" == L8_2 then
      L11_2 = L6_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "FocusEffect" == L8_2 then
      L11_2 = L7_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "FogEffect" == L8_2 then
      L11_2 = L8_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "ConfusionEffect" == L8_2 then
      L11_2 = L9_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "CameraShake" == L8_2 then
      L11_2 = L10_1
      L11_2()
    elseif "WhiteoutEffect" == L8_2 then
      L11_2 = L11_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "IntenseEffect" == L8_2 then
      L11_2 = L12_1
      L12_2 = L9_2
      L11_2(L12_2)
    elseif "ExplosiveEffect" == L8_2 then
      L11_2 = L13_1
      L11_2()
    else
      L11_2 = DoCustomDrugEffect
      L12_2 = L8_2
      L11_2(L12_2)
    end
  end
  L3_2 = DrugConsumed
  L4_2 = A1_2
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
end
L15_1 = RegisterNetEvent
L16_1 = "tk_drugs:applyEffects"
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Config
  L1_2 = L1_2.Drugs
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = L1_2.animation
  if "pill" == L3_2 then
    L3_2 = Utils
    L3_2 = L3_2.LoadDict
    L4_2 = "mp_suicide"
    L3_2(L4_2)
    L3_2 = TaskPlayAnim
    L4_2 = L2_2
    L5_2 = "mp_suicide"
    L6_2 = "pill"
    L7_2 = 3.0
    L8_2 = 3.0
    L9_2 = 2000
    L10_2 = 48
    L11_2 = 0
    L12_2 = false
    L13_2 = false
    L14_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L3_2 = Wait
    L4_2 = 3000
    L3_2(L4_2)
  else
    L3_2 = L1_2.animation
    if "sniff" == L3_2 then
      L3_2 = Utils
      L3_2 = L3_2.LoadDict
      L4_2 = "anim@mp_player_intcelebrationmale@face_palm"
      L3_2(L4_2)
      L3_2 = TaskPlayAnim
      L4_2 = L2_2
      L5_2 = "anim@mp_player_intcelebrationmale@face_palm"
      L6_2 = "face_palm"
      L7_2 = 3.0
      L8_2 = 3.0
      L9_2 = 3000
      L10_2 = 48
      L11_2 = 0
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L3_2 = Wait
      L4_2 = 3000
      L3_2(L4_2)
    else
      L3_2 = L1_2.animation
      if "blunt" == L3_2 then
        L3_2 = Utils
        L3_2 = L3_2.LoadDict
        L4_2 = "amb@world_human_smoking_pot@female@base"
        L3_2(L4_2)
        L3_2 = TaskPlayAnim
        L4_2 = L2_2
        L5_2 = "amb@world_human_smoking_pot@female@base"
        L6_2 = "base"
        L7_2 = 3.0
        L8_2 = 3.0
        L9_2 = 3000
        L10_2 = 48
        L11_2 = 0
        L12_2 = false
        L13_2 = false
        L14_2 = false
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        L3_2 = Wait
        L4_2 = 3000
        L3_2(L4_2)
      end
    end
  end
  L3_2 = L14_1
  L4_2 = L1_2.effects
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
end
L15_1(L16_1, L17_1)
L15_1 = AddEventHandler
L16_1 = "onResourceStop"
function L17_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = AnimpostfxStop
    L2_2 = "FocusIn"
    L1_2(L2_2)
    L1_2 = AnimpostfxStop
    L2_2 = "DrugsDrivingIn"
    L1_2(L2_2)
    L1_2 = AnimpostfxStop
    L2_2 = "DrugsMichaelAliensFightIn"
    L1_2(L2_2)
    L1_2 = AnimpostfxStop
    L2_2 = "Rampage"
    L1_2(L2_2)
    L1_2 = AnimpostfxStop
    L2_2 = "PeyoteIn"
    L1_2(L2_2)
    L1_2 = AnimpostfxStop
    L2_2 = "DMT_flight_intro"
    L1_2(L2_2)
    L1_2 = ResetPedMovementClipset
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = 0
    L1_2(L2_2, L3_2)
    L1_2 = SetPedMoveRateOverride
    L2_2 = PlayerId
    L2_2 = L2_2()
    L3_2 = 1.0
    L1_2(L2_2, L3_2)
    L1_2 = SetRunSprintMultiplierForPlayer
    L2_2 = PlayerId
    L2_2 = L2_2()
    L3_2 = 1.0
    L1_2(L2_2, L3_2)
  end
end
L15_1(L16_1, L17_1)

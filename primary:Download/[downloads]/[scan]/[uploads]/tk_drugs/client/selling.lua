local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = nil
L1_1 = nil
L2_1 = false
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = GetEntityCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityHeading
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = Utils
  L3_2 = L3_2.RotateVector
  L4_2 = vector3
  L5_2 = 0.0
  L6_2 = 1.0
  L7_2 = 0.55
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L1_2 + L3_2
  L5_2 = CreateCam
  L6_2 = "DEFAULT_SCRIPTED_CAMERA"
  L7_2 = true
  L5_2 = L5_2(L6_2, L7_2)
  L1_1 = L5_2
  L5_2 = SetCamCoord
  L6_2 = L1_1
  L7_2 = L4_2.x
  L8_2 = L4_2.y
  L9_2 = L4_2.z
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = vector3
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = 0.7
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L5_2 = L1_2 + L5_2
  L6_2 = PointCamAtCoord
  L7_2 = L1_1
  L8_2 = L5_2.x
  L9_2 = L5_2.y
  L10_2 = L5_2.z
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = SetCamUseShallowDofMode
  L7_2 = L1_1
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = SetCamNearDof
  L7_2 = L1_1
  L8_2 = 0.3
  L6_2(L7_2, L8_2)
  L6_2 = SetCamFarDof
  L7_2 = L1_1
  L8_2 = 2.0
  L6_2(L7_2, L8_2)
  L6_2 = SetCamDofStrength
  L7_2 = L1_1
  L8_2 = 0.8
  L6_2(L7_2, L8_2)
  L6_2 = RenderScriptCams
  L7_2 = true
  L8_2 = true
  L9_2 = 500
  L10_2 = true
  L11_2 = true
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = true
    L3_2 = 500
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L1_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = nil
    L1_1 = L0_2
  end
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L2_2 = TriggerCallback
  L3_2 = "tk_drugs:hasPedBeenSoldTo"
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L1_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L5_2 = PedToNet
  L6_2 = A0_2
  L5_2, L6_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Citizen
  L2_2 = L2_2.Await
  L3_2 = L1_2
  return L2_2(L3_2)
end
function L6_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = promise
  L0_2 = L0_2.new
  L0_2 = L0_2()
  L1_2 = TriggerCallback
  L2_2 = "tk_drugs:getPoliceAmount"
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = Config
    L1_3 = L1_3.DebugMode
    if L1_3 then
      L1_3 = print
      L2_3 = "police count"
      L3_3 = A0_3
      L4_3 = Config
      L4_3 = L4_3.Selling
      L4_3 = L4_3.minPolice
      L5_3 = Config
      L5_3 = L5_3.Selling
      L5_3 = L5_3.minPolice
      L5_3 = A0_3 >= L5_3
      L1_3(L2_3, L3_3, L4_3, L5_3)
    end
    L1_3 = L0_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = Config
    L3_3 = L3_3.Selling
    L3_3 = L3_3.minPolice
    L3_3 = A0_3 >= L3_3
    L1_3(L2_3, L3_3)
  end
  L1_2(L2_2, L3_2)
  L1_2 = Citizen
  L1_2 = L1_2.Await
  L2_2 = L0_2
  return L1_2(L2_2)
end
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "start selling"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = L5_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = Notify
    L2_2 = _U
    L3_2 = "already_sold_drugs"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "checking if enough police"
    L3_2 = Config
    L3_2 = L3_2.Selling
    L3_2 = L3_2.minPolice
    L1_2(L2_2, L3_2)
  end
  L1_2 = L6_1
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = Config
    L1_2 = L1_2.DebugMode
    if L1_2 then
      L1_2 = print
      L2_2 = "not enough police"
      L1_2(L2_2)
    end
    L1_2 = Notify
    L2_2 = _U
    L3_2 = "not_enough_police"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "enough police"
    L1_2(L2_2)
  end
  L1_2 = L2_1
  if L1_2 then
    return
  end
  L1_2 = true
  L2_1 = L1_2
  L0_1 = A0_2
  L1_2 = L3_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = SetEntityAsMissionEntity
  L2_2 = A0_2
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetBlockingOfNonTemporaryEvents
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCanPlayAmbientAnims
  L2_2 = A0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCanRagdoll
  L2_2 = A0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityInvincible
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = ClearPedTasks
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = FreezeEntityPosition
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = TaskStandStill
  L2_2 = A0_2
  L3_2 = -1
  L1_2(L2_2, L3_2)
  L1_2 = PlayPedAmbientSpeechNative
  L2_2 = A0_2
  L3_2 = "Generic_Hows_It_Going"
  L4_2 = "Speech_Params_Force"
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = TaskTurnPedToFaceEntity
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = 500
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = TriggerServerEvent
  L3_2 = "tk_drugs:addPed"
  L4_2 = PedToNet
  L5_2 = L0_1
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = Utils
  L2_2 = L2_2.OpenUI
  L3_2 = "selling"
  L2_2(L3_2)
end
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = {}
  L1_2 = Utils
  L1_2 = L1_2.Debug
  L2_2 = "GetCustomerFavoriteEffects"
  L1_2(L2_2)
  L1_2 = 1
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 1
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = Utils
    L5_2 = L5_2.Debug
    L6_2 = "get customer favorite effects"
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = 1
    L7_2 = Config
    L7_2 = L7_2.Selling
    L7_2 = L7_2.items
    L7_2 = #L7_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = Utils
    L6_2 = L6_2.Debug
    L7_2 = "drugType"
    L8_2 = L5_2
    L9_2 = Config
    L9_2 = L9_2.Selling
    L9_2 = L9_2.items
    L9_2 = L9_2[L5_2]
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = Config
    L6_2 = L6_2.Selling
    L6_2 = L6_2.items
    L6_2 = L6_2[L5_2]
    if not L6_2 then
      L6_2 = print
      L7_2 = "WARNING: drugType not found"
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
    else
      L6_2 = Utils
      L6_2 = L6_2.Debug
      L7_2 = "Config.Selling.items[drugType].name"
      L8_2 = Config
      L8_2 = L8_2.Selling
      L8_2 = L8_2.items
      L8_2 = L8_2[L5_2]
      L8_2 = L8_2.name
      L6_2(L7_2, L8_2)
      L6_2 = Config
      L6_2 = L6_2.Drugs
      L7_2 = Config
      L7_2 = L7_2.Selling
      L7_2 = L7_2.items
      L7_2 = L7_2[L5_2]
      L7_2 = L7_2.name
      L6_2 = L6_2[L7_2]
      L7_2 = Utils
      L7_2 = L7_2.Debug
      L8_2 = "drug"
      L9_2 = L6_2
      L10_2 = type
      L11_2 = L6_2
      if L11_2 then
        L11_2 = L11_2.effects
      end
      L10_2 = L10_2(L11_2)
      L10_2 = next
      L11_2 = L6_2.effects
      L10_2 = "table" == L10_2 and L10_2
      L7_2(L8_2, L9_2, L10_2)
      L7_2 = type
      L8_2 = L6_2
      if L8_2 then
        L8_2 = L8_2.effects
      end
      L7_2 = L7_2(L8_2)
      if "table" == L7_2 then
        L7_2 = next
        L8_2 = L6_2.effects
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = math
          L7_2 = L7_2.random
          L8_2 = 1
          L9_2 = L6_2.effects
          L9_2 = #L9_2
          L7_2 = L7_2(L8_2, L9_2)
          L8_2 = table
          L8_2 = L8_2.insert
          L9_2 = L0_2
          L10_2 = L6_2.effects
          L10_2 = L10_2[L7_2]
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
  L1_2 = Utils
  L1_2 = L1_2.Debug
  L2_2 = "effects"
  L3_2 = L0_2
  L1_2(L2_2, L3_2)
  return L0_2
end
L9_1 = {}
L10_1 = RegisterNUICallback
L11_1 = "getSellingData"
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = "Local"
  L3_2 = Utils
  L3_2 = L3_2.Debug
  L4_2 = "getSellingData"
  L3_2(L4_2)
  L3_2 = GetPlayerDrugs
  L3_2 = L3_2()
  L4_2 = Utils
  L4_2 = L4_2.Debug
  L5_2 = "drugs"
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = L0_1
  if L4_2 then
    L5_2 = L0_1
    L4_2 = L9_1
    L4_2 = L4_2[L5_2]
    if L4_2 then
      goto lbl_23
    end
  end
  L4_2 = L8_1
  L4_2 = L4_2()
  ::lbl_23::
  L5_2 = Utils
  L5_2 = L5_2.Debug
  L6_2 = "favoriteEffects"
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = Utils
  L5_2 = L5_2.Debug
  L6_2 = "activePed"
  L7_2 = L0_1
  L5_2(L6_2, L7_2)
  L5_2 = L0_1
  if L5_2 then
    L6_2 = L0_1
    L5_2 = L9_1
    L5_2[L6_2] = L4_2
  end
  L5_2 = Utils
  L5_2 = L5_2.Debug
  L6_2 = "cb"
  L7_2 = {}
  L7_2.drugs = L3_2
  L7_2.pedName = L2_2
  L7_2.favoriteEffects = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = A1_2
  L6_2 = {}
  L6_2.drugs = L3_2
  L6_2.pedName = L2_2
  L6_2.favoriteEffects = L4_2
  L5_2(L6_2)
end
L10_1(L11_1, L12_1)
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L2_1
  if not L0_2 then
    return
  end
  L0_2 = DoesEntityExist
  L1_2 = L0_1
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = FreezeEntityPosition
    L1_2 = L0_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = ClearPedTasksImmediately
    L1_2 = L0_1
    L0_2(L1_2)
    L0_2 = TaskWanderStandard
    L1_2 = L0_1
    L2_2 = 10.0
    L3_2 = 10
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = SetBlockingOfNonTemporaryEvents
    L1_2 = L0_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = SetPedCanPlayAmbientAnims
    L1_2 = L0_1
    L2_2 = true
    L0_2(L1_2, L2_2)
    L0_2 = SetPedCanRagdoll
    L1_2 = L0_1
    L2_2 = true
    L0_2(L1_2, L2_2)
    L0_2 = SetEntityInvincible
    L1_2 = L0_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = SetEntityAsNoLongerNeeded
    L1_2 = L0_1
    L0_2(L1_2)
  end
  L0_2 = Utils
  L0_2 = L0_2.CloseUI
  L0_2()
  L0_2 = L4_1
  L0_2()
  L0_2 = false
  L2_1 = L0_2
  L0_2 = nil
  L0_1 = L0_2
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = IsPedAPlayer
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = IsPedDeadOrDying
  L3_2 = A0_2
  L4_2 = true
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = IsPedInAnyVehicle
  L3_2 = A0_2
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = IsEntityAMissionEntity
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = GetPedType
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = CanSellDrugs
  L3_2 = A0_2
  L2_2 = A0_2 ~= L1_2 and L2_2
  return L2_2
end
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  L3_2 = math
  L3_2 = L3_2.huge
  L4_2 = ipairs
  L5_2 = GetGamePool
  L6_2 = "CPed"
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2)
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L11_1
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L10_2 = GetEntityCoords
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      L11_2 = L1_2 - L10_2
      L11_2 = #L11_2
      if L3_2 > L11_2 then
        L3_2 = L11_2
        L2_2 = L9_2
      end
    end
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end
L13_1 = nil
L14_1 = math
L14_1 = L14_1.huge
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Config
  L2_2 = L2_2.Selling
  L2_2 = L2_2.items
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L3_2 = L2_2.baseChance
    if L3_2 then
      goto lbl_11
    end
  end
  L3_2 = 85
  ::lbl_11::
  if L2_2 then
    L4_2 = L2_2.maxAmount
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = 10
  ::lbl_17::
  L5_2 = math
  L5_2 = L5_2.min
  L6_2 = 1
  L7_2 = A1_2 / L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = math
  L6_2 = L6_2.max
  L7_2 = 1
  L8_2 = math
  L8_2 = L8_2.floor
  L9_2 = L5_2 * 30
  L9_2 = L3_2 - L9_2
  L8_2, L9_2 = L8_2(L9_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  return L6_2
end
function L16_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = RequestModel
  L5_2 = A0_2
  L4_2(L5_2)
  while true do
    L4_2 = HasModelLoaded
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
  end
  L4_2 = CreateObject
  L5_2 = A0_2
  L6_2 = A1_2.x
  L7_2 = A1_2.y
  L8_2 = A1_2.z
  L9_2 = A3_2
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = SetEntityHeading
  L6_2 = L4_2
  L7_2 = A2_2
  L5_2(L6_2, L7_2)
  L5_2 = SetModelAsNoLongerNeeded
  L6_2 = A0_2
  L5_2(L6_2)
  return L4_2
end
SpawnProp = L16_1
function L16_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L7_2 = RequestAnimDict
  L8_2 = A1_2
  L7_2(L8_2)
  while true do
    L7_2 = HasAnimDictLoaded
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      break
    end
    L7_2 = Wait
    L8_2 = 0
    L7_2(L8_2)
  end
  L7_2 = TaskPlayAnim
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = 4.0
  L12_2 = 4.0
  L13_2 = A3_2
  L14_2 = A4_2
  L15_2 = A5_2
  L16_2 = false
  L17_2 = false
  L18_2 = false
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  if not A6_2 then
    return
  end
  L7_2 = FreezeEntityPosition
  L8_2 = A0_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = L7_2 + A6_2
  L9_2 = {}
  L10_2 = 73
  L11_2 = 105
  L12_2 = 120
  L13_2 = 186
  L14_2 = 48
  L15_2 = 20
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L9_2[6] = L15_2
  L10_2 = CreateThread
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L8_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = ipairs
      L1_3 = L9_2
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = DisableControlAction
        L7_3 = 0
        L8_3 = L5_3
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
      end
      L0_3 = IsEntityPlayingAnim
      L1_3 = A0_2
      L2_3 = A1_2
      L3_3 = A2_2
      L4_3 = 3
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      if not L0_3 then
        L0_3 = TaskPlayAnim
        L1_3 = A0_2
        L2_3 = A1_2
        L3_3 = A2_2
        L4_3 = 4.0
        L5_3 = 4.0
        L6_3 = A3_2
        L7_3 = A4_2
        L8_3 = A5_2
        L9_3 = false
        L10_3 = false
        L11_3 = false
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = FreezeEntityPosition
    L1_3 = A0_2
    L2_3 = false
    L0_3(L1_3, L2_3)
  end
  L10_2(L11_2)
end
PlayAnim = L16_1
function L16_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = CanSellDrug
  L5_2 = L0_1
  L6_2 = A0_2
  L7_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if not L4_2 then
    L4_2 = L10_1
    L4_2()
    return
  end
  L4_2 = Utils
  L4_2 = L4_2.CloseUI
  L4_2()
  L4_2 = L4_1
  L4_2()
  L4_2 = FreezeEntityPosition
  L5_2 = L0_1
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = L15_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = math
  L5_2 = L5_2.random
  L6_2 = 100
  L5_2 = L5_2(L6_2)
  if L4_2 >= L5_2 then
    L6_2 = DoDrugSale
    L7_2 = L0_1
    L8_2 = A0_2
    L9_2 = A1_2
    L10_2 = A2_2
    L11_2 = A3_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    if not L6_2 then
      L6_2 = L10_1
      L6_2()
      return
    end
    L6_2 = TriggerServerEvent
    L7_2 = "tk_drugs:sellDrugs"
    L8_2 = A0_2
    L9_2 = A1_2
    L10_2 = A2_2
    L11_2 = A3_2
    L12_2 = PedToNet
    L13_2 = L0_1
    L12_2, L13_2 = L12_2(L13_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L6_2 = math
    L6_2 = L6_2.random
    L6_2 = L6_2()
    L7_2 = Config
    L7_2 = L7_2.Selling
    L7_2 = L7_2.policeChance
    L7_2 = L7_2.success
    L7_2 = L7_2 / 100
    if L6_2 <= L7_2 then
      L6_2 = PlayPedAmbientSpeechNative
      L7_2 = L0_1
      L8_2 = "Generic_Call_911"
      L9_2 = "Speech_Params_Force"
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = AlertPolice
      L7_2 = GetEntityCoords
      L8_2 = PlayerPedId
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2()
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  else
    L6_2 = PlayPedAmbientSpeechNative
    L7_2 = L0_1
    L8_2 = "Generic_Insult_High"
    L9_2 = "Speech_Params_Force"
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = Notify
    L7_2 = _U
    L8_2 = "drug_sale_failure"
    L7_2 = L7_2(L8_2)
    L8_2 = "error"
    L6_2(L7_2, L8_2)
    L6_2 = math
    L6_2 = L6_2.random
    L6_2 = L6_2()
    L7_2 = Config
    L7_2 = L7_2.Selling
    L7_2 = L7_2.policeChance
    L7_2 = L7_2.failure
    L7_2 = L7_2 / 100
    if L6_2 <= L7_2 then
      L6_2 = PlayPedAmbientSpeechNative
      L7_2 = L0_1
      L8_2 = "Generic_Call_911"
      L9_2 = "Speech_Params_Force"
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = AlertPolice
      L7_2 = GetEntityCoords
      L8_2 = PlayerPedId
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2()
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  end
  L6_2 = L10_1
  L6_2()
end
L17_1 = RegisterNUICallback
L18_1 = "sellDrugs"
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2.drugName
  L3_2 = A0_2.amount
  L4_2 = A0_2.expectedPrice
  L5_2 = A0_2.favoriteEffects
  L6_2 = L16_1
  L7_2 = L2_2
  L8_2 = L3_2
  L9_2 = L4_2
  L10_2 = L5_2
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = A1_2
  L7_2 = {}
  L6_2(L7_2)
end
L17_1(L18_1, L19_1)
L17_1 = RegisterNUICallback
L18_1 = "cancelSelling"
function L19_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L10_1
  L2_2()
  L2_2 = A1_2
  L3_2 = {}
  L2_2(L3_2)
end
L17_1(L18_1, L19_1)
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Selling
  L1_2 = L1_2.items
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = GetItemAmount
    L7_2 = L5_2.name
    L6_2 = L6_2(L7_2)
    if L6_2 > 0 then
      L7_2 = true
      return L7_2
    end
  end
  L0_2 = false
  return L0_2
end
function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = Config
  L0_2 = L0_2.Target
  if "none" == L0_2 then
    L0_2 = CreateThread
    function L1_2()
      local L0_3, L1_3, L2_3
      while true do
        L0_3 = Wait
        L1_3 = 1000
        L0_3(L1_3)
        L0_3 = L2_1
        if not L0_3 then
          L0_3 = L12_1
          L0_3, L1_3 = L0_3()
          if L0_3 then
            L2_3 = Config
            L2_3 = L2_3.Selling
            L2_3 = L2_3.interactionDistance
            if L1_3 < L2_3 then
              L2_3 = L17_1
              L2_3 = L2_3()
              if L2_3 then
                L13_1 = L0_3
                L14_1 = L1_3
            end
          end
          else
            L2_3 = nil
            L13_1 = L2_3
            L2_3 = math
            L2_3 = L2_3.huge
            L14_1 = L2_3
          end
        end
      end
    end
    L0_2(L1_2)
    L0_2 = CreateThread
    function L1_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      while true do
        L0_3 = Wait
        L1_3 = 0
        L0_3(L1_3)
        L0_3 = L2_1
        if not L0_3 then
          L0_3 = L13_1
          if L0_3 then
            L0_3 = IsPauseMenuActive
            L0_3 = L0_3()
            if not L0_3 then
              L0_3 = GetEntityCoords
              L1_3 = L13_1
              L0_3 = L0_3(L1_3)
              L1_3 = Draw3DText
              L2_3 = L0_3
              L3_3 = _U
              L4_3 = "interact_button"
              L3_3 = L3_3(L4_3)
              L4_3 = _U
              L5_3 = "sell_drugs"
              L4_3 = L4_3(L5_3)
              L3_3 = L3_3 .. L4_3
              L1_3(L2_3, L3_3)
              L1_3 = IsControlJustPressed
              L2_3 = 0
              L3_3 = Config
              L3_3 = L3_3.Controls
              L3_3 = L3_3.interact
              L1_3 = L1_3(L2_3, L3_3)
              if L1_3 then
                L1_3 = L7_1
                L2_3 = L13_1
                L1_3(L2_3)
              end
            end
          end
        end
      end
    end
    L0_2(L1_2)
  end
  L0_2 = Config
  L0_2 = L0_2.Target
  if "none" ~= L0_2 then
    L0_2 = AddGlobalPed
    L1_2 = {}
    L2_2 = {}
    L2_2.name = "sell_drugs"
    L3_2 = _U
    L4_2 = "sell_drugs"
    L3_2 = L3_2(L4_2)
    L2_2.label = L3_2
    L2_2.icon = "fas fa-dollar-sign"
    function L3_2(A0_3)
      local L1_3, L2_3
      L1_3 = L11_1
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = L17_1
        L1_3 = L1_3()
      end
      return L1_3
    end
    L2_2.canInteract = L3_2
    L3_2 = Config
    L3_2 = L3_2.Selling
    L3_2 = L3_2.interactionDistance
    L2_2.distance = L3_2
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = type
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      if "table" == L1_3 then
        L1_3 = A0_3.entity
        if L1_3 then
          goto lbl_10
        end
      end
      L1_3 = A0_3
      ::lbl_10::
      L2_3 = L7_1
      L3_3 = L1_3
      L2_3(L3_3)
    end
    L2_2.onSelect = L3_2
    L1_2[1] = L2_2
    L0_2(L1_2)
  end
end
L19_1 = {}
L19_1.Init = L18_1
L19_1.EndSelling = L10_1
Selling = L19_1

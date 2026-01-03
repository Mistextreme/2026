local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = {}
L1_1 = nil
L2_1 = nil
L3_1 = false
L4_1 = false
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = CanPlaceLamp
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = Config
  L3_2 = L3_2.Lamps
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.model
  L2_2.model = L3_2
  L3_2 = vec3
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = 0.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2.offset = L3_2
  L1_2[1] = L2_2
  L2_2 = {}
  L3_2 = Utils
  L3_2 = L3_2.SetCanInteract
  L4_2 = false
  L3_2(L4_2)
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = Utils
    L9_2 = L9_2.RotateVector
    L10_2 = vec3
    L11_2 = 0.0
    L12_2 = 0.5
    L13_2 = 0.0
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = L8_2.rotation
    L11_2 = L11_2.z
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = L8_2.coords
    L10_2 = L10_2 + L9_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L2_2
    L13_2 = {}
    L13_2.coords = L10_2
    L13_2.id = L7_2
    L11_2(L12_2, L13_2)
    L11_2 = Utils
    L11_2 = L11_2.RotateVector
    L12_2 = vec3
    L13_2 = 0.0
    L14_2 = -0.5
    L15_2 = 0.0
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L13_2 = L8_2.rotation
    L13_2 = L13_2.z
    L11_2 = L11_2(L12_2, L13_2)
    L9_2 = L11_2
    L11_2 = L8_2.coords
    L10_2 = L11_2 + L9_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L2_2
    L13_2 = {}
    L13_2.coords = L10_2
    L13_2.id = L7_2
    L11_2(L12_2, L13_2)
    L11_2 = Utils
    L11_2 = L11_2.RotateVector
    L12_2 = vec3
    L13_2 = 0.5
    L14_2 = 0.0
    L15_2 = 0.0
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L13_2 = L8_2.rotation
    L13_2 = L13_2.z
    L11_2 = L11_2(L12_2, L13_2)
    L9_2 = L11_2
    L11_2 = L8_2.coords
    L10_2 = L11_2 + L9_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L2_2
    L13_2 = {}
    L13_2.coords = L10_2
    L13_2.id = L7_2
    L11_2(L12_2, L13_2)
    L11_2 = Utils
    L11_2 = L11_2.RotateVector
    L12_2 = vec3
    L13_2 = -0.5
    L14_2 = 0.0
    L15_2 = 0.0
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L13_2 = L8_2.rotation
    L13_2 = L13_2.z
    L11_2 = L11_2(L12_2, L13_2)
    L9_2 = L11_2
    L11_2 = L8_2.coords
    L10_2 = L11_2 + L9_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L2_2
    L13_2 = {}
    L13_2.coords = L10_2
    L13_2.id = L7_2
    L11_2(L12_2, L13_2)
  end
  L3_2 = StartPlacingEquipment
  L4_2 = Config
  L4_2 = L4_2.Lamps
  L4_2 = L4_2[A0_2]
  L3_2(L4_2)
  L3_2 = Utils
  L3_2 = L3_2.StartPlacingObject
  L4_2 = L1_2
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L3_3 = Utils
    L3_3 = L3_3.SetCanInteract
    L4_3 = true
    L3_3(L4_3)
    L3_3 = StopPlacingEquipment
    L4_3 = Config
    L4_3 = L4_3.Lamps
    L5_3 = A0_2
    L4_3 = L4_3[L5_3]
    L3_3(L4_3)
    if not A0_3 then
      return
    end
    if not A2_3 then
      L3_3 = Config
      L3_3 = L3_3.PlaceLampsAnywhere
      if not L3_3 then
        L3_3 = Notify
        L4_3 = _U
        L5_3 = "no_plant_nearby"
        L4_3 = L4_3(L5_3)
        L5_3 = "error"
        L3_3(L4_3, L5_3)
        return
      end
    end
    L3_3 = Utils
    L3_3 = L3_3.IsInDisabledArea
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L3_3 = Notify
      L4_3 = _U
      L5_3 = "disabled_area"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L3_3(L4_3, L5_3)
      return
    end
    L3_3 = DoProgress
    L4_3 = Config
    L4_3 = L4_3.Anims
    L4_3 = L4_3.place
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      return
    end
    L3_3 = TriggerServerEvent
    L4_3 = "tk_drugs:placeLamp"
    L5_3 = A0_2
    L6_3 = A0_3
    L7_3 = A1_3
    L8_3 = A2_3
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
  end
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L6_1 = RegisterNetEvent
L7_1 = "tk_drugs:placeLamp"
function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = L5_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L6_1(L7_1, L8_1)
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Config
  L2_2 = L2_2.Lamps
  L3_2 = A1_2.configIndex
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    return
  end
  L3_2 = {}
  L4_2 = {}
  L5_2 = L2_2.model
  L4_2.model = L5_2
  L5_2 = A1_2.coords
  L4_2.coords = L5_2
  L5_2 = L2_2.offset
  L4_2.offset = L5_2
  L5_2 = A1_2.rotation
  L4_2.rotation = L5_2
  L3_2[1] = L4_2
  L4_2 = Zones
  L4_2 = L4_2.AddZone
  L5_2 = {}
  L6_2 = "lamp_"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L5_2.name = L6_2
  L6_2 = vec3
  L7_2 = A1_2.coords
  L7_2 = L7_2.x
  L8_2 = A1_2.coords
  L8_2 = L8_2.y
  L9_2 = A1_2.coords
  L9_2 = L9_2.z
  L9_2 = L9_2 + 1.0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2.coords = L6_2
  L5_2.objs = L3_2
  L6_2 = GetObjectBucket
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L5_2.bucket = L6_2
  L6_2 = Config
  L6_2 = L6_2.Controls
  L6_2 = L6_2.remove
  if L6_2 then
    function L6_2()
      local L0_3, L1_3, L2_3
      L0_3 = CanRemoveLamp
      L1_3 = A1_2
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        return
      end
      L0_3 = DoProgress
      L1_3 = Config
      L1_3 = L1_3.Anims
      L1_3 = L1_3.remove
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        return
      end
      L0_3 = TriggerServerEvent
      L1_3 = "tk_drugs:removeLamp"
      L2_3 = A0_2
      L0_3(L1_3, L2_3)
    end
  end
  L5_2.onRemove = L6_2
  L4_2(L5_2)
end
L7_1 = RegisterNetEvent
L8_1 = "tk_drugs:addLamp"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.Lamps
  L3_2 = A1_2.configIndex
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    return
  end
  L3_2 = L6_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "tk_drugs:removeLamp"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Zones
  L1_2 = L1_2.GetZone
  L2_2 = "lamp_"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = Zones
    L2_2 = L2_2.RemoveZone
    L3_2 = "lamp_"
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
  L2_2 = lamps
  L2_2[A0_2] = nil
end
L7_1(L8_1, L9_1)
function L7_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = promise
  L0_2 = L0_2.new
  L0_2 = L0_2()
  L1_2 = TriggerCallback
  L2_2 = "tk_drugs:getLamps"
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L1_2(L2_2, L3_2)
  L1_2 = Citizen
  L1_2 = L1_2.Await
  L2_2 = L0_2
  return L1_2(L2_2)
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = CanPlacePlant
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = {}
  L2_2 = {}
  L2_2.model = -1461730529
  L3_2 = vec3
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = 0.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2.offset = L3_2
  L1_2[1] = L2_2
  L2_2 = StartPlacingEquipment
  L3_2 = Config
  L3_2 = L3_2.Plants
  L3_2 = L3_2[A0_2]
  L2_2(L3_2)
  L2_2 = Utils
  L2_2 = L2_2.StartPlacingObject
  L3_2 = L1_2
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = StopPlacingEquipment
    L3_3 = Config
    L3_3 = L3_3.Plants
    L4_3 = A0_2
    L3_3 = L3_3[L4_3]
    L2_3(L3_3)
    if not A0_3 then
      return
    end
    L2_3 = CanPlacePlant
    L3_3 = A0_2
    L4_3 = A0_3
    L5_3 = L0_1
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    if not L2_3 then
      return
    end
    L2_3 = Utils
    L2_3 = L2_3.IsInDisabledArea
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L2_3 = Notify
      L3_3 = _U
      L4_3 = "disabled_area"
      L3_3 = L3_3(L4_3)
      L4_3 = "error"
      L2_3(L3_3, L4_3)
      return
    end
    L2_3 = DoProgress
    L3_3 = Config
    L3_3 = L3_3.Anims
    L3_3 = L3_3.place
    L2_3 = L2_3(L3_3)
    if not L2_3 then
      return
    end
    L2_3 = Planting
    L2_3 = L2_3.StartWeedPlanting
    L3_3 = A0_3
    L4_3 = A1_3
    L5_3 = Config
    L5_3 = L5_3.Plants
    L6_3 = A0_2
    L5_3 = L5_3[L6_3]
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    if not L2_3 then
      return
    end
    L3_3 = TriggerServerEvent
    L4_3 = "tk_drugs:placePlant"
    L5_3 = A0_2
    L6_3 = A0_3
    L7_3 = A1_3
    L3_3(L4_3, L5_3, L6_3, L7_3)
  end
  L5_2 = nil
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = CanPlacePlant
    L2_3 = A0_2
    L3_3 = A0_3
    L4_3 = L0_1
    return L1_3(L2_3, L3_3, L4_3)
  end
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L9_1 = RegisterNetEvent
L10_1 = "tk_drugs:plantSeed"
function L11_1(A0_2)
  local L1_2, L2_2
  L1_2 = L8_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tk_drugs:updatePlant"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = Zones
  L3_2 = L3_2.GetZone
  L4_2 = "plant_"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = Config
    L4_2 = L4_2.Plants
    L4_2 = L4_2[A1_2]
    L5_2 = L4_2.stages
    L5_2 = L5_2[A2_2]
    L6_2 = L4_2.stages
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2.offset
    L7_2 = Zones
    L7_2 = L7_2.UpdateZoneModel
    L8_2 = "plant_"
    L9_2 = A0_2
    L8_2 = L8_2 .. L9_2
    L9_2 = L5_2.model
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
  end
end
L9_1(L10_1, L11_1)
function L9_1(A0_2)
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
  L6_2 = -1.0
  L7_2 = 1.3
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
  L8_2 = 0.5
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
function L10_1()
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
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L3_1
  if L2_2 then
    return
  end
  L2_2 = true
  L3_1 = L2_2
  L2_1 = A0_2
  L2_2 = L9_1
  L3_2 = A1_2
  L2_2(L3_2)
  L2_2 = TriggerCallback
  L3_2 = "tk_drugs:getPlantData"
  function L4_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = Utils
      L1_3 = L1_3.OpenUI
      L2_3 = "plant"
      L1_3(L2_3)
    else
      L1_3 = L10_1
      L1_3()
      L1_3 = false
      L3_1 = L1_3
      L1_3 = nil
      L2_1 = L1_3
    end
  end
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
end
function L12_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if not L0_2 then
    return
  end
  L0_2 = L10_1
  L0_2()
  L0_2 = Utils
  L0_2 = L0_2.CloseUI
  L0_2()
  L0_2 = false
  L3_1 = L0_2
  L0_2 = nil
  L2_1 = L0_2
end
L13_1 = RegisterNUICallback
L14_1 = "getPlantData"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L2_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.success = false
    L2_2(L3_2)
    return
  end
  L2_2 = TriggerCallback
  L3_2 = "tk_drugs:getPlantData"
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A1_2
    L2_3 = {}
    L2_3.success = true
    L3_3 = L2_1
    L2_3.id = L3_3
    L3_3 = A0_3.water
    L2_3.water = L3_3
    L3_3 = A0_3.fertilizer
    L2_3.fertilizer = L3_3
    L3_3 = A0_3.configIndex
    L2_3.configIndex = L3_3
    L3_3 = A0_3.nextStageTime
    L2_3.nextStageTime = L3_3
    L3_3 = A0_3.currentStage
    L2_3.stage = L3_3
    L3_3 = A0_3.lastStage
    L2_3.stages = L3_3
    L3_3 = GetItemLabel
    L4_3 = Config
    L4_3 = L4_3.Plants
    L5_3 = A0_3.configIndex
    L4_3 = L4_3[L5_3]
    L4_3 = L4_3.item
    L3_3 = L3_3(L4_3)
    L2_3.plantName = L3_3
    L1_3(L2_3)
  end
  L5_2 = L2_1
  L2_2(L3_2, L4_2, L5_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "waterPlant"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L2_1
  if not L2_2 then
    return
  end
  L2_2 = Zones
  L2_2 = L2_2.GetZone
  L3_2 = "plant_"
  L4_2 = L2_1
  L3_2 = L3_2 .. L4_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L2_2.objs
    if L3_2 then
      L3_2 = L2_2.objs
      L3_2 = #L3_2
      if 0 ~= L3_2 then
        goto lbl_24
      end
    end
  end
  do return end
  ::lbl_24::
  L3_2 = L2_2.objs
  L3_2 = L3_2[1]
  L3_2 = L3_2.coords
  if not L3_2 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.PlantSettings
  L4_2 = L4_2.water
  L4_2 = L4_2.amount
  if not L4_2 then
    L4_2 = 1
  end
  L5_2 = GetItemAmount
  L6_2 = Config
  L6_2 = L6_2.PlantSettings
  L6_2 = L6_2.water
  L6_2 = L6_2.item
  L5_2 = L5_2(L6_2)
  if L4_2 > L5_2 then
    L5_2 = Notify
    L6_2 = _U
    L7_2 = "need_item_amount"
    L8_2 = L4_2
    L9_2 = GetItemLabel
    L10_2 = Config
    L10_2 = L10_2.PlantSettings
    L10_2 = L10_2.water
    L10_2 = L10_2.item
    L9_2, L10_2 = L9_2(L10_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L7_2 = "error"
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = Utils
  L5_2 = L5_2.CloseUI
  L5_2()
  L5_2 = Planting
  L5_2 = L5_2.PourWater
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = TriggerServerEvent
    L7_2 = "tk_drugs:updatePlantWater"
    L8_2 = L2_1
    L6_2(L7_2, L8_2)
  end
  L6_2 = L10_1
  L6_2()
  L6_2 = false
  L3_1 = L6_2
  L6_2 = nil
  L2_1 = L6_2
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "fertilizePlant"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L2_1
  if not L2_2 then
    return
  end
  L2_2 = Zones
  L2_2 = L2_2.GetZone
  L3_2 = "plant_"
  L4_2 = L2_1
  L3_2 = L3_2 .. L4_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L2_2.objs
    if L3_2 then
      L3_2 = L2_2.objs
      L3_2 = #L3_2
      if 0 ~= L3_2 then
        goto lbl_24
      end
    end
  end
  do return end
  ::lbl_24::
  L3_2 = L2_2.objs
  L3_2 = L3_2[1]
  L3_2 = L3_2.coords
  if not L3_2 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.PlantSettings
  L4_2 = L4_2.fertilizer
  L4_2 = L4_2.amount
  if not L4_2 then
    L4_2 = 1
  end
  L5_2 = GetItemAmount
  L6_2 = Config
  L6_2 = L6_2.PlantSettings
  L6_2 = L6_2.fertilizer
  L6_2 = L6_2.item
  L5_2 = L5_2(L6_2)
  if L4_2 > L5_2 then
    L5_2 = Notify
    L6_2 = _U
    L7_2 = "need_item_amount"
    L8_2 = L4_2
    L9_2 = GetItemLabel
    L10_2 = Config
    L10_2 = L10_2.PlantSettings
    L10_2 = L10_2.fertilizer
    L10_2 = L10_2.item
    L9_2, L10_2 = L9_2(L10_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L7_2 = "error"
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = Utils
  L5_2 = L5_2.CloseUI
  L5_2()
  L5_2 = Config
  L5_2 = L5_2.PlantSettings
  L5_2 = L5_2.fertilizer
  L5_2 = L5_2.model
  L6_2 = Planting
  L6_2 = L6_2.PourSubstance
  L7_2 = L3_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 then
    L7_2 = TriggerServerEvent
    L8_2 = "tk_drugs:updatePlantFertilizer"
    L9_2 = L2_1
    L7_2(L8_2, L9_2)
  end
  L7_2 = L10_1
  L7_2()
  L7_2 = false
  L3_1 = L7_2
  L7_2 = nil
  L2_1 = L7_2
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "harvestPlant"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = true
  L4_1 = L2_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L2_1
  if not L2_2 then
    L2_2 = false
    L4_1 = L2_2
    return
  end
  L2_2 = Utils
  L2_2 = L2_2.CloseUI
  L2_2()
  L2_2 = L10_1
  L2_2()
  L2_2 = TaskStartScenarioInPlace
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = "WORLD_HUMAN_GARDENER_PLANT"
  L5_2 = 0
  L6_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Wait
  L3_2 = 5000
  L2_2(L3_2)
  L2_2 = ClearPedTasks
  L3_2 = PlayerPedId
  L3_2, L4_2, L5_2, L6_2 = L3_2()
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = TriggerServerEvent
  L3_2 = "tk_drugs:harvestPlant"
  L4_2 = L2_1
  L2_2(L3_2, L4_2)
  L2_2 = false
  L3_1 = L2_2
  L2_2 = nil
  L2_1 = L2_2
  L2_2 = Wait
  L3_2 = 1000
  L2_2(L3_2)
  L2_2 = false
  L4_1 = L2_2
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNUICallback
L14_1 = "closePlantMenu"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L12_1
  L2_2()
end
L13_1(L14_1, L15_1)
function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Config
  L2_2 = L2_2.Plants
  L3_2 = A1_2.configIndex
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    return
  end
  L3_2 = {}
  L4_2 = {}
  L5_2 = L2_2.stages
  L6_2 = A1_2.lastStage
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.model
  L4_2.model = L5_2
  L5_2 = A1_2.coords
  L4_2.coords = L5_2
  L5_2 = L2_2.stages
  L6_2 = A1_2.lastStage
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.offset
  L4_2.offset = L5_2
  L5_2 = A1_2.rotation
  L4_2.rotation = L5_2
  L3_2[1] = L4_2
  L4_2 = Zones
  L4_2 = L4_2.AddZone
  L5_2 = {}
  L6_2 = "plant_"
  L7_2 = A0_2
  L6_2 = L6_2 .. L7_2
  L5_2.name = L6_2
  L6_2 = vec3
  L7_2 = A1_2.coords
  L7_2 = L7_2.x
  L8_2 = A1_2.coords
  L8_2 = L8_2.y
  L9_2 = A1_2.coords
  L9_2 = L9_2.z
  L9_2 = L9_2 + 1.0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2.coords = L6_2
  L5_2.objs = L3_2
  L5_2.distance = 1.5
  L6_2 = Config
  L6_2 = L6_2.Target
  if "none" ~= L6_2 then
    L6_2 = _U
    L7_2 = "interact"
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_64
    end
  end
  L6_2 = _U
  L7_2 = "interact_button"
  L6_2 = L6_2(L7_2)
  L7_2 = _U
  L8_2 = "interact"
  L7_2 = L7_2(L8_2)
  L6_2 = L6_2 .. L7_2
  ::lbl_64::
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3
    L0_3 = Utils
    L0_3 = L0_3.CanInteract
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = CanOpenPlantMenu
      L1_3 = A1_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = L4_1
        L0_3 = not L0_3
      end
    end
    return L0_3
  end
  L5_2.canInteract = L6_2
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = next
    L3_3 = A1_3
    L2_3, L3_3 = L2_3(L3_3)
    L4_3 = L11_1
    L5_3 = A0_2
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
  end
  L5_2.onInteract = L6_2
  L6_2 = GetObjectBucket
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L5_2.bucket = L6_2
  L6_2 = Config
  L6_2 = L6_2.Controls
  L6_2 = L6_2.remove
  if L6_2 then
    function L6_2()
      local L0_3, L1_3, L2_3
      L0_3 = CanRemovePlant
      L1_3 = A1_2
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        return
      end
      L0_3 = DoProgress
      L1_3 = Config
      L1_3 = L1_3.Anims
      L1_3 = L1_3.remove
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        return
      end
      L0_3 = TriggerServerEvent
      L1_3 = "tk_drugs:removePlant"
      L2_3 = A0_2
      L0_3(L1_3, L2_3)
    end
  end
  L5_2.onRemove = L6_2
  L4_2(L5_2)
end
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_1 = A0_2
  lamps = A1_2
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L13_1
    L9_2 = L6_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L2_2 = pairs
  L3_2 = lamps
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L6_1
    L9_2 = L6_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
end
L15_1 = RegisterNetEvent
L16_1 = "tk_drugs:addPlant"
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  L2_2[A0_2] = A1_2
  L2_2 = L13_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L15_1(L16_1, L17_1)
L15_1 = RegisterNetEvent
L16_1 = "tk_drugs:removePlant"
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Zones
  L1_2 = L1_2.GetZone
  L2_2 = "plant_"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = Zones
    L2_2 = L2_2.RemoveZone
    L3_2 = "plant_"
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
  L2_2 = L0_1
  L2_2[A0_2] = nil
end
L15_1(L16_1, L17_1)
function L15_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = promise
  L0_2 = L0_2.new
  L0_2 = L0_2()
  L1_2 = TriggerCallback
  L2_2 = "tk_drugs:getPlants"
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L1_2(L2_2, L3_2)
  L1_2 = Citizen
  L1_2 = L1_2.Await
  L2_2 = L0_2
  return L1_2(L2_2)
end
L16_1 = {}
L16_1.Init = L14_1
L16_1.GetPlants = L15_1
L16_1.GetLamps = L7_1
L16_1.EndPlantInteraction = L12_1
Plants = L16_1

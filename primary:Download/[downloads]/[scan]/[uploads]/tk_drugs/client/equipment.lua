local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = false
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = DoProgress
  L4_2 = Config
  L4_2 = L4_2.Anims
  L4_2 = L4_2.place
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = TriggerServerEvent
  L4_2 = "tk_drugs:placeEquipment"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L2_1 = RegisterNetEvent
L3_1 = "tk_drugs:placeEquipment"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Placing equipment"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = CanPlaceEquipment
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Can place equipment"
    L3_2 = L0_1
    L1_2(L2_2, L3_2)
  end
  L1_2 = L0_1
  if L1_2 then
    return
  end
  L1_2 = true
  L0_1 = L1_2
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Starting to place equipment"
    L1_2(L2_2)
  end
  L1_2 = StartPlacingEquipment
  L2_2 = Config
  L2_2 = L2_2.EquipmentItems
  L2_2 = L2_2[A0_2]
  L1_2(L2_2)
  L1_2 = Utils
  L1_2 = L1_2.StartPlacingObject
  L2_2 = Config
  L2_2 = L2_2.EquipmentItems
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.objects
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = Config
    L2_3 = L2_3.DebugMode
    if L2_3 then
      L2_3 = print
      L3_3 = "Placing equipment"
      L4_3 = A0_3
      L5_3 = A1_3
      L2_3(L3_3, L4_3, L5_3)
    end
    L2_3 = false
    L0_1 = L2_3
    L2_3 = StopPlacingEquipment
    L3_3 = Config
    L3_3 = L3_3.EquipmentItems
    L4_3 = A0_2
    L3_3 = L3_3[L4_3]
    L2_3(L3_3)
    if not A0_3 then
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
    L2_3 = L1_1
    L3_3 = A0_2
    L4_3 = A0_3
    L5_3 = A1_3
    L2_3(L3_3, L4_3, L5_3)
  end
  L1_2(L2_2, L3_2)
end
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = promise
  L0_2 = L0_2.new
  L0_2 = L0_2()
  L1_2 = TriggerCallback
  L2_2 = "tk_drugs:getEquipment"
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
L3_1 = {}
L3_1.mixer = 1.5
L3_1.bagging = 1.5
L3_1.oven = 2.5
L3_1.meth_cooking = 1.5
L3_1.cauldron = 1.5
L3_1.press = 1.5
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = Config
  L3_2 = L3_2.EquipmentItems
  L4_2 = A1_2.configIndex
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    return
  end
  L4_2 = {}
  L5_2 = pairs
  L6_2 = L3_2.objects
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = A1_2.rotation
    if not L11_2 then
      L11_2 = vec3
      L12_2 = 0.0
      L13_2 = 0.0
      L14_2 = 0.0
      L11_2 = L11_2(L12_2, L13_2, L14_2)
    end
    L12_2 = Utils
    L12_2 = L12_2.RotateVector
    L13_2 = L10_2.offset
    L14_2 = L11_2.z
    L12_2 = L12_2(L13_2, L14_2)
    offset = L12_2
    L12_2 = #L4_2
    L12_2 = L12_2 + 1
    L13_2 = {}
    L14_2 = L10_2.model
    L13_2.model = L14_2
    L14_2 = A1_2.coords
    L15_2 = offset
    L14_2 = L14_2 + L15_2
    L13_2.coords = L14_2
    L13_2.rotation = L11_2
    L4_2[L12_2] = L13_2
  end
  L5_2 = A1_2.rotation
  L5_2 = L5_2.z
  if not L5_2 then
    L5_2 = 0.0
  end
  L7_2 = L3_2.equipmentType
  L6_2 = L3_1
  L6_2 = L6_2[L7_2]
  if not L6_2 then
    L6_2 = 1.5
  end
  L7_2 = nil
  if A2_2 then
    L8_2 = Config
    L8_2 = L8_2.Controls
    L8_2 = L8_2.remove
    L7_2 = L8_2 or L7_2
    if L8_2 then
      function L8_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = Config
        L0_3 = L0_3.DebugMode
        if L0_3 then
          L0_3 = print
          L1_3 = "Removing equipment"
          L2_3 = A0_2
          L3_3 = A1_2
          L0_3(L1_3, L2_3, L3_3)
        end
        L0_3 = CanRemoveEquipment
        L1_3 = A1_2
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          return
        end
        L0_3 = Config
        L0_3 = L0_3.DebugMode
        if L0_3 then
          L0_3 = print
          L1_3 = "Can remove equipment"
          L0_3(L1_3)
        end
        L0_3 = DoProgress
        L1_3 = Config
        L1_3 = L1_3.Anims
        L1_3 = L1_3.remove
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          return
        end
        L0_3 = Config
        L0_3 = L0_3.DebugMode
        if L0_3 then
          L0_3 = print
          L1_3 = "DoProgress"
          L0_3(L1_3)
        end
        L0_3 = TriggerServerEvent
        L1_3 = "tk_drugs:removeEquipment"
        L2_3 = A0_2
        L0_3(L1_3, L2_3)
      end
      L7_2 = L8_2
    end
  end
  L8_2 = Zones
  L8_2 = L8_2.AddZone
  L9_2 = {}
  L10_2 = "equipment_"
  L11_2 = A0_2
  L10_2 = L10_2 .. L11_2
  L9_2.name = L10_2
  L10_2 = A1_2.coords
  L9_2.coords = L10_2
  L9_2.distance = L6_2
  L9_2.objs = L4_2
  L10_2 = Config
  L10_2 = L10_2.Target
  if "none" ~= L10_2 then
    L10_2 = _U
    L11_2 = "interact"
    L10_2 = L10_2(L11_2)
    if L10_2 then
      goto lbl_94
    end
  end
  L10_2 = _U
  L11_2 = "interact_button"
  L10_2 = L10_2(L11_2)
  L11_2 = _U
  L12_2 = "interact"
  L11_2 = L11_2(L12_2)
  L10_2 = L10_2 .. L11_2
  ::lbl_94::
  L9_2.label = L10_2
  function L10_2()
    local L0_3, L1_3
    L0_3 = Utils
    L0_3 = L0_3.CanInteract
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = CanUseEquipment
      L1_3 = A1_2
      L0_3 = L0_3(L1_3)
    end
    return L0_3
  end
  L9_2.canInteract = L10_2
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L3_2.equipmentType
    if "mixer" == L0_3 then
      L0_3 = Mixer
      L0_3 = L0_3.OpenMixer
      L1_3 = A0_2
      L2_3 = A1_2.coords
      L3_3 = L5_2
      L4_3 = A1_2.configIndex
      L0_3(L1_3, L2_3, L3_3, L4_3)
    else
      L0_3 = L3_2.equipmentType
      if "bagging" == L0_3 then
        L0_3 = WeedBagging
        L0_3 = L0_3.OpenBagging
        L1_3 = A0_2
        L2_3 = A1_2.coords
        L3_3 = L5_2
        L4_3 = A1_2.configIndex
        L0_3(L1_3, L2_3, L3_3, L4_3)
      else
        L0_3 = L3_2.equipmentType
        if "oven" == L0_3 then
          L0_3 = Oven
          L0_3 = L0_3.OpenOven
          L1_3 = A0_2
          L2_3 = A1_2.coords
          L3_3 = L5_2
          L4_3 = A1_2.configIndex
          L0_3(L1_3, L2_3, L3_3, L4_3)
        else
          L0_3 = L3_2.equipmentType
          if "meth_cooking" == L0_3 then
            L0_3 = MethCooking
            L0_3 = L0_3.StartMethCooking
            L1_3 = A0_2
            L2_3 = A1_2.coords
            L3_3 = L5_2
            L4_3 = A1_2.configIndex
            L0_3(L1_3, L2_3, L3_3, L4_3)
          else
            L0_3 = L3_2.equipmentType
            if "cauldron" == L0_3 then
              L0_3 = Cauldron
              L0_3 = L0_3.OpenCauldron
              L1_3 = A0_2
              L2_3 = A1_2.coords
              L3_3 = L5_2
              L4_3 = A1_2.configIndex
              L0_3(L1_3, L2_3, L3_3, L4_3)
            else
              L0_3 = L3_2.equipmentType
              if "press" == L0_3 then
                L0_3 = Press
                L0_3 = L0_3.OpenPress
                L1_3 = A0_2
                L2_3 = A1_2.coords
                L3_3 = L5_2
                L4_3 = A1_2.configIndex
                L0_3(L1_3, L2_3, L3_3, L4_3)
              end
            end
          end
        end
      end
    end
  end
  L9_2.onInteract = L10_2
  L10_2 = GetObjectBucket
  L11_2 = A1_2
  L10_2 = L10_2(L11_2)
  L9_2.bucket = L10_2
  L10_2 = Config
  L10_2 = L10_2.Controls
  L10_2 = L10_2.remove
  if L10_2 then
    L10_2 = L7_2
  end
  L9_2.onRemove = L10_2
  L8_2(L9_2)
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  equipment = A0_2
  L1_2 = pairs
  L2_2 = equipment
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L4_1
    L8_2 = L5_2
    L9_2 = L6_2
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
  end
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.EquipmentLocations
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L4_1
    L8_2 = L5_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
end
L6_1 = RegisterNetEvent
L7_1 = "tk_drugs:addEquipment"
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L4_1
  L3_2 = A0_2
  L4_2 = A1_2
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
end
L6_1(L7_1, L8_1)
L6_1 = RegisterNetEvent
L7_1 = "tk_drugs:removeEquipment"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = print
    L2_2 = "Removing equipment"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  L1_2 = Config
  L1_2 = L1_2.DebugMode
  if L1_2 then
    L1_2 = Zones
    L1_2 = L1_2.GetZone
    L2_2 = "equipment_"
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2 = L1_2(L2_2)
    L2_2 = print
    L3_2 = "Zone:"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    L2_2 = type
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      L2_2 = print
      L3_2 = "Zone:"
      L4_2 = L1_2.name
      L5_2 = L1_2.coords
      L6_2 = L1_2.distance
      L7_2 = L1_2.objs
      L8_2 = L1_2.label
      L9_2 = L1_2.canInteract
      L10_2 = L1_2.onInteract
      L11_2 = L1_2.bucket
      L12_2 = json
      L12_2 = L12_2.encode
      L13_2 = L1_2.objs
      L12_2 = L12_2(L13_2)
      L13_2 = L1_2.onRemove
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  end
  L1_2 = Zones
  L1_2 = L1_2.RemoveZone
  L2_2 = "equipment_"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2(L2_2)
end
L6_1(L7_1, L8_1)
L6_1 = {}
L6_1.GetEquipment = L2_1
L6_1.Init = L5_1
Equipment = L6_1

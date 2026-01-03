local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = {}
L1_1 = 0
L2_1 = {}
L2_1.index = nil
L3_1 = math
L3_1 = L3_1.huge
L2_1.dist = L3_1
L3_1 = {}
L2_1.data = L3_1
L2_1.ped = nil
L3_1 = {}
L2_1.entities = L3_1
L3_1 = {}
L4_1 = {}
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.coords
  if L1_2 then
    L1_2 = next
    L2_2 = A0_2.coords
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = L0_1
  L1_2 = #L1_2
  L2_2 = L1_2 + 1
  L1_2 = L0_1
  L1_2[L2_2] = A0_2
end
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = RemoveEntityZone
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = {}
  L4_2 = A1_2.onInteract
  if L4_2 then
    L4_2 = #L3_2
    L4_2 = L4_2 + 1
    L5_2 = {}
    L6_2 = A1_2.label
    L5_2.label = L6_2
    L6_2 = A1_2.icon
    if not L6_2 then
      L6_2 = "fa-solid fa-hand"
    end
    L5_2.icon = L6_2
    L6_2 = A1_2.distance
    L5_2.distance = L6_2
    function L6_2()
      local L0_3, L1_3
      L0_3 = A1_2.canInteract
      if not L0_3 then
        L0_3 = true
        return L0_3
      end
      L0_3 = A1_2.canInteract
      L1_3 = L2_1
      return L0_3(L1_3)
    end
    L5_2.canInteract = L6_2
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = A1_2.onInteract
      L1_3 = L2_1
      L3_3 = A2_2
      L2_3 = L3_1
      L2_3 = L2_3[L3_3]
      L0_3(L1_3, L2_3)
    end
    L5_2.onSelect = L6_2
    L3_2[L4_2] = L5_2
  end
  L4_2 = A1_2.onRemove
  if L4_2 then
    L4_2 = #L3_2
    L4_2 = L4_2 + 1
    L5_2 = {}
    L6_2 = _U
    L7_2 = "remove"
    L6_2 = L6_2(L7_2)
    L5_2.label = L6_2
    L5_2.icon = "fa-solid fa-trash"
    L6_2 = A1_2.distance
    L5_2.distance = L6_2
    function L6_2()
      local L0_3, L1_3
      L0_3 = A1_2.canInteract
      if not L0_3 then
        L0_3 = true
        return L0_3
      end
      L0_3 = A1_2.canInteract
      L1_3 = L2_1
      return L0_3(L1_3)
    end
    L5_2.canInteract = L6_2
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = A1_2.onRemove
      L1_3 = L2_1
      L3_3 = A2_2
      L2_3 = L3_1
      L2_3 = L2_3[L3_3]
      L0_3(L1_3, L2_3)
    end
    L5_2.onSelect = L6_2
    L3_2[L4_2] = L5_2
  end
  L4_2 = AddEntityZone
  L5_2 = A0_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
end
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A1_2.objs
  L3_2 = L3_1
  L4_2 = {}
  L3_2[A0_2] = L4_2
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = Utils
    L9_2 = L9_2.LoadModel
    L10_2 = L8_2.model
    L9_2(L10_2)
    L9_2 = vec3
    L10_2 = L8_2.coords
    L10_2 = L10_2.x
    L11_2 = L8_2.coords
    L11_2 = L11_2.y
    L12_2 = L8_2.coords
    L12_2 = L12_2.z
    L12_2 = L12_2 - 1.0
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = L8_2.offset
    if L10_2 then
      L10_2 = vec3
      L11_2 = L8_2.offset
      L11_2 = L11_2.x
      L12_2 = L8_2.offset
      L12_2 = L12_2.y
      L13_2 = L8_2.offset
      L13_2 = L13_2.z
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2 = L9_2 + L10_2
    end
    L10_2 = type
    L11_2 = L8_2.model
    L10_2 = L10_2(L11_2)
    if "number" == L10_2 then
      L10_2 = L8_2.model
      if L10_2 then
        goto lbl_48
      end
    end
    L10_2 = joaat
    L11_2 = L8_2.model
    L10_2 = L10_2(L11_2)
    ::lbl_48::
    model = L10_2
    L10_2 = CreateObject
    L11_2 = model
    L12_2 = L9_2
    L13_2 = false
    L14_2 = true
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    repeat
      L11_2 = Wait
      L12_2 = 0
      L11_2(L12_2)
      L11_2 = DoesEntityExist
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
    until L11_2
    L11_2 = SetEntityRotation
    L12_2 = L10_2
    L13_2 = L8_2.rotation
    L13_2 = L13_2.x
    L14_2 = L8_2.rotation
    L14_2 = L14_2.y
    L15_2 = L8_2.rotation
    L15_2 = L15_2.z
    L16_2 = 2
    L17_2 = true
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L11_2 = FreezeEntityPosition
    L12_2 = L10_2
    L13_2 = true
    L11_2(L12_2, L13_2)
    L11_2 = Config
    L11_2 = L11_2.Target
    if "none" ~= L11_2 then
      L11_2 = L6_1
      L12_2 = L10_2
      L13_2 = A1_2
      L14_2 = A0_2
      L11_2(L12_2, L13_2, L14_2)
    end
    L11_2 = L3_1
    L11_2 = L11_2[A0_2]
    L11_2[L7_2] = L10_2
  end
end
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "spawning ped"
    L4_2 = A1_2.ped
    L5_2 = A1_2.coords
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = Utils
  L2_2 = L2_2.LoadModel
  L3_2 = A1_2.ped
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "ped loaded"
    L4_2 = A1_2.ped
    L2_2(L3_2, L4_2)
  end
  L2_2 = L4_1
  L3_2 = CreatePed
  L4_2 = 4
  L5_2 = A1_2.ped
  L6_2 = A1_2.coords
  L6_2 = L6_2.x
  L7_2 = A1_2.coords
  L7_2 = L7_2.y
  L8_2 = A1_2.coords
  L8_2 = L8_2.z
  L8_2 = L8_2 - 1.0
  L9_2 = A1_2.coords
  L9_2 = L9_2.w
  L10_2 = false
  L11_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L2_2[A0_2] = L3_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "ped created"
    L4_2 = A1_2.ped
    L2_2(L3_2, L4_2)
  end
  repeat
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
    L2_2 = DoesEntityExist
    L3_2 = L4_1
    L3_2 = L3_2[A0_2]
    L2_2 = L2_2(L3_2)
  until L2_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "ped exists"
    L4_2 = A1_2.ped
    L2_2(L3_2, L4_2)
  end
  L2_2 = SetEntityAsMissionEntity
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L4_2 = true
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = FreezeEntityPosition
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityInvincible
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetBlockingOfNonTemporaryEvents
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = A1_2.scenario
  if L2_2 then
    L2_2 = TaskStartScenarioInPlace
    L3_2 = L4_1
    L3_2 = L3_2[A0_2]
    L4_2 = A1_2.scenario
    L5_2 = 0
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "ped settings done"
    L4_2 = A1_2.scenario
    L2_2(L3_2, L4_2)
  end
  L2_2 = Config
  L2_2 = L2_2.Target
  if "none" == L2_2 then
    return
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = A1_2.icon
  if not L4_2 then
    L4_2 = "fa-solid fa-hand"
  end
  L3_2.icon = L4_2
  L4_2 = A1_2.interactDist
  L3_2.distance = L4_2
  L4_2 = A1_2.label
  L3_2.label = L4_2
  function L4_2()
    local L0_3, L1_3
    L0_3 = A1_2.canInteract
    L1_3 = L2_1
    return L0_3(L1_3)
  end
  L3_2.canInteract = L4_2
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = A1_2.onInteract
    L1_3 = L2_1
    L2_3 = nil
    L4_3 = A0_2
    L3_3 = L4_1
    L3_3 = L3_3[L4_3]
    L0_3(L1_3, L2_3, L3_3)
  end
  L3_2.onSelect = L4_2
  L2_2[1] = L3_2
  L3_2 = AddEntityZone
  L4_2 = L4_1
  L4_2 = L4_2[A0_2]
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L3_1
  L3_2 = L3_2[A0_2]
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L1_2[L8_2] = L7_2
  end
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = DoesEntityExist
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = Config
      L8_2 = L8_2.Target
      if "none" ~= L8_2 then
        L8_2 = RemoveEntityZone
        L9_2 = L7_2
        L8_2(L9_2)
      end
      L8_2 = DeleteEntity
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  L2_2 = L3_1
  L2_2[A0_2] = nil
end
function L10_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = pairs
      L3_3 = L0_1
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = L7_3.coords
        L8_3 = L8_3.xyz
        L8_3 = L1_3 - L8_3
        L8_3 = #L8_3
        if L8_3 <= 100 then
          L9_3 = L7_3.bucket
          if L9_3 then
            L9_3 = L1_1
            L10_3 = L7_3.bucket
            if L9_3 ~= L10_3 then
              goto lbl_96
            end
          end
          L9_3 = L7_3.ped
          if L9_3 then
            L9_3 = L4_1
            L9_3 = L9_3[L6_3]
            if not L9_3 then
              L9_3 = L8_1
              L10_3 = L6_3
              L11_3 = L7_3
              L9_3(L10_3, L11_3)
            end
          end
          L9_3 = L7_3.objs
          if L9_3 then
            L9_3 = L3_1
            L9_3 = L9_3[L6_3]
            if not L9_3 then
              L9_3 = L7_1
              L10_3 = L6_3
              L11_3 = L7_3
              L9_3(L10_3, L11_3)
            end
          end
          L9_3 = Config
          L9_3 = L9_3.Target
          if "none" ~= L9_3 then
          else
            L9_3 = L7_3.dist
            if not L9_3 then
              L9_3 = L7_3.distance
              if not L9_3 then
                L9_3 = L7_3.interactDist
                if not L9_3 then
                  L9_3 = 2
                end
              end
            end
            if L8_3 <= L9_3 then
              L10_3 = L2_1.index
              if L10_3 then
                L10_3 = L2_1.dist
                if not (L8_3 < L10_3) then
                  goto lbl_85
                end
              end
              L10_3 = L7_3.canInteract
              if L10_3 then
                L10_3 = L7_3.canInteract
                L11_3 = L7_3.index
                L10_3 = L10_3(L11_3)
                if not L10_3 then
                  goto lbl_85
                end
              end
              L10_3 = L2_1.index
              if L6_3 == L10_3 then
              else
                L2_1.index = L6_3
                L2_1.dist = L8_3
                L2_1.data = L7_3
              end
            ::lbl_85::
            else
              L10_3 = L2_1.index
              if L10_3 == L6_3 and L8_3 > L9_3 then
                L2_1.index = nil
                L10_3 = math
                L10_3 = L10_3.huge
                L2_1.dist = L10_3
                L2_1.data = nil
              end
            end
          end
        ::lbl_96::
        else
          L9_3 = L4_1
          L9_3 = L9_3[L6_3]
          if L9_3 then
            L9_3 = Config
            L9_3 = L9_3.Target
            if "none" ~= L9_3 then
              L9_3 = RemoveEntityZone
              L10_3 = L4_1
              L10_3 = L10_3[L6_3]
              L9_3(L10_3)
            end
            L9_3 = DeleteEntity
            L10_3 = L4_1
            L10_3 = L10_3[L6_3]
            L9_3(L10_3)
            L9_3 = L4_1
            L9_3[L6_3] = nil
          else
            L9_3 = L3_1
            L9_3 = L9_3[L6_3]
            if L9_3 then
              L9_3 = L9_1
              L10_3 = L6_3
              L9_3(L10_3)
            end
          end
        end
      end
      L2_3 = L2_1.index
      if L2_3 then
        L3_3 = L2_1.index
        L2_3 = L0_1
        L2_3 = L2_3[L3_3]
        if not L2_3 then
          L2_1.index = nil
          L2_3 = math
          L2_3 = L2_3.huge
          L2_1.dist = L2_3
          L2_1.data = nil
        else
          L3_3 = L2_1.index
          L2_3 = L0_1
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.coords
          L2_3 = L2_3.xyz
          L2_3 = L1_3 - L2_3
          L2_3 = #L2_3
          L2_1.dist = L2_3
        end
      end
      L2_3 = Wait
      L3_3 = 400
      L2_3(L3_3)
    end
  end
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.Target
  if "none" ~= L0_2 then
    return
  end
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3
    L0_3 = false
    L1_3 = nil
    while true do
      L2_3 = 200
      L4_3 = L2_1.index
      L3_3 = L0_1
      L3_3 = L3_3[L4_3]
      if L3_3 then
        L4_3 = L2_1.index
        if L4_3 then
          L4_3 = L3_3.canInteract
          if L4_3 then
            L4_3 = L3_3.canInteract
            L5_3 = L3_3
            L4_3 = L4_3(L5_3)
            if not L4_3 then
              goto lbl_140
            end
          end
          L2_3 = 0
          L4_3 = L3_3.label
          if L4_3 then
            L4_3 = type
            L5_3 = L3_3.label
            L4_3 = L4_3(L5_3)
            if "function" == L4_3 then
              L4_3 = L3_3.label
              L5_3 = L3_3
              L4_3 = L4_3(L5_3)
              if L4_3 then
                goto lbl_35
              end
            end
            L4_3 = L3_3.label
            ::lbl_35::
            L5_3 = Config
            L5_3 = L5_3.UseOxLib
            if not L5_3 then
              L5_3 = Config
              L5_3 = L5_3.Framework
              if "qb" == L5_3 then
                L5_3 = Config
                L5_3 = L5_3.HelpNotification
                if not L5_3 then
                  goto lbl_51
                end
              end
              L5_3 = Config
              L5_3 = L5_3.Framework
              ::lbl_51::
              if "qb" ~= L5_3 then
                L5_3 = Config
                L5_3 = L5_3.HelpNotification
                if L5_3 then
                  L5_3 = DisplayHelpText
                  L6_3 = L4_3
                  L5_3(L6_3)
                else
                  L5_3 = Draw3DText
                  L6_3 = L3_3.coords
                  L6_3 = L6_3.xyz
                  L7_3 = L4_3
                  L5_3(L6_3, L7_3)
                end
            end
            elseif not L0_3 or L4_3 ~= L1_3 then
              L0_3 = true
              L1_3 = L4_3
              L5_3 = ShowTextUI
              L6_3 = L4_3
              L5_3(L6_3)
            end
          end
          L4_3 = L3_3.marker
          if L4_3 then
            L4_3 = L3_3.marker
            L5_3 = DrawMarker
            L6_3 = L4_3.type
            L7_3 = L3_3.coords
            L7_3 = L7_3.xyz
            L8_3 = 0.0
            L9_3 = 0.0
            L10_3 = 0.0
            L11_3 = 0.0
            L12_3 = 0.0
            L13_3 = 0.0
            L14_3 = L4_3.scale
            L14_3 = L14_3.x
            L15_3 = L4_3.scale
            L15_3 = L15_3.y
            L16_3 = L4_3.scale
            L16_3 = L16_3.z
            L17_3 = L4_3.color
            L17_3 = L17_3.x
            L18_3 = L4_3.color
            L18_3 = L18_3.y
            L19_3 = L4_3.color
            L19_3 = L19_3.z
            L20_3 = L4_3.color
            L20_3 = L20_3.w
            L21_3 = L4_3.bob
            L22_3 = L4_3.faceCamera
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3)
          end
          L4_3 = L3_3.onInteract
          if L4_3 then
            L4_3 = IsControlJustPressed
            L5_3 = 0
            L6_3 = Config
            L6_3 = L6_3.Controls
            L6_3 = L6_3.interact
            L4_3 = L4_3(L5_3, L6_3)
            if L4_3 then
              L4_3 = L3_3.onInteract
              L5_3 = L2_1
              L7_3 = L2_1.index
              L6_3 = L3_1
              L6_3 = L6_3[L7_3]
              L8_3 = L2_1.index
              L7_3 = L4_1
              L7_3 = L7_3[L8_3]
              L4_3(L5_3, L6_3, L7_3)
            end
          end
          L4_3 = L3_3.onRemove
          if L4_3 then
            L4_3 = IsControlJustPressed
            L5_3 = 0
            L6_3 = Config
            L6_3 = L6_3.Controls
            L6_3 = L6_3.remove
            L4_3 = L4_3(L5_3, L6_3)
            if L4_3 then
              L4_3 = L3_3.onRemove
              L5_3 = L2_1
              L4_3(L5_3)
            end
          end
      end
      ::lbl_140::
      elseif L0_3 then
        L4_3 = HideTextUI
        L4_3()
        L0_3 = false
      end
      L4_3 = Wait
      L5_3 = L2_3
      L4_3(L5_3)
    end
  end
  L0_2(L1_2)
end
L11_1 = AddEventHandler
L12_1 = "onResourceStop"
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L3_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = pairs
      L8_2 = L6_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = DoesEntityExist
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L13_2 = DeleteEntity
          L14_2 = L12_2
          L13_2(L14_2)
        end
      end
    else
      L7_2 = pairs
      L8_2 = L6_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = DoesEntityExist
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L13_2 = DeleteEntity
          L14_2 = L12_2
          L13_2(L14_2)
        end
      end
    end
  end
  L1_2 = pairs
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
L11_1(L12_1, L13_1)
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.name
    if L7_2 == A0_2 then
      return L5_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = L11_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = L0_1
  L4_2 = L4_2[L3_2]
  L5_2 = pairs
  L6_2 = L4_2.objs
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2.model = A1_2
    L10_2.offset = A2_2
  end
  L5_2 = L3_1
  L5_2 = L5_2[L3_2]
  if L5_2 then
    L5_2 = pairs
    L6_2 = L3_1
    L6_2 = L6_2[L3_2]
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = DoesEntityExist
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = DeleteEntity
        L12_2 = L10_2
        L11_2(L12_2)
      end
    end
    L5_2 = L7_1
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
  end
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.name
    if L7_2 == A0_2 then
      return L6_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L11_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.Target
  if "none" ~= L2_2 then
    L2_2 = RemoveEntityZone
    L3_2 = L4_1
    L3_2 = L3_2[L1_2]
    L2_2(L3_2)
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L3_2 = L4_1
  L3_2 = L3_2[L1_2]
  if L3_2 then
    L3_2 = DeleteEntity
    L4_2 = L4_1
    L4_2 = L4_2[L1_2]
    L3_2(L4_2)
    L3_2 = L4_1
    L3_2[L1_2] = nil
  end
  L3_2 = L2_2.objs
  if L3_2 then
    L3_2 = L3_1
    L3_2 = L3_2[L1_2]
    if L3_2 then
      L3_2 = L9_1
      L4_2 = L1_2
      L3_2(L4_2)
    end
  end
  L3_2 = L0_1
  L3_2[L1_2] = nil
end
L15_1 = RegisterNetEvent
L16_1 = "tk_drugs:setRoutingBucket"
function L17_1(A0_2)
  local L1_2
  L1_1 = A0_2
end
L15_1(L16_1, L17_1)
L15_1 = exports
L16_1 = "setZoneBucket"
function L17_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L11_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L0_1
  L3_2 = L3_2[L2_2]
  L3_2.bucket = A1_2
end
L15_1(L16_1, L17_1)
L15_1 = {}
L15_1.AddZone = L5_1
L15_1.Init = L10_1
L15_1.UpdateZoneModel = L12_1
L15_1.GetZone = L13_1
L15_1.RemoveZone = L14_1
Zones = L15_1

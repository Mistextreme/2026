local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "start shopping"
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = L2_1
  if L2_2 then
    return
  end
  L2_2 = true
  L2_1 = L2_2
  L0_1 = A0_2
  L2_2 = L3_1
  L3_2 = A1_2
  L2_2(L3_2)
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "shop camera setup"
    L4_2 = A1_2
    L2_2(L3_2, L4_2)
  end
  L2_2 = TaskTurnPedToFaceEntity
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = A1_2
  L5_2 = 500
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = Config
  L2_2 = L2_2.Shops
  L2_2 = L2_2[A0_2]
  L3_2 = PlayShopPedVoiceLine
  L4_2 = A1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.DebugMode
  if L3_2 then
    L3_2 = print
    L4_2 = "OpenUI"
    L5_2 = L2_1
    L6_2 = L0_1
    L7_2 = L1_1
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  L3_2 = Utils
  L3_2 = L3_2.OpenUI
  L4_2 = "shop"
  L3_2(L4_2)
end
function L6_1()
  local L0_2, L1_2
  L0_2 = L2_1
  if not L0_2 then
    return
  end
  L0_2 = L4_1
  L0_2()
  L0_2 = Utils
  L0_2 = L0_2.CloseUI
  L0_2()
  L0_2 = false
  L2_1 = L0_2
  L0_2 = nil
  L0_1 = L0_2
end
L7_1 = RegisterNUICallback
L8_1 = "getShopData"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.DebugMode
  if L2_2 then
    L2_2 = print
    L3_2 = "getShopData"
    L4_2 = L0_1
    L2_2(L3_2, L4_2)
  end
  L2_2 = L0_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = {}
    L3_2.success = false
    L2_2(L3_2)
    return
  end
  L2_2 = Config
  L2_2 = L2_2.Shops
  L3_2 = L0_1
  L2_2 = L2_2[L3_2]
  L3_2 = Config
  L3_2 = L3_2.DebugMode
  if L3_2 then
    L3_2 = print
    L4_2 = "shopData"
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  end
  if not L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.success = false
    L3_2(L4_2)
    return
  end
  L3_2 = GetShopItems
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Config
  L4_2 = L4_2.DebugMode
  if L4_2 then
    L4_2 = print
    L5_2 = "items"
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = A1_2
  L5_2 = {}
  L5_2.success = true
  L6_2 = L2_2.name
  L5_2.shopName = L6_2
  L5_2.items = L3_2
  L4_2(L5_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "purchaseCart"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A0_2.cart
  L3_2 = L0_1
  if not L3_2 or not L2_2 then
    L3_2 = A1_2
    L4_2 = 1
    L3_2(L4_2)
    return
  end
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = "mp_common"
  L5_2 = "givetake1_a"
  L6_2 = Utils
  L6_2 = L6_2.LoadDict
  L7_2 = L4_2
  L6_2(L7_2)
  L6_2 = TaskPlayAnim
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = L5_2
  L10_2 = 8.0
  L11_2 = -8.0
  L12_2 = -1
  L13_2 = 0
  L14_2 = 0
  L15_2 = false
  L16_2 = false
  L17_2 = false
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L6_2 = Wait
  L7_2 = 1000
  L6_2(L7_2)
  L6_2 = ClearPedTasks
  L7_2 = L3_2
  L6_2(L7_2)
  L6_2 = TriggerServerEvent
  L7_2 = "tk_drugs:purchaseCart"
  L8_2 = L0_1
  L9_2 = L2_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = A1_2
  L7_2 = 1
  L6_2(L7_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "closeShop"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L6_1
  L2_2()
  L2_2 = A1_2
  L3_2 = {}
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = Config
  L0_2 = L0_2.DebugMode
  if L0_2 then
    L0_2 = print
    L1_2 = "shop init"
    L2_2 = Config
    L2_2 = L2_2.Shops
    L0_2(L1_2, L2_2)
  end
  L0_2 = type
  L1_2 = Config
  L1_2 = L1_2.Shops
  L0_2 = L0_2(L1_2)
  if "table" ~= L0_2 then
    return
  end
  L0_2 = Config
  L0_2 = L0_2.DebugMode
  if L0_2 then
    L0_2 = print
    L1_2 = "shop init"
    L2_2 = json
    L2_2 = L2_2.encode
    L3_2 = Config
    L3_2 = L3_2.Shops
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L2_2(L3_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Shops
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = Config
    L6_2 = L6_2.DebugMode
    if L6_2 then
      L6_2 = print
      L7_2 = "adding shop zone"
      L8_2 = L4_2
      L9_2 = json
      L9_2 = L9_2.encode
      L10_2 = L5_2
      L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
    L6_2 = Config
    L6_2 = L6_2.DebugMode
    if L6_2 then
      L6_2 = print
      L7_2 = "shopData"
      L8_2 = L5_2.ped
      L9_2 = L5_2.coords
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = Zones
    L6_2 = L6_2.AddZone
    L7_2 = {}
    L8_2 = L5_2.coords
    L7_2.coords = L8_2
    L7_2.distance = 1.5
    L8_2 = L5_2.ped
    L7_2.ped = L8_2
    L7_2.scenario = "WORLD_HUMAN_STAND_IMPATIENT"
    L8_2 = L5_2.ped
    if not L8_2 then
      L8_2 = {}
      L8_2.type = 1
      L9_2 = vector3
      L10_2 = 1.0
      L11_2 = 1.0
      L12_2 = 1.0
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2.scale = L9_2
      L9_2 = vector4
      L10_2 = 0
      L11_2 = 255
      L12_2 = 125
      L13_2 = 125
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
      L8_2.color = L9_2
      L8_2.bob = false
      L8_2.faceCamera = false
      if L8_2 then
        goto lbl_89
      end
    end
    L8_2 = nil
    ::lbl_89::
    L7_2.marker = L8_2
    L8_2 = Config
    L8_2 = L8_2.Target
    if "none" ~= L8_2 then
      L8_2 = _U
      L9_2 = "open_shop"
      L8_2 = L8_2(L9_2)
      if L8_2 then
        goto lbl_106
      end
    end
    L8_2 = _U
    L9_2 = "interact_button"
    L8_2 = L8_2(L9_2)
    L9_2 = _U
    L10_2 = "open_shop"
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
    ::lbl_106::
    L7_2.label = L8_2
    L8_2 = Utils
    L8_2 = L8_2.CanInteract
    L7_2.canInteract = L8_2
    function L8_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3, L7_3
      L3_3 = CanOpenShop
      L4_3 = L5_2
      L3_3 = L3_3(L4_3)
      if not L3_3 then
        return
      end
      L3_3 = Config
      L3_3 = L3_3.DebugMode
      if L3_3 then
        L3_3 = print
        L4_3 = "interact with shop"
        L5_3 = A0_3
        L6_3 = A1_3
        L7_3 = A2_3
        L3_3(L4_3, L5_3, L6_3, L7_3)
      end
      L3_3 = L5_1
      L4_3 = L4_2
      L5_3 = A2_3
      L3_3(L4_3, L5_3)
    end
    L7_2.onInteract = L8_2
    L6_2(L7_2)
  end
end
L8_1 = {}
L8_1.Init = L7_1
L8_1.EndShopping = L6_1
Shop = L8_1

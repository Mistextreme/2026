local keybinds = {}
local keybindDefaults = {}
keybindDefaults.disabled = false
keybindDefaults.is_pressed = false
keybindDefaults.default_key = ""
keybindDefaults.default_mapper = "keyboard"

-- Function to get a keybind property
function getKeybindProperty(keybind, propertyName)
  if "currentKey" == propertyName then
    local currentKey = keybind.get_current_key(keybind)
    if currentKey then
      return currentKey
    end
  end
  return keybindDefaults[propertyName]
end

keybindDefaults.__index = getKeybindProperty

-- Function to get the instructional button
function getCurrentKey(keybind)
  local instructionButton = GetControlInstructionalButton(0, keybind.hash, true)
  return instructionButton.sub(instructionButton, 3)
end

keybindDefaults.get_current_key = getCurrentKey

-- Function to check if a control is pressed
function isControlPressed(keybind)
  return keybind.is_pressed
end

keybindDefaults.is_control_pressed = isControlPressed

-- Function to disable a keybind
function disableKeybind(keybind, isDisabled)
  keybind.disabled = isDisabled
end

keybindDefaults.disable = disableKeybind

-- Function to add a keybind
function add_keybind(keybindData)
  local commandName = "+" .. keybindData.name
  keybindData.hash = joaat(commandName) | 2147483648
  local keybindName = keybindData.name
  keybinds[keybindName] = setmetatable(keybindData, keybindDefaults)

  -- Register the command for when the key is pressed
  RegisterCommand(commandName, function()
    if not keybindData.disabled and not IsPauseMenuActive() then
      keybindData.is_pressed = true
      if keybindData.on_pressed then
        keybindData.on_pressed(keybindData)
      end
    end
  end)

  -- Register the command for when the key is released
  RegisterCommand("-" .. keybindData.name, function()
    if not keybindData.disabled and not IsPauseMenuActive() then
      keybindData.is_pressed = false
      if keybindData.on_released then
        keybindData.on_released(keybindData)
      end
    end
  end)

  -- Register the key mapping
  RegisterKeyMapping("+" .. keybindData.name, keybindData.description, keybindData.default_mapper, keybindData.default_key)

  -- Register the secondary key mapping, if it exists
  if keybindData.secondary_key then
    local secondaryMapper = keybindData.secondary_mapper or keybindData.default_mapper
    RegisterKeyMapping("~!+" .. keybindData.name, keybindData.description, secondaryMapper, keybindData.secondary_key)
  end

  -- Remove chat suggestions after a delay
  SetTimeout(500, function()
    TriggerEvent("chat:removeSuggestion", "/+%s", "/+%s".format(keybindData.name))
    TriggerEvent("chat:removeSuggestion", "/-%s", "/-%s".format(keybindData.name))
  end)

  return keybindData
end

-- Vehicle Module Types
VehicleModuleType = {}
VehicleModuleType.None = 0
VehicleModuleType.Land = 1
VehicleModuleType.Air = 2
VehicleModuleType.Water = 3

-- Engine States
EngineState = {}
EngineState.Good = 0
EngineState.Warning = 1
EngineState.Critical = 2

-- Priority Status
PriorityStatus = {}
PriorityStatus.Inactive = 0
PriorityStatus.Active = 1
PriorityStatus.Cooldown = 2
PriorityStatus.OnHold = 3

-- Control State
ControlState = {}
ControlState.Off = 0
ControlState.Hazard = 1
ControlState.LeftSignal = 2
ControlState.RightSignal = 3

-- Indicator
Indicator = {}
Indicator.Left = 1
Indicator.Right = 2
Indicator.Hazard = 3

-- Blip Sprites
BlipSprite = {}
BlipSprite.Standard = 1
BlipSprite.BigBlip = 2
BlipSprite.PoliceOfficer = 3
BlipSprite.PoliceArea = 4
BlipSprite.Square = 5
BlipSprite.Player = 6
BlipSprite.North = 7
BlipSprite.Waypoint = 8
BlipSprite.BigCircle = 9
BlipSprite.BigCircleOutline = 10
BlipSprite.ArrowUpOutlined = 11
BlipSprite.ArrowDownOutlined = 12
BlipSprite.ArrowUp = 13
BlipSprite.ArrowDown = 14
BlipSprite.PoliceHelicopterAnimated = 15
BlipSprite.Jet = 16
BlipSprite.Number1 = 17
BlipSprite.Number2 = 18
BlipSprite.Number3 = 19
BlipSprite.Number4 = 20
BlipSprite.Number5 = 21
BlipSprite.Number6 = 22
BlipSprite.Number7 = 23
BlipSprite.Number8 = 24
BlipSprite.Number9 = 25
BlipSprite.Number10 = 26
BlipSprite.GTAOCrew = 27
BlipSprite.GTAOFriendly = 28
BlipSprite.Lift = 36
BlipSprite.RaceFinish = 38
BlipSprite.Safehouse = 40
BlipSprite.PoliceOfficer2 = 41
BlipSprite.PoliceCarDot = 42
BlipSprite.PoliceHelicopter = 43
BlipSprite.ChatBubble = 47
BlipSprite.Garage2 = 50
BlipSprite.Drugs = 51
BlipSprite.Store = 52
BlipSprite.PoliceCar = 56
BlipSprite.PolicePlayer = 58
BlipSprite.PoliceStation = 60
BlipSprite.Hospital = 61
BlipSprite.Helicopter = 64
BlipSprite.StrangersAndFreaks = 65
BlipSprite.ArmoredTruck = 66
BlipSprite.TowTruck = 68
BlipSprite.Barber = 71
BlipSprite.LosSantosCustoms = 72
BlipSprite.Clothes = 73
BlipSprite.TattooParlor = 75
BlipSprite.Simeon = 76
BlipSprite.Lester = 77
BlipSprite.Michael = 78
BlipSprite.Trevor = 79
BlipSprite.Rampage = 84
BlipSprite.VinewoodTours = 85
BlipSprite.Lamar = 86
BlipSprite.Franklin = 88
BlipSprite.Chinese = 89
BlipSprite.Airport = 90
BlipSprite.Bar = 93
BlipSprite.BaseJump = 94
BlipSprite.CarWash = 100
BlipSprite.ComedyClub = 102
BlipSprite.Dart = 103
BlipSprite.FIB = 106
BlipSprite.DollarSign = 108
BlipSprite.Golf = 109
BlipSprite.AmmuNation = 110
BlipSprite.Exile = 112
BlipSprite.ShootingRange = 119
BlipSprite.Solomon = 120
BlipSprite.StripClub = 121
BlipSprite.Tennis = 122
BlipSprite.Triathlon = 126
BlipSprite.OffRoadRaceFinish = 127
BlipSprite.Key = 134
BlipSprite.MovieTheater = 135
BlipSprite.Music = 136
BlipSprite.Marijuana = 140
BlipSprite.Hunting = 141
BlipSprite.ArmsTraffickingGround = 147
BlipSprite.Nigel = 149
BlipSprite.AssaultRifle = 150
BlipSprite.Bat = 151
BlipSprite.Grenade = 152
BlipSprite.Health = 153
BlipSprite.Knife = 154
BlipSprite.Molotov = 155
BlipSprite.Pistol = 156
BlipSprite.RPG = 157
BlipSprite.Shotgun = 158
BlipSprite.SMG = 159
BlipSprite.Sniper = 160
BlipSprite.SonicWave = 161
BlipSprite.PointOfInterest = 162
BlipSprite.GTAOPassive = 163
BlipSprite.GTAOUsingMenu = 164
BlipSprite.Link = 171
BlipSprite.Minigun = 173
BlipSprite.GrenadeLauncher = 174
BlipSprite.Armor = 175
BlipSprite.Castle = 176
BlipSprite.Camera = 184
BlipSprite.Handcuffs = 188
BlipSprite.Yoga = 197
BlipSprite.Cab = 198
BlipSprite.Number11 = 199
BlipSprite.Number12 = 200
BlipSprite.Number13 = 201
BlipSprite.Number14 = 202
BlipSprite.Number15 = 203
BlipSprite.Number16 = 204
BlipSprite.Shrink = 205
BlipSprite.Epsilon = 206
BlipSprite.PersonalVehicleCar = 225
BlipSprite.PersonalVehicleBike = 226
BlipSprite.Custody = 237
BlipSprite.ArmsTraffickingAir = 251
BlipSprite.Fairground = 266
BlipSprite.PropertyManagement = 267
BlipSprite.Altruist = 269
BlipSprite.Enemy = 270
BlipSprite.Chop = 273
BlipSprite.Dead = 274
BlipSprite.Hooker = 279
BlipSprite.Friend = 280
BlipSprite.BountyHit = 303
BlipSprite.GTAOMission = 304
BlipSprite.GTAOSurvival = 305
BlipSprite.CrateDrop = 306
BlipSprite.PlaneDrop = 307
BlipSprite.Sub = 308
BlipSprite.Race = 309
BlipSprite.Deathmatch = 310
BlipSprite.ArmWrestling = 311
BlipSprite.AmmuNationShootingRange = 313
BlipSprite.RaceAir = 314
BlipSprite.RaceCar = 315
BlipSprite.RaceSea = 316
BlipSprite.GarbageTruck = 318
BlipSprite.SafehouseForSale = 350
BlipSprite.Package = 351
BlipSprite.MartinMadrazo = 352
BlipSprite.EnemyHelicopter = 353
BlipSprite.Boost = 354
BlipSprite.Devin = 355
BlipSprite.Marina = 356
BlipSprite.Garage = 357
BlipSprite.GolfFlag = 358
BlipSprite.Hangar = 359
BlipSprite.Helipad = 360
BlipSprite.JerryCan = 361
BlipSprite.Masks = 362
BlipSprite.HeistSetup = 363
BlipSprite.Incapacitated = 364
BlipSprite.PickupSpawn = 365
BlipSprite.BoilerSuit = 366
BlipSprite.Completed = 367
BlipSprite.Rockets = 368
BlipSprite.GarageForSale = 369
BlipSprite.HelipadForSale = 370
BlipSprite.MarinaForSale = 371
BlipSprite.HangarForSale = 372
BlipSprite.Business = 374
BlipSprite.BusinessForSale = 375
BlipSprite.RaceBike = 376
BlipSprite.Parachute = 377
BlipSprite.TeamDeathmatch = 378
BlipSprite.RaceFoot = 379
BlipSprite.VehicleDeathmatch = 380
BlipSprite.Barry = 381
BlipSprite.Dom = 382
BlipSprite.MaryAnn = 383
BlipSprite.Cletus = 384
BlipSprite.Josh = 385
BlipSprite.Minute = 386
BlipSprite.Omega = 387
BlipSprite.Tonya = 388
BlipSprite.Paparazzo = 389
BlipSprite.Crosshair = 390
BlipSprite.Creator = 398
BlipSprite.CreatorDirection = 399
BlipSprite.Abigail = 400
BlipSprite.Blimp = 401
BlipSprite.Repair = 402
BlipSprite.Testosterone = 403
BlipSprite.Dinghy = 404
BlipSprite.Fanatic = 405
BlipSprite.Information = 407
BlipSprite.CaptureBriefcase = 408
BlipSprite.LastTeamStanding = 409
BlipSprite.Boat = 410
BlipSprite.CaptureHouse = 411
BlipSprite.JerryCan2 = 415
BlipSprite.RP = 416
BlipSprite.GTAOPlayerSafehouse = 417
BlipSprite.GTAOPlayerSafehouseDead = 418
BlipSprite.CaptureAmericanFlag = 419
BlipSprite.CaptureFlag = 420
BlipSprite.Tank = 421
BlipSprite.HelicopterAnimated = 422
BlipSprite.Plane = 423
BlipSprite.PlayerNoColor = 425
BlipSprite.GunCar = 426
BlipSprite.Speedboat = 427
BlipSprite.Heist = 428
BlipSprite.Stopwatch = 430
BlipSprite.DollarSignCircled = 431
BlipSprite.Crosshair2 = 432
BlipSprite.DollarSignSquared = 434

-- Blip Colors
BlipColor = {}
BlipColor.White = 0
BlipColor.Red = 1
BlipColor.Green = 2
BlipColor.Blue = 3
BlipColor.MichaelBlue = 42
BlipColor.FranklinGreen = 43
BlipColor.TrevorOrange = 44
BlipColor.Yellow = 66

-- Function to check if a player has a permission
player_has_perm = function(permission)
  return rpc.invoke("has_perm", permission)
end

-- Utility functions for speed conversions
util = util or {}
util.mph = 2.237
util.kmh = 3.6
util.knots = 1.944
util.feet = 3.281
util.miles = 6.21371E-4
util.km = 0.001

-- Vehicle Door Indices
VehicleDoor = {}
VehicleDoor.FrontLeftDoor = 0
VehicleDoor.FrontRightDoor = 1
VehicleDoor.BackLeftDoor = 2
VehicleDoor.BackRightDoor = 3
VehicleDoor.Hood = 4
VehicleDoor.Trunk = 5

-- Utility function to check if a vehicle exists
util.vehicle_exists = function(vehicle)
  if DoesEntityExist(vehicle) then
    return GetEntityType(vehicle) == 2
  end
  return false
end

-- Utility function to get the maximum fuel level of a vehicle
util.get_max_fuel_level = function(vehicle)
  return GetVehicleHandlingFloat(vehicle, "CHandlingData", "fPetrolTankVolume")
end

local doorBones = {}
doorBones[0] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "door_dside_f")
end
doorBones[1] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "door_pside_f")
end
doorBones[2] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "door_dside_r")
end
doorBones[3] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "door_pside_r")
end
doorBones[4] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "bonnet")
end
doorBones[5] = function(vehicle)
  return GetEntityBoneIndexByName(vehicle, "boot")
end

-- Utility function to check if a vehicle has a door
util.vehicle_has_door = function(vehicle, doorIndex)
  if doorBones[doorIndex] then
    return doorBones[doorIndex](vehicle) ~= -1
  end
  return false
end

-- Utility function to check if a vehicle door is open
util.vehicle_door_is_open = function(vehicle, doorIndex)
  if not util.vehicle_has_door(vehicle, doorIndex) then
    return false
  end
  local boneIndex = doorBones[doorIndex](vehicle)
  return GetVehicleDoorAngleRatio(vehicle, boneIndex, vehicle) > 0.0
end

-- Utility function to check if the left signal is on
util.vehicle_is_left_sig_on = function(vehicle)
  local indicatorLights = GetVehicleIndicatorLights(vehicle)
  return indicatorLights == 1 or indicatorLights == 3
end

-- Utility function to check if the right signal is on
util.vehicle_is_right_sig_on = function(vehicle)
  local indicatorLights = GetVehicleIndicatorLights(vehicle)
  return indicatorLights >= 2
end

-- Utility function to check if a bone is valid
util.bone_is_valid = function(entity, boneIndex)
  if DoesEntityExist(entity) then
    return boneIndex ~= -1
  end
  return false
end

-- Utility function to calculate the distance squared between two vectors
util.distance_squared = function(vector1, vector2)
  local dx = vector1.x - vector2.x
  local dy = vector1.y - vector2.y
  local dz = vector1.z - vector2.z
  return dx * dx + dy * dy + dz * dz
end

-- Utility function to calculate the 2D distance squared between two vectors
util.distance_squared_2d = function(vector1, vector2)
  local dx = vector1.x - vector2.x
  local dy = vector1.y - vector2.y
  return dx * dx + dy * dy
end

-- Utility function to create a blip
util.create_blip = function(coords, name, sprite, color, route)
  if not route then
    route = false
  end
  local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
  SetBlipName(blip, name)
  SetBlipSprite(blip, sprite)
  SetBlipColour(blip, color)
  SetBlipRoute(blip, route)
  return blip
end

-- Utility function to get the street name at a coordinate
util.get_street_name = function(coords)
  local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
  return GetStreetNameFromHashKey(streetHash)
end

-- Control names
Control = {}
Control[0] = "NEXT_CAMERA"
Control[1] = "LOOK_LR"
Control[2] = "LOOK_UD"
Control[3] = "LOOK_UP_ONLY"
Control[4] = "LOOK_DOWN_ONLY"
Control[5] = "LOOK_LEFT_ONLY"
Control[6] = "LOOK_RIGHT_ONLY"
Control[7] = "CINEMATIC_SLOWMO"
Control[8] = "SCRIPTED_FLY_UD"
Control[9] = "SCRIPTED_FLY_LR"
Control[10] = "SCRIPTED_FLY_ZUP"
Control[11] = "SCRIPTED_FLY_ZDOWN"
Control[12] = "WEAPON_WHEEL_UD"
Control[13] = "WEAPON_WHEEL_LR"
Control[14] = "WEAPON_WHEEL_NEXT"
Control[15] = "WEAPON_WHEEL_PREV"
Control[16] = "SELECT_NEXT_WEAPON"
Control[17] = "SELECT_PREV_WEAPON"
Control[18] = "SKIP_CUTSCENE"
Control[19] = "CHARACTER_WHEEL"
Control[20] = "MULTIPLAYER_INFO"
Control[21] = "SPRINT"
Control[22] = "JUMP"
Control[23] = "ENTER"
Control[24] = "ATTACK"
Control[25] = "AIM"
Control[26] = "LOOK_BEHIND"
Control[27] = "PHONE"
Control[28] = "SPECIAL_ABILITY"
Control[29] = "SPECIAL_ABILITY_SECONDARY"
Control[30] = "MOVE_LR"
Control[31] = "MOVE_UD"
Control[32] = "MOVE_UP_ONLY"
Control[33] = "MOVE_DOWN_ONLY"
Control[34] = "MOVE_LEFT_ONLY"
Control[35] = "MOVE_RIGHT_ONLY"
Control[36] = "DUCK"
Control[37] = "SELECT_WEAPON"
Control[38] = "PICKUP"
Control[39] = "SNIPER_ZOOM"
Control[40] = "SNIPER_ZOOM_IN_ONLY"
Control[41] = "SNIPER_ZOOM_OUT_ONLY"
Control[42] = "SNIPER_ZOOM_IN_SECONDARY"
Control[43] = "SNIPER_ZOOM_OUT_SECONDARY"
Control[44] = "COVER"
Control[45] = "RELOAD"
Control[46] = "TALK"
Control[47] = "DETONATE"
Control[48] = "HUD_SPECIAL"
Control[49] = "ARREST"
Control[50] = "ACCURATE_AIM"
Control[51] = "CONTEXT"
Control[52] = "CONTEXT_SECONDARY"
Control[53] = "WEAPON_SPECIAL"
Control[54] = "WEAPON_SPECIAL_TWO"
Control[55] = "DIVE"
Control[56] = "DROP_WEAPON"
Control[57] = "DROP_AMMO"
Control[58] = "THROW_GRENADE"
Control[59] = "VEH_MOVE_LR"
Control[60] = "VEH_MOVE_UD"
Control[61] = "VEH_MOVE_UP_ONLY"
Control[62] = "VEH_MOVE_DOWN_ONLY"
Control[63] = "VEH_MOVE_LEFT_ONLY"
Control[64] = "VEH_MOVE_RIGHT_ONLY"
Control[65] = "VEH_SPECIAL"
Control[66] = "VEH_GUN_LR"
Control[67] = "VEH_GUN_UD"
Control[68] = "VEH_AIM"
Control[69] = "VEH_ATTACK"
Control[70] = "VEH_ATTACK2"
Control[71] = "VEH_ACCELERATE"
Control[72] = "VEH_BRAKE"
Control[73] = "VEH_DUCK"
Control[74] = "VEH_HEADLIGHT"
Control[75] = "VEH_EXIT"
Control[76] = "VEH_HANDBRAKE"
Control[77] = "VEH_HOTWIRE_LEFT"
Control[78] = "VEH_HOTWIRE_RIGHT"
Control[79] = "VEH_LOOK_BEHIND"
Control[80] = "VEH_CIN_CAM"
Control[81] = "VEH_NEXT_RADIO"
Control[82] = "VEH_PREV_RADIO"
Control[83] = "VEH_NEXT_RADIO_TRACK"
Control[84] = "VEH_PREV_RADIO_TRACK"
Control[85] = "VEH_RADIO_WHEEL"
Control[86] = "VEH_HORN"
Control[87] = "VEH_FLY_THROTTLE_UP"
Control[88] = "VEH_FLY_THROTTLE_DOWN"
Control[89] = "VEH_FLY_YAW_LEFT"
Control[90] = "VEH_FLY_YAW_RIGHT"
Control[91] = "VEH_PASSENGER_AIM"
Control[92] = "VEH_PASSENGER_ATTACK"
Control[93] = "VEH_SPECIAL_ABILITY_FRANKLIN"
Control[94] = "VEH_STUNT_UD"
Control[95] = "VEH_CINEMATIC_UD"
Control[96] = "VEH_CINEMATIC_UP_ONLY"
Control[97] = "VEH_CINEMATIC_DOWN_ONLY"
Control[98] = "VEH_CINEMATIC_LR"
Control[99] = "VEH_SELECT_NEXT_WEAPON"
Control[100] = "VEH_SELECT_PREV_WEAPON"
Control[101] = "VEH_ROOF"
Control[102] = "VEH_JUMP"
Control[103] = "VEH_GRAPPLING_HOOK"
Control[104] = "VEH_SHUFFLE"
Control[105] = "VEH_DROP_PROJECTILE"
Control[106] = "VEH_MOUSE_CONTROL_OVERRIDE"
Control[107] = "VEH_FLY_ROLL_LR"
Control[108] = "VEH_FLY_ROLL_LEFT_ONLY"
Control[109] = "VEH_FLY_ROLL_RIGHT_ONLY"
Control[110] = "VEH_FLY_PITCH_UD"
Control[111] = "VEH_FLY_PITCH_UP_ONLY"
Control[112] = "VEH_FLY_PITCH_DOWN_ONLY"
Control[113] = "VEH_FLY_UNDERCARRIAGE"
Control[114] = "VEH_FLY_ATTACK"
Control[115] = "VEH_FLY_SELECT_NEXT_WEAPON"
Control[116] = "VEH_FLY_SELECT_PREV_WEAPON"
Control[117] = "VEH_FLY_SELECT_TARGET_LEFT"
Control[118] = "VEH_FLY_SELECT_TARGET_RIGHT"
Control[119] = "VEH_FLY_VERTICAL_FLIGHT_MODE"
Control[120] = "VEH_FLY_DUCK"
Control[121] = "VEH_FLY_ATTACK_CAMERA"
Control[122] = "VEH_FLY_MOUSE_CONTROL_OVERRIDE"
Control[123] = "VEH_SUB_TURN_LR"
Control[124] = "VEH_SUB_TURN_LEFT_ONLY"
Control[125] = "VEH_SUB_TURN_RIGHT_ONLY"
Control[126] = "VEH_SUB_PITCH_UD"
Control[127] = "VEH_SUB_PITCH_UP_ONLY"
Control[128] = "VEH_SUB_PITCH_DOWN_ONLY"
Control[129] = "VEH_SUB_THROTTLE_UP"
Control[130] = "VEH_SUB_THROTTLE_DOWN"
Control[131] = "VEH_SUB_ASCEND"
Control[132] = "VEH_SUB_DESCEND"
Control[133] = "VEH_SUB_TURN_HARD_LEFT"
Control[134] = "VEH_SUB_TURN_HARD_RIGHT"
Control[135] = "VEH_SUB_MOUSE_CONTROL_OVERRIDE"
Control[136] = "VEH_PUSHBIKE_PEDAL"
Control[137] = "VEH_PUSHBIKE_SPRINT"
Control[138] = "VEH_PUSHBIKE_FRONT_BRAKE"
Control[139] = "VEH_PUSHBIKE_REAR_BRAKE"
Control[140] = "MELEE_ATTACK_LIGHT"
Control[141] = "MELEE_ATTACK_HEAVY"
Control[142] = "MELEE_ATTACK_ALTERNATE"
Control[143] = "MELEE_BLOCK"
Control[144] = "PARACHUTE_DEPLOY"
Control[145] = "PARACHUTE_DETACH"
Control[146] = "PARACHUTE_TURN_LR"
Control[147] = "PARACHUTE_TURN_LEFT_ONLY"
Control[148] = "PARACHUTE_TURN_RIGHT_ONLY"
Control[149] = "PARACHUTE_PITCH_UD"
Control[150] = "PARACHUTE_PITCH_UP_ONLY"
Control[151] = "PARACHUTE_PITCH_DOWN_ONLY"
Control[152] = "PARACHUTE_BRAKE_LEFT"
Control[153] = "PARACHUTE_BRAKE_RIGHT"
Control[154] = "PARACHUTE_SMOKE"
Control[155] = "PARACHUTE_PRECISION_LANDING"
Control[156] = "MAP"
Control[157] = "SELECT_WEAPON_UNARMED"
Control[158] = "SELECT_WEAPON_MELEE"
Control[159] = "SELECT_WEAPON_HANDGUN"
Control[160] = "SELECT_WEAPON_SHOTGUN"
Control[161] = "SELECT_WEAPON_SMG"
Control[162] = "SELECT_WEAPON_AUTO_RIFLE"
Control[163] = "SELECT_WEAPON_SNIPER"
Control[164] = "SELECT_WEAPON_HEAVY"
Control[165] = "SELECT_WEAPON_SPECIAL"
Control[166] = "SELECT_CHARACTER_MICHAEL"
Control[167] = "SELECT_CHARACTER_FRANKLIN"
Control[168] = "SELECT_CHARACTER_TREVOR"
Control[169] = "SELECT_CHARACTER_MULTIPLAYER"
Control[170] = "SAVE_REPLAY_CLIP"
Control[171] = "SPECIAL_ABILITY_PC"
Control[172] = "CELLPHONE_UP"
Control[173] = "CELLPHONE_DOWN"
Control[174] = "CELLPHONE_LEFT"
Control[175] = "CELLPHONE_RIGHT"
Control[176] = "CELLPHONE_SELECT"
Control[177] = "CELLPHONE_CANCEL"
Control[178] = "CELLPHONE_OPTION"
Control[179] = "CELLPHONE_EXTRA_OPTION"
Control[180] = "CELLPHONE_SCROLL_FORWARD"
Control[181] = "CELLPHONE_SCROLL_BACKWARD"
Control[182] = "CELLPHONE_CAMERA_FOCUS_LOCK"
Control[183] = "CELLPHONE_CAMERA_GRID"
Control[184] = "CELLPHONE_CAMERA_SELFIE"
Control[185] = "CELLPHONE_CAMERA_DOF"
Control[186] = "CELLPHONE_CAMERA_EXPRESSION"
Control[187] = "FRONTEND_DOWN"
Control[188] = "FRONTEND_UP"
Control[189] = "FRONTEND_LEFT"
Control[190] = "FRONTEND_RIGHT"
Control[191] = "FRONTEND_RDOWN"
Control[192] = "FRONTEND_RUP"
Control[193] = "FRONTEND_RLEFT"
Control[194] = "FRONTEND_RRIGHT"
Control[195] = "FRONTEND_AXIS_X"
Control[196] = "FRONTEND_AXIS_Y"
Control[197] = "FRONTEND_RIGHT_AXIS_X"
Control[198] = "FRONTEND_RIGHT_AXIS_Y"
Control[199] = "FRONTEND_PAUSE"
Control[200] = "FRONTEND_PAUSE_ALTERNATE"
Control[201] = "FRONTEND_ACCEPT"
Control[202] = "FRONTEND_CANCEL"
Control[203] = "FRONTEND_X"
Control[204] = "FRONTEND_Y"
Control[205] = "FRONTEND_LB"
Control[206] = "FRONTEND_RB"
Control[207] = "FRONTEND_LT"
Control[208] = "FRONTEND_RT"
Control[209] = "FRONTEND_LS"
Control[210] = "FRONTEND_RS"
Control[211] = "FRONTEND_LEADERBOARD"
Control[212] = "FRONTEND_SOCIAL_CLUB"
Control[213] = "FRONTEND_SOCIAL_CLUB_SECONDARY"
Control[214] = "FRONTEND_DELETE"
Control[215] = "FRONT
local controlMapping = {} -- Table to store control mappings

controlMapping[263] = "ENTER"
controlMapping[264] = "BACKSPACE"
controlMapping[265] = "SCROLL_FORWARD"
controlMapping[266] = "SCROLL_BACKWARD"
controlMapping[267] = "MOVE_RIGHT"
controlMapping[268] = "MOVE_UP"
controlMapping[269] = "MOVE_DOWN"
controlMapping[270] = "LOOK_LEFT"
controlMapping[271] = "LOOK_RIGHT"
controlMapping[272] = "LOOK_UP"
controlMapping[273] = "LOOK_DOWN"
controlMapping[274] = "SNIPER_ZOOM_IN"
controlMapping[275] = "SNIPER_ZOOM_OUT"
controlMapping[276] = "SNIPER_ZOOM_IN_ALTERNATE"
controlMapping[277] = "SNIPER_ZOOM_OUT_ALTERNATE"
controlMapping[278] = "VEH_MOVE_LEFT"
controlMapping[279] = "VEH_MOVE_RIGHT"
controlMapping[280] = "VEH_MOVE_UP"
controlMapping[281] = "VEH_MOVE_DOWN"
controlMapping[282] = "VEH_GUN_LEFT"
controlMapping[283] = "VEH_GUN_RIGHT"
controlMapping[284] = "VEH_GUN_UP"
controlMapping[285] = "VEH_GUN_DOWN"
controlMapping[286] = "VEH_LOOK_LEFT"
controlMapping[287] = "VEH_LOOK_RIGHT"
controlMapping[288] = "REPLAY_START_STOP_RECORDING"
controlMapping[289] = "REPLAY_START_STOP_RECORDING_SECONDARY"
controlMapping[290] = "SCALED_LOOK_LR"
controlMapping[291] = "SCALED_LOOK_UD"
controlMapping[292] = "SCALED_LOOK_UP_ONLY"
controlMapping[293] = "SCALED_LOOK_DOWN_ONLY"
controlMapping[294] = "SCALED_LOOK_LEFT_ONLY"
controlMapping[295] = "SCALED_LOOK_RIGHT_ONLY"
controlMapping[296] = "REPLAY_MARKER_DELETE"
controlMapping[297] = "REPLAY_CLIP_DELETE"
controlMapping[298] = "REPLAY_PAUSE"
controlMapping[299] = "REPLAY_REWIND"
controlMapping[300] = "REPLAY_FFWD"
controlMapping[301] = "REPLAY_NEWMARKER"
controlMapping[302] = "REPLAY_RECORD"
controlMapping[303] = "REPLAY_SCREENSHOT"
controlMapping[304] = "REPLAY_HIDEHUD"
controlMapping[305] = "REPLAY_STARTPOINT"
controlMapping[306] = "REPLAY_ENDPOINT"
controlMapping[307] = "REPLAY_ADVANCE"
controlMapping[308] = "REPLAY_BACK"
controlMapping[309] = "REPLAY_TOOLS"
controlMapping[310] = "REPLAY_RESTART"
controlMapping[311] = "REPLAY_SHOWHOTKEY"
controlMapping[312] = "REPLAY_CYCLEMARKERLEFT"
controlMapping[313] = "REPLAY_CYCLEMARKERRIGHT"
controlMapping[314] = "REPLAY_FOVINCREASE"
controlMapping[315] = "REPLAY_FOVDECREASE"
controlMapping[316] = "REPLAY_CAMERAUP"
controlMapping[317] = "REPLAY_CAMERADOWN"
controlMapping[318] = "REPLAY_SAVE"
controlMapping[319] = "REPLAY_TOGGLETIME"
controlMapping[320] = "REPLAY_TOGGLETIPS"
controlMapping[321] = "REPLAY_PREVIEW"
controlMapping[322] = "REPLAY_TOGGLE_TIMELINE"
controlMapping[323] = "REPLAY_TIMELINE_PICKUP_CLIP"
controlMapping[324] = "REPLAY_TIMELINE_DUPLICATE_CLIP"
controlMapping[325] = "REPLAY_TIMELINE_PLACE_CLIP"
controlMapping[326] = "REPLAY_CTRL"
controlMapping[327] = "REPLAY_TIMELINE_SAVE"
controlMapping[328] = "REPLAY_PREVIEW_AUDIO"
controlMapping[329] = "VEH_DRIVE_LOOK"
controlMapping[330] = "VEH_DRIVE_LOOK2"
controlMapping[331] = "VEH_FLY_ATTACK2"
controlMapping[332] = "RADIO_WHEEL_UD"
controlMapping[333] = "RADIO_WHEEL_LR"
controlMapping[334] = "VEH_SLOWMO_UD"
controlMapping[335] = "VEH_SLOWMO_UP_ONLY"
controlMapping[336] = "VEH_SLOWMO_DOWN_ONLY"
controlMapping[337] = "VEH_HYDRAULICS_CONTROL_TOGGLE"
controlMapping[338] = "VEH_HYDRAULICS_CONTROL_LEFT"
controlMapping[339] = "VEH_HYDRAULICS_CONTROL_RIGHT"
controlMapping[340] = "VEH_HYDRAULICS_CONTROL_UP"
controlMapping[341] = "VEH_HYDRAULICS_CONTROL_DOWN"
controlMapping[342] = "VEH_HYDRAULICS_CONTROL_UD"
controlMapping[343] = "VEH_HYDRAULICS_CONTROL_LR"
controlMapping[344] = "SWITCH_VISOR"
controlMapping[345] = "VEH_MELEE_HOLD"
controlMapping[346] = "VEH_MELEE_LEFT"
controlMapping[347] = "VEH_MELEE_RIGHT"
controlMapping[348] = "MAP_POI"
controlMapping[349] = "REPLAY_SNAPMATIC_PHOTO"
controlMapping[350] = "VEH_CAR_JUMP"
controlMapping[351] = "VEH_ROCKET_BOOST"
controlMapping[352] = "VEH_FLY_BOOST"
controlMapping[353] = "VEH_PARACHUTE"
controlMapping[354] = "VEH_BIKE_WINGS"
controlMapping[355] = "VEH_FLY_BOMB_BAY"
controlMapping[356] = "VEH_FLY_COUNTER"
controlMapping[357] = "VEH_TRANSFORM"
controlMapping[358] = "QUAD_LOCO_REVERSE"
controlMapping[359] = "RESPAWN_FASTER"
controlMapping[360] = "HUDMARKER_SELECT"

local util = {}

-- Function to get the control input string based on the control ID
function util.getControlInputString(controlId)
  return "INPUT_" .. controlMapping[controlId]
end

-- Function to set the blip name
function SetBlipName(blip, name)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName(name)
  EndTextCommandSetBlipName(blip)
end

-- Function to display help text this frame
function util.display_helptext_this_frame(text)
  BeginTextCommandDisplayHelp("STRING")
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandDisplayHelp(0, false, false, -1)
end

-- Function to show info using the feed post ticker
function util.show_info(text)
  BeginTextCommandThefeedPost("STRING")
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandThefeedPostTicker(true, false)
end

-- Function to get the vehicle speed in km/h
function GetVehicleSpeed(entity, multiplier)
  return GetEntitySpeed(entity) * multiplier
end

local unarmedWeaponHash = GetHashKey("WEAPON_UNARMED")

-- Function to get the weapon clip ammo
function GetWeaponClip(ped, weaponHash)
  if weaponHash == unarmedWeaponHash then
    return 1
  end

  if not HasPedGotWeapon(ped, weaponHash, false) then
    return 0
  end

  local _, ammoInClip = GetAmmoInClip(ped, weaponHash)
  return ammoInClip
end

-- Function to get the weapon ammo
function GetWeaponAmmo(ped, weaponHash)
  if weaponHash == unarmedWeaponHash then
    return 1
  end

  if not HasPedGotWeapon(ped, weaponHash, false) then
    return GetPedAmmoByType(ped, weaponHash)
  end

  return GetAmmoInPedWeapon(ped, weaponHash)
end

-- Function to get the game volume
function GetGameVolume()
  return GetProfileSetting(300) / 10
end

map = {}

-- Function to load the square map
function map.load(xOffset, yOffset, scale)
  local x = xOffset or 0
  local y = yOffset or 0.03
  local mapScale = scale or 0.95

  RequestStreamedTextureDict("squaremap", false)
  while not HasStreamedTextureDictLoaded("squaremap") do
    Wait(150)
  end

  SetMinimapClipType(0)
  AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
  AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")

  SetMinimapComponentPosition("minimap", "L", "B", 0.0 + x, -0.047 + y, 0.1638 * mapScale, 0.183 * mapScale)
  SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + x, 0.0 + y, 0.128 * mapScale, 0.2 * mapScale)
  SetMinimapComponentPosition("minimap_blur", "L", "B", -0.01 + x, 0.025 + y, 0.262 * mapScale, 0.3 * mapScale)

  SetBlipAlpha(GetNorthRadarBlip(), 0)
  SetBigmapActive(true, false)
  SetMinimapClipType(0)
  Wait(50)
  SetBigmapActive(false, false)
  Wait(50)
end

nui = {}
Nui = {}

-- Function to send a message to the NUI
function Nui.msg(moduleName, propertyName, value)
  nui.emit("state", {
    module = moduleName,
    prop = propertyName,
    value = value
  })
end

-- Function to emit an event to the NUI
function nui.emit(eventName, data)
  SendNUIMessage({
    type = "event",
    name = eventName,
    data = data
  })
end

-- Function to register a NUI callback
function nui.register(callbackName, callbackFunction)
  RegisterNUICallback(callbackName, function(data, cb)
    local result = callbackFunction(data)
    if result ~= nil then
      cb(result)
    else
      cb({ ok = true })
    end
  end)
end

-- Function to invoke a NUI callback and await the result
function nui.invoke(callbackName, data)
  local promise = promise.new()

  RegisterRawNuiCallback(callbackName, function(request, cb)
    promise:resolve(json.decode(request.body))
    cb({ body = "{}" })
  end)

  SendNUIMessage({
    type = "callback",
    name = callbackName,
    data = data
  })

  local result = Citizen.Await(promise)
  UnregisterRawNuiCallback(callbackName)
  return result
end

nui.register.get_locale = function()
  local localeFile = LoadResourceFile(GetCurrentResourceName(), string.format("locale/%s.json", config.general.locale))
  if not localeFile then
    localeFile = "{}"
  end
  return localeFile
end

local nuiLoaded = false

nui.register.loaded = function()
  nuiLoaded = true
end

-- Function to wait for the NUI to load
nui.wait = function()
  while true do
    if nuiLoaded then
      break
    end
    Citizen.Wait(0)
  end
end

-- Function to wait for the NUI to load and then execute a callback
nui.wait_then = function(callback)
  Citizen.CreateThread(function()
    nui.wait()
    callback()
  end)
end

msg = {}
msg.global = {}

-- Function to set the visibility of the global UI
msg.global.visible = function(isVisible)
  nui.emit("state", {
    module = "global",
    prop = "visible",
    value = isVisible
  })
end

-- Function to set the version of the global UI
msg.global.version = function(version)
  nui.emit("state", {
    module = "global",
    prop = "version",
    value = version
  })
end

-- Function to set the vehicle module of the global UI
msg.global.vehicleModule = function(vehicleModule)
  nui.emit("state", {
    module = "global",
    prop = "vehicleModule",
    value = vehicleModule
  })
end

-- Function to set the vehicle passenger status of the global UI
msg.global.vehicleIsPassenger = function(isPassenger)
  nui.emit("state", {
    module = "global",
    prop = "vehicleIsPassenger",
    value = isPassenger
  })
end

msg.config = {}

-- Function to set the visibility of the config UI
msg.config.visible = function(isVisible)
  nui.emit("config", {
    type = "visible",
    action = "set",
    value = isVisible
  })
end

-- Function to set the canExport config
msg.config.canExport = function(canExport)
  nui.emit("config", {
    type = "canExport",
    action = "set",
    value = canExport
  })
end

-- Function to set the canColor config
msg.config.canColor = function(canColor)
  nui.emit("config", {
    type = "canColor",
    action = "set",
    value = canColor
  })
end

-- Function to set the canAlign config
msg.config.canAlign = function(canAlign)
  nui.emit("config", {
    type = "canAlign",
    action = "set",
    value = canAlign
  })
end

-- Function to set the default colors config
msg.config.defColors = function(defaultColors)
  nui.emit("config", {
    type = "colors",
    action = "default",
    value = defaultColors
  })
end

-- Function to set the default layout config
msg.config.defLayout = function(defaultLayout)
  nui.emit("config", {
    type = "layout",
    action = "default",
    value = defaultLayout
  })
end

-- Function to set the default minimap config
msg.config.defMinimap = function(defaultMinimap)
  nui.emit("config", {
    type = "minimap",
    action = "default",
    value = defaultMinimap
  })
end

-- Function to reset the colors config
msg.config.resetColors = function()
  nui.emit("config", {
    type = "colors",
    action = "reset"
  })
end

-- Function to reset the layout config
msg.config.resetLayout = function()
  nui.emit("config", {
    type = "layout",
    action = "reset"
  })
end

-- Function to reset the minimap config
msg.config.resetMinimap = function()
  nui.emit("config", {
    type = "minimap",
    action = "reset"
  })
end

-- Function to load the colors config
msg.config.loadColors = function(colors)
  nui.emit("config", {
    type = "colors",
    action = "load",
    value = colors
  })
end

-- Function to load the layout config
msg.config.loadLayout = function(layout)
  nui.emit("config", {
    type = "layout",
    action = "load",
    value = layout
  })
end

-- Function to load the minimap config
msg.config.loadMinimap = function(minimap)
  nui.emit("config", {
    type = "minimap",
    action = "load",
    value = minimap
  })
end

msg.sound = {}

-- Function to play a sound
msg.sound.play = function(soundName)
  nui.emit("sound", {
    type = "play",
    value = soundName
  })
end

-- Function to play a looping sound
msg.sound.playLoop = function(soundName)
  nui.emit("sound", {
    type = "play_loop",
    value = soundName
  })
end

-- Function to stop a looping sound
msg.sound.stopLoop = function(soundName)
  nui.emit("sound", {
    type = "stop_loop",
    value = soundName
  })
end

-- Function to set the sound volume
msg.sound.volume = function(volume)
  nui.emit("sound", {
    type = "volume",
    value = volume
  })
end

msg.land = {}

-- Function to set the land vehicle speed
msg.land.speed = function(speed)
  nui.emit("state", {
    module = "land",
    prop = "speed",
    value = speed
  })
end

-- Function to set the land vehicle max speed
msg.land.speedMax = function(speedMax)
  nui.emit("state", {
    module = "land",
    prop = "speedMax",
    value = speedMax
  })
end

-- Function to set the land vehicle speed unit
msg.land.speedUnit = function(speedUnit)
  nui.emit("state", {
    module = "land",
    prop = "speedUnit",
    value = speedUnit
  })
end

-- Function to set the land vehicle gear
msg.land.gear = function(gear)
  nui.emit("state", {
    module = "land",
    prop = "gear",
    value = gear
  })
end

-- Function to set the land vehicle fuel
msg.land.fuel = function(fuel)
  nui.emit("state", {
    module = "land",
    prop = "fuel",
    value = fuel
  })
end

-- Function to set the land vehicle fuel warning
msg.land.fuelWarn = function(fuelWarn)
  nui.emit("state", {
    module = "land",
    prop = "fuelWarn",
    value = fuelWarn
  })
end

-- Function to set the land vehicle seatbelt status
msg.land.seatbelt = function(seatbelt)
  nui.emit("state", {
    module = "land",
    prop = "seatbelt",
    value = seatbelt
  })
end

-- Function to set the land vehicle front left door status
msg.land.doorFrontLeft = function(doorFrontLeft)
  nui.emit("state", {
    module = "land",
    prop = "doorFrontLeft",
    value = doorFrontLeft
  })
end

-- Function to set the land vehicle front right door status
msg.land.doorFrontRight = function(doorFrontRight)
  nui.emit("state", {
    module = "land",
    prop = "doorFrontRight",
    value = doorFrontRight
  })
end

-- Function to set the land vehicle back left door status
msg.land.doorBackLeft = function(doorBackLeft)
  nui.emit("state", {
    module = "land",
    prop = "doorBackLeft",
    value = doorBackLeft
  })
end

-- Function to set the land vehicle back right door status
msg.land.doorBackRight = function(doorBackRight)
  nui.emit("state", {
    module = "land",
    prop = "doorBackRight",
    value = doorBackRight
  })
end

-- Function to set the land vehicle engine status
msg.land.engine = function(engine)
  nui.emit("state", {
    module = "land",
    prop = "engine",
    value = engine
  })
end

-- Function to set the land vehicle engine state
msg.land.engineState = function(engineState)
  nui.emit("state", {
    module = "land",
    prop = "engineState",
    value = engineState
  })
end

-- Function to set the land vehicle hazard lights status
msg.land.hazard = function(hazard)
  nui.emit("state", {
    module = "land",
    prop = "hazard",
    value = hazard
  })
end

-- Function to set the land vehicle low beams status
msg.land.beamsLow = function(beamsLow)
  nui.emit("state", {
    module = "land",
    prop = "beamsLow",
    value = beamsLow
  })
end

-- Function to set the land vehicle high beams status
msg.land.beamsHigh = function(beamsHigh)
  nui.emit("state", {
    module = "land",
    prop = "beamsHigh",
    value = beamsHigh
  })
end

-- Function to set the land vehicle left signal status
msg.land.sigLeft = function(sigLeft)
  nui.emit("state", {
    module = "land",
    prop = "sigLeft",
    value = sigLeft
  })
end

-- Function to set the land vehicle right signal status
msg.land.sigRight = function(sigRight)
  nui.emit("state", {
    module = "land",
    prop = "sigRight",
    value = sigRight
  })
end

-- Function to set the land vehicle motorcycle status
msg.land.isMotorcycle = function(isMotorcycle)
  nui.emit("state", {
    module = "land",
    prop = "isMotorcycle",
    value = isMotorcycle
  })
end

-- Function to set the land vehicle electric status
msg.land.isElectric = function(isElectric)
  nui.emit("state", {
    module = "land",
    prop = "isElectric",
    value = isElectric
  })
end

-- Function to set the land vehicle show passenger status
msg.land.showPassenger = function(showPassenger)
  nui.emit("state", {
    module = "land",
    prop = "showPassenger",
    value = showPassenger
  })
end

-- Function to set the land vehicle seatbelt only status
msg.land.seatbeltOnly = function(seatbeltOnly)
  nui.emit("state", {
    module = "land",
    prop = "seatbeltOnly",
    value = seatbeltOnly
  })
end

msg.air = {}

-- Function to set the air vehicle speed
msg.air.speed = function(speed)
  nui.emit("state", {
    module = "air",
    prop = "speed",
    value = speed
  })
end

-- Function to set the air vehicle pitch
msg.air.pitch = function(pitch)
  nui.emit("state", {
    module = "air",
    prop = "pitch",
    value = pitch
  })
end

-- Function to set the air vehicle roll
msg.air.roll = function(roll)
  nui.emit("state", {
    module = "air",
    prop = "roll",
    value = roll
  })
end

-- Function to set the air vehicle altitude
msg.air.altitude = function(altitude)
  nui.emit("state", {
    module = "air",
    prop = "altitude",
    value = altitude
  })
end

-- Function to set the air vehicle engine status
msg.air.engine = function(engine)
  nui.emit("state", {
    module = "air",
    prop = "engine",
    value = engine
  })
end

-- Function to set the air vehicle engine state
msg.air.engineState = function(engineState)
  nui.emit("state", {
    module = "air",
    prop = "engineState",
    value = engineState
  })
end

-- Function to set the air vehicle gear
msg.air.gear = function(gear)
  nui.emit("state", {
    module = "air",
    prop = "gear",
    value = gear
  })
end

-- Function to set the air vehicle compartment status
msg.air.compartment = function(compartment)
  nui.emit("state", {
    module = "air",
    prop = "compartment",
    value = compartment
  })
end

-- Function to set the air vehicle low beams status
msg.air.beamsLow = function(beamsLow)
  nui.emit("state", {
    module = "air",
    prop = "beamsLow",
    value = beamsLow
  })
end

-- Function to set the air vehicle high beams status
msg.air.beamsHigh = function(beamsHigh)
  nui.emit("state", {
    module = "air",
    prop = "beamsHigh",
    value = beamsHigh
  })
end

-- Function to set the air vehicle fuelable status
msg.air.fuelable = function(fuelable)
  nui.emit("state", {
    module = "air",
    prop = "fuelable",
    value = fuelable
  })
end

-- Function to set the air vehicle fuel
msg.air.fuel = function(fuel)
  nui.emit("state", {
    module = "air",
    prop = "fuel",
    value = fuel
  })
end

-- Function to set the air vehicle fuel warning
msg.air.fuelWarn = function(fuelWarn)
  nui.emit("state", {
    module = "air",
    prop = "fuelWarn",
    value = fuelWarn
  })
end

-- Function to set the air vehicle show passenger status
msg.air.showPassenger = function(showPassenger)
  nui.emit("state", {
    module = "air",
    prop = "showPassenger",
    value = showPassenger
  })
end

-- Function to set the air vehicle copilot status
msg.air.isCopilot = function(isCopilot)
  nui.emit("state", {
    module = "air",
    prop = "isCopilot",
    value = isCopilot
  })
end

msg.water = {}

-- Function to set the water vehicle speed
msg.water.speed = function(speed)
  nui.emit("state", {
    module = "water",
    prop = "speed",
    value = speed
  })
end
-- Initialize NUI communication
nui = {}
nui.emit = function(event, data)
  SendNuiMessage(json.encode({event = event, data = data}))
end
nui.invoke = function(event, data)
  return Citizen.Await(function(callback)
    SendNuiMessage(json.encode({event = event, data = data, callback = true}))
    RegisterNuiCallback(event, function(data, cb)
      cb("ok")
      callback(data)
    end)
  end)
end
nui.wait = function()
  RegisterNuiCallback("__loaded", function(data, cb)
    cb("ok")
  end)
end

-- Define functions to send NUI messages for different modules and properties
msg = {}
msg.land = {}
msg.land.speed = function(speed)
  nui.emit("state", {module = "land", prop = "speed", value = speed})
end
msg.land.rpm = function(rpm)
  nui.emit("state", {module = "land", prop = "rpm", value = rpm})
end
msg.land.gear = function(gear)
  nui.emit("state", {module = "land", prop = "gear", value = gear})
end
msg.land.seatbelt = function(seatbelt)
  nui.emit("state", {module = "land", prop = "seatbelt", value = seatbelt})
end
msg.land.street = function(street)
  nui.emit("state", {module = "land", prop = "street", value = street})
end
msg.land.zone = function(zone)
  nui.emit("state", {module = "land", prop = "zone", value = zone})
end
msg.land.heading = function(heading)
  nui.emit("state", {module = "land", prop = "heading", value = heading})
end
msg.land.fuel = function(fuel)
  nui.emit("state", {module = "land", prop = "fuel", value = fuel})
end
msg.land.showFuel = function(showFuel)
  nui.emit("state", {module = "land", prop = "showFuel", value = showFuel})
end
msg.land.showPassenger = function(showPassenger)
  nui.emit("state", {module = "land", prop = "showPassenger", value = showPassenger})
end
msg.land.seatbeltOnly = function(seatbeltOnly)
  nui.emit("state", {module = "land", prop = "seatbeltOnly", value = seatbeltOnly})
end
msg.air = {}
msg.air.speed = function(speed)
  nui.emit("state", {module = "air", prop = "speed", value = speed})
end
msg.air.altitude = function(altitude)
  nui.emit("state", {module = "air", prop = "altitude", value = altitude})
end
msg.air.heading = function(heading)
  nui.emit("state", {module = "air", prop = "heading", value = heading})
end
msg.air.showPassenger = function(showPassenger)
  nui.emit("state", {module = "air", prop = "showPassenger", value = showPassenger})
end
msg.water = {}
msg.water.speed = function(speed)
  nui.emit("state", {module = "water", prop = "speed", value = speed})
end
msg.water.fuel = function(fuel)
  nui.emit("state", {module = "water", prop = "fuel", value = fuel})
end
msg.water.showFuel = function(showFuel)
  nui.emit("state", {module = "water", prop = "showFuel", value = showFuel})
end
msg.water.anchor = function(anchor)
  nui.emit("state", {module = "water", prop = "anchor", value = anchor})
end
msg.water.beamsLow = function(beamsLow)
  nui.emit("state", {module = "water", prop = "beamsLow", value = beamsLow})
end
msg.water.beamsHigh = function(beamsHigh)
  nui.emit("state", {module = "water", prop = "beamsHigh", value = beamsHigh})
end
msg.water.engine = function(engine)
  nui.emit("state", {module = "water", prop = "engine", value = engine})
end
msg.water.showPassenger = function(showPassenger)
  nui.emit("state", {module = "water", prop = "showPassenger", value = showPassenger})
end
msg.info = {}
msg.info.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "enabled", value = enabled})
end
msg.info.postal = {}
msg.info.postal.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "postalEnabled", value = enabled})
end
msg.info.postal.code = function(code)
  nui.emit("state", {module = "info", prop = "postalCode", value = code})
end
msg.info.postal.distance = function(distance)
  nui.emit("state", {module = "info", prop = "postalDistance", value = distance})
end
msg.info.priority = {}
msg.info.priority.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "priEnabled", value = enabled})
end
msg.info.priority.hideUsername = function(hideUsername)
  nui.emit("state", {module = "info", prop = "priHideUsername", value = hideUsername})
end
msg.info.priority.status = function(status)
  nui.emit("state", {module = "info", prop = "priStatus", value = status})
end
msg.info.priority.username = function(username)
  nui.emit("state", {module = "info", prop = "priUsername", value = username})
end
msg.info.priority.cooldown = function(cooldown)
  nui.emit("state", {module = "info", prop = "priCooldown", value = cooldown})
end
msg.info.aop = {}
msg.info.aop.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "aopEnabled", value = enabled})
end
msg.info.aop.text = function(text)
  nui.emit("state", {module = "info", prop = "aopText", value = text})
end
msg.info.peacetime = {}
msg.info.peacetime.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "ptEnabled", value = enabled})
end
msg.info.peacetime.active = function(active)
  nui.emit("state", {module = "info", prop = "ptActive", value = active})
end
msg.info.location = {}
msg.info.location.enabled = function(enabled)
  nui.emit("state", {module = "info", prop = "locEnabled", value = enabled})
end
msg.info.location.vehicle_only = function(vehicleOnly)
  nui.emit("state", {module = "info", prop = "locVehicleOnly", value = vehicleOnly})
end
msg.info.location.show_passenger = function(showPassenger)
  nui.emit("state", {module = "info", prop = "locShowPassenger", value = showPassenger})
end
msg.info.location.bearing = function(bearing)
  nui.emit("state", {module = "info", prop = "locBearing", value = bearing})
end
msg.info.location.street = function(street)
  nui.emit("state", {module = "info", prop = "locStreet", value = street})
end
msg.info.location.zone = function(zone)
  nui.emit("state", {module = "info", prop = "locZone", value = zone})
end
msg.player = {}
msg.player.enabled = function(enabled)
  nui.emit("state", {module = "player", prop = "enabled", value = enabled})
end
msg.player.showWeaponIcon = function(showWeaponIcon)
  nui.emit("state", {module = "player", prop = "showWeaponIcon", value = showWeaponIcon})
end
msg.player.health = function(health)
  nui.emit("state", {module = "player", prop = "health", value = health})
end
msg.player.armor = function(armor)
  nui.emit("state", {module = "player", prop = "armor", value = armor})
end
msg.player.oxygen = function(oxygen)
  nui.emit("state", {module = "player", prop = "oxygen", value = oxygen})
end
msg.player.swimming = function(swimming)
  nui.emit("state", {module = "player", prop = "swimming", value = swimming})
end
msg.player.weapClip = function(weapClip)
  nui.emit("state", {module = "player", prop = "weapClip", value = weapClip})
end
msg.player.weapAmmo = function(weapAmmo)
  nui.emit("state", {module = "player", prop = "weapAmmo", value = weapAmmo})
end
msg.player.weap = function(weap)
  nui.emit("state", {module = "player", prop = "weap", value = weap})
end
msg.speed_limit = {}
msg.speed_limit.enabled = function(enabled)
  nui.emit("state", {module = "speed_limit", prop = "enabled", value = enabled})
end
msg.speed_limit.show_passenger = function(showPassenger)
  nui.emit("state", {module = "speed_limit", prop = "showPassenger", value = showPassenger})
end
msg.speed_limit.value = function(value)
  nui.emit("state", {module = "speed_limit", prop = "value", value = value})
end
msg.minimap = {}
msg.minimap.enabled = function(enabled)
  nui.emit("state", {module = "minimap", prop = "enabled", value = enabled})
end
msg.minimap.border = function(border)
  nui.emit("state", {module = "minimap", prop = "border", value = border})
end
msg.minimap.vehicleOnly = function(vehicleOnly)
  nui.emit("state", {module = "minimap", prop = "vehicleOnly", value = vehicleOnly})
end

-- Generate a unique ID
local isRandomSeedInitialized = false
local idCounter = 0

local function initializeRandomSeed()
  if isRandomSeedInitialized then
    return
  end

  local timer = GetGameTimer()
  local cloudTime = GetCloudTimeAsInt()
  local seed = timer ~ cloudTime
  local resourceName = GetCurrentResourceName()
  local resourceHash = GetHashKey(resourceName) & 2147483647
  seed = seed ~ resourceHash
  math.randomseed(seed)
  isRandomSeedInitialized = true
end

local function generateUniqueId()
  initializeRandomSeed()
  idCounter = idCounter + 1
  return "%s-%06x-%d":format(GetCurrentResourceName(), math.random(0, 16777215), idCounter)
end

-- Resource loading and throttling
local isThrottled = false
local throttledResourceName = nil
local throttleEndTime = 0
local throttleDuration = 100
local resourceIdMap = {}

local function applyResourceThrottle(duration)
  local invokingResource = GetInvokingResource()
  if not invokingResource then
    invokingResource = GetCurrentResourceName()
  end

  local currentTime = GetGameTimer()

  while true do
    local currentTime = GetGameTimer()

    if isThrottled then
      if throttledResourceName ~= invokingResource then
        if duration then
          if currentTime - throttleStartTime < duration then
            Wait(0)
          else
            break
          end
        end
        Wait(0)
      else
        if duration then
          if currentTime - throttleStartTime < duration then
            Wait(0)
          else
            break
          end
        end
        Wait(0)
      end
    else
      if throttledResourceName ~= invokingResource and throttledResourceName ~= nil then
        if throttleEndTime < currentTime then
          if duration then
            if currentTime - throttleStartTime < duration then
              break
            end
          end
          Wait(0)
        end
      else
        isThrottled = true
        throttledResourceName = invokingResource
        throttleEndTime = currentTime + throttleDuration
        break
      end
    end
  end
end

local function resetResourceThrottle()
  isThrottled = false
  throttleEndTime = GetGameTimer() + throttleDuration
end

-- Info panel management
Info = {}
local isNuiReady = false

RegisterNuiCallback("info:ready", function()
  isNuiReady = true
end)

Info.create = function(options)
  if not options then
    options = {}
  end

  local infoPanel = {}
  infoPanel.id = options.id or generateUniqueId()
  infoPanel.visible = options.visible ~= nil and options.visible or true
  infoPanel.label = options.label
  infoPanel.style = options.style
  infoPanel.content = options.content ~= nil and options.content or ""
  infoPanel.wrap = options.wrap ~= nil and options.wrap or true

  infoPanel.update_visible = function(self, visible)
    self.visible = visible
    nui.emit("info:visible", {id = self.id, visible = visible})
  end

  infoPanel.update_label = function(self, label)
    self.label = label
    nui.emit("info:label", {id = self.id, label = label})
  end

  infoPanel.update_style = function(self, style)
    self.style = style
    nui.emit("info:style", {id = self.id, style = style})
  end

  infoPanel.update_content = function(self, content)
    self.content = content
    nui.emit("info:content", {id = self.id, content = content})
  end

  infoPanel.update_wrap = function(self, wrap)
    self.wrap = wrap
    nui.emit("info:wrap", {id = self.id, wrap = wrap})
  end

  repeat
    Wait(0)
  until isNuiReady

  applyResourceThrottle(2000)

  if options.id then
    nui.invoke("info:remove", infoPanel.id)
    Wait(0)
  end

  local resourceName = options.__res or GetInvokingResource() or GetCurrentResourceName()
  local afterId = resourceIdMap[resourceName]

  local success = nui.invoke("info:add", {
    id = infoPanel.id,
    visible = infoPanel.visible,
    label = infoPanel.label,
    style = infoPanel.style,
    content = infoPanel.content,
    wrap = infoPanel.wrap,
    res = resourceName,
    afterId = afterId,
  })

  resetResourceThrottle()

  if success then
    resourceIdMap[resourceName] = infoPanel.id
    return infoPanel
  end

  return nil
end

Info.remove = function(id)
  applyResourceThrottle(2000)
  local success = nui.invoke("info:remove", id)
  resetResourceThrottle()
  return success
end

-- Exported functions
exports("set_indicator_seatbelt", function(seatbelt)
  msg.land.seatbelt(seatbelt)
end)

exports("set_indicator_anchor", function(anchor)
  msg.water.anchor(anchor)
end)

exports("get_visible", function()
  return not get_hud_hidden()
end)

exports("set_visible", function(visible)
  set_hud_hidden(not visible)
end)

exports("toggle_visible", function()
  toggle_hud_hidden()
end)

exports("create_info", function(options)
  if not options then
    options = {}
  end

  options.__res = GetInvokingResource() or GetCurrentResourceName()
  return Info.create(options)
end)

exports("remove_info", Info.remove)

exports("getPostal", function()
  return Postal.nearest
end)

exports("get_postal", function()
  return Postal.nearest
end)

-- Bridge initialization
bridge.init(bridge)

-- Framework functions
bridge.getPlayerData = function()
  if bridge.framework == "qb" then
    return bridge.Functions.GetPlayerData()
  elseif bridge.framework == "esx" then
    return bridge.GetPlayerData()
  end
  return nil
end

if bridge.framework == "qb" then
  bridge.is_player_loaded = function()
    return LocalPlayer.state.isLoggedIn
  end
elseif bridge.framework == "esx" then
  bridge.is_player_loaded = function()
    return bridge.IsPlayerLoaded()
  end
elseif bridge.framework == "nd" then
  local isNdCharacterLoaded = false

  RegisterNetEvent("ND:characterLoaded")
  AddEventHandler("ND:characterLoaded", function()
    isNdCharacterLoaded = true
  end)

  RegisterNetEvent("ND:characterUnloaded")
  AddEventHandler("ND:characterUnloaded", function()
    isNdCharacterLoaded = false
  end)

  bridge.is_player_loaded = function()
    return isNdCharacterLoaded
  end
else
  bridge.is_player_loaded = function()
    return true
  end
end

-- Vehicle module configuration
local vehicleModuleConfig = {}

if config.modules.air.enabled then
  vehicleModuleConfig[15] = VehicleModuleType.Air
else
  vehicleModuleConfig[15] = VehicleModuleType.None
end

if config.modules.air.enabled then
  vehicleModuleConfig[16] = VehicleModuleType.Air
else
  vehicleModuleConfig[16] = VehicleModuleType.None
end

if config.modules.water.enabled then
  vehicleModuleConfig[14] = VehicleModuleType.Water
else
  vehicleModuleConfig[14] = VehicleModuleType.None
end

if config.modules.land.enabled then
  vehicleModuleConfig["default"] = VehicleModuleType.Land
else
  vehicleModuleConfig["default"] = VehicleModuleType.None
end

-- HUD state variables
hud = {}
hud.is_visible = false
hud.vehicle_module = VehicleModuleType.None
hud.vehicle_is_passenger = false
hud.vehicle_is_copilot = false
hud.is_config = false
hud.can_config = player_has_perm(config.permissions.config_panel.config)
hud.can_color = player_has_perm(config.permissions.config_panel.color)
hud.can_align = player_has_perm(config.permissions.config_panel.layout)
hud.can_export = player_has_perm(config.permissions.config_panel.export)

-- Player state variables
player_spawned = false

-- Module state variables
is_seatbelt_on = false
is_cruise_control_on = false
is_in_safezone = false
is_in_vehicle = false

-- Module configuration variables
local isElectricGaugeEnabled = config.modules.land.fuel.electric_gauge

-- Other variables
local isHudHidden = false

-- HUD visibility functions
local function get_hud_hidden()
  return isHudHidden
end

local function set_hud_hidden(hidden)
  isHudHidden = hidden
end

local function toggle_hud_hidden()
  isHudHidden = not isHudHidden
end

-- Main thread
Citizen.CreateThread(function()
  Wait(0)
  nui.wait()

  -- Initial NUI setup
  msg.land.showPassenger(config.modules.land.passenger.show)
  msg.land.seatbeltOnly(config.modules.land.passenger.seatbelt_only)
  msg.air.showPassenger(config.modules.air.show_passenger)
  msg.water.showPassenger(config.modules.water.show_passenger)
  msg.info.priority.hideUsername(config.modules.info.priority.hide_username)

  -- Load vehicle blacklist
  local vehicleBlacklist = {}

  local fileContent = LoadResourceFile(GetCurrentResourceName(), "data/vehicle_blacklist.json")
  if fileContent then
    local decodedData = json.decode(fileContent)
    if decodedData then
      for _, vehicleName in ipairs(decodedData) do
        local vehicleHash = GetHashKey(vehicleName)
        vehicleBlacklist[vehicleHash] = true
      end
    end
  end
end)
-- Global variables (ensure these are defined in other related files as well)
Fuel = Fuel or {}
Fuel.inFuelableVehicle = false
Fuel.currentStationIndex = -1

local player_spawned = false
local hud = hud or {}
local config = config or {}
local msg = msg or {}
local nui = nui or {}
local chat = chat or {}
local util = util or {}
local bridge = bridge or {}
local events = events or {}
local json = json or {}

local VehicleModuleType = {
  None = 0,
  Land = 1,
  Air = 2
}

local vehicleTypeMapping = {
  [0] = VehicleModuleType.Land,
  [1] = VehicleModuleType.Land,
  [2] = VehicleModuleType.Land,
  [3] = VehicleModuleType.Land,
  [4] = VehicleModuleType.Land,
  [5] = VehicleModuleType.Land,
  [6] = VehicleModuleType.Land,
  [7] = VehicleModuleType.Land,
  [8] = VehicleModuleType.Land,
  [9] = VehicleModuleType.Land,
  [10] = VehicleModuleType.Land,
  [11] = VehicleModuleType.Land,
  [12] = VehicleModuleType.Air,
  [13] = VehicleModuleType.Air,
  [14] = VehicleModuleType.Land,
  [15] = VehicleModuleType.Land,
  default = VehicleModuleType.Land
}

local canShowHud = true -- Renamed L20_1 to a more descriptive name
local canConfigHud = false -- Renamed L21_1 to a more descriptive name
local isMotorcycle = false -- Renamed L22_1 to a more descriptive name
local isElectric = false -- Renamed L23_1 to a more descriptive name
local isRadarVisible = true -- Renamed L25_1 to a more descriptive name
local canShowConfig = true -- Renamed L26_1 to a more descriptive name
local lastGameVolume = 0 -- Renamed L27_1 to a more descriptive name

-- Function to update vehicle module type and related states
local UpdateVehicleModule = function(vehicleModule, isBike, isPassenger, isCopilot, isElectricVehicle)
  if not isBike then
    isBike = false
  end

  if not isMotorcycle then
    isMotorcycle = false
  end

  if isMotorcycle ~= isBike then
    isMotorcycle = isBike
    msg.land.isMotorcycle(isBike)
  end

  if not isElectricVehicle then
    isElectricVehicle = false
  end

  if not isRadarVisible then
    if not isElectric then
      isElectric = false
    end

    if isElectric ~= isElectricVehicle then
      isElectric = isElectricVehicle
      msg.land.isElectric(isElectricVehicle)
    end
  end

  if hud.vehicle_module ~= vehicleModule then
    hud.vehicle_module = vehicleModule
    land_module.is_bike = isBike
    msg.global.vehicleModule(hud.vehicle_module)
  end

  if not isCopilot then
    isCopilot = false
  end

  if hud.vehicle_is_copilot ~= isCopilot then
    hud.vehicle_is_copilot = isCopilot
    msg.air.isCopilot(isCopilot)
  end

  if not isPassenger then
    isPassenger = false
  end

  if hud.vehicle_is_passenger ~= isPassenger then
    hud.vehicle_is_passenger = isPassenger
    msg.global.vehicleIsPassenger(isPassenger)
  end
end

-- Main client tick function
local function ClientTick()
  Citizen.Wait(config.general.tick_delay)

  if canShowConfig then
    if canConfigHud ~= hud.is_config then
      canConfigHud = hud.is_config
      msg.config.visible(canConfigHud)
      SetNuiFocus(canConfigHud, canConfigHud)
    end
  end

  local isScreenFadedOut = IsScreenFadedOut()
  local isPauseMenuActive = IsPauseMenuActive()

  local isHudVisible = canShowHud
  if player_spawned then
    isHudVisible = not bridge.is_player_loaded
  end

  if hud.is_visible ~= isHudVisible then
    hud.is_visible = isHudVisible
    msg.global.visible(hud.is_visible)
  end

  local playerPed = PlayerPedId()
  local minimapVehicleOnly = config.modules.minimap.vehicle_only

  if minimapVehicleOnly then
    local isInVehicle = IsPedInAnyVehicle(playerPed, false)
    if not isInVehicle then
      isInVehicle = hud.is_config
    end

    if isRadarVisible ~= isInVehicle then
      isRadarVisible = isInVehicle
      DisplayRadar(isRadarVisible)
    end
  end

  if not hud.is_visible then
    return
  end

  if hud.is_config then
    return
  end

  if not playerPed then
    UpdateVehicleModule(VehicleModuleType.None)
    return
  end

  local vehicle = GetVehiclePedIsIn(playerPed, false)
  local vehicleExists = vehicle ~= 0 and util.vehicle_exists

  if vehicleExists then
    local vehicleModel = GetEntityModel(vehicle)
    if vehicleTypeMapping[vehicleModel] then
      UpdateVehicleModule(VehicleModuleType.None)
      return
    end

    local isBicycle = IsThisModelABicycle(vehicleModel)
    if isBicycle then
      UpdateVehicleModule(VehicleModuleType.None)
    else
      local isBike = IsThisModelABike(vehicleModel)
      local vehicleClass = GetVehicleClass(vehicle)
      local vehicleModuleType = vehicleTypeMapping[vehicleClass] or vehicleTypeMapping.default
      local isCopilot = GetPedInVehicleSeat(vehicle, -1) ~= playerPed
      local isElectricVehicle = GetIsVehicleElectric(vehicleModel)

      local isCopilotSeatTaken = false
      if isCopilot then
        if vehicleModuleType == VehicleModuleType.Air then
          local copilotPed = GetPedInVehicleSeat(vehicle, 0)
          isCopilotSeatTaken = copilotPed == playerPed
        end
      end

      UpdateVehicleModule(vehicleModuleType, isBike, isCopilot, isCopilotSeatTaken, isElectricVehicle)
    end
  else
    UpdateVehicleModule(VehicleModuleType.None)
  end
end

-- Main loop
Citizen.CreateThread(function()
  while true do
    ClientTick()
  end
end)

-- Hide HUD components
Citizen.CreateThread(function()
  Citizen.Wait(0)
  while true do
    Citizen.Wait(0)
    HideHudComponentThisFrame(2)  -- Area Name
    HideHudComponentThisFrame(3)  -- Vehicle Name
    HideHudComponentThisFrame(4)  -- Street Name
    HideHudComponentThisFrame(6)  -- Help Text
    HideHudComponentThisFrame(7)  -- Radio Station
    HideHudComponentThisFrame(8)  -- Cash
    HideHudComponentThisFrame(9)  -- Weapon Wheel
    HideHudComponentThisFrame(20) -- Floating Help Text
    SetBigmapActive(false, false)
  end
end)

-- Register and handle client-side notification event
RegisterNetEvent(events.client.util_notify)
AddEventHandler(events.client.util_notify, function(notification)
  util.notify(notification)
end)

-- Handle player spawn event
RegisterNetEvent("playerSpawned")
AddEventHandler("playerSpawned", function()
  TriggerServerEvent(events.server.player_joined)
  player_spawned = true
end)

-- Update game volume
Citizen.CreateThread(function()
  nui.wait()
  Citizen.Wait(100)
  local gameVolume, radioVolume = GetGameVolume()
  msg.sound.volume(gameVolume, radioVolume)

  while true do
    Citizen.Wait(2500)
    local currentVolume, _ = GetGameVolume()
    if lastGameVolume ~= currentVolume then
      lastGameVolume = currentVolume
      msg.sound.volume(currentVolume)
    end
  end
end)

-- Load and apply configuration
Citizen.CreateThread(function()
  Citizen.Wait(0)
  nui.wait()

  -- Load colors and layout from KVP
  local colorsKvp = GetResourceKvpString("config")
  if colorsKvp then
    SetResourceKvp("colors", colorsKvp)
    DeleteResourceKvp("config")
  end

  local colors = GetResourceKvpString("colors")
  local layout = GetResourceKvpString("layout")

  if string.is_empty(colors) then end

  colors = json.decode(colors)

  if string.is_empty(layout) then end

  layout = json.decode(layout)

  local locations = GetResourceKvpString("locations")

  if not string.is_empty(locations) then
    if string.is_empty(layout) then
      layout = locations
      SetResourceKvp("layout", locations)
      DeleteResourceKvp("locations")
    end
  end

  if layout then
    if not layout.speedLimit then
      layout.speedLimit = nui.invoke("speed_limit:get_def_layout")
      layout.speedLimit = layout.speedLimit
    end
  end

  if colors then
    if not colors.speedLimit then
      colors.speedLimit = nui.invoke("speed_limit:get_def_colors")
      colors.speedLimit = colors.speedLimit
    end
  end

  -- Apply colors and layout
  if not config.modules.config_panel.enforce_colors then
    if not string.is_empty(colors) then
      msg.config.loadColors(colors)
    else
      msg.config.defColors()
    end
    msg.config.canColor(hud.can_color)
  else
    local hudColorsFile = LoadResourceFile(GetCurrentResourceName(), "data/hud_colors.json")
    if not string.is_empty(hudColorsFile) then
      msg.config.loadColors(hudColorsFile)
    else
      msg.config.defColors()
    end
    msg.config.canColor(false)
  end

  if not config.modules.config_panel.enforce_layout then
    if not string.is_empty(layout) then
      msg.config.loadLayout(layout)
    else
      msg.config.defLayout()
    end
    msg.config.canAlign(hud.can_align)
  else
    local hudLayoutFile = LoadResourceFile(GetCurrentResourceName(), "data/hud_layout.json")
    if not string.is_empty(hudLayoutFile) then
      msg.config.loadLayout(hudLayoutFile)
      layout = hudLayoutFile
    else
      msg.config.defLayout()
    end
    msg.config.canAlign(false)
  end

  -- Handle minimap configuration
  if config.modules.minimap.enabled then
    RegisterNUICallback("map", function(data, cb)
      if config.modules.minimap.enabled then
        map.load(data.x, data.y, data.scale)
      end
      cb({ ok = true })
    end)

    local minimapKvp = GetResourceKvpString("minimap")
    if not minimapKvp and layout then
      if layout.map then
        minimapKvp = json.encode(layout.map)
        SetResourceKvp("minimap", minimapKvp)
      end
    end

    if minimapKvp then
      local minimapData = json.decode(minimapKvp)
      map.load(minimapData.mapX, minimapData.mapY, minimapData.mapScale)

      if not minimapData.borderWidth then
        minimapData.borderWidth = 0.9
        minimapKvp = json.encode(minimapData)
      end

      msg.config.loadMinimap(minimapKvp)
    else
      map.load()
      msg.config.defMinimap()
    end
  end

  -- Update minimap visibility and border
  msg.minimap.enabled(config.modules.minimap.enabled)
  msg.minimap.border(config.modules.minimap.border)
  msg.minimap.vehicleOnly(config.modules.minimap.vehicle_only)

  DisplayRadar(true)
  msg.config.canExport(hud.can_export)
  canShowConfig = true
end)

-- NUI Config Actions
local nuiConfigActions = {}

-- Save configuration
nuiConfigActions.save = function(data)
  SetResourceKvp(data.type, json.encode(data.config))
end

-- Export configuration
nuiConfigActions.export = function(data)
  TriggerServerEvent(events.server.config_export, data.type, json.encode(data.config))
end

-- Close configuration
nuiConfigActions.close = function()
  hud.is_config = false
  msg.global.vehicleModule(hud.vehicle_module)
end

-- Register NUI callback for config actions
nui.register("config", function(data)
  local action = nuiConfigActions[data.action]
  action(data)
end)

-- Add chat command
Citizen.CreateThread(function()
  chat.add_command("rhud", "Toggle visibility of rHUD", nil, function(source, args)
    local command = args[1]
    if command == "config" then
      if hud.can_config then
        if config.modules.config_panel.enabled then
          local resetCommand = args[2]
          if resetCommand == "reset" then
            DeleteResourceKvp("colors")
            DeleteResourceKvp("layout")
            DeleteResourceKvp("minimap")
            msg.config.resetColors()
            msg.config.resetLayout()
            msg.config.resetMinimap()
          end
        else
          hud.is_config = true
        end
      else
        util.notify("~r~You do not have permission to use the config.")
      end
    else
      canShowHud = not canShowHud
    end
  end)

  if hud.can_config then
    if config.modules.config_panel.enabled then
      chat.add_suggestion("rhud config", "Configure rHUD")
      chat.add_suggestion("rhud config reset", "Completely reset all rHUD customizations")
      RegisterKeyMapping("rhud config", "rHUD Config", "keyboard", "end")
    end
  end
end)

-- Fuel Configuration
config.fuel = config.fuel or {}

local fuelStationBlipSprites = {}
fuelStationBlipSprites["VEHICLE"] = 361
fuelStationBlipSprites["HELIPAD"] = 360

local fuelStationNames = {}
fuelStationNames["VEHICLE"] = "Gas Station"
fuelStationNames["HELIPAD"] = "Helipad"

-- Fuel System Variables
Fuel = Fuel or {}
Fuel.inFuelableVehicle = false
Fuel.currentStationIndex = -1

-- Load Fuel Stations
local function LoadFuelStations()
  local fuelStationsFile = LoadResourceFile(GetCurrentResourceName(), "data/fuel_stations.json")
  if fuelStationsFile then
    local fuelStations = json.decode(fuelStationsFile)
    if fuelStations then
      for _, station in ipairs(fuelStations) do
        local fuelStation = {}
        fuelStation.coordinates = vector3(station.coordinates.x, station.coordinates.y, station.coordinates.z)
        fuelStation.type = station.type
        fuelStation.pumps = {}
        for _, pump in ipairs(station.pumps) do
          table.insert(fuelStation.pumps, vector3(pump.x, pump.y, pump.z))
        end
        table.insert(config.fuel, fuelStation)
      end
    end
  end
end

-- Fuel Tank Bone Names
local fuelTankBoneNames = {
  "petrolcap",
  "petroltank",
  "petroltank_r",
  "petroltank_l",
  "wheel_lr"
}

-- Random Fuel Level
local function GetRandomFuelLevel(maxFuel)
  local minFuel = maxFuel / 3.0
  local midFuel = maxFuel / 4.0
  midFuel = maxFuel - midFuel
  local randomValue = math.random()
  local fuelRange = midFuel - minFuel
  local randomFuel = randomValue * fuelRange
  randomFuel = randomFuel + minFuel
  return randomFuel
end

-- Find Nearest Fuel Station
local function FindNearestFuelStation(vehicleCoords, maxDistanceSquared)
  for index, station in ipairs(config.fuel) do
    local distanceSquared = util.distance_squared(station.coordinates, vehicleCoords)
    if distanceSquared < maxDistanceSquared then
      return index
    end
  end
  return -1
end

-- Get Current Fuel Level
local function GetCurrentFuelLevel(vehicle)
  if DecorExistOn(vehicle, "_Fuel_Level") then
    local fuelLevel = DecorGetFloat(vehicle, "_Fuel_Level")
    if fuelLevel then
      return fuelLevel
    end
  end
  return 64.0
end

-- Set Vehicle Fuel Level
local function SetVehicleFuel(vehicle, fuelLevel)
  local maxFuelLevel = util.get_max_fuel_level(vehicle)
  if fuelLevel > maxFuelLevel then
    fuelLevel = maxFuelLevel
  end
  SetVehicleFuelLevel(vehicle, fuelLevel)
  DecorSetFloat(vehicle, "_Fuel_Level", fuelLevel)
end

-- Get Fuel Tank Position
local function GetFuelTankPosition(vehicle)
  local boneIndex = -1
  for _, boneName in ipairs(fuelTankBoneNames) do
    local index = GetEntityBoneIndexByName(vehicle, boneName)
    boneIndex = index
    if util.bone_is_valid(vehicle, boneIndex) then
      break
    end
  end

  if boneIndex == -1 then
    return GetEntityCoords(vehicle, false)
  end

  return GetWorldPositionOfEntityBone(vehicle, boneIndex)
end

-- Is Near Fuel Pump
local function IsNearFuelPump(vehicle)
  local fuelTankPosition = GetFuelTankPosition(vehicle)
  if Fuel.currentStationIndex == -1 then
    return false
  end

  local station = config.fuel[Fuel.currentStationIndex]
  for _, pumpPosition in ipairs(station.pumps) do
    local distanceSquared = util.distance_squared(pumpPosition, fuelTankPosition)
    if distanceSquared <= 20.0 then
      return true
    end
  end
  return false
end

-- Toggle Engine
local function ToggleEngine(vehicle)
  if config.controls.engine_toggle == 86 then
    DisableControlAction(0, 86, true)
    DisableControlAction(0, 351, true)
  end

  if IsDisabledControlJustReleased(0, config.controls.engine_toggle) then
    if GetIsVehicleEngineRunning(vehicle) then
      SetVehicleUndriveable(vehicle, true)
      SetVehicleEngineOn(vehicle, false, true, true)
    else
      SetVehicleUndriveable(vehicle, false)
      SetVehicleEngineOn(vehicle, true, true, true)
    end
  end
end

local isRefueling = nil
local isFueling = false
local maxFuelLevel = 65.0
local fuelAdded = 0.0

-- Fuel System
local fuelEnabled = config.enabled
if fuelEnabled then
  local engineToggleControl = util.getControlInputString(config.controls.engine_toggle)
  local refuelControl = util.getControlInputString(config.controls.refuel)
  local engineOffText = "Press ~" .. engineToggleControl .. "~ to turn off engine"
  local refuelText = "Press ~" .. refuelControl .. "~ to refuel~n~Press ~" .. engineToggleControl .. "~ to turn engine on"

  -- Initialize Fuel Level
  local function InitializeFuelLevel(vehicle)
    maxFuelLevel = util.get_max_fuel_level(vehicle)
    local fuelLevelExists = DecorExistOn(vehicle, "_Fuel_Level")
    if not fuelLevelExists then
      local randomFuelLevel = GetRandomFuelLevel(maxFuelLevel)
      DecorSetFloat(vehicle, "_Fuel_Level", randomFuelLevel)
    end
    SetVehicleFuelLevel(vehicle, DecorGetFloat(vehicle, "_Fuel_Level"))
    isFueling = true
  end

  -- Update Fuel Level
  local function UpdateFuelLevel(vehicle)
    local currentFuelLevel = GetCurrentFuelLevel(vehicle)
    if currentFuelLevel > 0 then
      if GetIsVehicleEngineRunning(vehicle) then
        local rpm = GetVehicleCurrentRpm(vehicle)
        rpm = rpm ^ 1.8
        local fuelConsumption = 0.0
        fuelConsumption = fuelConsumption + rpm * config.rpm_offset
        local acceleration = GetVehicleCurrentAcceleration(vehicle)
        fuelConsumption = fuelConsumption + acceleration * config.acceleration_offset
        local traction = GetVehicleMaxTraction(vehicle)
        fuelConsumption = fuelConsumption + traction * config.traction_offset

        local vehicleModel = GetEntityModel(vehicle)
        if IsThisModelAHeli(vehicleModel) then
          currentFuelLevel = currentFuelLevel - fuelConsumption * 3.4
        elseif IsThisModelAQuadbike(vehicleModel) then
          currentFuelLevel = currentFuelLevel - fuelConsumption * 0.25
        else
          currentFuelLevel = currentFuelLevel - fuelConsumption * config.drain_rate
        end

        if currentFuelLevel < 0.0 then
          currentFuelLevel = 0.0
        end
      end
    end

    local landFuelEnabled = config.modules.land.fuel.refuel_enabled
    if landFuelEnabled then
      local vehicleModule = hud.vehicle_module
      local landModule = VehicleModuleType.Land
    end

    local airFuelEnabled = config.modules.air.fuel.refuel_enabled
    local isHeli = false
    if airFuelEnabled then
      local vehicleModel = GetEntityModel(vehicle)
      isHeli = IsThisModelAHeli(vehicleModel)
    end

    if landFuelEnabled or isHeli then
      if Fuel.currentStationIndex ~= -1 then
        local isNearPump = IsNearFuelPump(vehicle)
        if isNearPump then
          local vehicleSpeed = GetEntitySpeed(vehicle)
          if vehicleSpeed < 0.1 then
            ToggleEngine(vehicle)
          end

          if GetIsVehicleEngineRunning(vehicle) then
            util.display_helptext_this_frame(engineOffText)
          else
            util.display_helptext_this_frame(refuelText)
            if IsControlPressed(0, config.controls.refuel) then
              if currentFuelLevel < maxFuelLevel then
                local refuelRate = config.refuel_rate * 0.1
                currentFuelLevel = currentFuelLevel + refuelRate
                fuelAdded = fuelAdded + refuelRate
              end
            end

            if IsControlJustReleased(0, config.controls.refuel) then
              if fuelAdded > 0.0 then
                fuelAdded = 0
              end
            end
          end
        end
      end
    end

    SetVehicleFuel(vehicle, currentFuelLevel)
  end

  local isFuelUpTickActive = false
  local hasReachedMaxFuel = false

  AddEventHandler("fuel:startFuelUpTick", function(bool, vehicle)
    local currentFuelLevel = GetCurrentFuelLevel(vehicle)
    while true do
      if not isRefueling then
        break
      end

      Citizen.Wait(25)
      if currentFuelLevel < maxFuelLevel then
        local refuelRate = config.refuel_rate * 0.1
        currentFuelLevel = currentFuelLevel + refuelRate
        fuelAdded = fuelAdded + refuelRate
      end

      if currentFuelLevel > maxFuelLevel then
        currentFuelLevel = maxFuelLevel
        hasReachedMaxFuel = true
      end

      SetVehicleFuel(vehicle, currentFuelLevel)

      if hasReachedMaxFuel then
        hasReachedMaxFuel = false
        isRefueling = false
      end
    end
  end)

  AddEventHandler("fuel:stopRefuelFromPump", function()
    if isRefueling then
      hasReachedMaxFuel = true
    end
  end)

  AddEventHandler("fuel:refuelFromPump", function(bool, vehicle)
    isRefueling = true
    TriggerEvent("fuel:startFuelUpTick", true, vehicle)
  end)

  -- Find Nearest Fuel Station
  local function FindNearestStation(vehicle)
    local vehicleCoords = GetEntityCoords(vehicle)
    local nearestStationIndex = FindNearestFuelStation(vehicleCoords, config.market_visible_range)
    if nearestStationIndex ~= -1 then
      if Fuel.currentStationIndex ~= nearestStationIndex then
        Fuel.currentStationIndex = nearestStationIndex
      end
    else
      if Fuel.currentStationIndex ~= -1 then
        Fuel.currentStationIndex = -1
      end
    end
  end

  -- Create Fuel Station Blips
  local function CreateFuelStationBlips()
    if config.create_blips then
      for _, station in ipairs(config.fuel) do
        local blip = AddBlipForCoord(station.coordinates.x, station.coordinates.y, station.coordinates.z)
        SetBlipSprite(blip, fuelStationBlipSprites[station.type])
      end
    end
  end
local streetLimits = {} -- Table to store street speed limits
local currentStreetLimit = 30 -- Default speed limit
local streetLimitData = {} -- Table to store loaded street limit data

-- Function to set blip name
local function setBlipName(blip, name)
  SetBlipName(blip, name)
end

-- Function to set blip color
local function setBlipColor(blip, color)
  SetBlipColour(blip, color)
end

-- Function to set blip scale
local function setBlipScale(blip, scale)
  SetBlipScale(blip, scale)
end

-- Function to set blip short range
local function setBlipShortRange(blip, isShortRange)
  SetBlipAsShortRange(blip, isShortRange)
end

-- Function to handle blip creation and settings
local function handleBlips()
  if Config.blips.enabled then
    for _, blipData in pairs(Config.blips.list) do
      local blip = AddBlipForCoord(blipData.x, blipData.y, blipData.z)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(blipData.name)
      EndTextCommandSetBlipName(blip)
      SetBlipSprite(blip, blipData.sprite)
      SetBlipDisplay(blip, blipData.display)
      SetBlipScale(blip, blipData.scale)
      SetBlipColour(blip, blipData.color)
      SetBlipAsShortRange(blip, true)
    end
  end
end

-- Create a thread to initialize the script
Citizen.CreateThread(function()
  Citizen.Wait(60)
  handleBlips()
  DecorRegister("_Fuel_Level", 1)
  -- Initialize fuel-related functions
  -- Initialize control-related functions
  -- Initialize land-related functions
end)

-- Function to continuously check vehicle and update fuel
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local vehicleExists = util.vehicle_exists(vehicle)

    if hud.vehicle_module ~= VehicleModuleType.Land and hud.vehicle_module ~= VehicleModuleType.Air then
      Fuel.inFuelableVehicle = false
    elseif hud.vehicle_module == VehicleModuleType.Air and IsThisModelAPlane(GetEntityModel(vehicle)) then
      Fuel.inFuelableVehicle = false
    elseif not vehicleExists then
      Fuel.inFuelableVehicle = false
    else
      if not Fuel.inFuelableVehicle then
        Fuel.inFuelableVehicle = true
      end

      -- Call functions to update fuel and indicators
      UpdateVehicleIndicators(vehicle)
      UpdateFuelLevel(vehicle)
      UpdatePlayerWalking(playerPed)
    end
  end
end)

-- Check if control is enabled in the config
if config.control.enabled then
  -- Function to play sound when navigating left or right
  local function playNavigationLeftRightSound()
    PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
  end

  -- Function to play sound when navigating up or down
  local function playNavigationUpDownSound()
    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
  end

  -- Function to check if indicator lights are on
  local function areIndicatorLightsOn(vehicle, indicatorType)
    local indicatorState = GetVehicleIndicatorLights(vehicle)
    if indicatorState == 0 then
      return false
    end
    return indicatorState == indicatorType
  end

  -- Function to toggle indicator state
  local function toggleIndicatorState(indicatorType)
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(playerPed, false) then
      return false
    end

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local newState = ControlState.Off

    if indicatorType == Indicator.Left then
      if not areIndicatorLightsOn(vehicle, Indicator.Left) then
        newState = ControlState.LeftSignal
      else
        newState = ControlState.LeftSignal
      end
    elseif indicatorType == Indicator.Right then
      if not areIndicatorLightsOn(vehicle, Indicator.Right) then
        newState = ControlState.RightSignal
      else
        newState = ControlState.RightSignal
      end
    elseif indicatorType == Indicator.Hazard then
      if not areIndicatorLightsOn(vehicle, Indicator.Hazard) then
        newState = ControlState.Hazard
      else
        newState = ControlState.Hazard
      end
    else
      newState = ControlState.Off
    end

    if newState == ControlState.Off then
      playNavigationUpDownSound()
    else
      playNavigationLeftRightSound()
    end

    TriggerServerEvent(events.server.control.set_indicator_state, VehToNet(vehicle), newState)
  end

  -- Function to set vehicle indicator lights
  local function setVehicleIndicatorLights(vehicle, indicatorType, state)
    if indicatorType == ControlState.Off then
      SetVehicleIndicatorLights(vehicle, 0, false)
      SetVehicleIndicatorLights(vehicle, 1, false)
    elseif indicatorType == ControlState.LeftSignal then
      SetVehicleIndicatorLights(vehicle, 0, false)
      SetVehicleIndicatorLights(vehicle, 1, true)
    elseif indicatorType == ControlState.RightSignal then
      SetVehicleIndicatorLights(vehicle, 0, true)
      SetVehicleIndicatorLights(vehicle, 1, false)
    elseif indicatorType == ControlState.Hazard then
      SetVehicleIndicatorLights(vehicle, 0, true)
      SetVehicleIndicatorLights(vehicle, 1, true)
    end
  end

  -- Register net event to set indicator state
  RegisterNetEvent(events.client.control.set_indicator_state)
  AddEventHandler(events.client.control.set_indicator_state, function(netId, indicatorState)
    if not player_spawned then
      return
    end

    if not IsPlayerPlaying(PlayerId()) then
      return
    end

    local vehicle = NetToVeh(netId)
    if vehicle ~= 0 then
      if util.vehicle_exists(vehicle) then
        setVehicleIndicatorLights(vehicle, indicatorState)
      else
        return
      end
    end
  end)

  -- Add keybinds for hazard lights
  add_keybind({
    name = "rhud_control_hazard",
    description = "Toggle hazard lights",
    default_key = config.control.hazard,
    on_pressed = function()
      toggleIndicatorState(Indicator.Hazard)
    end
  })

  -- Add keybinds for left signal
  add_keybind({
    name = "rhud_control_signal_left",
    description = "Toggle left signal",
    default_key = config.control.left_signal,
    on_pressed = function()
      toggleIndicatorState(Indicator.Left)
    end
  })

  -- Add keybinds for right signal
  add_keybind({
    name = "rhud_control_signal_right",
    description = "Toggle right signal",
    default_key = config.control.right_signal,
    on_pressed = function()
      toggleIndicatorState(Indicator.Right)
    end
  })

  -- Add keybinds for engine
  add_keybind({
    name = "rhud_control_engine",
    description = "Toggle engine",
    default_key = config.control.engine,
    on_pressed = function()
      local playerPed = PlayerPedId()
      if not IsPedInAnyVehicle(playerPed, false) then
        return
      end

      local vehicle = GetVehiclePedIsIn(playerPed, false)
      if util.vehicle_exists(vehicle) then
        local isEngineRunning = GetIsVehicleEngineRunning(vehicle)
        SetVehicleEngineOn(vehicle, not isEngineRunning, false, true)
      end
    end
  })
end

-- Initialize street limit data
street_limit = {}
street_limit.current = 30

-- Function to load street limits from JSON file
local function loadStreetLimits()
  local resourceName = GetCurrentResourceName()
  local fileContent = LoadResourceFile(resourceName, "data/street_limits.json")

  if not fileContent then
    return false
  end

  local decodedData = json.decode(fileContent)
  streetLimitData = decodedData
  return true
end

-- Create a thread to manage speed limits
Citizen.CreateThread(function()
  nui.wait()
  msg.speed_limit.enabled(config.modules.speed_limit.enabled)
  msg.speed_limit.show_passenger(config.modules.speed_limit.show_passenger)

  if not loadStreetLimits() then
    console.log("Failed to load street limits file. Anything requiring street limit data may not work correctly.")
    return
  end

  while true do
    Wait(100)
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
      local pedCoords = GetEntityCoords(playerPed)
      local streetName = util.get_street_name(pedCoords)

      if OverrideSpeedLimit then
        if streetLimitData[streetName] then
          local limit = streetLimitData[streetName]
          street_limit.current = OverrideSpeedLimit(streetName, limit)
        else
          street_limit.current = OverrideSpeedLimit(streetName, -1)
        end
      else
        if streetLimitData[streetName] then
          local limit = streetLimitData[streetName]
          if not (limit > -1) or not limit then
            limit = 999
          end
          street_limit.current = limit
        else
          street_limit.current = -1
        end
      end

      msg.speed_limit.value(street_limit.current)
    end
  end
end)

-- Check if land module is enabled
if config.modules.land then
  -- Check if seatbelt is enabled
  if config.modules.land.seatbelt.enabled then
    local isSeatbeltEnabled = false
    local isDead = false

    local kmhMultiplier = util.kmh
    local mphMultiplier = util.mph

    local flythroughSpeed = config.modules.land.seatbelt.flythrough_speed / kmhMultiplier
    local flythroughSpeedHalf = config.modules.land.seatbelt.flythrough_speed / kmhMultiplier / 2

    -- Create a thread to set flythrough windscreen params
    Citizen.CreateThreadNow(function()
      Wait(0)
      SetFlyThroughWindscreenParams(flythroughSpeed, flythroughSpeedHalf, config.modules.land.seatbelt.flythrough_modifier, 10.0)
      SetPedConfigFlag(PlayerPedId(), 32, true)
    end)

    -- Function to get passengers in vehicle
    local function getPassengersInVehicle()
      local playerPed = PlayerPedId()
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle))
      local passengers = {}

      for i = 0, seatCount - 1 do
        if i ~= -1 then
          local pedInSeat = GetPedInVehicleSeat(vehicle, i)
          if pedInSeat ~= playerPed and pedInSeat ~= 0 then
            if IsPedAPlayer(pedInSeat) then
              local playerIndex = NetworkGetPlayerIndexFromPed(pedInSeat)
              if playerIndex ~= PlayerId() then
                local serverId = GetPlayerServerId(playerIndex)
                if serverId ~= nil then
                  table.insert(passengers, serverId)
                end
              end
            end
          end
        end
      end
      return passengers
    end

    -- Function to disable seatbelt
    local function disableSeatbelt()
      isSeatbeltEnabled = false
      SetPedConfigFlag(PlayerPedId(), 32, true)
      TriggerEvent(events.client.land_seatbelt_toggle, false)
      msg.sound.stopLoop("beltalarm")
      msg.land.seatbelt(false)
    end

    -- Register net event for seatbelt indicator
    RegisterNetEvent(events.client.land_seatbelt_indicator)
    AddEventHandler(events.client.land_seatbelt_indicator, function(seatbeltState)
      msg.land.seatbelt(seatbeltState)
    end)

    -- Function to toggle seatbelt
    local function toggleSeatbelt()
      if hud.is_visible and not land_module.is_passenger and hud.vehicle_module == VehicleModuleType.Land and not land_module.is_bike then
        isSeatbeltEnabled = not isSeatbeltEnabled
        SetPedConfigFlag(PlayerPedId(), 32, not isSeatbeltEnabled)

        if config.modules.land.seatbelt.buckle_sfx then
          if isSeatbeltEnabled then
            msg.sound.play("buckle")
          else
            msg.sound.play("unbuckle")
          end
        end

        TriggerEvent(events.client.land_seatbelt_toggle, isSeatbeltEnabled)
        msg.land.seatbelt(isSeatbeltEnabled)

        local passengers = getPassengersInVehicle()
        for _, passengerId in ipairs(passengers) do
          TriggerServerEvent(events.server.land_seatbelt_indicator, passengerId, isSeatbeltEnabled)
        end
      end
    end

    -- Add keybind for seatbelt
    add_keybind({
      name = "rhud_seatbelt",
      description = "Toggle seatbelt",
      default_key = config.modules.land.seatbelt.keybind,
      on_pressed = function()
        toggleSeatbelt()
      end
    })

    -- Create a thread to check player death
    Citizen.CreateThread(function()
      while true do
        Wait(500)
        local playerPed = PlayerPedId()
        local isPlayerDead = IsEntityDead(playerPed)

        if isDead ~= isPlayerDead then
          isDead = isPlayerDead
          if isDead then
            disableSeatbelt()
          end
        end
      end
    end)

    -- Add event handler for player spawn
    AddEventHandler("playerSpawned", function()
      disableSeatbelt()
    end)

    -- Create a thread to handle seatbelt logic
    Citizen.CreateThread(function()
      local canEject = false
      local ejectTimer = 0

      while true do
        Wait(0)

        if hud.is_visible and not land_module.is_passenger and hud.vehicle_module == VehicleModuleType.Land and not land_module.is_bike then
          if not canEject then
            canEject = true
          end

          if isSeatbeltEnabled then
            DisableControlAction(0, 75, true)
          end

          if isSeatbeltEnabled and IsDisabledControlJustPressed(0, 75) then
            if canEject then
              local currentTime = GetGameTimer()
              if currentTime - ejectTimer < 1000 then
                toggleSeatbelt()
                msg.sound.stopLoop("beltalarm")
                Wait(600)

                local playerPed = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                local vehicleSpeed = GetEntitySpeed(vehicle)

                if vehicleSpeed < 10 then
                  TaskLeaveAnyVehicle(playerPed, 0, 0)
                else
                  TaskLeaveAnyVehicle(playerPed, 0, 4096)
                end
              end
            end

            ejectTimer = GetGameTimer()
            canEject = true
          end
        elseif canEject then
          canEject = false
          disableSeatbelt()
        end
      end
    end)
  end
end

-- Check if postal module is enabled
if config.modules.info.enabled then
  -- Check if postal is enabled
  if config.modules.info.postal.enabled then
    local postalData = {}

    -- Function to load postal data from JSON file
    local function loadPostalData()
      local resourceName = GetCurrentResourceName()
      local fileContent = LoadResourceFile(resourceName, "data/postals.json")

      if not fileContent then
        return false
      end

      local decodedData = json.decode(fileContent)
      postalData = decodedData
      return true
    end

    Postal = {}
    Postal.nearest = nil
    Postal.distance = 0

    -- Create a thread to manage postal data
    Citizen.CreateThread(function()
      if not loadPostalData() then
        console.log("Failed to load postals file")
        return
      end

      chat.add_command("postal", "Manage postal route", {
        { name = "code", help = "Create postal route" }
      }, function(source, args)
        if #args < 1 then
          if Postal.postal then
            if DoesBlipExist(Postal.blip) then
              RemoveBlip(Postal.blip)
            end
            Postal = nil
            util.notify(config.messages.route_deleted:gsub("%{code}", Postal.postal.code))
          end
          return
        end

        local postalCode = tostring(args[1])
        local foundPostal = table.find(postalData, function(postal)
          return tostring(postal.code) == postalCode
        end)

        if not foundPostal then
          util.notify(config.messages.route_not_found:gsub("%{code}", postalCode))
          return
        end

        if Postal then
          if DoesBlipExist(Postal.blip) then
            RemoveBlip(Postal.blip)
          end
        end

        Postal = {}
        Postal.postal = foundPostal
        Postal.blip = util.create_blip(vector3(foundPostal.x, foundPostal.y, 0.0), "Postal Route " .. foundPostal.code, BlipSprite.Waypoint, BlipColor.Blue, true)
        util.notify(config.messages.route_created:gsub("%{code}", foundPostal.code))
      end)

      while true do
        Wait(config.tick_delay)
        local playerCoords = GetEntityCoords(PlayerPedId(), false)
        local nearestIndex = -1
        local nearestDistance = -1.0

        for i, postal in ipairs(postalData) do
          local distance = util.distance_squared_2d(playerCoords, postal)
          if nearestDistance == -1.0 or nearestDistance > distance then
            nearestIndex = i
            nearestDistance = distance
          end
        end

        if nearestIndex ~= -1 then
          Postal.nearest = postalData[nearestIndex].code
          Postal.distance = math.floor(math.sqrt(nearestDistance))
        end

        if Postal then
          local blipCoords = GetBlipInfoIdCoord(Postal.blip)
          local distanceToBlip = util.distance_squared_2d(playerCoords, blipCoords)
          if distanceToBlip < config.route_remove_range ^ 2 then
            if DoesBlipExist(Postal.blip) then
              RemoveBlip(Postal.blip)
            end
            Postal = nil
          end
        end
      end
    end)
  end
end

-- Initialize land module data
land_module = {}
land_module.is_bike = false
land_module.is_passenger = false

-- Check if land module is enabled
if config.modules.land then
  local currentGear = 0
  local currentDirection = "N"
  local isEngineGood = false
  local currentRPM = 0.0
  local isCruiseOn = false
  local isHandbrakeOn = false
  local isHornActive = false
  local isLightsOn = false
  local isHighBeamsOn = false
  local isIndicatorLeftOn = false
  local isIndicatorRightOn = false
  local isIndicatorHazardOn = false
  local isSeatbeltAlarmEnabled = config.modules.land.seatbelt.alarm_sfx
  local isSeatbeltEnabled = false
  local seatbeltAlarmSpeed = config.modules.land.seatbelt.alarm_speed
  local seatbeltAlarmDelay = config.modules.land.seatbelt.alarm_delay * 1000
  local showPassenger = not config.modules.land.passenger.seatbelt_only or not config.modules.land.passenger.seatbelt_only

  -- Add event handler for land seatbelt toggle
  AddEventHandler(events.client.land_seatbelt_toggle, function(seatbeltState)
    isSeatbeltEnabled = seatbeltState
  end)

  -- Create a thread to initialize land module
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    nui.wait()

    if config.modules.land.use_kmph then
      msg.land.speedUnit("km/h")
      msg.land.speedMax(320)
    end

    msg.land.fuelWarn(config.modules.land.fuel.warn_at)

    -- Function to update land module data
    local function updateLandModuleData()
      Citizen.Wait(config.tick_delay)

      if not hud.is_visible then
        return
      end

      if hud.vehicle_module ~= VehicleModuleType.Land then
        return
      end

      local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      if vehicle == 0 then
        return
      end

      if not util.vehicle_exists(vehicle) then
        return
      end

      land_module.is_passenger = hud.vehicle_is_passenger
    end

    while true do
      updateLandModuleData()
    end
  end)
end
local EngineState = _ENV.EngineState -- Global variable used in other files
local VehicleModuleType = _ENV.VehicleModuleType -- Global variable used in other files
local add_keybind = _ENV.add_keybind -- Global variable used in other files
local hud = _ENV.hud -- Global variable used in other files
local msg = _ENV.msg -- Global variable used in other files
local nui = _ENV.nui -- Global variable used in other files
local street_limit = _ENV.street_limit -- Global variable used in other files
local util = _ENV.util -- Global variable used in other files

-- Check if the land module is enabled in the config
if Config.modules.land.enabled then
  local currentSpeed = 0.0
  local isEngineRunning = 0.0
  local engineHealth = 0.0
  local engineState = 0.0
  local currentFuelLevel = false
  local currentGear = 0.0
  local doorFrontLeftOpen = false
  local doorFrontRightOpen = false
  local doorBackLeftOpen = false
  local doorBackRightOpen = false
  local areLowBeamsOn = false
  local areHighBeamsOn = 0.0
  local fuelGaugeConfig = Config.modules.land.fuel.airplane_gauge
  local gearValues = {}
  gearValues[0] = 0
  gearValues[1] = 1
  gearValues[3] = 1
  gearValues[4] = 2
  gearValues["default"] = 2
  local altimeterUnit = Config.modules.land.altimeter.unit

  -- Check if the altimeter unit is feet
  if altimeterUnit == "ft" then
    if util.feet then
      goto altimeter_unit_check_end
    end
  end

  -- Check if the altimeter unit is meters
  if altimeterUnit == "m" then
    if 1.0 then
      goto altimeter_unit_check_end
    end
  end

  -- Use custom altimeter unit
  altimeterUnit = Config.modules.land.altimeter.unit_custom

  ::altimeter_unit_check_end::
  local showPassenger = Config.modules.land.show_passenger

  Citizen.CreateThread(function()
    Citizen.Wait(0)
    nui.wait()

    while true do
      Citizen.Wait(Config.modules.land.tick_delay)

      if not hud.is_visible then
        return
      end

      if hud.vehicle_module ~= VehicleModuleType.Land then
        return
      end

      if showPassenger then
        if hud.vehicle_is_passenger then
          if not hud.vehicle_is_copilot then
            return
          end
        end
      end

      local playerPed = PlayerPedId()
      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if vehicle ~= 0 then
        if util.vehicle_exists(vehicle) then
          goto vehicle_exists_check_end
        end
      end

      do return end

      ::vehicle_exists_check_end::
      local vehicleSpeed = Floor(GetVehicleSpeed(vehicle, util.knots))

      if currentSpeed ~= vehicleSpeed then
        currentSpeed = vehicleSpeed
        msg.land.speed(currentSpeed)
      end

      local fuelLevel = GetFuelLevel(vehicle)

      if currentFuelLevel ~= fuelLevel then
        currentFuelLevel = fuelLevel
        msg.land.fuel(currentFuelLevel)
      end

      local isEngineOn = GetIsVehicleEngineRunning(vehicle)

      if isEngineRunning ~= isEngineOn then
        isEngineRunning = isEngineOn
        msg.land.engine(isEngineOn)

        if not isEngineOn then
          msg.sound.stopLoop("beltalarm")
        end

        msg.land.engine(isEngineOn)
      end

      if not isEngineOn then
        return
      end

      local currentVehicleGear = GetVehicleCurrentGear(vehicle)

      if 0 == currentVehicleGear then
        local entitySpeedVector = GetEntitySpeedVector(vehicle, true)
        local speedY = entitySpeedVector.y

        if speedY <= -1 then
          currentVehicleGear = -1
        else
          currentVehicleGear = 0
        end
      end

      if currentGear ~= currentVehicleGear then
        currentGear = currentVehicleGear
        msg.land.gear(currentGear)
      end

      if Config.modules.land.seatbelt_alarm.enabled then
        if Config.modules.land.seatbelt_alarm.is_bike then
          local seatbeltAlarmActive = not Config.modules.land.seatbelt_alarm.is_bike

          if seatbeltAlarmActive ~= Config.modules.land.seatbelt_alarm.alarm_active then
            Config.modules.land.seatbelt_alarm.alarm_active = seatbeltAlarmActive

            if seatbeltAlarmActive then
              Config.modules.land.seatbelt_alarm.alarm_counter = Config.modules.land.seatbelt_alarm.alarm_counter + 1

              Citizen.CreateThreadNow(function()
                Citizen.Wait(Config.modules.land.seatbelt_alarm.alarm_delay)

                if Config.modules.land.seatbelt_alarm.alarm_active then
                  if Config.modules.land.seatbelt_alarm.alarm_counter == Config.modules.land.seatbelt_alarm.alarm_threshold then
                    local playerPed = PlayerPedId()

                    if IsPedInVehicle(playerPed, vehicle, false) then
                      msg.sound.playLoop("beltalarm")
                    end
                  end
                end
              end)
            else
              msg.sound.stopLoop("beltalarm")
            end
          end
        end
      end

      local currentEngineHealth = GetVehicleEngineHealth(vehicle)

      if engineHealth ~= currentEngineHealth then
        engineHealth = currentEngineHealth
        local newEngineState = EngineState.Good

        if currentEngineHealth < 100 then
          newEngineState = EngineState.Critical
        elseif currentEngineHealth < 400 then
          newEngineState = EngineState.Warning
        end

        if engineState ~= newEngineState then
          engineState = newEngineState
          msg.land.engineState(engineState)
        end
      end

      local isDoorFrontLeftCurrentlyOpen = GetVehicleDoorAngleRatio(vehicle, 0) > 0.0

      if doorFrontLeftOpen ~= isDoorFrontLeftCurrentlyOpen then
        doorFrontLeftOpen = isDoorFrontLeftCurrentlyOpen
        msg.land.doorFrontLeft(doorFrontLeftOpen)
      end

      local isDoorFrontRightCurrentlyOpen = GetVehicleDoorAngleRatio(vehicle, 1) > 0.0

      if doorFrontRightOpen ~= isDoorFrontRightCurrentlyOpen then
        doorFrontRightOpen = isDoorFrontRightCurrentlyOpen
        msg.land.doorFrontRight(doorFrontRightOpen)
      end

      local isDoorBackLeftCurrentlyOpen = GetVehicleDoorAngleRatio(vehicle, 2) > 0.0

      if doorBackLeftOpen ~= isDoorBackLeftCurrentlyOpen then
        doorBackLeftOpen = isDoorBackLeftCurrentlyOpen
        msg.land.doorBackLeft(doorBackLeftOpen)
      end

      local isDoorBackRightCurrentlyOpen = GetVehicleDoorAngleRatio(vehicle, 3) > 0.0

      if doorBackRightOpen ~= isDoorBackRightCurrentlyOpen then
        doorBackRightOpen = isDoorBackRightCurrentlyOpen
        msg.land.doorBackRight(doorBackRightOpen)
      end

      local areVehicleLightsOn, areLowBeamsCurrentlyOn, areHighBeamsCurrentlyOn = GetVehicleLightsState(vehicle)

      if areLowBeamsOn ~= areLowBeamsCurrentlyOn then
        areLowBeamsOn = areLowBeamsCurrentlyOn
        msg.land.beamsLow(areLowBeamsOn)
      end

      if areHighBeamsOn ~= areHighBeamsCurrentlyOn then
        areHighBeamsOn = areHighBeamsCurrentlyOn
        msg.land.beamsHigh(areHighBeamsOn)
      end

      local isLeftSignalOn = util.vehicle_is_left_sig_on(vehicle)
      local isRightSignalOn = util.vehicle_is_right_sig_on(vehicle)
      local areHazardsOn = isLeftSignalOn or isRightSignalOn

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isRightSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn
      end

      if Config.modules.land.hazard_lights_override then
        areHazardsOn = isLeftSignalOn or isRightSignalOn
      end

      if Config.
local PeaceTimeConfig = config.modules.peacetime
if PeaceTimeConfig and PeaceTimeConfig.enabled then
  exports["haso-base"]:peacetimeEnabled(false)
end

local PostalConfig = config.modules.postal
local PostalData = {
  enabled = PostalConfig.postal.enabled,
  code = "",
  dist = 0
}

if PostalData.enabled then
  Citizen.CreateThread(function()
    nui.wait()

    while true do
      Citizen.Wait(150)

      if not hud.is_visible then
        return
      end

      if PostalData.code ~= Postal.nearest then
        PostalData.code = Postal.nearest
        msg.info.postal.code(Postal.nearest)
      end

      if PostalData.dist ~= Postal.distance then
        PostalData.dist = Postal.distance
        msg.info.postal.distance(Postal.distance)
      end
    end
  end)
else
  nui.wait_then(function()
    msg.info.postal.enabled(false)
  end)
end

local PriorityConfig = config.modules.priority
local PriorityData = {
  enabled = PriorityConfig.priority.enabled,
  cooldown = 0,
  isPriority = false,
  isHold = false,
  name = ""
}

if PriorityData.enabled then
  local function UpdatePriorityStatus()
    if PriorityData.isHold then
      msg.info.priority.status(PriorityStatus.OnHold)
    elseif PriorityData.isPriority then
      msg.info.priority.status(PriorityStatus.Active)
      msg.info.priority.username(PriorityData.name)
    elseif PriorityData.cooldown == 0 then
      msg.info.priority.status(PriorityStatus.Inactive)
    elseif not PriorityData.isPriority then
      msg.info.priority.status(PriorityStatus.Cooldown)
      msg.info.priority.cooldown(PriorityData.cooldown)
    end
  end

  RegisterNetEvent(events.client.priority.update_active)
  AddEventHandler(events.client.priority.update_active, function(isActive, playerName)
    PriorityData.isPriority = isActive
    PriorityData.name = playerName
    UpdatePriorityStatus()
  end)

  RegisterNetEvent(events.client.priority.update_hold)
  AddEventHandler(events.client.priority.update_hold, function(isOnHold)
    PriorityData.isHold = isOnHold
    UpdatePriorityStatus()
  end)

  RegisterNetEvent(events.client.priority.update_cooldown)
  AddEventHandler(events.client.priority.update_cooldown, function(cooldownValue)
    PriorityData.cooldown = cooldownValue
    UpdatePriorityStatus()
  end)
else
  nui.wait_then(function()
    msg.info.priority.enabled(false)
  end)
end

local LocationData = {
  enabled = config.modules.location.enabled,
  visible = false,
  direction = nil,
  street = nil,
  zone = nil
}

local Directions = {
  [0] = "N",
  [45] = "NW",
  [90] = "W",
  [135] = "SW",
  [180] = "S",
  [225] = "SE",
  [270] = "E",
  [315] = "NE",
  [360] = "N"
}

if LocationData.enabled then
  local tickDelay = config.modules.location.tick_delay
  if not tickDelay then
    tickDelay = 500
  end

  Citizen.CreateThread(function()
    Wait(0)
    nui.wait()

    msg.info.location.enabled(true)
    msg.info.location.vehicle_only(config.modules.location.vehicle_only)
    msg.info.location.show_passenger(config.modules.location.show_passenger)

    while true do
      Wait(tickDelay)

      if hud.is_visible then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerHeading = GetEntityHeading(playerPed)

        for heading, directionText in pairs(Directions) do
          if math.abs(playerHeading - heading) < 22.5 then
            if LocationData.direction ~= directionText then
              LocationData.direction = directionText
              msg.info.location.bearing(directionText)
            end
          end
        end

        local streetName = util.get_street_name(playerCoords)
        if streetName and LocationData.street ~= streetName then
          LocationData.street = streetName
          msg.info.location.street(streetName)
        end

        local zoneName = GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)
        if DoesTextLabelExist(zoneName) then
          zoneName = GetLabelText(zoneName)
          ::check_zone_name::
        end

        if zoneName and LocationData.zone ~= zoneName then
          LocationData.zone = zoneName
          msg.info.location.zone(zoneName)
        end
      end
    end
  end)
else
  nui.wait_then(function()
    msg.info.location.enabled(false)
  end)
end

local PlayerConfig = config.modules.player
if not PlayerConfig.enabled then
  nui.wait_then(function()
    msg.player.enabled(false)
  end)
else
  local PlayerData = {
    health = 0,
    armor = 0,
    oxygen = 0
  }

  local WeaponData = {
    active = false,
    clip = 0,
    ammo = 0,
    hash = -1
  }

  local oxygenEnabled = PlayerConfig.oxygen
  local isSwimming = false

  Citizen.CreateThread(function()
    nui.wait()

    msg.player.showWeaponIcon(PlayerConfig.weapon_icon)

    local maxOxygenTime = GetPlayerUnderwaterTimeRemaining(PlayerId())

    local function UpdatePlayerStats()
      Citizen.Wait(PlayerConfig.tick_delay)

      if not hud.is_visible then
        return
      end

      local playerPed = PlayerPedId()

      if not IsEntityDead(playerPed) then
        local currentHealth = math.ceil(GetEntityHealth(playerPed) - 100)
        if currentHealth then
          goto check_health
        end
      end
      currentHealth = 0
      ::check_health::

      if PlayerData.health ~= currentHealth then
        PlayerData.health = currentHealth
        msg.player.health(currentHealth)
      end

      local armor = GetPedArmour(playerPed)
      if PlayerData.armor ~= armor then
        PlayerData.armor = armor
        msg.player.armor(armor)
      end

      if oxygenEnabled then
        local underwaterTimeRemaining = GetPlayerUnderwaterTimeRemaining(PlayerId())

        if underwaterTimeRemaining < maxOxygenTime then
          if not isSwimming then
            isSwimming = true
            msg.player.swimming(true)
          end

          local oxygenLevel = math.floor(underwaterTimeRemaining / maxOxygenTime * 100 * 4) / 4

          if PlayerData.oxygen ~= oxygenLevel then
            PlayerData.oxygen = oxygenLevel
            msg.player.oxygen(oxygenLevel)
          end
        else
          if isSwimming then
            isSwimming = false
            msg.player.oxygen(100)
            msg.player.swimming(false)
          end
        end
      end

      local currentWeapon, weaponHash = GetCurrentPedWeapon(playerPed)
      local clipAmmo = GetWeaponClip(playerPed, weaponHash)

      if WeaponData.clip ~= clipAmmo then
        WeaponData.clip = clipAmmo
        msg.player.weapClip(clipAmmo)
      end

      local ammo = GetWeaponAmmo(playerPed, weaponHash) - clipAmmo
      if WeaponData.ammo ~= ammo then
        WeaponData.ammo = ammo
        msg.player.weapAmmo(ammo)
      end

      if WeaponData.hash ~= weaponHash then
        WeaponData.hash = weaponHash
        local weaponName = WeapHashMap[weaponHash]
        if not weaponName then
          msg.player.weap("none")
        else
          msg.player.weap(tostring(WeapHashMap[weaponHash]))
        end
      end
    end

    while true do
      UpdatePlayerStats()
    end
  end)

  RegisterNetEvent(events.client.player_heal)
  AddEventHandler(events.client.player_heal, function(isSelfHeal, healerName)
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed) + 100)

    if isSelfHeal then
      util.notify(PlayerConfig.messages.healed_self)
    else
      local message = string.gsub(PlayerConfig.messages.healed_by, "%{player}", healerName)
      util.notify(message)
    end
  end)
end
local rpc = {}
local isDuplicity = IsDuplicityVersion()

if isDuplicity then
  local registeredFunctions = {}

  RegisterNetEvent("rrpc:request")
  AddEventHandler("rrpc:request", function(functionName, callbackId, args)
    local sourcePlayer = source
    local functionToCall = registeredFunctions[functionName]

    if functionToCall then
      local result = functionToCall(sourcePlayer, args)
      TriggerClientEvent("rrpc:response", sourcePlayer, callbackId, result)
    end
  end)

  rpc.register = function(functionName, func)
    registeredFunctions[functionName] = func
  end
else
  local pendingCallbacks = {}

  local function generateId()
    local idString = tostring(math.random(1000000, 9999999))
    return idString
  end

  RegisterNetEvent("rrpc:response")
  AddEventHandler("rrpc:response", function(callbackId, result)
    local callback = pendingCallbacks[callbackId]
    if callback then
      pendingCallbacks[callbackId] = nil
      callback.resolve(callback, result)
    end
  end)

  rpc.invoke = function(functionName, args)
    local callbackId = generateId()
    local promiseObject = promise.new()
    pendingCallbacks[callbackId] = promiseObject

    TriggerServerEvent("rrpc:request", functionName, callbackId, args)
    return Citizen.Await(promiseObject)
  end
end

local config = {}
local generalSettings = {}
local permissionSettings = {}

generalSettings.minimap_vanilla = false
generalSettings.chat_prefix = "[^1r^0HUD]"
generalSettings.locale = "en-US"
config.general = generalSettings

local peacetimeSettings = {}
peacetimeSettings.enabled = true
peacetimeSettings.set_peacetime = "rhud.peacetime"
permissionSettings.peacetime = peacetimeSettings

local configPanelSettings = {}
configPanelSettings.config = "rhud.config"
configPanelSettings.export = "rhud.config.export"
configPanelSettings.location = "rhud.config.location"
configPanelSettings.color = "rhud.config.color"
permissionSettings.config_panel = configPanelSettings
config.permissions = permissionSettings

local moduleSettings = {}
local configPanelModuleSettings = {}
configPanelModuleSettings.enabled = true
configPanelModuleSettings.enforce_location = false
configPanelModuleSettings.enforce_colors = false
moduleSettings.config_panel = configPanelModuleSettings

local minimapSettings = {}
minimapSettings.enabled = true
minimapSettings.border = true
minimapSettings.vehicle_only = false
moduleSettings.minimap = minimapSettings

local landSettings = {}
local seatbeltSettings = {}
seatbeltSettings.alarm_sfx = true
seatbeltSettings.alarm_speed = 5
seatbeltSettings.buckle_sfx = true
landSettings.seatbelt = seatbeltSettings
moduleSettings.land = landSettings

local airSettings = {}
local altimeterSettings = {}
altimeterSettings.unit = "ft"
altimeterSettings.unit_custom = 3.281
airSettings.altimeter = altimeterSettings
moduleSettings.air = airSettings

local infoSettings = {}
local postalSettings = {}
postalSettings.tick_delay = 100
infoSettings.postal = postalSettings

local aopSettings = {}
aopSettings.default_text = "None"
infoSettings.aop = aopSettings

local peacetimeInfoSettings = {}
peacetimeInfoSettings.enabled = true
peacetimeInfoSettings.disable_weapons = true
peacetimeInfoSettings.default_speed_limit = 60
local peacetimeMessages = {}
peacetimeMessages.no_permission = "~r~You do not have permission to set PeaceTime."
peacetimeMessages.violence = "~r~Violence is not allowed during PeaceTime."
peacetimeMessages.speeding = "~r~You are speeding during PeaceTime. Please slow down."
peacetimeInfoSettings.messages = peacetimeMessages
infoSettings.peacetime = peacetimeInfoSettings
moduleSettings.info = infoSettings

local playerSettings = {}
playerSettings.weapon_icon = true
moduleSettings.player = playerSettings
config.modules = moduleSettings

Update = config

local configVersion = config.version
if configVersion < 2 then
  config.general.minimap_vanilla = Update.config.general.minimap_vanilla
  config.general.chat_prefix = Update.config.general.chat_prefix
  config.modules.info.postal.tick_delay = Update.config.modules.info.postal.tick_delay
  config.modules.info.peacetime = Update.config.modules.info.peacetime
  config.modules.config_panel = Update.config.modules.config_panel
  config.permissions.peacetime = Update.config.permissions.peacetime
  config.permissions.config_panel = Update.config.permissions.config_panel
end

if configVersion < 3 then
  config.modules.air.altimeter = Update.config.modules.air.altimeter
  config.modules.player.weapon_icon = Update.config.modules.player.weapon_icon
end

if configVersion < 4 then
  config.modules.land.seatbelt.keybind = "K"
  config.modules.water.anchor.keybind = "PAGEDOWN"
  config.control.hazard = "BACK"
  config.control.leftSignal = "MINUS"
  config.control.rightSignal = "EQUALS"
end

if configVersion < 5 then
  local minimapEnabled = Update.config.modules.minimap
  if config.version >= 2 then
    minimapEnabled = config.general.minimap_vanilla
  end
  minimapEnabled = not minimapEnabled or minimapEnabled
  config.modules.minimap.enabled = minimapEnabled
  config.modules.minimap.border = config.general.minimap_border
  config.modules.minimap.vehicle_only = Update.config.modules.minimap.vehicle_only
  config.modules.info.location.vehicle_only = config.modules.info.location.detect_vehicle
  config.modules.info.aop.default_text = Update.config.modules.info.aop.default_text
  config.modules.land.seatbelt.alarm_sfx = Update.config.modules.land.seatbelt.alarm_sfx
  config.modules.land.seatbelt.alarm_speed = Update.config.modules.land.seatbelt.alarm_speed
  config.modules.land.seatbelt.buckle_sfx = Update.config.modules.land.seatbelt.buckle_sfx
end

if configVersion < 6 then
  config.modules.land.seatbelt.flythrough_speed = 30
  config.modules.land.seatbelt.flythrough_modifier = 5.0
  config.modules.land.seatbelt.alarm_delay = 5
  config.general.locale = Update.config.general.locale
  local waterFuelSettings = {}
  waterFuelSettings.gauge = false
  config.modules.water.fuel = waterFuelSettings
  config.modules.air.fuel.airplane_gauge = false
end

if configVersion < 7 then
  config.control.engine = "U"
  config.modules.config_panel.enforce_layout = config.modules.config_panel.enforce_location
  config.permissions.config_panel.layout = config.permissions.config_panel.location
  config.modules.info.aop.notify_all = true
  config.modules.info.aop.messages.status = "AOP set to ~b~{text}~s~"
  config.modules.info.priority.messages.onhold = "~r~Priority calls on hold. ~s~No new priority calls allowed until this restriction is lifted."
  config.control.left_signal = config.control.leftSignal
  config.control.right_signal = config.control.rightSignal
  local passengerSettings = {}
  passengerSettings.show = false
  passengerSettings.seatbelt_only = false
  config.modules.land.passenger = passengerSettings
  config.modules.air.show_passenger = false
  config.modules.water.show_passenger = false
  config.modules.water.anchor.driving_resistance = 0.97
  config.modules.water.anchor.drift_resistance = 0.9
  config.modules.water.anchor.distance_factor = 0.05
  config.modules.water.anchor.pull_strength = 0.01
  config.modules.water.anchor.correction_strength = 0.03
  config.modules.water.anchor.min_pull_strength = 0.01
  local speedLimitSettings = {}
  speedLimitSettings.enabled = true
  speedLimitSettings.show_passenger = false
  config.modules.speed_limit = speedLimitSettings
end

if config.modules.info.priority.hide_username == nil then
  config.modules.info.priority.hide_username = false
end

if config.modules.land.fuel.electric_gauge == nil then
  config.modules.land.fuel.electric_gauge = false
end

if config.modules.player.oxygen == nil then
  config.modules.player.oxygen = true
end

local resourceName = GetCurrentResourceName()

local function createClientEventName(eventName)
  return string.format("%s:cl:%s", resourceName, eventName)
end

local function createServerEventName(eventName)
  return string.format("%s:sv:%s", resourceName, eventName)
end

local events = {}
local clientEvents = {}
clientEvents.aop_status = createClientEventName("aop.status")
clientEvents.peacetime_status = createClientEventName("peacetime.status")
clientEvents.util_notify = createClientEventName("util.notify")

local priorityClientEvents = {}
priorityClientEvents.update_active = createClientEventName("priority.update_priority")
priorityClientEvents.update_hold = createClientEventName("priority.update_hold")
priorityClientEvents.update_cooldown = createClientEventName("priority.update_cooldown")
clientEvents.priority = priorityClientEvents

clientEvents.player_heal = createClientEventName("player.heal")
clientEvents.land_seatbelt_toggle = createClientEventName("land.seatbelt_toggle")
clientEvents.land_seatbelt_indicator = createClientEventName("land.seatbelt_indicator")

local controlClientEvents = {}
controlClientEvents.set_indicator_state = createClientEventName("control.set_indicator_state")
clientEvents.control = controlClientEvents

events.client = clientEvents

local serverEvents = {}
local priorityServerEvents = {}
priorityServerEvents.active = createServerEventName("priority.active")
priorityServerEvents.onhold = createServerEventName("priority.onhold")
priorityServerEvents.cooldown = createServerEventName("priority.cooldown")
priorityServerEvents.inactive = createServerEventName("priority.inactive")
serverEvents.priority = priorityServerEvents

serverEvents.player_joined = createServerEventName("player.joined")
serverEvents.player_heal = createServerEventName("player.heal")
serverEvents.config_export = createServerEventName("config.export")
serverEvents.land_seatbelt_indicator = createServerEventName("land.land_seatbelt_indicator")

local controlServerEvents = {}
controlServerEvents.set_indicator_state = createServerEventName("control.set_indicator_state")
serverEvents.control = controlServerEvents

events.server = serverEvents

events.list = function(tableData, key)
  local stringList = {}

  local function processTable(currentTable)
    for key, value in pairs(currentTable) do
      if key ~= "list" then
        local valueType = type(value)
        if valueType == "string" then
          table.insert(stringList, value)
        elseif valueType == "table" then
          processTable(value)
        end
      end
    end
  end

  processTable(tableData[key])
  return stringList
end

local chat = {}
local util = {}

chat.add_suggestion = function(commandName, helpText, parameterList)
  if not parameterList then
    parameterList = nil
  end

  if isDuplicity then
    if parameterList then
      TriggerClientEvent("chat:addSuggestion", -1, "/" .. commandName, helpText, parameterList)
    else
      TriggerClientEvent("chat:addSuggestion", -1, "/" .. commandName, helpText)
    end
  elseif parameterList then
    TriggerEvent("chat:addSuggestion", "/" .. commandName, helpText, parameterList)
  else
    TriggerEvent("chat:addSuggestion", "/" .. commandName, helpText)
  end
end

chat.add_command = function(commandName, helpText, parameterList, commandHandler, restricted)
  if not restricted then
    restricted = false
  end

  RegisterCommand(commandName, commandHandler, restricted)
  chat.add_suggestion(commandName, helpText, parameterList)
end

chat.add_message = function(sourceName, messageText, color, multiline, targetPlayer)
  if not color then
    color = {255, 255, 255}
  end
  if not multiline then
    multiline = false
  end
  if not targetPlayer then
    targetPlayer = -1
  end

  if isDuplicity then
    TriggerClientEvent("chat:addMessage", targetPlayer, {
      color = color,
      multiline = multiline,
      args = {sourceName, messageText}
    })
  else
    TriggerEvent("chat:addMessage", {
      color = color,
      multiline = multiline,
      args = {sourceName, messageText}
    })
  end
end

util.notify = function(message, targetPlayer, isError)
  if not targetPlayer then
    targetPlayer = -1
  end
  if not isError then
    isError = false
  end

  if config.general.chat_messages then
    chat.add_message(config.general.chat_prefix, message, nil, isError, targetPlayer)
  else
    if isDuplicity then
      TriggerClientEvent(events.client.util_notify, targetPlayer, message)
    else
      Notify(message)
    end
  end
end

util.get_resource_meta = function(metaKey)
  return GetResourceMetadata(GetCurrentResourceName(), metaKey)
end

local tern = function(condition, trueValue, falseValue)
  if condition then
    return trueValue
  end
  return falseValue
end

local console = {}
console.log = function(message)
  Citizen.Trace(tostring(message) .. "\n")
end

local tableUtil = {}
tableUtil.len = function(tableData)
  local count = 0
  for _ in pairs(tableData) do
    count = count + 1
  end
  return count
end

tableUtil.removekey = function(tableData, key)
  local value = tableData[key]
  tableData[key] = nil
  return value
end

tableUtil.find = function(tableData, predicate)
  for key, value in pairs(tableData) do
    if predicate(key, value) then
      return value
    end
  end
  return nil
end

local weaponsJson = LoadResourceFile(GetCurrentResourceName(), "data/weapons.json")
local WeapNames = json.decode(weaponsJson)
local WeapHashMap = {}

for _, weaponName in ipairs(WeapNames) do
  WeapHashMap[GetHashKey(weaponName)] = weaponName
end

local stringUtil = {}
stringUtil.is_empty = function(str)
  if str == nil then
    return true
  end

  local strType = type(str)
  if strType == "string" then
    goto check_string
  end

  return true

  ::check_string::
  local trimmedStr = str:match("^%s*(.-)%s*$")
  return trimmedStr == "" or trimmedStr == "[]" or trimmedStr == "{}"
end

local bridge = {}
bridge.isResourceStarted = function(resourceName)
  local resourceState = GetResourceState(resourceName)
  return resourceState == "started"
end

bridge.init = function(sharedObject)
  if bridge.isResourceStarted("qb-core") then
    sharedObject.framework = "qb"
    return exports["qb-core"]:GetCoreObject()
  elseif bridge.isResourceStarted("es_extended") then
    sharedObject.framework = "esx"
    return exports.es_extended:getSharedObject()
  elseif bridge.isResourceStarted("ND_Core") then
    sharedObject.framework = "nd"
    return exports.ND_Core
  else
    sharedObject.framework = "none"
    return nil
  end
end
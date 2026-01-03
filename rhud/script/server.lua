local semver = {}
semver._VERSION = "1.2.1"
semver._DESCRIPTION = "semver for Lua"
semver._URL = "https://github.com/kikito/semver.lua"
semver._LICENSE = "    MIT LICENSE\n\n    Copyright (c) 2015 Enrique Garc\195\173a Cota\n\n    Permission is hereby granted, free of charge, to any person obtaining a\n    copy of tother software and associated documentation files (the\n    \"Software\"), to deal in the Software without restriction, including\n    without limitation the rights to use, copy, modify, merge, publish,\n    distribute, sublicense, and/or sell copies of the Software, and to\n    permit persons to whom the Software is furnished to do so, subject to\n    the following conditions:\n\n    The above copyright notice and tother permission notice shall be included\n    in all copies or substantial portions of the Software.\n\n    THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n  "

-- Validates that a number is a positive integer
function validatePositiveInteger(number, parameterName)
  assert(number >= 0, parameterName .. " must be a valid positive number")
  assert(math.floor(number) == number, parameterName .. " must be an integer")
end

-- Checks if a string is not nil and not empty
function isValidString(str)
  return str and "" ~= str
end

-- Splits a string by dots
function splitStringByDots(str)
  if not str then
    str = ""
  end
  local parts = {}
  local index = 0
  str:gsub("([^%.]+)", function(part)
    index = index + 1
    parts[index] = part
  end)
  return parts
end

-- Extracts prerelease and build from a string
function extractPrereleaseAndBuild(versionString)
  local prerelease, build = versionString:match("^(-[^+]+)(+.+)$")
  if not prerelease or not build then
    prerelease = versionString:match("^(-.+)$")
    build = versionString:match("^(+.+)$")
  end
  assert(prerelease or build, "The parameter %q must begin with + or - to denote a prerelease or a build"):format(versionString)
  return prerelease, build
end

-- Validates prerelease format
function validatePrereleaseFormat(prerelease)
  if prerelease then
    local match = prerelease:match("^-(%w[%.%w-]*)$")
    assert(match, "The prerelease %q is not a slash followed by alphanumerics, dots and slashes"):format(prerelease)
    return match
  end
end

-- Validates build format
function validateBuildFormat(build)
  if build then
    local match = build:match("^%+(%w[%.%w-]*)$")
    assert(match, "The build %q is not a + sign followed by alphanumerics, dots and slashes"):format(build)
    return match
  end
end

-- Parses prerelease and build strings
function parsePrereleaseAndBuild(versionString)
  if not isValidString(versionString) then
    return nil, nil
  end
  local prereleaseString, buildString = extractPrereleaseAndBuild(versionString)
  local prerelease = validatePrereleaseFormat(prereleaseString)
  local build = validateBuildFormat(buildString)
  return prerelease, build
end

-- Parses a version string into its components
function parseVersionString(versionString)
  local major, minor, patch, extra = versionString:match("^(%d+)%.?(%d*)%.?(%d*)(.-)$")
  assert(type(major) == "string", "Could not extract version number(s) from %q"):format(versionString)
  local majorNumber = tonumber(major)
  local minorNumber = tonumber(minor)
  local patchNumber = tonumber(patch)
  local prerelease, build = parsePrereleaseAndBuild(extra)
  return majorNumber, minorNumber, patchNumber, prerelease, build
end

-- Compares two numbers
function compareNumbers(a, b)
  if a == b then
    return 0
  end
  if a < b then
    return -1
  end
  return 1
end

-- Compares two strings or numbers
function compareStringsOrNumbers(a, b)
  if a == b then
    return 0
  elseif not a then
    return -1
  elseif not b then
    return 1
  end
  local aNumber = tonumber(a)
  local bNumber = tonumber(b)
  if aNumber and bNumber then
    return compareNumbers(aNumber, bNumber)
  elseif aNumber then
    return -1
  elseif bNumber then
    return 1
  else
    return compareNumbers(a, b)
  end
end

-- Compares two prerelease arrays
function comparePrereleaseArrays(array1, array2)
  local length1 = #array1
  local result = nil
  for i = 1, length1, 1 do
    local comparisonResult = compareStringsOrNumbers(array1[i], array2[i])
    result = comparisonResult
    if 0 ~= result then
      return -1 == result
    end
  end
  local length2 = #array2
  return length1 < length2
end

-- Checks if prerelease version is less than another
function isPrereleaseLessThan(version1, version2)
  if version1 == version2 or not version1 then
    return false
  elseif not version2 then
    return true
  end
  local prereleaseArray1 = splitStringByDots(version1)
  local prereleaseArray2 = splitStringByDots(version2)
  return comparePrereleaseArrays(prereleaseArray1, prereleaseArray2)
end

local versionMeta = {}
function versionMeta:nextMajor()
  return semver(self.major + 1, 0, 0)
end

function versionMeta:nextMinor()
  return semver(self.major, self.minor + 1, 0)
end

function versionMeta:nextPatch()
  return semver(self.major, self.minor, self.patch + 1)
end

local versionMetatable = {}
versionMetatable.__index = versionMeta

function versionMetatable:__eq(other)
  return self.major == other.major
end

function versionMetatable:__lt(other)
  if self.major ~= other.major then
    return self.major < other.major
  end
  if self.minor ~= other.minor then
    return self.minor < other.minor
  end
  if self.patch ~= other.patch then
    return self.patch < other.patch
  end
  return isPrereleaseLessThan(self.prerelease, other.prerelease)
end

function versionMetatable:__pow(other)
  if self.major == 0 then
    return self == other
  end
  return self.major == other.major
end

function versionMetatable:__tostring()
  local parts = {}
  local versionString = "%d.%d.%d"
  versionString = versionString:format(self.major, self.minor, self.patch)
  parts[1] = versionString
  parts[2] = versionString
  parts[3] = self.major
  parts[4] = self.minor
  parts[5] = self.patch
  if self.prerelease then
    table.insert(parts, "-" .. self.prerelease)
  end
  if self.build then
    table.insert(parts, "+" .. self.build)
  end
  return table.concat(parts)
end

-- Creates a new semver object
function semver(major, minor, patch, prerelease, build)
  assert(major, "At least one parameter is needed")
  if type(major) == "string" then
    major, minor, patch, prerelease, build = parseVersionString(major)
  end
  if not patch then
    patch = 0
  end
  if not minor then
    minor = 0
  end
  validatePositiveInteger(major, "major")
  validatePositiveInteger(minor, "minor")
  validatePositiveInteger(patch, "patch")
  local version = {}
  version.major = major
  version.minor = minor
  version.patch = patch
  version.prerelease = prerelease
  version.build = build
  return setmetatable(version, versionMetatable)
end

local semverCallMetatable = {}
function semverCallMetatable:__call(...)
  local args = {...}
  return semver(unpack(args))
end

setmetatable(semver, semverCallMetatable)
semver = semver(semver._VERSION)
semver._VERSION = semver
v = semver

local aopConfig = config.modules.info.aop
local peacetimeConfig = config.modules.info.peacetime
local priorityConfig = config.modules.info.priority

local info = {}
info.status = config.modules.info.aop.default_text

local priorityState = {}
priorityState.active = false
local priorityData = {}
priorityData.cooldown = 0
priorityData.isPriority = false
priorityData.isHold = false
priorityData.name = ""

-- Gets the current AOP status
function get_aop()
  return info.status
end

-- Sets the AOP status
function set_aop(aopText)
  if string.is_empty(aopText) then
    info.status = aopConfig.default_text
  else
    info.status = aopText
  end
  TriggerClientEvent(events.client.aop_status, -1, info.status)
end

if config.modules.info.aop.enabled then
  local aopPermissions = config.permissions.aop
  chat.add_command("aop", "Set AOP status", nil, function(source, args)
    if aopPermissions.enabled then
      if not IsPlayerAceAllowed(source, aopPermissions.set_aop) then
        util.notify(aopConfig.messages.no_permission, source)
        return
      end
    end
    local aopStatus = table.concat(args, " ")
    set_aop(aopStatus)
    local notificationMessage = aopConfig.messages.status:gsub("%{text}", info.status)
    if aopConfig.notify_all then
      util.notify(notificationMessage, -1)
    else
      util.notify(notificationMessage, source)
    end
  end)
end

-- Gets the current peacetime status
function get_peacetime()
  return priorityState.active
end

-- Sets the peacetime status
function set_peacetime(isActive)
  priorityState.active = isActive
  TriggerClientEvent(events.client.peacetime_status, -1, priorityState.active)
end

-- Toggles the peacetime status
function toggle_peacetime()
  set_peacetime(not priorityState.active)
end

if config.modules.info.peacetime.enabled then
  local peacetimePermissions = config.permissions.peacetime
  local togglePeacetimeCommand = function(source)
    if peacetimePermissions.enabled then
      if not IsPlayerAceAllowed(source, peacetimePermissions.set_peacetime) then
        util.notify(peacetimeConfig.messages.no_permission, source)
        return
      end
    end
    toggle_peacetime()
  end
  chat.add_command("peacetime", "Toggle peacetime", nil, togglePeacetimeCommand)
  chat.add_command("pt", "Toggle peacetime", nil, togglePeacetimeCommand)
end

-- Gets the current priority status
function get_priority()
  if priorityData.isHold then
    return "onhold"
  elseif priorityData.isPriority then
    return "active"
  elseif priorityData.cooldown > 0 then
    return "cooldown"
  else
    return "inactive"
  end
end

-- Sets the priority status
function set_priority(state, playerName)
  if not priorityConfig.enabled then
    return
  end
  if state == "active" then
    if priorityData.cooldown > 0 then
      return
    end
    priorityData.isPriority = true
    priorityData.isHold = false
    TriggerClientEvent(events.client.priority.update_active, -1, priorityData.isPriority, playerName)
    util.notify(priorityConfig.messages.in_progress, -1)
  elseif state == "onhold" then
    if not priorityData.isPriority then
      return
    end
    priorityData.isHold = true
    TriggerClientEvent(events.client.priority.update_hold, -1, priorityData.isHold)
    util.notify(priorityConfig.messages.onhold, -1)
  elseif state == "cooldown" then
    if priorityData.isPriority then
      priorityData.isPriority = false
      TriggerClientEvent(events.client.priority.update_active, -1, false, "")
    end
    if priorityData.isHold then
      priorityData.isHold = false
      TriggerClientEvent(events.client.priority.update_hold, -1, false)
    end
    if priorityData.cooldown == 0 then
      local cooldownMessage = priorityConfig.messages.cooldown:gsub("%{time}", tostring(priorityConfig.cooldown))
      util.notify(cooldownMessage, -1)
      priorityData.cooldown = priorityConfig.cooldown + 1
      Citizen.CreateThreadNow(function()
        while true do
          if not (priorityData.cooldown > 0) then
            break
          end
          priorityData.cooldown = priorityData.cooldown - 1
          TriggerClientEvent(events.client.priority.update_cooldown, -1, priorityData.cooldown)
          Citizen.Wait(60000)
        end
      end)
    end
  elseif state == "inactive" then
    priorityData.isPriority = false
    priorityData.isHold = false
    if priorityData.cooldown > 0 then
      Citizen.CreateThreadNow(function()
        repeat
          priorityData.cooldown = priorityData.cooldown - 1
          TriggerClientEvent(events.client.priority.update_cooldown, -1, priorityData.cooldown)
          Citizen.Wait(100)
        until 0 == priorityData.cooldown
      end)
    end
    TriggerClientEvent(events.client.priority.update_active, -1, false, "")
    TriggerClientEvent(events.client.priority.update_hold, -1, false)
  end
end

if config.modules.info.priority.enabled then
  local priorityPermissions = config.permissions.priority
  local checkPermission = function(source, permission, errorMessage)
    if priorityPermissions.enabled then
      if not IsPlayerAceAllowed(source, permission) then
        return true
      else
        util.notify(errorMessage, source)
        return false
      end
    end
    return true
  end
  local handlePriorityCommand = function(state, source, permission, errorMessage)
    if not checkPermission(source, permission, errorMessage) then
      return false
    end
    if state == "active" then
      if priorityData.cooldown > 0 then
        local cooldownMessage = priorityConfig.messages.cooldown_in_progress:gsub("%{time}", tostring(priorityData.cooldown))
        util.notify(cooldownMessage, source)
        return false
      end
      local playerName = GetPlayerName(source)
      priorityData.name = playerName
      set_priority("active", priorityData.name)
    elseif state == "onhold" then
      set_priority("onhold")
    elseif state == "cooldown" then
      set_priority("cooldown")
    elseif state == "inactive" then
      set_priority("inactive")
      priorityData.name = ""
    end
    return true
  end
  local prioritySubCommands = {}
  prioritySubCommands.cooldown = function(source)
    handlePriorityCommand("cooldown", source, priorityPermissions.cooldown, priorityConfig.messages.cooldown_no_permission)
  end
  prioritySubCommands.cd = prioritySubCommands.cooldown
  prioritySubCommands.onhold = function(source)
    handlePriorityCommand("onhold", source, priorityPermissions.onhold, priorityConfig.messages.onhold_no_permission)
  end
  prioritySubCommands.hold = prioritySubCommands.onhold
  prioritySubCommands.oh = prioritySubCommands.onhold
  prioritySubCommands.reset = function(source)
    handlePriorityCommand("inactive", source, priorityPermissions.reset, priorityConfig.messages.reset_no_permission)
  end
  prioritySubCommands.r = prioritySubCommands.reset
  prioritySubCommands.priority = function(source)
    handlePriorityCommand("active", source, priorityPermissions.priority, priorityConfig.messages.priority_no_permission)
  end
  local priorityCommand = function(source, args)
    if #args == 0 then
      prioritySubCommands.priority(source)
    else
      local subCommand = args[1]
      if prioritySubCommands[subCommand] then
        prioritySubCommands[subCommand](source)
      end
    end
  end
  chat.add_command("pr", "Start a priority call", nil, priorityCommand)
  chat.add_command("pr cd", "Initiate priority cooldown", nil, priorityCommand)
  chat.add_command("pr cooldown", "Initiate priority cooldown", nil, priorityCommand)
  chat.add_command("pr onhold", "Set priority on hold", nil, priorityCommand)
  chat.add_command("pr hold", "Set priority on hold", nil, priorityCommand)
  chat.add_command("pr reset", "Reset the priority timer", nil, priorityCommand)
  chat.add_command("pr r", "Reset the priority timer", nil, priorityCommand)
  chat.add_command("priority", "Start a priority call", nil, priorityCommand)
  chat.add_command("priority cd", "Initiate priority cooldown", nil, priorityCommand)
  chat.add_command("priority cooldown", "Initiate priority cooldown", nil, priorityCommand)
  chat.add_command("priority onhold", "Set priority on hold", nil, priorityCommand)
  chat.add_command("priority hold", "Set priority on hold", nil, priorityCommand)
  chat.add_command("priority reset", "Reset the priority timer", nil, priorityCommand)
  chat.add_command("priority r", "Reset the priority timer", nil, priorityCommand)
end

if config.modules.player.enabled then
  local playerModuleConfig = config.modules.player
  local playerPermissions = config.permissions.player
  chat.add_command("heal", "Heal yourself or another player. Permission is required to heal another player.", {
    {name = "player ID", help = "Server ID of the player to heal."}
  }, function(source, args)
    local canHealOther = playerPermissions.enabled and IsPlayerAceAllowed(source, playerPermissions.heal_other)
    local canHealSelf = playerPermissions.enabled and IsPlayerAceAllowed(source, playerPermissions.heal_self)
    local targetPlayerId = args[1]
    if targetPlayerId then
      if canHealOther then
        TriggerEvent(events.server.player_heal, targetPlayerId, false, source)
      else
        util.notify(playerModuleConfig.messages.heal_other_denied, source)
      end
    elseif canHealSelf then
      TriggerClientEvent(events.client.player_heal, source, true, nil)
    else
      util.notify(playerModuleConfig.messages.heal_self_denied, source)
    end
  end)
  RegisterServerEvent(events.server.player_heal)
  AddEventHandler(events.server.player_heal, function(targetPlayerId, isSelf, sourcePlayerId)
    local targetPlayerName = GetPlayerName(targetPlayerId)
    if targetPlayerName == nil then
      util.notify(playerModuleConfig.messages.heal_not_found:gsub("%{pid}", tostring(targetPlayerId)), sourcePlayerId)
      return
    end
    TriggerClientEvent(events.client.player_heal, targetPlayerId, isSelf, sourcePlayerId or sourcePlayerId)
    util.notify(playerModuleConfig.messages.healed_other:gsub("%{player}", GetPlayerName(targetPlayerId)), sourcePlayerId)
  end)
end

rpc.register("has_perm", function(source, permission)
  return IsPlayerAceAllowed(source, permission)
end)

RegisterServerEvent(events.server.player_joined)
AddEventHandler(events.server.player_joined, function()
  local sourcePlayer = source
  TriggerClientEvent(events.client.aop_status, sourcePlayer, info.status)
  TriggerClientEvent(events.client.peacetime_status, sourcePlayer, priorityState.active)
  if priorityData.isHold then
    TriggerClientEvent(events.client.priority.update_hold, sourcePlayer, priorityData.isHold)
  elseif priorityData.isPriority then
    TriggerClientEvent(events.client.priority.update_active, sourcePlayer, priorityData.isPriority, priorityData.name)
  else
    if priorityData.cooldown == 0 then
      TriggerClientEvent(events.client.priority.update_active, sourcePlayer, priorityData.isPriority)
    else
      if not priorityData.isPriority then
        TriggerClientEvent(events.client.priority.update_cooldown, sourcePlayer, priorityData.cooldown)
      end
    end
  end
end)

RegisterServerEvent(events.server.config_export)
AddEventHandler(events.server.config_export, function(hudName, configData)
  SaveResourceFile(GetCurrentResourceName(), "data/hud_" .. hudName .. ".json", configData, -1)
end)

RegisterServerEvent(events.server.land_seatbelt_indicator)
AddEventHandler(events.server.land_seatbelt_indicator, function(sourcePlayer, seatbeltState)
  TriggerClientEvent(events.client.land_seatbelt_indicator, sourcePlayer, seatbeltState)
end)

RegisterNetEvent(events.server.control.set_indicator_state)
local setIndicatorState = function(netId, indicatorState)
  local entity = NetworkGetEntityFromNetworkId(netId)
  if entity ~= 0 then
    if DoesEntityExist(entity) then
      local entityCoords = GetEntityCoords(entity)
      local maxDistance = 350.0
      local players = GetPlayers()
      for _, player in ipairs(players) do
        local playerPed = GetPlayerPed(player)
        if playerPed and playerPed ~= 0 then
          local playerCoords = GetEntityCoords(playerPed)
          local distance = #(entityCoords - playerCoords)
          if maxDistance >= distance then
            TriggerClientEvent(events.client.control.set_indicator_state, player, netId, indicatorState)
          end
        end
      end
    end
  end
end
RegisterNetEvent(events.server.control.set_indicator_state)
AddEventHandler(events.server.control.set_indicator_state, setIndicatorState)

Citizen.CreateThread(function()
  local postalsData = LoadResourceFile(GetCurrentResourceName(), "data/postals.json")
  if not postalsData then
    print("Failed to load postals file")
    postalsData = {}
    return
  end
end)
local postalsData = {} -- Stores the decoded postals file data

-- Function to decode the postals file
function decodePostalsFile(postalsFile)
  if postalsFile then
    local decodedData = json.decode(postalsFile)
    if decodedData then
      return decodedData
    else
      print("Failed to decode postals file")
      return {}
    end
  end
end

-- Load and decode the postals file
local postalsFile = LoadResourceFile(GetCurrentResourceName(), "data/postals.json")
postalsData = decodePostalsFile(postalsFile)

-- Function to calculate the squared distance between two points
function calculateSquaredDistance(point1, point2)
  local deltaX = point1.x - point2.x
  local deltaY = point1.y - point2.y
  return deltaX * deltaX + deltaY * deltaY
end

-- Function to find the nearest postal code to a given point
function findNearestPostalCode(playerPosition)
  -- Wait until postalsData is loaded
  while postalsData == nil do
    Wait(1)
  end

  local nearestPostalCode = nil
  local shortestDistanceSquared = nil

  for _, postalData in ipairs(postalsData) do
    local distanceSquared = calculateSquaredDistance(playerPosition, postalData)
    if not shortestDistanceSquared or shortestDistanceSquared > distanceSquared then
      nearestPostalCode = postalData.code
      shortestDistanceSquared = distanceSquared
    end
  end

  local result = {}
  result.code = nearestPostalCode

  -- Calculate the actual distance using square root
  if shortestDistanceSquared then
    result.dist = math.sqrt(shortestDistanceSquared)
  else
    result.dist = nil
  end

  return result
end

get_postal = findNearestPostalCode -- Assign the function to a global variable

local isPreview = false -- Flag for preview mode
local isDev = false -- Flag for development mode

local versionURL = "https://raw.githubusercontent.com/Raxdiam/rHUD/main/version.json" -- Default version URL
if isDev then
  versionURL = "https://raw.githubusercontent.com/Raxdiam/rHUD/refs/heads/dev/version.json" -- Use development version URL if isDev is true
end

-- Function to check if a file exists
function doesFileExist(filePath)
  local resourcePath = GetResourcePath(GetCurrentResourceName())
  local file = io.open(resourcePath .. "/" .. filePath, "r")
  if file then
    file:close()
    return true
  end
  return false
end

-- Function to rename a file
function renameFile(oldFilePath, newFilePath)
  local resourcePath = GetResourcePath(GetCurrentResourceName())
  os.rename(resourcePath .. "/" .. oldFilePath, resourcePath .. "/" .. newFilePath)
end

-- Function to delete a file
function deleteFile(filePath)
  local resourcePath = GetResourcePath(GetCurrentResourceName())
  os.remove(resourcePath .. "/" .. filePath)
end

-- Function to check if a file is empty
function isFileEmpty(filePath)
  local fileContent = LoadResourceFile(GetCurrentResourceName(), filePath)
  return string.is_empty(fileContent)
end

local httpRequest = PerformHttpRequest -- Assign PerformHttpRequest to a global variable
local versionCheckURL = versionURL -- Assign the version URL to a global variable

-- Function to handle the version check response
function handleVersionCheckResponse(errorCode, responseBody, responseHeaders)
  Citizen.Wait(2000) -- Wait for 2 seconds

  local decodedResponse = nil
  if responseBody then
    decodedResponse = json.decode(responseBody)
  end

  local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version") or v() -- Get the current version from resource metadata

  local latestVersion = nil
  if decodedResponse then
    local versionKey = "version"
    if isPreview then
      versionKey = "preview"
    end
    latestVersion = v(decodedResponse[versionKey]) -- Extract the latest version from the decoded response
  else
    latestVersion = v(currentVersion) -- If decoding fails, assume the current version is the latest
  end

  local currentVersionString = tostring(currentVersion)
  local latestVersionString = tostring(latestVersion)

  local configVersion = config.version -- Get the config version

  local latestConfigVersion = nil
  if decodedResponse then
    latestConfigVersion = decodedResponse.config -- Get the latest config version from the decoded response
  else
    latestConfigVersion = configVersion -- If decoding fails, assume the current config version is the latest
  end

  print("\n^1r^0HUD | " .. currentVersionString)

  if responseBody then
    if currentVersion > latestVersion then
      print("^3Your version of rHUD is ahead of the latest version.^0")
      print("Latest version: " .. latestVersionString .. "\n^0\n")
    elseif currentVersion < latestVersion then
      print("^1Your version of rHUD is outdated, re-download from your keymaster to get the latest version.^0")
      print("Latest version: " .. latestVersionString .. "\n^0\n")
    else
      print("\n^2Your version of rHUD is up to date!^0\n^0 ")
    end

    if latestVersion == currentVersion and configVersion < latestConfigVersion then
      print("^1Your config.lua is outdated.^0")
      print("\nLatest config: ^4https://github.com/Raxdiam/rHUD/blob/main/config.lua^0\n^0")
    end
  else
    print("^1There was an error getting the latest version information.^0\n")
  end

  -- Handle file migrations and checks
  if doesFileExist("data/hud_locations.json") then
    if not doesFileExist("data/hud_layout.json") then
      renameFile("data/hud_locations.json", "data/hud_layout.json")
    end
  else
    if doesFileExist("data/hud_locations.json") then
      if doesFileExist("data/hud_layout.json") then
        if not isFileEmpty("data/hud_locations.json") then
          if isFileEmpty("data/hud_layout.json") then
            deleteFile("data/hud_layout.json")
            renameFile("data/hud_locations.json", "data/hud_layout.json")
          end
        else
          if isFileEmpty("data/hud_layout.json") then
            deleteFile("data/hud_locations.json")
          end
        end
      end
    end
  end

  -- Ensure hud_layout.json exists
  if not doesFileExist("data/hud_layout.json") then
    SaveResourceFile(GetCurrentResourceName(), "data/hud_layout.json", "", -1)
  end

  -- Ensure hud_colors.json exists
  if not doesFileExist("data/hud_colors.json") then
    SaveResourceFile(GetCurrentResourceName(), "data/hud_colors.json", "", -1)
  end
end

httpRequest(versionCheckURL, handleVersionCheckResponse) -- Perform the HTTP request to check for updates

-- Exported functions
exports("get_aop", get_aop)
exports("set_aop", set_aop)

-- Function to clear the AOP
function clearAOP()
  set_aop(nil)
end

exports("clear_aop", clearAOP)
exports("get_peacetime", get_peacetime)
exports("set_peacetime", set_peacetime)
exports("toggle_peacetime", toggle_peacetime)
exports("get_priority", get_priority)
exports("set_priority", set_priority)
exports("get_postal", get_postal)
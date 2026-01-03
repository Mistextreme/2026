--- Gets the altitude of an aircraft. Used by the aircraft module.
--- @param veh integer The vehicle handle.
--- @param factor number The multiplier to convert altitude from meters to the configured unit.
--- @return number altitude The altitude of the vehicle.
function GetAircraftAltitude(veh, factor)
  local pos = GetEntityCoords(veh, false)
  return GetEntityHeight(veh, pos.x, pos.y, pos.z, true, true) * factor
end

--- Gets the fuel level of a vehicle. Used by all vehicle modules.
--- @param veh integer The vehicle handle.
--- @return number fuel The fuel level of the vehicle as a percentage.
function GetFuelLevel(veh)
  local max = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fPetrolTankVolume')
  local fuel = GetVehicleFuelLevel(veh)
  return (fuel / max) * 100
end

--- @param text string
function Notify(text)
  BeginTextCommandThefeedPost("STRING")
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandThefeedPostTicker(true, false)
end

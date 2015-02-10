/*
  File: fn_fuelConsumption.sqf
  Author: Jan Christophersen

  Description:
  Handles fuel consumption of a vehicle
*/

private ["_vehicle","_maxSpeed", "_fuelRates"];

_vehicle = _this select 0;
_maxSpeed = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "maxSpeed");
_fuelRates = [typeOf _vehicle] call life_fnc_getFuelRate;

[[_vehicle, _maxSpeed, _fuelRates, player], "TON_fnc_fuelConsumption", false, false] call life_fnc_MP;
sleep 5;
[_vehicle] spawn life_fnc_handleFuelConsumption;

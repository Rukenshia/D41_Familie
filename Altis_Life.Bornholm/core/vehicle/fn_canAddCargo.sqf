/*
  File: fn_canAddCargo.sqf
  Author: Bryan "Tonic" Boardwine

  Description:
  Checks whether the given item may be added to the vehicle
*/
private ["_vehicle", "_item", "_type"];

_vehicle = _this select 0;
_item = _this select 1;
_return = true;

if (isNull _vehicle || !alive _vehicle) exitWith {_return = false; _return;};

switch (_item) do {
  case "D41_Oel";
  case "D41_OelRoh";
  case "D41_Kerosin":
  {
    if (!((typeOf _vehicle) in ["C_Van_01_fuel_F","Civ_Truck_02_fuel2_F","D41_Ural_Fuel_MSV_01","B_Truck_01_fuel_F","O_Truck_03_fuel_F","D41_Heli_Transport_04_Fuel_F"])) then {
      _return = false;
    };
  };
  default: {
    if ((typeOf _vehicle) in ["C_Van_01_fuel_F","Civ_Truck_02_fuel2_F","D41_Ural_Fuel_MSV_01","B_Truck_01_fuel_F","O_Truck_03_fuel_F","D41_Heli_Transport_04_Fuel_F"]) then {
      _return = false;
    }
  }
};

_return;

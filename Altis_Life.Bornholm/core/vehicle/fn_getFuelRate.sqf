/*
  File: fn_getFuelRate.sqf
  Author: Jan Christophersen

  Description:
  Returns the fuel rates of a vehicle (capacity(liter), liter per km);
*/

private["_type", "_kind"];

_type = _this select 0;
_kind = _this select 1;

_return = [62.0, 2.84]; // 34l capacity, 2.84 liter per km

// Default Capacities
if (_kind == "Car") then {
  if (_kind == "LightVehicles" || _type in ["C_Van_01_box_F","D41_gaz66_repair_msv","D41_gaz66_ap2_msv","D41_gaz66_r142_msv","D41_gaz66o_msv","D41_gaz66_msv", "C_Van_01_fuel_F","C_Van_01_transport_F", "D41_uaz_open_MSV_01","D41_UAZ_MSV_01"]) then {
    _return = [120.0, 11.9];
  };
  if (_type in ["B_Truck_01_mover_F","D41_Ikarus_Civ_02","D41_Ikarus_Civ_01","Civ_Truck_02_transport_F","Civ_Truck_02_transport_plane_F",
    "B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_ammo_F","D41_typhoon_vdv","Civ_Truck_02_fuel2_F",
    "B_Truck_01_fuel_F","O_Truck_03_fuel_F","O_Truck_03_covered_F"]) then {
    _return = [350.0, 29.6];
  };
};
if (_kind == "Air") then {
  _return = [460.0,11.5];
};

switch (_type) do {
  case "D41_Lada_Civ_05": { _return = [34.0, 4.83]; };
  case "D41_S1203_Civ_01";
  case "D41_S1203_Civ_Gruen";
  case "D41_S1203_Civ_Orange";
  case "D41_S1203_Civ_Rot";
  case "D41_S1203_Civ_Silber";
  case "D41_S1203_Civ_Weiss": { _return = [60.0, 7.5]; };
  case "D41_Octavia_Civ_01": { _return = [52.0, 5.76]; };
};

_return;

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
if (_kind != "Air") then {
  if (_type in ["C_Van_01_box_F","D41_gaz66_repair_msv","D41_gaz66_ap2_msv","D41_gaz66_r142_msv","D41_gaz66o_msv","D41_gaz66_msv", "C_Van_01_fuel_F","C_Van_01_transport_F", "D41_uaz_open_MSV_01","D41_UAZ_MSV_01"]) then {
    _return = [180.0, 9.0];
  };
  if (_type in ["B_Truck_01_mover_F","D41_Ikarus_Civ_02","D41_Ikarus_Civ_01","Civ_Truck_02_transport_F","Civ_Truck_02_transport_plane_F",
    "B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_ammo_F","D41_typhoon_vdv","Civ_Truck_02_fuel2_F",
    "B_Truck_01_fuel_F","O_Truck_03_fuel_F","O_Truck_03_covered_F", "D41_Ural_MSV_01", "D41_Ural_Open_MSV_01"]) then {
    _return = [380.0, 18.1];
  };
  if (_type in ["civ_md500_blueline","civ_md500_shadow","civ_md500_whitered","civ_md500_greywatcher","civ_md500_speedy","civ_md500_sunset","civ_md500_wasp","civ_md500_wave",
    "D41_medic_helicopter","O_Heli_Light_02_unarmed_F","civ_ka60_whiteblue","D41_ka60_medic","civ_mohawk_ion","civ_mohawk_dahoman","D41_GNT_C185",
    "bwi_a3_t6a_8","bwi_a3_t6a_1","bwi_a3_t6a_3","bwi_a3_t6a_7","D41_RHS_UH60M_MEV","D41_Heli_Transport_04_bench_F","D41_Heli_Transport_04_F","D41_Heli_Transport_04_covered_F",
    "D41_Heli_Transport_04_Fuel_F","D41_Heli_Transport_03_unarmed_F","D41_police_helicopter","I_Heli_light_03_unarmed_F","D41_RHS_UH60M","civ_md500_urban"]) then {
    _return = [460.0,11.5];
  };
}
else {
  _return = [460.0,11.5];
};

switch (_type) do {
  // Normal Cars
  case "D41_Lada_Civ_01"; // All dem Lada
  case "D41_Lada_Civ_02";
  case "D41_Lada_Civ_03";
  case "D41_Lada_Civ_04";
  case "D41_Lada_Civ_05": { _return = [50.0, 3.57]; };
  case "D41_S1203_Civ_01";    // Skoda 1203
  case "D41_S1203_Civ_Gruen";
  case "D41_S1203_Civ_Orange";
  case "D41_S1203_Civ_Rot";
  case "D41_S1203_Civ_Silber";
  case "D41_S1203_Civ_Weiss": { _return = [68.0, 5.23]; };
  case "D41_Octavia_Civ_01": { _return = [58.0, 3.05]; }; // Skoda Octavia II 2.0 TDI

  // Heavy Cars
  case "D41_rhsusf_m1025_d"; // All dem HMMWV
  case "D41_rhsusf_m998_d_4dr_fulltop";
  case "D41_rhsusf_m1025_w";
  case "D41_B_m1151_m2_deployment_Jtac";
  case "D41_B_m1151_m2_deployment_Bumper";
  case "D41_B_m1151_m240_deployment";
  case "D41_B_HMMWV_Medevac";
  case "D41_B_M997A2_Ambulance";
  case "D41_rhsusf_m998_w_4dr_fulltop";
  case "D41_B_M998A2_sov_M2": { _return = [263.0, 11.95]; };
  case "I_MRAP_03_F";
  case "D41_tigr_msv": { _return = [150.0, 6.81]; }; // GAZ TIGR

  // Light Trucks


  // Heavy Trucks
  case "B_Truck_01_mover_F": { _return = [380.0, 15.3]; };
};
_return;

/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [];
		
		if(!license_cop_gangfirma && playerSide == west) then
		{
			_return = [
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_7","Jail/Knast","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(license_cop_gangfirma && playerSide == west) then {
		_return = _return +[
								["cop_spawn_5","Security","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
	};
	
	case civilian:
	{
		_return = [];
		
		if(license_civ_rebel && playerSide == civilian) then
		{
			_return = [
				["civ_spawn_reb1","Banditenlager Insel","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_reb2","Banditenlager Hotel","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(!license_civ_rebel && !license_civ_ganglast && !license_civ_gangrr && !license_civ_gangpow && playerSide == civilian) then
		{
			_return = [
				["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Paros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(count life_houses > 0) then
		{
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
		
		
		/*if(license_civ_gangfirma && playerSide == civilian) then {
		_return = _return +[
								["civ_spawn_11","Firma Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_ganglast && playerSide == civilian) then {
		_return = _return +[
								["civ_spawn_7","LAST Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_gangrr && playerSide == civilian) then {
		_return = _return +[
								["civ_spawn_13","RR Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};*/
	};
	
	case independent:
	{
		_return = [];
		
		if(license_med_adac && playerSide == independent) then {
		_return = _return + [
								["civ_spawn_31","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_32","ADAC HQ Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_33","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_34","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(((call life_mediclevel) >= 2) && playerSide == independent && !license_med_adac) then {
		_return = _return +[
								["medic_spawn_3","Pyrgos Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
								["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
								["medic_spawn_2","Athira Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
							];
		};
			
	};
};

_return;
/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
diag_log "Cleanup.sqf gestartet";

[] spawn
{
	private["_deleted"];
	_deleted = false;
	while {true} do
	{
		private["_veh","_units"];
		sleep (60 * 60);
		{
			_veh = _x;
			_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

			if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then
			{
				_dbInfo = _veh getVariable["dbInfo",[]];
				_units = {(_x distance _veh < 1000)} count playableUnits;
				if(count crew _x == 0) then
				{
					switch (true) do
					{
						case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
						case (_units == 0): {deleteVehicle _x; _deleted = true;};
					};
				};

				if(_deleted) then {
					waitUntil {isNull _veh};
					_deleted = false;
				};

				if(isNull _veh) then
				{
					systemChat "VEH NULL";
					if(count _dbInfo > 0) then
					{
						systemChat "Fixing...";
						_uid = _dbInfo select 0;
						_plate = _dbInfo select 1;
					};
				};
			};
		} foreach vehicles;
		diag_log "Cleanup #Fahrzeuge ausgeführt";
	};
};

[] spawn
{
	while {true} do
	{
		sleep (10 * 60);
		{
			deleteVehicle _x;
		} foreach (allMissionObjects "GroundWeaponHolder");
		{
			deleteVehicle _x;
		} foreach (allMissionObjects "Land_Money_F");
		diag_log "Cleanup #2 ausgeführt";
	};
};

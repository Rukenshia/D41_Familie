#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19","cop_20"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	switch (__GETC__(life_coplevel)) do
			{
				case 1: { life_paycheck = (1500)}; //Cadet
				case 2: { life_paycheck = (1800)}; //Officer
				case 3: { life_paycheck = (2100)}; //Cpl
				case 4: { life_paycheck = (2400)}; //Sgt
				case 5: { life_paycheck = (2700)}; //Lt
				case 6: { life_paycheck = (3000)}; //Captain
				case 7: { life_paycheck = (3300)}; //???
				case 8: { life_paycheck = (3600)}; //???
				case 9: { life_paycheck = (3900)}; //???
				case 10: { life_paycheck = (4200)}; //Chief Ast.
				case 11: { life_paycheck = (4500)}; //Chief
				default { life_paycheck = (500);}; //default in-case anything goes tits up
	};
};

player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
[] call life_fnc_updateCopUniform;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if (__GETC__(life_medicLevel) > 0) then {
	switch (__GETC__(life_medicLevel)) do {
		case 1: { life_paycheck = 350; };
		case 2;
		case 3: { life_paycheck = 1500; };
		case 4;
		case 5: { life_paycheck = 2000; };
		default { life_paycheck = 1000; };
	};
};

//[] call life_fnc_medicLoadout;
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

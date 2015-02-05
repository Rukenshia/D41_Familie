/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["Offroad_Pol","D41_Offroad_Medic","BMW_X6M_Pol","Offroad_SWAT","D41_swat_hunter","D41_Lada_Civ_05","D41_rhsusf_m1025_d"])) exitWith {titleText ["Karre steht nich inner liste","PLAIN"];}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	[[_vehicle,0.22],"life_fnc_copLights",true,false] call life_fnc_MP;
};

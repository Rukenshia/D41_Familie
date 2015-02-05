/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit","_unit2","_goggles","_uniform","_headgear","_hmd"];
_unit = cursorTarget;

if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == independent) exitWith {hint "Medics sind SAFE! Kein Festnehmen möglich!";};
if(player == _unit) exitWith {};

if(side player == civilian) then
	{
			player removeMagazine "D41_Kabelbinder";
	};

if(!isPlayer _unit) exitWith {};

//Broadcast!
player say3D "cuff";

life_maskiert = 0;
if ((goggles player) in D41_goggles_Array) then {life_maskiert = 1};
if ((uniform player) in D41_uniform_Array) then {life_maskiert = 1};
if ((headgear player) in D41_headgear_Array) then {life_maskiert = 1};
if ((hmd player) in D41_hmd_Array) then {life_maskiert = 1};

_unit setVariable["restrained",true,true];
[[player], "life_fnc_restrain", _unit, false] call life_fnc_MP;
if (life_maskiert > 0) then //ToClient
	{
		[[0,format["Du wurdest von %2 festgenommen",_unit getVariable["realname", name _unit], "einer Maskierten Person"]],"life_fnc_broadcast",_unit,false] call life_fnc_MP;
	}
		else
	{
		[[0,format["Du wurdest von %1 festgenommen", profileName]],"life_fnc_broadcast",_unit,false] call life_fnc_MP;
	};
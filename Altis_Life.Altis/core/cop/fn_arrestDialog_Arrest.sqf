/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Ungültiges Ziel."};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	hint "Du hast eine Zahl eingegeben.";
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint "Du kannst nur zwischen 5 und 60 Minuten in das Gefängnis"; };


closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;
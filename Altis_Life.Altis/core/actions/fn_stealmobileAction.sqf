/*
	File: fn_stealmobileaction.sqf
	Author: Distrikt41 - Dscha

	Description:
	"steal" cellphone?
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

hint "Du hast ihm das Handy abgenommen, auf den Boden geworfen und bist wie Rumpelstilzchen drauf rumgehüpft!";
[[player],"life_fnc_stealmobile",_target,false] call life_fnc_MP;
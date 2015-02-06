/*
  File: fn_healPlayer.sqf
  Author: Jan Christophersen

  Description:
  Heals the target player.
*/
private ["_target"];
_target = cursorTarget;

if(!isPlayer _target) exitWith {}; // Invalid target

_target setDamage 0;
titleText ["Patienten geheilt.", "PLAIN"];

// Send the message to the target
["Du wurdest von einem Sanitäter geheilt.","life_fnc_showTitleText", _target, false] call life_fnc_MP;

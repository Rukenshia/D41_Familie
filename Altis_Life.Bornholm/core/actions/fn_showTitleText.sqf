/*
  File: fn_showTitleText.sqf
  Author: Jan Christophersen

  Description:
  Displays a PLAIN titleText.
*/
private ["_message"];
_message = [_this,0,"No Message given.",[""]] call BIS_fnc_param;

titleText [_message, "PLAIN"];

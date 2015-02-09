/*
  File: fn_showHint.sqf
  Author: Jan Christophersen

  Description:
  Displays a hint
*/
private ["_message"];
_message = [_this,0,"Invalid Message (Report to Admin)",[""]] call BIS_fnc_param;

hint _message;

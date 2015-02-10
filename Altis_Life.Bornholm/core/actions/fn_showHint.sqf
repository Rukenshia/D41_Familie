/*
  File: fn_showHint.sqf
  Author: Jan Christophersen

  Description:
  Displays a hint
*/
private ["_message"];
_message = parseText (_this select 0);

hint _message;

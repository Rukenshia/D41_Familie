/*
  File: fn_handleFuelConsumption.sqf
  Author: Jan Christophersen

  Description:
  Server told us to handle consumption.
*/
private ["_vehicle", "_fuel"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

while { alive _vehicle } do {
  if (driver _vehicle != player && !isNull driver _vehicle) then {
    diag_log("Stopped handling fuel");
  };

  if (isNil {_vehicle getVariable "scriptFuel"}) then {
    diag_log "FUEL IS NIL";
    _fuel = 1.0;
  } else {
    _fuel = _vehicle getVariable "scriptFuel";
  };

  _vehicle setFuel _fuel;

  sleep 1;
};

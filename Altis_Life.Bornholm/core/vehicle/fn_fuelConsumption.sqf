/*
  File: fn_fuelConsumption.sqf
  Author: Jan Christophersen

  Description:
  Handles fuel consumption of a vehicle
*/

private ["_vehicle", "_kind", "_capacity", "_fuelData", "_consumption", "_getSpeedModifier", "_lastPos", "_distanceTravelled", "_fuel", "_lastFuel"];

_vehicle = _this select 0;

_kind = "Car";
if (_vehicle isKindOf "Air") then {
  _kind = "Air";
};
_fuelData = [typeOf _vehicle, _kind] call life_fnc_getFuelRate;
_capacity = _fuelData select 0;
_consumption = _fuelData select 1;

if (!(_vehicle isKindOf "Car") && !(_vehicle isKindOf "Air")) exitWith {diag_log("Invalid Fuel Consumption Timer: not a vehicle");};

// Returns the speed modifier
_getSpeedModifier = {
  private ["_speed"];
  _speed = _this select 0;
  _modifier = 1.0;

  if (_speed == 0) then {
    _modifier = 0.6;
  };
  if (_speed > 0 && _speed < 30) then {
    _modifier = 0.8;
  };
  if (_speed >= 30 && _speed < 50) then {
    _modifier = 0.9;
  };
  if (_speed >= 50 && _speed < 70) then {
    _modifier = 0.95;
  };
  if (_speed >= 70 && _speed < 100) then {
    _modifier = 1.0;
  };
  if (_speed >= 100 && _speed < 140) then {
    _modifier = 1.02;
  };
  if (_speed >= 140 && _speed < 170) then {
    _modifier = 1.04;
  };
  if (_speed >= 170) then {
    _modifier = 1.08;
  };

  _modifier;
};

_lastPos = [-4200.42];
_lastFuel = 1;
_distanceTravelled = 0.0;
while {alive _vehicle} do {
  if (isEngineOn _vehicle) then {
    _modifier = [speed _vehicle] call _getSpeedModifier;

    if ((_lastPos select 0) == -4200.42) then {
      _distanceTravelled = 0.0;
    } else {
      _distanceTravelled = _vehicle distance _lastPos;
    };

    _fuel = _lastFuel;

    if (_fuel < 0.15) then {
      _modifier = _modifier - 0.1;

      if (_modifier < 0) then {
        _modifer = 0.1;
      };
    };

    _vehicle setFuel (((_fuel * _capacity) - ((_distanceTravelled / 1000.0) * (_consumption * _modifier))) / _capacity);
    hint parseText format["Set Fuel<br /><br />Capacity: %1l<br />Speed: %2<br />Distance: %3<br />Consumption: %4l/km<br/>Modifier: %5<br /><br /><t color='#00ff00'>New Fuel: %6l</t>", _capacity, speed _vehicle, _distanceTravelled, _consumption, _modifier, (fuel _vehicle) * _capacity];

    _lastPos = position _vehicle;
    _lastFuel = fuel _vehicle;
    sleep 2;
  }
  else {
    _lastPos = [-4200.42];
    sleep 2;
  };
};

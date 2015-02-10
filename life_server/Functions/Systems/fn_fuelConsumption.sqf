/*
  File: fn_fuelConsumption.sqf
  Author: Jan Christophersen

  Description:
  Handles fuel consumption of a vehicle
*/

private ["_vehicle", "_maxSpeed", "_player", "_capacity", "_fuelData", "_consumption", "_getSpeedModifier", "_lastPos", "_distanceTravelled", "_fuel", "_newFuel"];

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_maxSpeed = _this select 1;
_player = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

// Set up Vehicle
_vehicle setVariable ["scriptFuel", 1.0, true];

_fuelData = [_this,2,[62.0,2.84], [[]]] call BIS_fnc_param;
_capacity = _fuelData select 0;
_consumption = _fuelData select 1;

if (!(_vehicle isKindOf "Car") && !(_vehicle isKindOf "Air")) exitWith {diag_log("Invalid Fuel Consumption Timer: not a vehicle");};

// Returns the speed modifier
_getSpeedModifier = {
  private ["_speed"];
  _speed = _this select 0;
  _modifier = 1.0;

  if (_speed < 0) then {
    _speed = _speed * -1; // Make it positive!
  };

  // Do it in percent, yay
  _speed = (_speed / _maxSpeed) * 100.0;

  if (_speed == 0) then {
    _modifier = 0.6;
  };
  if (_speed > 0 && _speed < 20) then {
    _modifier = 0.7;
  };
  if (_speed >= 20 && _speed < 40) then {
    _modifier = 0.75;
  };
  if (_speed >= 40 && _speed < 50) then {
    _modifier = 0.8;
  };
  if (_speed >= 50 && _speed < 70) then {
    _modifier = 0.9;
  };
  if (_speed >= 70 && _speed < 85) then {
    _modifier = 0.95;
  };
  if (_speed >= 85 && _speed <= 100) then {
    _modifier = 1.0;
  };
  if (_speed > 100) then {
    _modifier = 1.1;
  };

  _modifier;
};

_lastPos = [-4200.42];
_distanceTravelled = 0.0;
while {alive _vehicle} do {
  if (isEngineOn _vehicle) then {
    if (driver _vehicle != _player && !isNull _player || isNull driver _vehicle) then {
      // Okay, we know that _something_ changed. Fuel will still count down, so if everyone disconnected and somebody enters the vehicle later, we will still count the fuel.
      private["_target"];
      _target = driver _vehicle;
      if (isNull (driver _vehicle)) then {
        if (!isNull _player) then {
          _target = _player;
        };
      };
      if (!isNull _target) then {
        // Original Player is not driving the vehicle anymore.
        [[_vehicle], "life_fnc_handleFuelConsumption", driver _vehicle, false] spawn life_fnc_MP;
        _player = driver _vehicle;
      };
    };
    _modifier = [speed _vehicle] call _getSpeedModifier;

    if ((_lastPos select 0) == -4200.42) then {
      _distanceTravelled = 0.0;
    } else {
      _distanceTravelled = _vehicle distance _lastPos;
    };

    if (isNil {_vehicle getVariable "scriptFuel"}) then {
      _fuel = fuel _vehicle;
    }
    else {
      _fuel = _vehicle getVariable "scriptFuel";
    };

    if (_fuel < 0.15) then {
      _modifier = _modifier - 0.1;

      if (_modifier < 0) then {
        _modifer = 0.1;
      };
    };

    // Reduction for cops
    if (isPlayer (driver _vehicle) && (side (driver _vehicle) == independent || side (driver _vehicle) == west)) then {
      _modifier = _modifier - 0.1;
    };

    if (speed _vehicle > -0.2 && speed _vehicle < 0.2) then {
      // Standing Vehicle Consumption
      _newFuel = (((_fuel * _capacity) - (_consumption * 0.01)) / _capacity);
    }
    else {
      // Driving Vehicle Consumption
      _newFuel = (((_fuel * _capacity) - ((_distanceTravelled / 1000.0) * _consumption * _modifier)) / _capacity);
    };

    _vehicle setFuel _newFuel;

    /*if (!isNull driver _vehicle) then {
      [[format["Set Fuel<br /><br />Capacity: %1l<br />Speed: %2<br />Distance: %3<br />Consumption: %4l/km<br/>Modifier: %5<br /><br /><t color='#00ff00'>New Fuel: %6l</t>", _capacity, speed _vehicle, _distanceTravelled, _consumption, _modifier, (fuel _vehicle) * _capacity]],
      "life_fnc_showHint", driver _vehicle, false] call life_fnc_MP;
    };*/

    _lastPos = position _vehicle;
    _vehicle setVariable ["scriptFuel", _newFuel, true];
    sleep 2;

  }
  else {
    _lastPos = [-4200.42];
    sleep 2;
  };
};

/*
  File: fn_checkCargo.sqf
  Author: Bryan "Tonic" Boardwine

  Description:
  Checks the cargo for "unwanted" materials
*/
private ["_player", "_vehicle", "_cargo", "_item", "_amount", "_putBack", "_givePlayer", "_removedSomething"];
_player = _this select 0;
_vehicle = _this select 1;
_cargo = getMagazineCargo _vehicle;
_putBack = [];
_givePlayer = [];
_removedSomething = false;

{
  _item = _x;
  _amount = (_cargo select 1) select _forEachIndex;

  if (([_vehicle, _item] call life_fnc_canAddCargo)) then {
    _putBack pushback [_item, _amount];
  }
  else {
    _givePlayer pushback [_item, _amount];
    _removedSomething = true;
  };

} foreach (_cargo select 0);

clearMagazineCargoGlobal _vehicle;

{
  _vehicle addMagazineCargoGlobal _x;
} foreach (_putBack);

{
  _item = _x select 0;
  _amount = _x select 1;
  for [ {_i=0}, {_i<_amount}, {_i = _i + 1} ] do
  {
    if (_player canAdd _item) then {
      _player addMagazine _item;
    }
    else {
      /*if (_player canAddItemToBackpack _item) then {
        _player addItemToBackpack _item;
      }
    else {*/
        diag_log "Can not add Magazine";
      //};
    };
  };
} foreach (_givePlayer);

if (_removedSomething) then {
  if (_player == player) then {
    hint "Ein oder mehrere items wurden aus dem Fahrzeug entfernt, da sie nicht in diesem Fahrzeug erlaubt sind. Sie befinden sich in deinem Inventar.";
  }
  else {
    ["Ein oder mehrere Items wurden aus dem Fahrzeug entfernt, da sie nicht in diesem Fahrzeug erlaubt sind. Sie befinden sich in deinem Inventar.", "life_fnc_showHint", _player, false] call life_fnc_MP;
  };
};

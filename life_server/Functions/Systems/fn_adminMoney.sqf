/*
  File: fn_adminMoney.sqf
  Author: Jan Christophersen

  Description:
  Admin-Rückerstattung (DB-Eintrag, Meldung)
*/

private["_target","_amount", "_reason", "_player", "_query", "_date"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_amount = [_this,1,"",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_reason = [_this,3,"Kein Grund?!",[""]] call BIS_fnc_param;

if (isNull _target || isNull _player) exitWith {};

_query = format["INSERT INTO refunds (admin, player, amount, reason) VALUES('%1','%2','%3','%4')",getPlayerUID _player,getPlayerUID _target,_amount, _reason];

waitUntil{sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_query = format["INSERT INTO rawrefunds (admin, player, amount) VALUES('%1','%2','%3')",getPlayerUID _player,getPlayerUID _target,_amount];
waitUntil{sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

diag_log(format["--- Rückerstattung durchgeführt von %1 zu %2, Geld: %3 ---", name _player, name _target, _amount]);
[[_target,_amount,_player],"life_fnc_receiveAdminMoney",_target,false] call life_fnc_MP;

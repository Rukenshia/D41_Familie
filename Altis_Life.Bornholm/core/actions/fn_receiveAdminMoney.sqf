/*
  File: fn_receiveAdminMoney.sqf
  Author: Bryan "Tonic" Boardwine

  Description:
  Admin Rückerstattung erhalten
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {hint "1";};
if(player != _unit) exitWith {hint "2";};
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "3";};
//if(_unit == _from) exitWith {hint "4";}; //Bad boy, trying to exploit his way to riches.

hint format["Du hast eine Rückerstattung von %1 in Höhe von %2€ erhalten.", _from getVariable["realname",name _from], [(parseNumber(_val))] call life_fnc_numberText];
D41_atmGeld = D41_atmGeld + (parseNumber(_val));
[] call life_fnc_hudUpdate;
[1] call SOCK_fnc_updatePartial;
[[format["%1 hat eine Rückerstattung von %2 erhalten.",name player, _from getVariable["realname",name _from]]], "TON_fnc_logMessage", false, false] call life_fnc_MP;

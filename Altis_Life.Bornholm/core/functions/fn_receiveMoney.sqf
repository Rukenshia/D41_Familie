/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {hint "1";};
if(player != _unit) exitWith {hint "2";};
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "3";};
if(_unit == _from) exitWith {hint "4";}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText];
D41_Geld = D41_Geld + (parseNumber(_val));
[] call life_fnc_hudUpdate;
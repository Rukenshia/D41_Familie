/*
	File: fn_insertStockSys.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/
	private["_type","_amount","_mode","_sellerID","_query"];
	
	_type = [_this,0,"",[""]] call BIS_fnc_param;
	_amount = [_this,1,"",[""]] call BIS_fnc_param;
	_mode = [_this,2,"",[""]] call BIS_fnc_param;
	_sellerID = _this select 3;
	
	diag_log format ["insertStockSys _type : %1 - _amount: %2 - _mode: %3 - _sellerID: %4", _type, _amount, _mode, _sellerID];

switch(_mode) do
{
	case "1"	:	{_query = format["UPDATE stocksys SET %1 = %1 - %2 WHERE ID=1",_type,_amount]; waitUntil {!DB_Async_Active}; _thread = [_query,false] spawn DB_fnc_asyncCall; waitUntil {scriptDone _thread};};
	case "2"	:	{_query = format["UPDATE stocksys SET %1 = %1 + %2 WHERE ID=1",_type,_amount]; waitUntil {!DB_Async_Active}; _thread = [_query,false] spawn DB_fnc_asyncCall; waitUntil {scriptDone _thread};};
	default {diag_log format ["INSERT STOCK SYS : FEHLER Typ: %1",_type];};
};
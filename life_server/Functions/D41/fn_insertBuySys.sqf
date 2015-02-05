/*
	File: fn_insertSellSys.sqf
	Author: Dscha
	
	Description:
	Inserts Stuff to DB
*/
	private["_amount","_type","_query","_thread"];
	
	_type = [_this,0,"",[""]] call BIS_fnc_param;
	_amount = [_this,1,"",[""]] call BIS_fnc_param;
	
		_query = format["UPDATE sellsys SET %1 = %1 - %2 WHERE ID=1",_type,_amount];
		//diag_log format ["SellSys query : %1", _query];
		
		waitUntil {!DB_Async_Active};
		_thread = [_query,false] spawn DB_fnc_asyncCall;
		waitUntil {scriptDone _thread};
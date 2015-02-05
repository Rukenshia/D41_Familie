/*
	File: fn_insertKarma.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/
	private["_uid","_type","_query","_sql"];

	_uid = [_this,0,"",[""]] call BIS_fnc_param;
	_type = [_this,1,"",[""]] call BIS_fnc_param;

		_query = format["UPDATE players SET Karma = Karma + %2 WHERE playerid=%1",_uid,_type];
		
		waitUntil {!DB_Async_Active};
		_thread = [_query,false] spawn DB_fnc_asyncCall;
		waitUntil {scriptDone _thread};

//Clientside:
//_type = "10"; ODER _type = "-10";
//[[getPlayerUID player, _type],"D41_fnc_insertKarma",false,false] call life_fnc_MP;
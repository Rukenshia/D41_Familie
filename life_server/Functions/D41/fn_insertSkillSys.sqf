/*
	File: fn_insertSkillSys.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/
	private["_uid","_query"];

	_uid = [_this,0,"",[""]] call BIS_fnc_param;
	//_type = [_this,1,"",[""]] call BIS_fnc_param;
		
		//Obsolete/Altes Vorgehen... Hatte bei jedem Sammelvorgang etwas in die DB geschrieben! Bei 20 Leuten vllt. noch okay, bei 60 Leuten sinnbefreit und Ressourcenverschwendend!
		//_query = format["UPDATE skillsys SET %1 = %1 + 1 WHERE playerid=%2",_type,_uid];
		//diag_log format ["InsertSkillSys query : %1", _query];
		
		//waitUntil {!DB_Async_Active};
		//_thread = [_query,false] spawn DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};

		_query = format["UPDATE skillsys SET D41_Apfel = %2, D41_Pfirsich = %3, D41_Salz = %4, D41_Sand = %5, D41_EisenRoh = %6, D41_KupferRoh = %7, D41_DiamantenRoh = %8, D41_CannabisRoh = %9, D41_KokainRoh = %10, D41_HeroinRoh = %11, D41_OelRoh = %12, D41_FleischRoh = %13, D41_KohleRoh = %14, D41_Bruchstein = %15, D41_TonRoh = %16, D41_Krabben = %17, D41_Fischen  = %18 WHERE playerid='%1'",
		_uid,
		_this select 1,
		_this select 2,
		_this select 3,
		_this select 4,
		_this select 5,
		_this select 6,
		_this select 7,
		_this select 8,
		_this select 9,
		_this select 10,
		_this select 11,
		_this select 12,
		_this select 13,
		_this select 14,
		_this select 15,
		_this select 16,
		_this select 17];
		
		diag_log format ["InsertSkillSys Update ID: %1 : %2", _uid, _query];
		waitUntil {!DB_Async_Active};
		_thread = [_query,false] spawn DB_fnc_asyncCall;
		waitUntil {scriptDone _thread};
/*
	File: fn_queryStockSys.sqf
	Author: Dscha

	Description:
	query Stuff from DB
*/
private["_type","_amount","_player","_query","_queryResult","_Menge"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_amount = [_this,1,"",[""]] call BIS_fnc_param;
_player = _this select 2;

        _query = format["SELECT %1 FROM stocksys WHERE ID=1", _type];
		waitUntil{!DB_Async_Active};
		_queryResult = [_query,2] call DB_fnc_asyncCall;
		
		D41_Menge = _queryResult select 0;
		D41_Amount = parseNumber(_amount);
		D41_Bestand = D41_Menge - D41_Amount;
		diag_Log format ["::::::::::::::::: stocksys D41_Bestand: %1 %2",D41_Bestand, _type];
		
		if(D41_Bestand < 1) 	then {D41_BuyAble = 0;};
		if(D41_Bestand >= 1) 	then {D41_BuyAble = 1;};

		publicVariable "D41_BuyAble";
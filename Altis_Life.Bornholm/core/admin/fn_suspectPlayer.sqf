/*
	File: fn_suspectPlayer.sqf
	Author: Jan Christophersen

	Description:
	Tells the server that a player is acting suspicious
*/
private ["_type", "_suspicion", "_message"];

_type = _this select 0;
_suspicion = _this select 1;
_message = _this select 2;

[[format["[SUSPECT:%1] Spieler: %2 (UID '%3') -- Verdacht auf %4. Zusatz: %5", _type, name player, getPlayerUID player, _suspicion, _message]], "TON_fnc_logMessage", false, false] call life_fnc_MP;
[[name player,format["Verdacht auf %1<br />Zusatzinfo: %2<br /><br />UID: %3",_suspicion, getPlayerUID player, _message]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;

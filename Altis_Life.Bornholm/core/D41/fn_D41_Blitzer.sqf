//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_Blitzer.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Startet Blitzereinstellungen
//::::::::::::  ::::::::::::\\

private["_Veh","_MaxGeschw","_Blitzer"];
_mod = _this select 0;

D41_BlitzerListe = ["Land_Blitzer"];
_Blitzer = nearestObjects [player,D41_BlitzerListe, 5];
_Blitzer = _Blitzer select 0;
if(_Blitzer getVariable["D41_Blitzer",false]) exitWith {hint format ["Es wurde bereits eine Messung gestartet", _Blitzer]};
_Blitzer setVariable ["D41_Blitzer", true, true];

if(_mod == 1) then {_MaxGeschw = 30;};
if(_mod == 2) then {_MaxGeschw = 50;};
if(_mod == 3) then {_MaxGeschw = 70;};
if(_mod == 4) then {_MaxGeschw = 80;};
if(_mod == 5) then {_MaxGeschw = 100;};
if(_mod == 6) then {_MaxGeschw = 130;};

hint format ["Messung gestartet für %1 Km/h",_MaxGeschw];

while{true}do
{
	D41_KarreCheck = false;
	if(!(_Blitzer getVariable "D41_Blitzer")) exitWith {hint "Messung abgebrochen"};
	sleep 0.5;
	_Veh = nearestObjects [_Blitzer, ["car"], 20];
	if((count _Veh) > 0) then {D41_Karre = _Veh select 0; D41_KarreCheck = true;};
	if(D41_KarreCheck) then
		{
			if(((speed D41_Karre)-5) > _MaxGeschw) then
			{
				hint format ["Zu schnell: Geschwindigkeit: %1 Km/h",round(speed D41_Karre)];
				[[_MaxGeschw],"life_fnc_D41_BlitzerFlash",D41_Karre,false] call life_fnc_MP;
				sleep 3;
			};
		};
};

//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_PutItem.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Bearbeitet das automatische einlagern in ein Fahrzeug?
//::::::::::::  ::::::::::::\\

private["_Item","_Veh","_Player","_Cnt"];

_Item = "";

if((lbCurSel 633) != -1)then { _Item = format ["%1",lbData [633, (lbCurSel 633)]];};
if((lbCurSel 638) != -1)then { _Item = format ["%1",lbData [638, (lbCurSel 638)]];};
if((lbCurSel 619) != -1)then { _Item = format ["%1",lbData [619, (lbCurSel 619)]];};

_Veh = cursorTarget;
if((player distance _Veh) > 7)exitWith {hint "Du mußt innerhalb eines Radius von 3m um das Fahrzeug sein, um etwa hineinlegen zu können! Oder haste Affenarme?";};
if(_Item == "") exitWith {hint "Nichts zum einlagern ausgewählt oder Item kann nicht automatisch eingelagert werden [fehlender Classname in der config! Thx BIS ;)].";};
D41_LagertEin = 1;
if(_Item != "") then
	{
		_Player = player;
		if(!((_Veh isKindOf "Car") || (_Veh isKindOf "Air") || (_Veh isKindOf "Ship") || (typeOf _Veh in ["D41_Box_IND_Grenades_F","D41_supplyCrate_F","D41_LagerhausKiste_F"]))) exitWith {D41_LagertEin = 0; hint "Land in Sicht!!\n(Kein Fahrzeug in der Mitte des Bildschirms)"};
		disableUserInput true;
		while{true}do
		{
			if(speed player > 1) exitWith {D41_LagertEin = 0; hint "Blind einladen? Nix is! Halte Deine Augen auf den Kofferraum gerichtet!"};
			if (!(_Veh canAdd _Item)) exitWith {D41_LagertEin = 0; hint "Fahrzeug ist voll";};
			if(!(_Item in magazines player)) exitWith {D41_LagertEin = 0; hint "Alles eingeladen";};
			player removeMagazine _Item;
			_Veh addMagazineCargoGlobal [_Item,1];
			sleep 0.1;
		};
		disableUserInput false;
		D41_LagertEin = 0;
	};

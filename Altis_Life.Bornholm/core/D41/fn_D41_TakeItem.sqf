
//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_TakeItem.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Bearbeitet das automatische herausnehmen von Items aus einem Fahrzeug?
//::::::::::::  ::::::::::::\\

private["_TakeThat","_Item","_Veh","_Player","_inv","_counter","_ret","_ItemCount","_amount","_taken"];

_TakeThat = "";

if((lbCurSel 640) != -1)then { _TakeThat = format ["%1",lbData [640, (lbCurSel 640)]];};

if(_TakeThat == "") exitWith {hint "Nichts zum einlagern ausgewählt oder Item muss per Hand verladen werden.";}; //Jaja, Doppelcheck nachher
if(isNull cursorTarget)exitWith{hint "Willst Du nicht lieber sehen, was Du raus nimmst?\n\n Fahrzeug anschauen!"};
if(!((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Air") || (cursorTarget isKindOf "Ship") || (typeOf cursorTarget in ["D41_Box_IND_Grenades_F","D41_supplyCrate_F","D41_LagerhausKiste_F"]))) exitWith {hint "Wenn Du etwas aus einem 'Fahrzeug' nehmen möchtest, solltest Du auch eines anschauen!\n\nKlingt logisch, oder? ;)"};
if(count(nearestObjects[getPos player, ["Car","Air","Ship"],7]) > 1)exitWith {hint "Da du zu füllig bist, brauchst Du mehr Platz zum ausladen! Park ein paar Meter weiter weg"};

_Veh = cursorTarget;
if((player distance _Veh) > 7)exitWith {hint "Du mußt innerhalb eines Radius von 3m um das Objekt befinden, um etwa hineinlegen zu können! Oder haste Affenarme?";};
D41_LagertEin = 1;
if(_TakeThat != "") then //Jaja, Doppelcheck
	{
		_secCheck = false;
		_Player = player;
		if(!((_Veh isKindOf "Car") || (_Veh isKindOf "Air") || (_Veh isKindOf "Ship") || (typeOf _Veh in ["D41_Box_IND_Grenades_F","D41_supplyCrate_F","D41_LagerhausKiste_F"]))) exitWith {D41_LagertEin = 0; hint "Land in Sicht!!\n\n(Kein Objekt zum automatischen einlagern in der Mitte des Bildschirms)"};
		disableUserInput true;
		
		_inv = magazineCargo _Veh;
		_counter = 0;
		_ret = [];
		{
			_Item = _x;
			if(!(_Item in _ret))then
				{
					_ret pushback _Item;
					_ItemCount = ({_x == _Item} count _inv);
					_ret pushback _ItemCount;
				};
		}forEach _inv;
		
		if(isNil {_Veh getVariable "D41_SecCheck"})then{ _Veh setVariable["D41_SecCheck",false,true]; };
		if(_Veh getVariable "D41_SecCheck")exitWith{_secCheck = true; closedialog 0; hint "Jemand nimmt schon etwas aus dem Fahrzeug #1"};
		_Veh setVariable["D41_SecCheck",true,true];
		sleep (0.5+(random(2)));
		if(isNil {_Veh getVariable "D41_SecCheck2"})then{ _Veh setVariable["D41_SecCheck2",false,true]; };
		if(_Veh getVariable "D41_SecCheck2")exitWith{_secCheck = true; closedialog 0; hint "Jemand nimmt schon etwas aus dem Fahrzeug #2"};
		_Veh setVariable["D41_SecCheck2",true,true];
		
		if(_secCheck)exitWith{D41_LagertEin = 0; hint "Nanana! So nich mein Freundchen! Warte bis Du dran bist!"};
		
		clearMagazineCargoGlobal _Veh;
		
		{
			if(_x in _inv)then
			{
			
				_Item = format["%1",_x];
				_amount = _ret select (_counter + 1);
				_taken = false;
				if(_x == _TakeThat)then
				{
					for "_i" from 1 to _amount do
					{
							if(!(player canAdd _TakeThat))exitWith{};
							player addMagazine _TakeThat;
							_amount = _amount - 1;
							_ret set[(_counter + 1),_amount];
							_taken = true;
							sleep 0.1;
					};
				};
				_counter = _counter + 1;
				_Veh addMagazineCargoGlobal [_Item, (_ret select _counter)];
			}
			else
			{
				_counter = _counter + 1;
			};
		}forEach _ret;
		_Veh setVariable["D41_SecCheck",false,true];
		_Veh setVariable["D41_SecCheck2",false,true];
	};
disableUserInput false;
D41_LagertEin = 0;
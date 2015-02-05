//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_Verarbeiter.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Nötig fürs Item verarbeiten?
//::::::::::::  ::::::::::::\\

private["_ItemInput","_ItemInput2","_ItemOutput","_Mod","_Mod2","_ProcTimer","_ItemOutputCount","_Pos","_action"];

_ItemInput = _this select 0;
_ItemInput2 = _this select 1;
_ItemOutput = _this select 2;
_Mod = _this select 3;
_Mod2 = _this select 4;
_ProcTimer = _this select 5;
_ItemOutputCount = _this select 6;
_Pos = position player;

D41_CounterInput = 0;
D41_CounterInput2 = 0;
D41_CounterOutput = 0;
D41_MultiProc = false;
if(_ItemInput2 != "") then {D41_MultiProc = true};

if(({_x == _ItemInput} count magazines player) < _Mod) exitWith {hint format ["Nicht genug %1 dabei",([_ItemInput] call life_fnc_D41_GetMagName)];};
if(({_x == _ItemInput2} count magazines player) < _Mod2) exitWith {hint format ["Nicht genug %1 dabei",([_ItemInput2] call life_fnc_D41_GetMagName)];};

_action = [
format["Willst Du alles verarbeiten?"],"Verarbeiten","Alles","Einzeln"
] call BIS_fnc_guiMessage;

D41_WandeltUm = true;

if(_ItemInput in (magazines player)) then
	{
		//if(!(player canAddItem _ItemOutput)) exitWith {hint "Zu voll, leg erstmal etwas ab!";};
		if(_action) then
		{
			while{true}do
			{
				if((player distance _Pos) > 5) exitWith {};
				if(!alive player) exitWith {};
				if(({_x == _ItemInput} count magazines player) < _Mod) exitWith {};
				if(({_x == _ItemInput2} count magazines player) < _Mod2) exitWith {};
				for "_i" from 1 to _Mod do
				{				
					player removeMagazine _ItemInput;
					D41_CounterInput = D41_CounterInput + 1;
				};
				
				if(D41_MultiProc) then
				{
					for "_i" from 1 to _Mod2 do
					{				
						player removeMagazine _ItemInput2;
						D41_CounterInput2 = D41_CounterInput2 + 1;
					};
				};
				
				for "_i" from 1 to _ItemOutputCount do
				{
					player addMagazine _ItemOutput;
					D41_CounterOutput = D41_CounterOutput + 1;
				};
				
				if(D41_MultiProc) then
				{
					hint format ["%1x %2\nund\n%3x %4\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName)];
				}
				else
				{
					hint format ["%1x %2\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName)];
				};
				sleep _ProcTimer;
			};
			
			D41_WandeltUm = false;
			if(D41_MultiProc) then
				{
					hint format ["Du hast:\n\n%1x %2\nund\n%3x %4\n\nzu\n\n%5x %6\n\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName), D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
				}
				else
				{
					hint format ["Du hast:\n\n%1x %2\n\nzu\n\n%3x %4\n\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
				};
		}
		else
		{
			if(({_x == _ItemInput} count magazines player) < _Mod) exitWith {};
			if(({_x == _ItemInput2} count magazines player) < _Mod2) exitWith {};
			for "_i" from 1 to _Mod do
			{
				player removeMagazine _ItemInput;
				D41_CounterInput = D41_CounterInput + 1;
			};
			
			if(D41_MultiProc) then
			{
				for "_i" from 1 to _Mod2 do
				{
					player removeMagazine _ItemInput2;
					D41_CounterInput2 = D41_CounterInput2 + 1;
				};
			};
			
			for "_i" from 1 to _ItemOutputCount do
			{
				player addMagazine _ItemOutput;
				D41_CounterOutput = D41_CounterOutput + 1;
			};
			if(D41_MultiProc) then
			{
				hint format ["Du hast:\n\n%1x %2\nund\n%3x %4\n\nzu\n\n%5x %6\n\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName), D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
			}
			else
			{
				hint format ["Du hast:\n\n%1x %2\n\nzu\n\n%3x %4\n\nverarbeitet",D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
			};
			D41_WandeltUm = false;
		};
	};

	//_val = getMagazineCargo backpackContainer player; hint format ["%1",_val];
#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
if((lbCurSel 2201) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
private["_type","_price","_amount","_diff","_name","_hideout","_StockListe"];
if(D41_IsBuying == 1) exitWith {hint "Nicht den Kaufbutton spammen! Danke.";};
D41_IsBuying = 1;
_type = lbData[2201,(lbCurSel 2201)];
_index = [_type,__GETC__(buy_array)] call TON_fnc_index;
if(_index == -1) exitWith {D41_IsBuying = 0;};
_price = (__GETC__(buy_array) select _index) select 1;
if((call life_coplevel) > 0) then {_price = _price * 0.8;};

_amount = ctrlText 2210;
if(!([_amount] call TON_fnc_isnumber)) exitWith {D41_IsBuying = 0; hint localize "STR_Shop_Virt_NoNum";};
if(_type == "D41_Goldbarren")exitWith{closedialog 0; D41_IsBuying = 0; hint "Die sind nicht zu verkaufen! Geh weg!"};

_amount = parseNumber(_amount);
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > D41_Geld && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {D41_IsBuying = 0; hint localize "STR_NOTF_NotEnoughMoney"};

_CannotAdd = false;
_name = "";

if(isClass (configFile >> "CfgWeapons" >> _type))	then {_name = [_type] call life_fnc_D41_GetWpnName;};
if(isClass (configFile >> "CfgMagazines" >> _type))	then {_name = [_type] call life_fnc_D41_GetMagName;};

D41_BuyAble = 1;
//:::::::::::::::: D41StockSys
_StockListe = ["D41_Apfel", "D41_Pfirsich", "D41_Apfelschnaps", "D41_Pfirsichschnaps", "D41_Heroin", "D41_Oel", "D41_Cannabis", "D41_BeefJerky", "D41_Kokain", "D41_Diamanten", "D41_Eisen", "D41_Kupfer", "D41_Salz", "D41_Kohle", "D41_Glas", "D41_Apfelsaft", "D41_Pfirsichsaft", "D41_Ton", "D41_Zement", "D41_WaffenKomponenten", "D41_Stahl", "D41_Fahrzeugteile", "D41_Kerosin", "D41_Kalkstein", "D41_Krabben"];
if(_type in _StockListe)then
	{
		hint format ["Lagerabfrage für %1 läuft",_name];
		[[_type, [_amount] call life_fnc_numberText, player],"D41_fnc_queryStockSys",false,false] call life_fnc_MP;
		sleep 1;
		player getVariable "D41_BuyAble";
	};
//::::::::::::::::
if (D41_BuyAble == 0) exitWith {D41_IsBuying = 0; hint format ["Nicht genügend %1 auf Lager",_name];};
disableUserInput true;
sleep 1;

	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then
	{
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[D41_Geld] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			if(_type in _StockListe)then{[[_type, [_amount] call life_fnc_numberText,"1",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;
		} else {
			_Counter = 0;
			for "_i" from 1 to _amount do
			{
				if(isClass (configFile >> "CfgWeapons" >> _type))then{_ItemType = getNumber (configFile >> "CfgWeapons" >> _type >> "type"); if(_ItemType == 1)exitWith {if(primaryWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 2) exitWith {if(handgunWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 4) exitWith {if(secondaryWeapon player == "")then {player addWeapon _type;} else {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";};}; if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true;hint "Nicht genug Platz im Inventar!";};player addMagazine _type;};
				if(_CannotAdd)exitWith{};
				D41_Geld = D41_Geld - _price;
				_Counter = _Counter + 1;
			};
			hint format[localize "STR_Shop_Virt_BoughtItem",_Counter,_name,[(_price * _counter)] call life_fnc_numberText];
			if(_type in _StockListe)then{[[_type, [_amount] call life_fnc_numberText,"1",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
		};
	}
	else
	{
		if((_price * _amount) > D41_Geld) exitWith {D41_IsBuying = 0; hint localize "STR_NOTF_NotEnoughMoney";};
		_Counter = 0;
		for "_i" from 1 to _amount do
		{
			if(isClass (configFile >> "CfgWeapons" >> _type))then{_ItemType = getNumber (configFile >> "CfgWeapons" >> _type >> "type"); if(_ItemType == 1)exitWith {if(primaryWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 2) exitWith {if(handgunWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 4) exitWith {if(secondaryWeapon player == "")then {player addWeapon _type;} else {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";};}; if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true;hint "Nicht genug Platz im Inventar!";};player addMagazine _type;};
			if(_CannotAdd)exitWith{};
			D41_Geld = D41_Geld - _price;
			_Counter = _Counter + 1;
		};
		hint format[localize "STR_Shop_Virt_BoughtItem",_Counter,_name,[(_price * _counter)] call life_fnc_numberText];
		if(_type in _StockListe)then{[[_type, [_amount] call life_fnc_numberText,"1",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
		D41_IsBuying = 0;
	};

[] call life_fnc_virt_update;
disableUserInput false;
D41_IsBuying = 0;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
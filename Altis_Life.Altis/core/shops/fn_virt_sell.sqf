#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_StockListe","_amount","_name"];
if(D41_IsBuying == 1) exitWith {hint "Nicht den Verkaufsbutton spammen! Danke.";};
D41_IsBuying = 1;
if((lbCurSel 2200) == -1) exitWith {D41_IsBuying = 0;};
_type = lbData[2200,(lbCurSel 2200)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {D41_IsBuying = 0;};
_price = (__GETC__(sell_array) select _index) select 1;
if((call life_coplevel) > 0) then {_price = _price * 0.8;};

_StockListe = ["D41_Apfel", "D41_Pfirsich", "D41_Apfelschnaps", "D41_Pfirsichschnaps", "D41_Heroin", "D41_Oel", "D41_Cannabis", "D41_BeefJerky", "D41_Kokain", "D41_Diamanten", "D41_Eisen", "D41_Kupfer", "D41_Salz", "D41_Kohle", "D41_Glas", "D41_Apfelsaft", "D41_Pfirsichsaft", "D41_Ton", "D41_Zement", "D41_WaffenKomponenten", "D41_Stahl", "D41_Fahrzeugteile", "D41_Kerosin", "D41_Kalkstein", "D41_Krabben"];

_amount = ctrlText 2211;
if(!([_amount] call TON_fnc_isnumber)) exitWith {D41_IsBuying = 0; hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);

_type2 = [];
_type2 set [0,_type];

if (isClass (configFile >> "CfgWeapons" >> _type)) then
{
	_name = [_type] call life_fnc_D41_GetWpnName;

	hint format ["%1 wird ins Lagerhaus geräumt",_name];
	disableUserInput true;
	sleep 1;
	
	if(_type in (Items player)) then
	{
		_Inv = Items player;
		_Counter = 0;
		{
			if(_x in _Inv) then
			{
				_val = {_x == _type} count Items player;
				if(_val < _amount) exitWith {hint format ["Du hast %1 %2 zu wenig!", (_amount - _val), _type]; D41_IsBuying = 0;};
				for "_i" from 1 to _amount do
				{
					player removeItem _type;
					D41_Geld = D41_Geld + _price;
				};
				if(_type in _StockListe)then{[[_type, [_amount] call life_fnc_numberText,"2",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
				hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			};
		}forEach _type2;
	};
};
if ( isClass (configFile >> "CfgMagazines" >> _type)) then
{
	_name = [_type] call life_fnc_D41_GetMagName;

	hint format ["%1 wird ins Lagerhaus geräumt",_name];
	disableUserInput true;
	sleep 1;
	
	if(_type in (magazines player)) then
	{
		_Inv = Magazines player;
		_Counter = 0;
		{
			if(_x in _Inv) then
			{
				_val = {_x == _type} count magazines player;
				if(_val < _amount) exitWith {hint format ["Du hast %1 zu wenig %2", (_amount - _val), _type]; D41_IsBuying = 0;};
				for "_i" from 1 to _amount do
				{
					player removeMagazine _type;
					D41_Geld = D41_Geld + _price;
					if(_type == "D41_Goldbarren")then{life_D41_Karma = life_D41_Karma - 10;};
				};
				if(_type in _StockListe)then{[[_type, [_amount] call life_fnc_numberText,"2",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
				hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			};
		}forEach _type2;
	};
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[] call life_fnc_virt_update;
disableUserInput false;
D41_IsBuying = 0;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
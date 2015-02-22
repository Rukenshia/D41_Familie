/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_curTarget","_amount"];
//_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_curTarget = _this select 0;
_Type = TypeOf _curTarget;
life_pInact_curTarget = _curTarget;
_amount = ctrlText 2018;

if((isNull _curTarget)) exitWith {hint "No one was selected!";};
if(!(_Type isKindOf "Man")) exitWith {hint "No Person was selected!";};
if(!(isPlayer _curTarget)) exitWith {hint "No Player was selected!";};
if(!(alive _curTarget)) exitWith {hint "Dead Player was selected!";};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";};
if(parseNumber(_amount) > D41_Geld) exitWith {hint "You don't have that much to give!";};
if(player distance _curTarget > 5) exitWith {hint "The selected player is not within range";};
hint format["Du hast %2 %1€ gegeben.",[(parseNumber(_amount))] call life_fnc_numberText,life_pInact_curTarget getVariable["realname",name life_pInact_curTarget]];
D41_Geld = D41_Geld - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_curTarget,_amount,player],"life_fnc_receiveMoney",_curTarget,false] call life_fnc_MP;
[[format["[GIVEMONEY] von: %1, an: %3, Wert: %2€",name player, [(parseNumber(_amount))] call life_fnc_numberText, life_pInact_curTarget getVariable["realname",name life_pInact_curTarget]]], "TON_fnc_logMessage", false] call life_fnc_MP;

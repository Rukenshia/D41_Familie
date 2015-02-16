/*
  File: fn_giveAdminMoney.sqf
  Author: Jan Christophersen

  Description:
  Admin-Rückerstattung
*/
private["_curTarget","_amount"];
//_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_curTarget = _this select 0;
_Type = TypeOf _curTarget;
life_pInact_curTarget = _curTarget;
_amount = ctrlText 5805;

if((isNull _curTarget)) exitWith {hint "Niemanden anvisiert.";};
if(!(_Type isKindOf "Man")) exitWith {hint "Keinen Spieler anvisiert.";};
if(!(isPlayer _curTarget)) exitWith {hint "Keinen Spieler anvisiert.";};
if(!(alive _curTarget)) exitWith {hint "Toten Spieler anvisiert.";};

//A series of checks *ugh*
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Keine richtige Nummer angegeben.";};
if(parseNumber(_amount) <= 0) exitWith {hint "Du kannst kein Minusgeld geben. So etwas existiert nicht.";};
if(player distance _curTarget > 10) exitWith {hint "Der Spieler ist zu weit entfernt.";};
hint format["Du hast %1 %2€ rückerstattet.",life_pInact_curTarget getVariable["realname",name life_pInact_curTarget],[(parseNumber(_amount))] call life_fnc_numberText];
[[_curTarget,_amount,player,ctrlText 5806],"TON_fnc_adminMoney",false,false] call life_fnc_MP;

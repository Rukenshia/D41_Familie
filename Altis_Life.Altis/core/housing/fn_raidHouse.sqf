#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInvData","_houseInvVal"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
if((_house getVariable "D41_CopRaid") != 0)exitWith {hint "Wie wäre es damit: Du öffnest erstmal die Tür, bevor Du an die Kisten gehst?"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Searching";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.001;

while {true} do
{
	uisleep 0.6;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {life_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if(!alive player) exitWith {life_action_inUse = false;};

if((_house getVariable["locked",false])) then
{
	_house setVariable["locked",false,true];
};

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH
for "_i" from 1 to _numberOfDoors do
{
	_house animate[format["door_%1_rot",_i],1];
	_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
};

life_action_inUse = false;

hint "Alle Türen geöffnet und Kisten entsperrt";
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F") && !(_building == zelle01) && !(_building == zelle02)) exitWith {hint "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

if((_building == fed_bank_building) && {side _x == west} count playableUnits < 8) exitWith {hint "Es müssen 8 oder mehr Polizisten Online sein, bevor man die Türen der Staatsbank aufbrechen kann!"};

if((player distance fed_bank_building) < 30) then
{
	[[[0,1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	[[getPlayerUID player,profileName,"30"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
}
else
{
	_getOut = false;
	if(!(_building isKindOf "Land_Medevac_house_V1_F") && !(_building isKindOf "Land_Cargo_House_V3_F") && !(_building isKindOf "Land_Offices_01_V1_F"))then
	{
		_uid = (_building getVariable "house_owner") select 0;
		if(!([_uid] call life_fnc_isUIDActive)) exitWith {_getOut = true;};
	};
	if(_getOut)exitWith{hint localize "STR_House_Break_OwnerOff"};
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
};
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_MilOffices_V1_F": {_cpRate = 0.003;};
	case "Land_Medevac_house_V1_F": {_cpRate = 0.01;};
	case "Land_Cargo_House_V3_F": {_cpRate = 0.0001;};
	default {_cpRate = 0.002;}
};


while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1" && (D41_AnimStop == 0)) then
	{
		[] spawn
		{
			D41_AnimStop = 1;
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] call life_fnc_MP;
			player playMovenow "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 4;
			D41_AnimStop = 0;
		};
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 3) then
{
	player removeMagazine "D41_Bolzenschneider";
	life_boltcutter_uses = 0;
};
_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
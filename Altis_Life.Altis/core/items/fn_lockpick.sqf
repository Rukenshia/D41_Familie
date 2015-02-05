/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {hint "Biste Slenderman? Ich glaube nicht! Beweg dich näher ran!"; player addMagazine "D41_Dietrich";}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {player addMagazine "D41_Dietrich"; hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith { player addMagazine "D41_Dietrich"; };
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith { player addMagazine "D41_Dietrich"; };

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//[[0,format["%1 wurde dabei gesichtet, wie er ein Fahrzeug aufknackt.",profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
[[0,format["%1 wurde dabei gesichtet, wie er ein Fahrzeug aufknackt.",profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;

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
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		life_vehicles pushBack _curTarget;
		[[_curTarget],"life_fnc_carlarm",true,false] call life_fnc_MP;
		[-50,0] call life_fnc_D41_KSys;
		[[getPlayerUID player,profileName,"214"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	} else {
		[[getPlayerUID player,profileName,"215"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		[[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
		[-10,0] call life_fnc_D41_KSys;
		//Remove Lockpick
		player removeMagazine "D41_Dietrich";
	};
};
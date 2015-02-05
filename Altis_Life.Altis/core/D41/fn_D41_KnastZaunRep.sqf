/*
	File: fn_D41_KnastZaunRep.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Jo ähm, befüllen der Karre halt.
*/
private["_action", "_ui","_cP","_progress","_progressBar","_titleText","_pgText"];


_action = [
format["Willst Du den Zaun vom Knast wirklich reparieren?",D41_Geld],"Aufschneiden","Ja","Nein"
] call BIS_fnc_guiMessage;

if(_action) then
{
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable ["life_progress",displayNull];
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_title = "Nutze Gaffatape am Zaun!";
	_titleText ctrlSetText format["Schneide Zaun auf (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

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
		sleep 1.2;
		_cP = _cP + 0.01;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(!alive player) exitWith {D41_Knast = 0;};
		if(_cP >= 1) exitWith{D41_Knast = 1;};
		if(life_interrupted) exitWith {};
	};
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};
	if(D41_Knast == 1) then {D41_KnastZaun setDammage 0; D41_Knast = 0};
};
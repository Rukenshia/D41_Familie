/*
	File: fn_D41_KnastZaun.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Jo ähm, befüllen der Karre halt.
*/
private["_action", "_ui","_cP","_progress","_progressBar","_titleText","_pgText"];

_action = [
format["Willst Du den Zaun vom Knast wirklich aufschneiden",D41_Geld],"Aufschneiden","Ja","Nein"
] call BIS_fnc_guiMessage;

if(_action) then
{
	[[[0,1,2],"Jemand versucht den Zaun des Gefängnisses aufzuschneiden!"],"life_fnc_broadcast",true,false] call life_fnc_MP;
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable ["life_progress",displayNull];
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_title = "Schneide Zaun auf!";
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
		sleep 3;
		_cP = _cP + 0.005;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(!alive player) exitWith {D41_KnastZ = 0;};
		if(_cP >= 1) exitWith{D41_KnastZ = 1;};
		if(life_istazed) exitWith {D41_KnastZ = 0;};
		if(life_interrupted) exitWith {D41_KnastZ = 0;};
		if(player distance D41_KnastZaun > 4) exitWith {D41_KnastZ = 0; hint "Du hast dich zu weit vom Zaun entfernt."};
		if((player getVariable["restrained",false])) exitWith {D41_KnastZ = 0;};
		if(_cp == 0.5) then {[[[0,1,2],"Es ist noch immer jemand dabei, den Zaun des Gefängnisses aufzuschneiden!"],"life_fnc_broadcast",true,false] call life_fnc_MP;};
	};
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {D41_KnastZ = 0; life_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};
	if(D41_KnastZ == 1) then {D41_KnastZ = 0; D41_KnastZaun setDammage 1;}
};
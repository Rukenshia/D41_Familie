/*
	File: fn_unrestrain.sqf
*/
private["_unit","_groupName","_title","_ui","_progressBar","_titleText","_cP","_cpRate","_D41_HC_Chance2"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if((player getVariable["restrained",TRUE])) exitWith {hint "Mit gefesselten Händen willst Du jemanden entfesseln? Ich glaube nicht! Du bist nicht Tim der Zauberer!"};

if(side player == civilian && !("D41_Dietrich" in (magazines Player))) exitWith {hint "Du hast keine Dietriche um die Handschellen zu öffnen!";};

if (side player == civilian) then
	{
		life_action_inUse = true;
		
		[-10,0] call life_fnc_D41_KSys;
		
		//Setup the progress bar
		disableSerialization;
		_title = "Handschellen aufknacken";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;
		_cpRate = 0.02;

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
			uisleep 0.6;
			if(isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
			};
			_cP = _cP + _cpRate;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(!alive player) exitWith {life_action_inUse = false;};
		if(life_interrupted) exitWith {};
		life_action_inUse = false;
		player removeMagazine "D41_Dietrich";
	};

if(life_interrupted) exitWith {life_interrupted = false; titleText["Aufknacken abgebrochen","PLAIN"]; life_action_inUse = false;};

D41_HC_Chance = FALSE;
if (side player == civilian) then
	{
		D41_HC_Chance = TRUE;
		D41_HC_Chance2 = random(100);
		if(D41_HC_Chance2 > 50) exitWith {D41_HC_Chance = FALSE;};
	};

if(D41_HC_Chance) exitWith {hint "Der Dietrich ist abgebrochen!";};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
player say3D "cuff"; 

life_maskiert = 0;
if ((goggles player) in D41_goggles_Array) then {life_maskiert = 1};
if ((uniform player) in D41_uniform_Array) then {life_maskiert = 1};
if ((headgear player) in D41_headgear_Array) then {life_maskiert = 1};
if ((hmd player) in D41_hmd_Array) then {life_maskiert = 1};

if (life_maskiert > 0) then
	{
		[[0,format["%1 wurde von %2 entfesselt",_unit getVariable["realname", name _unit], "einer Maskierten Person"]],"life_fnc_broadcast",_unit,false] call life_fnc_MP;
		[-25,0] call life_fnc_D41_KSys;
	}
		else
	{
		[[0,format["%1 wurde von %2 entfesselt",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",_unit,FALSE] call life_fnc_MP;
		[-25,0] call life_fnc_D41_KSys;
	};
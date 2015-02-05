/*
	File: fn_gatherCocaine.sqf
	Author: Distrikt41 - Dscha
	Description:
	Gathers Kokapflanzen and reports it to DB?
*/
private["_sum","_LvL","_rndm","_count","_time","_Lcap","_type","_skill","_skillNeeded","_skillAdd","_hType","_GatherText","_GatheredText","_fnc_gather","_Karma"];

_type = "D41_KokainRoh";
_skill = life_skillCocaine;
_skillNeeded = life_skillCannabis;
_skillAdd = {life_skillCocaine = life_skillCocaine + 1};
_hType = "Kokapflanzen"; //für TitleText
_Werkzeug = "D41_Gartenschere";
_CheckWerkzeug = (_Werkzeug in (assignedItems player));
_GatherText = {titleText[format["Ernte %1.", _hType],"PLAIN"];}; //gather gestartet
_GatheredText = {titleText[format["Du hast %1 %2 abgeerntet.",_rndm, _hType],"PLAIN"];}; //gather beendet
_fnc_gather = {if(player canAdd _type) then {life_action_gather = true; call _GatherText; player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"; sleep _time; if(alive player)then{call _skillAdd; call _GatheredText; for "_i" from 1 to _rndm do{player addMagazine _type; }; [_Karma,0] call life_fnc_D41_KSys; }; }else{hint localize "STR_NOTF_InvFull"; }; };
if(_skillNeeded < 249) exitWith {hint format ["Um Kokain abbauen zu können, wird Cannabis auf Skillstufe 3 UND eine Gartenschere benötigt (derzeit: %1/250)", _skillNeeded];};

switch(true) do
{
	//Level 6
	case (_skill > 1249 && _CheckWerkzeug):					{_Karma = -4;	_LvL = 6; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 9.5;	_Lcap = "MAX";	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Max Level erreicht!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 1249 && _CheckWerkzeug): 				{_Karma = -4;_LvL = 6; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 9.5;	_Lcap = "MAX";	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>LEVEL UP!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	//Level 5
	case (_skill > 849 && _skill < 1249 && _CheckWerkzeug):	{_Karma = -3;	_LvL = 5; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 10.5;	_Lcap = 1250;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5", _LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 849 && _CheckWerkzeug):					{_Karma = -3;	_LvL = 5; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 10.5;	_Lcap = 1250;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>LEVEL UP!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	//Level 4
	case (_skill > 499 && _skill < 849 && _CheckWerkzeug):	{_Karma = -3;	_LvL = 4; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 11.5;	_Lcap = 850;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5", _LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 499 && _CheckWerkzeug):					{_Karma = -3;	_LvL = 4; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 11.5;	_Lcap = 850;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>LEVEL UP!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	//Level 3
	case (_skill > 249 && _skill < 499 && _CheckWerkzeug):	{_Karma = -2;	_LvL = 3; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 12.5;	_Lcap = 500;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5", _LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 249 && _CheckWerkzeug):					{_Karma = -2;	_LvL = 3; _rndm = [3,4] call BIS_fnc_selectRandom;	_count = "3-4"; _time = 12.5;	_Lcap = 500;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>LEVEL UP!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	//Level 2
	case (_skill > 49 && _skill < 249 && _CheckWerkzeug):	{_Karma = -1;	_LvL = 2; _rndm = [2,3] call BIS_fnc_selectRandom;	_count = "2-3"; _time = 12.5;	_Lcap = 250;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5", _LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 49 && _CheckWerkzeug):					{_Karma = -1;	_LvL = 2; _rndm = [2,3] call BIS_fnc_selectRandom;	_count = "2-3"; _time = 12.5;	_Lcap = 250;	call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>LEVEL UP!<br/>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5",_LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	//Level1
	case (_skill < 49 && _CheckWerkzeug):					{_Karma = -1;	_LvL = 1; _rndm = [1,2] call BIS_fnc_selectRandom;	_count = "1-2"; _time = 12.5;	_Lcap = 50;		call _fnc_gather; [ format ["<t color='#ff0000'><t size='1'>Skillstufe %1</t></t><br/> (%2/%3s): %4/%5", _LvL, _count, _time, _skill+1, _Lcap], SzoneXW, SzoneYH, 6, 1 ] spawn BIS_fnc_dynamicText;};
	default {hint format ["Um Kokain abbauen zu können, wird Cannabis auf Skillstufe 3 UND eine Gartenschere benötigt (derzeit: %1/250)", _skillNeeded];};
};

life_action_gather = false;
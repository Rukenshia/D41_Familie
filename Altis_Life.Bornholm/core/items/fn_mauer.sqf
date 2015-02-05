/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_mauer"];
_mauer = "Land_LandMark_F" createVehicle [0,0,0];
_mauer attachTo[player,[0,3.5,0.2]];
_mauer setDir 90;
_mauer setVariable["item","mauerDeployed",true];

life_action_mauerDeploy =
player addAction["<t color='#00FF00'>Mauer aufstellen</t>",{if(!isNull life_mauer) then {detach life_mauer; life_mauer = ObjNull;};
player removeAction life_action_mauerDeploy; life_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull life_mauer'];

life_mauer = _mauer;
waitUntil {isNull life_mauer};
if(!isNil "life_action_mauerDeploy") then {player removeAction life_action_mauerDeploy;};
if(isNull _mauer) exitWith {life_mauer = ObjNull;};
player removeMagazine "D41_Mauer";
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
_mauer allowDamage false;


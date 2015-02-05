//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_wilhelm.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ja.
//::::::::::::  ::::::::::::\\
private["_Target"];
_Target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(!alive _Target) exitWith {};
if(isNull _Target) exitWith {};
_Target say3D "D41_Wilhelm";
if(_Target == player)then{hint localize "STR_D41_FingerAb"; player setDamage ((damage player)+0.05);};
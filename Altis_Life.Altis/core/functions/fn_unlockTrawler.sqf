/*
	File: fn_unlockTrawler.sqf
	Author: Bryan "Tonic" Boardwine
	EDIT by: Distrikt41 - Dscha
	Description:
	modified unlocking for Trawler
*/
_veh = cursorTarget;
if(_veh isKindOf "D41_Trawler") then
{
	_locked = locked _veh;
	if(player getVariable "restrained") exitWith {hint "Mit gefesselten Händen willst Du die Tür auf machen? Ich glaube nicht! Du bist nicht Tim der Zauberer!"};
	if(_veh in life_vehicles && player distance _veh < 25 OR vehicle player == _veh) then
	{
		if(_locked == 2) then
		{
			if(local _veh) then
			{
				_veh lock 0;
			}
			else
			{
				[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
			};
			systemChat "Fahrzeug aufgeschlossen.";
			[[_veh],"life_fnc_UnLockCarSound",true,false] call life_fnc_MP;
		}
		else
		{
			if(local _veh) then
			{
				_veh lock 2;
			}
			else
			{
				[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
			};
		systemChat "Fahrzeug abgeschlossen.";
		[[_veh],"life_fnc_LockCarSound",true,false] call life_fnc_MP;
		};
	};
};
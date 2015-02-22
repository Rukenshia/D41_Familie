/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query = format["SELECT pid, pos, containers, id FROM houses WHERE pid='%1' AND owned='1'",_this];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

if(count _houses == 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	diag_log format["[HOUSECLEANUP] -- HOUSE_ID: %1, containers: %2", _x select 3, _x select 2];

	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} foreach _houses;

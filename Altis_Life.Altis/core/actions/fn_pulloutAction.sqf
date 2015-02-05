/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;
//if((cursorTarget getVariable ["locked",true])) exitWith {hint "Das Fahrzeug ist verschlossen! Willst Du ihn wirklich durch die Scheibe ziehen? Denk mal an die Konseku... Konsequn... Konsqe... FOLGEN!"};

{
	if(side _x != west) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVeh",_x,false] call life_fnc_MP;
	};
} foreach _crew;
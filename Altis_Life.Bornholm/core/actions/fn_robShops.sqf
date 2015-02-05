/*
file: fn_robShops.sqf
Author: MrKraken
Description:
Executes the rob shob action!
Modified by: KrisSerbia

*/
private["_robber","_shop","_timer","_funds","_dist","_success","_pos","_robberyreward"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_timer = 600;
_funds = 5000 + round(random 5000);
_dist = _robber distance _shop;
_success = false;
_pos = GetPos player;

if ({side _x == west} count playableUnits < 2) exitWith {hint "Es müssen mindestens 2 Cops online sein."};
if (vehicle player != _robber) exitWith { hint "Du musst aus deinem Fahrzeug aussteigen!";};
if (side _robber != Civilian) exitWith { hint "Sie sind ein Polizeibeamter! Verziehen Sie sich bevor ich mich bei ihren Vorgesetzten beschweren werde!";};
if (alive _robber && {currentWeapon _robber == ""}) exitWith { hint "Du willst mich ohne Waffe ausrauben, dein Ernst? Du siehst die Tür? Nutze sie!";};
if (alive _robber && side _robber == Civilian && {currentWeapon _robber != ""} && {_funds > 0}) then
{
	hint format ["Du raubst die Tankstelle aus! Warte %1 sec.",_timer];
	[[2,"Eine Tankstelle wird ausgeraubt!"],"life_fnc_broadcast",nil,false] call life_fnc_MP;
	_shop switchMove "AmovPercMstpSsurWnonDnon";
	_shop removeAction _action;


		_Pos = position player;
					_marker = createMarker ["Marker200", _Pos];
					"Marker200" setMarkerColor "ColorRed";
					"Marker200" setMarkerText "ACHTUNG, Überfall!";
					"Marker200" setMarkerType "mil_warning";

	while {true} do
	{
		hintsilent format ["%1 Sekunden verbleibend. Bleib innerhalb 5m des Besitzers!",_timer];
		sleep 1;
		_timer = _timer - 1;
		_dist = _robber distance _shop;
		
		if (!alive _robber) exitwith
		{
			hint "Hier spricht die Stimme aus dem Jenseits! Du bist tot! (P.S. Dein Überfall ist somit fehlgeschlagen! Toll, ne?";
			deleteMarker "Marker200";
			_shop switchMove "";
			_action = _shop addAction["Tankstelle ausrauben",life_fnc_robShops];
		};
		
		if (_dist >= 6) exitwith
		{
			hint "Da der Tankstellenbesitzer blind wie ein Maulwurf ist, hat er Dich nicht mehr gesehen und gedacht es wäre vorbei, hat alles verschlossen. Somit mußt Du wieder von vorne anfangen! (Bleibe innerhalb von 5m zum Verkäufer)";
			deleteMarker "Marker200";
			_shop switchMove "";
			_action = _shop addAction["Tankstelle ausrauben",life_fnc_robShops];
		};
		
		if(life_istazed) exitwith
		{
			hint "Überfall fehlgeschlagen, du wurdest getazert. *bizzelbizzel*";
			deleteMarker "Marker200";
			_shop switchMove "";
			_action = _shop addAction["Tankstelle ausrauben",life_fnc_robShops];
		};
		
		if(_timer < 1) exitWith { _success = true;};
	};
	
	if(!_success) exitWith {};
	D41_Geld = D41_Geld + _funds;
	hint format["Du hast €%1 gestohlen",_funds];
	deleteMarker "Marker200";
	[[getPlayerUID _robber,name _robber,"212"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	[-30,0] call life_fnc_D41_KSys;

	_shop switchMove "";
	_funds = 0;
	sleep 800;//Cooldown between the robberies
	_action = _shop addAction["Tankstelle ausrauben",life_fnc_robShops];
	[] call life_fnc_hudUpdate;
};
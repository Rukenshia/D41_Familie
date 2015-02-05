/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		if(D41_HC_Timer == 0) then {_time = time; D41_HC_Timer = 1;};
		if(!(player getVariable["restrained",false])) exitWith {D41_HC_Timer = 0;};
		if((player getVariable ["escorting",TRUE])) then {D41_HC_Timer = 0;};
		if((time - _time) > (5 * 60)) then
			{
				if(!(player getVariable["restrained",FALSE])) exitWith {D41_HC_Timer = 0;};
				
				if (side player == civilian) then
				{
					if(!([west,getPos player,30] call life_fnc_nearUnits) && !([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						D41_HC_Timer = 0;
						titleText["Du wurdest Automatisch befreit, da Du die maximale Zeit erreicht hast, ohne das direkte Interaktion mit Dir betrieben wurde.","PLAIN"];
					};
				};
				
				if (side player == west) then
				{
					if(!([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						D41_HC_Timer = 0;
						titleText["Du wurdest Automatisch befreit, da Du die maximale Zeit erreicht hast, ohne das direkte Interaktion mit Dir betrieben wurde.","PLAIN"];
					};
				};
				D41_HC_Timer = 0;
			};
		uisleep 30;
	};
};

titleText[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]],"PLAIN"];
				
while {player getVariable "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};
	
	if(!alive _cop) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};
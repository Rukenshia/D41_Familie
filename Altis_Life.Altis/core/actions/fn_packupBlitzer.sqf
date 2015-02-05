/*
    File: fn_packupBlitzer.sqf
    Author: Distrikt41 - Dscha

    Description:
    Blitzer wieder aufsammeln.
*/
private["_Blitzer"];
_Blitzer = nearestObjects[getPos player,["Land_Blitzer"],3] select 0;
if(isNil "_Blitzer") exitWith {};

if(player canAdd "D41_Blitzer") then
{
	player addMagazine "D41_Blitzer";
	_Blitzer setVariable ["D41_Blitzer", false, true];
    titleText["Du hast den Blitzer eingesammelt.","PLAIN"];
    life_action_BlitzerPackup = nil;
	sleep 0.5;
    deleteVehicle _Blitzer;
	D41_BlitzerCounter = 0;
}
else
{
	hint "So klein und doch so schwer (Ja, damit meine ich Dich!). Leg erst etwas anderes ab, bevor Du den aufsammeln willst\n\nInventar voll.";
};
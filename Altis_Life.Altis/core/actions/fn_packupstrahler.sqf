/*
    File: fn_packupstrahler.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Strahler abbauen
*/
private["_strahler"];
_strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],3] select 0;
if(isNil "_strahler") exitWith {};

if(player canAdd "D41_Strahler") then
{
	player addMagazine "D41_Strahler";
    titleText["Du hast den Mobilen Strahler abgebaut und eingesammelt.","PLAIN"];
    life_action_strahlerPickup = nil;
    deleteVehicle _strahler;
}
else
{
	hint "Zu schwer! Also... DU, näh?! Leg vorher etwas ab!\n\nInventar voll.";
};
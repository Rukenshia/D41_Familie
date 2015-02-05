/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["Land_LandMark_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(player canAdd "D41_Mauer") then
{
	player addMagazine "D41_Mauer";
    titleText["Du hast die Begrenzung abgebaut.","PLAIN"];
    life_action_mauerPackup = nil;
    deleteVehicle _mauer;
}
else
{
	hint "Es hatte niemand die Absicht eine Mauer zu errichten! Doch diese hier bleibt (jedenfalls solange, bis Du etwas anderes vorher abgelegt hast!)!\n\nInventar voll.";
};
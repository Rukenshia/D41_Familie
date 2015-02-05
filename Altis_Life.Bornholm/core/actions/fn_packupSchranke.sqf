/*
    File: fn_packupSchranke.sqf
    Author: Distrikt41 - Dscha

    Description:
    Packs up a deployed wall.
*/
private["_Schranke"];
_Schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_Schranke") exitWith {};

if(player canAdd "D41_Schranke") then
{
	player addMagazine "D41_Schranke";
    titleText["Du hast die Schranke eingesammelt.","PLAIN"];
    life_action_SchrankePackup = nil;
    deleteVehicle _Schranke;
}
else
{
	hint "Schlagbaum bleibt unten! Keine Kraft mehr in den dünnen Ärmchen? ooohhhhh! Armes bubu!\n\nInventar voll.";
};
/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_spikes") exitWith {};

if(player canAdd "D41_Nagelband") then
{
	player addMagazine "D41_Nagelband";
	titleText[localize "STR_NOTF_SpikeStrip","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
}
else
{
	hint "Mach mehr Sport, Fetti! Du kannst das gerade nicht aufnehmen!\n\nInventar voll.";
};
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

removeAllContainers player;
removeAllWeapons player;
removeGoggles player;
removeHeadGear player;
removeBackpack player;

player forceAddUniform "D41_medic_man_uniform";
player addBackpack "B_MedicBergen_sgg";

player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "D41_Dietrich";
player addItem "D41_Dietrich";
player addItem "D41_Dietrich";
player addItem "D41_Dietrich";
player addItem "D41_Dietrich";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "NVGoggles";
player assignItem "NVGoggles";

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[3] call SOCK_fnc_updatePartial;
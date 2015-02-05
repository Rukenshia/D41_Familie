/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "D41_police_man_uniform";
player addHeadgear "H_Cap_blk";
player addVest "D41_police_vest";

player addWeapon "RH_mk2";
player addMagazine "RH_10Rnd_22LR_mk2";
player addMagazine "RH_10Rnd_22LR_mk2";
player addMagazine "RH_10Rnd_22LR_mk2";


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

[] call life_fnc_saveGear;
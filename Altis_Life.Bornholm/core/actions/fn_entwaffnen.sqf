/*
	Author: MrKraken
	filename: fn_entwaffnen.sqf
	Description: Entwaffnet Spieler!
	Edited by Distrik 41 - Dscha fürs entwaffnen
*/
_holder = "GroundWeaponHolder" createVehicle position player;
hint "Du wirst gerade entwaffnet!!";

if(primaryWeapon player != "") then {
	player action [
		"DropWeapon",
		_holder,
		primaryWeapon player
	];
	sleep 0.2;
};

if(handgunWeapon player != "") then {	
	player action [
		"DropWeapon",
		_holder,
		handgunWeapon player
	];
	sleep 0.2;
};

if(secondaryWeapon player != "") then {	
	player action [
		"DropWeapon",
		_holder,
		secondaryWeapon player
	];
};
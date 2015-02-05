//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/PVPAreaMissions.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Erzeugt innerhalb des PVP Gebietes an einer Random Position eine Kiste inkl. Inhalt (Beschäftigungstherapie)
//::::::::::::  ::::::::::::\\
private["_D41_fnc_D41_AddMissonBoxCargo","_CreateMission","_MissionBox","_MarkerPos","_marker","_return"];

_CreateMission =
{
	_return = [];
	//Create Items / Inhalt erzeugen
	_D41_fnc_D41_AddMissonBoxCargo =
	{
		_Rndm = round(random 100);
		switch(true)do
		{
			// ~ nix
			case (_Rndm >= 0 && _Rndm < 10)	:	{_return = ["D41_Hasenfleisch",20,"D41_Apfelschnaps",20];};
			// ~ nüx
			case (_Rndm >= 10 && _Rndm < 20):	{_return = ["D41_Hasenfleisch",20,"D41_Apfelsaft",20];};
			// ~ auch wenig
			case (_Rndm >= 20 && _Rndm < 30):	{_return = ["D41_BeefJerky",20,"D41_EnergyDrink",20];};
			// ~ verarscht!
			case (_Rndm >= 30 && _Rndm < 40):	{_return = ["D41_Donuts",1,"D41_Kaffee",1];};
			// ~ Net viel wert, aber nützlich!
			case (_Rndm >= 40 && _Rndm < 50):	{_return = ["D41_Nagelband",2];};
			// ~ Net viel wert, aber nützlich!
			case (_Rndm >= 50 && _Rndm < 60):	{_return = ["D41_Mauer",2];};
			// Desert Eagle Modern - In keinem Shop verfügbar
			case (_Rndm >= 60 && _Rndm < 70):	{_return = ["RH_7Rnd_50_AE",4,"RH_Deaglem"];};
			//~ 99.000
			case (_Rndm >= 70 && _Rndm < 80):	{_return = ["D41_Kokain",125];};
			// ~ 120.000
			case (_Rndm >= 80 && _Rndm < 90):	{_return = ["D41_Diamanten",60];};
			// ~ unbezahlbar! Da in keinem Shop verfügbar.
			case (_Rndm >= 90 && _Rndm < 95):	{_return = ["hlc_20rnd_762x51_b_fal",5,"hlc_rifle_STG58F"];};
			// ~200.000
			case (_Rndm >= 95)				:	{_return = ["D41_GoldBarren",20];};
		};
	};
	
	//Mission Box erstellen
	_MissionBox = createVehicle ["Box_NATO_WpsSpecial_F", getMarkerPos "pvpgebiet", ["pvpgebiet"], 2000, "NONE"]; //Große Box
	_MissionBox allowDamage false;
	clearWeaponCargoGlobal _MissionBox;
	clearMagazineCargoGlobal _MissionBox;
	clearItemCargoGlobal _MissionBox;
	clearBackpackCargoGlobal _MissionBox;
	_MarkerPos = createVehicle ["GroundWeaponHolder", getPos _MissionBox, [], 200, "NONE"];
	_marker = createMarker ["TreasureZone", (getPos _MarkerPos) ];
	"TreasureZone" setMarkerColor "ColorBlack";
	"TreasureZone" setMarkerSize [200, 200];
	"TreasureZone" setMarkerText "Treasure Zone";
	"TreasureZone" setMarkerShape "ELLIPSE";
	
	//Missonbox füllen
	[] call _D41_fnc_D41_AddMissonBoxCargo;
	diag_log format [":::::::::::: MISSION BOX INHALT: %1", _return];
	if(count(_return) == 2)then{ _MissionBox addMagazineCargoGlobal [(_return select 0),(_return select 1)]; };
	if(count(_return) == 3)then{ _MissionBox addMagazineCargoGlobal [(_return select 0),(_return select 1)]; _MissionBox addWeaponCargoGlobal [(_return select 2), 1]; };
	if(count(_return) == 4)then{ _MissionBox addMagazineCargoGlobal [(_return select 0),(_return select 1)]; _MissionBox addMagazineCargoGlobal [(_return select 2),(_return select 3)]; };
	deleteVehicle _MarkerPos;
	
	//Missionbox löschen
	sleep 2700;
	deleteMarker "TreasureZone";
	deleteVehicle _MissionBox;
};

while{true}do
{
	[] spawn _CreateMission;
	sleep 3600;
};
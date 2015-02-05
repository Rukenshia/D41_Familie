#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = getControl(2400,2407);
lbClear _list2; //Purge the list

_crimes = [["Fahren ohne Führerschein","1500","1"],["Fahren unter Alkohol oder Drogeneinfluss","2000","2"],["Fahren ohne Unfallkit","500","7"],["Fahren ohne Licht","350","4"],["Geschwindigkeitsüberschreitung","1000","5"],["Falsch Parken","500","11"],["Fahrlässiges Fahren","2500","6"],["Drogentransport","30000","482"],["Flucht vor der Polizei","7500","12"],["Fahrerflucht","3500","480"],["Beamtenbeleidigung","1000","17"],["Belästigung eines Polizeibeamten","2000","18"],["Illegale Schusswaffen","7500","26"],["Schusswaffen ohne Lizenz","7500","24"],["Tragen von Schusswaffen in Städten","4000","25"],["Ruhestörung","1000","33"],["Widerstand gegen die Staatsgewalt","10000","15"],["Eindringen in eine Sperrzone","5000","19"],["Beihilfe","5000","3"],["Beschuss auf Polizei/Beamte/Immobilien","15000","21"],["Zerstörung von Staatseigentum","15000","22"],["Angriff auf Personen / Fahrzeuge","15000","29"],["Misshandlung","15000","261"],["Versuchte Misshandlung","7500","261A"],["Fahren illegaler Fahrzeuge","5000","10"],["Geiselnahme","3500","28"],["Illegale Straßensperre","10000","14"],["Terrorismus/Aufstand","100000","32"],["Fliegen ohne Pilotenschein","5000","35"],["Landen in einer Flugverbotszone","5000","9"]];

{
	_list2 lbAdd format["%1 - $%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP; 
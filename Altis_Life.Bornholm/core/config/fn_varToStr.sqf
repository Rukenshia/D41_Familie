/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_med_adac": {"ADAC Servicemitarbeiter"};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_cop_swat": {"Lizenz: SWAT Mitglied"};
	//D41Lizenzen
	case "license_civ_bjerky": {"Skill: Rohes Fleisch verarbeiten"};
	case "license_civ_coal": {"Skill: Kohle verarbeiten"};
	case "license_civ_hunt": {"Lizenz: Jagdlizenz"};
	case "license_civ_Bruchstein": {"Skill: Bruchstein verarbeiten"};
	case "license_civ_Schnaps": {"Skill: Schnaps brennen"};
	case "license_civ_Saft": {"Skill: Saft pressen"};
	case "license_civ_Zement": {"Skill: Zement mischen"};
	case "license_civ_Stahl": {"Skill: Stahl schmieden"};
	case "license_civ_Krabben": {"Lizenz: Krabbenfischen"};
	case "license_civ_WKompL": {"Skill: Waffenkomponenten herstellen"};
	case "license_civ_FahrzeugT": {"Skill: Fahrzeugteile herstellen"};
	case "license_civ_Kerosin": {"Skill: Kerosin raffinieren"};
	case "license_civ_Ton": {"Skill: Ton brennen"};
	//D41Gruppen
	case "license_civ_gangdmw": {"Gangmitglied: DMW"};
	case "license_civ_gangrr": {"Gangmitglied: Rebellen Rebellieren"};
	case "license_civ_gangpow": {"Gangmitglied: PowMia"};
	case "license_civ_ganglast": {"Gangmitglied: LAST"};
	case "license_cop_gangfirma": {"Gangmitglied: Die Firma"};
};

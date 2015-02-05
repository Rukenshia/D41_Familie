/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_sandZones","_diamondZones","_ironZones","_leadZones","_rockZones","_saltZones","_oilZones","_meatZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4","apple_5"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_sandZones = ["sand_1","sand_2"];
_diamondZones = ["diamond_1a"];
_ironZones = ["iron_1"];
_leadZones = ["lead_1a","lead_2"];
_rockZones = ["rock_1","rock_2","rock_3"];
_saltZones = ["salt_1"];
_oilZones = ["oil_1a","oil_2a"];
_meatZones = ["meat_1"];
_coalZones = ["coal_1"];

//Erstellt Fleisch"farm"gebiet
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coal = player addAction['Kohle abbauen',life_fnc_gatherCoal,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Coal;"];
} foreach _coalZones;

//Erstellt Fleisch"farm"gebiet
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Meat = player addAction['Schafe schlachten',life_fnc_gatherMeat,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Meat;"];
} foreach _meatZones;

//Create Öl zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Oil = player addAction['Öl fördern',life_fnc_gatherOil,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Oil;"];
} foreach _oilZones;


//Create Salz zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Salt = player addAction['Salz abbauen',life_fnc_gatherSalt,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Salt;"];
} foreach _saltZones;

//Create Steine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Rock = player addAction['Steine abbauen',life_fnc_gatherRock,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Rock;"];
} foreach _rockZones;

//Create Kupfererz zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Lead = player addAction['Kupfererz abbauen',life_fnc_gatherLead,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Lead;"];
} foreach _leadZones;

//Create Eisenerz zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Iron = player addAction['Eisenerz abbauen',life_fnc_gatherIron,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Iron;"];
} foreach _ironZones;

//Create Diamanten zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Diamond = player addAction['nach Diamanten schürfen',life_fnc_gatherDiamond,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Diamond;"];
} foreach _diamondZones;

//Create Sand zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Sand = player addAction['Sand schaufeln',life_fnc_gatherSand,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Sand;"];
} foreach _sandZones;

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Äpfel pflücken',life_fnc_gatherApples,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Pfirsiche pflücken',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Schlafmohn abernten',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Cannabis abernten',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Kokapflanzen abernten',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;
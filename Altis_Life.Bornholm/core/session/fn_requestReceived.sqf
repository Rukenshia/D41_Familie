#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2",life_adminlevel,life_coplevel]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Parse basic player information.
D41_Geld = parseNumber (_this select 2);
D41_atmGeld = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8;
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		life_blacklisted = _this select 9;
		__CONST__(life_medicLevel,0);
	};

	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _this select 10;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		D41_DiedTimer = parseNumber (_this select 13);
		[] spawn life_fnc_initHouses;
		life_D41_Karma = parseNumber (_this select 14);
		life_skillApple = parseNumber (_this select 15);
		life_skillPeach = parseNumber (_this select 16);
		life_skillEhemalsRock = parseNumber (_this select 17);
		life_skillSalt = parseNumber (_this select 18);
		life_skillSand = parseNumber (_this select 19);
		life_skillIronore = parseNumber (_this select 20);
		life_skillCopperore = parseNumber (_this select 21);
		life_skillDiamond = parseNumber (_this select 22);
		life_skillCannabis = parseNumber (_this select 23);
		life_skillCocaine = parseNumber (_this select 24);
		life_skillHeroinu = parseNumber (_this select 25);
		life_skillOilu = parseNumber (_this select 26);
		life_skillRawmeat = parseNumber (_this select 27);
		life_skillcoalu = parseNumber (_this select 28);
		life_skillBruchstein = parseNumber (_this select 29);
		life_skillTon = parseNumber (_this select 30);
		life_skillKrabben = parseNumber (_this select 31);
		life_skillFischen = parseNumber (_this select 32);
	};

	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
	};
};

if(count (_this select 12) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;

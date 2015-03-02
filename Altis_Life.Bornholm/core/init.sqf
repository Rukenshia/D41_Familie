#include <macro.h>
/*
	Master client initialization file
*/

D41_Nebel = [0,0,0];
D41_Regen = 0;
D41_Wellen = 1;
D41_Vorschau = 0.5;
D41_Wind = [1, 1, true];

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
//Setup initial client core functions
diag_log "::Life Client:: Initialization Skillsystem";
call compile PreprocessFileLineNumbers "core\D41\D41_sys.sqf";
diag_log "::Life Client:: Skillsystem initialized";
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] call life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	D41_atmGeld = D41_atmGeld + _price;
";

[] execVM "core\init_survival.sqf";
//[] call life_fnc_setupActions;
[] spawn life_fnc_fatigueReset;

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));
//D41 Fast Rope
[] execVM "core\functions\fn_ComDis.sqf";
[] execVM "scripts\fastrope.sqf";
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

life_teleporting = false;
[] spawn {
	sleep 20.0;
	[] spawn {
		private["_lastpos", "_distance", "_maxdistance", "_type"];
		_lastpos = position player;
		while {true} do {
			if (life_teleporting) then {
				life_teleporting = false;
				sleep 10.0;
			}
			else {
				_distance = player distance _lastpos;
				_maxdistance = 700.0;
				_type = "Unbekannt";

				if (vehicle player != player) then {
					if (vehicle player isKindOf "Car") then {
						_maxdistance = 900.0;
						_type = "Auto";
					};
					if (vehicle player isKindOf "Air") then {
						_maxdistance = 1000.0;
						_type = "Luft";
					};
				}
				else {
					_type = "Zu Fuß";
					_maxdistance = 100.0;
				};

				if (_distance > _maxdistance) then {
					["SPEED", "Speedhack", format ["Distanz: %1m, Bewegungsart: %2", _distance, _type]] call life_fnc_suspectPlayer;
				};
				_lastpos = position player;
				sleep 10.0;
			};
		};
	};
};

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution
			_handled = true;
		};
	};

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then
		{
			[] spawn
			{
				_handle = [] spawn life_fnc_actionKeyHandler;
				private["_handle"];
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
			[cursorTarget] joinSilent (createGroup civilian);
			hint "Du hast jemanden festgenommen!";
		};
	};

	//Shift+O Zipties ( Civilians can restrain )
	case 24:
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if(side player == civilian && !("D41_Kabelbinder" in (magazines player))) exitWith {hint "Du hast keine Kabelbinder!"};
			if(side player != civilian)exitWith {};
			if(cursorTarget getVariable "D41_geknueppelt")then
			{
				[] call life_fnc_restrainAction;
				if(side cursorTarget in [civilian]) then {[cursorTarget] joinSilent (createGroup civilian);};
			};
		};
	};

	//Shift + G -- Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then
		{
			_handled = true;
		};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//L Key?
	case 38:
	{
		if(playerSide in [west]) then
		{
			if(!_alt && !_ctrlKey) then
			{
				[] call life_fnc_radar;
			};
		};
	};

	//CustomMenu
	//Taste Z
	case 21:
	{
		if(player getVariable "restrained" && player getVariable "D41_geknueppelt" && player getVariable "surrender") exitWith {hint "Du hast Deine Hände nicht frei!"};
		[cursorTarget] call life_fnc_combat; [] call life_fnc_hudUpdate;
	};

	//F Key
	case 33:
	{
		if(playerSide in [civilian] && vehicle player isKindOf "D41_Trawler" && (driver vehicle player == player)) then
		{
			[] spawn
			{
				if(D41_TrawlerHorn) exitWith {};
				D41_TrawlerHorn = true;
				_veh = vehicle player;
				[[_veh],"life_fnc_D41_trawler_horn",nil,true] call life_fnc_MP;
				sleep 15;
				D41_TrawlerHorn = false;
			};
		};
	};

	//Taste 1
	case 2:
	{
		//If cop run checks for turning lights on.
		if(playerSide in [west,independent]) then
		{
			_veh = vehicle player;
			if(_veh != player && (typeOf vehicle player) in ["Offroad_Pol","D41_Offroad_Medic","BMW_X6M_Pol","Offroad_SWAT","D41_swat_hunter","D41_Lada_Civ_05"]) then
			{
				if(!isNil {_veh getVariable "lights"}) then
				{
					if(playerSide == west) then
					{
						titleText ["Leuchtwerk Ein/Aus","PLAIN"];
						[_veh] call life_fnc_sirenLights;
					}
				else
					{
						titleText ["Leuchtwerk Aus","PLAIN"];
						[_veh] call life_fnc_sirenLights;
					};
				_handled = true;
				};
			};
		};
	};

	//Taste 2
	case 3:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirene Aus","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirene An","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] call life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] call life_fnc_MP;
				};
			};
		};
	};

	// surrender shift + num 0
	case 82:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};

	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player == player) then
			{
				_veh = cursorTarget;
			}
			else
			{
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then
			{
				if(_veh in life_vehicles && player distance _veh < 15 ) then
				{
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					}
					else
					{
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			}
			else
			{
				_locked = locked _veh;
				if(player getVariable "restrained") exitWith {hint "Mit gefesselten Händen willst Du die Tür auf machen? Ich glaube nicht! Du bist nicht Tim der Zauberer!"};
				if(_veh in life_vehicles && player distance _veh < 8 OR vehicle player == _veh) then
				{
					if(_locked == 2) then
					{
						if(local _veh) then
						{
							_veh lock 0;
						}
						else
						{
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
						[[_veh],"life_fnc_UnLockCarSound",true,false] call life_fnc_MP;
					}
					else
					{
						if(local _veh) then
						{
							_veh lock 2;
						}
						else
						{
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehLock";
						[[_veh],"life_fnc_LockCarSound",true,false] call life_fnc_MP;
					};
				};
			};
		};
	};
};

_handled;

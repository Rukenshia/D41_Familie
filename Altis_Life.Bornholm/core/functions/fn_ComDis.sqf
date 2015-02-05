//::::::::::::  ::::::::::::\\
//	Filename: core/functions/fn_ComDis.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ersetzt Funktionalität von #1 Circumflex (Command Menu) zum Alternativen Menü und Entfernt #2 NumPad Entf (Commander View)
//::::::::::::  ::::::::::::\\

//#1
[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","if
				(
					((_this select 1) in actionKeys 'ForceCommandingMode')
				)
				then
				{
					true;
					if(player getVariable 'restrained') exitWith {hint 'Du hast Deine Hände nicht frei!'};
					if(player getVariable 'D41_geknueppelt') exitWith {hint 'Du hast Deine Hände nicht frei!'};
					if(player getVariable 'surrender') exitWith {hint 'Du hast Deine Hände nicht frei!'};
					[cursorTarget] call life_fnc_combat;
					[] call life_fnc_hudUpdate;
				};
		"];
	};
};

//#2
[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","_Allowed = false; if((_this select 1) in actionKeys 'TacticalView')then
				{
					_Allowed = true;
					systemchat 'Tactical View: Aus! Hier wird nicht rumgeglotzt!';
				};
				_Allowed;"
		];
	};
};
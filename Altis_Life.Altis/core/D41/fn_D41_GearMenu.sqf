//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_GearMenu.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Fügt weitere Infos zum I-Inventar hinzu
//::::::::::::  ::::::::::::\\

player addEventHandler
[
	"InventoryOpened",
	{
		if(player getVariable "restrained") exitWith {closeDialog 0; hint "Ich glaube nicht, Tim! Du hast Deine Hände nicht frei!"};
		_InterfaceInteract = [] spawn
		{
			disableSerialization;
			waitUntil { !(isNull (findDisplay  602)) };
			((findDisplay  602) displayCtrl 633) ctrlAddEventHandler ["LBDblClick", "_this spawn life_fnc_D41_InvItem"]; // Uniform
			((findDisplay  602) displayCtrl 638) ctrlAddEventHandler ["LBDblClick", "_this spawn life_fnc_D41_InvItem"]; // Weste
			((findDisplay  602) displayCtrl 619) ctrlAddEventHandler ["LBDblClick", "_this spawn life_fnc_D41_InvItem"]; // Rucksack
			((findDisplay  602) displayCtrl 640) ctrlAddEventHandler ["LBDblClick", "_this spawn life_fnc_D41_InvItem"]; // Container
			//((findDisplay 602) displayCtrl 632) ctrlAddEventHandler ["LBDblClick", "_this call D41_fnc_Inv2"]; // Boden
			//Geld
			_GMenu = (findDisplay  602) ctrlCreate ["RscText",1928];
			_GMenu ctrlSetPosition  [-0.07, 0.96, 0.36, 0.05];
			_GMenu ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu ctrlCommit 0;
			_GMenustr = format ["Bargeld: €%1",D41_Geld];
			_GMenu ctrlSetTooltip "Bargeld";
			_GMenu ctrlSetText _GMenustr;
			//Geld-Bank
			_GMenu2 = (findDisplay  602) ctrlCreate ["RscText",1928];
			_GMenu2 ctrlSetPosition  [0.338, 0.96, 0.36, 0.05];
			_GMenu2 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu2 ctrlCommit 0;
			_GMenu2str2 = format ["Kontostand: €%1",D41_atmGeld];
			_GMenu2 ctrlSetTooltip "Kontostand";
			_GMenu2 ctrlSetText _GMenu2str2;
			//Karma
			_GMenu3 = (findDisplay  602) ctrlCreate ["RscText",1928];
			_GMenu3 ctrlSetPosition  [0.698,0.96,0.201,0.05];
			_GMenu3str3 = format ["Karma: %1",life_D41_Karma];
			_GMenu3 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu3 ctrlCommit 0;
			_GMenu3 ctrlSetTooltip "Karma is a Bi...";
			_GMenu3 ctrlSetText _GMenu3str3;
			//Schlüssel
			_GMenu4 = (findDisplay  602) ctrlCreate ["RscButton",1928];
			_GMenu4 ctrlSetPosition  [0.899,0.96,0.170,0.05];
			_GMenu4 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu4 ctrlCommit 0;
			_GMenu4 ctrlSetText "Schlüssel";
			_GMenu4 ctrlSetTooltip "Schlüssel";
			_GMenu4 buttonSetAction "createDialog 'Life_key_management';";
			//Lizenzen-Header
			_GMenu5 = (findDisplay  602) ctrlCreate ["RscText",1928];
			_GMenu5 ctrlSetPosition  [-0.4,0.04,0.33,0.05];
			_GMenu5 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu5 ctrlCommit 0;
			_GMenu5 ctrlSetText "- Lizenzen -";
			_GMenu5 ctrlSetTooltip "- Lizenzen -";
			//Lizenzen-Liste
			_GMenu6 = (findDisplay  602) ctrlCreate ["RscStructuredText",1928];
			_GMenu6 ctrlSetPosition  [-0.4,0.09,0.33,0.87];
			_GMenu6 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu6 ctrlCommit 0;
			_GMenu6 ctrlSetTooltip "- Lizenzen -";
				//für Lizenzabfrage
				_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
				_lizenzen = "";
				{
					if((_x select 1) == _side) then
					{
						_str = [_x select 0] call life_fnc_varToStr;
						_val = missionNamespace getVariable (_x select 0);
						if(_val) then
						{
							_lizenzen = _lizenzen + format["%1<br/>",_str];
						};
					};
				} foreach life_licenses;
				//Lizenzabfrage beendet
			_GMenu6 ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_lizenzen];
			//Teiler
			_GMenu7 = (findDisplay  602) ctrlCreate ["RscText",1928];
			_GMenu7 ctrlSetPosition  [-0.08,0.04,0.01,0.92];
			_GMenu7 ctrlSetBackgroundColor [0, 0, 0, 1];
			_GMenu7 ctrlCommit 0;
			//Einlagern
			_GMenu8 = (findDisplay  602) ctrlCreate ["RscButton",1928];
			_GMenu8 ctrlSetPosition  [0.294,0.30,0.04,0.195];
			_GMenu8 ctrlSetBackgroundColor [0, 0, 0, 1];
			_GMenu8 ctrlCommit 0;
			_GMenu8 ctrlSetText "";
			_GMenu8 buttonSetAction "[] spawn life_fnc_D41_PutItem;";
			//Einlagern-Bild
			_GMenu9 = (findDisplay  602) ctrlCreate ["RscPicture",1928];
			_GMenu9 ctrlSetPosition  [0.294,0.30,0.04,0.195];
			_GMenu9 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu9 ctrlCommit 0;
			_GMenu9 ctrlSetText "\D41_T\Texturen\GUI\PfeilL.paa";
			_GMenu9 ctrlSetTooltip "Alles ins Fahrzeug laden";
			_GMenu9 buttonSetAction "[] spawn life_fnc_D41_PutItem;";
			//Rausnehmen
			_GMenu10 = (findDisplay  602) ctrlCreate ["RscButton",1928];
			_GMenu10 ctrlSetPosition  [0.294,0.10,0.04,0.195];
			_GMenu10 ctrlSetBackgroundColor [0, 0, 0, 1];
			_GMenu10 ctrlCommit 0;
			_GMenu10 ctrlSetText "";
			_GMenu10 buttonSetAction "[] spawn life_fnc_D41_TakeItem;";
			//Rausnehmen-Bild
			_GMenu11 = (findDisplay  602) ctrlCreate ["RscPicture",1928];
			_GMenu11 ctrlSetPosition  [0.294,0.10,0.04,0.195];
			_GMenu11 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu11 ctrlCommit 0;
			_GMenu11 ctrlSetText "\D41_T\Texturen\GUI\PfeilR.paa";
			_GMenu11 ctrlSetTooltip "Gewähltes aus dem Fahrzeug laden";
			_GMenu11 buttonSetAction "[] spawn life_fnc_D41_TakeItem;";
			//Hunger - ProgressBar
			_Hunger = if(life_hunger >= 100)then{0.3555}else{((life_hunger / 100)*0.3555);};
			_GMenu12 = (findDisplay  602) ctrlCreate ["RscText",1930];
			_GMenu12 ctrlSetPosition  [0.3425,-0.005,_Hunger,0.04];
			_GMenu12 ctrlSetBackgroundColor [0, 1, 0, 0.65];
			_GMenu12 ctrlCommit 0;
			//Hunger - Hintergrund
			_GMenu13 = (findDisplay 602) ctrlCreate ["RscText",1931];
			_GMenu13 ctrlSetPosition  [0.3375,-0.01,0.3655,0.05];
			_GMenu13 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu13 ctrlCommit 0;
			_GMenu13 ctrlSetText "|- Hunger -";
			_GMenu13 ctrlSetTooltip "- Hunger -";
			//Durst - ProgressBar
			_Durst = if(life_thirst >= 100)then{0.3555}else{((life_thirst / 100)*0.3555);};
			_GMenu14 = (findDisplay  602) ctrlCreate ["RscText",1932];
			_GMenu14 ctrlSetPosition  [0.708,-0.005,_Durst,0.04];
			_GMenu14 ctrlSetBackgroundColor [0, 1, 0, 0.65];
			_GMenu14 ctrlCommit 0;
			//Durst = Hintergrund
			_GMenu15 = (findDisplay  602) ctrlCreate ["RscText",1933];
			_GMenu15 ctrlSetPosition  [0.703,-0.01,0.366,0.05];
			_GMenu15 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu15 ctrlCommit 0;
			_GMenu15 ctrlSetText "|- Durst -";
			_GMenu15 ctrlSetTooltip "- Durst -";
			//Gesundheit - Grüne Bar
			_GMenu16 = (findDisplay  602) ctrlCreate ["RscText",1934];
			_GMenu16 ctrlSetPosition [1.08,0.049,0.04,0.9];
			_GMenu16 ctrlSetBackgroundColor [0, 1, 0, 1];
			_GMenu16 ctrlCommit 0;
			//Gesundheit - Hintergrund (Grün wird abgeschwächt)
			_GMenu17 = (findDisplay  602) ctrlCreate ["RscText",1935];
			_GMenu17 ctrlSetPosition [1.075,0.039,0.05,0.92];
			_GMenu17 ctrlSetBackgroundColor [0, 0, 0, 0.65];
			_GMenu17 ctrlCommit 0;
			_GMenu17 ctrlSetTooltip "Gesundheit";
			//Gesundheit - schwarze Bar zum verdecken von Grüner Bar (Gesundheitsstatus)
			_HealthBar = if(damage player == 0)then{0}else{(0.9 * damage player)};
			_GMenu18 = (findDisplay  602) ctrlCreate ["RscText",1936];
			_GMenu18 ctrlSetPosition [1.08,0.049,0.04,_HealthBar];
			_GMenu18 ctrlSetBackgroundColor [0, 0, 0, 1];
			_GMenu18 ctrlCommit 0;
		};
	}
];
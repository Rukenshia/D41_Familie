/*
	File: D41_wetter.sqf
	Author: Distrikt41.de - Dscha

	Description:
	Random Weather Script - What else can i say?
*/
	private ["_fnc_D41_WetterWerte"];

	
	D41_Nebel = [0,0,0];
	D41_Wellen = 1;
	D41_Vorschau = 0.5;
	D41_Wind = [1, 1, true];
	D41_Regen = 0;
	D41_RegenCounter = 1;
	D41_Blitze = 0;

	_fnc_D41_WetterWerte =
	{
		if (isDedicated) then
			{
				D41_ChanceN = round(random 100);
				if(D41_ChanceN <= 5) then
					{
						D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [2, 2, true]; D41_Regen = 0; D41_RegenCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {D41_Nebel = [1, 0.1,10];		D41_Regen = 0;	D41_Vorschau = 0.4; D41_Blitze = 0;}; //Dicht
						if(D41_WMod == 1)	then {D41_Nebel = [1, 0.2,10];		D41_Regen = 0;	D41_Vorschau = 0.3; D41_Blitze = 0;};
						if(D41_WMod == 2)	then {D41_Nebel = [1, 0.3,10];		D41_Regen = 0;	D41_Vorschau = 0.2; D41_Blitze = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 3)	then {D41_Nebel = [0.9, 0.1,15];	D41_RegenCounter = 0; D41_Blitze = 0;}; //Dicht
						if(D41_WMod == 4)	then {D41_Nebel = [0.8, 0.1,15];	D41_Regen = 0;	D41_Vorschau = 0.4; D41_Blitze = 0;};
						if(D41_WMod == 5)	then {D41_Nebel = [0.7, 0.1,15];	D41_RegenCounter = 0; D41_Blitze = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 6)	then {D41_Nebel = [0.6, 0.1,30];	D41_RegenCounter = 0; D41_Blitze = 0;};
						if(D41_WMod == 7)	then {D41_Nebel = [0.5, 0.1,30];	D41_Regen = 0.1;	D41_Vorschau = 0.4; D41_Blitze = 0;};
						if(D41_WMod == 8)	then {D41_Nebel = [0.4, 0.1,30];	D41_RegenCounter = 0; D41_Blitze = 0;}; //geht so, akzeptabler Nebel
						if(D41_WMod == 9)	then {D41_Nebel = [0.1, 0.1,50];	D41_Regen = 0.1;	D41_Wellen = 1;	D41_Vorschau = 0.5; D41_Blitze = 1;}; //Hoch halt
					};

				if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RegenCounter == 0) then
					{
						D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 1; D41_Regen = 0; D41_RegenCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 1; 	D41_Wind = [4, 4, true];	D41_Regen = 0.6; D41_Blitze = 1;};
						if(D41_WMod == 1)	then {D41_Nebel = 0.3;	D41_Wellen = 1;		D41_Vorschau = 1; 	D41_Wind = [4, 4, true];	D41_Regen = 0.6; D41_Blitze = 1;};
						if(D41_WMod == 2)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.9; D41_Wind = [4, 4, true];	D41_Regen = 0.5; D41_Blitze = 1;};
						if(D41_WMod == 3)	then {D41_Nebel = 0.2;	D41_Wellen = 1;		D41_Vorschau = 0.8; D41_Wind = [0, 5, true];	D41_Regen = 0.5; D41_Blitze = 1;};
						if(D41_WMod == 4)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.7; D41_Wind = [6, 0, true];	D41_Regen = 0.3; D41_Blitze = 0;};
						if(D41_WMod == 5)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.7; D41_Wind = [0, 6, true];	D41_Regen = 0.3; D41_Blitze = 0;};
						if(D41_WMod == 6)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.6; D41_Wind = [5, 0, true];	D41_Regen = 0.2; D41_Blitze = 0;};
						if(D41_WMod == 7)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.5; D41_Wind = [2, 4, true];	D41_Regen = 0.2; D41_Blitze = 0;};
						if(D41_WMod == 8)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.4; D41_Wind = [3, 2, true];	D41_Regen = 0.2; D41_Blitze = 0;};
						if(D41_WMod == 9)	then {D41_Nebel = 0.1;	D41_Wellen = 1;		D41_Vorschau = 0.4; D41_Wind = [2, 1, true];	D41_Regen = 0.1; D41_Blitze = 0;};
					};

				if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RegenCounter == 1) then {D41_ChanceN = 36};

				if(D41_ChanceN >=36 && D41_ChanceN <= 80) then
				{
					D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [5, 5, true]; D41_Regen = 0; D41_RegenCounter = 0;
					D41_WMod = round(random 9);
					if(D41_WMod == 0)	then {D41_Vorschau = 0.9;	D41_Wind = [3, 0, true]; D41_Blitze = 0;};
					if(D41_WMod == 1)	then {D41_Vorschau = 0.9;	D41_Wind = [0, 3, true]; D41_Blitze = 0;};
					if(D41_WMod == 2)	then {D41_Vorschau = 0.7;	D41_Wind = [2, 3, true]; D41_Blitze = 0;};
					if(D41_WMod == 3)	then {D41_Vorschau = 0.7;	D41_Wind = [3, 2, true]; D41_Blitze = 0;};
					if(D41_WMod == 4)	then {D41_Vorschau = 0.6;	D41_Wind = [0, 3, true]; D41_Blitze = 0;};
					if(D41_WMod == 5)	then {D41_Vorschau = 0.6;	D41_Wind = [2, 0, true]; D41_Blitze = 0;};
					if(D41_WMod == 6)	then {D41_Vorschau = 0.5;	D41_Wind = [2, 2, true]; D41_Blitze = 0;};
					if(D41_WMod == 7)	then {D41_Vorschau = 0.5;	D41_Wind = [2, 0, true]; D41_Blitze = 0;};
					if(D41_WMod == 8)	then {D41_Vorschau = 0.4;	D41_Wind = [0, 2, true]; D41_Blitze = 0;};
					if(D41_WMod == 9)	then {D41_Vorschau = 0.4;	D41_Wind = [1, 1, true]; D41_Blitze = 0;};
				};

				if(D41_ChanceN >=81 && D41_ChanceN <= 100) then
				{
					D41_Nebel = [0,0,0]; D41_Wellen = 1; D41_Vorschau = 0.2; D41_Wind = [1, 1, true]; D41_Regen = 0; D41_RegenCounter = 1;
					D41_WMod = round(random 2);
					if(D41_WMod == 0)	then {D41_Vorschau = 0.2;	D41_Wind = [3, 0, true]; D41_Blitze = 0;};
					if(D41_WMod == 1)	then {D41_Vorschau = 0.2;	D41_Wind = [0, 3, true]; D41_Blitze = 0;};
					if(D41_WMod == 2)	then {D41_Vorschau = 0.1;	D41_Wind = [0, 0, true]; D41_Blitze = 0;};			
				};
				Diag_log format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
				publicVariable "D41_Nebel";
				publicVariable "D41_Wellen";
				publicVariable "D41_Vorschau";
				publicVariable "D41_Wind";
				publicVariable "D41_Regen";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			[] call _fnc_D41_WetterWerte;
			//sleep 1;
			60 setfog (D41_Nebel);
			60 setRain (D41_Regen);
			0 setOvercast (D41_Vorschau);
			setWind (D41_Wind);
			60 setWaves (D41_Wellen);
			sleep 1200;
		};
	};

	//JIP und sync Ged�hns
	if (!isDedicated) then
	{
		while{true}do
		{
			60 setfog (D41_Nebel);
			60 setRain (D41_Regen);
			0 setOvercast (D41_Vorschau);
			setWind (D41_Wind);
			60 setWaves (D41_Wellen);
			//hint format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
			uiSleep 120;
		};
	};
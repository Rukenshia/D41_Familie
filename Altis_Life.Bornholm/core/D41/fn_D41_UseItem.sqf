//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_UseItem.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Nötig fürs Item benutzen?
//::::::::::::  ::::::::::::\\

private["_Item","_ItemName"];
disableSerialization;
_Item = _this select 0;
_ItemName = _this select 1;
_idc = _this select 2;
if(_idc == 640)exitWith {hint "Mitn Schädel in dem Kofferraum? Nimms erstmal raus du Barbar!"};

/*if(_ItemName == "First Aid Kit") then //Bsp. für ein Item OHNE Classname!
	{
		player setDamage 0;
		player removeItem "FirstAidKit";
		hint format ["First Aid Kit benutzt.\n\nSchaden: %1/1", damage player];
	};*/
if(_Item == "D41_BeefJerky") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_hunger = (life_hunger + 40);
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast Dich überfressen und bist nun erschöpft.";};
		life_hunger = _sum;
	};
if(_Item == "D41_WaterBottle") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Apfel") then
	{
		player removeMagazine _Item;
		life_thirst = (life_thirst + 5);
		_val = 5;
		life_hunger = (life_hunger + 10);
		_val2 = 10;
		player setFatigue 0;
		
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
				
		_sum2 = life_hunger + _val2;
		if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1; hint "Du hast Dich überfressen und bist nun erschöpft.";};
		life_hunger = _sum2;
	};
if(_Item == "D41_Apfelsaft") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Apfelschnaps") then
	{
		if (life_AlkKonsum >= 3) exitWith {hint "Du würdest Dich zu tode saufen! Lass es gut sein und trink lieber ein Wasser!"};
		if (life_Alkoholiker > 0) exitWith {hint "Wie kann man seine Futterluke verfehlen? Wie besoffen bist Du? Warte bis Du wieder klar sehen kannst!"};
		if (life_thirst < 13) exitWith {hint "Du würdest Dich zu tode saufen! Lass es gut sein und trink lieber ein Wasser!"};
		if (life_Alkoholiker < 1) exitWith
		{
			player removeMagazine _Item;
			life_thirst = (life_thirst - 10);
			life_hunger = (life_hunger + 15);
			_val2 = 15;
			[] spawn life_fnc_AlkoholEffekt;
			life_AlkKonsum = life_AlkKonsum + 0.6;
			
			_sum2 = life_hunger + _val2;
			if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1;};
			life_hunger = _sum2;
			
			if(life_AlkKonsum < 1.2) then {hint format ["*rülps*! %1 Promille", life_AlkKonsum];};
			if(life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.4 ) then {hint format ["Du bist so dicht wie 2 Russische Seemänner auf Landgang, fühlst dich wohl aber lallst wie bekloppt. Fahre kein Auto mehr! %1 Promille", life_AlkKonsum];};
			if(life_AlkKonsum >= 2.5) then {hint format ["Du bist so dicht wie 10 Russische Seemänner auf Landgang, fühlst dich SAUWOHL aber hast rund 90Prozent deiner Muttersprache vergessen! Fahre DEFINITIV kein Auto mehr! %1 Promille", life_AlkKonsum];};
		};
	};
if(_Item == "D41_Pfirsich") then
	{
		player removeMagazine _Item;
		life_thirst = (life_thirst + 10);
		_val = 10;
		life_hunger = (life_hunger + 15);
		_val2 = 15;
		player setFatigue 0;
		
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
				
		_sum2 = life_hunger + _val2;
		if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1; hint "Du hast Dich überfressen und bist nun erschöpft.";};
		life_hunger = _sum2;
	};
if(_Item == "D41_Pfirsichsaft") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Pfirsichschnaps") then
	{
		if (life_AlkKonsum >= 3) exitWith {hint "Du würdest Dich zu tode saufen! Lass es gut sein und trink lieber ein Wasser!"};
		if (life_Alkoholiker > 0) exitWith {hint "Wie kann man seine Futterluke verfehlen? Wie besoffen bist Du? Warte bis Du wieder klar sehen kannst!"};
		if (life_thirst < 13) exitWith {hint "Du würdest Dich zu tode saufen! Lass es gut sein und trink lieber ein Wasser!"};
		if (life_Alkoholiker < 1) exitWith
		{
			player removeMagazine _Item;
			life_thirst = (life_thirst - 10);
			life_hunger = (life_hunger + 15);
			_val2 = 15;
			[] spawn life_fnc_AlkoholEffekt;
			life_AlkKonsum = life_AlkKonsum + 0.6;
			
			_sum2 = life_hunger + _val2;
			if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1;};
			life_hunger = _sum2;
			
			if(life_AlkKonsum < 1.2) then {hint format ["*rülps*!\n%1 Promille", life_AlkKonsum];};
			if(life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.4 ) then {hint format ["Du bist so dicht wie 2 Russische Seemänner auf Landgang, fühlst dich wohl aber lallst wie bekloppt. Fahre kein Auto mehr! %1 Promille", life_AlkKonsum];};
			if(life_AlkKonsum >= 2.5) then {hint format ["Du bist so dicht wie 10 Russische Seemänner auf Landgang, fühlst dich SAUWOHL aber hast rund 90Prozent deiner Muttersprache vergessen!\n\nFahre DEFINITIV kein Auto mehr!\n\n%1 Promille", life_AlkKonsum];};
		};
	};
if(_Item == "D41_Hasenfleisch") then
	{
		player removeMagazine _Item;
		_val = 20;
		_sum = life_hunger + _val;
		if(_sum > 100) exitWith {_sum = 100; player setFatigue 1; hint "Du hast Dich überfressen und bist nun erschöpft.";};
		life_hunger = _sum;
		hint "Dieses fluffige Tierchen konnte wohl nicht schnell genug weghoppeln!\n\n *mampf* \n\n Niedlich.\nNiedlich, zu langsam und tot.";
	};
if(_Item == "D41_EnergyDrink") then
	{
		player removeMagazine _Item;
		life_thirst = 100;
		player setFatigue 0;
		[] spawn
		{
			life_energydrink_effect = time;
			titleText["Du kannst jetzt für 3min dauerhaft sprinten!","PLAIN"];
			hint "Du kannst jetzt für 3min dauerhaft sprinten!";
			player enableFatigue false;
			waitUntil {!alive player OR ((time - life_energydrink_effect) > (3 * 60))};
			player enableFatigue true;
		};
	};
if(_Item == "D41_Cannabis") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_weedEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
	};
if(_Item == "D41_Kokain") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_kokainEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
		player setFatigue 0;
		[] spawn
		{
			life_KokaZeit = time;
			player enableFatigue false;
			titleText["Du ziehst Dir ne Nase Koks rein und rennst für die nächsten 5min wie der Flash auf Schlaftabletten!","PLAIN"];
			hint "Du ziehst Dir ne Nase Koks rein und rennst für die nächsten 5min wie der Flash auf Schlaftabletten!";
			waitUntil {!alive player OR ((time - life_KokaZeit) > (5 * 60))};
			player enableFatigue true;
		};
	};
if(_Item == "D41_Heroin") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_heroinEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
	};
if(_Item == "D41_Salema" OR _Item == "D41_Ornate" OR _Item == "D41_Mackrele" OR _Item == "D41_Tunfisch" OR _Item == "D41_Mullet" OR _Item == "D41_Katzenhai") then
	{
		hint "Roher Fisch?\nBiste n 16:9 gucker oder was?\n1. Brat den Mist erstmal!\n2. Haste mal daran gedacht, wieviel von den Trawlern ausgelaufenes Öl/Diesel durch diese Kiemen gingen?\n\n\n Kurz: Kein Effekt =)";
	};
if(_Item == "D41_Donuts") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_hunger = (life_hunger + 40);
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast Dich überfressen und bist nun erschöpft.";};
		life_hunger = _sum;
		hint "hmm...\nDonuts\n...";
	};
if(_Item == "D41_Kaffee") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100;};
		life_thirst = _sum;
		hint "
		Ja Junge, Alte, das is Kaffe.\n\n
		Echt jetz!\n\n
		Un Kaffee ist numa lecker...\n\n
		Eehh... stark, schwarz, un vor allem schön lecker...\n\n
		Ja, Junge.\n
		Wenn ich ehrlich bin... trink ich am liebstn schwarzn Kaffe.\n\n
		Schwarzer, Junge.\n
		Jetzt echt...\n\n
		Schwarzer Kaffe junge...\n
		Der schmeckt richtig richtig lecka schmeckt der, echt jetz.\n
		Schwarzer... schöner... heißer.. Kaffe...\n
		Richtig dunkel... schwarzer... heißer... Kaffe...\n\n\n
		Schwarzer Kaffe Junge...\n
		Weißt du eigentlich wie gut der schmeckt?...\n\n
		Junge echt jetzt...\n\n
		Und wenn ich Kaffee sag, dann mein ich richtig dunklen...\n
		schwarzen...\n
		kochend heißen...\n
		echt leckren...\n
		extrem schwarzen Kaffe, Junge...\n\n
		Und wenn du mein Kaffe anpackst, Junge...\n
		Dann tret ich dir Deine fiese Fresse aus der Schnauze...\n
		";
	};
if(_Item == "D41_BenzinKanisterLeer") then
	{
		_ItemOutput = "D41_BenzinKanister";
		_FSAbfrage = nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"], 3];
		if((count _FSAbfrage) == 0) exitwith {closeDialog 0; hint "Du bist nicht in der Nähe einer Tankstelle";};
		if(!(player canAdd _ItemOutput)) exitWith {closeDialog 0; hint "Du hast nicht genügend Platz im Inventar!";};
		if((count _FSAbfrage) > 0) then
		{
			closeDialog 0;
			player removeMagazine _Item;
			player addMagazine _ItemOutput;
			titleText["Du hast einen Benzinkanister aufgefüllt","PLAIN"];
		};
	};
if(_Item == "D41_BenzinKanister") then
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
if(_Item == "D41_Nagelband") then
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		[] spawn life_fnc_spikeStrip;
		closeDialog 0;
	};
if(_Item == "D41_Sprengladung") then
	{
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
if(_Item == "D41_Bolzenschneider") then
	{
		if( player distance D41_KnastZaun < 4 && (getDammage D41_Knastzaun == 0)) then
		{
			[] spawn life_fnc_D41_KnastZaun; closeDialog 0;
		}
		else
		{
			[cursorTarget] spawn life_fnc_boltcutter; closeDialog 0;
		};
	};
if(_Item == "D41_BombeWegMachtKit") then
	{
		[cursorTarget] spawn life_fnc_defuseKit;
	};
if(_Item == "D41_LagerkisteKlein") then
	{
		[_Item] call life_fnc_storageBox;
	};
if(_Item == "D41_LagerkisteGross") then
	{
		
		[_Item] call life_fnc_storageBox;
	};
if(_Item == "D41_LagerkisteLagerhaus") then
	{
		[_Item] call life_fnc_storageBoxHuge;
	};
if(_Item == "D41_Fahrzeugteile") then
	{
		player removeMagazine _Item;
		hint "WOHER HAST DU DAS???";
	};
if(_Item == "D41_Dietrich") then
	{
		[] spawn life_fnc_lockpick;
		closeDialog 0;
	};
if(_Item == "D41_Mauer") then
	{
		if(!isNull life_mauer) exitWith {hint "Du stellst bereits eine Mauer!"};
		[] spawn life_fnc_mauer;
		closeDialog 0;
	};
if(_Item == "D41_Strahler") then
	{
		if(!isNull life_strahler) exitWith {hint "Du stellst bereits einen Strahler!"};
		[] spawn life_fnc_strahler;
		closeDialog 0;
	};
if(_Item == "D41_Schranke") then
	{
		if(!isNull life_Schranke) exitWith {hint "Du stellst bereits eine Schranke auf!"};
		[] spawn life_fnc_Schranke;
		closeDialog 0;
	};
if(_Item == "D41_Blitzer") then
	{
		if(!isNull life_Blitzer) exitWith {hint "Du stellst bereits einen Blitzer!"};
		[] spawn life_fnc_Blitzer;
		closeDialog 0;
	};

[] call life_fnc_hudUpdate;
[] spawn 
{
	private["_fnc_EscCheck","_fnc_food","_fnc_water","_fnc_Alkohol","_Dmg","_DmgMod"];
	
	_fnc_EscCheck = //DoppelCheck, falls ESC Taste noch geblockt ist
	{
		if (life_alkoholiker < 1) then {noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; (findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];}
		else {};
	};
	
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint "Du bist verhungert. Blöd.";}
		else
		{
		life_hunger = life_hunger - 1;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint "Du bist verhungert. Blöd.";};
		switch(true) do
			{
				case (life_hunger >= 16 && life_hunger <= 20): {playsound "D41_Hunger"; titleText[format["Du hast eine Weile nichts mehr gegessen, das solltest Du bald ändern! Hunger: %1",life_hunger],"PLAIN"];};
				case (life_hunger >= 10 && life_hunger <= 15): {playsound "D41_Hunger"; titleText[format["Du beginnst zu verhungern. Du sollest wirklich etwas essen. Hunger: %1",life_hunger],"PLAIN"];};
				case (life_hunger >= 2 && life_hunger <=9): {playsound "D41_Hunger"; titleText[format["Du verhungerst gleich. Wenn Du nichts isst wars das! Hunger: %1",life_hunger],"PLAIN"]; player setFatigue 1;};
			};
		};
	};

	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint "Du bist verdurstet. Schade eigentlich.";}
		else
		{
			life_thirst = life_thirst - 2;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint "Du bist verdurstet. Schade eigentlich.";};
			switch(true) do
			{
				case (life_thirst >= 16 && life_thirst <= 20): {playsound "D41_Hunger"; titleText[format["Du hast eine Weile nichts mehr getrunken, das solltest Du bald ändern! Durst: %1",life_thirst],"PLAIN"];};
				case (life_thirst >= 10 && life_thirst <= 15): {playsound "D41_Hunger"; titleText[format["Du beginnst zu verdursten. Komm schon, so ein Schluck Wasser schadet nicht. Durst: %1",life_thirst],"PLAIN"];};
				case (life_thirst >= 2 && life_thirst <= 9): {playsound "D41_Hunger"; titleText[format["Du leidest gleich an einer ernsthaften Dehydrierung wenn Du nicht gleich was trinkst! Durst: %1",life_thirst],"PLAIN"]; player setFatigue 1;};
			};
		};
	};
	
	_fnc_Alkohol = 
	{
		if(life_Alkoholiker > 0) then {hint format ["Alter Suffkopp! %1 Promille", life_AlkKonsum];};
		if (life_Alkoholiker < 1) then
		//else
		{
			[] call life_fnc_hudUpdate;
			if(life_AlkKonsum < 0.1) then {}
			else
			{
				if(life_AlkKonsum < 0.2) then {hint "Du bist nüchtern.";};
				life_AlkKonsum = life_AlkKonsum - 0.1;
				if(life_AlkKonsum >= 2.4) then {[] spawn life_fnc_AlkoholEffekt; hint format ["Du bist so dicht wie 10 Russische Seemänner auf Landgang, fühlst dich SAUWOHL aber hast rund 90Prozent deiner Muttersprache vergessen! Fahre DEFINITIV kein Auto mehr! %1 Promille", life_AlkKonsum]; _Dmg = getDammage player; if (_Dmg > 0) then {_DmgMod = _Dmg - 0.1; player setDammage _DmgMod;}; life_AlkKonsum = life_AlkKonsum - 0.1; player playMove "AmovPercMstpSnonWnonDnon_Scared2"};
				if(life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.3 ) then {[] spawn life_fnc_AlkoholEffekt; hint format ["Du bist dicht wie 2 Russische Seemänner auf Landgang, fühlst dich wohl und lallst wie bekloppt. Fahre kein Auto mehr! %1 Promille", life_AlkKonsum]; _Dmg = getDammage player; if (_Dmg > 0) then {_DmgMod = _Dmg - 0.1; player setDammage _DmgMod;}; player playMove "AmovPercMstpSnonWnonDnon_Scared"};
				switch(life_AlkKonsum) do
				{
					case 0.6: {hint format ["Du bist fast nüchtern! Warte noch ein paar Minuten, bevor Du wieder Auto fährst! %1 Promille", life_AlkKonsum];};
					case 0.3: {hint format ["Dein Alkoholspiegel ist fast vollständig abgebaut! Restalkohol: %1 Promille", life_AlkKonsum];};
					case 0.1: {hint format ["Fast nüchtern! WOW! Guter Junge! %1 Promille", life_AlkKonsum];};
				};
			};
		};
	};
	
	_fnc_Drogen = 
	{
		[] call life_fnc_hudUpdate;
		if(life_DrogenKonsum < 0.1) then {}
		else
		{
			if(life_DrogenKonsum < 0.2) then {hint "Du bist clean!";};
			life_DrogenKonsum = life_DrogenKonsum - 0.1;
			switch(life_DrogenKonsum) do
			{
				case 0.6: {hint "Du bist noch stark unter Drogen! Fahre kein Auto und halte dich am besten von der Pozilei fern!";};
				case 0.3: {hint "Langsam ist alles abgebaut! Probleme sollte es mit der Pozilei jetzt nicht mehr geben, jedoch solltest Du das Auto noch stehen lassen.";};
				case 0.1: {hint "Fast clean! WOW! Guter Junge!";};
			};
		};
	};

	while{true} do
	{
		sleep 120;
		[] call _fnc_EscCheck;
		[] call _fnc_water;
		[] call _fnc_food;
		[] call _fnc_Alkohol;
		[] call _fnc_Drogen;
	};
};

//Handy Abfrage
[] spawn
{
	while{true} do
	{
		waitUntil {("ItemRadio" in (assignedItems  player))};
		[[player,life_sidechat,playerSide,1],"TON_fnc_managesc",false,false] call life_fnc_MP;
		waitUntil {!("ItemRadio" in (assignedItems  player))};
		[[player,life_sidechat,playerSide,0],"TON_fnc_managesc",false,false] call life_fnc_MP;
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};
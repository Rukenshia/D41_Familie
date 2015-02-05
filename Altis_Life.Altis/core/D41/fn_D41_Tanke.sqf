/*
	File: fn_D41_Tanke.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Jo ähm, befüllen der Karre halt.
*/
private["_Karre","_Tankstand","_action", "_target", "_FuelSize", "_vehicle", "_name","_ui","_progress","_pgText","_fuelMod"];

_Karre = nearestObjects[getPos player,["Car","Air"],10];
if(count (_Karre) > 0) then
{
	if(D41_Tankt) exitWith {hint "Du hast nur zwei Hände um den Schlauch festzuhalten! *pfeif*"};
	_vehicle = _Karre select 0;
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_action = [
	format["%1 betanken?<br/>Benzinpreis: %2€/Durchlauf", _name, D41_BenzinPreis],"Tanken","Ja","Nein"
	] call BIS_fnc_guiMessage;

	D41_Tankt = true;
	D41_TankeVebraucht = 0;
	_fuel = 0;
	_fuelMod = 0;
	_fuel = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
	if(_vehicle isKindOf "Car") then {_fuelMod = ((1/(_fuel / 100))/1000);};
	if(_vehicle isKindOf "Air") then {_fuelMod = ((1/(_fuel / 100))/5);};
	
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_progress progressSetPosition (Fuel _vehicle);
	
	if(_action) then
	{
		while{true}do
		{
			if((D41_atmGeld - D41_BenzinPreis) < 0) exitWith {D41_Tankt = false; titleText[format["Nicht genügend Geld auf der Bank. Kontostand: %1",D41_atmGeld],"PLAIN"]; 5 cutText ["","PLAIN"];};
			D41_atmGeld = D41_atmGeld - D41_BenzinPreis;
			_Tankstand = Fuel _vehicle;
			_vehicle setFuel (_Tankstand + _fuelMod);
			_progress progressSetPosition _Tankstand;
			_pgText ctrlSetText format["%3 %4 (%1%2)...",round(_Tankstand * 100),"%","Betanke", _name];
			D41_TankeVebraucht = D41_TankeVebraucht + 1;
			if(_Tankstand > 0.9999) exitWith {D41_Tankt = false; titleText[format["Du hast deinen %1 vollständig betankt",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
			if((vehicle player) distance _vehicle > 5) exitWith {D41_Tankt = false; titleText["Bist du bekloppt? Bleib bei der Zapfsäule! Oder willst Du es riskieren, das alles in die Luft geht???","PLAIN"]; 5 cutText ["","PLAIN"];};
			if(!alive player) exitWith {D41_Tankt = false; hint "DA GEHTA DDOOOWWWNNN"; 5 cutText ["","PLAIN"];};
			if(vehicle player != player) exitWith {D41_Tankt = false;hint "Du mußt aussteigen, um zu tanken! Wir sind nicht in den USA... Beweg deinen fetten Arsch zur Zapfsäule!"; 5 cutText ["","PLAIN"];};
			sleep 1
		};
	};
	5 cutText ["","PLAIN"];
	D41_TankeAbzugOel = round((D41_TankeVebraucht/2));
	diag_log format [":::::::::::::: D41_TankeVebraucht: %1", D41_TankeAbzugOel];
	D41_Tankt = false;
};
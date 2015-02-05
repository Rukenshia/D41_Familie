/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightRed = [20, 0.1, 0.1];
_lightBlue = [0.1, 0.1, 20];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 0.2;
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
	case "Offroad_Pol":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
	};

	case "D41_Offroad_Medic":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
	};

	case "Offroad_SWAT":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
	};

	case "D41_swat_hunter":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
	};

	case "BMW_X6M_Pol":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37,-1.2,0.42]];
	};

	case "D41_Lada_Civ_05":
	{
		_lightleft lightAttachObject [_vehicle, [0.0, 0.0, 0.2]];
	};

	case "D41_rhsusf_m1025_d":
	{
		_lightleft lightAttachObject [_vehicle, [-0.45, 0.0, 1.9]];
	};
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0.2;
_lightright setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
	case "Offroad_Pol":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};
	case "D41_Offroad_Medic":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};

	case "Offroad_SWAT":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};

	case "D41_swat_hunter":
	{
		_lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
	};

	case "BMW_X6M_Pol":
	{
		_lightright lightAttachObject [_vehicle, [0.37,-1.2,0.42]];
	};

	case "D41_Lada_Civ_05":
	{
		// Same Position as left light, love that little bulb!
		_lightright lightAttachObject [_vehicle, [0.0, 0.0, 0.2]];
	};

	case "D41_rhsusf_m1025_d":
	{
		_lightright lightAttachObject [_vehicle, [0.45, 0.0, 1.9]];
	};
};

_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;
while{ (alive _vehicle)} do
{
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then
	{
		_leftRed = false;
		_lightright setLightBrightness 0.0;
		sleep 0.05;
		_lightleft setLightBrightness 6;
	}
		else
	{
		_leftRed = true;
		_lightleft setLightBrightness 0.0;
		sleep 0.05;
		_lightright setLightBrightness 6;
	};
	sleep (_this select 1);
};
deleteVehicle _lightleft;
deleteVehicle _lightright;

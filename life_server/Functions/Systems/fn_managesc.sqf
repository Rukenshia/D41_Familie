/*
	File: fn_managesc.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	User management of whether or not they want to be on a sidechat for their side.
*/
private["_unit","_bool","_side","_D41_HatHandy"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_side = [_this,2,civilian,[west]] call BIS_fnc_param;
_D41_HatHandy = _this select 3;
if(isNil {_D41_HatHandy}) then {_D41_HatHandy = 0};

if(isNull _unit) exitWith {};

switch (_side) do
{
	case west:
	{
		if(_bool && (_D41_HatHandy == 1)) then
		{
			life_radio_west radioChannelAdd [_unit];
		}
			else
		{
			life_radio_west radioChannelRemove [_unit];
		};
	};
	
	case civilian:
	{
		if(_bool && (_D41_HatHandy == 1)) then
		{
			life_radio_civ radioChannelAdd [_unit];
		}
			else
		{
			life_radio_civ radioChannelRemove [_unit];
		};
	};
	
	case independent:
	{
		if(_bool) then
		{
			life_radio_west radioChannelAdd [_unit];
			life_radio_civ radioChannelAdd [_unit];
		}
			else
		{
			life_radio_west radioChannelRemove [_unit];
			life_radio_civ radioChannelRemove [_unit];
		};
	};
};

// Ablage
/*
life_radio_indep radioChannelAdd [_unit];
life_radio_indep radioChannelRemove [_unit];
*/
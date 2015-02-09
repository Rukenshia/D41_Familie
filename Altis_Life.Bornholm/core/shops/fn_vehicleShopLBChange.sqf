#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_PreisDif =	format["<t color='#8cff9b'>Geld übrig: € %1</t>",(D41_Geld - _basePrice)];
if((D41_Geld - (_basePrice * 4)) >= 0) then
	{
		_PreisDif = format["<t color='#04b404'>Geld übrig:</t><t color='#04b404'>€ %1</t>",(D41_Geld - (_basePrice * 4))];
	}
	else
	{
		_PreisDif = format["<t color='#e50000'>Geld benötigt:</t><t color='#e50000'>€ %1</t>",(D41_Geld - (_basePrice * 4))];
	};


ctrlShow [2330,true];
ctrlShow [2305,true];
(getControl(2300,2305)) ctrlSetStructuredText parseText _PreisDif;
(getControl(2300,2303)) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>"
+(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>"
+(localize "STR_Shop_Veh_UI_Trunk")+ " %8<br/>"
+(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>"
+(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>"
+(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>"
+(localize "STR_Shop_Veh_UI_Fuel")+ " %6l<br/>"
+"Verbrauch: %7l/km<br/>"
+(localize "STR_Shop_Veh_UI_Armor")+ " %8"
,
[_basePrice] call life_fnc_numberText,
[round(_basePrice * 4)] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
(_vehicleInfo select 12) select 0,
(_vehicleInfo select 12) select 1,
_vehicleInfo select 9,
_vehicleInfo select 13
];


_ctrl = getControl(2300,2304);
lbClear _ctrl;
_colorArray = [_className] call life_fnc_vehicleColorCfg;

for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == (life_veh_shop select 2)) then {
		_temp = [_className,_i] call life_fnc_vehicleColorStr;
		_ctrl lbAdd format["%1",_temp];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
	};
};

if(_className in (__GETC__(life_vShop_rentalOnly))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;

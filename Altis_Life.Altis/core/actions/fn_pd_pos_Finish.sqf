/*
	File: fn_pd_pos_Finish.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: by D41 - Avka
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
	If its a Karma mission you will get karma based on the distance-
*/
private["_dp","_dis","_price","_karma"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(!(D41_Pos_DelivItem in magazines player))exitWith{hint "Wo ist die Lieferung? Mit leeren Händen brauchst Du hier nicht auftauchen"};

d41_pos_delivery_in_progress = false;
life_pd_point = nil;
_dis = round((getPos life_pd_start) distance (getPos _dp));
_karma = round(0.005 * _dis);
_price = round(0.5 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText, [_karma] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
life_D41_Karma = life_D41_Karma + _karma;
D41_Geld = D41_Geld + _price;
player removeMagazine D41_Pos_DelivItem;
[9] call SOCK_fnc_updatePartial;

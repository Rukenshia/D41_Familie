/*
	File: fn_stealmobile.sqf
	Author: Distrikt41 - Dscha

	Description:
	"steal" cellphone?
*/

hint "Dein Handy wurde Dir abgenommen und zerstört!";
player unassignItem "ItemRadio";
player removeItem "ItemRadio";
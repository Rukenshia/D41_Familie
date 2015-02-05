//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_InvItem.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Informationen der Auswahl im I-Inventar werden weitergegeben.
//::::::::::::  ::::::::::::\\

private["_actionA","_actionB","_idc","_selectedIndex","_data","_text","_Veh","_display","_Btn_Use","_Btn_Store","_Btn_Close","_ItemInfo","_curTgt"];

	
	_idc = ctrlIDC (_this select 0);
	_selectedIndex = _this select 1;
	_data = format ["%1",lbData [_idc, _selectedIndex]];
	_text = format ["%1",lbText [_idc, _selectedIndex]];
	if(D41_LagertEin == 1) exitWith {hint "Du machst schon was";};
		_actionA = [
		format["Item benutzen?"],"Wat willste?","Benutzen","Schließen"
		] call BIS_fnc_guiMessage;
		
		if(_actionA) then
		{
			[_data,_text,_idc] spawn life_fnc_D41_UseItem;
			false
		};
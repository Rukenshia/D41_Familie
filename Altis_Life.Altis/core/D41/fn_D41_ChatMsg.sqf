//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_ChatMsg.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Shortcut Nachrichten anzeigen
//::::::::::::  ::::::::::::\\
private["_mode"];
_mode = _this select 0;

//localize noch machen
switch(true)do
{
	case(_mode == 1): {hint "_mode 1"; systemchat "_mode 1"; titleText["_Mode 1","PLAIN"];};
	case(_mode == 2): {hint "_mode 2"; systemchat "_mode 2"; titleText["_Mode 2","PLAIN"];};
	case(_mode == 3): {hint "_mode 3"; systemchat "_mode 3"; titleText["_Mode 3","PLAIN"];};
	case(_mode == 4): {hint "_mode 4"; systemchat "_mode 4"; titleText["_Mode 4","PLAIN"];};
	case(_mode == 5): {hint "_mode 5"; systemchat "_mode 5"; titleText["_Mode 5","PLAIN"];};
	case(_mode == 6): {hint "_mode 6"; systemchat "_mode 6"; titleText["_Mode 6","PLAIN"];};
	case(_mode == 7): {hint "_mode 7"; systemchat "_mode 7"; titleText["_Mode 7","PLAIN"];};
	default{};
};
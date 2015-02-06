//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_EarPlug.sqf
//	Author: Distrikt41 - Dscha
//  Der Kram wurde von Jan modifiziert.
//
//	Beschreibung: Ohrenstöpsel halt, nä?
//::::::::::::  ::::::::::::\\

if (D41_EarPlugInUse) then {
  1 fadeSound 1;
  D41_EarPlugInUse = false;
  titleText ["Ohrstöpsel herausgenommen.", "PLAIN"];
}
else {
  1 fadeSound 0.2;
  D41_EarPlugInUse = true;
  titleText ["Ohrstöpsel eingesteckt.", "PLAIN"];
};

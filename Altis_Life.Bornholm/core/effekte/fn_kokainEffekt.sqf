/*
    File: fn_kokain.sqf
    Author: Kuchiha
	Edit by: Distrikt41 - Avka
    Description:
    Kokain effecte vom weed script.
*/

closeDialog 0;
life_Junkie = 1;

"colorCorrections" ppEffectEnable true;
"chromAberration" ppEffectEnable true;

for "_i" from 0 to 44 do
{

	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
	"colorCorrections" ppEffectCommit 1;
	"chromAberration" ppEffectAdjust [random 15 / 32, random 15 / 32, false];
    "chromAberration" ppEffectCommit (0.3 + random 0.1);
	sleep 1;
};


"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;

life_Junkie = 0;
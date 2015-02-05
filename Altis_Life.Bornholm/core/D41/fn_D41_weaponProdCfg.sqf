#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Distrikt41 - Dscha
	Description:
	Preisliste für Waffenproduktion
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[Klassenname,Custom Name (set nil for default),Kosten]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "WepProd":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_WKompL): {"Du hast keine Lizenz zur Nutzung von Waffenkomponenten!"};
			default
			{
				["Waffen Produktion",
					[
						//Handfeuerwaffen
						["RH_g19t","Glock 19 Tan",3],
                        ["RH_19Rnd_9x19_g18",nil,1],
						["RH_kimber_nw","1911 Black",5],
                        ["RH_7Rnd_45cal_m1911",nil,2],
					
						//Sturmgewehr
						["CUP_arifle_CZ805_A2","CZ805 A2",40],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,7],
						["rhs_weap_ak74m_camo","AK74M Camo",50],
						["rhs_30Rnd_545x39_AK_green",nil,7],
						["rhs_acc_pkas",nil,7],
						
						//Sniper
						["CUP_srifle_M40A3","M40A3",80],
						["CUP_5Rnd_762x51_M24",nil,14],
						["hlc_rifle_SAMR","RRA LLR-15",40],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,7],
						["CUP_optic_RCO",nil,14],
						
						//Battlerifle
						["RH_ar10","AR-10",60], 
						["RH_Delft",nil,8],
						["RH_20Rnd_762x51_AR10",nil,8],						
						
						//MG
						["hlc_rifle_RPK12","RPK12",160], 
						["hlc_45Rnd_545x39_t_rpk",nil,20] 
					]
				];
			};
		};
	};
};

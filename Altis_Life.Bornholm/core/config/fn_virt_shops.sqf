﻿#include <macro.h>
/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.

			// Jeweils folgende Reihenfolge:	Trinken, Essen, (Wasser, Apfel)
			//									Reguläre Z-Items (Benzinkannister, Kabelbinder)
			//									I-Items (Fernglas, Medkit)
			//									WAFFE, MUNITION, SPEZ. Attachments
			//									allg. Attachments (reguläre Optics)
			//									sonstige Austrüstung

*/
private["_shop"];
_shop = _this select 0;
_return = ["none",[]];

switch (_shop) do
{
	//Lebensmittelrohstoffe
	case "wongs": {_return = ["Wong's Food Cart",["D41_SchildkroetenSuppe","D41_Schildkroete"]]};
	case "coffee": {_return = ["Eggi's Spezialitätenladen",["D41_Kaffee","D41_Donuts","D41_Krabben"]]};
	case "fishmarket": {_return = ["Altis Fisch Markt",["D41_Salema","D41_Ornate","D41_Mackrele","D41_Mullet","D41_Tunfisch","D41_Katzenhai"]]};
	case "KnastDealer": {_return = ["Knastfras",["D41_WaterBottle","D41_Apfel","D41_Spitzhacke"]]};
	case "Biergarten": {_return = ["Biergarten",["D41_WaterBottle","D41_Kaffee","D41_Apfelschnaps","D41_Pfirsichschnaps","D41_BeefJerky","D41_Donuts"]]};

	//Edle Rohstoffe u. Weiterverarbeitung
	case "diamond": {_return = ["Diamantenhandel",["D41_Diamanten"]]};
	case "Kerosin": {_return = ["Flughafen Tanklager",["D41_Kerosin"]]};
	case "Stahl": {_return = ["Stahlhandel",["D41_Stahl"]]};
	case "heroin": {_return = ["Drogen Dealer",["D41_Kokain","D41_Cannabis","D41_Heroin"]]};
	case "gold": {_return = ["Goldhandel",["D41_GoldBarren"]]};

	//Grosshandel
	case "metall": {_return = ["Metallgroßhandel",["D41_Eisen","D41_Kupfer"]]};
	case "oil": {_return = ["Ölgroßhandel",["D41_Oel","D41_BenzinKanister"]]};
	case "mineralien": {_return = ["Mineralien und Gesteine Großhandel",["D41_Kohle","D41_Kalkstein"]]};
	case "baumaterial": {_return = ["Baumaterial Großhandel",["D41_Glas","D41_Ton","D41_Zement"]]};

	//Allgemeine Shops
	case "market": {if((_shop == "market") && !license_civ_rebel && (life_D41_Karma >= -4000)) then {_return =
		["Supermarkt",
					["D41_WaterBottle","D41_Apfelsaft","D41_Pfirsichsaft","D41_EnergyDrink","D41_Apfelschnaps","D41_Pfirsichschnaps","D41_Hasenfleisch","D41_Apfel","D41_Pfirsich","D41_BeefJerky",
					"D41_BenzinKanister","D41_LagerkisteKlein","D41_LagerkisteGross","D41_LagerkisteLagerhaus",
					"Binocular","ItemMap","ItemCompass","ItemWatch","ItemGPS","ItemRadio","ToolKit","FirstAidKit","NVGoggles"]
					]};
				};
	case "med": {if((_shop == "med") && playerSide == independent && ((call life_mediclevel) >= 2)) then {_return =
		["Medic Item Shop",
					["D41_WaterBottle","D41_Kaffee","D41_Apfelsaft","D41_Pfirsichsaft","D41_EnergyDrink","D41_Donuts","D41_Hasenfleisch","D41_BeefJerky",
					"D41_BenzinKanister","D41_Dietrich","ItemGPS","Binocular", "Rangefinder", "ToolKit","FirstAidKit","Medikit","ItemRadio","NVGoggles","pmc_earpiece"]
					]};
				};
	case "Werkzeuge": {_return = ["Werkzeugladen",["D41_Gartenschere","D41_Schaufel","D41_Schuerfgeschirr","D41_Bohrausruestung","D41_Spitzhacke","D41_Bolzenschneider"]]
				};
	case "gangadac": {
					if((_shop == "gangadac") && license_med_adac && playerSide == independent) then {_return =
		["ADAC Market",
					["D41_WaterBottle","D41_Apfelsaft","D41_Pfirsichsaft","D41_EnergyDrink","D41_Hasenfleisch","D41_BeefJerky",
					"D41_BenzinKanister","D41_Dietrich","ItemGPS","Binocular","ToolKit","FirstAidKit","ItemRadio","NVGoggles","pmc_earpiece"]
					]};
				};
	case "gunstore": {
					if((_shop == "gunstore")  && license_civ_gun && (life_D41_Karma >= -2000)) then {_return =
		["Waffenhandel",
					["RH_mak","RH_8Rnd_9x18_Mak",
					"RH_tt33","RH_8Rnd_762_tt33",
					"hgun_Rook40_F","16Rnd_9x21_Mag",
					"RH_ttracker","RH_6Rnd_45ACP_Mag",
					"RH_sw659","RH_14Rnd_9x19_sw",
					"RH_m1911","RH_7Rnd_45cal_m1911",
					"RH_gsh18","RH_18Rnd_9x19_gsh",
					"hgun_PDW2000_F","SMG_02_F","30Rnd_9x21_Mag",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","acc_flashlight","D41_Dietrich"]
					]};
				};

	case "gang1": {
					if((_shop == "gang1")) then {_return =
		["Waffenkiste",
					["RH_mak","RH_8Rnd_9x18_Mak",
					"RH_tt33","RH_8Rnd_762_tt33",
					"RH_ttracker","RH_6Rnd_45ACP_Mag",
					"RH_sw659","RH_14Rnd_9x19_sw",
					"hgun_PDW2000_F","SMG_02_F","30Rnd_9x21_Mag",
					"CUP_arifle_CZ805_A1","30Rnd_556x45_Stanag_Tracer_Red",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","optic_MRCO","CUP_optic_CompM2_Black","acc_flashlight"]
					]};
				};

	case "gang2": {
					if((_shop == "gang2")) then {_return =
		["Waffenkiste",
					["hgun_Rook40_F","16Rnd_9x21_Mag",
					"RH_m1911","RH_7Rnd_45cal_m1911",
					"RH_gsh18","RH_18Rnd_9x19_gsh",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Red",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","optic_MRCO","CUP_optic_CompM2_Black","acc_flashlight"]
					]};
				};

	case "gang3": {
					if((_shop == "gang3")) then {_return =
		["Waffenkiste",
					["RH_mak","RH_8Rnd_9x18_Mak",
					"hgun_Rook40_F","16Rnd_9x21_Mag",
					"RH_m1911","RH_7Rnd_45cal_m1911",
					"RH_gsh18","RH_18Rnd_9x19_gsh",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"rhs_weap_m4a1_grip","30Rnd_556x45_Stanag_Tracer_Red",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","optic_MRCO","CUP_optic_CompM2_Black","acc_flashlight"]
					]};
				};

	//POLIZEI
	case "copitems": {
					if((_shop == "copitems") && (playerSide == west) && !license_cop_gangfirma) then {
						_return =
						["Polizei Ausrüstung",
							["D41_Kaffee","D41_EnergyDrink","D41_Donuts",
							"D41_BombeWegMachtKit","D41_Nagelband","D41_Mauer","D41_Strahler","D41_Schranke","D41_Blitzer","D41_Dietrich",
							"D41_BenzinKanister","ItemGPS","Rangefinder","ToolKit","FirstAidKit","ItemRadio","NVGoggles","NVGoggles_OPFOR"]
						];

						// Remove that Blitzer!
						if (__GETC__(life_copLevel) < 4) then {
							_return set [1, (_return select 1) - ["D41_Blitzer"]];
						};
					};
				};

	case "cop":	{
					if((_shop == "cop") && ((call life_coplevel) == 1) && !license_cop_gangfirma) then {_return =
		["Rekruten Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"optic_ACO_grn","optic_Aco","acc_flashlight","acc_pointer_IR"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 2) && !license_cop_gangfirma) then {_return =
		["Officer Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"optic_ACO_grn","optic_Aco","optic_MRCO","acc_flashlight","acc_pointer_IR"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 3) && !license_cop_gangfirma) then {_return =
		["Patrol Officer Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"optic_ACO_grn","optic_Aco","optic_MRCO","acc_flashlight","acc_pointer_IR"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 4) && !license_cop_gangfirma) then {_return =
		["Master Patrol Officer Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4","30Rnd_556x45_Stanag",
					"FHQ_optic_AC11704","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","pmc_earpiece"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 5) && !license_cop_gangfirma) then {_return =
		["Sergeant Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4",
					"rhs_weap_m16a4_grip","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","RH_compm4s","RH_SFM952V",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR",
					"HandGrenade_Stone","pmc_earpiece","B_UavTerminal"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 6) && !license_cop_gangfirma) then {_return =
		["Leutenant Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4",
					"rhs_weap_m16a4_grip","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","RH_compm4s","RH_SFM952V",
					"hlc_rifle_vendimus","29rnd_300BLK_STANAG","rhsusf_acc_ACOG3",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15",
					"HandGrenade_Stone","pmc_earpiece","B_UavTerminal"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 7) && !license_cop_gangfirma) then {_return =
		["Captain Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4",
					"rhs_weap_m16a4_grip","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","RH_compm4s","RH_SFM952V",
					"hlc_rifle_vendimus",
					"hlc_rifle_Bushmaster300","29rnd_300BLK_STANAG","rhsusf_acc_ACOG3","FHQ_optic_HWS_G33",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15",
					"Laserdesignator","HandGrenade_Stone","pmc_earpiece","B_UavTerminal"]
					]};

					if((_shop == "cop") && ((call life_coplevel) == 8) && !license_cop_gangfirma) then {_return =
		["Inspector Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4",
					"rhs_weap_m16a4_grip","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","RH_compm4s","RH_SFM952V",
					"hlc_rifle_vendimus",
					"hlc_rifle_Bushmaster300","29rnd_300BLK_STANAG","rhsusf_acc_ACOG3","FHQ_optic_HWS_G33",
					"rhs_weap_m14ebrri","20Rnd_762x51_Mag","FHQ_optic_LeupoldERT",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15",
					"Laserdesignator","HandGrenade_Stone","pmc_earpiece","B_UavTerminal"]
					]};

					if((_shop == "cop") && ((call life_coplevel) >= 9) && !license_cop_gangfirma) then {_return =
		["Detective Shop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"CUP_sgun_M1014","CUP_8Rnd_B_Beneli_74Slug",
					"hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",
					"hlc_rifle_hk53","hlc_30rnd_556x45_b_HK33","hlc_optic_accupoint_g3",
					"hlc_rifle_M4",
					"rhs_weap_m16a4_grip","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","RH_compm4s","RH_SFM952V",
					"hlc_rifle_vendimus",
					"hlc_rifle_Bushmaster300","29rnd_300BLK_STANAG","rhsusf_acc_ACOG3","FHQ_optic_HWS_G33",
					"rhs_weap_m14ebrri","20Rnd_762x51_Mag","FHQ_optic_LeupoldERT",
					"hlc_rifle_psg1","hlc_20rnd_762x51_b_G3",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15",
					"Laserdesignator","HandGrenade_Stone","pmc_earpiece","B_UavTerminal"]
					]};
				};

	case "copswat": {if((_shop == "copswat") && (playerSide == west) && license_cop_swat) then {_return =
		["SWAT Ausrüstung",
					["RH_p226","RH_15Rnd_9x19_SIG","RH_suppr9",
					"RH_g18","RH_33Rnd_9x19_g18","RH_gemtech9",
					"RH_usp","RH_12Rnd_45cal_usp","RH_aacusp","RH_gemtech45","RH_osprey","RH_fhusp",
					"RH_X2","RH_M6X","RH_X300",
					"hlc_smg_mp510","hlc_30Rnd_10mm_B_MP5",
					"hlc_smg_mp5sd6","hlc_30Rnd_9x19_SD_MP5",
					"CUP_arifle_G36C_camo","CUP_muzzle_snds_G36_desert","CUP_optic_CompM2_Woodland","CUP_arifle_G36C","CUP_muzzle_snds_G36_black","CUP_optic_CompM2_Black",
					"hlc_rifle_CQBR","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green","hlc_muzzle_556NATO_KAC","RH_compm4s","RH_SFM952V",
					"arifle_MXC_Black_F","30Rnd_65x39_caseless_mag_Tracer",
					"hlc_rifle_g3ka4","hlc_20rnd_762x51_b_G3","hlc_20rnd_762x51_T_G3","hlc_20rnd_762x51_S_G3","hlc_muzzle_snds_g3",
					"hlc_rifle_vendimus",
					"hlc_rifle_Bushmaster300","29rnd_300BLK_STANAG",
					"rhs_weap_m14ebrri","20Rnd_762x51_Mag","FHQ_optic_LeupoldERT",
					"hlc_rifle_psg1","hlc_20rnd_762x51_b_G3",
					"arifle_SDAR_F","20Rnd_556x45_UW_mag",
					"srifle_LRR_F","7Rnd_408_Mag",
					"arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer",
					"rhsusf_acc_ACOG3","FHQ_optic_HWS_G33","FHQ_optic_ACOG","optic_Holosight","FHQ_optic_AC11704","FHQ_optic_AC12136",
					"RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","RH_peq2",
					"HandGrenade_Stone","SmokeShellBlue","Rangefinder","Laserdesignator","CUP_optic_AN_PVS_10","NVGoggles_OPFOR",
					"rhs_weap_M320","3Rnd_SmokeGreen_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareCIR_F","rhs_mag_rdg2_white","rhs_mag_rdg2_black",
					"rhs_weap_rpg7","rhs_acc_pgo7v","rhs_rpg7_OG7V_mag","rhs_rpg7_PG7VL_mag",
					"pmc_earpiece","B_UavTerminal"]
					]};
				};
	//FIRMA SECURITY
	case "firmaitems": {
					if((_shop == "firmaitems") && (playerSide == west) && license_cop_gangfirma) then {_return =
		["Firma Ausrüstung",
					["D41_Kaffee","D41_EnergyDrink","D41_Donuts",
					"D41_BombeWegMachtKit","D41_Strahler","D41_Dietrich",
					"D41_BenzinKanister","ItemGPS","Rangefinder","ToolKit","FirstAidKit","Medikit","ItemRadio","pmc_earpiece","NVGoggles","NVGoggles_OPFOR"]
					]};
				};

	case "firmawaffen":	{
					if((_shop == "firmawaffen") && ((call life_coplevel) == 1) && license_cop_gangfirma) then {_return =
		["Firma Rekrutenshop",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"hlc_smg_mp510","hlc_30Rnd_10mm_B_MP5",
					"optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_AC12136","optic_MRCO","optic_Arco","optic_Hamr",
					"acc_flashlight","acc_pointer_IR","FHQ_acc_LLM01L","RH_peq15","RH_peq15_top","RH_peq2","RH_peq2_top","RH_SFM952V","RH_SFM952V_tan"]
					]};

					if((_shop == "firmawaffen") && ((call life_coplevel) > 2) && ((call life_coplevel) < 5) && license_cop_gangfirma) then {_return =
		["Firma Mitglieder",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"RH_usp","RH_12Rnd_45cal_usp","RH_fhusp","RH_X2","RH_M6X","RH_X300",
					"hlc_smg_mp510","hlc_30Rnd_10mm_B_MP5",
					"hlc_rifle_RU5562","RH_M4A1_ris","30Rnd_556x45_Stanag",
					"optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_AC12136","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS",
					"acc_flashlight","acc_pointer_IR","FHQ_acc_LLM01L","RH_peq15","RH_peq15_top","RH_peq2","RH_peq2_top","RH_SFM952V","RH_SFM952V_tan"]
					]};

					if((_shop == "firmawaffen") && ((call life_coplevel) > 4) && license_cop_gangfirma) then {_return =
		["Firma Führung",
					["RH_mk2","RH_10Rnd_22LR_mk2",
					"RH_m9","RH_m9c","RH_15Rnd_9x19_M9",
					"RH_usp","RH_12Rnd_45cal_usp","RH_fhusp","RH_X2","RH_M6X","RH_X300",
					"hlc_smg_mp510","hlc_30Rnd_10mm_B_MP5",
					"hlc_rifle_RU5562","RH_M4A1_ris","30Rnd_556x45_Stanag",
					"arifle_MXM_Black_F","30Rnd_65x39_caseless_mag",
					"LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer",
					"optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_AC12136","optic_MRCO","optic_Arco","optic_Hamr","optic_SOS","optic_DMS","optic_LRPS",
					"acc_flashlight","acc_pointer_IR","FHQ_acc_LLM01L","RH_peq15","RH_peq15_top","RH_peq2","RH_peq2_top","RH_SFM952V","RH_SFM952V_tan",
					"B_UavTerminal"]
					]};
				};
	case "firmapiloten":	{
					if((_shop == "firmapiloten") && ((call life_coplevel) > 2) && license_cop_gangfirma && license_cop_air) then {_return =
		["Firma Piloten",
					["RH_usp","RH_12Rnd_45cal_usp","RH_fhusp","RH_X2","RH_M6X","RH_X300",
					"hlc_smg_mp5a4","hlc_30Rnd_9x19_B_MP5",
					"optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_AC12136","optic_MRCO","optic_Arco","optic_Hamr",
					"acc_flashlight","acc_pointer_IR","FHQ_acc_LLM01L","RH_peq15","RH_peq15_top","RH_peq2","RH_peq2_top","RH_SFM952V","RH_SFM952V_tan"]
					]};
				};

	//REBELLEN
	case "rebel": {if((_shop == "rebel") && license_civ_rebel && (life_D41_Karma <= -2000)) then {_return =
		["Rebellenmarkt",
					["D41_WaterBottle","D41_EnergyDrink","D41_Apfelschnaps","D41_Pfirsichschnaps","D41_Hasenfleisch","D41_BeefJerky",
					"D41_BenzinKanister","D41_Dietrich","D41_Bolzenschneider","D41_Sprengladung","D41_Kabelbinder","D41_LagerkisteKlein","D41_LagerkisteGross","D41_LagerkisteLagerhaus",
					"D41_Gartenschere","D41_Schaufel","D41_Schuerfgeschirr","D41_Bohrausruestung","D41_Spitzhacke",
					"Binocular","ItemMap","ItemCompass","ItemWatch","ItemGPS","ItemRadio","ToolKit","FirstAidKit","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR"]
					]};
				};

	case "rebelnorth": {
					if((_shop == "rebelnorth") && license_civ_rebel && (life_D41_Karma <= -2000) && (life_D41_Karma >= -2999)) then {_return =
		["Rebellenwaffen Pistolen",
					["RH_g17","RH_17Rnd_9x19_g17",
					"RH_kimber","RH_kimber_nw","RH_7Rnd_45cal_m1911",
					"RH_tec9","RH_32Rnd_9x19_tec","RH_X2","RH_M6X","RH_X300",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2"]
					]};

					if((_shop == "rebelnorth") && license_civ_rebel && (life_D41_Karma <= -3000) && (life_D41_Karma >= -5999)) then {_return =
		["Rebellenwaffen MPs",
					["RH_g17","RH_17Rnd_9x19_g17",
					"RH_kimber","RH_kimber_nw","RH_7Rnd_45cal_m1911",
					"RH_tec9","RH_32Rnd_9x19_tec","RH_X2","RH_M6X","RH_X300",
					"SMG_01_F","30Rnd_45ACP_Mag_SMG_01",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704","FHQ_optic_AC12136"]
					]};

					if((_shop == "rebelnorth") && license_civ_rebel && (life_D41_Karma <= -6000) && (life_D41_Karma >= -9999)) then {_return =
		["Rebellenwaffen Sturm",
					["RH_g17","RH_17Rnd_9x19_g17",
					"RH_kimber","RH_kimber_nw","RH_7Rnd_45cal_m1911",
					"RH_tec9","RH_32Rnd_9x19_tec","RH_X2","RH_M6X","RH_X300",
					"SMG_01_F","30Rnd_45ACP_Mag_SMG_01",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"CUP_arifle_G36A_camo","CUP_arifle_G36K_camo",
					"RH_M16A3","CUP_arifle_Mk16_CQC_FG","CUP_arifle_Mk16_STD_FG","30Rnd_556x45_Stanag_Tracer_Red",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704",
					"FHQ_optic_AC12136"]
					]};

					if((_shop == "rebelnorth") && license_civ_rebel && (life_D41_Karma <= -10000)) then {_return =
		["Rebellenwaffen Schwer",
					["RH_g17","RH_17Rnd_9x19_g17",
					"RH_kimber","RH_kimber_nw","RH_7Rnd_45cal_m1911",
					"RH_tec9","RH_32Rnd_9x19_tec","RH_X2","RH_M6X","RH_X300",
					"SMG_01_F","30Rnd_45ACP_Mag_SMG_01",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"CUP_arifle_G36A_camo","CUP_arifle_G36K_camo",
					"RH_M16A3","RH_Mk12mod1","CUP_arifle_Mk16_CQC_FG","CUP_arifle_Mk16_STD_FG","CUP_arifle_Mk16_SV","30Rnd_556x45_Stanag_Tracer_Red",
					"hlc_rifle_c1A1","hlc_20Rnd_762x51_T_fal",
					"CUP_srifle_CZ750","CUP_10Rnd_762x51_CZ750_Tracer",
					"CUP_srifle_M24_wdl","CUP_5Rnd_762x51_M24",
					"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag",
					"rhs_weap_rpg7","rhs_rpg7_PG7VL_mag",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704",
					"FHQ_optic_AC12136"]
					]};
				};

	case "rebelsouth": {
					if((_shop == "rebelsouth") && license_civ_rebel && (life_D41_Karma <= -2000) && (life_D41_Karma >= -2999)) then {_return =
		["Rebellenwaffen Pistolen",
					["RH_vp70","RH_18Rnd_9x19_VP",
					"CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom","CUP_acc_CZ_M3X",
					"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder",
					"RH_X2","RH_M6X","RH_X300",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2"]
					]};

					if((_shop == "rebelsouth") && license_civ_rebel && (life_D41_Karma <= -3000) && (life_D41_Karma >= -5999)) then {_return =
		["Rebellenwaffen MPs",
					["RH_vp70","RH_18Rnd_9x19_VP",
					"CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom","CUP_acc_CZ_M3X",
					"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder",
					"RH_X2","RH_M6X","RH_X300",
					"RH_vz61","RH_20Rnd_32cal_vz61",
					"RH_muzi","RH_30Rnd_9x19_UZI",
					"CUP_srifle_LeeEnfield","CUP_10x_303_M",
					"optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704","FHQ_optic_AC12136"]
					]};

					if((_shop == "rebelsouth") && license_civ_rebel && (life_D41_Karma <= -6000) && (life_D41_Karma >= -9999)) then {_return =
		["Rebellenwaffen Sturm",
					["RH_vp70","RH_18Rnd_9x19_VP",
					"CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom","CUP_acc_CZ_M3X",
					"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder",
					"RH_X2","RH_M6X","RH_X300",
					"RH_vz61","RH_20Rnd_32cal_vz61",
					"RH_muzi","RH_30Rnd_9x19_UZI",
					"hlc_rifle_aks74u","hlc_rifle_ak74_dirty","hlc_30Rnd_545x39_t_ak","rhs_weap_ak74m_2mag_camo","rhs_30Rnd_545x39_AK_green","rhs_acc_pkas",
					"CUP_arifle_CZ805_A1","30Rnd_556x45_Stanag_Tracer_Red",
					"hlc_optic_kobra","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704",
					"FHQ_optic_AC12136"]
					]};

					if((_shop == "rebelsouth") && license_civ_rebel && (life_D41_Karma <= -10000)) then {_return =
		["Rebellenwaffen Schwer",
					["RH_vp70","RH_18Rnd_9x19_VP",
					"CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom","CUP_acc_CZ_M3X",
					"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder",
					"RH_X2","RH_M6X","RH_X300",
					"RH_vz61","RH_20Rnd_32cal_vz61",
					"RH_muzi","RH_30Rnd_9x19_UZI",
					"hlc_rifle_aks74u","hlc_rifle_ak74_dirty","hlc_30Rnd_545x39_t_ak","rhs_weap_ak74m_2mag_camo","rhs_30Rnd_545x39_AK_green","rhs_acc_pkas",
					"CUP_arifle_CZ805_A1","30Rnd_556x45_Stanag_Tracer_Red",
					"rhs_weap_svds","rhs_weap_svdp_wd","rhs_10Rnd_762x54mmR_7N1","HLC_Optic_PSO1","rhs_acc_pso1m2",
					"CUP_srifle_CZ750","CUP_10Rnd_762x51_CZ750_Tracer",
					"rhs_weap_m249_pip","rhsusf_100Rnd_556x45_soft_pouch",
					"rhs_weap_rpg7","rhs_rpg7_PG7VL_mag",
					"hlc_optic_kobra","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr","acc_flashlight","acc_pointer_IR","RH_peq2","FHQ_optic_AC11704",
					"FHQ_optic_AC12136"]
					]};
				};

	//HERO-TRADER
	case "heroitems": {
					if((_shop == "heroitems") && (life_D41_Karma >= 2000) && !license_civ_rebel) then {_return =
		["Herotrader Markt",
					["D41_WaterBottle","D41_EnergyDrink","D41_Hasenfleisch","D41_BeefJerky",
					"D41_BenzinKanister","D41_Kabelbinder","D41_LagerkisteKlein","D41_LagerkisteGross","D41_LagerkisteLagerhaus",
					"Binocular","ItemMap","ItemCompass","ItemWatch","ItemGPS","ItemRadio","ToolKit","FirstAidKit","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR"]
					]};
				};

	case "herowaffen": {
					if((_shop == "herowaffen") && (life_D41_Karma >= 2000) && (life_D41_Karma <= 4999) && !license_civ_rebel) then {_return =
		["Hero Pistolen",
					["D41_TTrackerGummi","Gummigeschiss_Mag"]
					]};

					if((_shop == "herowaffen") && (life_D41_Karma >= 5000) && (life_D41_Karma <= 9999) && !license_civ_rebel) then {_return =
		["Hero MP",
					["D41_TTrackerGummi","Gummigeschiss_Mag",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","acc_flashlight",
					"SmokeShellGreen"]
					]};

					if((_shop == "herowaffen") && (life_D41_Karma >= 10000) && !license_civ_rebel) then {_return =
		["Hero Schwer",
					["D41_TTrackerGummi","Gummigeschiss_Mag",
					"hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5",
					"optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight_smg","acc_flashlight",
					"CUP_arifle_Mk16_CQC_EGLM","CUP_20Rnd_556x45_Stanag","CUP_1Rnd_SmokeGreen_M203",
					"CUP_optic_RCO_desert","CUP_optic_CompM2_Desert","FHQ_optic_HWS_G33_tan","CUP_optic_ELCAN_SpecterDR","FHQ_optic_ACOG_tan","FHQ_optic_AC11704_tan","optic_Arco","CUP_optic_Eotech533","optic_Hamr",
					"SmokeShellGreen","pmc_earpiece"]
					]};
				};

	//GANGS
	case "gangdmw": {
					if((_shop == "gangdmw") && license_civ_gangdmw) then {_return =
		["DMW Ausrüstung",
					["D41_WaterBottle","D41_Hasenfleisch","D41_BeefJerky","D41_EnergyDrink",
					"D41_Dietrich","D41_Bolzenschneider","D41_Sprengladung","D41_Kabelbinder","D41_BenzinKanister",
					"D41_Gartenschere","D41_Schaufel","D41_Schuerfgeschirr","D41_Bohrausruestung","D41_Spitzhacke",
					"ItemGPS","Rangefinder","ToolKit","FirstAidKit","ItemRadio","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","pmc_earpiece","TFAx_NVGoggles2"]
					]};
				};

	case "gangdmw_waffen": {
					if((_shop == "gangdmw_waffen") && license_civ_gangdmw) then {_return =
		["DMW Waffen",
					["RH_fnp45t","RH_15Rnd_45cal_fnp","RH_osprey","optic_MRD",
					"RH_g18","RH_33Rnd_9x19_g18","RH_gemtech9","RH_X300",
					"rhs_mag_rdg2_white","rhs_mag_rdg2_black",
					"hlc_smg_mp5k_PDW","hlc_30Rnd_9x19_GD_MP5","hlc_muzzle_Tundra",
					"CUP_arifle_G36C_camo","CUP_muzzle_snds_G36_desert","CUP_optic_CompM2_Woodland","CUP_optic_CompM2_Black",
					"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","RH_SFM952V_tan","RH_eotech553","RH_qdss_nt4","RH_compm4s","RH_SFM952V",
					"hlc_rifle_honeybadger","29rnd_300BLK_STANAG_T","muzzle_HBADGER",
					"CUP_srifle_M110","CUP_muzzle_snds_M110","CUP_20Rnd_762x51_B_M110",
					"rhsusf_acc_ACOG3","FHQ_optic_HWS_G33","FHQ_optic_ACOG","optic_Holosight","FHQ_optic_AC11704","FHQ_optic_AC12136","RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr",
					"optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","RH_peq2"]
					]};
				};

	//POW MIA
	case "gangpow": {if((_shop == "gangpow") && license_civ_gangpow) then {_return =
		["PowMia Markt",
					["D41_WaterBottle","D41_EnergyDrink","D41_Apfelschnaps","D41_Pfirsichschnaps","D41_Hasenfleisch","D41_BeefJerky",
					"D41_BenzinKanister","D41_Dietrich","D41_Bolzenschneider","D41_Sprengladung","D41_Kabelbinder",
					"Binocular","Rangefinder","ItemMap","ItemCompass","ItemWatch","ItemGPS","ItemRadio","ToolKit","FirstAidKit","NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","pmc_earpiece","TFAx_NVGoggles2"]
					]};
				};

	case "gangpow_waffen": {
					if((_shop == "gangpow_waffen") && license_civ_gangpow) then {_return =
		["PowMia Waffen",
					["RH_uspm","RH_16Rnd_40cal_usp",
					"hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag","RH_X2","RH_M6X","RH_X300",
					"hlc_rifle_bcmjack","RH_M4sbr_g","30Rnd_556x45_Stanag_Tracer_Red",
					"arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",
					"rhsusf_acc_ACOG3","FHQ_optic_HWS_G33","FHQ_optic_ACOG","optic_Holosight","FHQ_optic_AC11704","FHQ_optic_AC12136","RH_m3lr","optic_ACO_grn","optic_Aco","optic_MRCO","optic_Arco","optic_Hamr",
					"optic_SOS","optic_DMS","optic_LRPS","acc_flashlight","acc_pointer_IR","RH_peq2"]
					]};
				};

	//MASTERLISTEN Waffen
	case "leichtepistolen": {
					if((_shop == "leichtepistolen") && ((call life_adminlevel) > 2)) then {_return =
		["Leichte Pistolen",
					["RH_m9","RH_m9c","RH_15Rnd_9x19_M9",
					"RH_cz75","RH_16Rnd_9x19_CZ",
					"RH_fn57","RH_fn57_t","RH_fn57_g","RH_20Rnd_57x28_FN",
					"RH_g17","RH_17Rnd_9x19_g17",
					"RH_g18","RH_g19","RH_g19t","RH_19Rnd_9x19_g18","RH_33Rnd_9x19_g18",
					"RH_gsh18","RH_18Rnd_9x19_gsh",
					"RH_mak","RH_8Rnd_9x18_Mak",
					"hgun_P07_F","hgun_Rook40_F","16Rnd_9x21_Mag",
					"RH_mk2","RH_10Rnd_22LR_mk2",
					"RH_p226","RH_p226s","RH_15Rnd_9x19_SIG",
					"RH_sw659","RH_14Rnd_9x19_sw",
					"RH_tt33","RH_8Rnd_762_tt33",
					"RH_vp70","RH_18Rnd_9x19_VP"]
					]};
				};

	case "mittlerepistolen": {
					if((_shop == "mittlerepistolen") && ((call life_adminlevel) > 2)) then {_return =
		["Mittlere Pistolen",
					["CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom",
					"hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag",
                    "hgun_ACPC2_F","9Rnd_45ACP_Mag",
					"RH_fnp45","RH_fnp45t","RH_15Rnd_45cal_fnp",
					"RH_kimber","RH_kimber_nw","RH_m1911","RH_7Rnd_45cal_m1911",
					"RH_ttracker","RH_ttracker_g","RH_6Rnd_45ACP_Mag",
					"RH_usp","RH_12Rnd_45cal_usp",
                    "RH_uspm","RH_16Rnd_40cal_usp",
					"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]
					]};
				};

	case "schwerepistolen": {
					if((_shop == "schwerepistolen") && ((call life_adminlevel) > 2)) then {_return =
		["Schwere Pistolen",
					["RH_python","RH_6Rnd_357_Mag",
                    "RH_deagle","RH_Deagleg","RH_Deaglem","RH_Deagles","RH_7Rnd_50_AE",
					"RH_mp412","RH_6Rnd_357_Mag",
					"RH_bull","RH_bullb","RH_6Rnd_454_Mag",
					"RH_mateba","RH_6Rnd_44_Mag"]
					]};
				};

	case "pistolenattachments": {
					if((_shop == "pistolenattachments") && ((call life_adminlevel) > 2)) then {_return =
		["Pistolen Attachments",
					["CUP_acc_CZ_M3X",
                    "optic_MRD",
                    "optic_Yorris",
                    "RH_docter",
                    "RH_M6X",
                    "RH_X2",
                    "RH_X300",
                    "RH_Deflash",
					"RH_pmIR",
                    "muzzle_snds_acp",
                    "RH_m9qd",
                    "RH_gemtech9",
                    "muzzle_snds_L",
                    "RH_demz",
                    "RH_sfn57",
                    "RH_gemtech45",
                    "RH_osprey",
                    "RH_pmsd",
                    "RH_suppr9",
                    "RH_aacusp",
                    "RH_fhusp",
                    "RH_matchsd"]
					]};
				};

	case "leichtemps": {
					if((_shop == "leichtemps") && ((call life_adminlevel) > 2)) then {_return =
		["Leichte MPs",
					["RH_vz61","RH_20Rnd_32cal_vz61",
					"RH_muzi","RH_30Rnd_9x19_UZI",
					"RH_tec9","RH_32Rnd_9x19_tec"]
					]};
				};

	case "mittleremps": {
					if((_shop == "mittleremps") && ((call life_adminlevel) > 2)) then {_return =
		["Mittlere MPs",
					["hlc_smg_mp5k_PDW",
					"hlc_30Rnd_9x19_GD_MP5",
					"hgun_PDW2000_F",
					"SMG_02_F",
					"30Rnd_9x21_Mag",
					"hlc_smg_mp5a2",
					"hlc_smg_mp5a3",
					"hlc_smg_mp5a4",
					"hlc_smg_MP5N",
					"hlc_30Rnd_9x19_B_MP5"]
					]};
				};

	case "schweremps": {
					if((_shop == "schweremps") && ((call life_adminlevel) > 2)) then {_return =
		["Schwere MPs",
					["SMG_01_F",
					"30Rnd_45ACP_Mag_SMG_01",
					"hlc_smg_mp510",
					"hlc_30Rnd_10mm_B_MP5",
					"hlc_30Rnd_10mm_JHP_MP5",
					"hlc_smg_mp5sd5",
					"hlc_smg_mp5sd6",
					"hlc_30Rnd_9x19_SD_MP5",
					"hlc_rifle_hk53",
					"hlc_30rnd_556x45_b_HK33"]
					]};
				};

	case "mpattachments": {
					if((_shop == "mpattachments") && ((call life_adminlevel) > 2)) then {_return =
		["MP Attachments",
					["muzzle_snds_L",
					"muzzle_snds_acp",
					"RH_tecsd",
					"hlc_muzzle_Agendasix10mm",
					"hlc_muzzle_Agendasix",
					"hlc_muzzle_Tundra",
					"RH_muzisd"]
					]};
				};

	case "sturmleicht": {
					if((_shop == "sturmleicht") && ((call life_adminlevel) > 2)) then {_return =
		["Leichte Sturmgewehre",
					["rhs_weap_ak74m_2mag",
					"rhs_weap_ak74m_2mag_camo",
					"rhs_weap_ak74m",
					"rhs_weap_ak74m_folded",
					"rhs_weap_ak74m_camo",
					"rhs_weap_ak74m_desert",
					"rhs_acc_pso1m2",
					"rhs_acc_1p29",
					"rhs_acc_pkas",
					"rhs_30Rnd_545x39_AK",
					"rhs_30Rnd_545x39_AK_green",
					"hlc_rifle_ak12",
					"hlc_rifle_ak74",
					"hlc_rifle_ak74_dirty",
					"hlc_rifle_aks74",
					"hlc_rifle_aks74u",
					"hlc_rifle_aek971",
					"hlc_rifle_aku12",
					"hlc_30Rnd_545x39_S_AK",
					"hlc_30Rnd_545x39_B_AK",
					"hlc_30Rnd_545x39_EP_ak",
					"hlc_30Rnd_545x39_t_ak",
					"arifle_Mk20_plain_F",
					"arifle_Mk20_F",
					"arifle_Mk20C_plain_F",
					"hlc_rifle_M4",
					"hlc_rifle_CQBR",
					"arifle_Mk20C_F",
					"arifle_TRG20_F",
					"arifle_TRG21_F",
					"arifle_SDAR_F",
					"20Rnd_556x45_UW_mag"]
					]};
				};

	case "sturmmittel": {
					if((_shop == "sturmmittel") && ((call life_adminlevel) > 2)) then {_return =
		["Mittelschwere Stugmgewehre",
					["rhs_weap_m16a4",
					"rhs_weap_m16a4_carryhandle",
					"rhs_weap_m16a4_grip",
					"rhs_weap_m4",
					"rhs_weap_m4_carryhandle",
					"rhs_weap_m4_grip",
					"rhs_weap_m4a1",
					"rhs_weap_m4a1_grip",
					"hlc_rifle_RU5562",
					"hlc_rifle_RU556",
					"hlc_rifle_bcmjack",
					"hlc_rifle_Colt727",
					"RH_M16A2",
					"RH_M16A3",
					"RH_M16A4",
					"RH_M16A4_m",
					"RH_m4",
					"RH_M4_ris",
					"RH_M4A1_ris",
					"RH_M4sbr_b",
					"RH_M4sbr_g",
					"RH_M4sbr",
					"CUP_arifle_CZ805_A1",
					"CUP_arifle_CZ805_A2",
					"CUP_arifle_G36A",
					"CUP_arifle_G36A_camo",
					"CUP_arifle_G36C",
					"CUP_arifle_G36C_camo",
					"CUP_arifle_G36K",
					"CUP_arifle_G36K_camo",
					"CUP_arifle_L85A2",
					"CUP_arifle_L86A2",
					"CUP_arifle_Mk16_CQC",
					"CUP_arifle_Mk16_CQC_FG",
					"CUP_arifle_Mk16_CQC_SFG",
					"CUP_arifle_Mk16_CQC_EGLM",
					"CUP_arifle_Mk16_STD",
					"CUP_arifle_Mk16_STD_FG",
					"CUP_arifle_Mk16_SV",
					"CUP_20Rnd_556x45_Stanag",
					"30Rnd_556x45_Stanag",
					"30Rnd_556x45_Stanag_Tracer_Red",
					"30Rnd_556x45_Stanag_Tracer_Green",
					"arifle_Katiba_F",
					"arifle_Katiba_C_F",
					"30Rnd_65x39_caseless_green",
					"30Rnd_65x39_caseless_green_mag_Tracer",
					"arifle_MX_F",
					"arifle_MX_blk_F",
					"arifle_MX_Black_F",
					"arifle_MXC_F",
					"arifle_MXC_Black_F",
					"arifle_MXM_F",
					"arifle_MXM_Black_F",
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag_Tracer"]
					]};
				};
	case "sturmschwer": {
					if((_shop == "sturmschwer") && ((call life_adminlevel) > 2)) then {_return =
		["Schwere Sturmgewhere",
					["CUP_arifle_CZ805_B",
					"CUP_20Rnd_762x51_CZ805B",
					"CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B",
					"CUP_arifle_Mk17_CQC",
					"CUP_arifle_Mk17_CQC_FG",
					"CUP_arifle_Mk17_STD",
					"CUP_arifle_Mk17_STD_FG",
					"CUP_arifle_Mk20",
					"CUP_muzzle_mfsup_SCAR_H",
					"CUP_muzzle_snds_SCAR_H",
					"CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR",
					"CUP_20Rnd_762x51_B_SCAR",
					"hlc_rifle_honeybadger",
					"muzzle_HBADGER",
					"hlc_rifle_vendimus",
					"hlc_rifle_Bushmaster300",
					"29rnd_300BLK_STANAG",
					"29rnd_300BLK_STANAG_T",
					"29rnd_300BLK_STANAG_S",
					"RH_ar10",
					"RH_Delft",
					"RH_20Rnd_762x51_AR10",
					"hlc_rifle_falosw",
					"hlc_rifle_L1A1SLR",
					"hlc_rifle_STG58F",
					"hlc_rifle_c1A1",
					"hlc_rifle_FAL5061",
					"hlc_rifle_SLR",
					"hlc_rifle_SLRchopmod",
					"hlc_rifle_LAR",
					"hlc_20rnd_762x51_b_fal",
					"hlc_20Rnd_762x51_T_fal",
					"hlc_20rnd_762x51_s_fal",
					"hlc_rifle_hk51",
					"hlc_rifle_g3sg1",
					"hlc_rifle_g3a3",
					"hlc_rifle_g3ka4",
					"hlc_20rnd_762x51_b_G3",
					"hlc_20rnd_762x51_T_G3",
					"hlc_20rnd_762x51_S_G3",
					"hlc_rifle_ak47",
					"hlc_rifle_akm",
					"hlc_30Rnd_762x39_b_ak",
					"hlc_30Rnd_762x39_t_ak",
					"hlc_30rnd_762x39_s_ak",
					"srifle_EBR_F",
					"20Rnd_762x51_Mag",
					"srifle_DMR_01_F",
					"10Rnd_762x51_Mag",
					"hlc_rifle_M14",
					"hlc_rifle_m14sopmod",
					"hlc_20Rnd_762x51_B_M14",
					"hlc_20Rnd_762x51_T_M14",
					"hlc_20Rnd_762x51_S_M14"]
					]};
				};

	case "sniperleicht": {
					if((_shop == "sniperleicht") && ((call life_adminlevel) > 2)) then {_return =
		["Leichte Sniper",
					["hlc_rifle_SAMR",
					"hlc_rifle_samr2",
					"hlc_30rnd_556x45_S",
					"hlc_30rnd_556x45_SPR",
					"hlc_30rnd_556x45_SOST",
					"hlc_30rnd_556x45_EPR",
					"RH_Mk12mod1",
					"RH_SAMR",
					"CUP_srifle_LeeEnfield",
					"CUP_10x_303_M"]
					]};
				};

	case "snipermittel": {
					if((_shop == "snipermittel") && ((call life_adminlevel) > 2)) then {_return =
		["Mittelschwere Sniper",
					["CUP_srifle_CZ750",
					"CUP_10Rnd_762x51_CZ750_Tracer",
					"CUP_srifle_LeeEnfield",
					"CUP_10x_303_M",
					"CUP_srifle_VSSVintorez",
					"CUP_10Rnd_9x39_SP5_VSS_M",
					"CUP_optic_PSO_1",
					"CUP_optic_PSO_3",
					"hlc_rifle_psg1",
					"hlc_rifle_m14dmr",
					"hlc_rifle_M21",
					"hlc_20Rnd_762x51_B_M14",
					"hlc_20Rnd_762x51_T_M14",
					"hlc_20Rnd_762x51_S_M14",
					"rhs_weap_m14ebrri",
					"rhs_weap_svdp",
					"rhs_weap_svdp_wd",
					"rhs_weap_svds",
					"rhs_10Rnd_762x54mmR_7N1"]
					]};
				};

	case "sniperschwer": {
					if((_shop == "sniperschwer") && ((call life_adminlevel) > 2)) then {_return =
		["Schwere Sniper",
					["CUP_srifle_AWM_des",
					"CUP_srifle_AWM_wdl",
					"CUP_5Rnd_86x70_L115A1",
					"CUP_srifle_CZ550",
					"CUP_5x_22_LR_17_HMR_M",
					"CUP_srifle_M110",
					"CUP_20Rnd_762x51_B_M110",
					"CUP_20Rnd_TE1_White_Tracer_762x51_M110",
					"CUP_muzzle_snds_M110",
					"CUP_srifle_M24_ghillie",
					"CUP_srifle_M24_des",
					"CUP_srifle_M24_wdl",
					"CUP_srifle_M40A3",
					"CUP_5Rnd_762x51_M24",
					"rhs_weap_XM2010",
					"rhs_weap_XM2010_wd",
					"rhs_weap_XM2010_d",
					"rhs_weap_XM2010_sa",
					"rhsusf_acc_LEUPOLDMK4_2",
					"rhsusf_5Rnd_300winmag_xm2010",
					"srifle_GM6_F",
					"srifle_GM6_camo_F",
					"5Rnd_127x108_Mag",
					"srifle_LRR_F",
					"srifle_LRR_camo_F",
					"7Rnd_408_Mag"]
					]};
				};

	case "mgleicht": {
					if((_shop == "mgleicht") && ((call life_adminlevel) > 2)) then {_return =
		["Leichte MGs",
					["rhs_weap_m249_pip",
					"rhsusf_100Rnd_556x45_soft_pouch",
					"hlc_rifle_RPK12",
					"hlc_45Rnd_545x39_t_rpk",
					"CUP_arifle_MG36",
					"CUP_arifle_MG36_camo",
					"CUP_100Rnd_556x45_BetaCMag",
					"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag"]
					]};
				};

	case "mgmittel": {
					if((_shop == "mgmittel") && ((call life_adminlevel) > 2)) then {_return =
		["Mittlere MGs",
					["LMG_Mk200_F",
					"200Rnd_65x39_cased_Box",
					"200Rnd_65x39_cased_Box_Tracer",
					"arifle_MX_SW_F",
					"arifle_MX_SW_Black_F",
					"100Rnd_65x39_caseless_mag",
					"100Rnd_65x39_caseless_mag_Tracer"]
					]};
				};

	case "mgschwer": {
					if((_shop == "mgschwer") && ((call life_adminlevel) > 2)) then {_return =
		["Schwere MGs",
					["hlc_rifle_rpk",
					"hlc_75Rnd_762x39_m_rpk",
					"hlc_45Rnd_762x39_m_rpk",
					"hlc_45Rnd_762x39_t_rpk",
					"hlc_lmg_m60",
					"hlc_lmg_M60E4",
					"hlc_100Rnd_762x51_B_M60E4",
					"hlc_100Rnd_762x51_M_M60E4",
					"hlc_100Rnd_762x51_T_M60E4",
					"LMG_Zafir_F",
					"150Rnd_762x51_Box",
                    "150Rnd_762x51_Box_Tracer"]
					]};
				};

	case "rpg": {
					if((_shop == "rpg") && ((call life_adminlevel) > 2)) then {_return =
		["Raketenwerfer",
					["rhs_weap_rpg7",
					"rhs_acc_pgo7v",
					"rhs_rpg7_OG7V_mag",
					"rhs_rpg7_PG7VL_mag",
					"rhs_weap_rshg2",
					"rhs_rshg2_mag"]
					]};
				};

	case "schrot": {
					if((_shop == "schrot") && ((call life_adminlevel) > 2)) then {_return =
		["Schrotflinten",
					["hlc_rifle_saiga12k",
					"hlc_10rnd_12g_slug_S12",
					"hlc_10rnd_12g_buck_S12",
					"CUP_sgun_M1014",
					"CUP_8Rnd_B_Beneli_74Slug"]
					]};
				};
	case "sonstiges": {
					if((_shop == "sonstiges") && ((call life_adminlevel) > 2)) then {_return =
		["Sonstiges",
					["D41_TTrackerGummi",
					"Gummigeschiss_Mag",
					"CUP_1Rnd_SmokeGreen_M203",
					"SmokeShellGreen",
					"rhs_weap_M320",
					"3Rnd_SmokeGreen_Grenade_shell",
					"3Rnd_UGL_FlareWhite_F",
					"3Rnd_UGL_FlareCIR_F",
					"DemoCharge_Remote_Mag",
					"SatchelCharge_Remote_Mag"]
					]};
				};

	case "schalli": {
					if((_shop == "schalli") && ((call life_adminlevel) > 2)) then {_return =
		["Schalldämpfer",
					["hlc_muzzle_545SUP_AK",
					"muzzle_snds_B",
					"muzzle_snds_H",
					"RH_qdss_nt4",
					"RH_saker",
					"muzzle_snds_M",
					"hlc_muzzle_snds_M14",
					"hlc_muzzle_snds_fal",
					"RH_spr_mbs",
					"hlc_muzzle_556NATO_KAC",
					"hlc_muzzle_762SUP_AK",
					"hlc_muzzle_snds_HK33",
					"hlc_muzzle_snds_g3",
					"hlc_muzzle_300blk_KAC",
					"rhs_acc_tgpa",
					"CUP_muzzle_snds_G36_black",
					"CUP_muzzle_snds_G36_desert",
					"CUP_muzzle_mfsup_SCAR_L",
					"CUP_muzzle_snds_SCAR_L"]
					]};
				};

	case "llm": {
					if((_shop == "llm") && ((call life_adminlevel) > 2)) then {_return =
		["LL-M Rails",
					["acc_pointer_IR",
					"acc_flashlight",
					"RH_m16covers_f",
					"RH_m16covers_s",
					"RH_peq15",
					"RH_peq15_top",
					"RH_peq2",
					"rhsusf_acc_anpeq15",
					"RH_peq2_top",
					"RH_SFM952V",
					"RH_SFM952V_tan",
					"RH_m4covers_f",
					"RH_m4covers_s",
					"FHQ_acc_LLM01L"]
					]};
				};

	case "cqb": {
					if((_shop == "cqb") && ((call life_adminlevel) > 2)) then {_return =
		["CQB Scopes",
					["CUP_optic_CompM2_Woodland",
					"CUP_optic_CompM2_Black",
					"hlc_optic_kobra",
					"rhs_acc_1p63",
					"rhs_acc_ekp1b",
					"optic_ACO_grn",
					"optic_Aco",
					"optic_Holosight",
					"optic_ACO_grn_smg",
					"optic_Aco_smg",
					"optic_Holosight_smg",
					"RH_compm4s",
					"RH_t1",
					"RH_eotech553",
					"RH_shortdot",
					"RH_reflex",
					"FHQ_optic_AC12136",
					"FHQ_optic_AC11704_tan",
					"FHQ_optic_AC11704",
					"FHQ_optic_AIM",
					"FHQ_optic_AIM_tan",
					"RH_t1",
					"RH_eotech553",
					"RH_reflex",
					"rhs_acc_pkas",
					"FHQ_optic_MARS",
					"FHQ_optic_MARS_tan",
					"FHQ_optic_MicroCCO",
					"FHQ_optic_MicroCCO_tan",
					"FHQ_optic_MicroCCO_low",
					"FHQ_optic_MicroCCO_low_tan",
					"FHQ_optic_HWS",
					"FHQ_optic_HWS_tan",
					"CUP_optic_Eotech533",
					"CUP_optic_CompM2_Desert",
					"CUP_optic_CompM2_Woodland2"]
					]};
				};

	case "mid": {
					if((_shop == "mid") && ((call life_adminlevel) > 2)) then {_return =
		["Mid-Range Scopes",
					["rhsusf_acc_ACOG",
					"rhsusf_acc_ACOG3",
					"FHQ_optic_ACOG_tan",
					"RH_ta31rco",
					"FHQ_optic_ACOG",
					"FHQ_optic_HWS_G33",
					"FHQ_optic_HWS_G33_tan",
					"CUP_optic_ELCAN_SpecterDR",
					"HLC_Optic_1p29",
					"optic_Hamr",
					"RH_ta31rco_2D",
					"CUP_optic_SUSAT",
					"optic_MRCO",
					"optic_Arco",
					"RH_m3lr",
					"hlc_optic_PVS4M14",
					"hlc_optic_artel_m14",
					"hlc_optic_PVS4FAL",
					"hlc_optic_suit",
					"hlc_optic_accupoint_g3",
					"hlc_optic_PVS4G3",
					"HLC_Optic_ZFSG1",
					"rhsusf_acc_compm4",
					"rhsusf_acc_HAMR",
					"rhs_acc_1p29",
					"RH_m3lr",
					"CUP_optic_RCO_desert",
					"CUP_optic_RCO",
					"CUP_optic_ACOG"]
					]};
				};

	case "long": {
					if((_shop == "long") && ((call life_adminlevel) > 2)) then {_return =
		["Long-Range Scopes",
					["CUP_optic_SB_11_4x20_PM",
					"CUP_optic_SB_3_12x50_PMII",
					"HLC_Optic_PSO1",
					"optic_LRPS",
					"optic_DMS",
					"optic_SOS",
					"optic_NVS",
					"RH_m3lr",
					"rhsusf_acc_LEUPOLDMK4_2",
					"CUP_optic_AN_PVS_10",
					"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
					"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",
					"CUP_optic_LeupoldM3LR",
					"CUP_optic_LeupoldMk4",
					"CUP_optic_LeupoldMk4_MRT_tan",
					"CUP_optic_Leupold_VX3",
					"hlc_optic_LRT_m14",
					"rhs_acc_pso1m2",
					"rhsusf_acc_LEUPOLDMK4",
					"rhsusf_acc_LEUPOLDMK4_2",
					"FHQ_optic_LeupoldERT_tan",
					"FHQ_optic_LeupoldERT"]
					]};
				};

};

#include <macro.h>

//::::::::::::  ::::::::::::\\
//	Filename: D41/D41_sys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Lädt alle relevanten Daten und noch ein paar andere Dinge für die Altis-Life Distrikt41 Version
//::::::::::::  ::::::::::::\\

//:::::::::::: Distrikt41 Settings ::::::::::::\\

life_maskiert = 0; 			//Ist maskiert? 1 = Ja // 0 = nope
life_mauer = ObjNull;		//Platzierbare Begrenzung für Cops
life_strahler = ObjNull;	//Platzierbare Strahler für Cops
life_Blitzer = ObjNull;		//Platzierbare Blitzer für Cops
life_Schranke = ObjNull;	//Platzierbare Schranke für Cops
D41_BuyAble = 0;			//Item auf Lager? 0 = Nein || 1 = Ja
D41_IsBuying = 0;			//Bereits am kaufen? 0 = Nein ||1 = Ja
D41_WaffenProd = 0;			//Produziert gerade Waffen? 0 = Nein || 1 = Ja
D41_BenzinFuellen = 0;		//Im Tankstellenbereich? 0 = Nein || 1 = Ja
D41_geknueppelt = false;	//wurde niedergeschlagen?
D41_GaragenVerkauf = 0;		//im verkauf?
D41_KnastZ = 0;				//Macht gerade was am Knastzaun?
SzoneXW = [safezoneX + safezoneW - 0.89,0.50];	//was tolles
SzoneYH = [safezoneY + safezoneH - 1.28,0.7];	//nochwas tolles
D41_Tage = 0;									//wann ist die Periode des Servers wieder fällig? (Miete - muß gesetzt sein)
life_D41_Karma = 0;								//... is a bitch! (Karma-sys - muß gesetzt sein)
D41_MieteAbfrage = 0;							//macht Mietabfrage/zahlt gerade?
D41_HC_Timer = 0;								//Handschellentimer Sicherheitsabfrage
D41_Tankt = false;								//Tankt gerade? false = Nein || True = Ja
D41_BenzinPreis = 15;							//BenzinPreis-Standard
D41_KerosinPreis = 15;							//BenzinPreis-Standard
D41_TrawlerHorn = false;						//Horn blasen? höhö
D41_Counter = 0;								//Counter halt, nä?
D41_BlitzerCounter = 0;							//Wieviele Blitzer aufgestellt?
D41_WandeltUm = false;							//Verarbeitet gerade etwas?
D41_LagertEin = 0;								//Machta wat oda machta nix? 0 = nope || 1 = Yep
D41_AnimStop = 0;								//Meh, Anim Gespamme
D41_EarPlugInUse = false;						//Earplugs gerade in benutzung?
D41_GeGummigeschosst = false;					//wurde von Gummigeschoss getroffen?
fed_bank_building = nearestObject [[1543.5426,12932.632,16.641211],"Land_MilOffices_V1_F"]; //Federal Bank Gebäude?
D41_InUse = 0;									//Verhindern vom spammen der ShortCut Meldungen
D41_MedReqDone = false;							//Medic request gesendet

//:::::::::::: Distrikt41 Items, welche nicht gespeichert werden dürfen ::::::::::::\\

D41_DontSaveThat = ["D41_Blutkonserven","D41_Pizzas","D41_Teddybaer","D41_Gummibaum","D41_HeleneFischerCD","D41_Bankbauplan","D41_FalscherAusweis","D41_Faultierhoden","D41_Oel","D41_OelRoh","D41_Heroin","D41_HeroinRoh","D41_Cannabis","D41_CannabisRoh","D41_Salema","D41_Ornate","D41_Mackrele","D41_Tunfisch","D41_Mullet","D41_Katzenhai","D41_Schildkroete","D41_SchildkroetenSuppe","D41_Kupfer","D41_KupferRoh","D41_Eisen","D41_EisenRoh","D41_Kohle","D41_KohleRoh","D41_Glas","D41_Sand","D41_Salz","D41_SalzRoh","D41_Diamanten","D41_DiamantenRoh","D41_Kokain","D41_KokainRoh","D41_GoldBarren","D41_Sprengladung","D41_LagerkisteKlein","D41_LagerkisteGross","D41_LagerkisteLagerhaus","D41_Bruchstein","D41_Kalkstein","D41_Ton","D41_TonRoh","D41_Zement","D41_WaffenKomponenten","D41_Stahl","D41_Krabben","D41_Fahrzeugteile","D41_Kerosin"];

//:::::::::::: Distrikt41 Drogen/Alkohol ::::::::::::\\

life_DrogenKonsum = 0;		//setzt sich gerade n Schuß?
life_Junkie = 0;			//Drogenwert
life_AlkKonsum = 0;			//gerade am saufen?
life_Alkoholiker = 0;		//Alkoholpegel


//:::::::::::: Distrikt41 Maskiert - Itemliste ::::::::::::\\

D41_goggles_Array = ["rhs_scarf","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan","G_Bandanna_shades","G_Bandanna_beast"];
D41_uniform_Array = ["U_O_GhillieSuit","U_B_GhillieSuit","U_I_GhillieSuit"];
D41_headgear_Array = ["H_Shemag_olive","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive_hs","H_ShemagOpen_khk","LOP_H_Shemag_ISIS","H_ShemagOpen_tan"];
D41_hmd_Array = ["NVGoggles_mas_mask2_t","NVGoggles_mas_mask3","NVGoggles_mas_mask","NVGoggles_mas_mask_b","NVGoggles_mas_mask_t"];


life_fnc_D41_Anker =
	{
		if((vehicle player isKindOf "D41_Trawler") && ((speed vehicle player) < 4) && ((speed vehicle player) > -4) && !((speed vehicle player) == 0)) then {(vehicle player) setVelocity [0, 0, 0];};
	};

life_fnc_D41_KnastRep =
	{
		D41_KnastZaun setDammage 0;
	};

life_fnc_D41_GetMagName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgMagazines" >> _type >> "displayName");
	};

life_fnc_D41_GetMagPic =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgMagazines" >> _type >> "picture");
	};

life_fnc_D41_GetWpnName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgWeapons" >> _type >> "displayName");
	};
life_fnc_D41_GetWpnPic =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgWeapons" >> _type >> "picture");
	};

life_fnc_D41_GetVehName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgVehicles" >> _type >> "displayName");
	};
life_fnc_D41_GiveMoney =
	{
		createDialog "money";
		waitUntil {!isNull (findDisplay 4814)};
		_name = format["%1",name cursorTarget];
		_geld = format["%1",D41_Geld];
		ctrlSetText [4815, _name];
		ctrlSetText [2015, _geld];
	};

// Admin Rückerstattung
life_fnc_AdminMoney =
{
	createDialog "adminmoney";
	waitUntil {!isNull (findDisplay 5800)};
	_name = format["%1",name cursorTarget];
	ctrlSetText [5802, _name];
};
//:::::::::::: Distrikt41 WaffenProd ::::::::::::\\

life_D41_weapon_shop_array =
[
	["arifle_sdar_F",2],
	["hgun_P07_snds_F",2],
	["hgun_P07_F",2],
	["ItemGPS",2],
	["ToolKit",2],
	["FirstAidKit",2],
	["Medikit",2],
	["NVGoggles",2],
	["16Rnd_9x21_Mag",2],
	["20Rnd_556x45_UW_mag",2],
	["ItemMap",2],
	["ItemCompass",2],
	["hgun_Rook40_F",2],
	["arifle_Katiba_F",2],
	["30Rnd_556x45_Stanag",2],
	["20Rnd_762x51_Mag",2],
	["30Rnd_65x39_caseless_green",2],
	["DemoCharge_Remote_Mag",2],
	["SLAMDirectionalMine_Wire_Mag",2],
	["optic_ACO_grn",2],
	["acc_flashlight",2],
	["srifle_EBR_F",2],
	["arifle_TRG21_F",2],
	["optic_MRCO",2],
	["optic_Aco",2],
	["arifle_MX_F",2],
	["arifle_MXC_F",2],
	["arifle_MXM_F",2],
	["MineDetector",2],
	["optic_Holosight",2],
	["acc_pointer_IR",2],
	["arifle_TRG20_F",2],
	["SMG_01_F",2],
	["arifle_Mk20C_F",2],
	["30Rnd_45ACP_Mag_SMG_01",2],
	["30Rnd_9x21_Mag",2]
];
__CONST__(life_D41_weapon_shop_array,life_D41_weapon_shop_array);

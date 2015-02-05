/*
	File: fn_clothing_gangpow.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for PowMia Gang.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"PowMia Kleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_D41_Karma < -3000) then
		{
			_ret pushback ["LOP_U_ISIS_Fatigue_01",nil,550];
			_ret pushback ["TFA_SWE_wdl",nil,1320];
		};
		if(life_D41_Karma > 3000) then
		{
			_ret pushback ["TFA_ita_wdl",nil,1000];
			_ret pushback ["TFA_SWE_wdl",nil,1320];
		};
	};

	
	//Hats
	case 1:
	{
		if(life_D41_Karma < -3000) then
		{
			_ret pushback ["TFAX_H_HelmetIA_swe",nil,600];
			_ret pushback ["LOP_H_Shemag_ISIS",nil,120];
		};
		if(life_D41_Karma > 3000) then
		{
			_ret pushback ["TFAX_H_HelmetIA_ita",nil,600];
			_ret pushback ["TFAX_H_HelmetIA_swe",nil,600];
		};
	};


	//Glasses
	case 2:
	{
		if(life_D41_Karma < -3000) then
		{
			_ret pushback ["G_Bandanna_oli",nil,2];
			_ret pushback ["G_Shades_Blue",nil,2];
			_ret pushback ["G_Sport_Blackred",nil,2];
			_ret pushback ["G_Sport_Checkered",nil,2];
			_ret pushback ["G_Sport_Blackyellow",nil,2];
			_ret pushback ["G_Sport_BlackWhite",nil,20];
			_ret pushback ["G_Aviator",nil,20];
			_ret pushback ["G_Squares",nil,1];
			_ret pushback ["G_Balaclava_oli",nil,220];
			_ret pushback ["G_Bandanna_shades",nil,220];
			_ret pushback ["G_Bandanna_sport",nil,220];
			_ret pushback ["G_Bandanna_tan",nil,220];
			_ret pushback ["G_Bandanna_beast",nil,1300];
			_ret pushback ["G_Combat",nil,55];
		};
		if(life_D41_Karma > 3000) then
		{
			_ret pushback ["G_Bandanna_oli",nil,2];
			_ret pushback ["G_Shades_Blue",nil,2];
			_ret pushback ["G_Sport_Blackred",nil,2];
			_ret pushback ["G_Sport_Checkered",nil,2];
			_ret pushback ["G_Sport_Blackyellow",nil,2];
			_ret pushback ["G_Sport_BlackWhite",nil,20];
			_ret pushback ["G_Aviator",nil,20];
			_ret pushback ["G_Squares",nil,1];
			_ret pushback ["G_Balaclava_oli",nil,220];
			_ret pushback ["G_Bandanna_shades",nil,220];
			_ret pushback ["G_Bandanna_sport",nil,220];
			_ret pushback ["G_Bandanna_tan",nil,220];
			_ret pushback ["G_Bandanna_beast",nil,1300];
			_ret pushback ["G_Combat",nil,55];
		};
	};

	//Vest
	case 3:
	{
		if(life_D41_Karma < -3000) then
		{
			_ret pushback ["V_PlateCarrierL_CTRG",nil,5500];
			_ret pushback ["V_PlateCarrierInd_PMC_blk",nil,5500];
		};
		if(life_D41_Karma > 3000) then
		{
			_ret pushback ["TFAx_PlateCarrier_grn",nil,5500];
			_ret pushback ["V_PlateCarrierL_CTRG",nil,5500];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(life_D41_Karma < -3000) then
		{
			_ret pushback ["B_AssaultPack_cbr",nil,250];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_TacticalPack_oli",nil,350];
			_ret pushback ["B_TacticalPack_ocamo",nil,350];
			_ret pushback ["B_FieldPack_ocamo",nil,300];
			_ret pushback ["B_Bergen_sgg",nil,450];
			_ret pushback ["B_Kitbag_cbr",nil,450];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_Carryall_oli",nil,500];
			_ret pushback ["B_Carryall_khk",nil,500];
		};
		if(life_D41_Karma > 3000) then
		{
			_ret pushback ["B_AssaultPack_cbr",nil,250];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_TacticalPack_oli",nil,350];
			_ret pushback ["B_TacticalPack_ocamo",nil,350];
			_ret pushback ["B_FieldPack_ocamo",nil,300];
			_ret pushback ["B_Bergen_sgg",nil,450];
			_ret pushback ["B_Kitbag_cbr",nil,450];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_Carryall_oli",nil,500];
			_ret pushback ["B_Carryall_khk",nil,500];
		};
	};
};

_ret;
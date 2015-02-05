/*
	File: fn_clothing_luxus.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["D41_uniform_Profiteer1","Anzugjacke grau, schwarze Jogginghose",250],
			["D41_uniform_Profiteer2","Anzugjacke blau, blaue Jogginghose",270],
			["D41_uniform_Profiteer3","Anzugjacke grau, grau Jogginghose",260],
			["D41_uniform_Profiteer4","Anzugjacke braun karo, grau Jogginghose",260],
			["U_Marshal","weißes Poloshirt",2400],
			["U_NikosBody","Playboy",2400],
			["U_NikosAgedBody","Hemd u. Krawatte",4500],
			["D41_uniform_Functionary2","Anzug grau",9000],
			["D41_uniform_Functionary1","Anzug schwarz",12000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Hat_brown","Brauner Hut",12],
			["H_Hat_grey","Grauer Hut",13]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,2],
			["G_Sport_Checkered",nil,2],
			["G_Sport_Blackyellow",nil,2],
			["G_Sport_BlackWhite",nil,2],
			["G_Squares",nil,1],
			["G_Aviator",nil,10],
			["G_Lady_Mirror",nil,15],
			["G_Lady_Dark",nil,15],
			["G_Lady_Blue",nil,15],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,250],
			["B_Kitbag_mcamo",nil,450],
			["B_TacticalPack_oli",nil,350],
			["B_FieldPack_ocamo",nil,300],
			["B_Bergen_sgg",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oli",nil,500],
			["B_Carryall_khk",nil,500]
		];
	};
};
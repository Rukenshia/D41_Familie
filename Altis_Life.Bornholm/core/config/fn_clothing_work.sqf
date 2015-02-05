/*
	File: fn_clothing_work.sqf
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
			["D41_uniform_Woodlander1","Lederjacke dgrau, Arbeitshose dblau",85],
			["D41_uniform_Woodlander2","Lederjacke braun, Arbeitshose braun",87],
			["D41_uniform_Woodlander3","Lederjacke grau, Arbeitshose flecktarn",85],
			["D41_uniform_Woodlander4","Lederjacke schwarz, Arbeitshose braun",87],
			["D41_uniform_Villager1","Hemd hblau karo, Jeans hblau",62],
			["D41_uniform_Villager2","Hemd hbraun karo, Jeans dblau",65],
			["D41_uniform_Villager3","Hemd grün karo, Jeans braun",65],
			["D41_uniform_Villager4","Hemd weiß karo, Jeans hbraun",65],
			["D41_uniform_schoolteacher","Beamtenmantel",130],
			["D41_uniform_assistant","Werkstattmantel",150],
			["U_C_WorkerCoveralls","Lederkombi",250],
			["D41_uniform_Policeman","Sicherheitsdienst",550],
			["D41_uniform_priest","Priesterrobe",890]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_MilCap_blue","Sicherheitsdienst Mütze",52],
			["H_Cap_marshal","Mütze Gehörschutz",42],
			["H_HelmetCrew_I","Arbeitsschutzhelm",442],
			["H_Hat_grey","Hut grau",32]
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
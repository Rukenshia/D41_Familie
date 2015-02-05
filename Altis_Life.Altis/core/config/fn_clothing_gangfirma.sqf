#include <macro.h>
/*
	File: fn_clothing_gangfirma.sqf

	
	Description:
	Firma-Security Kleidung
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Firma Kleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["U_I_G_Story_Protagonist_F","Streife",500]];
			_ret set[count _ret,["U_B_CombatUniform_mcam_tshirt","Einsatz Shirt",1000]];
			_ret set[count _ret,["U_B_CombatUniform_mcam_vest","Einsatz kurz",1000]];
			_ret set[count _ret,["U_B_CombatUniform_mcam","Einsatz lang",1000]];
		};
		if(license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["U_B_HeliPilotCoveralls","Pilotenuniform 1",1000]];
			_ret set[count _ret,["U_O_PilotCoveralls","Pilotenuniform 2",1000]];
		};
	};
	
	//Hats
	case 1:
	{
		if((call life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_Beret_02",nil,200]];
		};
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,75]];
			_ret set[count _ret,["H_Cap_usblack",nil,100]];
			_ret set[count _ret,["rhsusf_patrolcap_ocp",nil,200]];
			_ret set[count _ret,["H_Watchcap_cbr",nil,300]];
			_ret set[count _ret,["rhsusf_ach_helmet_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_ach_helmet_ESS_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_ach_helmet_headset_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_ach_helmet_headset_ess_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_ach_helmet_camo_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_opscore_04_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_opscore_03_ocp",nil,1000]];
			_ret set[count _ret,["rhsusf_patrolcap_ocp",nil,200]];
		};
		if(license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["H_Cap_headphones","Muetze Kopfhoerer",300]];
			_ret set[count _ret,["H_CrewHelmetHeli_B","Pilotenhelm 1",1000]];
			_ret set[count _ret,["H_PilotHelmetHeli_B","Pilotenhelm 2",1000]];
		};
	};
	
	//Glasses
	case 2:
	{
			_ret set[count _ret,["G_Shades_Black",nil,25]];
			_ret set[count _ret,["G_Aviator",nil,25]];
			_ret set[count _ret,["G_Squares",nil,25]];
			_ret set[count _ret,["G_Lowprofile",nil,25]];
			_ret set[count _ret,["G_Combat",nil,25]];
			_ret set[count _ret,["Pomi_Goggles_Snd",nil,25]];
			_ret set[count _ret,["rhs_scarf",nil,25]];
	};
	
	//Vest
	case 3:
	{
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["V_PlateCarrierH_CTRG",nil,2000]];
			_ret set[count _ret,["rhsusf_iotv_ocp","Blank",2500]];
			_ret set[count _ret,["rhsusf_iotv_ocp_Medic","Medic",3000]];
			_ret set[count _ret,["rhsusf_iotv_ocp_Repair","Repair",3000]];
			_ret set[count _ret,["rhsusf_iotv_ocp_Rifleman","Rifleman",3000]];
			_ret set[count _ret,["rhsusf_iotv_ocp_SAW","MG",3000]];
			_ret set[count _ret,["rhsusf_iotv_ocp_Squadleader","Squadleader",3000]];
			_ret set[count _ret,["rhsusf_iotv_ocp_Teamleader","Teamleader",3000]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["rhsusf_assault_eagleaiii_ocp",nil,300],
			["B_Carryall_mcamo",nil,500],
			["B_Parachute",nil,300],
			["B_UAV_01_backpack_F",nil,15000]
		];
	};
};

_ret;
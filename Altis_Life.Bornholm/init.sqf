enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Bornholm Life RPG v3.1.4.8 EDIT by Distrikt41.de & Die Familie (V1.1)";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "core\D41\D41_Wetter.sqf";
[] execVM "core\D41\fn_D41_sysM.sqf";
enableEnvironment true;
setTerrainGrid 45;
StartProgress = true;

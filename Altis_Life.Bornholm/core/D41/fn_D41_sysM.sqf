#include <macro.h>

//::::::::::::  ::::::::::::\\
//	Filename: D41\fn_D41_sysM.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Lädt Marktsystem Daten für Distrikt41 Server
//::::::::::::  ::::::::::::\\

//:::::::::::: Distrikt41 Marktsystem ::::::::::::\\
diag_log [":::::::::::::::: Marktsystem geladen ::::::::::::::::"];

//:::::::::::: Distrikt41 Marktsystem (AKTIV) ::::::::::::\\

player getVariable "D41_KPreisliste";
player getVariable "D41_VPreisliste";

sleep 5;

while{true}do
{
	player getVariable "D41_KPreisliste";
	player getVariable "D41_VPreisliste";
	D41_KPreisApfel = D41_KPreisliste select 0;
	D41_VPreisApfel = D41_VPreisliste select 0;
	
	D41_KPreisPfirsich = D41_KPreisliste select 1;
	D41_VPreisPfirsich = D41_VPreisliste select 1;
	
	D41_KPreisApfelschnaps = D41_KPreisliste select 2;
	D41_VPreisApfelschnaps = D41_VPreisliste select 2;
	
	D41_KPreisPfirsichschnaps = D41_KPreisliste select 3;
	D41_VPreisPfirsichschnaps = D41_VPreisliste select 3;
	
	D41_KPreisheroinP = D41_KPreisliste select 4;
	D41_VPreisheroinP = D41_VPreisliste select 4;
	
	D41_KPreisoilp = D41_KPreisliste select 5;
	D41_VPreisoilp = D41_VPreisliste select 5;
	
	D41_KPreismarijuana = D41_KPreisliste select 6;
	D41_VPreismarijuana = D41_VPreisliste select 6;
	
	D41_KPreisbjerky = D41_KPreisliste select 7;
	D41_VPreisbjerky = D41_VPreisliste select 7;
	
	D41_KPreiscocainep = D41_KPreisliste select 8;
	D41_VPreiscocainep = D41_VPreisliste select 8;
	
	D41_KPreisdiamondc = D41_KPreisliste select 9;
	D41_VPreisdiamondc = D41_VPreisliste select 9;
	
	D41_KPreisiron_r = D41_KPreisliste select 10;
	D41_VPreisiron_r = D41_VPreisliste select 10;
	
	D41_KPreiscopper_r = D41_KPreisliste select 11;
	D41_VPreiscopper_r = D41_VPreisliste select 11;
	
	D41_KPreissalt_r = D41_KPreisliste select 12;
	D41_VPreissalt_r = D41_VPreisliste select 12;
	
	D41_KPreiscoal = D41_KPreisliste select 13;
	D41_VPreiscoal = D41_VPreisliste select 13;
	
	D41_KPreisglass = D41_KPreisliste select 14;
	D41_VPreisglass = D41_VPreisliste select 14;
	
	D41_KPreisApfelsaft = D41_KPreisliste select 15;
	D41_VPreisApfelsaft = D41_VPreisliste select 15;
	
	D41_KPreisPfirsichsaft = D41_KPreisliste select 16;
	D41_VPreisPfirsichsaft = D41_VPreisliste select 16;
	
	D41_KPreisTon = D41_KPreisliste select 17;
	D41_VPreisTon = D41_VPreisliste select 17;
	
	D41_KPreisZement = D41_KPreisliste select 18;
	D41_VPreisZement = D41_VPreisliste select 18;
	
	D41_KPreisWKomp = D41_KPreisliste select 19;
	D41_VPreisWKomp = D41_VPreisliste select 19;
	
	D41_KPreisStahl = D41_KPreisliste select 20;
	D41_VPreisStahl = D41_VPreisliste select 20;
	
	D41_KPreisFahrzeugteile = D41_KPreisliste select 21;
	D41_VPreisFahrzeugteile = D41_VPreisliste select 21;
	
	D41_KPreisKerosin = D41_KPreisliste select 22;
	D41_VPreisKerosin = D41_VPreisliste select 22;
	
	D41_KPreisKalkstein = D41_KPreisliste select 23;
	D41_VPreisKalkstein = D41_VPreisliste select 23;
	
	D41_KPreisKrabben = D41_KPreisliste select 24;
	D41_VPreisKrabben = D41_VPreisliste select 24;
	
	sleep 30;
};
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint "Picture in Picture (PIP) muß aktiviert werden, um die Kamera zu nutzen zu können!";};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "bank": {
		life_fed_scam camSetPos [7677.79,11694.5,33.9194];
		life_fed_scam camSetTarget [7629.68,11686.7,1.06304];
		life_fed_scam camCommit 0;
	};
	
	case "handel1": {
		life_fed_scam camSetPos [2025.89,6835.29,35.3125];
		life_fed_scam camSetTarget [1982.6,6841.51,2.00148];
		life_fed_scam camCommit 0;
	};
	
	case "handel2": {
		life_fed_scam camSetPos [15313.9,8959.61,71.3879] ;
		life_fed_scam camSetTarget [15380.9,8957.48,2.00142];
		life_fed_scam camCommit 0;
	};
	
	case "markt": {
		life_fed_scam camSetPos [9587.66,5565.64,47.9491];
		life_fed_scam camSetTarget [9534.08,5572.91,2.00151];
		life_fed_scam camCommit 0;
	};
	
	case "off" :{
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,""];
		life_fed_scam = nil;
	};
};

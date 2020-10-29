//MAKE SURE THE FUNCTIONS MODULE IS PLACED ON THE MAP

playsound "Intro";

showcinemaborder true;
enableradio false;
enableEnvironment false;

if ((date select 3) < 6 or (date select 3) > 19) then {camUseNVG true} else {camUseNVG false};

sleep 2.0;

_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];
titleCut ["", "BLACK IN", 10];

playsound "Somalia_News";

_camera camPrepareTarget [38159.43,6840.14,-94505.51];
_camera camPreparePos [5518.29,6092.47,0.20];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera;};

title = parsetext "<t size='2.0'>Uprising In Somalia</t><br />Al Shabab militias attack AMISOM bases in a frenzy of violence."; 
scroll = parsetext "  Al Jazheera reports Ethiopian troops committing atrocities - Bakhara Market bombing kills 300 - Mutilated bodies dumped in street were not CIA, says President - British troops in brawl with Blackwater mercenaries - AMISOM withdraws to Mogadishu Airport - US forces assassinate sheikh - Kenya closes border"; 
nul = [title,scroll] spawn BIS_fnc_AAN;


_camera camPrepareTarget [44423.54,89842.63,-38243.36];
_camera camPreparePos [5664.99,5913.75,58.96];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 30;
waitUntil {camCommitted _camera;};
3000 cuttext ["","plain"];

_camera camPrepareTarget [-91703.63,28076.92,16.98];
_camera camPreparePos [5882.59,6238.14,3.23];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera;};

[] execVM "Data\Scripts\IntroPics.sqf";

_camera camPrepareTarget [-93760.94,17571.40,-456.91];
_camera camPreparePos [4294.52,6694.71,59.23];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 30;
waitUntil {camCommitted _camera;};

player cameraEffect ["terminate","back"];
enableradio true;
enableEnvironment true;
titleCut ["", "BLACK IN", 6];
camDestroy _camera;

Sleep 10;

waitUntil {!(isNil "BIS_fnc_init")};
[str ("Operation Evolution") , str (30) + "." + str (08) + "." + str (2003) , str ("Mogadishu - Somalia")] spawn BIS_fnc_infoText;



// Outro script
// The Short intro
//if(debug) exitwith {};
enableradio false;

_camera = "camera" CamCreate [7654.78,11483.55,203.33];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";

_camera camPrepareTarget [-92066.10,4268.19,283.59];

_camera camPreparePos [7654.78,11483.55,203.33];

_camera camPrepareFOV 0.700;

_camera camCommitPrepared 0;

WaitUntil {camCommitted _camera};
titleCut["", "BLACK in",2];
sleep 1.0;

//TitleRsc["Evo","PLAIN"];
titleText [format["*** %1 ***",localize "STR_M04t137"], "PLAIN"];
playSound "Recall";



_camera camPrepareTarget [-92066.10,4268.19,283.59];

_camera camPreparePos [7654.78,11483.55,153.33];

_camera camPrepareFOV 0.700;

_camera camCommitPrepared 5;

waitUntil {camCommitted _camera};
sleep 4.0;
titleCut["","BLACK OUT", 2];
sleep 2;
player cameraEffect ["terminate","back"];

enableradio true;

camDestroy _camera;

BIS_EVO_end=true;
publicVariable "BIS_EVO_end";
ForceEnd;


// Arma 2 function

private ["_PosX","_PosY","_LeftMouseButtonDownLoc",
         "_StartWorldLoc","_EndWorldLoc","_SelectionBand","_BandSizeFromStart","_BandSize",
         "_BandCentreLoc"];

_PosX = _this select 0;
_PosY = _this select 1;

_LeftMouseButtonDownLoc = missionNamespace getVariable "HCExtLeftMouseButtonDownLoc";

_StartWorldLoc = (uinamespace getvariable "_MapView") ctrlmapscreentoworld _LeftMouseButtonDownLoc;
_EndWorldLoc = (uinamespace getvariable "_MapView") ctrlmapscreentoworld [_PosX, _PosY];

missionNamespace setVariable ["HCExtBandSelectEndLoc", _EndWorldLoc];

_BandSizeFromStart = [_EndWorldLoc, _StartWorldLoc] call F_VectorSub;
_BandSize = _BandSizeFromStart call F_VectorAbs;
_BandSize = [0.5, _BandSize] call F_VectorScale;

_BandCentreLoc = [0.5, _BandSizeFromStart] call F_VectorScale;
_BandCentreLoc = [_StartWorldLoc, _BandCentreLoc] call F_VectorAdd;

_SelectionBand = "HCExtSelectionBand";
_SelectionBand setMarkerAlphaLocal 1;
_SelectionBand setMarkerPosLocal _BandCentreLoc;
_SelectionBand setMarkerSizeLocal _BandSize;

nil;


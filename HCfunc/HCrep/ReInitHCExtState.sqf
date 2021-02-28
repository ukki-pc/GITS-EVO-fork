// Arma 2 function

private ["_SelectionBand"];

missionNamespace setVariable ["HCExtSelectedWaypoints", []];

missionNamespace setVariable ["HCExtLeftMouseButtonDownLoc", []];
missionNamespace setVariable ["HCExtRightMouseButtonDownLoc", []];
missionNamespace setVariable ["HCExtLeftMouseButtonHoldLoc", []];
missionNamespace setVariable ["HCExtRightMouseButtonHoldLoc", []];

missionNamespace setVariable ["HCExtCurrentMouseLoc", []];

missionNamespace setVariable ["HCExtBandSelectEndLoc", []];

missionNamespace setVariable ["HCExtCtrlHeld", false];
missionNamespace setVariable ["HCExtShiftHeld", false];
missionNamespace setVariable ["HCExtAltHeld", false];

_SelectionBand = "HCExtSelectionBand";
_SelectionBand setMarkerAlphaLocal 0;

missionNamespace setVariable ["HCExtMouseHoldCount", 0];

missionNamespace setVariable ["HCExtMode", "Standard"];

nil;

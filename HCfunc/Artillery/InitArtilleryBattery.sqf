// Arma 2 function

private ["_Group","_ArtilleryPieces","_ArtilleryObject","_LogicCenter","_ModuleGroup","_ArtilleryModule"];

_Group = _this select 0;
_ArtilleryPieces = + (_this select 1);

_ArtilleryObject = _ArtilleryPieces select 0;	

_LogicCenter = missionNamespace getVariable "HCExtLogicCenter";
//_LogicCenter = createCenter sideLogic;
_ModuleGroup = createGroup sideLogic;
_ArtilleryModule = _ModuleGroup createUnit ["BIS_ARTY_Logic", [0,0,0], [], 0, "NONE"]; 
//_ArtilleryModule synchronizeObjectsAdd [_ArtilleryObject];
_ArtilleryModule synchronizeObjectsAdd [leader _Group];

hintSilent format ["_LogicCenter = %1\n_ModuleGroup = %2\n_ArtilleryObject = %3\n_ArtilleryModule = %4",
                   _LogicCenter, _ModuleGroup, _ArtilleryObject, _ArtilleryModule];

//[_ArtilleryObject] call BIS_ARTY_F_initVehicle;
//processInitCommands;

//deleteVehicle _ArtilleryModule;
//deleteGroup _ModuleGroup;

_ArtilleryModule;

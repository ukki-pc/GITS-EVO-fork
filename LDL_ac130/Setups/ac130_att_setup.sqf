/*	ac130_att_setup.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_plane","_height"];

_plane = _this select 0;
_height = _this select 1;

waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

waitUntil{(!LDL_ac130_active)};

LDL_ac130_active = true;
LDL_plane_type = "AC130_ATTACH";
LDL_ac130_plane = _plane;

[LDL_AC130_Adjustments select 0,_height] call LDL_setVariables;

LDL_flyMode = 0;

//Create dialog
["AC130"]execVM "LDL_ac130\Dialog\dlg_create.sqf";

//Create the cam
LDL_ac130_cam = []call LDL_createCam;

//Start all scripts
[]spawn LDL_ac130_att_camera;
[]spawn LDL_ac130_att_main;
[]spawn LDL_ac130_blink;
[]spawn LDL_ac130_troops;
[]spawn LDL_ac130_sound;
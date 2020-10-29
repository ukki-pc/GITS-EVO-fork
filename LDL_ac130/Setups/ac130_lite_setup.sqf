/*	ac130_lite_setup.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_input", "_radius", "_height", "_delay"];

_input = _this select 0;
_radius = _this select 1;
_height = _this select 2;
_delay = _this select 3;

waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

waitUntil{(!LDL_ac130_active)};

LDL_ac130_active = true;
LDL_plane_type = "AC130_LITE";

if (typeName _input == "ARRAY") then
{
	if(_delay > 0) then
	{
		[_delay, "AC-130 available in:"]call LDL_ac130_delay;
	};
	
	LDL_cam_rotating_center setPos _input;
	
	[0,0,100]call LDL_ac130_createPlane;
	LDL_ac130_plane enableSimulation false;
	deleteVehicle LDL_ac130_pilot;
	
	//delete
	[LDL_ac130_plane]spawn
	{
		private["_plane"];
		
		_plane = _this select 0;
		waitUntil{sleep 1;(!LDL_ac130_active)};
		deleteVehicle _plane;
	};
	
	[_radius,_height] call LDL_setVariables;
};

if (typeName _input == "OBJECT") then
{
	LDL_ac130_plane = _input;

	[_radius,_height] call LDL_setVariables;
};

//Create dialog
["AC130"]execVM "LDL_ac130\Dialog\dlg_create.sqf";

//Create the cam
LDL_ac130_cam = []call LDL_createCam;

//Start all scripts
[]spawn LDL_ac130_lite_camera;
[]spawn LDL_ac130_lite_main;
[]spawn LDL_ac130_blink;
[]spawn LDL_ac130_troops;
[]spawn LDL_ac130_sound;
[]spawn LDL_ac130_interior;
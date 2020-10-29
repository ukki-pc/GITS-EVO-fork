/*	ac130_rot_setup.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_input", "_radius", "_height", "_sequence", "_pos", "_delay"];

_input = _this select 0;
_radius = _this select 1;
_height = _this select 2;
_sequence = _this select 3;
_delay = _this select 4;

waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

waitUntil{(!LDL_ac130_active)};

LDL_ac130_active = true;
LDL_plane_type = "AC130_ROTATE";

if (typeName _input == "ARRAY") then
{
	if(_delay > 0) then
	{
		[_delay, "AC-130 available in:"]call LDL_ac130_delay;
	};
	
	LDL_cam_rotating_center setPos _input;
	
	[_input]call LDL_ac130_createPlane;
	
	//delete
	[LDL_ac130_plane]spawn
	{
		private["_plane"];
		
		_plane = _this select 0;
		waitUntil{sleep 1;(!LDL_ac130_active)};
		deleteVehicle _plane;
		deleteVehicle LDL_ac130_pilot;
	};
	
	[_radius,_height] call LDL_setVariables;

	[LDL_ac130_plane, LDL_cam_rotating_center, LDL_cam_rotating_radius, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
	
	LDL_ac130_plane setDir (LDL_cam_rotating_angle - 90);
};
	
if (typeName _input == "OBJECT") then
{
	LDL_ac130_plane = _input;
	
	//fly
	[LDL_ac130_plane]spawn
	{
		private["_plane", "_vel"];
		
		_plane = _this select 0;
		waitUntil{sleep 1;(!LDL_ac130_active)};
		_plane enableSimulation true;
		_vel = [sin(getDir LDL_ac130_plane)*200,cos(getDir _plane)*200,0];
		_plane setVelocity _vel;
	};

	[_radius,_height] call LDL_setVariables;
	
	_pos = LDL_ac130_plane modelToWorld [_radius*-1,0,0];
	
	LDL_cam_rotating_center setPos [_pos select 0,_pos select 1,0];
	LDL_cam_rotating_height = getPosASL LDL_ac130_plane select 2; //TODO: take the height from the call argument
	LDL_cam_rotating_angle = [(getDir LDL_ac130_plane) + 90]call LDL_normalizeAngle;
	LDL_cam_dirh = [LDL_cam_rotating_angle-180]call LDL_normalizeAngle;
};

if(_sequence) then
{
	[getPos player]call LDL_camera_approach;
};

LDL_ac130_plane engineOn true;

LDL_flyMode = 1;

//Create dialog
["AC130"]execVM "LDL_ac130\Dialog\dlg_create.sqf";

//Create the cam
LDL_ac130_cam = []call LDL_createCam;

//Start all scripts
if(LDL_opticalZoom) then
{
	[]spawn LDL_ac130_rot_camera_opt;
}
else
{
	[]spawn LDL_ac130_rot_camera;
};
[]spawn LDL_ac130_rot_main;
[]spawn LDL_ac130_blink;
[]spawn LDL_ac130_troops;
[]spawn LDL_ac130_sound;
[]spawn LDL_ac130_rot_waypoints;
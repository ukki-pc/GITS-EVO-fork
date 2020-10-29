/*	ac130_AI_setup.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_input","_radius","_height","_pos","_delay"];

_input = _this select 0;
_radius = _this select 1;
_height = _this select 2;
LDL_endTimeAI = _this select 3;
_delay = _this select 4;

waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

LDL_ac130_active = true;
LDL_plane_type = "AC130_AI";

if(_delay > 0) then
{
	[_delay, "AC-130 Support available in:"]call LDL_ac130_delay;
};

if (typeName _input == "ARRAY") then
{
	
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

LDL_ac130_plane engineOn true;

LDL_flyMode = 0;

//Start all scripts
[]spawn LDL_ac130_AI_main;
[]spawn LDL_ac130_AI_shooting;
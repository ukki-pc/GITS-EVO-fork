/*	ac130_rot_camera.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_logic","_cam_fake", "_angles"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

waitUntil {sleep 0.1; (LDL_ac130_active)};

_logic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];
_cam_fake = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

while {LDL_ac130_active && !LDL_ac130_abort} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Angle for rotating (if plane is not heading to another position)
	//Due to synchronisation (avoid shaking camera) these lines are here (camera script)
	if(LDL_flyMode != 3) then
	{
		LDL_cam_rotating_angle = [LDL_cam_rotating_angle - 0.1]call LDL_normalizeAngle;
		LDL_plane_set_roll = -15;
	}
	else
	{
		LDL_plane_set_roll = 0;
	};
	
	//Plane position
	[LDL_ac130_plane, LDL_cam_rotating_center, LDL_cam_rotating_radius, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition; 
	
	//Camera
	if(LDL_viewMode == 0) then
	{
		//Interior
		
		//Variables
		LDL_cam_orientation_angle = LDL_cam_rotating_angle;
		
		//Fake Camera/Target Position
		[_cam_fake, LDL_cam_rotating_center, LDL_cam_rotating_radius-5, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
		[LDL_ac130_cam_target,_cam_fake,LDL_cam_dirh,90 - LDL_cam_dirv,5000]call LDL_setSphericPosition;
		[LDL_ac130_cam,_cam_fake,LDL_cam_dirh,90 - LDL_cam_dirv,500]call LDL_setSphericPosition;
	}
	else
	{
		//Exterior
		
		//Variables
		LDL_cam_orientation_angle = getDir LDL_ac130_plane + 90;
		
		//Camera/Target Position
		[LDL_ac130_cam_target, LDL_cam_rotating_center, LDL_cam_rotating_radius-50, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition; //Camera target rotates around the center
		[LDL_ac130_cam,LDL_ac130_cam_target,LDL_cam_dirh - 180,90 + LDL_cam_dirv,120]call LDL_setSphericPosition; //Camera rotates around the camera target
		
		//Guns
		_logic setPos (screenToWorld [0.5,0.5]);
		_angles = [LDL_gunPosition,_logic]call LDL_getObjectAngles;
		LDL_guns_dirh = [_angles select 0]call LDL_normalizeAngle;
		LDL_guns_dirv = [_angles select 1]call LDL_normalizeAngle;
	};
	
	//Camera script
	#include "Camera\camera.sqf"
	
	//Gunposition
	[LDL_gunPosition, LDL_cam_rotating_center, LDL_cam_rotating_radius-5, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
	
	//Commit camera changes
	#include "Camera\commitChanges.sqf"
};

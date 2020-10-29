/*	ac130_lite_camera.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id", "_logic"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

waitUntil {sleep 0.1; (LDL_ac130_active)};

_logic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

while {LDL_ac130_active && !LDL_ac130_abort} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Angle for rotating
	LDL_cam_rotating_angle = [LDL_cam_rotating_angle - 0.03]call LDL_normalizeAngle;
	
	//Camera
	//Variables
	LDL_cam_orientation_angle = LDL_cam_rotating_angle;

	//Camera/Target Position
	if(LDL_SystemsActivated && !LDL_planeInPosition) then
	{
		LDL_ac130_cam setPos (LDL_ac130_plane modelToWorld[-5,-5,-2]); 
	}
	else
	{
		[LDL_ac130_cam, LDL_cam_rotating_center, LDL_cam_rotating_radius, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition; //Camera rotates around the center	
	};
	
	[LDL_ac130_cam_target,LDL_ac130_cam,LDL_cam_dirh,90 - LDL_cam_dirv,5000]call LDL_setSphericPosition; //Camera target rotates around the camera
	
	//Camera script
	#include "Camera\camera.sqf"
	
	//Gunposition
	[LDL_gunPosition,LDL_ac130_cam,LDL_cam_dirh - 180,90 + LDL_cam_dirv,700]call LDL_setSphericPosition;
	
	//Commit camera changes
	#include "Camera\commitChanges.sqf"
};

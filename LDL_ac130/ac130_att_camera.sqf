/*	ac130_att_camera.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_logic", "_angles"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

waitUntil {sleep 0.1; (LDL_ac130_active)};

_logic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

while {LDL_ac130_active && !LDL_ac130_abort} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Camera
	LDL_cam_orientation_angle = getDir LDL_ac130_plane + 90;
	
	if(LDL_viewMode == 0) then
	{
		//Interior
		
		//Camera/Target Position
		if(LDL_plane_type == "UAV") then
		{
			LDL_ac130_cam setPos (LDL_ac130_plane modelToWorld[0,-5,-2]); //Camera is attached to the plane
		}
		else
		{
			LDL_ac130_cam setPos (LDL_ac130_plane modelToWorld[-5,-5,-2]); //Camera is attached to the plane
		};
		
		[LDL_ac130_cam_target,LDL_ac130_cam,LDL_cam_dirh,90 - LDL_cam_dirv,5000]call LDL_setSphericPosition;
	}
	else
	{
		//Exterior
		
		//Camera/Target Position
		LDL_ac130_cam_target setPos (LDL_ac130_plane modelToWorld[-50,0,0]); //Camera target is attached to the plane
		
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
	LDL_gunPosition setPos (LDL_ac130_plane modelToWorld[-5,-5,-2]);
	
	//Commit camera changes
	#include "Camera\commitChanges.sqf"	
};
/*	ac130_systems_pilot_main.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_pos","_dis","_alt","_inPosition","_M_ac130","_M_target","_M_ellipse","_bank","_yaw"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

titleText ["Get the AC-130 in the correct position relative to the target defined by your gunner: Distance (2500m - 4500m), Alt (more than 1500m), Left side of the plane facing target", "PLAIN"];

while {alive player && LDL_SystemsActivated} do
{	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	_pos = (LDL_ac130_plane getVariable "LDL_targetArea");
	LDL_cam_rotating_center setPos _pos;
	
	_bank = (LDL_ac130_plane call LDL_getPitchBank select 1);
	_yaw = (([LDL_ac130_plane, LDL_cam_rotating_center]call LDL_mando_angles) select 1)+90;
	_dis = ([getPos LDL_cam_rotating_center select 0, getPos LDL_cam_rotating_center select 1, 0] distance [getPos LDL_ac130_plane select 0, getPos LDL_ac130_plane select 1, 0]);
	_alt = (getPos LDL_ac130_plane) select 2;
	
	_M_ac130 = createMarkerLocal ["M_ac130", LDL_cam_rotating_center];
	_M_ac130 setMarkerShapeLocal "ICON";
	_M_ac130 setMarkerSizeLocal [1, 1];
	_M_ac130 setMarkerTypeLocal "Marker";	
	_M_ac130 setMarkerTextLocal "Target Area";
	
	_M_target = createMarkerLocal ["M_target", LDL_ac130_plane];
	_M_target setMarkerShapeLocal "ICON";
	_M_target setMarkerSizeLocal [1, 1];
	_M_target setMarkerTypeLocal "b_plane";	
	_M_target setMarkerDirLocal (getDir LDL_ac130_plane);
	_M_target setMarkerTextLocal "AC-130";
	
	_M_ellipse = createMarkerLocal ["M_ellipse", LDL_cam_rotating_center];
	_M_ellipse setMarkerShapeLocal "ELLIPSE";
	_M_ellipse setMarkerSizeLocal [_dis, _dis];
	_M_ellipse setMarkerBrushLocal "BORDER";	
	_M_ellipse setMarkerDirLocal 0;
	
	_inPosition = (_bank < 0 && _bank > -40 && _yaw < 90 && _yaw > -30 && _dis > 2500 && _dis < 4500 && _alt > 1500);
	LDL_ac130_plane setVariable ["LDL_inPosition", _inPosition, true];
	
	sleep 0.005;
		
	deleteMarkerLocal "M_ac130";
	deleteMarkerLocal "M_target";
	deleteMarkerLocal "M_ellipse";
};

deleteMarkerLocal "M_ac130";
deleteMarkerLocal "M_target";
deleteMarkerLocal "M_ellipse";
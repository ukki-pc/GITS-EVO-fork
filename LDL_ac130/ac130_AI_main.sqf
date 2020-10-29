/*	ac130_AI_main.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_secTotal","_ellipse","_ac130"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

waitUntil {sleep 0.1; (LDL_ac130_active)};

while {alive LDL_ac130_plane && alive player && !LDL_ac130_abort && LDL_ac130_active} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	LDL_cam_rotating_angle = [LDL_cam_rotating_angle - 0.1]call LDL_normalizeAngle;
	
	//Plane
	[LDL_ac130_plane, LDL_cam_rotating_center, LDL_cam_rotating_radius, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
	[LDL_gunPosition, LDL_cam_rotating_center, LDL_cam_rotating_radius-5, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
	
	LDL_ac130_plane setDir (LDL_cam_rotating_angle - 90);
	[LDL_ac130_plane,0,-15] call LDL_setPitchBank; //bank for the AC130
	
	if(LDL_endTimeAI > 0) then
	{
		//Countdown
		_secTotal = LDL_endTimeAI-(time-LDL_startTime);
		_secTotal = LDL_endTimeAI-(time-LDL_startTime);
		
		hintSilent format ["AC-130: %1",[_secTotal]call LDL_secondsToTime];
		
		if(_secTotal <= 0) then
		{
			LDL_ac130_abort = true;
			hintSilent "AC-130: 00:00:00";
		};
	};
	
	deleteMarkerLocal "Ellipse";
	deleteMarkerLocal "PlaneMark";
	
	_ellipse = createMarkerLocal ["Ellipse", LDL_cam_rotating_center];
	_ellipse setMarkerShapeLocal "ELLIPSE";
	_ellipse setMarkerSizeLocal [LDL_cam_rotating_radius, LDL_cam_rotating_radius];
	_ellipse setMarkerBrushLocal "BORDER";	
	_ellipse setMarkerDirLocal 0;
	
	_ac130 = createMarkerLocal ["PlaneMark", LDL_ac130_plane];
	_ac130 setMarkerShapeLocal "ICON";
	_ac130 setMarkerSizeLocal [1, 1];
	_ac130 setMarkerTypeLocal "b_plane";	
	_ac130 setMarkerDirLocal (getDir LDL_ac130_plane);
};

deleteMarkerLocal "Ellipse";
deleteMarkerLocal "PlaneMark";

LDL_ac130_abort = true;
LDL_ac130_active = false;
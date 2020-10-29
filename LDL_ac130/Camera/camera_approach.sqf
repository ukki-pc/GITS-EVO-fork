/*	camera_approach.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_cam"];

_cam = "camera" camcreate (_this select 0);
_cam cameraeffect ["internal", "back"];
showCinemaBorder false;
camUseNVG false;

_cam camSetPos (LDL_ac130_plane modelToWorld [-30,0,0]);
_cam camSetTarget LDL_ac130_plane;
_cam camCommit 3;

[_cam]spawn
{
	private ["_cam","_i"];
	
	_cam = _this select 0;
	
	for [{_i=0},{_i < 90},{_i = _i + 1}] do
	{
		sleep 0.002;
		
		[LDL_ac130_plane, LDL_cam_rotating_center, LDL_cam_rotating_radius, LDL_cam_rotating_angle, LDL_cam_rotating_height]call LDL_setCirclePosition;
		
		LDL_ac130_plane setDir (LDL_cam_rotating_angle - 90);
		LDL_cam_rotating_angle = [LDL_cam_rotating_angle - 0.1]call LDL_normalizeAngle;
		[LDL_ac130_plane,0,-15] call LDL_setPitchBank; //bank for the AC130	
		
		if(camCommitted _cam) exitWith{};
	};	
};

_cam camPrepareFov 0.01; 
_cam camCommitPrepared 2;

titleText ["", "BLACK OUT",2];

waitUntil{sleep 0.1;(camCommitted _cam)};

camDestroy _cam;
_cam cameraeffect ["terminate", "back"];

titleText ["", "BLACK IN",1];
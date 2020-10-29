/*	ac130_rot_waypoints.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_logic","_size","_vel","_weight","_volume","_rubbing","_color","_now","_i"];

_id = LDL_foreignScriptIdentifier;

_logic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

_size = [1*2];
_vel = [0,0,0];
_weight = 1.275;
_volume = 1;
_rubbing = 0;

waitUntil {sleep 0.1;(LDL_ac130_active)};

while {!LDL_ac130_abort && LDL_ac130_active} do
{
	sleep 0.01;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Show: LDL_Adjustments select 9
	
	if (!LDL_showWaypoints) then
	{
		waitUntil{sleep 0.1; (LDL_showWaypoints || !LDL_ac130_active || LDL_ac130_abort)};
		if (!LDL_ac130_active || LDL_ac130_abort) exitWith {};
	}
	else
	{
		if(LDL_flyMode != 3) then
		{
		
			if(LDL_flyMode == 2) then
			{
				_color = [[1,0.5,0,1],[1,0.5,0,1],[1,0.5,0,1]]; //orange
			}
			else
			{
				_color = [[0,1,0,1],[0,1,0,1],[0,1,0,1]]; //green
			};
			
			for [{_i=0},{_i < 360},{_i = _i + 5}] do 
			{
				sleep 0.01;
				_logic setPosASL [(getPos LDL_cam_rotating_center select 0)+sin(_i)*LDL_cam_rotating_radius,(getPos LDL_cam_rotating_center select 1)+cos(_i)*LDL_cam_rotating_radius, LDL_cam_rotating_height];
				drop["\Ca\Data\kouleSvetlo", "", "Billboard", 1, 7, getPos _logic, _vel, 0, _weight, _volume, _rubbing, _size, _color, [0, 1], 0, 0, "", "", ""];
			};
		
			_now = time;
			waitUntil{((time > _now + 5) || LDL_ac130_abort)};
		}
		else
		{
			sleep 1;
		};
	};
};



/*	ac130_systems_HUD_pilot.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private ["_id","_display","_screen","_bank","_yaw","_dis","_alt","_x","_y","_x2","_y2","_posX","_posY"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

LDL_RscLayer cutRsc["LDL_rsc_pilot", "PLAIN"];

while {alive player && LDL_SystemsActivated} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	_display = (UINameSpace GetVariable "LDL_rsc_pilot");
	
	if(isNull _display) then 
	{
		LDL_RscLayer cutRsc["LDL_rsc_pilot", "PLAIN"];
	};
	
	if(!isNull LDL_coopPartner) then
	{
		(_display DisplayCtrl 101) CtrlSetTextColor [0.2,1,0.2,1];
		(_display DisplayCtrl 101) CtrlSetText format["Crew: Gunner (%1)", name LDL_coopPartner];
	}
	else
	{
		(_display DisplayCtrl 101) CtrlSetTextColor [1,0,0,1];
		(_display DisplayCtrl 101) CtrlSetText "Crew: Gunner (N/A)";
	};
	
	_bank = floor(LDL_ac130_plane call LDL_getPitchBank select 1);
	_yaw = floor(([LDL_ac130_plane, LDL_cam_rotating_center]call LDL_mando_angles) select 1)+90;
	_dis = floor([getPos LDL_cam_rotating_center select 0, getPos LDL_cam_rotating_center select 1, 0] distance [getPos LDL_ac130_plane select 0, getPos LDL_ac130_plane select 1, 0]);
	_alt = floor((getPos LDL_ac130_plane) select 2);
	
	if(_bank < 0 && _bank > -40) then
	{
		(_display DisplayCtrl 102) CtrlSetTextColor [0.2,1,0.2,1];
	}
	else
	{
		(_display DisplayCtrl 102) CtrlSetTextColor [1,0,0,1];
	};
	
	if(_yaw < 90 && _yaw > -30) then
	{
		(_display DisplayCtrl 103) CtrlSetTextColor [0.2,1,0.2,1];
	}
	else
	{
		(_display DisplayCtrl 103) CtrlSetTextColor [1,0,0,1];
	};
	
	if(_dis > 2500 && _dis < 4500) then
	{
		(_display DisplayCtrl 104) CtrlSetTextColor [0.2,1,0.2,1];
	}
	else
	{
		(_display DisplayCtrl 104) CtrlSetTextColor [1,0,0,1];
	};
	
	if(_alt > 1500) then
	{
		(_display DisplayCtrl 107) CtrlSetTextColor [0.2,1,0.2,1];
	}
	else
	{
		(_display DisplayCtrl 107) CtrlSetTextColor [1,0,0,1];
	};
	
	(_display DisplayCtrl 102) CtrlSetText format["Roll: %1'", _bank];
	(_display DisplayCtrl 103) CtrlSetText format["Yaw: %1'", _yaw];
	(_display DisplayCtrl 104) CtrlSetText format["Dis: %1m", _dis];
	(_display DisplayCtrl 107) CtrlSetText format["Alt: %1m", _alt];
	(_display DisplayCtrl 108) CtrlSetText format["(i) 25mm: %1, 40mm: %2, 105mm: %3", LDL_ac130_plane getVariable "LDL_Ammo25", LDL_ac130_plane getVariable "LDL_Ammo40", LDL_ac130_plane getVariable "LDL_Ammo105"];

	_screen = worldToScreen (getPos LDL_cam_rotating_center);
	if ((count _screen) != 2) then
	{
		_screen = [-1,-1];
	};
	(_display displayCtrl 105) ctrlSetPosition [(_screen select 0) - 0.025,(_screen select 1) - 0.025];
	
	_x = SafeZoneX+SafeZoneW/8;
	_y = SafeZoneY+SafeZoneH/8;
	_x2 = _x+6*SafeZoneW/8;
	_y2 = _y+6*SafeZoneH/8;
	_posX = (((_screen select 0) + 0.025)max(_x))min(_x2);
	_posY = ((_screen select 1)max(_y))min(_y2);
	
	(_display displayCtrl 106) ctrlSetPosition [_posX,_posY];
	(_display displayCtrl 105) ctrlCommit 0;
	(_display displayCtrl 106) ctrlCommit 0;	
};

LDL_RscLayer cutText["", "PLAIN"];
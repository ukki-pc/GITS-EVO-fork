/*	ac130_systems_gunner_main.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_id"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

while {alive player && LDL_SystemsActivated} do
{
	sleep 0.005;
		
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	LDL_ac130_plane setVariable ["LDL_targetArea", getPos LDL_cam_rotating_center, true];
	LDL_planeInPosition = (LDL_ac130_plane getVariable "LDL_inPosition");
	
	if(!LDL_planeInPosition) then
	{
		(LDL_weaponSlots select 0) set[3, true];
		(LDL_weaponSlots select 1) set[3, true];
		(LDL_weaponSlots select 2) set[3, true];
	}
	else
	{
		(LDL_weaponSlots select 0) set[3, false];
		(LDL_weaponSlots select 1) set[3, false];
		(LDL_weaponSlots select 2) set[3, false];	
	};
};
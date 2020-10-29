/*	ac130_att_main.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_id", "_secTotal"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

waitUntil {sleep 0.1; (LDL_ac130_active)};

while {alive LDL_ac130_plane && alive player && !LDL_ac130_abort && LDL_dlg_display != "null"} do
{
	sleep 0.005;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Countdown
	if(LDL_endTime > 0) then
	{
		_secTotal = LDL_endTime-(time-LDL_startTime);
		
		if(_secTotal <= 0) then
		{
			LDL_ac130_abort = true;
		};
	};

	//Shooting
	if (LDL_mouseButtons select 0 && !(LDL_mouseButtons select 4) && LDL_dlg_display != "Map") then 
	{
		if((LDL_guns_enabled && LDL_viewMode == 1) || LDL_viewMode == 0) then
		{
			if(LDL_viewMode == 0) then
			{
				[getPos LDL_gunPosition,LDL_cam_dirh,LDL_cam_dirv]spawn LDL_ac130_guns;
			}
			else
			{
				[getPos LDL_gunPosition,LDL_guns_dirh,LDL_guns_dirv]spawn LDL_ac130_guns;
			};
		};
	};
};

[LDL_ac130_cam]call LDL_destroyCam;

//Close Dialog
LDL_dlg_display = "null";
[]call LDL_dlg_changeDisplay; 

//Remove DEH again on exit
(findDisplay 46) displayRemoveEventHandler ["keyDown",LDL_KeyDownDEH];
(findDisplay 46) displayRemoveEventHandler ["keyUp",LDL_KeyUpDEH];

//Update ammo count of the AC130 for all clients
LDL_ac130_plane setVariable ["LDL_Ammo25", (LDL_weaponSlots select 0)select 2, true];
LDL_ac130_plane setVariable ["LDL_Ammo40", (LDL_weaponSlots select 1)select 2, true];
LDL_ac130_plane setVariable ["LDL_Ammo105",(LDL_weaponSlots select 2)select 2, true];

LDL_ac130_abort = true;

LDL_ac130_active = false;
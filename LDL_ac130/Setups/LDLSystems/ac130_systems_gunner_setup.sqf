/*	ac130_systems_gunner_setup.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

waitUntil {!isNil "LDL_initDone"};
waitUntil {LDL_initDone};

waitUntil{(!LDL_ac130_active)};

if(!LDL_SystemsActivated) then
{
	LDL_SystemsActivated = true;
	playSound "LDL_beep_short";
	hintSilent "COOP started.";
	
	LDL_PublicLDLSystem_action_gunner = [player, LDL_ac130_plane, true];
	publicVariable "LDL_PublicLDLSystem_action_gunner";
	
	LDL_ac130_active = true;
	LDL_plane_type = "AC130_COOP";
	LDL_planeInPosition = false;
	
	[900, 800] call LDL_setVariables;

	//Create dialog
	["Map"]execVM "LDL_ac130\Dialog\dlg_create.sqf";
	
	waitUntil{(LDL_dlg_display == "Map")};
	
	//Create the cam
	LDL_ac130_cam = []call LDL_createCam;

	//Start all scripts
	[]spawn LDL_ac130_systems_gunner_main;
	[]spawn LDL_ac130_lite_main;
	[]spawn LDL_ac130_lite_camera;
	[]spawn LDL_ac130_blink;
	[]spawn LDL_ac130_troops;
	[]spawn LDL_ac130_sound;
	[]spawn LDL_ac130_interior;
	
	while{LDL_SystemsActivated} do
	{
		sleep 0.5;
	};
	
	LDL_ac130_abort = true;
	waitUntil{(!LDL_ac130_active)};
	
	LDL_PublicLDLSystem_action_gunner = [player, LDL_ac130_plane, false];
	publicVariable "LDL_PublicLDLSystem_action_gunner";
	
	playSound "LDL_beep_short";
	hintSilent "COOP stopped.";
}
else
{
	LDL_SystemsActivated = false;
};

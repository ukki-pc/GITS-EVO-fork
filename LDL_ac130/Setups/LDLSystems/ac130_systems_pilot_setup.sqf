/*	ac130_systems_pilot_setup.sqf by LurchiDerLurch for AC130-Script
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
	
	LDL_PublicLDLSystem_action_pilot = [player, LDL_ac130_plane, true];
	publicVariable "LDL_PublicLDLSystem_action_pilot";
	
	[]spawn LDL_ac130_systems_HUD_pilot;
	[]spawn LDL_ac130_systems_pilot_main;
	
	while{LDL_SystemsActivated} do
	{
		sleep 0.5;
	};
	
	LDL_PublicLDLSystem_action_pilot = [player, LDL_ac130_plane, false];
	publicVariable "LDL_PublicLDLSystem_action_pilot";
	
	playSound "LDL_beep_short";
	hintSilent "COOP stopped.";
}
else
{
	LDL_SystemsActivated = false;
};

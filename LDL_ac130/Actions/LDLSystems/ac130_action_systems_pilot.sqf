/*	ac130_action_systems_pilot.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(isNil "LDL_initDone") exitWith
{
	hintc "LDL Init not initialized or 'LDL AC-130 Init' ('Logics' -> 'LDL Logics') missing";
};

if(LDL_ac130_active) then
{
	hint "AC-130 is unavailable! Unable to start COOP.";
}
else
{
	[]spawn LDL_ac130_systems_pilot_setup;
};

//Gunner AI
/*
waitUntil{(LDL_SystemsActivated)};

hint "Gunner A.I. activated";
sleep 1;

LDL_ac130_plane setVariable ["LDL_planeCoPilot", player, true];
LDL_coopPartner = player;
LDL_ac130_plane setVariable ["LDL_targetArea", getPos test, true];

sleep 100;

LDL_coopPartner = objNull;
LDL_ac130_plane setVariable ["LDL_planeCoPilot", objNull, true];	
*/
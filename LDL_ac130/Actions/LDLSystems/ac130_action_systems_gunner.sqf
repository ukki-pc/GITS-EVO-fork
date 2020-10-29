/*	ac130_action_systems_gunner.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(isNil "LDL_initDone") exitWith
{
	hintc "LDL Init not initialized or 'LDL AC-130 Init' ('Logics' -> 'LDL Logics') missing";
};

if(LDL_ac130_plane getVariable "LDL_planeInUse" || LDL_ac130_active) then
{
	hint "AC-130 is unavailable! Unable to start COOP.";
}
else
{
	[]spawn LDL_ac130_systems_gunner_setup;		
};

//Pilot AI
/*
waitUntil{(LDL_SystemsActivated)};

hint "Pilot A.I. activated";
sleep 1;

LDL_ac130_plane setVariable ["LDL_inPosition", true, true];
LDL_ac130_plane setVariable ["LDL_planePilot", player, true];
LDL_coopPartner = player;

LDL_cam_rotating_center setPos getPos test;
*/
/*
_angle = 0;

while{true} do
{
	sleep 0.005;
	_angle = [_angle - 0.1]call LDL_normalizeAngle;
	[LDL_ac130_plane, test, 2000, _angle, 1500]call LDL_setCirclePosition;
	[]call LDL_ac130_correctAxis; 
};
*/

	
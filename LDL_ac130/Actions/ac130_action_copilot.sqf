/*	ac130_action_copilot.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(isNil "LDL_initDone") exitWith
{
	hintc "LDL Init not initialized or 'LDL AC-130 Init' ('Logics' -> 'LDL Logics') missing";
};

if(!(LDL_ac130_plane getVariable "LDL_planeInUse") && !LDL_ac130_active) then
{
	//[OBJECT, RADIUS]
	[LDL_ac130_plane,LDL_AC130_Adjustments select 0]call LDL_ac130_att_setup;
}
else
{
	hint "AC-130 is unavailable!";	
};
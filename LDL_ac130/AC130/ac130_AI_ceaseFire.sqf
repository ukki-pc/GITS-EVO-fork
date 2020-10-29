/*	ac130_AI_ceaseFire.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(LDL_AI_ceaseFire) then
{
	LDL_AI_ceaseFire = false;
	LDL_ac130_plane sideChat "Open Fire.";
}
else
{
	LDL_AI_ceaseFire = true;
	LDL_ac130_plane sideChat "Fire Ceased.";
};
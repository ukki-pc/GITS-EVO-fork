/*	range.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(LDL_plane_type == "AC130_LITE") then
{
	(_display displayctrl 205) ctrlSetText format ["Range: %1",round(((LDL_ac130_plane distance LDL_ac130_cam)min 3000) + (LDL_ac130_cam distance (screenToWorld [0.5,0.5])))];
}
else
{
	(_display displayctrl 205) ctrlSetText format ["Range: %1",round(LDL_ac130_plane distance (screenToWorld [0.5,0.5]))];
};
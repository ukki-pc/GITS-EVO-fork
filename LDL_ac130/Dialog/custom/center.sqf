/*	center.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_screen = worldToScreen (getPos LDL_cam_rotating_center);
if (count _screen != 2) then
{                              
	_screen = [-1,-1];
};  
(_display displayCtrl 210) ctrlSetPosition [(_screen select 0)-SafeZoneW/32,(_screen select 1)-SafeZoneH/32];
(_display displayCtrl 210) ctrlCommit 0;
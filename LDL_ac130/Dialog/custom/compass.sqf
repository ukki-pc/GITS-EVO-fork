/*	compass.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

for [{_i = 0;_j = 0},{_i < 360;_j < 4},{_i = _i + 90;_j = _j + 1}] do 
{
	_x = (0.5- 0.035 + sin(_i - LDL_cam_dirh)*(SafeZoneW/4 - SafeZoneW/100));
	_y = (0.5- 0.025 - cos(_i - LDL_cam_dirh)*(SafeZoneH/4 - SafeZoneH/100));
	
	(_display displayCtrl 211+_j) ctrlSetPosition [_x,_y];
	(_display displayCtrl 211+_j) ctrlCommit 0;
};
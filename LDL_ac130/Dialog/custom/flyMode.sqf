/*	flyMode.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(LDL_flyMode == 2) then
{
	_screen = (worldToScreen getPos LDL_destination);
	if (count _screen != 2) then
     		{                              
      		_screen = [-1,-1];
     		};
     		
     		(_display displayCtrl 215) ctrlShow true;
	(_display displayCtrl 215) ctrlSetPosition [(_screen select 0)-SafeZoneW/64,(_screen select 1)-SafeZoneH/64];
	(_display displayCtrl 215) ctrlCommit 0;
}
else
{
	(_display displayCtrl 215) ctrlShow false;	
};
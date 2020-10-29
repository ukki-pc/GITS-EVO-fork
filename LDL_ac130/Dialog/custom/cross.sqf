/*	cross.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(LDL_viewMode == 0) then

{

	(_display displayctrl 204) ctrlSetPosition [SafeZoneX + SafeZoneW/2 - SafeZoneW/8,SafeZoneY + SafeZoneH/2 - SafeZoneH/8,SafeZoneW/4,SafeZoneH/4];

};
if(LDL_viewMode == 1) then
{
	(_display displayctrl 204) ctrlSetPosition [SafeZoneX + SafeZoneW/2 - SafeZoneW/12,SafeZoneY + SafeZoneH/2 - SafeZoneH/12,SafeZoneW/6,SafeZoneH/6];			
};
(_display displayctrl 204) ctrlSetText ((LDL_weaponSlots select LDL_equippedWeapon)select 5); 
(_display displayctrl 204) ctrlCommit 0;
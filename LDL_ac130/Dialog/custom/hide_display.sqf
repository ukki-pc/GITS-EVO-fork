/*	hide_display.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

if(LDL_Adjustments select 3) then
{
	(_display displayctrl 1000) ctrlShow true;
}
else
{
	(_display displayctrl 1000) ctrlShow false;
};
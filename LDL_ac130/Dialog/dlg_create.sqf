/*	dlg_create.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

LDL_dlg_display = _this select 0;

createDialog "LDL_Monitor";

waitUntil{(dialog)};

//Buttons
[]call LDL_dlg_buttonInit;

//Show Camera
[]call LDL_dlg_hideAll;
[]call LDL_dlg_changeDisplay;
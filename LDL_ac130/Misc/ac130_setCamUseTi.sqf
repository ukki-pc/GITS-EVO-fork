/*	ac130_setCamUseTi.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_active", "_mode"];

_active = _this select 0;
_mode = _this select 1;

_active setCamUseTi _mode;
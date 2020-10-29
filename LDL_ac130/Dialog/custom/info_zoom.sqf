/*	info_zoom.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_structured = composeText [""];
_infos = 
[
	format ["Zoom: %1x",LDL_zoomLevel]
];
{
	_structured = composeText [_structured,_x,lineBreak];
} forEach _infos;
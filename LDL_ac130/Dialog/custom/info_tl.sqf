/*	info_tl.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_effect = switch(LDL_cameraEffect) do
{
	case 2:
	{
		"FLIR W";	
	};
	
	case 3:
	{
		"FLIR B";	
	};
	
	case 4:
	{
		"NVG";	
	};
	
	default
	{
		"";
	};
};
_structured = composeText [""];
_infos = 
[
	format ["H: %1�  V: %2�",round(LDL_cam_dirh),round(LDL_cam_dirv)],
	format ["Alt: %1m (%2m ASL)",round(getPos LDL_ac130_plane select 2),round(getPosASL LDL_ac130_plane select 2)],
	format[""],
	lineBreak,
	format ["%1",_effect]
];
{
	_structured = composeText [_structured,_x,lineBreak];
} forEach _infos;
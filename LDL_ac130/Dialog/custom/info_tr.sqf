/*	info_tr.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_structured = composeText [""];
_infos = 
[
	format ["%1 : %2",[date select 3]call LDL_transformNumber,[date select 4]call LDL_transformNumber],
	format ["%1",[(time-LDL_startTime)]call LDL_secondsToTime],
	format [""]
];
if(LDL_showStrobes) then
{
	_infos  = _infos + [parseText "<t size='0.6'>Infrared Strobe</t>"];
};
if(LDL_showVehicles) then
{
	_infos  = _infos + [parseText "<t size='0.6'>Vehicle Detection</t>"];
};
if(!LDL_enableSound) then
{
	_infos  = _infos + [parseText "<t size='0.6'>Sound disabled</t>"];
};
if(LDL_plane_type == "UAV" && !isNil "mando_missile_init_done") then
{
        _infos  = _infos + [parseText "<t size='0.6'>MMA enabled</t>"];
};
{
	_structured = composeText [_structured,_x,lineBreak];

} forEach _infos;
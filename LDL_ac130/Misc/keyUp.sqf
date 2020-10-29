/*	keyUp.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private["_dikCode"];
	
_dikCode = _this select 0;

//Flight Axis
if (_dikCode == 200) then
{
	//Up
	if(LDL_plane_type != "AC130_LITE") then
	{
		LDL_cam_rotating_set_height = LDL_cam_rotating_height-2;
	};	
};

if (_dikCode == 208) then
{
	//Down
	if(LDL_plane_type != "AC130_LITE") then
	{
		LDL_cam_rotating_set_height = LDL_cam_rotating_height+2; 
	};
};

if (_dikCode == 203) then
{
	//Left
	if(LDL_plane_type != "AC130_LITE") then
	{
		LDL_cam_rotating_set_radius = LDL_cam_rotating_radius; 
	};
};

if (_dikCode == 205) then
{
	//Right
	if(LDL_plane_type != "AC130_LITE") then
	{
		LDL_cam_rotating_set_radius = LDL_cam_rotating_radius; 
	};
};

//Misc
if(_dikCode == 29) then
{
	//Strg released
	setMousePosition LDL_dlg_mouseCtrlPos;
	LDL_dlg_strg_pressed = false;	
};
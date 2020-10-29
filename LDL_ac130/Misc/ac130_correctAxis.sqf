/*	ac130_correctAxis.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables	

//LDL_plane_roll = ([LDL_plane_roll]call LDL_normalizeAngle);
//LDL_plane_pitch = ([LDL_plane_pitch]call LDL_normalizeAngle);
	
//Radius
if(LDL_cam_rotating_set_radius != LDL_cam_rotating_radius) then
{
	LDL_cam_rotating_set_radius = 500 max LDL_cam_rotating_set_radius min 5000;
	LDL_cam_rotating_set_height = 100 max LDL_cam_rotating_set_height min 5000;
	
	if(abs(LDL_cam_rotating_set_radius - LDL_cam_rotating_radius) <= 1) then
	{
		LDL_cam_rotating_radius = LDL_cam_rotating_set_radius;
		LDL_plane_set_roll = -15;
	};
	
	if(LDL_cam_rotating_set_radius > LDL_cam_rotating_radius) then
	{
		LDL_cam_rotating_radius = (LDL_cam_rotating_radius + 1) min 5000;
		LDL_plane_set_roll = 15;
	};
	
	if(LDL_cam_rotating_set_radius < LDL_cam_rotating_radius) then
	{
		LDL_cam_rotating_radius = (LDL_cam_rotating_radius - 1) max 500;
		LDL_plane_set_roll = -15;
	};
};

//Height
if(LDL_cam_rotating_set_height != LDL_cam_rotating_height) then
{
	if(abs(LDL_cam_rotating_set_height - LDL_cam_rotating_height) <= 1) then
	{
		LDL_cam_rotating_height = LDL_cam_rotating_set_height;
		LDL_plane_set_pitch = 0;
	};
	
	if(LDL_cam_rotating_set_height > LDL_cam_rotating_height) then
	{
		LDL_cam_rotating_height = (LDL_cam_rotating_height + 0.5) min 5000;
		LDL_plane_set_pitch = 15;
	};
	
	if(LDL_cam_rotating_set_height < LDL_cam_rotating_height) then
	{
		LDL_cam_rotating_height = (LDL_cam_rotating_height - 0.5) max 100;
		LDL_plane_set_pitch = -15;
	};
};

//Roll
if(LDL_plane_roll != LDL_plane_set_roll) then
{
	if(abs(LDL_plane_roll - LDL_plane_set_roll) <= 1) then
	{
		LDL_plane_roll = LDL_plane_set_roll;
	};
	
	if(LDL_plane_set_roll > LDL_plane_roll) then
	{
		LDL_plane_roll = LDL_plane_roll + 1;
	};
	
	if(LDL_plane_set_roll < LDL_plane_roll) then
	{
		LDL_plane_roll = LDL_plane_roll - 1;
	};
};

//Yaw
/*
if(LDL_plane_yaw != LDL_plane_set_yaw) then
{
	if(abs(LDL_plane_yaw - LDL_plane_set_yaw) < 1) then
	{
		LDL_plane_yaw = LDL_plane_set_yaw;
	};
	
	if(LDL_plane_set_yaw > LDL_plane_yaw) then
	{
		LDL_plane_yaw = LDL_plane_yaw + 1;
	};
	
	if(LDL_plane_set_yaw < LDL_plane_yaw) then
	{
		LDL_plane_yaw = LDL_plane_yaw - 1;
	};
};
*/

//Pitch
if(LDL_plane_pitch != LDL_plane_set_pitch) then
{
	if(abs(LDL_plane_pitch - LDL_plane_set_pitch) <= 1) then
	{
		LDL_plane_pitch = LDL_plane_set_pitch;
	};
	
	if(LDL_plane_set_pitch > LDL_plane_pitch) then
	{
		LDL_plane_pitch = LDL_plane_pitch + 0.1;
	};
	
	if(LDL_plane_set_pitch < LDL_plane_pitch) then
	{
		LDL_plane_pitch = LDL_plane_pitch - 0.1;
	};
};

LDL_ac130_plane setDir ([LDL_cam_rotating_angle - 90]call LDL_normalizeAngle);
[LDL_ac130_plane, LDL_plane_pitch, LDL_plane_roll]call LDL_setPitchBank;
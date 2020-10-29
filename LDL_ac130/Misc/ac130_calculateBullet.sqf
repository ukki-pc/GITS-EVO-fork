/*	ac130_calculateBullet.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_dirh","_dirv","_weapon","_position","_spread","_r_sphere","_z","_x","_y","_shell","_vel","_i","_j","_color","_size","_tracer","_smoketrail","_light","_weight","_volume","_rubbing","_r"];

_dirh = _this select 0;
_dirv = _this select 1;
_weapon = _this select 2;
_position = _this select 3;

if(LDL_plane_type == "AC130_AI") then
{
	_spread = 0;
}
else
{
	_spread = (random 100)/500;
};

_dirh = _dirh + sin(random 360)*_spread;
_dirv = _dirv + cos(random 360)*_spread;

_r_sphere = 100;
_z = _r_sphere* cos(_dirv - 90);	
_r = sqrt(_r_sphere^2 - _z^2);
_x = sin(_dirh)*_r;
_y = cos(_dirh)*_r;

//Create shell
_shell = ((LDL_weaponSlots select _weapon)select 4) createVehicle _position;
_shell setPos _position;
_shell enableSimulation false;

(LDL_weaponSlots select _weapon) set [2, (((LDL_weaponSlots select _weapon)select 2)-1) max 0];

switch (_weapon) do
{
	//25mm
	case 0:
	{
		//Velocity
		_vel = [_x * 40,_y * 40,_z * 40];
		
		//Sound
		LDL_PublicLDLCannon25Sound = LDL_ac130_plane;
		publicVariable "LDL_PublicLDLCannon25Sound";
		LDL_ac130_plane say ["LDL_gun01",1];
		
		if(LDL_plane_type == "AC130_LITE" || LDL_plane_type == "AC130_COOP") then
		{
			sleep LDL_duration_25mm;	
		};
		
		_shell enableSimulation true; 
		
		//Particles
		#include "ac130_createParticleSource.sqf"
		LDL_PublicLDLCannon25FX = [_shell, _vel, _weapon, _position];
		publicVariable "LDL_PublicLDLCannon25FX";
		
		//Spread
		while {alive _shell} do
		{
			if(LDL_plane_type != "AC130_AI") then
			{
				 _x = sin(random 360)*0.2;
				 _y = sin(random 360)*0.2;
				 _z = sin(random 360)*0.2;
				 _shell setPos (_shell modelToWorld[_x,_y,_z]);
			};

			 sleep 0.1;
			 
			 _shell setVelocity _vel;
		};
	};
	
	//40mm
	case 1:
	{
		//Velocity
		_vel = [_x *40,_y * 40,_z * 40];
		
		//Ammo
		LDL_Ammo40 = LDL_Ammo40 - 1;
		
		//Sound
		LDL_PublicLDLCannon40Sound = LDL_ac130_plane;
		publicVariable "LDL_PublicLDLCannon40Sound";
		LDL_ac130_plane say ["LDL_gun02",1];
		
		if(LDL_plane_type == "AC130_LITE" || LDL_plane_type == "AC130_COOP") then
		{
			sleep LDL_duration_40mm;	
		}; 
		
		_shell enableSimulation true; 
		
		//Particles
		#include "ac130_createParticleSource.sqf"
		LDL_PublicLDLCannon40FX = [_shell, _vel, _weapon, _position];
		publicVariable "LDL_PublicLDLCannon40FX";
		
		//Spread
		while {alive _shell} do
		{
			if(LDL_plane_type != "AC130_AI") then
			{
				 _x = sin(random 360)*0.5;
				 _y = sin(random 360)*0.5;
				 _z = sin(random 360)*0.5;
				 _shell setPos (_shell modelToWorld[_x,_y,_z]);
			};

			 sleep 0.1;
			 
			 _shell setVelocity _vel;
		};
	};
	
	//105mm
	case 2:
	{
		//Velocity
		_vel = [_x * 40,_y * 40,_z * 40];
		
		//Ammo
		LDL_Ammo105 = LDL_Ammo105 - 1;
		
		//Sound
		LDL_PublicLDLCannon105Sound = LDL_ac130_plane;
		publicVariable "LDL_PublicLDLCannon105Sound";
		LDL_ac130_plane say ["LDL_gun03",1];
		
		if(LDL_plane_type == "AC130_LITE" || LDL_plane_type == "AC130_COOP") then
		{
			sleep LDL_duration_105mm;	
		};
		
		_shell enableSimulation true;  
		
		//Particles
		#include "ac130_createParticleSource.sqf"
		LDL_PublicLDLCannon105FX = [_shell, _vel, _weapon, _position];
		publicVariable "LDL_PublicLDLCannon105FX";
		
		if(LDL_bulletCam_enabled) then
		{
			[_shell]spawn LDL_ac130_bullet_cam;
		};
		
		//Spread
		while {alive _shell} do
		{
			sleep 0.1;
			
			 _shell setVelocity _vel;
		};
	};
};
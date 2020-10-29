/*	ac130_blink.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_fCreateLights","_units"];

_id = LDL_foreignScriptIdentifier;

// inline function to create the blinking lights at friendly units' position
_fCreateLights =
{
	private ["_position","_color","_size","_glowSize","_vel","_weight","_volume","_drag"];
	sleep (random 0.5);
	_position = _this select 0;
	_color = [[1,1,1,1],[1,1,1,1],[1,1,1,1]];
	_size = [1 * 3];
	_glowSize = [(1 * 3)/5];
	_vel = [0,0,0];
	_weight = 0;
	_volume = 0.005;
	_drag = 0.02;
	drop ["\Ca\Data\kouleSvetlo","","Billboard",1,4,_position,_vel,0,_weight,_volume,_drag,_size,_color,[0,1],0,0,"","",""];
	drop ["\Ca\Data\halfLight","","SpaceObject",1,4,_position,_vel,0,_weight,_volume,_drag,_glowSize,_color,[0,1],0,0,"","",""];
};

waitUntil {sleep 0.1;(LDL_ac130_active && LDL_showStrobes)};

sleep 1;
	
while {!LDL_ac130_abort && LDL_ac130_active} do
{
	sleep 0.01;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Enable: ((LDL_Adjustments select 0) select 0);
	//Show: ((LDL_Adjustments select 0) select 1);
		
	if (!LDL_showStrobes || !LDL_enableStrobes) then
	{
		waitUntil{sleep 0.1; ((LDL_showStrobes && LDL_enableStrobes) || !LDL_ac130_active || LDL_ac130_abort)};
		if (!LDL_ac130_active || LDL_ac130_abort) exitWith {};
	}
	else
	{
		_units = allUnits;
		{
			if (side _x == playerSide) then
			{
				[_x modelToWorld [0,0,1]] spawn _fCreateLights;
			};
		} forEach _units;
		sleep 1;
	};
};

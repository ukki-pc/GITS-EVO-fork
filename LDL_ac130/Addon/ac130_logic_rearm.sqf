/*	ac130_logic_rearm.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_logic", "_ac130_inUse"];

_logic = _this select 0;

sleep 3;

if(isNil "LDL_initDone") exitWith
{
	hintc "Missing 'LDL AC-130 Init' ('Logics' -> 'LDL Logics')";
};

while {true} do
{
	sleep 1;
	
	_ac130_inUse = (vehicle player) getVariable "LDL_planeInUse";	
	
	if(!isNil "_ac130_inUse") then 
	{
		if(!_ac130_inUse && ((vehicle player) distance _logic) <= 50) then 
		{
			[vehicle player]call LDL_ac130_rearm;
		};
	};
};
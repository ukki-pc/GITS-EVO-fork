/*	ac130_action_map.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_mapclicks"];

if(isNil "LDL_initDone") exitWith
{
	hintc "LDL Init not initialized or 'LDL AC-130 Init' ('Logics' -> 'LDL Logics') missing";
};

_mapclicks = player getVariable "LDL_AC130_Mapclicks";

if (isNil "_mapclicks") then
{
	player setVariable ["LDL_AC130_Mapclicks", 0, true];
	_mapclicks = 0;
};

if(!LDL_ac130_active && _mapclicks < LDL_AC130_Adjustments select 10) then
{
	titleText ["Open your map and single click.", "PLAIN"];

	onMapSingleClick 
	{
		titleText ["", "PLAIN"];
		[_pos]spawn
		{
			private["_pos"];
			_pos = _this select 0;
			
			player setVariable ["LDL_AC130_Mapclicks", ((player getVariable "LDL_AC130_Mapclicks") + 1), true];
			
			hint format ["%1 AC-130 left.", (LDL_AC130_Adjustments select 10) - (player getVariable "LDL_AC130_Mapclicks")];
			
			sleep 1;
			
			//[POSITION/OBJECT, RADIUS, HEIGHT, SEQUENCE, DELAY]
			[_pos,LDL_AC130_Adjustments select 0,LDL_AC130_Adjustments select 1,LDL_Adjustments select 6, LDL_AC130_Adjustments select 12]call LDL_ac130_rot_setup;
		};
		onMapSingleClick {};
	};
}
else
{
	hint "AC-130 is unavailable!";	
};
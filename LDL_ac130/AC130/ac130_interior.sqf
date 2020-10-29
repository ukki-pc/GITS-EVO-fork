/*	ac130_interior.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id"];

_id = LDL_foreignScriptIdentifier;

waitUntil {sleep 0.1;(LDL_ac130_active && LDL_enableSound)};

while {!LDL_ac130_abort && LDL_ac130_active} do
{
	if (!LDL_enableSound) then
	{
		waitUntil{sleep 0.1; (LDL_enableSound || !LDL_ac130_active || LDL_ac130_abort)};
		if (!LDL_ac130_active || LDL_ac130_abort) exitWith {};
	}
	else
	{
		playSound "LDL_Interior";
		//_now = time;
		//waitUntil{((time > _now + (8 + random 3)) || LDL_ac130_abort || !LDL_ac130_active)};
		
		sleep 2.8;
	};
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
};
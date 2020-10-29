/*	ac130_sound.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_sounds","_numberOfSounds"];

_id = LDL_foreignScriptIdentifier;

waitUntil {sleep 0.1;(LDL_ac130_active && LDL_enableSound)};

_sounds = ["LDL_Amb01","LDL_Amb02","LDL_Amb03","LDL_Amb04","LDL_Amb05","LDL_Amb06","LDL_Amb07","LDL_Amb08","LDL_Amb09","LDL_Amb10"];
_numberOfSounds = count _sounds;

while {!LDL_ac130_abort && LDL_ac130_active} do
{
	//Enable: (LDL_Adjustments select 5)
	if (!LDL_enableSound) then
	{
		waitUntil{sleep 0.1; (LDL_enableSound || !LDL_ac130_active || LDL_ac130_abort)};
		if (!LDL_ac130_active || LDL_ac130_abort) exitWith {};
	}
	else
	{
		playSound (_sounds select (random _numberOfSounds));
		//_now = time;
		//waitUntil{((time > _now + (8 + random 3)) || LDL_ac130_abort || !LDL_ac130_active)};
		
		sleep (8 + random 3);
	};
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
};
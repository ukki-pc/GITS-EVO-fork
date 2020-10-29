/*	ac130_pilot_activated.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//_player
//_plane
//_state


private ["_player","_state","_plane"];
if(LDL_isCopilot && LDL_ac130_plane == _plane) then
{
	if(_state) then
	{
		//Pilot has activated LDL-Systems
		LDL_coopPartner = _player;
		if(LDL_SystemsActivated) then
		{
			//hint format["You are gunner (LDL-Systems activated) and %1 (%2) activated LDL-Systems", _player, name _player];	
			hint format["Player %1 (Pilot) started COOP. Ready.", name _player];
		}
		else
		{
			//hint format["You are gunner (LDL-Systems deactivated) and %1 (%2) activated LDL-Systems", _player, name _player];
			hint format["Player %1 (Pilot) started COOP. No gunner. You need to activate LDL-Systems to start.", name _player];	
		};
	}
	else
	{
		//Pilot has deactivated LDL-Systems
		LDL_coopPartner = ObjNull;
		if(LDL_SystemsActivated) then
		{
			//hint format["You are gunner (LDL-Systems activated) and %1 (%2) deactivated LDL-Systems", _player, name _player];	
			hint format["Player %1 stopped COOP. No pilot.", name _player];
		}
		else
		{
			//hint format["You are gunner (LDL-Systems deactivated) and %1 (%2) deactivated LDL-Systems", _player, name _player];	
			hint format["Player %1 stopped COOP. No pilot. No gunner.", name _player];
		};
	};
};
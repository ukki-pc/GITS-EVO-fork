/*	ac130_gunner_activated.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//_player
//_plane
//_state


private ["_player","_state","_plane"];
if(LDL_isPilot && LDL_ac130_plane == _plane) then
{
	if(_state) then
	{
		//Gunner has activated LDL-Systems
		LDL_coopPartner = _player;	
		if(LDL_SystemsActivated) then
		{
			//hint format["You are pilot (LDL-Systems activated) and %1 (%2) activated LDL-Systems", _player, name _player];
			hint format["Player %1 (Gunner) started COOP. Ready.", name _player];
		}
		else
		{
			//hint format["You are pilot (LDL-Systems deactivated) and %1 (%2) activated LDL-Systems", _player, name _player];
			hint format["Player %1 (Gunner) started COOP. No pilot. You need to activate LDL-Systems to start!", name _player];	
		};
	}
	else
	{
		//Gunner has deactivated LDL-Systems
		LDL_coopPartner = ObjNull;	
		if(LDL_SystemsActivated) then
		{
			//hint format["You are pilot (LDL-Systems activated) and %1 (%2) deactivated LDL-Systems", _player, name _player];
			hint format["Player %1 stopped COOP. No gunner.", name _player];	
		}
		else
		{
			//hint format["You are pilot (LDL-Systems deactivated) and %1 (%2) deactivated LDL-Systems", _player, name _player];	
			hint format["Player %1 stopped COOP. No gunner. No pilot.", name _player];
		};
	};
};
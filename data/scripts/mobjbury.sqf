#include "macros.h"
// Deletes dead Enemy
_unit = _this select 0;
_killer = _this select 1;
_supKill = false;

if(LDL_ac130_active and isnull _killer ) then {_killer = player};
if((BIS_EVO_sup == player) and isnull _killer ) then {_killer = player; _supKill = true};



_dispname = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayName");	// different displayname for different languages
_msg = "";
_reward = 0;
/*
if !(isNil "_tag") then 
{
	switch (_tag) do //who died where?
	{
		case "INF":
		{
			_curtownInf = (BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 0;
			(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, _curtownInf-1];
			//systemChat format ["%1: Was killed by %2 ", name _unit,_mobjbury];
		};	
		case "MEC":
		{
			_curtownMec = (BIS_EVO_Mechanized select BIS_EVO_MissionProgress) select 0;
			(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0, _curtownMec-1];
		};
		default
		{
		};	
	};
};
*/
//Give rewards for the kiler end evaluate reward
if(isPlayer _killer) then 
{
	["sendToClient", [_killer,fnc_hitMark]] call CBA_fnc_whereLocalEvent;
	
	if(_killer isKindOf "Man") then 
	{
		_wp = currentWeapon _killer;

		//allItems = [assaultRifles,smgs,shotguns,pistols,rifles,launchers,mgs,miscs];
		//itemSkills = [perkAssaultLVL,perkEngLVL,perkEngLVL,5,perkSniperLVL,perkEngLVL,perkSupLVL,5];

		["jed_wpSkill", [_killer, _wp]] call CBA_fnc_whereLocalEvent;
	};
	
};

//Delete possible screen markers attached to this object
if(_unit getVariable ["spotid",0] != 0) then 
{
	[_unit] spawn
	{
		{["sendToClient", [_x,fnc_handleKIll,[_this select 0]]] call CBA_fnc_whereLocalEvent}forEach everyPlayer; //Network kill
		// {["sendToClient", [_x,fnc_changeScreenCtrl,[_this select 0,[0.4,0.4,0.4,1],5]]] call CBA_fnc_whereLocalEvent}forEach everyPlayer; //Network killer
		// sleep 10;
		// {["sendToClient", [_x,fnc_deleteScreenCtrl,[_this select 0]]] call CBA_fnc_whereLocalEvent}forEach everyPlayer; //Network killer
	};
};

local _lastHit = false;

//When you shoot something down
if(_killer == driver _unit or _killer == objNull) then 
{
	_killer = _unit getVariable ["lastHit",objnull];

	if(!isNull _killer) then {_lastHit = true};
};

if(isPlayer _killer or isPlayer leader _killer) then 
{	
	if ( (_unit isKindOf "Car")) then
	{
		_reward = 200;
	};
	if ( (_unit isKindOf "Plane")) then
	{
		_reward = 500;
	};
	if ( (_unit isKindOf "Helicopter")) then
	{
		_reward = 400;
	};
	if (_unit isKindOf "Man") then
	{
		_reward = 50;
	};
	if ( (_unit isKindOf "Tank")) then
	{
		_reward = 400;
	};
	if ( (_unit isKindOf "Ship")) then
	{	
		_reward = 500;
	};
	if ( (_unit isKindOf "StaticWeapon")) then
	{	
		_reward = 200;
	};

	_msg = format ["%1 ",_dispname];

	_aggr = 0;
	if(!isNil "_reward") then {_aggr = (ceil(_reward)/100);};
	
		
		//(!(isPlayer(gunner vehicle _killer)) and !(isPlayer (commander vehicle _killer))


		_playerAssist = ( !(isplayer _killer) and (isPlayer (leader _killer)) or _supKill or _lastHit);
		_playerAssistDriver = ((isplayer (driver vehicle _killer))  and !(_killer isKindOf "Man") and !(_killer isKindof "Air"));

		if (_playerAssist or _playerAssistDriver) then {_reward = round(_reward*0.7); _msg = "Assisted " + _msg; _killer = leader _killer;};


	["sendToClient", [_killer,fnc_hudmessage,[_msg,_reward]]] call CBA_fnc_whereLocalEvent;
};

	
/*
//Give data for strategic balance
	if ( (vehicle _killer isKindOf "Car")) then
	{
		//Mech focus
		MECHaggr = MECHaggr + _aggr;
	};
	if ( (vehicle _killer isKindOf "Plane")) then
	{
		//CAP Focus
		AIRaggr = AIRaggr + _aggr;
	};
	if ( (vehicle _killer isKindOf "Helicopter")) then
	{
		//AA Focus
		AAaggr = AAaggr + _aggr;
	};
	if (vehicle _killer isKindOf "Man") then
	{
		//Balanced focus
		MECHaggr = MECHaggr + _aggr;
	};
	if ( (vehicle _killer isKindOf "Tank")) then
	{
		//AT and Tank focus
		TANKaggr = TANKaggr + _aggr;
		ATaggr = ATaggr + _aggr;
	};
	if ( (vehicle _killer isKindOf "Ship")) then
	{	
		//ASW focus

	};
	if ( (vehicle _killer isKindOf "StaticWeapon")) then
	{	
		//Strike focus

	};
*/
	sleep 310.0;
	deleteVehicle _unit;

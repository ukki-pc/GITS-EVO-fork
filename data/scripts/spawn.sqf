
#include "macros.h"
// player spawn script
if (not (local player)) exitwith {};
_player = player;

removeAllWeapons _player;
{player addmagazine _x} forEach BIS_EVO_pallammo;
{player addweapon _x} forEach BIS_EVO_pweapons;


//backpacks
if  (rucksack != "") then 
{
	removeBackpack player; 
	player addBackpack rucksack;
	clearMagazineCargoGlobal unitBackpack player;
	clearWeaponCargoGlobal unitBackpack player;
	for "_i" from 0 to count (ruckmags select 0) - 1 do 
	{
		(unitBackpack player) addMagazineCargoGlobal [(ruckmags select 0) select _i, (ruckmags select 1) select _i];
	};
	for "_i" from 0 to count (ruckweap select 0) - 1 do 
	{
		(unitBackpack player) addWeaponCargoGlobal [(ruckweap select 0) select _i, (ruckweap select 1) select _i];
	};
};

// Grenade launcher Fix
_primary = primaryWeapon player;
if (_primary != "") then 
{
	player selectWeapon _primary;
	_muzzles = getArray(configFile>>"cfgWeapons" >> _primary >> "muzzles");
	player selectWeapon (_muzzles select 0);
};

Sleep 0.2;
player setSkill BIS_EVO_PlayerSkill;

_player addEventHandler ["killed", {handle = [(_this select 0),(_this select 1)] execVM "data\scripts\killed.sqf"}];
//_player addMPEventHandler  ["MPHit", {handle = [(_this select 0), (_this select 2)] execVM "data\scripts\handleDamage.sqf"}];

if(deathScorePenalty > 0) then 
{
	_player addEventHandler ["killed", {handle = [(_this select 0),(_this select 1)] execVM "data\scripts\rmScore.sqf"}];
};

Sleep 0.2;
0 setFog 0.0;
0 setOvercast 0.0;
0 setRain 0.0;

_playertype = typeOf (vehicle player);
Sleep 0.2;

//Initial player skills

//Maybe
if (perkSupLVL > 0) then { _actionId8 = player addAction ["GPS/INS Menu", "actions\GPSINS.sqf",[],0, false, true,"test2"]; _actionId8 = player addAction ["Deploy Recon HQ", "actions\ambtent.sqf",0,1, false, true,"test2"]};
if (perkEngLVL > 0) then { _actionId8 = player addAction [localize "STR_M04t53", "data\scripts\etent.sqf",0,1, false, true,"test2"]};
if ((perkparam == 1) and (gitsnades == 1)) then {

	//Turned off because gives an error
	//_monitor = [] execVM "Actions\EB_resources_scripts\EB_fuelactions.sqf"
	
};




/*

if (_playertype in EGG_EVO_PlayerMedic) then {_actionId8 = player addAction [localize "STR_M04t52", "data\scripts\mtent.sqf",0,1, false, true,"test2"]};
if (_playertype in EGG_EVO_PlayerEng) then {_actionId8 = player addAction [localize "STR_M04t53", "data\scripts\etent.sqf",0,1, false, true,"test2"]};

if ((_playertype in EGG_EVO_PlayerSniper) and (perkparam == 1)) then {_actionId8 = player addAction ["Short Ladder", "actions\static\makestatic.sqf",[_this,0],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerSniper) and (perkparam == 1)) then {_actionId8 = player addAction ["Long Ladder", "actions\static\makestatic.sqf",[_this,1],1,false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerGL) and (perkparam == 1)) then {_actionId8 = player addAction ["Build MK19 Nest", "actions\static\makestatic.sqf",[_this,2],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerAA) and (perkparam == 1)) then {_actionId8 = player addAction ["Build AntiAir Nest", "actions\static\makestatic.sqf",[_this,3],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerAT) and (perkparam == 1)) then {_actionId8 = player addAction ["Build Antitank Nest", "actions\static\makestatic.sqf",[_this,4],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerMG) and (perkparam == 1)) then {_actionId8 = player addAction ["Build MG Nest", "actions\static\makestatic.sqf",[_this,5],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerSniper) and (perkparam == 1)) then {_actionId8 = player addAction ["Build Camo Net", "actions\static\makestatic.sqf",[_this,6],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerPilot) and (perkparam == 1)) then {_actionId8 = player addAction ["Build Refuel Depot", "actions\static\makestatic.sqf",[_this,7],1, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerOff) and (perkparam == 1)) then {_actionId8 = player addAction ["Build Mortar", "actions\static\makestatic.sqf",[_this,8],1, false, true,"test2"]};


//test

if ((_playertype in EGG_EVO_PlayerSniper) and (perkparam == 1) and (gitsnades == 1)) then {_actionId8 = player addAction ["GPS/INS Menu", "actions\GPSINS.sqf",[],0, false, true,"test2"]};
if ((_playertype in EGG_EVO_PlayerPilot) and (perkparam == 1) and (gitsnades == 1)) then {_actionId8 = player addAction ["GPS/INS Menu", "actions\GPSINS.sqf",[],0, false, true,"test2"]};
//_gpsd = createDialog 'glt_airgpsmfd';
*/
//if ((_playertype in EGG_EVO_spytype) and (perkparam == 1) and (gitsnades == 1)) then {_monitor = [] execVM "Actions\EB_resources_scripts\killinit.sqf"};

//CLUB KNIFE BAYONET
//if ((perkparam == 1) and (gitsnades == 1)) then {_monitor = [] execVM "Actions\EB_resources_scripts\killinit.sqf"};

//fix for HALO bug

_playerh = (getpos player) select 2;
if (_playerh < 1500) then 
{
	(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"") then {a = createDialog 'evoUI';}"];
};
disableUserInput false;

_player setPos getMarkerPos respawnPoint;

if(respawnPoint == "Respawn_West") then {_player setPosASL[getpos _player select 0,getpos _player select 1, 0]};

//Update money
//sleep 8;
9 cutRsc ["DollarTitle","PLAIN"];
(uiNameSpace getVariable "myUI_DollarTitle") ctrlSetText format ["$%1",money];
// 2 cutRsc ["AggressionTitle","PLAIN"];
// (uiNameSpace getVariable "myUI_AggressionTitle") ctrlSetText format ["%2%1","%",aggression];

/*
if(isServer) then 
{
_i= 0;
	for "_i" from 1 to 2 do 
	{
		{
			_msg = format ["terve %1",_x];
			["fnc_hudMessage", [_x, _msg,10]] call CBA_fnc_whereLocalEvent;
			["jed_hitMarker", [_x]] call CBA_fnc_whereLocalEvent;
			["fnc_playSound", [_x, "captureCP"]] call CBA_fnc_whereLocalEvent;
		}forEach everyPlayer;
		sleep 1;
	};
				
				// _msg = format ["Position clear and under control!"];
				// ["jed_SIDEmsg", ["ALL", _msg]] call CBA_fnc_whereLocalEvent;
};
*/

	//count assaultRifles;


/*
#define weaponArray miscs
testbox = "LENL119box" createVehicleLocal position player;

_missing = [];

	for [{_loop=0}, {_loop<count weaponArray}, {_loop=_loop+1}] do
	{
		clearMagazineCargo testbox; 
		clearWeaponCargo testbox;

		testbox addWeaponCargo [(weaponArray select _loop),1];

		sleep 0.1;

		_weapon = ((getWeaponCargo testbox) select 0) select 0;

		systemChat str _weapon;


		if !(_weapon in weaponArray) then {_missing = _missing + [_weapon]};
	};
systemChat "done";
copyToClipboard str _missing;
*/
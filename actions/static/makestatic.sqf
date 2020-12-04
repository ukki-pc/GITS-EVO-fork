/*
Create and position static
Based on Build 004 of Victor Farbers VFladder script
Items are as follows:
0 Short ladder "Land_ladder_half"
1 Long ladder "Land_ladder"
2 Grenade Launcher Nest 
3 AA Nest
4 AT Nest
5 MG Nest
6 Camo Net
7 Refuel Depot
8 Mortar
9 Foxhole
*/

private ["_who","_params","_statparam","_stattype","_statpos","_laction1","_laction2","_laction3","_zvector","_dist","_mkr_name","_marker2","_custom","_zfactor"];

//"foxhole","cstatA"

_params = _this select 3;
_who = _params select 0;
_playertype = typeOf (vehicle player);
_statparam = _params select 1;
_dist = 2;
_custom = 0;
_zfactor = 1;
_scost = 2; //cost of statics

if (player in list AirportIn) exitWith {hint localize "STR_M04t88"};
//you cannot call support in the base

srank = 0;
_sco = score player;
if(_sco >= BIS_EVO_rank1-pointsSpent) then 
{
	srank = BIS_EVO_rank1;
};
if(_sco >= BIS_EVO_rank2-pointsSpent) then 
{
	srank = BIS_EVO_rank2;
};
if(_sco >= BIS_EVO_rank3-pointsSpent) then 
{
	srank = BIS_EVO_rank3;
};
if(_sco >= BIS_EVO_rank4-pointsSpent) then 
{
	srank = BIS_EVO_rank4;
};
if(_sco >= BIS_EVO_rank5-pointsSpent) then 
{
	srank = BIS_EVO_rank5;
};
if(_sco >= BIS_EVO_rank6-pointsSpent) then 
{
	srank = BIS_EVO_rank6;
};

if ( (_scost >((_sco)-srank)) AND (_statparam != 0 and _statparam != 1 and _statparam != 6 and _statparam != 9) ) exitwith {hint format[localize "STR_M04t89",_scost, ((_sco)-srank)]};
//You do not have the required spare points \nRequired: %1 \nCurrent: %2.

switch (_statparam) do
//returns _stattype and _mkr_name
{
	 case 0: //Short ladder "Land_ladder_half"
	{
		_stattype = "Land_ladder_half";
		_custom = 1;
		_zfactor = 0;
	};
	 case 1: //Long ladder "Land_ladder"
	{
		_stattype = "Land_ladder";
		_custom = 1;
		_zfactor = 0;
	};
	 case 2: //Grenade Launcher Nest 
	{
		_stattype = "MK19_TriPod_US_EP1";
		_mkr_name = format ["MK19_Nest %1", name player];
		_custom = 1;
		_dist = 3;
		if NOT( ((primaryWeapon player) in EGG_EVO_GLweapons) OR ((secondaryWeapon player) in EGG_EVO_GLweapons) ) exitWith {hint "You cannot build a Grenade Launcher Nest without an underslung grenade launcher";_custom = 2};
	};
	 case 3: //AA Nest
	{
		_allstat = ["KORD_high_UN_EP1","Stinger_Pod","Igla_AA_pod_East","ZU23_TK_INS_EP1"];
		_maxb = (count _allstat)-1;
		_stattype = _allstat select (round random _maxb);
		_mkr_name = format ["AA Nest %1", name player];
		_custom = 1;
		_dist = 4;
		if NOT( ((primaryWeapon player) in EGG_EVO_AAirweapons) OR ((secondaryWeapon player) in EGG_EVO_AAirweapons) ) exitWith {hint "You cannot build an AA Nest without a Shoulder Launched Surface-to-Air Missile";_custom = 2};
	};
	 case 4: //AT Nest
	{
		_allstat = ["TOW_TriPod_US_EP1","M119_US_EP1","SPG9_TK_GUE_EP1","Metis_TK_EP1"];
		_maxb = (count _allstat)-1;
		_stattype = _allstat select (round random _maxb);
		_mkr_name = format ["Antitank Nest %1", name player];
		_custom = 1;
		_dist = 6;
		if NOT( ((primaryWeapon player) in EGG_EVO_ATweapons) OR ((secondaryWeapon player) in EGG_EVO_ATweapons) ) exitWith {hint "You cannot build an Antitank Nest without an Anti-Tank Rocket Launcher";_custom = 2};
	};
	 case 5: //MG Nest
	{
		_allstat = ["KORD_high_UN_EP1","DSHkM_Mini_TriPod_TK_GUE_EP1","Fort_Nest_M240","M2HD_mini_TriPod_US_EP1","M2StaticMG_US_EP1"];
		_maxb = (count _allstat)-1;
		_stattype = _allstat select (round random _maxb);
		_mkr_name = format ["MG Nest %1", name player];
		_custom = 1;
		_dist = 4;
		if NOT( ((primaryWeapon player) in EGG_EVO_MGweapons) OR ((secondaryWeapon player) in EGG_EVO_MGweapons) ) exitWith {hint "You cannot build an MG Nest without a Heavy Machine Gun";_custom = 2};
	};
	 case 6: //Camo Net
	{
		_stattype = "Land_CamoNetVar_NATO";
		_dist = 6;
	};
	 case 7: //Refuel Depot
	{
		_stattype = "Barrels";
		_mkr_name = format ["Refuel %1", name player];
		_custom = 1;
		_dist = 3;
		_zfactor = 3;
	};
	 case 8: //Mortar
	{
		_stattype = "M252_US_EP1";
		_mkr_name = format ["Mortar %1", name player];
		_custom = 1;
		_dist = 3;
	};
	 case 9: //Foxhole
	{
		_allstat = ["Land_fortified_nest_small","Land_fort_bagfence_round","Land_BagFenceRound","Land_BagFenceLong"];
		_dist = 4;
		if (_playertype in EGG_EVO_playerOff) then {_allstat = ["Land_fortified_nest_big"];_dist = 8};
		if (_playertype in EGG_EVO_playerSniper) then {_allstat = EGG_EVO_sniperhide;_dist = 3};

		_maxb = (count _allstat)-1;
		_stattype = _allstat select (round random _maxb);
	};
};

switch (_custom) do
//manages deployment and deletion of statics
{
	 case 0: //Foxhole, bunker or camo net
	{
		if (alive foxhole) then {deletevehicle foxhole};
		Foxholeplaced = 0;
		foxhole = _stattype createVehicle [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist)];
		_laction1 = _who addAction ["Drop Equipment","actions\static\foxhole_placed.sqf"];

		WHILE {Foxholeplaced == 0} DO
		{
			_zvector = ((_who weaponDirection (primaryWeapon _who)) select 2) * 3;
			foxhole setposATL [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist), (getposATL _who select 2) + _zvector + _zfactor];
			if (_stattype == "Land_fort_bagfence_round") then 
				{foxhole setDir (getDir _who)}
			else
				{foxhole setDir ((getDir _who) -180)};
			sleep 0.05;
//adding to fix rocket bug
			if not(vehicle player == player) then 
			{
				deletevehicle cstatA;
				StaticAplaced =1;
				player setpos [(getpos _who select 0), (getpos_who select 1),0];
			};
		};
		_who removeAction _laction1;
		foxhole addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	};
	 case 1: //Custom static based on class
	{
		if (alive cstatA) then {deletevehicle cstatA};
		StaticAplaced = 0;
		cstatA = _stattype createVehicle [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist)];
		_laction1 = _who addAction ["Drop Equipment","actions\static\staticA_placed.sqf"];

		WHILE {StaticAplaced == 0} DO
		{
			_zvector = ((_who weaponDirection (primaryWeapon _who)) select 2) * 3;
			cstatA setposATL [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist), (getposATL _who select 2) + _zvector + _zfactor];
			cstatA setDir (getDir _who);
			sleep 0.05;
//adding to fix rocket bug
			if not(vehicle player == player) then 
			{
				deletevehicle cstatA;
				StaticAplaced =1;
				player setpos [(getpos _who select 0), (getpos_who select 1),0];
			};
		};
		_who removeAction _laction1;

//enable ladder adjustment
		if(_statparam == 0 || _statparam == 1) then
		{
			_laction2 = cstatA addAction ["Rotate ladder","actions\static\lad_switch.sqf",cstatA,1,false];
			cstatA addAction ["Raise ladder","actions\static\lad_higher.sqf",0,1,false];
			cstatA addAction ["Lower ladder","actions\static\lad_lower.sqf",0,1,false];
// After 30 sec, remove flip and removal, just keep raise and lower
			sleep 30;
			cstatA removeAction _laction2;
		};
		if(_statparam != 0 and _statparam != 1 and _statparam != 6) then
		{
			deleteMarker _mkr_name;
			_stat_pos = position cstatA;
			_marker2 = createMarker [_mkr_name, _stat_pos];
			_mkr_name setMarkerShape "ICON";
			_mkr_name setMarkerColor "ColorGreenAlpha";
			_mkr_name setMarkerSize [0.5,0.5];
			_mkr_name setMarkerType "Dot";
			_mkr_name setMarkerText _mkr_name;
		//adding cost
			BIS_EVO_punitC = player;
			BIS_EVO_prewC  = (0 - _scost);
			publicVariable "BIS_EVO_prewC";
			publicVariable "BIS_EVO_punitC";
			_txtpasshead = localize "str_cfg_cutscenes_dropweapon";//Dropping Weapon
			_txtpassbody = format["+%1 %2",(-_scost),localize "STR_M04t0_5"];//points
			["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
		};
		cstatA addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
	};

	 case 3: //Exit because tried to call a static weapon without the correct weapon
	{
		exit
	};

};


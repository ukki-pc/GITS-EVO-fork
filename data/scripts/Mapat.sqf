//air patrol
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
_starts = [];
_obj1 = [];
_guard=grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t13_1";
_MissionBriefingHUD = localize "STR_M04t5_1";
_MissionBriefingShort = localize "STR_M04t12";
_txtfailbody = localize "STR_M04t14_1";

_deletemapat =
{
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 12.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
};

_killpilots =
{
	_chop = _this select 0;
	_crew = _this select 1;
	waitUntil {count units _chop == 0 or not canmove _chop};
	sleep 1.0;
	{_x setdammage 1} foreach _crew;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemapat;
};

[West,"HQ"] SideChat localize "STR_M04t64";
_pos = getmarkerpos "centerp";

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

//map
[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,0] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};	
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_guard = createGroup (east);

_allvecA = EGG_EVO_mevaira;
_allvecB = EGG_EVO_mevairb;
_maxA = count _allvecA;
_maxB = count _allvecB;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 1000, "FLY"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_pos1 = position _heli;

_heli1 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 1000, "FLY"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_pos2 = position _heli1;

_heli2 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 1000, "FLY"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_pos3 = position _heli2;

_heli3 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos, [], 1000, "FLY"];[_heli3] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_pos4 = position _heli3;

_heli4 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos, [], 1000, "FLY"];[_heli4] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_vcl] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_pos5 = position _heli4;

_starts = [_pos1,_pos2,_pos3,_pos4,_pos5];

_pos = (_starts select (round random 4));

_heli addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli3 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli4 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

_allunits = EGG_EVO_mepilot;
_maxC = count _allunits;

_dcounta = 7;
_d = 0;
while {_d <= _dcounta} do 
{
	(_allunits select round random (_maxC - 1)) createUnit [_pos1, _guard];Sleep BIS_EVO_GlobalSleep;
	_d = _d+1;
	sleep 0.1;
};

(units _guard select 0) assignAsDriver _heli;
(units _guard select 0) moveInDriver _heli;
(units _guard select 1) assignAsGunner _heli;
(units _guard select 1) moveInGunner _heli;

(units _guard select 2) assignAsDriver _heli1;
(units _guard select 2) moveInDriver _heli1;
(units _guard select 3) assignAsGunner _heli1;
(units _guard select 3) moveInGunner _heli1;

(units _guard select 4) assignAsDriver _heli2;
(units _guard select 4) moveInDriver _heli2;
(units _guard select 5) assignAsGunner _heli2;
(units _guard select 5) moveInGunner _heli2;

(units _guard select 6) assignAsDriver _heli3;
(units _guard select 6) moveInDriver _heli3;

(units _guard select 7) assignAsDriver _heli4;
(units _guard select 7) moveInDriver _heli4;

_killh1 = [_heli,crew _heli] spawn {[_this select 0,_this select 1] call _killpilots};
_killh2 = [_heli1,crew _heli1] spawn {[_this select 0,_this select 1] call _killpilots};
_killh3 = [_heli2,crew _heli2] spawn {[_this select 0,_this select 1] call _killpilots};
_killh4 = [_heli3,crew _heli3] spawn {[_this select 0,_this select 1] call _killpilots};
_killh5 = [_heli4,crew _heli4] spawn {[_this select 0,_this select 1] call _killpilots};

_guard setCombatMode "RED";
_guard setBehaviour "COMBAT";

{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";

_wp1 = _guard addWaypoint [_pos1, 10];
_wp2 = _guard addWaypoint [_pos2, 10];
_wp3 = _guard addWaypoint [_pos3, 10];
_wp4 = _guard addWaypoint [_pos4, 10];
_wp5 = _guard addWaypoint [_pos5, 10];
_wp6 = _guard addWaypoint [_pos1, 10];
[_guard, 6] setWaypointType "CYCLE";

_pos1 = position vehicle (units _guard select 0);
_pos2 = position vehicle (units _guard select 2);
_pos3 = position vehicle (units _guard select 4);
_pos4 = position vehicle (units _guard select 6);
_pos5 = position vehicle (units _guard select 7);

_starts = [_pos1,_pos2,_pos3,_pos4,_pos5];

_i=0;
while {_i < count _starts} do 
{
	_npos = (_starts select _i);
	[_usergroup, 1] setWaypointPosition [_npos, 0];
	_search setMarkerPosLocal _npos;
	_usergroup setCurrentWaypoint [_usergroup, 1];	
	_obj1 setSimpleTaskDestination  _npos;

	Waituntil {player distance _npos < 200 or (count units _guard) == 0 or (not BIS_EVO_Onmission)}; //or if pilots dead
	_i = _i + 1;
//	if (_usergroup != (group _user)) then {_i=100};
	if (not BIS_EVO_Onmission) then {_i=100};
	if ((count units _guard) == 0) then {_i=100};
	if (not (alive _heli) and not (alive _heli1) and not (alive _heli2) and not (alive _heli3) and not (alive _heli4)) then {_i=100}; 
	if (_i == 5 and (count units _guard)  > 0) then {_i=0};
};

//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);
["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";
sleep 1.0;
[] call _deletemapat;

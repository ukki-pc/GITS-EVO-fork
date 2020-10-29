//water patrol mission
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
_obj1 = [];
_guard=grpNull;
_starts = [];

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t7_1";
_MissionBriefingHUD = localize "STR_M04t5_1";
_MissionBriefingShort = localize "STR_M04t6_1";
_txtfailbody = localize "STR_M04t8";

_deletemwpat =
{
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 12.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";	
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemwpat;
};

[West,"HQ"] SideChat localize "STR_M04t64";

_allpos = ["wpat1","wpat2","wpat3","wpat4","wpat5","wpat6"];
_max = count _allpos;

_r = round random (_max - 1);
_rand =  _allpos select _r;
_pos = getMarkerPos _rand;
sleep 1;

_r = round random (_max - 1);
_rand =  _allpos select _r;
_pos1 = getMarkerPos _rand;
sleep 1;

_r = round random (_max - 1);
_rand =  _allpos select _r;
_pos2 = getMarkerPos _rand;
sleep 1;

_r = round random (_max - 1);
_rand =  _allpos select _r;
_pos3 = getMarkerPos _rand;

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,2] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_guard = createGroup (east);

_heli = createVehicle ["RHIB2Turret", _pos1, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;[_heli] call BIS_EVO_Lock;
_heli1 = createVehicle ["RHIB2Turret", _pos2, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;[_heli1] call BIS_EVO_Lock;
_heli2 = createVehicle ["RHIB2Turret", _pos3, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;[_heli2] call BIS_EVO_Lock;

_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];

_allunitsA = EGG_EVO_mecrew;
_maxA = count _allunitsA;

_infcount = 8;
_j = 0;
while {_j <= _infcount} do 
{
	_unit = _guard createUnit [(_allunitsA select round random (_maxA - 1)), _pos, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;
	_j = _j+1;
};

(units _guard select 0) moveInDriver _heli;
(units _guard select 1) moveInTurret[_heli,[0]];
(units _guard select 2) moveInTurret[_heli,[1]];

(units _guard select 3) moveInDriver _heli1;
(units _guard select 4) moveInTurret[_heli1,[0]];
(units _guard select 5) moveInTurret[_heli1,[1]];

(units _guard select 6) moveInDriver _heli2;
(units _guard select 7) moveInTurret[_heli2,[0]];
(units _guard select 8) moveInTurret[_heli2,[1]];

_guard setCombatMode "RED";
_guard setBehaviour "COMBAT";

{_x addRating -2000;
_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]
} forEach (units _guard);
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_wp1 = _guard addWaypoint [_pos1, 10];
_wp2 = _guard addWaypoint [_pos2, 10];
_wp3 = _guard addWaypoint [_pos3, 10];
_wp4 = _guard addWaypoint [_pos1, 10];
[_guard, 4] setWaypointType "CYCLE";

_pos1 = position vehicle (units _guard select 0);
_pos2 = position vehicle (units _guard select 2);
_pos3 = position vehicle (units _guard select 4);

_starts = [_pos1,_pos2,_pos3];

_i=0;
while {_i < count _starts} do 
{
	_npos = (_starts select _i);
	_obj1 setSimpleTaskDestination  _npos;
//	Waituntil {_user distance  _npos < 20 or ((count units _guard) == 0) or _usergroup != (group _user) or not BIS_EVO_Onmission};
	Waituntil {player distance _npos < 20 or ((count units _guard) == 0) or not BIS_EVO_Onmission};
	_i = _i + 1;
//	if (_usergroup != (group _user)) then {_i=100};
	if (not BIS_EVO_Onmission) then {_i=100};
	if ((count units _guard) == 0) then {_i=100};
	if (_i == 3 and (count units _guard)  > 0) then {_i=0};
	sleep 1.0;
};

//if (_usergroup != (group _user)) exitwith {[] call _Fail};
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
[] call _deletemwpat;

//land patrol
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_pos = [0,0,0];
_starts = [];
_obj1 = [];
_guard=grpNull;
_guardb=grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t10_1";
_MissionBriefingHUD = localize "STR_M04t5_1";
_MissionBriefingShort = localize "STR_M04t9_1";
_txtfailbody = localize "STR_M04t11";

_deletemlpat =
{
	BIS_EVO_Onmission=false;
	player removeSimpleTask _obj1;
	sleep 12.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
	_handle = [_guardb] execVM "data\scripts\delete.sqf";
	deletevehicle _heli;
	deletevehicle _heli1;
	deletevehicle _heli2;
	deletevehicle _heli3;
	deletevehicle _heli4;
	deletevehicle _heli5;	
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deletemlpat;
};

[West,"HQ"] SideChat localize "STR_M04t64";

_possw = getmarkerpos "swpoint";
_posne = getmarkerpos "nepoint";

_xmax = ((_posne select 0)-(_possw select 0));
_ymax = ((_posne select 1)-(_possw select 1));

//_pos = getmarkerpos "swpoint";

_pos = [((_possw select 0)+(random _xmax)),((_possw select 1)+(random _ymax)),0];
sleep 0.2;
_pos1 = [((_possw select 0)+(random _xmax)),((_possw select 1)+(random _ymax)),0];
sleep 0.2;
_pos2 = [((_possw select 0)+(random _xmax)),((_possw select 1)+(random _ymax)),0];
sleep 0.2;
_pos3 = [((_possw select 0)+(random _xmax)),((_possw select 1)+(random _ymax)),0];
sleep 0.2;

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

//map
[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,0] execVM "data\scripts\mismap.sqf";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};

_guard = createGroup (east);
_guardb = createGroup (east);
_allvecA = EGG_EVO_mevheavyb+EGG_EVO_mevlight+EGG_EVO_mevmed;
_maxA = count _allvecA;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 20, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_pos = position _heli;
_heli1 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos1, [], 20, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_pos1 = position _heli1;
_heli2 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos2, [], 20, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_pos2 = position _heli2;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli3 = createVehicle ["CampEast", _pos3, [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
_heli4 = createVehicle [(EGG_EVO_meflag select 0), _pos3, [], 20, "NONE"];Sleep BIS_EVO_GlobalSleep;
//_heli5 = createVehicle ["Land_Fire_burning", _pos3, [], 20, "NONE"];Sleep BIS_EVO_GlobalSleep;
_recy = [_user,_heli3] execVM "data\scripts\recycle.sqf";
_recy = [_user,_heli4] execVM "data\scripts\recycle.sqf";
_recy = [_user,_heli5] execVM "data\scripts\recycle.sqf";

_starts = [_pos1,_pos2,_pos3];

_pos = (_starts select (round random 2));

_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}];

_allunitsC = EGG_EVO_mecrew;
_maxC = count _allunitsC;

_dcounta = 5;
_d = 0;
while {_d <= _dcounta} do 
{
	(_allunitsC select round random (_maxC - 1)) createUnit [_pos1, _guard];Sleep BIS_EVO_GlobalSleep;
	_d = _d+1;
	sleep 0.5;
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

_guard setCombatMode "RED";
_guard setBehaviour "COMBAT";

_allunits = EGG_EVO_meguardc;
_max = count _allunits;

_dcounta = 11;
_d = 0;
while {_d <= _dcounta} do 
{
	_unit = _guardb createUnit [_allunits select (round random (_max - 1)), _pos3, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;
	_d = _d+1;
	sleep 0.5;
};

{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guard);
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guardb);
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_recy = [_user,_guardb] execVM "data\scripts\grecycle.sqf";	

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

	Waituntil {player distance  _npos < 20 or ((count units _guard) == 0 and (count units _guardb) == 0) or (_usergroup != (group _user)) or (not BIS_EVO_Onmission)};
	_i = _i + 1;
//	if (_usergroup != (group _user)) then {_i=100};
	if (not BIS_EVO_Onmission) then {_i=100};
	if (((count units _guard) == 0 and (count units _guardb) == 0)) then {_i=100};
	if (_i == 3 and (count units _guard)  > 0) then {_i=0;};
	sleep 1.0;
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
[] call _deletemlpat;

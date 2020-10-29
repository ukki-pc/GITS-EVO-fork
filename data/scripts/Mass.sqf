//ambush convoy side mission
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_allobj = [];
_pos = [0,0,0];
_obj1 = [];
_guard=grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "STR_M04t17_1";
_MissionBriefingHUD = localize "STR_M04t15_0";
_MissionBriefingShort = localize "STR_M04t16_0";

_txtfailbody = localize "STR_M04t18_0";

_deleteass =
{
	BIS_EVO_Onmission=false;
	sleep 12.0;
	_handle = [_guard] execVM "data\scripts\delete.sqf";
	player removeSimpleTask _obj1;
	sleep 90;
	deletevehicle _heli;
	deletevehicle _heli1;
	deletevehicle _heli2;
	deletevehicle _heli3;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deleteass;
};

[West,"HQ"] SideChat localize "STR_M04t64";

if(_var == 10) then
{	
	_allobj = ["mrnd1","mrnd3","mrnd6","mrnd7","mrnd11","mrnd17","mrnd9"];
};
if(_var == 20) then
{
	_allobj = ["mrnd2","mrnd5","mrnd8","mrnd16","mrnd18","mrnd21","mrnd20"];
};
_max = count _allobj;
_r = round random (_max - 1);
_rand =  _allobj select _r;
_pos = getMarkerPos _rand;

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,2] execVM "data\scripts\mismap.sqf";
sleep 5;
[West,"HQ"] SideChat localize "str_som_ambush_briefing_1";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};	
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_guard = createGroup (east);
_pos2 = [(_pos select 0),(_pos select 1) - 15,(_pos select 2)];
_pos3 = [(_pos select 0),(_pos select 1) - 30,(_pos select 2)];
_pos4 = [(_pos select 0),(_pos select 1) - 45,(_pos select 2)];

_allvecA = EGG_EVO_mevlight;
_allvecB = EGG_EVO_mevmed;
_allvecC = EGG_EVO_mevconvoya;

if(_var == 20) then
{
	_allvecA = EGG_EVO_mevmed;
	_allvecB = EGG_EVO_mevheavya;
};

_maxA = count _allvecA;
_maxB = count _allvecB;
_maxC = count _allvecC;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 0, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli1 = createVehicle [(_allvecC select round random (_maxC - 1)), _pos2, [], 0, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli2 = createVehicle [(_allvecC select round random (_maxC - 1)), _pos3, [], 0, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli3 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos4, [], 0, "NONE"];[_heli3] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli3 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_allunits = EGG_EVO_meguardf;
_max = count _allunits;

(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos, _guard];Sleep BIS_EVO_GlobalSleep;

(units _guard select 0) assignAsDriver _heli;
(units _guard select 0) moveInDriver _heli;
(units _guard select 1) assignAsGunner _heli;
(units _guard select 1) moveInGunner _heli;

(units _guard select 2) assignAsDriver _heli1;
(units _guard select 2) moveInDriver _heli1;
(units _guard select 3) assignAsDriver _heli2;
(units _guard select 3) moveInDriver _heli2;

(units _guard select 4) assignAsDriver _heli3;
(units _guard select 4) moveInDriver _heli3;
(units _guard select 5) assignAsGunner _heli3;
(units _guard select 5) moveInGunner _heli3;
(units _guard select 6) assignAsCargo _heli3;
(units _guard select 6) moveInCargo _heli3;
(units _guard select 7) assignAsCargo _heli3;
(units _guard select 7) moveInCargo _heli3;

_guard setFormation "COLUMN";
_guard setSpeedMode "LIMITED";
_guard setBehaviour "SAFE";
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";
_allobj = ["mobj1","mobj2","mobj3","mobj4","mobj5","mobj6","mobj7","mobj8","mobj9","mobj10"];
_currentobj = [];
_max = count _allobj;
_rand =  _allobj select (round random (_max - 1));
_wp = _guard addWaypoint [_pos2, 10];
_pos = getMarkerPos _rand;
_wp2 = _guard addWaypoint [_pos, 10];
_wp3 = _guard addWaypoint [_pos, 10];
[_guard, 3] setWaypointType "CYCLE";

_pos = position (leader _guard);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	_obj1 setSimpleTaskDestination  position (leader _guard);
//	if ((count units _guard) == 0 or _usergroup != (group _user) or not BIS_EVO_Onmission) then {_loop=1;};
	if ((count units _guard) == 0 or not BIS_EVO_Onmission) then {_loop=1;};
};

//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group player);

["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;

[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
sleep 5;
[West,"HQ"] SideChat localize "str_m07r04";

BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";
sleep 1.0;
[] call _deleteass;

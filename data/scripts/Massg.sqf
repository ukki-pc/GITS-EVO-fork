//massg - assassinate enemy general
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_allobj = [];
_pos = [0,0,0];
_obj1 = [];
_guardass=grpNull;

_txtcommon = localize "STR_M04t0_5";
_txtfailhead = localize "STR_M04t2_6";//failed
_txtpasshead = localize "STR_M04t1_9";//complete
_txtpassbody = format["+%1 %2",_var,_txtcommon];

_MissionBriefingLong = localize "str_lib_chal_assassination_briefing";
_MissionBriefingHUD = localize "str_lib_chal_assassination_char_officer";
_MissionBriefingShort = localize "str_lib_chal_assassination";
_txtfailbody = localize "str_end_bardak_escaped_b_1";

_deleteass =
{
	BIS_EVO_Onmission=false;
	sleep 12.0;
	_handle = [_guardass] execVM "data\scripts\delete.sqf";
	player removeSimpleTask _obj1;
	sleep 90.0;
	deleteVehicle _heli;
	deleteVehicle _heli1;
	deleteVehicle _heli2;
};

_Fail = 
{
	_obj1 settaskstate "Failed";
	["#FF0000",_txtfailhead,_txtfailbody] call BIS_EVO_Message;
	[] call _deleteass;
};

[West,"HQ"] SideChat localize "STR_M04t64";

_pos = position inthotel_roof;

_obj1 = player createSimpleTask ["obj1"];
_obj1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
_obj1 setSimpleTaskDestination _pos;
_obj1 settaskstate "Created";
player setCurrentTask _obj1;

[1800] execVM "data\scripts\timer.sqf";
_mapview = [_pos,2] execVM "data\scripts\mismap.sqf";
sleep 5;
[West,"HQ"] SideChat localize "str_lib_chal_assassination_briefing";

waitUntil {player distance inthotel_roof < 7 or not BIS_EVO_Onmission};	
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_pos = getMarkerPos "genstart";
_targ = getMarkerPos "genhq";

_obj1 setSimpleTaskDestination _pos;

_guardass = createGroup (east);

_pos2 = [(_pos select 0),(_pos select 1) - 15,(_pos select 2)];
_pos3 = [(_pos select 0),(_pos select 1) - 30,(_pos select 2)];

_allvecA = EGG_EVO_mevconvoyb;
_allvecB = EGG_EVO_mevlighta;

_maxA = (count _allvecA)-1;
_maxB = (count _allvecB)-1;

_heli = createVehicle [(_allvecB select (round random _maxB)), _pos, [], 0, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli1 = createVehicle [(_allvecA select (round random _maxA)), _pos2, [], 0, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli2 = createVehicle [(_allvecA select (round random _maxA)), _pos3, [], 0, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}];

_allunitsA = EGG_EVO_meofficer;
_maxA = (count _allunitsA)-1;

_allunitsB = EGG_EVO_meguardg;
_maxB = (count _allunitsB)-1;

//car 1 - 3 men
_unit = _guardass createUnit [(_allunitsA select (round random _maxA)), _pos, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsDriver _heli;_unit moveInDriver _heli;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsA select (round random _maxA)), _pos, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsGunner _heli;_unit moveInGunner _heli;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsA select (round random _maxA)), _pos, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli;_unit moveInCargo _heli;
Sleep 0.2;

//truck 2 - 6 men
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsDriver _heli1;_unit moveInDriver _heli1;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos3, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;

//truck 3 - 6 men
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsDriver _heli2;_unit moveInDriver _heli2;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardass createUnit [(_allunitsB select (round random _maxB)), _pos2, [], 10, "NONE"];[_unit] join _guardass;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;

_guardass setFormation "COLUMN";
_guardass setSpeedMode "LIMITED";
_guardass setBehaviour "SAFE";
{_x addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\bury.sqf"}]} forEach (units _guardass);
_recy = [_user,_guardass] execVM "data\scripts\grecycle.sqf";

_wp = _guardass addWaypoint [_targ, 10];

[_guardass, 1] setWaypointType "MOVE";

_pos = position (leader _guardass);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	_obj1 setSimpleTaskDestination  position (leader _guardass);
//	if ((count units _guardass) == 0 or _usergroup != (group _user) or not BIS_EVO_Onmission) then {_loop=1;};
	if ((count units _guardass) < 1 or not BIS_EVO_Onmission) then {_loop=1;};
};

//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

{if(isplayer _x) then {_x doFollow leader _x}} foreach units (group _user);

["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;

[West,"HQ"] SideChat localize "STR_M04t65";playSound "Goodjob";
sleep 5;
[West,"HQ"] SideChat localize "str_lib_chal_assassination_assassinated";

BIS_EVO_punit = _usergroup;
BIS_EVO_prew  = _var;
publicVariable "BIS_EVO_prew";
publicVariable "BIS_EVO_punit";
_obj1 settaskstate "Succeeded";

sleep 1.0;
[] call _deleteass;

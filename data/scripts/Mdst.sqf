//destroy armour mission
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

_MissionBriefingLong = localize "STR_M04t21_0";
_MissionBriefingHUD = localize "STR_M04t19";
_MissionBriefingShort = localize "STR_M04t20";
_txtfailbody = localize "STR_M04t22_0";

_deletemdst =
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
	[] call _deletemdst;
};

[West,"HQ"] SideChat localize "STR_M04t64";
if(_var == 10) then
{	
	_allobj = ["mrnd26","mrnd5","mrnd15","mrnd17","mrnd29"];
};
if(_var == 20) then
{
	_allobj = ["mrnd22","mrnd23","mrnd24","mrnd16","mrnd15","mrnd5","mrnd17","mrnd12","mrnd31","mrnd10","mrnd28","mrnd4"];
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

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_guard = createGroup (east);

_allvecA = EGG_EVO_mevmeda;
_allvecB = EGG_EVO_eastveh11;
if(_var == 10) then
{
	_allvecA = EGG_EVO_mevmeda;
};
if(_var == 20) then
{
	_allvecA = EGG_EVO_mevheavya;
};

_maxA = count _allvecA;
_maxB = count _allvecB;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 200, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_pos = position _heli;
_heli1 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 200, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_heli2 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos, [], 200, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;

_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];

_allunitsA = EGG_EVO_mecrew;
_maxA = count _allunitsA;

_allunits = EGG_EVO_meguardc;
_max = count _allunits;

_infcount = 8;
_j = 0;
while {_j <= _infcount} do 
{
	_unit = _guard createUnit [(_allunitsA select round random (_maxA - 1)), _pos, [], 30, "NONE"];Sleep BIS_EVO_GlobalSleep;
	_j = _j+1;
};

_infcount = 3;
_j = 0;
while {_j <= _infcount} do 
{
	_unit = _guard createUnit [(_allunits select round random (_max - 1)), _pos, [], 30, "FORM"];Sleep BIS_EVO_GlobalSleep;
	_j = _j+1;
};

{_x addEventHandler ["killed", {_x setCombatMode "RED";commandStop _x;handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guard);

if(_var == 10) then
{
	(units _guard select 0) assignAsGunner _heli;
	(units _guard select 1) assignAsDriver _heli;
	(units _guard select 2) assignAsCargo _heli;

	(units _guard select 3) assignAsGunner _heli1;
	(units _guard select 4) assignAsDriver _heli1;
	(units _guard select 5) assignAsCargo _heli1;

	(units _guard select 6) assignAsGunner _heli2;
	(units _guard select 7) assignAsDriver _heli2;
	(units _guard select 8) assignAsCargo _heli2;

	(units _guard select 0) moveInGunner _heli;
	(units _guard select 1) moveInDriver _heli;
	(units _guard select 2) moveInCargo _heli;

	(units _guard select 3) moveInGunner _heli1;
	(units _guard select 4) moveInDriver _heli1;
	(units _guard select 5) moveInCargo _heli1;

	(units _guard select 6) moveInGunner _heli2;
	(units _guard select 7) moveInDriver _heli2;
	(units _guard select 8) moveInCargo _heli2;

};
if(_var == 20) then
{
	(units _guard select 0) assignAsCommander _heli;
	(units _guard select 1) assignAsDriver _heli;
	(units _guard select 2) assignAsGunner _heli;

	(units _guard select 3) assignAsCommander _heli1;
	(units _guard select 4) assignAsDriver _heli1;
	(units _guard select 5) assignAsGunner _heli1;

	(units _guard select 6) assignAsCommander _heli2;
	(units _guard select 7) assignAsDriver _heli2;
	(units _guard select 8) assignAsGunner _heli2;

	(units _guard select 0) moveInCommander _heli;
	(units _guard select 1) moveInDriver _heli;
	(units _guard select 2) moveInGunner _heli;

	(units _guard select 3) moveInCommander _heli1;
	(units _guard select 4) moveInDriver _heli1;
	(units _guard select 5) moveInGunner _heli1;

	(units _guard select 6) moveInCommander _heli2;
	(units _guard select 7) moveInDriver _heli2;
	(units _guard select 8) moveInGunner _heli2;
};
_recy = [_user,_guard] execVM "data\scripts\grecycle.sqf";

_pos = position vehicle (leader _guard);
_heli = assignedVehicle (units _guard select 0);
_heli1 = assignedVehicle (units _guard select 3);
_heli2 = assignedVehicle (units _guard select 6);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	_obj1 setSimpleTaskDestination  position (leader _guard);
//	if ((count units _guard) == 0 or _usergroup != (group _user) or not BIS_EVO_Onmission) then {_loop=1;};
	if ((count units _guard) == 0 or not BIS_EVO_Onmission) then {_loop=1;};
};

// (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
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
[] call _deletemdst;

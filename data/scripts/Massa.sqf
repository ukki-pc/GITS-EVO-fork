//massa - advanced ambush mission
_user = _this select 0;
_var = _this select 1;
_usergroup = (group player);
_allobj = [];
_pos = [0,0,0];
_obj1 = [];
_currentobj = [];
_guardmis=grpNull;

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
	player removeSimpleTask _obj1;
	_handle = [_guardmis] execVM "data\scripts\delete.sqf";
	sleep 90.0;
	deleteVehicle _heli;
	deleteVehicle _heli1;
	deleteVehicle _heli2;
	deleteVehicle _heli3;
	deleteVehicle _heli4;
	deleteVehicle _heli5;
	deleteVehicle _heli6;
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
if(_var == 30) then
{
	_allobj = ["mrnd4","mrnd9","mrnd12","mrnd13","mrnd14","mrnd10"];
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

[2400] execVM "data\scripts\timer.sqf";
_mapview = [_pos,2] execVM "data\scripts\mismap.sqf";
sleep 5;
[West,"HQ"] SideChat localize "str_som_ambush_briefing_1";

waitUntil {player distance _pos < 1500 or not BIS_EVO_Onmission};	
//if (_usergroup != (group _user) or not BIS_EVO_Onmission) exitwith {[] call _Fail};
if (not BIS_EVO_Onmission) exitwith {[] call _Fail};

_guardmis = createGroup (east);

_pos2 = [(_pos select 0),(_pos select 1) - 15,(_pos select 2)];
_pos3 = [(_pos select 0),(_pos select 1) - 30,(_pos select 2)];
_pos4 = [(_pos select 0),(_pos select 1) - 45,(_pos select 2)];
_pos5 = [(_pos select 0),(_pos select 1) - 60,(_pos select 2)];
_pos6 = [(_pos select 0),(_pos select 1) - 75,(_pos select 2)];
_pos7 = [(_pos select 0),(_pos select 1) - 90,(_pos select 2)];

_allvecA = EGG_EVO_mevlight; //escorts
_allvecB = EGG_EVO_mevconvoyb; //trucks
_allvecC = EGG_EVO_mevconvoya; //fuel truck

if(_var == 30) then
{
	_allvecA = EGG_EVO_mevmed;
};

_maxA = count _allvecA;
_maxB = count _allvecB;
_maxC = count _allvecC;

_heli = createVehicle [(_allvecA select round random (_maxA - 1)), _pos, [], 0, "NONE"];[_heli] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli1 = createVehicle [(_allvecB select round random (_maxC - 1)), _pos2, [], 0, "NONE"];[_heli1] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli1] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli2 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos3, [], 0, "NONE"];[_heli2] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli2] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli3 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos4, [], 0, "NONE"];[_heli3] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli3] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli4 = createVehicle [(_allvecB select round random (_maxB - 1)), _pos5, [], 0, "NONE"];[_heli4] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli4] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli5 = createVehicle [(_allvecC select round random (_maxC - 1)), _pos6, [], 0, "NONE"];[_heli5] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli5] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli6 = createVehicle [(_allvecA select round random (_maxA - 1)), _pos7, [], 0, "NONE"];[_heli6] call BIS_EVO_Lock;Sleep BIS_EVO_GlobalSleep;
_spawne = [_heli6] spawn {[_this select 0] call BIS_EVO_idelSVEC};

_heli addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli1 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli2 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli3 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli4 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli5 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
_heli6 addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];

_allunits = EGG_EVO_meguardg;
_max = count _allunits;

_allunitsA = EGG_EVO_meofficer;
_maxA = count _allunitsA;

//truck 1 - 6 men
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsDriver _heli1;_unit moveInDriver _heli1;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli1;_unit moveInCargo _heli1;
Sleep 0.2;

//truck 2 - 6 men
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsDriver _heli2;_unit moveInDriver _heli2;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos3, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli2;_unit moveInCargo _heli2;
Sleep 0.2;

//truck 3 - 6 men
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsDriver _heli3;_unit moveInDriver _heli3;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli3;_unit moveInCargo _heli3;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli3;_unit moveInCargo _heli3;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli3;_unit moveInCargo _heli3;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli3;_unit moveInCargo _heli3;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos4, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli3;_unit moveInCargo _heli3;
Sleep 0.2;

//truck 4 - 6 men
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsDriver _heli4;_unit moveInDriver _heli4;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli4;_unit moveInCargo _heli4;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli4;_unit moveInCargo _heli4;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli4;_unit moveInCargo _heli4;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli4;_unit moveInCargo _heli4;
Sleep 0.2;
_unit = _guardmis createUnit [(_allunits select round random (_max - 1)), _pos5, [], 0, "NONE"];[_unit] join _guardmis;_unit assignAsCargo _heli4;_unit moveInCargo _heli4;
Sleep 0.2;

//2 escorts heli & heli6 at pos and pos7, driver, cargo and gunner, 2 officers in front car

(_allunitsA select round random (_maxA - 1)) createUnit [_pos, _guardmis];Sleep BIS_EVO_GlobalSleep;
(_allunitsA select round random (_maxA - 1)) createUnit [_pos, _guardmis];Sleep BIS_EVO_GlobalSleep;

(_allunits select round random (_max - 1)) createUnit [_pos, _guardmis];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos7, _guardmis];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos7, _guardmis];Sleep BIS_EVO_GlobalSleep;
(_allunits select round random (_max - 1)) createUnit [_pos7, _guardmis];Sleep BIS_EVO_GlobalSleep;
(EGG_EVO_mecrew select 0) createUnit [_pos6, _guardmis];Sleep BIS_EVO_GlobalSleep;
(EGG_EVO_mecrew select 0) createUnit [_pos6, _guardmis];Sleep BIS_EVO_GlobalSleep;

(units _guardmis select 24) assignAsDriver _heli;
(units _guardmis select 24) moveInDriver _heli;
(units _guardmis select 25) assignAsCargo _heli;
(units _guardmis select 25) moveInCargo _heli;
(units _guardmis select 26) assignAsGunner _heli;
(units _guardmis select 26) moveInGunner _heli;

(units _guardmis select 27) assignAsDriver _heli6;
(units _guardmis select 27) moveInDriver _heli6;
(units _guardmis select 28) assignAsDriver _heli6;
(units _guardmis select 28) moveInDriver _heli6;
(units _guardmis select 29) assignAsCargo _heli6;
(units _guardmis select 29) moveInCargo _heli6;

//1 fuel truck heli5 pos6 2 crew

(units _guardmis select 30) assignAsDriver _heli5;
(units _guardmis select 30) moveInDriver _heli5;
(units _guardmis select 31) assignAsCargo _heli5;
(units _guardmis select 31) moveInCargo _heli5;

_guardmis setFormation "COLUMN";
_guardmis setSpeedMode "LIMITED";
_guardmis setBehaviour "SAFE";
{_x addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}]} forEach (units _guardmis);
_recy = [_user,_guardmis] execVM "data\scripts\grecycle.sqf";

_allobj = ["mobj1","mobj2","mobj3","mobj4","mobj5","mobj6","mobj7","mobj8","mobj9","mobj10"];
_currentobj = [];
_max = count _allobj;

_rand =  _allobj select (round random (_max - 1));
_pos = getMarkerPos _rand;
_wp = _guardmis addWaypoint [_pos, 10];
[_guardmis, 1] setWaypointType "GETOUT";

_pos = position (leader _guardmis);

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.001;
	_obj1 setSimpleTaskDestination  position (leader _guardmis);
//	if ((count units _guardmis) == 0 or _usergroup != (group _user) or not BIS_EVO_Onmission) then {_loop=1;};
	if ((count units _guardmis) == 0 or not BIS_EVO_Onmission) then {_loop=1;};
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

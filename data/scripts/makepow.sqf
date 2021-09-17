// remakes enemy pows to be able to be put into the capture state
_unit = _this select 0;
_grp = group _unit;
_type = typeof _unit;
_posu = position _unit;

//if (_type == "RU_Soldier_Officer") exitwith {};
if (_type in EGG_EVO_PlayerOff) exitwith {};

unassignVehicle _unit;
_unit setPos _posu;
deleteVehicle _unit;

//hint "makepow active";

_lastgroup = createGroup east; 
_unitn = _lastgroup createUnit [_type, _posu, [], 10, "NONE"];Sleep BIS_EVO_GlobalSleep;
_unitn addEventHandler ["killed", {handle = [_this select 0,_this select 1] execVM "data\scripts\mobjbury.sqf"}];
[_unitn] join _lastgroup;
_unitn setVehicleInit "ucap = [this] execVM 'data\scripts\submit.sqf'";
processInitCommands;
_recy = [objnull,_lastgroup] execVM "data\scripts\grecycle.sqf";
Sleep 3;

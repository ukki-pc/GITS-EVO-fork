// supplys player with requested unit
_player = _this select 0;
_unitype = _this select 1;
_grp = group _player;

_pos = position _player;
_unit = group _player createUnit [_unitype, [0,0,0], [], 0, "NONE"];Sleep BIS_EVO_GlobalSleep;
_lone = [_unit] execVM 'data\scripts\nohuman.sqf';
_vec = createVehicle ["ParachuteEast", _pos, [], 20, 'NONE'];Sleep BIS_EVO_GlobalSleep;
_vec setpos [_pos select 0,_pos select 1,(_pos select 2)+ 100];
_unit MoveInDriver _vec;
WaitUntil {vehicle _unit == _unit};
_unit setpos [(getpos _unit select 0),(getpos _unit select 1),0];
_unit setdammage 0;

[_unit] join _grp;
BIS_EVO_runit = _unit;
publicVariable "BIS_EVO_runit";

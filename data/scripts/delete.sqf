// used to cleanly delete units and their groups.
_grp = _this select 0;
_time = 2.0 + (random 2.5);
_allunits = units _grp;
_count = count _allunits;
_Vehicles = [];
sleep _time;
_i=0;
//hint format["vecs:%1 %2 %3 %4",_count,_allunits];
while {_i < _count} do 
{
	_unit = (_allunits select _i);
	_vec = vehicle _unit;
	if (not (_vec isKindOf "Man") and not (_vec in _Vehicles)) then {_Vehicles = _Vehicles+[_vec]};
	_i=_i+1;
};

{
	_vec = _x;
	{_x setpos position _vec} forEach crew _vec;
} forEach _Vehicles;

{deletevehicle _x} forEach units _grp;
{if(count crew _x > 0) then {debuglog format["ALERT!! vec has passengers %1", TypeOf _x]};deletevehicle _x} forEach _Vehicles;
deleteGroup _grp;
/*
while {_count >= 0} do 
{
	_man = (units _grp select _count);
	_unit = vehicle _man;
	if (not (_unit isKindOf "Man") and not (isNull _unit)) then
	{
		{_x action ["Eject",_unit]} forEach crew _unit;
	};
	sleep _time;
	deletevehicle _unit;
	_count = _count-1;
};
*.
deleteGroup _grp;











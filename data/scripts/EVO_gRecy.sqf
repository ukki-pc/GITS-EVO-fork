BIS_EVO_gRecy =
{
	_grp   = _this select 0;
	_units = _this select 1;
	_newselect = [];
	_spawned=false;
	_leader = leader _grp;
	_tmpleader = objnull;
	{_x addEventHandler ["killed", {handle = [_this select 0,"INF",_this select 1] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _grp)+_units;
	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
	{
		if(_spawned) then 
		{
			if(isNull(_leader findNearestEnemy position _leader)) then 
			{
				hint format["hedontknows: %1 units to unspawn = %2",(_leader findNearestEnemy position _leader),_units];
				_units = (units _grp)-[(leader _grp)];
				_units = [_units] call BIS_EVO_InfReDummy;
				_spawned=false;
				
			};
		};


		if(not _spawned) then 
		{
			if(not isNull (_leader findNearestEnemy position _leader) or not (alive _leader)) then 
			{
				hint format["heknows: %1 units to spawn = %2",(_leader findNearestEnemy position _leader),_units];
				_newselect = [_grp,_units] call BIS_EVO_InfDummyReplace;
				_spawned=true;
				_leader = leader _grp;
				_units = [];
			};
		};
		if(count units _grp == 0) then {_loop=1};
		//if(makealive) then {[_grp,_units] call BIS_EVO_InfDummyReplace;_spawned=true};
		sleep 1+(round random 1);
	};
	Sleep 1.0;
	hint "group deleted";
	deleteGroup _grp;
};

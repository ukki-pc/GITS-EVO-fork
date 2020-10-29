// Respawning military vehicles
BIS_EVO_VecRm =
{	
	_time = 1+(random 1);
	sleep _time;
	_vcl = _this select 0;
	_class = TypeOf _vcl;
	_vcount = _this select 1;
//	_class = _this select 1; //added
	_rtime = _this select 2;
	_respawnpoint = position _vcl;
	_vecup = vectorUp _vcl;
	_vecdir = vectorDir _vcl;
	
	_zone = createTrigger ["EmptyDetector", _respawnpoint ]; // Make a zone to detect when to cull
	_zone setTriggerActivation ["WEST", "PRESENT", false];
	_zone setTriggerArea [300, 300, 0, true];
	_zone setTriggerStatements ["this", "", ""];
	
	
	_Addevents = // Missile warning system for aircraft and Transport reward
	{
		if(_vcl isKindOf "Air") then 
		{
			_warning = _vcl addEventHandler["IncomingMissile",{if ((_this select 1) in BIS_EVO_aaweapons) then 
			{	
				BIS_EVO_mtar = driver (_this select 0);
				publicVariable "BIS_EVO_mtar";
			}}];
		};	
		_getin = _vcl addEventHandler ["GetIn", {handle = [(_this select 0),(_this select 1)] execVM call BIS_EVO_Boarding}];
		if(_getin > 1) then {_vcl removeEventHandler ["GetIn", _getin]};		
	};
	[] call _Addevents;

	for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do
	{
		_cull = false;
		_stime = _rtime;
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
			sleep _time;
			if(count units _vcl == 0) then // Vehicle does not have crew
			{
				if(count list _zone == 0 and (_vcl distance _respawnpoint) < 10 and not (_vcl in list airportin)) then
				{// No person near the spawn point and vehicle has not been moved so it will cull, continue to next loop
					_cull = true;
					_loop=1
				}; 
				if ((_vcl distance _respawnpoint) > 50) then {_loop=1}; // Vehicle has been moved, continue to next loop
			};
			if(not alive _vcl) then {{_x setpos position _vcl} forEach crew _vcl;_loop=1}; // Vehicle is dead at spawn, continue to next loop
		};
		if (_vcl in list airportin) then
		{
			_stime = 240; // Vehicle was destroyed at spawn
		};	
		_i = 0;
		while {_i <= _stime} do 
		{
			if (_i == _stime or _cull) then 
			{
				  // Eject dead crew before deleting
				deleteVehicle _vcl;
				Sleep 1.0;
				for [{_loop3=0}, {_loop3<1}, {_loop3=_loop3}] do // Waiting for a player to come near the spawn point
				{
					if(count list _zone > 0) then {_loop3=1;_i = _stime};
					Sleep 1.0;
				};
				
				_vcl = _class createVehicle _respawnpoint; // Recreate the vehicle.
				_vcl setpos _respawnpoint;
				_vcl setVectorDirAndUp [_vecdir,_vecup];
				Sleep 1.0;
				[] call _Addevents;
			};
			if (count units _vcl > 0) then {_i = _stime;};
			_i = _i + 10;
			if (_i < _stime) then {sleep 10.0}; 
		};	
		sleep 1.0;
	};

};

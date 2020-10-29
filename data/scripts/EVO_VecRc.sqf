/*
// Respawning civilian vehicles
BIS_EVO_VecRc =
{
	_time = 1+(random 1);
	sleep _time;
	_vcl = _this select 0;
	
	_rtime = _this select 1;
	_respawnpoint = position _vcl;
	_vecup = vectorUp _vcl;
	_vecdir = vectorDir _vcl;	
	
_civcars = ["Skoda","SkodaBlue","SkodaRed","SkodaGreen","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","car_hatchback","Ikarus","Bus_city","UralCivil2","Lada1","tractor","UralCivil","car_sedan","Lada2","LadaLM","MMT_Civ","TT650_Civ","V3S_Civ","VWGolf"];
	_max = count _civcars;
	
	_zone = createTrigger ["EmptyDetector", _respawnpoint ];
	_zone setTriggerActivation ["WEST", "PRESENT", false];
	_zone setTriggerArea [300, 300, 0, true];
	_zone setTriggerStatements ["this", "", ""];
	
	for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do
	{
		sleep _time;
		_cull = false;
		_stime = _rtime;
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
			sleep _time;
			if(count units _vcl == 0) then
			{
				if(count list _zone == 0 and (_vcl distance _respawnpoint) < 10 and not (_vcl in list airportin)) then {_cull = true;_loop=1};
				if ((_vcl distance _respawnpoint) > 50) then {_loop=1};
			};
			if(not alive _vcl) then {{_x setpos position _vcl} forEach crew _vcl;_loop=1};
		};
		if (_vcl in list airportin) then
		{
			_stime = 60;
		};	
		_i = 0;
		while {_i <= _stime} do 
		{
			if (_i == _stime or _cull) then 
			{
				deleteVehicle _vcl;
				for [{_loop3=0}, {_loop3<1}, {_loop3=_loop3}] do
				{
					if(count list _zone > 0) then {_loop3=1;_i = _stime};
					sleep 1.0;
				};
				_rnd = round random (_max - 1);
				_vcl = (_civcars select _rnd) createVehicle _respawnpoint;Sleep BIS_EVO_GlobalSleep;
				_vcl setpos _respawnpoint;
				_vcl setVectorDirAndUp [_vecdir,_vecup];					
				_getin = _vcl addEventHandler ["GetIn", {handle = [(_this select 0),(_this select 1)] execVM call BIS_EVO_Boarding}];
				if(_getin > 1) then {_vcl removeEventHandler ["GetIn", _getin]};
			};
			if (count units _vcl > 0) then {_i = _stime;};
			_i = _i + 10;
			if (_i < _stime) then {sleep 10.0}; //10 mins
		};	
		sleep 1.0;
	};
};
*/
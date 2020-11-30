private ["_tempAgr","_veh","_pVec","_handle","_respInterceptor","_it"];
_respInterceptor = false;
_it = 0;

capdown = {
	_respInterceptor = false;
	hint "ded";
};

while {true} do {

	_tempAgr = EGG_EVO_airAggression;
	_pVec = vehicle player;
	_veh = typeof _pVec;

	if((_veh in hikiAirList) && (getPos _pVec select 2 > 100)) then {
		if (_tempAgr < 100)  then {
			_tempAgr = _tempAgr + 2;
		};
	}
	//AIR REGRESSION
	else{ if(_tempAgr > 0) then {
			_tempAgr = _tempAgr -1;
		};
	};


	if(_tempAgr != EGG_EVO_airAggression) then {
		EGG_EVO_airAggression = _tempAgr;
		publicVariable "EGG_EVO_airAggression";
		systemChat format ["air aggression: %1 %2",EGG_EVO_airAggression, _it];
	};


	if((_tempAgr > 10) && !(_respInterceptor)) then {
		_respInterceptor = true;
		systemChat "Interceptor responding";
		_handle = [] execVM "data\scripts\makesu.sqf";
	};


	_it = _it +1;
	if(_it == 10) then { _it = 0};

    sleep 1;
	};

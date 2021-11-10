// Sends destroyed vehicle back to the vehicle storage array
local _veh = _this select 0;
local _delay = _this select 1;
local _vec = typeof _veh;


if(_veh isKindOf "Plane") then {Enemyplanes = Enemyplanes - [_veh]};

sleep _delay;
_displayName = getText(configFile >> "CfgVehicles" >> _vec >> "displayName");
systemChat format ["%1 is now ready in vehicle pool!",_displayName];
deletevehicle _veh;
	
storedVehicles = storedVehicles + [_vec];
/*
	for [{_loop=0}, {_loop < (count buyAirList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyAirList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 is now ready in vehicle pool!",_displayName];
			buyAirList set [_loop,[(buyAirList select _loop) select 0,(buyAirList select _loop) select 1,((buyAirList select _loop) select 2)+1]];
			publicVariable "buyAirList";
		};	
	};

	//CAR
	for [{_loop=0}, {_loop < (count buyCarList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyCarList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 is now ready in vehicle pool!",_displayName];
			buyCarList set [_loop,[(buyCarList select _loop) select 0,(buyCarList select _loop) select 1,((buyCarList select _loop) select 2)+1]];
			publicVariable "buyCarList";
		};	
	};

	for [{_loop=0}, {_loop < (count buyTankList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyTankList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 is now ready in vehicle pool!",_displayName];
			buyTankList set [_loop,[(buyTankList select _loop) select 0,(buyTankList select _loop) select 1,((buyTankList select _loop) select 2)+1]];
			publicVariable "buyTankList";
		};	
	};

	for [{_loop=0}, {_loop < (count buyStatList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyStatList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 is now ready in vehicle pool!",_displayName];
			buyStatList set [_loop,[(buyStatList select _loop) select 0,(buyStatList select _loop) select 1,((buyStatList select _loop) select 2)+1]];
			publicVariable "buyStatList";
		};	
	};
*/
// Sends destroyed vehicle back to the vehicle storage array
private ["_vec","_checkVeh","_found"]; 
_veh = _this select 0;
_vec = typeof _veh;

_displayName = getText(configFile >> "CfgVehicles" >> _vec >> "displayName");

	sleep 900.0;

	for [{_loop=0}, {_loop < (count buyAirList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyAirList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 is now ready in vehicle pool!",_displayName];
			buyAirList set [_loop,[(buyAirList select _loop) select 0,(buyAirList select _loop) select 1,((buyAirList select _loop) select 2)+1]];
			publicVariable "buyAirList";
			deletevehicle _veh;
		};	
		sleep BIS_EVO_GlobalSleep;
	};

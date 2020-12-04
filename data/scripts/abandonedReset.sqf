// Sends destroyed vehicle back to the vehicle storage array
private ["_vec","_veh","_checkVeh","_found","_return"]; 
_veh = _this select 0;
_vec = typeof _veh;
_return = false;

_displayName = getText(configFile >> "CfgVehicles" >> _vec >> "displayName");

	for [{_loop=0}, {_loop < (count buyCarList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyCarList select _loop) select 0);	
		if (_vec == _checkVeh) exitWith 
		{
			systemChat format ["%1 was abandoned and is now ready in vehicle pool!",_displayName];
			buyCarList set [_loop,[(buyCarList select _loop) select 0,(buyCarList select _loop) select 1,((buyCarList select _loop) select 2)+1]];
			publicVariable "buyCarList";
			deletevehicle _veh;
			_return = true;
		};	
		sleep BIS_EVO_GlobalSleep;
	};
_return;
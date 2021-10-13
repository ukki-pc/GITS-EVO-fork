// Gib vehicle for unlock
_player = _this select 0;
_counter = 0;
_i = 0;
_veh = vehicle _player;

_type = typeOf _veh;
/*
_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayName");
// hint format ["%1, %2, %3",_player, _veh,_type];
_checkVeh ="";
// _countVehs = count buyCarList + count buyTankList + count buyCarList + buyStatList;
_found = false;



	for [{_loop=0}, {_loop < (count buyCarList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyCarList select _loop) select 0);	
		if (_type == _checkVeh) then 
		{
		hint format ["Added %1 to Car List",_displayName];
		buyCarList set [_loop,[(buyCarList select _loop) select 0,(buyCarList select _loop) select 1,((buyCarList select _loop) select 2)+1]];
		publicVariable "buyCarList";
		_found = true;
		_loop = count buyCarList;
		};	
	};

	for [{_loop=0}, {_loop < (count buyTankList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyTankList select _loop) select 0);	
		if (_type == _checkVeh) then 
		{
		hint format ["Added %1 to Tank List",_displayName];
		buyTankList set [_loop,[(buyTankList select _loop) select 0,(buyTankList select _loop) select 1,((buyTankList select _loop) select 2)+1]];
		publicVariable "buyTankList";
		_found = true;
		_loop = count buyTankList;
		};	
	};

	for [{_loop=0}, {_loop < (count buyAirList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyAirList select _loop) select 0);	
		if (_type == _checkVeh) then 
		{
		hint format ["Added %1 to Air List",_displayName];
		buyAirList set [_loop,[(buyAirList select _loop) select 0,(buyAirList select _loop) select 1,((buyAirList select _loop) select 2)+1]];
		publicVariable "buyAirList";
		_found = true;
		_loop = count buyAirList;
		};	
	};

	for [{_loop=0}, {_loop < (count buyStatList)}, {_loop=_loop+1}] do 
	{
		_checkVeh =  ((buyStatList select _loop) select 0);	
		if (_type == _checkVeh) then 
		{
		hint format ["Added %1 to Stat List",_displayName];
		buyStatList set [_loop,[(buyStatList select _loop) select 0,(buyStatList select _loop) select 1,((buyStatList select _loop) select 2)+1]];
		publicVariable "buyStatList";
		_found = true;
		_loop = count buyStatList;
		};	
	};
	
	 if(!_found) then
	 {
		//Search the car
	 	for [{_loop=0}, {_loop < (count buySpecialList)}, {_loop=_loop+1}] do 
		{
			_checkVeh =  ((buySpecialList select _loop) select 0);	

	 	if (_type == _checkVeh) then 
 		{
	 		buySpecialList set [_loop,[(buySpecialList select _loop) select 0,((buySpecialList select _loop) select 1)+1]];
	 		_loop = count buySpecialList;
	 		_found = true;
	 		};
	 	};

	 	_index = count buySpecialList;

	 	if(!_found)then
		 {
			hint format ["Added %1 to Special list",_displayName];
			buySpecialList set [_index,[_type,1]];
			publicVariable "buySpecialList";
			_found = true;
	 	};
	 };


*/
storedVehicles = storedVehicles + [_type];
deleteVehicle _veh;
manGunner=
{
	private ["_vehicles","_units","_unit","_unit","_car","_unit","_driver"];
    _vehicles = [];
	_units = [];
	_unit = objnull;
	_car = nil;

	//Find vehicle with turret but without gunner
	{
		//Empty vehicles are always returned as civilian
		if((side _x == civilian or side _x == EGG_EVO_ENEMYFACTION) and isnull gunner _x and count (_x weaponsTurret [0]) > 0 and canMove _x) then 
		{
			_vehicles = _vehicles + [_x];
		};
		sleep BIS_EVO_GlobalSleep;
	} foreach ( nearestobjects [position BIS_EVO_DetectEnemy,["LandVehicle"],300]);

	//Pick one randomly from the found vehicles
	_car = _vehicles select (round(random(count _vehicles)))-1;
	if !(isNil "_car") then 
	{
		{
			//get soldiers from near the vehicle
			if(!isPlayer _x and side _x == EGG_EVO_ENEMYFACTION and _x isKindOf "Man" and alive _x) then 
			{
				if(count _units < 5) then 
				{
					_units = _units + [_x];
				};
			};

			sleep BIS_EVO_GlobalSleep;
		} foreach ( nearestobjects [position _car,["Man"],200]);


	if(count _units > 0) then 
	{
		//Pick on unit at randomly
		//systemChat format ["%1",_units];
		_unit = _units select round ((random(count _units)-1));
		_unit assignAsGunner _car;
		[_unit] orderGetIn true;

		_driver = driver _car;

		if(!isNil "_driver") then 
		{
			commandStop _driver;
		};

		_unit setBehaviour "CARELESS";
	//systemChat format ["Sending %1 to %2", typeof _unit, typeof _car];

		for [{_rloop=0}, {_rloop<60}, {_rloop=_rloop + 1}] do
		{
			if(_unit in _car) then {_rloop = 60};
			sleep 4;
		};
	//	systemChat  "Embarked vehicle";
		_unit setBehaviour "AWARE";
	 };
	}
	//else{systemChat "No cars found";};
};

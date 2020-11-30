private ["_who","_stattype","_laction1","_zvector","_dist","_zfactor","_vec","_inrepairzone"];

_stattype = _this select 1;
_who = _this select 0;
_dist = 8;
_zfactor = 0;
_inrepairzone = true;
_type = _stattype;
cstatA removeaction wcam;
_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayName");


		VehiclePlaced = 0;
		_who allowDamage false;
		cstatA = _stattype createVehicle [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist)];
		cstatA enableSimulation false;
		cstatA lock true;
		_laction1 = _who addAction ["Place Vehicle","actions\static\vehiclePlaced.sqf"];

		WHILE {VehiclePlaced == 0 && _inrepairzone} DO
		{
			_inrepairzone = ((_who in list AirportIn) or (_who in list farp1) or (_who in list farp2) or (_who in list farp3) or (_who in list farp4) or (_who in list dock1) or (_who in list LHDin));
			_zvector = ((_who weaponDirection (primaryWeapon _who)) select 2) * 3;
			cstatA setposATL [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist), (getposATL _who select 2) + _zvector + _zfactor];
			cstatA setDir (getDir _who+90);
			sleep 0.05;
			/*
			//adding to fix rocket bug
			if not(vehicle player == player) then 
			{
				deletevehicle cstatA;
				VehiclePlaced =1;
				player setpos [(getpos _who select 0), (getpos _who select 1),0];
			};
			*/
		};
	cstatA enableSimulation true;
	_who allowDamage true;
	if(_stattype isKindOf "Land") then 
	{
	cstatA setVehicleInit "veh = [this, 10, 0, 0, FALSE, TRUE,""this setDammage 0.5,this setFuel 0""] execVM ""vehicle.sqf""";
	processInitCommands;
	//_handle = [cstatA,_type,_displayName,position cstatA] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
	};
	if(_stattype isKindOf "Air") then 
	{
	cstatA setVehicleInit "veh = [this, 900, 0, 0, FALSE, FALSE] execVM ""vehicle.sqf""";
	processInitCommands;
	};
		cstatA lock false;
		_who removeAction _laction1;
	
	if(cstatA isKindOf "Air") then {
		wcam = cstatA addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
		};
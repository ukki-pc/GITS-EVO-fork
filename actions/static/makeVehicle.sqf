private ["_who","_cstatA","_stattype","_laction1","_zvector","_dist","_zfactor","_vec","_inrepairzone"];

_stattype = _this select 1;
_who = _this select 0;
_dist = 8;
_zfactor = 0;
_inrepairzone = true;
_type = _stattype;
_cstatA = objNull;
_cstatA removeaction wcam;
_displayName = getText(configFile >> "CfgVehicles" >> _type >> "displayName");


		VehiclePlaced = 0;
		_who allowDamage false;
		_cstatA = _stattype createVehicle [(getposATL _who select 0) + (sin(getdir _who) * _dist), (getposATL _who select 1) + (cos(getdir _who) * _dist)];
		_cstatA enableSimulation false;
		_cstatA lock true;
		_laction1 = _who addAction ["Place Vehicle","actions\static\vehiclePlaced.sqf"];

			_cstatA attachTo [player, [
				0,
				(((boundingBox _cstatA select 1 select 1) max (-(boundingBox _cstatA select 0 select 1))) max ((boundingBox _cstatA select 1 select 0) max (-(boundingBox _cstatA select 0 select 0)))) +3,
				1]
			];
		sleep 0.5;
		waitUntil{vehiclePlaced == 1};

		//Careful placement while in carrier
		if(player in list LHDin) then {
			_cstatA setPosASL [getPos _cstatA select 0, getPos _cstatA select 1, 18];
		}
		else {
			_cstatA setPos [getPos _cstatA select 0, getPos _cstatA select 1, 0];
		};
		_cstatA setVelocity [0, 0, 0];
		
	detach _cstatA;
	_cstatA enableSimulation true;
	_who allowDamage true;
	
	//Event handler to prevent repair whilst taking damage
	_cstatA addEventHandler ["Dammaged",{execVM "data\scripts\hitcooldown.sqf"}];

	if(_stattype isKindOf "Land") then 
	{
	//format is "veh = [_unit, _delay, _deserted, _respawns, _explode, _dynamic, _unitinit] execVM ""scripts\vehicle.sqf""";
	_cstatA setVehicleInit "veh = [this, 10, 0, 0, FALSE, TRUE,""this setDammage 0.8,this setFuel 0""] execVM ""vehicle.sqf""";
	processInitCommands;
	};
	if(_stattype isKindOf "Air") then 
	{
	_cstatA addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\addToPurList.sqf"}];
		if(_stattype in customPlanes) then 
		{
			_handle = [_cstatA] execVM "data\scripts\customLoadout.sqf";
		};
	processInitCommands;
	};
		_cstatA lock false;
		_who removeAction _laction1;
	
	if(_cstatA isKindOf "Air") then {
		wcam = _cstatA addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
	};
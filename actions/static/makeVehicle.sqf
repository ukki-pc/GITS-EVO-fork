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

			cstatA attachTo [player, [
				0,
				(((boundingBox cstatA select 1 select 1) max (-(boundingBox cstatA select 0 select 1))) max ((boundingBox cstatA select 1 select 0) max (-(boundingBox cstatA select 0 select 0)))) +2,
				1]
			];
		sleep 0.5;
		waitUntil{vehiclePlaced == 1};
		cstatA setPos [getPos cstatA select 0, getPos cstatA select 1, 0];
		cstatA setVelocity [0, 0, 0];
		
	detach cstatA;
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
	cstatA addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\addToPurList.sqf"}];
	processInitCommands;
	};
		cstatA lock false;
		_who removeAction _laction1;
	
	if(cstatA isKindOf "Air") then {
		wcam = cstatA addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
		};
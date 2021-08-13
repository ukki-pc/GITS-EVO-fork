private ["_who","_cstatA","_stattype","_laction1","_zvector","_dist","_zfactor","_vec"];

_stattype = _this select 1;
_who = _this select 0;
_dist = 8;
_zfactor = 0;
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
			_cstatA setPosASL [getPos _cstatA select 0, getPos _cstatA select 1, 18.5];
		}
		else {
			_cstatA setPos [getPos _cstatA select 0, getPos _cstatA select 1, 0.5];
		};
		_cstatA setVelocity [0, 0, 0];
		
	detach _cstatA;
	_cstatA enableSimulation true;
	_who allowDamage true;
	_cstatA addEventHandler ["GetIn",{_hndl = [_this select 0,_this select 1, _this select 2] execVM "data\scripts\upgNotif.sqf"}];
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
	_cstatA addEventHandler ["killed", {handle = [_this select 0,900] execVM "data\scripts\addToPurList.sqf"}];
		if(_stattype in customPlanes) then 
		{
		//	_handle = [_cstatA] execVM "data\scripts\customLoadout.sqf";
		};
	processInitCommands;
	};
		_cstatA lock false;
		_who removeAction _laction1;
		[_cstatA,_type,"",position _cstatA] spawn BIS_EVO_VecR;
	
	if(_stattype isKindOf "Air" or (_stattype in BIS_EVO_camVehicles)) then {
		wcam = _cstatA addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
		wcame = _cstatA addEventHandler ["Fired", {[_this select 0,_this select 4] execVM "actions\miscamA3.sqf"}];
	};
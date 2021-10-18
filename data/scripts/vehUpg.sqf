_upgVeh = _this select 0;

_vehicle = vehicle player;

_pos = getPosASL _vehicle;
_dir = getDir _vehicle;
deleteVehicle _vehicle;

_new = createVehicle [_upgVeh,  _pos, [], 0, "NONE"];
_newType = typeof _new;
_new setPosASL _pos;
_new setDir _dir;
player moveInDriver _new;

//Add same eventhandlers as in vehicle buy action

//Event handler to prevent repair whilst taking damage
	_new addEventHandler ["Dammaged",{execVM "data\scripts\hitcooldown.sqf"}];

	if(_newType isKindOf "Land") then 
	{
	//format is "veh = [_unit, _delay, _deserted, _respawns, _explode, _dynamic, _unitinit] execVM ""scripts\vehicle.sqf""";
	_new setVehicleInit "veh = [this, 10, 0, 0, FALSE, TRUE,""this setDammage 0.8,this setFuel 0""] execVM ""vehicle.sqf""";
	processInitCommands;
	};
	if(_newType isKindOf "Air") then 
	{
	_new addEventHandler ["killed", {handle = [_this select 0,900] execVM "data\scripts\addToPurList.sqf"}];
		if(_newType in customPlanes) then 
		{
			_handle = [_new] execVM "data\scripts\customLoadout.sqf";
		};
	processInitCommands;
	};
	
	if(_new isKindOf "Air") then {
		wcam = _new addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"];
	};

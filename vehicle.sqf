/*  
==================================================================================================================
  Simple Vehicle Respawn Script v1.8 for Arma 3
  by Tophe of �stg�ta Ops [OOPS]
  
  Put this in the vehicles init line:
  veh = [this] execVM "vehicle.sqf"

  
  Options:
  There are some optional settings. The format for these are:
  veh = [object, Delay, Deserted timer, Respawns, Effect, Dynamic] execVM "vehicle.sqf"
  
  Default respawn delay is 30 seconds, to set a custom respawn delay time, put that in the init as well. 
  Like this:
  veh = [this, 15] execVM "vehicle.sqf"

  Default respawn time when vehicle is deserted, but not destroyed is 120 seconds. To set a custom timer for this 
  first set respawn delay, then the deserted vehicle timer. (0 = disabled) 
  Like this:  
  veh = [this, 15, 10] execVM "vehicle.sqf"

  By default the number of respawns is infinite. To set a limit first set preceding values then the number of respawns you want (0 = infinite).
  Like this:
  veh = [this, 15, 10, 5] execVM "vehicle.sqf"

  Set this value to TRUE to add a special explosion effect to the wreck when respawning.
  Default value is FALSE, which will simply have the wreck disappear.
  Like this:
  veh = [this, 15, 10, 5, TRUE] execVM "vehicle.sqf"
  
  By default the vehicle will respawn to the point where it first was when the mission started (static). 
  This can be changed to dynamic. Then the vehicle will respawn to the position where it was destroyed. 
  First set all preceding values then set TRUE for dynamic or FALSE for static.
  Like this:
  veh = [this, 15, 10, 5, TRUE, TRUE] execVM "vehicle.sqf"
  
  If you you want to set the INIT field of the respawned vehicle, first set all other values, then set init commands. 
  Those must be inside quotations.
  Like this:
  veh = [this, 15, 10, 5, TRUE, FALSE, "this setDammage 0.5"] execVM "vehicle.sqf"
  
  Default values of all settings are:
  veh = [this, 30, 120, 0, FALSE, FALSE] execVM "vehicle.sqf"
  
plane
veh = [this, 1800, 1800, 0, FALSE, FALSE] execVM "scripts\vehicle.sqf"
tank
veh = [this, 30, 3600, 0, FALSE, TRUE, "this setDammage 0.5;this setFuel 0"] execVM "scripts\vehicle.sqf"
	
Contact & Bugreport: cwadensten@gmail.com
================================================================================================================== */

//test vehicle hunter v8
//init="veh = [this, 2, 0, 0, FALSE, TRUE, ""this setDammage 0.5;this setFuel 0""] execVM ""scripts\vehicle.sqf""";
//format is "veh = [_unit, _delay, _deserted, _respawns, _explode, _dynamic, _unitinit] execVM ""scripts\vehicle.sqf""";

if (!isServer) exitWith {};
//waituntil {(EGG_sinit==1)};
// Define variables
_unit = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {30};

_deserted = if (count _this > 2) then {_this select 2} else {120};


_respawns = if (count _this > 3) then {_this select 3} else {0};
_explode = if (count _this > 4) then {_this select 4} else {false};
_dynamic = if (count _this > 5) then {_this select 5} else {false};
_unitinit = if (count _this > 6) then {_this select 6} else {};
_haveinit = if (count _this > 6) then {true} else {false};

//Respawn count override
if(isNil "BIS_EVO_vehRespawnCount") then {_respawns = -1}
else {_respawns = BIS_EVO_vehRespawnCount};
§
_hasname = false;
_unitname = vehicleVarName _unit;
if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};
_noend = true;
_run = true;
_rounds = 0;

if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};
if (_respawns == 0) then {_respawns= 0; _noend = false;};
if (_respawns > 0) then {_noend = false};
if (_respawns == -1) then {_respawns = 0;_noend = true};

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;

//EGGBEAST adding marker text

_rtime = 0;

EGG_EVO_Frew = 
{
	_unit = _this select 0;
	if(time > _rtime) then 
	{
		if (_unit in list reng1) then
		{
			EGG_EVO_epoint = reng1;
			publicVariable "EGG_EVO_epoint";
		};
		if (_unit in list reng2) then
		{
			EGG_EVO_epoint = reng2;
			publicVariable "EGG_EVO_epoint";
		};
		if (_unit in list reng3) then
		{	
			EGG_EVO_epoint = reng3;
			publicVariable "EGG_EVO_epoint";
		};
		if (_unit in list reng4) then
		{
			EGG_EVO_epoint = reng4;
			publicVariable "EGG_EVO_epoint";
		};
		_rtime = time+600;
	};
};

_name = getText(configFile >> "CfgVehicles" >> format["%1", _type] >> "displayName");
_markerobj5 = "";


//hint format["name: %1",_markername];

_vecmarkerb = 
{
	private ["_markername","_markerobj5","_name","_need"];
	_unit = _this select 0;
	_name = _this select 1;
//	hint format["name: %1",_unitname];

	if (not (_unit in list airportin)) then
	{
		_mrktype = "b_mech_inf";
		if (_unit isKindOf "Car") then {_mrktype = "plp_icon_vehicle"};
		if (_unit isKindOf "Tank") then {_mrktype = "plp_icon_tank"};
		if (_unit isKindOf "Plane") then {_mrktype = "plp_icon_planeLight"};
		//unique id from mission name added to each vehicle
		_markername = vehicleVarname _unit;
		_markerobj5 = createMarker[format ["%1",_markername],[getpos _unit select 0,getpos _unit select 1]];
		_markerobj5 setMarkerColor "ColorBlue";
		_markerobj5 setMarkerType _mrktype;
		_markerobj5 setMarkerSize [0.8, 0.8];
		if ( Fuel _unit ==0) then 
		{
			_need = localize "str_ep1_sentfuellow_1";
			_markerobj5 setMarkerText format ["%1 %2",_name,_need];
			// needs repair STR_M04t46
		}else
		{
			_markerobj5 setMarkerText format ["%1", _name];
		};
	}
	else
	{
		if ( !(isNil _markerobj5) ) then
		{
			deleteMarker _markerobj5;
		};
	};
};
//ends


// Start monitoring the vehicle
while {sleep 1; _run} do 
{	
	sleep (2 + random 10);
      if ((getDammage _unit > 0.8) and ({alive _x} count crew _unit == 0)) then {_dead = true};

// Check if the vehicle is deserted.
	if (_deserted > 0) then
	{
		if ((getPosASL _unit distance _position > 10) and ({alive _x} count crew _unit == 0) and (getDammage _unit <= 0.8)) then 
		{
			_timeout = time + _deserted;
			sleep 0.1;
//EGG adding
			[_unit, _name] call _vecmarkerb;
		 	waitUntil {( (_timeout < time) or (! alive _unit) or ({alive _x} count crew _unit > 0) )};
//EGG adding
			if !(isNil _markerobj5) then
			{
				deleteMarker _markerobj5;
			};
			if ({alive _x} count crew _unit > 0) then {_dead = false}; 
			if ({alive _x} count crew _unit == 0) then {_dead = true; _nodelay =true}; 
			if !(alive _unit) then {_dead = true; _nodelay = false}; 
		};
	};

// Respawn vehicle
	_wet=0;
      if (_dead) then 
	{	
		_posasl = getPosASL _unit;
		if (_posasl select 2 < 1.0) then 
		{
			_wet=1;
		};
		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay;};
		if ((_dynamic) and (_wet==0)) then {_position = getPosASL _unit; _dir = getDir _unit;};
		if (_explode) then {_effect = "M_AT" createVehicle getPosASL _unit; _effect setPosASL getPosASL _unit; hint "dude";};
		sleep 0.1;
		deleteVehicle _unit;
//EGG adding
		if !(isNil _markerobj5) then
		{
			deleteMarker _markerobj5;
		};
		sleep 2;

		if(_respawns > 0) then {
			_unit = _type createVehicle _position;
			_unit setPosASL _position;
			_unit setDir _dir;

	//EGG adding script to place statics and weapons into vehicle cargoes
	//		_cargoadd = [_unit] spawn "data\scripts\static_cargo.sqf";
	//		_cargoadd = [_unit] call EGG_EVO_static_cargo;
	//		sleep 1.0;
	//

			if (_haveinit) then 
			{
				_unit setVehicleInit format ["%1;", _unitinit];
				processInitCommands;
			};
			if (_hasname) then 
			{
				_unit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_unitname];
				processInitCommands;
			};
			_dead = false;

	//EGG adding
			[_unit, _name] call _vecmarkerb;
			// Check respawn amount
			if !(_noend) then {_rounds = _rounds + 1};
			if ((_rounds == _respawns) and !(_noend)) then {_run = false;};
			WaitUntil{( (damage _unit == 0) or !(alive _unit) )};
	//		[_unit] call EGG_EVO_Frew;
		}
		else {deleteMarker _markerobj5; _run = false;};
	};

//manage live vehicles

//add a marker for stationary empty vehicle without _deserted>0
	if ( (_unit distance _position > 10) and (getDammage _unit < 0.51) and (Fuel _unit > 0.2) and ({alive _x} count crew _unit <1) and (_deserted==0) and (isNil _markerobj5) )then 
	{
		[_unit,_name] call _vecmarkerb;
	};
//check if vehicle is healthy and occupied
	if ( (_unit distance _position > 10) and (getDammage _unit < 0.8) and (Fuel _unit > 0.2) and ({alive _x} count crew _unit >0) and !(isNil _markerobj5))then 
	{
		deleteMarker _markerobj5;
	};
};
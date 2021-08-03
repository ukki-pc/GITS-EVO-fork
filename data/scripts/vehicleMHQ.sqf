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
_ismhq = true;

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;
_run = true;


private ["_markername","_markerobj5","_name","_need"];
_unit = _this select 0;
_name = "MHQ";

_mrktype = "plp_icon_helicopterCargo";
_markerobj5 = createMarker["mhqmark",[getpos _unit select 0,getpos _unit select 1]];
_markerobj5 setMarkerColor "ColorBlue";
_markerobj5 setMarkerType _mrktype;
_markerobj5 setMarkerText "MHQ";



// Start monitoring the vehicle
while {_run} do 
{	
	sleep (2 + random 10);
      if ((getDammage MHQ > 0.8) and ({alive _x} count crew MHQ == 0)) then {_dead = true};


// MHQ DED
	_wet=0;
    if (_dead) then 
	{	
		_posasl = getPosASL MHQ;
		if (_posasl select 2 < 1.0) then 
		{
			_wet=1;
		};
		sleep 0.1;
		deleteVehicle MHQ;
//EGG adding
		if !(isNil _markerobj5) then
		{
			deleteMarker _markerobj5;
		};
		sleep 2;

		MHQ = _type createVehicle _position;
		MHQ setPosASL _position;
		MHQ setDir _dir;

		_dead = false;

	};
		_posa = getposASL MHQ;
		"mhqmark" setMarkerpos _posa;
		if ((_posa select 2) < -2) then 
		{
			MHQ setdammage 1; 
			sleep 1;
		};
};
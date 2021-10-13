	
//Sends player to a specific vehicle
_targetPlayer = _this select 0;
_targetVehicle = _this select 1;



	if((!alive _targetVehicle) or (vehiclePlaced == 0) or (R3F_LOG_mutex_local_verrou)) exitWith{hint "You cannot do that right now."; };



	player setPosASL [(getPosASL _targetVehicle select 0) + 1, (getPosASL _targetVehicle select 1) +1, (getPosASL _targetVehicle select 2)];
	player moveInDriver _targetVehicle;
	player moveInGunner _targetVehicle;
	player moveInCommander _targetVehicle;
	player moveInCargo _targetVehicle;
	call fnc_hideMarkers;

//	player SetPosASL [(getMarkerPos "MHQ" select 0),(getMarkerPos "MHQ" select 1),(getMarkerPos "MHQ" select 2)];
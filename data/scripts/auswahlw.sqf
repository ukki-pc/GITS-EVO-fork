	if(!alive MHQ or (vehiclePlaced == 0) or (R3F_LOG_mutex_local_verrou)) exitWith{hint "You cannot do that right now."; };



	player setPosASL [(getPosASL MHQ select 0) + 1, (getPosASL MHQ select 1) +1, (getPosASL MHQ select 2)];
	player moveInDriver MHQ;
	player moveInGunner MHQ;
	player moveInCommander MHQ;
	player moveInCargo MHQ;

//	player SetPosASL [(getMarkerPos "MHQ" select 0),(getMarkerPos "MHQ" select 1),(getMarkerPos "MHQ" select 2)];
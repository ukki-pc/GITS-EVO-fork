// Arma 2 function

private ["_TheVehicle","_TheVehicleIsUsed"];

_TheVehicle = _this;

_TheVehicleIsUsed = ! (isNull (assignedDriver _TheVehicle));

//hintSilent format ["1 _TheVehicleIsUsed = %1; %2", _TheVehicleIsUsed, assignedDriver _TheVehicle];

if ( ! _TheVehicleIsUsed ) then {
	
	_TheVehicleIsUsed = ((count (assignedCargo _TheVehicle)) >= 1);

    //hintSilent format ["2 _TheVehicleIsUsed = %1", _TheVehicleIsUsed];

	if ( ! _TheVehicleIsUsed ) then {
	
		_TheVehicleIsUsed = ((count (crew _TheVehicle)) >= 1);

		//hintSilent format ["3 _TheVehicleIsUsed = %1", _TheVehicleIsUsed];
	}; 
};

_TheVehicleIsUsed;
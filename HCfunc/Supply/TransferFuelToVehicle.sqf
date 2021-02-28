// Arma 2 function

private ["_Group","_VehicleToSupply","_SupplyVehicle","_SupplyVehicles","_FuelLevel",
         "_FinishedRefueling"];

_Group = _this select 0;
_VehicleToSupply = _this select 1;
_SupplyVehicle = _this select 2;

_SupplyVehicles = [_Group] call F_GetGroupsVehiclesIn;
_FinishedRefueling = true;

if ( (count _SupplyVehicles) == 1 ) then {
	if ( _SupplyVehicle == (_SupplyVehicles select 0) ) then {
		
		_FuelLevel = fuel _VehicleToSupply;
		
		if ( (_FuelLevel < 1)
				and ((_SupplyVehicle distance _VehicleToSupply) <= 25)
				and ((speed _VehicleToSupply) <= 0.5)
				and (((getPosATL _VehicleToSupply) select 2) <= 1.0) ) then {
			
			_FuelLevel = (_FuelLevel + 0.01) min 1;
			_VehicleToSupply setFuel _FuelLevel;
			_FinishedRefueling = (_FuelLevel >= 1);
		};
		
		//hintSilent format ["_VehicleToSupply = %1, _FuelLevel = %2\n_FinishedRefueling = %3",
		//                   _VehicleToSupply, _FuelLevel, _FinishedRefueling];
	};
};

_FinishedRefueling;
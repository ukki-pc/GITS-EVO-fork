// Arma 2 function

private ["_Vehicles","_LoopUpOption","_ObjectTypesAndNumOf","_NumVehicles","_vi",
         "_Vehicle","_ObjectsTypes","_VehicleTurrets","_NumVehicleTurrets","_ti"];

_Vehicles = + (_this select 0);
_LoopUpOption = _this select 1;
_ObjectTypesAndNumOf = + (_this select 2);

_NumVehicles = count _Vehicles;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {
 
	_Vehicle = _Vehicles select _vi;

	switch (_LoopUpOption) do {
				
		case 1: { 
			_ObjectsTypes = getMagazineCargo _Vehicle;
			_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeCountTotals;
		};
		case 2: {
			_VehicleTurrets = (typeOf _Vehicle) call F_VehicleTypeTurretPostions;
			_NumVehicleTurrets = count _VehicleTurrets;
			
			for [{ _ti = 0 }, { _ti < _NumVehicleTurrets }, { _ti = _ti + 1 }] do {
			
				_ObjectsTypes = _Vehicle magazinesTurret (_VehicleTurrets select _ti);
				_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeTotals;
			};
			
			// Get drive turret magazines.
			if ( _Vehicle call F_VehicleHasDriverSeat ) then {
				_ObjectsTypes = _Vehicle magazinesTurret [-1];
				_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeTotals;
			};
		};
		case 3: {
			_ObjectsTypes = getWeaponCargo _Vehicle;
			_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeCountTotals;
		};
		case 4: {
			_VehicleTurrets = (typeOf _Vehicle) call F_VehicleTypeTurretPostions;
			_NumVehicleTurrets = count _VehicleTurrets;
			
			for [{ _ti = 0 }, { _ti < _NumVehicleTurrets }, { _ti = _ti + 1 }] do {
			
				_ObjectsTypes = _Vehicle weaponsTurret (_VehicleTurrets select _ti);
				_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeTotals;
			};
			
			// Get drive turret weapons.
			if ( _Vehicle call F_VehicleHasDriverSeat ) then {
				_ObjectsTypes = _Vehicle weaponsTurret [-1];
				_ObjectTypesAndNumOf = [_ObjectsTypes, _ObjectTypesAndNumOf] call F_AccumulateTypeTotals;
			};

		};	
	};
};

_ObjectTypesAndNumOf;
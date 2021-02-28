// Arma 2 function

private ["_Group","_SupplyVehicle","_Action","_Radius","_SupplyCenterLocation",
         "_MinFuelLevel","_MaxFuelLevel","_DoMinFirst","_SidesToDo","_ThinkTime","_VehicleToSupply",
         "_VehicleTypes","_Vehicles","_FinishedRefueling"];

_Group = _this select 0;
_Action = _this select 1;
_Radius = _this select 2;
_SupplyCenterLocation = + (_this select 3);
_MinFuelLevel = _this select 4;
_MaxFuelLevel = _this select 5;
_DoMinFirst = _this select 6;
_SidesToDo = + (_this select 7);
_ThinkTime = _this select 8;

_SupplyVehicle = _Group getVariable "_SupplyVehicle";
_VehicleToSupply = _Group getVariable "_VehicleToSupply";

//hintSilent format ["_SupplyVehicle = %1\n_VehicleToSupply = %2\n_SidesToDo = %3\n_Action = %4",
//                   _SupplyVehicle, _VehicleToSupply, _SidesToDo, _Action];

if ( _Action == "Search" ) then {
	
	_VehicleToSupply = [_Radius, _SupplyCenterLocation, _MinFuelLevel, 
	                    _MaxFuelLevel, _DoMinFirst, _SidesToDo] call F_ChooseObjectToSupplyFuelTo;

	//hintSilent format ["_VehicleToSupply = %1", _VehicleToSupply];

	if ( isNull _VehicleToSupply ) then {

		// Do search operation
		[_Group, _SupplyVehicle, "Search", _Radius, 
		 _SupplyCenterLocation, _MinFuelLevel, _MaxFuelLevel, _DoMinFirst,
		 _SidesToDo, _ThinkTime, objNull] spawn F_GenerateNextFuelSupplyState;
	
	} else {
	
		// Create Waypoint to vehicle
		[_Group, _SupplyVehicle, "Supply", _Radius, 
		 _SupplyCenterLocation, _MinFuelLevel, _MaxFuelLevel, _DoMinFirst,
		 _SidesToDo, _ThinkTime, _VehicleToSupply] spawn F_GenerateNextFuelSupplyState;
	};
};

if ( (_Action == "Supply") or (_Action == "MoreTransfer") ) then {

	_VehicleTypes = [objNull, "AllVehicles", true] call F_VehicleOfUseType;
	_Vehicles = (position _SupplyVehicle) nearEntities [_VehicleTypes, 25];
	
	//hintSilent format ["_Vehicles = %1\n_VehicleTypes = %2", _Vehicles, _VehicleTypes];
	
	if ( _VehicleToSupply in _Vehicles ) then {
		
		// Supply Fuel to _VehicleToSupply
		_FinishedRefueling = [_Group, _VehicleToSupply, _SupplyVehicle] call F_TransferFuelToVehicle;
	};
	
	if ( _FinishedRefueling ) then {
		// Do search operation
		[_Group, _SupplyVehicle, "Search", _Radius, 
		 _SupplyCenterLocation, _MinFuelLevel, _MaxFuelLevel, _DoMinFirst,
		 _SidesToDo, _ThinkTime, objNull] spawn F_GenerateNextFuelSupplyState;
	} else {
		// Create another refuel waypoint
		[_Group, _SupplyVehicle, "MoreTransfer", _Radius, 
		 _SupplyCenterLocation, _MinFuelLevel, _MaxFuelLevel, _DoMinFirst,
		 _SidesToDo, _ThinkTime, _VehicleToSupply] spawn F_GenerateNextFuelSupplyState;		
	};
};

nil;
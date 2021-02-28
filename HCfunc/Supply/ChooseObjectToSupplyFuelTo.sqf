// Arma 2 function

private ["_Radius","_SupplyLocation","_MinFuelLevel","_MaxFuelLevel","_DoMinFirst","_SidesToDo",
         "_VehicleTypes","_Vehicles","_BestLevelFuel","_FoundVehicle","_NumVehicles","_vi",
         "_Vehicle","_TestFuelLevel","_BestVehicle"];

_Radius = _this select 0;
_SupplyLocation = + (_this select 1);
_MinFuelLevel = _this select 2;
_MaxFuelLevel = _this select 3;
_DoMinFirst = _this select 4;
_SidesToDo = + (_this select 5);

_VehicleTypes = [objNull, "AllVehicles", true] call F_VehicleOfUseType;
_Vehicles = _SupplyLocation nearEntities [_VehicleTypes, _Radius];
_Vehicles = [_Vehicles, _SidesToDo] call F_FilterObjectSides;
_Vehicles = [_Vehicles, true, true] call F_FilterVehiclesMoving;
_Vehicles = [_Vehicles, _MinFuelLevel, _MaxFuelLevel] call F_FilterVehicleNeedsFuel;

if (_DoMinFirst) then { _BestLevelFuel = 1; } else { _BestLevelFuel = 0; }; 
_FoundVehicle = false;
_NumVehicles = count _Vehicles;

_BestVehicle = objNull;

for [{ _vi = 0 }, { _vi < _NumVehicles }, { _vi = _vi + 1 }] do {
	
	_Vehicle = _Vehicles select _vi;
	_TestFuelLevel = fuel _Vehicle;
	
	if ( ( _DoMinFirst and (_TestFuelLevel < _BestLevelFuel)) 
		or ( (! _DoMinFirst) and (_BestLevelFuel < _TestFuelLevel)) ) then {
		
		_BestLevelFuel = _TestFuelLevel;
		_FoundVehicle = true;
		_BestVehicle = _Vehicle;
	};
};

_BestVehicle;
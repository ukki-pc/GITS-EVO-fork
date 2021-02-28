// Arma 2 function

private ["_Vehicle","_MinFuelLevel","_MaxFuelLevel","_NeedsFuel","_FuelLevel","_VehicleType","_HasDriver"];

_Vehicle = _this select 0;
_MinFuelLevel = _this select 1;
_MaxFuelLevel = _this select 2;

_NeedsFuel = false;
_FuelLevel = fuel _Vehicle;

if ( (_MinFuelLevel <= _FuelLevel) and (_FuelLevel <= _MaxFuelLevel) and (_FuelLevel < 1.0) ) then {
	
	_VehicleType = typeOf _vehicle; 
	_HasDriver = ( 1 == (getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "hasdriver")) );
	_NeedsFuel = _HasDriver;
};

_NeedsFuel;
// Arma 2 function

private ["_Vehicle","_VehicleType","_IsStatic"];

_Vehicle = _this;

_VehicleType = typeOf _Vehicle;
_IsStatic = ((getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "hasdriver")) == 0 );
          
_IsStatic;
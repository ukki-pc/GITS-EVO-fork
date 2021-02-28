// Arma 2 function

private ["_Unit","_RoleArray","_OnFoot"];

_Unit = _this;

_RoleArray = assignedVehicleRole _unit;

_OnFoot = ((count _RoleArray) <= 0) 
        || ( ((_RoleArray select 0) == "Cargo") && ((vehicle _unit) == _unit) );

_OnFoot;



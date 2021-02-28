// Arma 2 function

private ["_Unit","_RoleArray","_NotCrew"];

_Unit = _this;

_RoleArray = assignedVehicleRole _unit;

_NotCrew = ((count _RoleArray) <= 0) || ((_RoleArray select 0) == "Cargo");

_NotCrew;



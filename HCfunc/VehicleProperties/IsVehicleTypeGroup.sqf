// Arma 2 function

private ["_Group","_UseType","_MinNum","_MaxNum","_AllMounted","_IsOfType",
         "_AreMounted","_Vehicles","_NumVehicles","_Vehicle"];

_Group = _this select 0;
_UseType = _this select 1;
_MinNum = _this select 2;
_MaxNum = _this select 3;
_CheckAllMounted = _this select 4;

_IsOfType = false;

_Vehicles = [_Group] call F_GetGroupsVehiclesIn;
_NumVehicles = count _Vehicles;

if ( (_MinNum <= _NumVehicles) and (_NumVehicles <= _MaxNum) ) then {
	
	_Vehicle = _Vehicles select 0;
	
	_AreMounted = true;
	if (_CheckAllMounted) then {
		_AreMounted = (units _Group) call F_AllUnitsAreInVehicles;
	};
	
	//hintSilent format ["_AreMounted = %1; ", _AreMounted];
	
	_IsOfType = _AreMounted and ( [_Vehicle, _UseType, false] call F_VehicleOfUseType );	
};

_IsOfType;
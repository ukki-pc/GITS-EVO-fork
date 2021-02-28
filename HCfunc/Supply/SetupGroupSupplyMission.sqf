// Arma 2 function

private ["_Group","_SupplyObject","_Radius","_Param1","_Param2","_Param3","_ThinkTime",
         "_SupplyVehicles","_SupplyVehicle"];

_Group = _this select 0;
_SupplyObject = _this select 1;
_Radius = _this select 2;
_Param1 = _this select 3;
_Param2 = _this select 4;
_Param3 = _this select 5;

_ThinkTime = 10;

_SupplyVehicles = [_Group] call F_GetGroupsVehiclesIn;
_SupplyVehicle = _SupplyVehicles select 0;

switch (_SupplyObject) do {

	case "FuelTruckGroups": { 
		
		[_Group, _SupplyVehicle, "Search", _Radius, 
		 position _SupplyVehicle, _Param1, _Param2, _Param3,
		 [side player], _ThinkTime, objNull] call F_GenerateNextFuelSupplyState;
	};
		
	case "RepairTruckGroups": {  };
	case "AmmoTruckGroups": {  };
};

nil;
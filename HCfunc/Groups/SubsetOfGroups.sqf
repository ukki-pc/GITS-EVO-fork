// Arma 2 function

private ["_Groups","_SubsetCategory","_NumArgs","_Param1","_Param2","_gi","_NumGroups",
         "_InvalidArg","_Group","_Units","_SelectThisGroup","_SubsetGroups"];

_Groups = + (_this select 0);
_SubsetCategory = _this select 1;
_NumArgs = count _this;
if ( _NumArgs >= 3) then { _Param1 = _this select 2; };
if ( _NumArgs >= 4) then { _Param2 = _this select 3; };

_gi = 0;
_NumGroups = count _Groups;
_SubsetGroups = [];
_InvalidArg = false;

while { (_gi < _NumGroups) && (! _InvalidArg) } do {
 
	_Group = _Groups select _gi;
	_Units = units _Group;
	_SelectThisGroup = false;

	switch (_SubsetCategory) do {
	
		case "OnFoot": { _SelectThisGroup = _Units call F_AllUnitsAreOnFoot; };
		case "AllInVehicles": { _SelectThisGroup = _Units call F_AllUnitsAreInVehicles; };
		case "InCargo": { _SelectThisGroup = _Units call F_AllUnitsAreInCargo; };
		case "Crews": { _SelectThisGroup = _Units call F_AllUnitsAreCrews; };
		case "FlyingAirCrews": { _SelectThisGroup = _Units call F_AllUnitsAreFlyingAirCrews; };
		case "WaitingAtHaltWaypoint": { _SelectThisGroup = _Group call F_HasGroupsNeverTimeoutWaypoint; };
		case "InCombat": { _SelectThisGroup = ((behaviour (leader _Group)) ==  "COMBAT"); };
		case "SetToDoNotAttack": { _SelectThisGroup = !(attackEnabled _Group); };
		case "GroupDrivesAllItsVehicles": { _SelectThisGroup = _Group call F_GroupDrivesAllItsVehicles; };
		case "FuelTruckGroups": { _SelectThisGroup = [_Group, "FuelSP", _Param1, _Param2, true] call F_IsVehicleTypeGroup; };
		case "RepairTruckGroups": { _SelectThisGroup = [_Group, "RepairSP", _Param1, _Param2, true] call F_IsVehicleTypeGroup; };
		case "AmmoTruckGroups": { _SelectThisGroup = [_Group, "AmmoSP", _Param1, _Param2, true] call F_IsVehicleTypeGroup; };
		case "VehiclesLowOnFuel": { _SelectThisGroup = [_Group, _Param1, _Param2] call F_GroupVehiclesNeedFuel; };
		default { _InvalidArg = true; };
	};

    if _SelectThisGroup then {
		_SubsetGroups = _SubsetGroups + [_Group]; 
	};
	
	_gi = _gi + 1;
};

_SubsetGroups;
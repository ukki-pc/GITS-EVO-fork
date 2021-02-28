// Arma 2 function

private ["_Groups","_SupplyObject","_Radius","_Param1","_Param2","_Param3",
         "_SupplyGroups","_NumSupplyGroups","_gi","_SupplyGroup"];

_Groups = + (_this select 0);
_SupplyObject = _this select 1;
_Radius = _this select 2;
_Param1 = _this select 3;
_Param2 = _this select 4;
_Param3 = _this select 5;

//Setup resupply task machines.

_SupplyGroups = [_Groups, _SupplyObject, 1, 1] call F_SubsetOfGroups;
_NumSupplyGroups = count _SupplyGroups;

for [{ _gi = 0 }, { _gi < _NumSupplyGroups }, { _gi = _gi + 1 }] do {

	_SupplyGroup = _SupplyGroups select _gi;
	[_SupplyGroup, _SupplyObject, _Radius, _Param1, _Param2, _Param3] call F_SetupGroupSupplyMission;
};

nil;
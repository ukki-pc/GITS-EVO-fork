// Arma 2 function

private ["_TheObjectTypes","_Groups","_GroupLeaderRadius","_NumGroups","_ObjectsNearGroups",
         "_gi","_Group","_Leader","_PosLeader","_NearGroupObjects"];

_TheObjectTypes = + (_this select 0);
_Groups = + (_this select 1);
_GroupLeaderRadius = _this select 2;

_NumGroups = count _Groups;
_ObjectsNearGroups = [];

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Leader = leader _Group;
	_PosLeader = position _Leader;
	_NearGroupObjects = nearestObjects [_PosLeader, _TheObjectTypes, _GroupLeaderRadius];
	
	_ObjectsNearGroups = [_ObjectsNearGroups, _NearGroupObjects] call F_AccumulateDistinctArray;
};

_ObjectsNearGroups;
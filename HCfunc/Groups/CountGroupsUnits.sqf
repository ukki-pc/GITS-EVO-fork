// Arma 2 function

private ["_GroupsToCount","_GroupsUnitCount","_NumCountGrps","_gi"];

_GroupsToCount = + _this;

_GroupsUnitCount = 0;
_NumCountGrps = count _GroupsToCount;

for [{ _gi = 0 }, { _gi < _NumCountGrps }, { _gi = _gi + 1 }] do {

	 _GroupsUnitCount = _GroupsUnitCount + (count (units (_GroupsToCount select _gi))); 
}; 

_GroupsUnitCount;

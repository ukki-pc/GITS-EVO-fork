// Arma 2 function
// Selects the groups on the command bar in the world coordinate rectangle.

private ["_StartCoord","_EndCoord","_DeSelectAllFirst","_SelectedGroups","_MinX","_MaxX","_MinY","_MaxY",
         "_NewSelectedGroups","_HCBarGroups","_NumGroups","_gi","_Group","_GroupLoc","_GroupLocX","_GroupLocY"];

_StartCoord = + (_this select 0);
_EndCoord = + (_this select 1);
_DeSelectAllFirst = _this select 2;
_SelectedGroups = + (_this select 3);

_MinX = (_StartCoord select 0) min (_EndCoord select 0);
_MaxX = (_StartCoord select 0) max (_EndCoord select 0);

_MinY = (_StartCoord select 1) min (_EndCoord select 1);
_MaxY = (_StartCoord select 1) max (_EndCoord select 1);

if (_DeSelectAllFirst) then {

	[_SelectedGroups, false] call F_SelectHCGroups;
	_NewSelectedGroups = [];
} else {
	_NewSelectedGroups = _SelectedGroups;
};

_HCBarGroups = hcAllGroups player; 
_NumGroups = count _HCBarGroups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _HCBarGroups select _gi;
	_GroupLoc = position (leader _Group);
	_GroupLocX = _GroupLoc select 0;
	_GroupLocY = _GroupLoc select 1;
	
	if ( (_MinX <= _GroupLocX) and (_GroupLocX <= _MaxX) 
	     and (_MinY <= _GroupLocY) and (_GroupLocY <= _MaxY) ) then {
		
		_NewSelectedGroups = _NewSelectedGroups + [_Group];
	};
};

[_NewSelectedGroups, true] call F_SelectHCGroups;

nil;
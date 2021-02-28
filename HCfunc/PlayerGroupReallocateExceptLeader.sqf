// Arma 2 function

private ["_group"];

_group = group player;

if( player == (leader _group) ) then {

	_group call F_GroupUnitsReallocate;
};

nil;


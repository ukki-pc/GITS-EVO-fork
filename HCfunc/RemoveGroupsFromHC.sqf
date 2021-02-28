// Arma 2 function

private ["_Groups","_Commander","_gi","_group"];

_Groups = + (_this select 0);
_Commander = _this select 1;

_gi = (count _Groups) - 1;

while {_gi >= 0} do {

	_group = _Groups select _gi;
	_Commander hcRemoveGroup _group;
	_gi = _gi - 1;
};

call F_RemoveEmptyGroups;
call F_ReallocateHCgroups;
[] call F_HCExtRefreshIcons;

nil;
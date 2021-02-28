// Arma 2 function

// Assumes that (_this select 0) is groups that are independent commands.
// Assumes that only group leaders are high commanders.

private ["_HCgroups","_nHCgroups","_tgroups","_gi","_leader","_subHCgroups","_PlayerGroup","_group"];

_HCgroups = + _this;
_nHCgroups = count _HCgroups;
_tgroups = + _HCgroups;
_PlayerGroup = group player; 

for [{ _gi = 0 }, { _gi < _nHCgroups }, { _gi = _gi + 1 }] do {
 
	_group = _HCgroups select _gi;

	if ( _PlayerGroup == _group ) then {

		_tgroups = _tgroups + [_PlayerGroup];
	} else {
		_leader = leader _group;
		_subHCgroups = ([_leader , 144] call F_HCgroups);

		if ((count _subHCgroups) >= 1) then { _tgroups = _tgroups + _subHCgroups; };
	};
};

_tgroups;
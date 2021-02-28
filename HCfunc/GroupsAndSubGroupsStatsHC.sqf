// Arma 2 function

private ["_selgrps","_nselgrps","_tgroups","_gi2","_leader","_subgrps"];

_selgrps = + _this;

_nselgrps = count _selgrps;
_tgroups = + _selgrps;

for [{ _gi2 = 0 }, { _gi2 < _nselgrps }, { _gi2 = _gi2 + 1 }] do {

	_leader = leader (_selgrps select _gi2);
	_subgrps = [_leader , 144] call F_HCgroups;

	if ((count _subgrps) >= 1) then {

		_tgroups = _tgroups + _subgrps;
	};
};

_tgroups call F_GroupsStatsHCcalc;

nil;

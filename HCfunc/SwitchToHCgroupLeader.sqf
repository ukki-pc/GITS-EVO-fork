// Arma 2 function

private ["_selgpgs","_ngps","_leader"];

_selgpgs = + _this;

_ngps = count _selgpgs;

if (_ngps > 0) then {

	_leader = leader (_selgpgs select 0);
	[player, _leader] call F_PerformTeamSwitch;
}; 

nil;
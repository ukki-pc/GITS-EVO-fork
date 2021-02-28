// Arma 2 function

private ["_selunits","_MySide","_NewGroup","_LeaderGroup"];
         
_selunits = + _this;
_MySide = side player;
_LeaderGroup = group player;

if ((count _selunits) >= 1) then {

	_NewGroup = createGroup _MySide;
	_selunits joinSilent _NewGroup;
	player hcsetgroup [_NewGroup,""];

	_NewGroup call F_MakeHighestRankingUnitGroupLeader;
	_NewGroup call F_CollectGroupHCtoLeader;
	
	_LeaderGroup call CopyGroupToFreshGroupHC;
	[[_NewGroup], _MySide] call F_HCExtRefreshIcons;
};

nil;


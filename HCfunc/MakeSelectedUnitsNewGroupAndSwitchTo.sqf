// Arma 2 function

private ["_selunits","_unitgrp","_myside","_group","_selunits","_unithc","_ngleader"];

_selunits = + _this;

if ((count _selunits ) >= 1) then {

	_unitgrp = group player;
	_myside = side player;
	_group = creategroup _myside;
	_selunits joinSilent _group;

	_unithc = hcLeader _unitgrp;

	if !(isNull _unithc) then {
	
		_unithc hcSetGroup [_group,""]; 
	};

	_ngleader = leader _group;	
	[player, _ngleader] call F_PerformTeamSwitch;
	[] call F_HCExtRefreshIcons;
};

nil;

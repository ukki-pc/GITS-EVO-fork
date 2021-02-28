// Arma 2 function

private ["_selunits","_unitgrp","_ngrp","_myside","_group","_unithc"];
         
_selunits = + _this;

_unitgrp = group player;
_ngrp = count (units _unitgrp);

if (_ngrp >= 2) then {

	_myside = side player;
	_group = creategroup _myside;
	_unithc = hcLeader _unitgrp;

	if !(isNull _unithc) then {
	
		_unithc hcSetGroup [_group,""]; 
	};

	[player] joinSilent _group;
	if ((count _selunits ) >= 1) then { _selunits joinSilent _group; };

	if ((count (units _unitgrp)) <= 0) then {
	
		if !(isNull _unithc) then {
		
			_unithc hcRemoveGroup _unitgrp;
		};
		
		_unitgrp call F_DoDeleteGroup;
		
	} else {
	
		if (player call F_UnitIsHC) then {
		
			player hcsetgroup [_unitgrp,""];
		};
	};
	
	[] call F_HCExtRefreshIcons;
};

nil;
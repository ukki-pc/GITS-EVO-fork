// Arma 2 function

private ["_selgrps","_Commander","_oldhcgrp","_seniorhc","_newhcgrp","_newhcunit",
         "_hcgrps","_NumHCgrps","_gi"];

_selgrps = + (_this select 0);
_Commander = _this select 1;

if ( (count _selgrps) == 1) then {

	_oldhcgrp = group _Commander;
	_seniorhc = hcLeader _oldhcgrp;

	_newhcgrp = _selgrps select 0;
	_newhcunit = leader _newhcgrp;
	_hcgrps = hcAllGroups _Commander;
	_NumHCgrps = count _hcgrps;
	hcRemoveAllGroups _Commander;

	if !(isnull _seniorhc) then {
		_seniorhc hcRemoveGroup _oldhcgrp; 
	};

	for [{ _gi = 0 }, { _gi < _NumHCgrps }, { _gi = _gi + 1 }] do {
	
		_Group = _hcgrps select _gi;
	
		if (_Group != _newhcgrp) then {
			_newhcunit hcsetgroup [_Group,""];
		};
	};
 
	_newhcunit hcsetgroup [_oldhcgrp,""];
  
	if !(isnull _seniorhc) then {
		_seniorhc hcsetgroup [_newhcgrp,""]; 
	};

	[_Commander, _newhcunit] call F_PerformTeamSwitch;
	[] call F_HCExtRefreshIcons;
};

nil;

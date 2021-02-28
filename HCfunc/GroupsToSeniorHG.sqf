// Arma 2 function

private ["_selgpgs","_Commander","_gi","_hcgroup","_seniorhc","_group"];

_selgpgs = + (_this select 0);
_Commander = _this select 1;

_gi = (count _selgpgs) - 1;

if (_gi >= 0) then {

	_hcgroup = group _Commander;
	_seniorhc = hcLeader _hcgroup;

	if !(isnull _seniorhc) then {

		while {_gi >= 0} do {

			_group = _selgpgs select _gi;
			_Commander hcRemoveGroup _group;
			_seniorhc hcSetGroup [_group,""];
			_gi = _gi - 1;
		}; 
	};
	
	[] call F_HCExtRefreshIcons;
};

nil;

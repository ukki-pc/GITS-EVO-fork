// Arma 2 function

// The _Commander must be the high commander.
// Could have another function that returns a squad leaders injured units to its HC.

private ["_selgrps","_Commander","_damage","_docanwalk","_gi","_units","_ui","_unit",
         "_getunit"];

_selgrps = + (_this select 0);
_Commander = _this select 1;
_damage = _this select 2;
_docanwalk = _this select 3;

_gi = (count _selgrps) - 1;

while {_gi >= 0} do {

	_units = units (_selgrps select _gi);
	_ui = (count _units) - 1;

	while {_ui >= 0} do {

		_unit = _units select _ui;
		_getunit = false;

		if ((damage _unit) >= _damage) then {
		
			_getunit = true;
		};

		if (_docanwalk && (!(canStand _unit))) then {
		
			_getunit = true;
		};  

		if (_getunit) then {
		
			[_unit] JoinSilent _Commander;
		};

		_ui = _ui - 1;
	};
	_gi = _gi - 1;
};

[] call F_HCExtRefreshIcons;

nil;
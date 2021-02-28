// Arma 2 function

private ["_SelectedUnits","_UnitsGroup","_MySide","_NewGroup","_UnitsGroupHC"];
         
_SelectedUnits = + _this;

if ((count _SelectedUnits ) >= 1) then {

	_UnitsGroup = group player;
	_MySide = side player;
	_NewGroup = creategroup _MySide;
	_SelectedUnits joinSilent _NewGroup;

	_UnitsGroupHC = hcLeader _UnitsGroup;

	if !(isNull _UnitsGroupHC) then {
	
		_UnitsGroupHC hcSetGroup [_NewGroup,""];
	};
	
	[[_UnitsGroup, _NewGroup], _MySide] call F_HCExtRefreshIcons;
};

nil;
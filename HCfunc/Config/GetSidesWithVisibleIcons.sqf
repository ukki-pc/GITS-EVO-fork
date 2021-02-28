// Arma 2 function

private ["_Sides","_MySide","_Visible","_NumSides","_FilteredSides","_ii","_Item","_SideVisible"];

_Sides = + (_this select 0);
_MySide = _this select 1;
_Visible = _this select 2;

_NumSides = count _Sides;
_FilteredSides = [];

for [{ _ii = 0 }, { _ii < _NumSides }, { _ii = _ii + 1 }] do {
	
	_Item = _Sides select _ii;
	
	_SideVisible = [_Item, _MySide] call F_SideIconsAreVisible;
	
	if ( ! _Visible ) then {
		
		_SideVisible = ! _SideVisible;
	};
	
	if ( _SideVisible ) then {
		
		_FilteredSides = _FilteredSides + [_Item];
	};
};

_FilteredSides;
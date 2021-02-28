// Arma 2 function

private ["_Objects","_Sides","_NumObjects","_FilteredObjects","_obi","_Object"];

_Objects = + (_this select 0);
_Sides = + (_this select 1);

_NumObjects = count _Objects;
_FilteredObjects = [];

for [{ _obi = 0 }, { _obi < _NumObjects }, { _obi = _obi + 1 }] do {
	
	_Object = _Objects select _obi;
	
	if ( (side _Object) in _Sides ) then {
		
		_FilteredObjects = _FilteredObjects + [_Object];
	};
};

_FilteredObjects;





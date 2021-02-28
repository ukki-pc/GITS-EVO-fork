// Arma 2 function

private ["_TheObjects","_TheObjectTypes","_NumObjects","_FilteredObjects","_ObjI","_TheObject"];

_TheObjects = + (_this select 0);
_TheObjectTypes = + (_this select 1);

_NumObjects = count _TheObjects;

_FilteredObjects = [];

for [{ _ObjI = 0 }, { _ObjI < _NumObjects }, { _ObjI = _ObjI + 1 }] do {

	_TheObject = _TheObjects select _ObjI;

	if ( ([_TheObjectTypes, [_TheObject]] call F_CountObjectsOfTypes) >= 1 ) then {

		_FilteredObjects = _FilteredObjects + [_TheObject];
	};
}; 

_FilteredObjects;



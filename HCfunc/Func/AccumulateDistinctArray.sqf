// Arma 2 function

private ["_TheObjectsToAdd","_NumObjectsToAdd","_DistinctObjects","_ObjI","_TheObject"];

_DistinctObjects = + (_this select 0);
_TheObjectsToAdd = + (_this select 1);

_NumObjectsToAdd = count _TheObjectsToAdd;

for [{ _ObjI = 0 }, { _ObjI < _NumObjectsToAdd }, { _ObjI = _ObjI + 1 }] do {

	_TheObject = _TheObjectsToAdd select _ObjI;

	if ( ! (_TheObject in _DistinctObjects) ) then {

		_DistinctObjects = _DistinctObjects + [_TheObject];
	};
}; 

_DistinctObjects;



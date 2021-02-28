// Arma 2 function

private ["_TheObjects","_TheFilterFunction","_FilterTrue","_NumObjects","_FilteredObjects",
         "_ObjI","_TheObject","_SelectObj"];

_TheObjects = + (_this select 0);
_TheFilterFunction = _this select 1;
_FilterTrue = _this select 2;

_NumObjects = count _TheObjects;

_FilteredObjects = [];

for [{ _ObjI = 0 }, { _ObjI < _NumObjects }, { _ObjI = _ObjI + 1 }] do {

	_TheObject = _TheObjects select _ObjI;
	_SelectObj = _TheObject call _TheFilterFunction;
		
	if (! _FilterTrue) then { _SelectObj = ! _SelectObj; };
	
	if ( _SelectObj ) then {

		//hintSilent format ["_SelectObj = %1", _SelectObj];
		_FilteredObjects = _FilteredObjects + [_TheObject];
	};
}; 

//hintSilent format ["count _FilteredObjects = %1; _NumObjects = %2;_FilterTrue = %3",
//                   count _FilteredObjects, _NumObjects, _FilterTrue];

_FilteredObjects;



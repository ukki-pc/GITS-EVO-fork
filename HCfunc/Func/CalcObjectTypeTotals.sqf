// Arma 2 function

private ["_TheObjects","_NumObjects","_ObjectTypes","_ObjectTypeTotals",
         "_ObjI","_TheObject","_TheObjectType","_ObjTypeI","_IncTotal"];
         

_TheObjects = + _this;

_NumObjects = count _TheObjects;
_ObjectTypes = [];
_ObjectTypeTotals = [];

for [{ _ObjI = 0 }, { _ObjI < _NumObjects }, { _ObjI = _ObjI + 1 }] do {

	_TheObject = _TheObjects select _ObjI;
	_TheObjectType = typeOf _TheObject;
	_ObjTypeI = _ObjectTypes find _TheObjectType;

	if ( _ObjTypeI < 0 ) then {
	
		_ObjectTypes = _ObjectTypes + [_TheObjectType];
		_ObjectTypeTotals = _ObjectTypeTotals + [1];
	} else {
		_IncTotal = (_ObjectTypeTotals select _ObjTypeI) + 1;
		_ObjectTypeTotals set [_ObjTypeI, _IncTotal];
	};
};

[_ObjectTypes, _ObjectTypeTotals];

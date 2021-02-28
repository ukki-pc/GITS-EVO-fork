// Arma 2 function

private ["_TheObjectTypesCounts","_AccObjectTypes","_AccObjectTypeTotals",
         "_NumObjects","_OTI","_TheObjectType","_ObjTypeI","_TypeInstances"];
         

_TheObjectTypesCounts = + (_this select 0);
_AccObjectTypes = + ((_this select 1) select 0);
_AccObjectTypeTotals = + ((_this select 1) select 1);

_NumObjects = count (_TheObjectTypesCounts select 0);

for [{ _OTI = 0 }, { _OTI < _NumObjects }, { _OTI = _OTI + 1 }] do {

	_TheObjectType = (_TheObjectTypesCounts select 0) select _OTI;
	_ObjTypeI = _AccObjectTypes find _TheObjectType;
	_TypeInstances = (_TheObjectTypesCounts select 1) select _OTI;

	if ( _ObjTypeI >= 0 ) then {

		_AccObjectTypeTotals set [_ObjTypeI, (_AccObjectTypeTotals select _ObjTypeI) + _TypeInstances]
	} else {
		_AccObjectTypes = _AccObjectTypes + [_TheObjectType];
		_AccObjectTypeTotals = _AccObjectTypeTotals + [_TypeInstances];   
	};
};

[_AccObjectTypes, _AccObjectTypeTotals];

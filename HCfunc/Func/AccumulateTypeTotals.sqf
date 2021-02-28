// Arma 2 function

private ["_TheObjectTypes","_AccObjectTypes","_AccObjectTypeTotals","_NumObjects",
         "_OTI","_TheObjectType","_ObjTypeI"];
         

_TheObjectTypes = + (_this select 0);
_AccObjectTypes = + ((_this select 1) select 0);
_AccObjectTypeTotals = + ((_this select 1) select 1);

_NumObjects = count _TheObjectTypes;

for [{ _OTI = 0 }, { _OTI < _NumObjects }, { _OTI = _OTI + 1 }] do {

	_TheObjectType = _TheObjectTypes select _OTI;
	_ObjTypeI = _AccObjectTypes find _TheObjectType;

	if ( _ObjTypeI < 0 ) then {
	
		_AccObjectTypes = _AccObjectTypes + [_TheObjectType];
		_AccObjectTypeTotals = _AccObjectTypeTotals + [1];
	} else {
		_AccObjectTypeTotals set [_ObjTypeI, (_AccObjectTypeTotals select _ObjTypeI) + 1];
	};
};

[_AccObjectTypes, _AccObjectTypeTotals];

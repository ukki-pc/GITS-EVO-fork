// Arma 2 function

private ["_TheObjectTypes","_TheObjects","_NumObjectsTypes","_OTI","_TotalObjectsOfType"];
         

_TheObjectTypes = + (_this select 0);
_TheObjects = + (_this select 1);

_NumObjectsTypes = count _TheObjectTypes;
_TotalObjectsOfType = [];

for [{ _OTI = 0 }, { _OTI < _NumObjectsTypes }, { _OTI = _OTI + 1 }] do {

	_TotalObjectsOfType = _TotalObjectsOfType + [(_TheObjectTypes select _OTI) countType _TheObjects];
};

_TotalObjectsOfType;

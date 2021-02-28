// Arma 2 function

private ["_ObjectTypesAndNumOf","_ObjectTypeName","_str","_TotalObjects","_NumObjectTypes","_ti"];

_ObjectTypesAndNumOf = + (_this select 0);
_ObjectTypeName = _this select 1;

_str = _ObjectTypeName + " Type Totals: ";
_TotalObjects = 0;
_NumObjectTypes = count (_ObjectTypesAndNumOf select 0);

for [{ _ti = 0 }, { _ti < _NumObjectTypes }, { _ti = _ti + 1 }] do {

	_TotalObjects = _TotalObjects + ((_ObjectTypesAndNumOf select 1) select _ti); 
	_str = _str + format ["\n%1 = %2;", 
	                      ((_ObjectTypesAndNumOf select 0) select _ti), 
	                      ((_ObjectTypesAndNumOf select 1) select _ti)];
};

_str = _str + format ["\nTotal " + _ObjectTypeName + " = %1; ", _TotalObjects];

_str;
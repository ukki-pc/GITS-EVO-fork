// Arma 2 function

private ["_Group","_ObjectType","_Object","_Units","_NumUnits","_ui","_Unit",
         "_SyncObjects","_NumSyncObjects","_obi","_SyncObject"];

_Group = _this select 0;
_ObjectType = _this select 1;

_Object = objNull;
_Units = units _Group;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
	_Unit = _Units select _ui;
	_SyncObjects = synchronizedObjects _Unit;
	_NumSyncObjects = count _SyncObjects;
	
	for [{ _obi = 0 }, { _obi < _NumSyncObjects }, { _obi = _obi + 1 }] do {
		
		_SyncObject = _SyncObjects select _obi;
		// _SyncObject isKindOf _ObjectType
		if ( (typeOf _SyncObject) == _ObjectType ) exitWith { _Object = _SyncObject; };
	};
};

_Object;



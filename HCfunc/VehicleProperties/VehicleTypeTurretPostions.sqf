// Arma 2 function

private ["_VehicleType","_Turrets","_SubTurretStack","_SubTurretNumStack","_SubTurretIndexes","_Depth","_sti","_TurretPath",
         "_ti","_SubTurret","_SubTurrets","_NumSubTurretTurrets"];

_VehicleType = _this;

_Turrets = [];

_SubTurretStack = [configFile >> "CfgVehicles" >> _VehicleType >> "turrets"];
_SubTurretNumStack = [count (_SubTurretStack select 0)];
_SubTurretIndexes = [0];
_Depth = 0;
 
while { _Depth >= 0 } do {

	_sti = _SubTurretIndexes select _Depth;

	if (_sti < (_SubTurretNumStack select _Depth)) then {

		_TurretPath = [];
		
		for [{ _ti = 0 }, { _ti <= _Depth }, { _ti = _ti + 1 }] do {

			_TurretPath = _TurretPath + [_SubTurretIndexes select _ti];
		};
		
		_Turrets = _Turrets + [_TurretPath];

		_SubTurret = (_SubTurretStack select _Depth) select _sti;
		_SubTurrets = _SubTurret >> "turrets";
		_NumSubTurretTurrets = count _SubTurrets;

		if (_NumSubTurretTurrets >= 1) then {

			// Go down to child groups
			_Depth = _Depth + 1;
			_SubTurretStack set [_Depth, _SubTurret >> "turrets"];
			_SubTurretNumStack set [_Depth, _NumSubTurretTurrets];
			_SubTurretIndexes set [_Depth, 0];

		} else {
			//No child groups
			_SubTurretIndexes set [_Depth, ((_SubTurretIndexes select _Depth) + 1)];
		}; 

	} else {

		//Go up.
		_Depth = _Depth - 1;
		
		if (_Depth >= 0) then {
		
			_SubTurretIndexes set [_Depth, ((_SubTurretIndexes select _Depth) + 1)];
		};
	};
}; 

_Turrets;

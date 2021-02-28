// Arma 2 function

private ["_Group","_GetOutOption","_Units","_TryGetOut","_NumUnits","_GroupVehicles",
         "_ui","_UnitVehicle","_vi","_NumGroupVehicles","_GroupVehicle","_DoingGetOut"];

_Group = _this select 0;
_GetOutOption = _this select 1;

_Units = units _Group;
_TryGetOut = false;
_DoingGetOut = false;

switch (_GetOutOption) do
{
	case "InCargo":  { _TryGetOut = _Units call F_AllUnitsAreInCargo; };
	case "NonCrews": { _TryGetOut = _Units call F_AllUnitsAreNotCrews; };
	case "Crews":    { _TryGetOut = _Units call F_AllUnitsAreCrews; };
	case "All":      { _TryGetOut = true; };
	default          { _TryGetOut = false; };
};

if _TryGetOut then {

	_NumUnits = count _Units;
	_GroupVehicles = [];

	for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
		_unit = _Units select _ui;
		_UnitVehicle = assignedVehicle _unit;
		
		if ( _UnitVehicle != objNull ) then {
		
			_vi = _GroupVehicles find _UnitVehicle;
			
			if ( _vi < 0 ) then {
				_GroupVehicles = _GroupVehicles + [_UnitVehicle];
			};
		};
	};

	_NumGroupVehicles = count _GroupVehicles;
	_DoingGetOut = _NumGroupVehicles >= 1;
	
	for [{ _vi = 0 }, { _vi < _NumGroupVehicles }, { _vi = _vi + 1 }] do {
	
		_GroupVehicle = _GroupVehicles select _vi;
		_Group leaveVehicle _GroupVehicle;
	};

	doGetOut _Units;
	
	for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {
	
		unassignVehicle (_Units select _ui);
	};
};

_DoingGetOut;
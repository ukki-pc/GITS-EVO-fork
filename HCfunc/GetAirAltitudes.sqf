// Arma 2 function

private ["_vehicletype","_SelGpgsTopLevel","_selgpgs","_ngps","_str","_vehicles","_gi",
         "_units","_nunits","_ui","_unit","_vehicle","_vehicleATL"];

_SelGpgsTopLevel = + (_this select 0);
_vehicletype = _this select 1;

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_ngps = count _selgpgs;
_str = "Altitudes of " + _vehicletype +"s:";
_vehicles = [];

for [{ _gi = 0 }, { _gi < _ngps }, { _gi = _gi + 1 }] do {

	_units = units (_selgpgs select _gi);
	_nunits = count _units;

	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

		_unit = _units select _ui;
		_vehicle = vehicle _unit;

		if ( (_vehicle != _unit) && (! (_vehicle in _vehicles)) ) then {

			_vehicles = _vehicles + [_vehicle];

			if (_vehicle isKindOf _vehicletype) then {

				_vehicleATL = getPosATL _vehicle;
				_str = _str + (format ["\n%1: %2: %3m;", _vehicle, typeOf _vehicle, (_vehicleATL select 2)]);
			};
		};
	};
};

_str = _str + _vehicletype;
hintSilent _str;
copyToClipboard _str;

nil;

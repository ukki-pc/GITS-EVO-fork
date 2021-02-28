// Arma 2 function

private ["_str","_SelGpgsTopLevel","_selgpgs","_vehicles","_ObjTotals","_vehicletypes","_vehicletypetotals",
         "_tvi","_nvehicletypes","_Turrets","_NumTurrets","_sti","_TurretPathLength","_tpi"];

_SelGpgsTopLevel = + _this;

_str = "Vehicle Turrets:";
_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;
_vehicles = _selgpgs call F_GetGroupsVehiclesIn;

_ObjTotals = _vehicles call F_CalcObjectTypeTotals;
_vehicletypes = _ObjTotals select 0;
_vehicletypetotals = _ObjTotals select 1;

_nvehicletypes = count _vehicletypes;
_str = _str + format ["\n_nvehicletypes = %1", _nvehicletypes];

for [{ _tvi = 0 }, { _tvi < _nvehicletypes }, { _tvi = _tvi + 1 }] do {

	_Turrets = (_vehicletypes select _tvi) call F_VehicleTypeTurretPostions;

	_NumTurrets = count _Turrets;
	_str = _str + format ["\nVehicle Type: %1\nNo. Turrets: %2", _vehicletypes select _tvi, _NumTurrets];

	//Need to do a depth first seeach of the sub turrets of the main turret.

	for [{ _sti = 0 }, { _sti < _NumTurrets }, { _sti = _sti + 1 }] do {

		_TurretPathLength = count (_Turrets select _sti);
		_str = _str + (format ["\n[%1", (_Turrets select _sti) select 0]);

		for [{ _tpi = 1 }, { _tpi < _TurretPathLength }, { _tpi = _tpi + 1 }] do {
		
			_str = _str + (format [", %1", (_Turrets select _sti) select _tpi]);
		};
		_str = _str + "]";
	};
};

hintSilent _str;
copyToClipboard _str;

nil;
// Arma 2 function

private ["_SelGpgsTopLevel","_selgpgs","_ngps","_str","_vehicles","_gi","_group",
         "_units","_nunits","_ui","_unit","_Role","_NumRoleElms","_Roles2",
         "_NumRoleElms2","_ri"];

_SelGpgsTopLevel = + _this;

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_ngps = count _selgpgs;
_str = "Unit Vehicle Roles: ";
_vehicles = [];

for [{ _gi = 0 }, { _gi < _ngps }, { _gi = _gi + 1 }] do {

	_group = _selgpgs select _gi;
	_units = units _group;
	_nunits = count _units;

	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {
	
		_unit = _units select _ui;
		_Role = assignedVehicleRole _unit;
		_NumRoleElms = count _Role;

		if ( _NumRoleElms >= 1 ) then {
		
			_str = _str + format ["[%1", (_Role select 0)];
			
			if ( _NumRoleElms >= 2 ) then {
			
				_Roles2 = _Role select 1;
				_NumRoleElms2 = count _Roles2;
				
				for [{ _ri = 0 }, { _ri < _NumRoleElms2 }, { _ri = _ri + 1 }] do {
				
					_str = _str + format [", %1", (_Roles2 select _ri)];
				};
			};
			_str = _str + "] "
		};
	};
};

hintSilent _str;

nil;
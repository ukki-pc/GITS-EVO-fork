// Arma 2 function

private ["_selgrps","_Commander","_SplitSize","_MustBeOnFoot","_nselgrps","_myside","_selgi","_group",
         "_units","_nunits","_SplitThisGroup","_newgroupunits","_ui","_unit","_newgroup"];
         
_selgrps = + (_this select 0);
_Commander = _this select 1;
_SplitSize = _this select 2;
_MustBeOnFoot = _this select 3;

_nselgrps = count _selgrps;
_myside = side _Commander;

for [{ _selgi = 0 }, { _selgi < _nselgrps }, { _selgi = _selgi + 1 }] do {

	_group = _selgrps select _selgi;
	_units = units _group;
	_nunits = count _units;

	_SplitThisGroup = true;
	
	if ( _MustBeOnFoot ) then {

		_SplitThisGroup = _units call F_AllUnitsAreOnFoot;
	};

	if ( _SplitThisGroup ) then {

		while { _SplitSize < _nunits } do {

			_newgroupunits = [];
			
			for [{ _ui = 0 }, { _ui < _SplitSize }, { _ui = _ui + 1 }] do {
			
				_unit = _units select _ui;
				_newgroupunits = _newgroupunits + [_unit];
			};
			
			_newgroup = creategroup _myside;
			_Commander hcsetgroup [_newgroup,""];
			_newgroupunits JoinSilent _newgroup;

			_newgroup call F_MakeHighestRankingUnitGroupLeader;
			_newgroup call F_CollectGroupHCtoLeader;

			_nunits = _nunits - _SplitSize;
			_group = _selgrps select _selgi;
			_units = units _group;
		};
	};
};

[] call F_HCExtRefreshIcons;

nil;
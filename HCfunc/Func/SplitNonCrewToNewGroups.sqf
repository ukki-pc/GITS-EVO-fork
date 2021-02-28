// Arma 2 function

private ["_ToNewGroupOption","_Groups","_NumGroups","_gi","_Group","_units","_nunits",
         "_cargounits","_ui","_unit","_UnitToNewGroup","_ncargounits","_MySide","_NewGroup",
         "_GroupCommander"];

_ToNewGroupOption = _this select 0; 
_Groups = + (_this select 1);

_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_units = units _Group;
	_nunits = count _units;
	_cargounits = [];
	
	for [{ _ui = 0 }, { _ui < _nunits }, { _ui = _ui + 1 }] do {

		_unit = _units select _ui;
		_UnitToNewGroup = false;
		
		switch (_ToNewGroupOption) do
		{
			case "OnFoot":   { _UnitToNewGroup = _unit call F_UnitsIsOnFoot; };
			case "NonCrews": { _UnitToNewGroup = _unit call F_UnitsIsNotCrew; };
			default          { _UnitToNewGroup = false; };
		};

		if _UnitToNewGroup then {
		
			_cargounits = _cargounits + [_unit];
		};
	};

	_ncargounits = count _cargounits;

	if ( (_ncargounits >= 1) && (_ncargounits < _nunits) ) then {
	
		_MySide = side _Group;
		_GroupCommander = hcLeader _Group;
		_NewGroup = createGroup _MySide;
		
		if ( ! (isNull _GroupCommander) ) then {
			_GroupCommander hcsetgroup [_NewGroup,""];
		};
		
		_cargounits JoinSilent _NewGroup;

		_NewGroup call F_MakeHighestRankingUnitGroupLeader;
		_NewGroup call F_CollectGroupHCtoLeader;

		_Group call F_MakeHighestRankingUnitGroupLeader;
		_Group call F_CollectGroupHCtoLeader;

		if (_cargounits call F_AllUnitsAreOnFoot) then {
		
			_NewGroup call F_UnassignGroupUnitsFromVehicle;
		};
	};
};

[] call F_HCExtRefreshIcons;

nil;
// Arma 2 function
// Could be improved by only splitting crew groups that are noot already crew groups.

private ["_Groups","_NumGroups","_GroupSide","_gi","_Group","_GroupUnits","_NumGroupUnits",
         "_GroupVehicles","_GroupVehiclesUnits","_ui","_Unit","_UnitVehicle","_vi",
         "_NumNewCrewGroups","_NewGroup","_GroupCommander"];

_Groups = + _this;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_GroupUnits = units _Group;
	_NumGroupUnits = count _GroupUnits;
	
	if ( _NumGroupUnits >= 2 ) then {
	
		_GroupSide = side _Group;

		//Get the vehicles that the group uses.
		_GroupVehicles = [];
		_GroupVehiclesUnits = [];

		for [{ _ui = 0 }, { _ui < _NumGroupUnits }, { _ui = _ui + 1 }] do {
		
			_Unit = _GroupUnits select _ui;
			_UnitVehicle = assignedVehicle _Unit;
			
			_vi = _GroupVehicles find _UnitVehicle;
			
			if ( _vi < 0 ) then {
			
				_GroupVehicles = _GroupVehicles + [_UnitVehicle];
				_GroupVehiclesUnits = _GroupVehiclesUnits + [[_Unit]];
			} else {
				_GroupVehiclesUnits set [_vi, (_GroupVehiclesUnits select _vi) + [_Unit]];
			};
		};
		
		//hintSilent format ["_GroupVehicles = %1\n_groupvehiclesunits = %2", 
		//                   _GroupVehicles, _GroupVehiclesUnits];
		                   
		_NumNewCrewGroups = count _GroupVehicles;
		
		if ( _NumNewCrewGroups >= 2 ) then {
		
			_GroupCommander = hcLeader _Group;
					
			for [{ _vi = 0 }, { _vi < _NumNewCrewGroups }, { _vi = _vi + 1 }] do {

				_NewGroup = createGroup _GroupSide;
				
				if ( ! (isNull _NewGroup) ) then {
					
					if ( ! (isNull _GroupCommander) ) then {
						_GroupCommander hcsetgroup [_NewGroup,""];
					};
					
					(_GroupVehiclesUnits select _vi) JoinSilent _NewGroup;
					_NewGroup call F_MakeHighestRankingUnitGroupLeader;
					_NewGroup call F_CollectGroupHCtoLeader;
				};
			};
			
			if ( (count (units _Group)) <= 0 ) then { 
				_Group call F_DoDeleteGroup; 
			} else {
				_Group call F_UnassignGroupUnitsFromVehicle;
			};
		};
	};
};

[] call F_HCExtRefreshIcons;

nil;

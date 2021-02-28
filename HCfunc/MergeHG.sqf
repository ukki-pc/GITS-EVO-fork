// Arma 2 function

private ["_Groups","_count","_numunits","_joingroup","_Group","_Units"];

_Groups = + _this;
_count = (count _Groups) - 1;

if (_count >= 1) then {

	_numunits = _Groups call F_CountGroupsUnits;

	if ( _numunits <= 100 ) then {

		_joingroup = _Groups select 0;

		while {_count >= 1} do {
		
			_Group = _Groups select _count;
			_Units = units _Group;
			_Units JoinSilent _joingroup;
			_Group call F_DoDeleteGroup;
			_count = _count - 1;
		};

		_joingroup call F_MakeHighestRankingUnitGroupLeader;
		_joingroup call F_CollectGroupHCtoLeader;

		[] call F_HCExtRefreshIcons;
		call V_ReallocateHCgroups;
		
	} else {
		hintSilent "Too many units to merge into one group.  100 units is the limit.";
	};
}else{
	hintSilent "No groups selected to merge.";
};

nil;
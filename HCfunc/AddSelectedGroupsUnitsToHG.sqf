// Arma 2 function

private ["_Groups","_NumUnits","_NumHCInGroup","_gi","_Group","_HCUnit","_SubGroups",
         "_NumSubGroups","_SubGroup","_sgi"];

_Groups = + _this;

_NumUnits = _Groups call F_CountGroupsUnits;
_NumHCInGroup = count (units (group player));

if ( (_NumHCInGroup + _NumUnits) <= 100 ) then {

	if (count _Groups >= 1) then { 	

		_gi = (count _Groups) - 1;

		while {_gi >= 0} do {

			_Group = _Groups select _gi;

			// Need to add sub groups to the HC.
			// Assumes that only squad leaders are commanders. 
			_HCUnit = leader _Group;
			_SubGroups = hcAllGroups _HCUnit;
			_NumSubGroups = count _SubGroups;

			if ( _NumSubGroups >= 1 ) then {

				hcRemoveAllGroups _HCUnit;

				for [{ _sgi = 0 }, { _sgi < _NumSubGroups }, { _sgi = _sgi + 1 }] do {

					_SubGroup = _SubGroups select _sgi;
					player hcsetgroup [_SubGroup,""];
				};
			};

			(units _Group) JoinSilent player;
			_Group call F_DoDeleteGroup;
			_gi = _gi - 1;
		};
	};
	
	[] call F_HCExtRefreshIcons;
	call V_ReallocateHCgroups;
	
} else {
	hintSilent "Too many units to add to the High Command Group.  100 units is the limit for the High Command group.";
};

nil;
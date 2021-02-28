// Arma 2 function
// Assumes that squad leaders only are commanders.

private ["_Groups","_Commander","_NumGroups","_gi","_Group","_HCUnit",
         "_SubGroups","_NumSubGroups","_SubGroup"];

_Groups = + (_this select 0);
_Commander = _this select 1;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_HCUnit = leader _Group;
	_SubGroups = hcAllGroups _HCUnit;
	_NumSubGroups = count _SubGroups;

	if ( _NumSubGroups >= 1 ) then {

		hcRemoveAllGroups _HCUnit;
		
		for [{ _sgi = 0 }, { _sgi < _NumSubGroups }, { _sgi = _sgi + 1 }] do {
		
			_SubGroup = _SubGroups select _sgi;
			_Commander hcsetgroup [_SubGroup,""];
		};
	};
};

if ( _NumGroups >= 1 ) then {
	[] call F_HCExtRefreshIcons;
};

nil;
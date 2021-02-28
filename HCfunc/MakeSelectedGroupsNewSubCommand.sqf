// Arma 2 function

private ["_SelectedGroups","_Commander","_NumGroups","_TopGroupIndex","_hcgroup",
         "_hcunit","_gi","_group"];
         
_SelectedGroups = + (_this select 0);
_Commander = _this select 1;
         
_NumGroups = count _SelectedGroups;
sleep 0.2;

if (_NumGroups >= 2) then {

	_TopGroupIndex = _SelectedGroups call F_GetGroupWithMostSeniorOfficer;
	_hcgroup = _SelectedGroups select _TopGroupIndex;
	_hcunit = leader _hcgroup;

	for [{ _gi = _NumGroups - 1 }, { 0 <= _gi }, { _gi = _gi - 1 }] do {
	
		if ( _gi != _TopGroupIndex ) then {
		
			_group = _SelectedGroups select _gi;
			_Commander hcRemoveGroup _group;
			_hcunit hcSetGroup [_group,""];
		};
	};

	_Commander hcSelectGroup [_hcgroup];
	
	[] call F_HCExtRefreshIcons;
	call V_ReallocateHCgroups;
};

nil;
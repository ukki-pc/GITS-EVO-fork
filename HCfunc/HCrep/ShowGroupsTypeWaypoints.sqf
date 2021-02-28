// Arma 2 function

private ["_Visiblity","_DoAll","_Groups","_NumGroups","_SidePlayer","_gi",
         "_Group","_GroupSide","_IsFriendly","_SelectedGroups"];
         
_Visiblity = _this select 0;
_DoAll = _this select 1;

_Groups = allGroups;
_NumGroups = count _Groups;
_SidePlayer = side player;
_SelectedGroups = [];

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	_GroupSide = side _Group;
		
	if (   _DoAll 
	    or (_SidePlayer == _GroupSide) ) then { 
	
	    _SelectedGroups = _SelectedGroups + [_Group];
	};
};

[_SelectedGroups, _Visiblity] call F_ShowGroupsWaypoints;

nil;
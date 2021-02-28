// Arma 2 function

private ["_Visiblity","_Unit","_SideUnit","_Groups","_NumGroups","_gi","_Group","_GroupSide"];
         
_Visiblity = _this select 0;

if ((count _this) >= 2) then {
	_Unit = _this select 1;
	_SideUnit = side _Unit;
} else {
	_SideUnit = side player;
};

call F_HCExtSetGroupIconsVisible;

_Groups = allGroups;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	_GroupSide = side _Group;
		
	if ( [_SideUnit, _GroupSide] call F_DoGroupIconVisible  ) then {

		[_Group, _Visiblity, _Visiblity] call F_SetGroupVisiblity;
	} else {
		[_Group, false, false] call F_SetGroupVisiblity;
	};
};

nil;

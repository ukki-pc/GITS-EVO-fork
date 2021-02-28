// Arma 2 function

private ["_Visiblity","_Groups","_NumGroups","_gi","_Group","_GroupIconParams"];
         
_Visiblity = _this;

setGroupIconsVisible [_Visiblity,_Visiblity];

_Groups = allGroups;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	[_Group, _Visiblity, _Visiblity] call F_SetGroupVisiblity;
};

nil;
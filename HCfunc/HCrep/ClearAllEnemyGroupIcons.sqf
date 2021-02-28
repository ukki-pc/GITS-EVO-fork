// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group","_SidePlayer","_GroupSide"];
         
_Groups = allGroups;
_NumGroups = count _Groups;
_SidePlayer = side player;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
	
	_Group = _Groups select _gi;
	_GroupSide = side _Group;
	
	if ((_SidePlayer getFriend _GroupSide) < 0.6) then { 
	
		clearGroupIcons _Group;
	};
};

nil;

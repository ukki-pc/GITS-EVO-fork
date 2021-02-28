// Arma 2 function
// Only tests group leaders because the side of a group is determined by the group leader.

private ["_OnlySideFactions","_TheSide","_Groups","_NumGroups","_gi","_Group",
         "_Leader","_CheckLeaderFaction","_Factions","_TheFaction"];

_OnlySideFactions = _this select 0;
if ( _OnlySideFactions ) then {
	_TheSide = _this select 1;
};
 
_Factions = [];
_Groups = allGroups;
_NumGroups = count _Groups;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Leader = leader _Group;
	_CheckLeaderFaction = true;

	if ( _OnlySideFactions ) then {

		if ( (side _leader) != _TheSide ) then {
			_CheckLeaderFaction = false;
		};
	};

	if ( _CheckLeaderFaction ) then {
	
		_TheFaction = faction _Leader;
		
		if (! (_TheFaction in _Factions) ) then {
			_Factions = _Factions + [_TheFaction];
		};
	};
}; 

_Factions;

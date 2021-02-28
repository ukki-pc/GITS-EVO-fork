// Arma 2 function

private ["_OnlySideFactions","_MySide","_MyFaction","_TheFactions","_NumFactions","_MyFactionIndex","_Groups",
         "_NumGroups","_TopRankIndependentSquad","_TopRankHC","_SwitchToLeader","_FoundHC","_gi","_Group",
         "_Leader","_UnitIsHC","_GroupLeaderRank"];

_OnlySideFactions = _this select 0;

_MySide = side player;
_MyFaction = faction player;
_TheFactions = [_OnlySideFactions, _MySide] call F_GetFactions;
_NumFactions = count _TheFactions;

_MyFactionIndex = _TheFactions find _MyFaction; 

if ( _NumFactions >= 2 ) then {
 
	_MyFactionIndex = _MyFactionIndex + 1;
	
	if ( _MyFactionIndex >= _NumFactions ) then {
	
		_MyFactionIndex = 0;
	};
	
	_MyFaction = _TheFactions select _MyFactionIndex;
	_Groups = allgroups;
	_NumGroups = count _Groups;
	_TopRankIndependentSquad = -1;
	_TopRankHC = -1;
	_SwitchToLeader = objNull;
	_FoundHC = false;

	for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

		_Group = _Groups select _gi;
		_Leader = leader _Group;

		if ( (faction _Leader) == _MyFaction ) then {

			_UnitIsHC = _Leader call F_UnitIsHC;
			_FoundHC = _FoundHC || _UnitIsHC;
			_GroupLeaderRank = rankId _Leader;

			if (_FoundHC) then {

				if (_UnitIsHC) then {

					if (_GroupLeaderRank > _TopRankHC) then {
					
						_SwitchToLeader = _Leader;
						_TopRankHC = _GroupLeaderRank;
					};
				};
			} else {
				if (_GroupLeaderRank > _TopRankIndependentSquad) then {
				
					_SwitchToLeader = _Leader;
					_TopRankIndependentSquad = _GroupLeaderRank;
				};
			};
		};
	};

	[player, _SwitchToLeader] call F_PerformTeamSwitch;
};

nil;
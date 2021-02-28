// Arma 2 function
// Switches to a high commander or else a group leader if any exist.

private ["_switchside","_groups","_NumGroups","_FoundSeniorHC","_foundsw","_swunit","_TopRankIndependentSquad",
         "_TopRankSeniorHC","_gi","_group","_leader","_GroupLeaderRank","_UnitIsSeniorHC"];

_switchside = _this select 0;

_groups = allgroups;
_NumGroups = count _groups;
_FoundSeniorHC = false;
_foundsw = false;
_swunit = objNull;  //Need to set the value here to set the scope of this variable
_TopRankIndependentSquad = -1;
_TopRankSeniorHC = -1;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
 
	_group = _groups select _gi;
	_leader =  leader _group;

	if ((side _leader) == _switchside) then {

		_foundsw = true;
		_GroupLeaderRank = rankId _leader;
		_UnitIsSeniorHC = _leader call F_UnitIsSeniorHC;
		_FoundSeniorHC = _FoundSeniorHC || _UnitIsSeniorHC;

		if (_FoundSeniorHC) then {

			if (_UnitIsSeniorHC) then {

				if (_GroupLeaderRank > _TopRankSeniorHC) then {
				
					_swunit = _leader;
					_TopRankSeniorHC = _GroupLeaderRank;
				};
			};
		} else {
			if (_GroupLeaderRank > _TopRankIndependentSquad) then {
			
				_swunit = _leader;
				_TopRankIndependentSquad = _GroupLeaderRank;
			};
		};
	};
};

if _foundsw then {

	[player, _swunit] call F_PerformTeamSwitch;
};

nil;
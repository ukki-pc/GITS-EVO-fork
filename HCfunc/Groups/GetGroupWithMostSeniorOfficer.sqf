// Arma 2 function

private ["_Groups","_NumGroups","_TopRank","_gi","_Group","_GroupLeaderRank",
         "_TopRank","_TopGroupIndex"];

_Groups = + _this;
_NumGroups = count _Groups;
_TopRank = -1;
_TopGroupIndex = -1;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {
 
	_Group = _Groups select _gi;
	_GroupLeaderRank = rankId (leader _Group);

	if ( _GroupLeaderRank > _TopRank ) then {
	
		_TopRank = _GroupLeaderRank;
		_TopGroupIndex = _gi;
	};
};

_TopGroupIndex;
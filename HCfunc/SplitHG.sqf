// Arma 2 function

private ["_Groups","_Commander","_NumGroups","_MySide","_gi","_SplitGroup","_Units","_Limit",
         "_Group","_ui"];

_Groups = + (_this select 0);
_Commander = _this select 1;

_NumGroups = count _Groups;
_MySide = side _Commander;

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_SplitGroup = _Groups select _gi;
	_Units = units _SplitGroup;

	if ( (_Units call F_AllUnitsAreOnFoot) 
		|| (_Units call F_AllUnitsAreInCargo) ) then {

		_Limit = (count _Units) / 2;

		if ( _Limit > 0 ) then {
		
			_Group = creategroup _MySide;
			_Commander hcsetgroup [_Group,""];

			for [{ _ui = 0 }, { _ui < _Limit }, { _ui = _ui + 1 }] do {

				_Unit = _Units select _ui; 
				[_Unit] JoinSilent _Group;
			};

			_SplitGroup call F_MakeHighestRankingUnitGroupLeader;
			_SplitGroup call F_CollectGroupHCtoLeader;

			_Group call F_MakeHighestRankingUnitGroupLeader;
			_Group call F_CollectGroupHCtoLeader;
		};
	};
};

[] call F_HCExtRefreshIcons;

nil;
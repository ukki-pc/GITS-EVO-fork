// Arma 2 function


private ["_Group","_Units","_NumUnits","_GroupCommander","_GroupSide","_GroupLeader",
         "_NewGroup","_CurWpIndex"];

_Group = _this;

_Units = units _Group;
_NumUnits = count _Units;

if ( _NumUnits >= 1 ) then {

	_GroupCommander = hcLeader _Group;
	_GroupSide = side _Group;
	_GroupLeader = leader _Group;
	
	_NewGroup = createGroup _GroupSide;
	
	if ( ! (isNull _NewGroup) ) then {
		
		if ( ! (isNull _GroupCommander) ) then {
			_GroupCommander hcsetgroup [_NewGroup,""];
		};
		
		_CurWpIndex = currentWaypoint _Group;
		_Units JoinSilent _NewGroup;
		_NewGroup selectLeader _GroupLeader;
		_NewGroup copyWaypoints _Group;
		_NewGroup setCurrentWaypoint [_NewGroup, _CurWpIndex];
		
		_Group call F_DoDeleteGroup;
		
		[[_NewGroup], _GroupSide] call F_HCExtRefreshIcons;
	};
};

_NewGroup;


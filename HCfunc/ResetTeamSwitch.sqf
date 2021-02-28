// Arma 2 function
// Will delete groups with switchable team leaders first waypoint (but the waypoint order is not cancelled).
// Only does the players current side.

private ["_SwitchUnits","_MySide","_NumSwitchUnits","_ui","_Unit","_isleader"];

if ( player == (leader (group player)) ) then {
 
	_SwitchUnits = switchableUnits;
	_MySide = side player;
	_NumSwitchUnits = count _SwitchUnits;

	for [{ _ui = 0 }, { _ui < _NumSwitchUnits }, { _ui = _ui + 1 }] do {
	
		_Unit = _SwitchUnits select _ui;
		
		if ( _Unit != player ) then {
		
			_Group = group _Unit;
			
			if ((side _Group) == _MySide) then {
			
				_isleader = ((leader _Group) == _Unit);
				[_Unit] JoinSilent player;
				_Unit doFollow player;
				[_Unit] joinSilent _Group;
				
				if ( _isleader ) then {
				
					_Group selectLeader _Unit;
				};
			};
		};
	};

	_str = "Done all Team Switch Units on your side are moveable again!";
	hintSilent _str;

} else {

	hintSilent "You must be a squad commander to make all Team Switch Units on your side moveable again.";
};

nil;



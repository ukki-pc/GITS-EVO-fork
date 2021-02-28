// Arma 2 function

// Will assign all the uncommanded groups  of the side (that do not command anything) to player.
// If the player has no HC then it is Ok if they command everything.
// Argument: true for side, false for faction.

private ["_DoSide","_mygroup","_ihavehc","_array","_NumGroups","_myside","_gi","_group",
         "_theleader","_GroupSide"];

_DoSide = _this select 0;

_mygroup = group player;
_ihavehc = ! isnull(hcLeader _mygroup);
_array = allgroups;
_NumGroups = count _array;

_myside = side player;
if ( ! _DoSide ) then { _myside = faction player; };

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_group = _array select _gi;
	_theleader = leader _group;
	_GroupSide = side _theleader;
	if ( ! _DoSide ) then { _GroupSide = faction _theleader; };

	if ( _GroupSide == _myside ) then {

		if ( _group != _mygroup ) then {

			if ( ( ! _ihavehc ) || ( _ihavehc && ((count (hcAllGroups _theleader)) <= 0)) ) then {

				// Also need to check that thy have no high commanded troops.
				// Checking for cyclic structures is to complex for scripts. 
				player hcsetgroup [_group,""];
			};
		};
	};
};

[] call F_HCExtInitIcons;

nil;
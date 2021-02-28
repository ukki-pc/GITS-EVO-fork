// Arma 2 function

private ["_NumArgs","_Groups","_NumGroups","_Side"];

_NumArgs = count _this;
if ( _NumArgs >= 1 ) then { _Groups = + (_this select 0); } else { _Groups = []; };
_Side = side player;
if ( _NumArgs >= 2 ) then { _Side = _this select 1; };

_NumGroups = count _Groups;

if ([] call F_NoHCModule) then {
	
	if ( _NumGroups >= 1 ) then {
	
		[true, false, _Side, _Groups] call V_ChangeHCbarIcons;
	} else {			
		[true, true, _Side] call V_ChangeHCbarIcons;
	};
};

nil;
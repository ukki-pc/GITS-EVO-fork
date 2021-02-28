// Arma 2 function

private ["_Groups","_NumGroups","_gi","_Group","_Str","_Leader","_Attack"];

_Groups = + (_this select 0);
_DoDisplay = _this select 1;

_NumGroups = count _Groups;

if (_DoDisplay) then {

	_Str = format ["Group Stances\nNo Groups = %1\n", _NumGroups];
} else {
	_Str = "Group Stance: ";
};

for [{ _gi = 0 }, { _gi < _NumGroups }, { _gi = _gi + 1 }] do {

	_Group = _Groups select _gi;
	_Leader = leader _Group;
	_Attack = "Attack Disabled";
	if ( attackEnabled _Group ) then { _Attack = "Attack Enabled"; };
	
	_Str = _Str + (format ["%1 (%2, %3, %4, %5, %6)\n", 
	                       _Group, combatMode _Group, _Attack, speedMode _Group, 
	                       behaviour _Leader, formation _Group]);
};

if (_DoDisplay) then { hintSilent _Str; copyToClipboard _Str; };

_Str;
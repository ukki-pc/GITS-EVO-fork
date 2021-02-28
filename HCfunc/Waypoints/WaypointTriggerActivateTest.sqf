// Arma 2 function

private ["_GroupLeader","_Group","_str"];

_GroupLeader = _this select 0;
_Group = group _GroupLeader;

//_Group = _Waypoint select 0;

_str = "Waypoint Trigger Activated";
_str = _str + format ["\n_GroupLeader = %1\n_Group = %2", _GroupLeader, _Group];

hintSilent _str;

nil;
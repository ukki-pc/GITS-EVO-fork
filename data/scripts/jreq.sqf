// Request to join your squad,run on requesting client.
BIS_EVO_tunit = _this select 0;
_grp = _this select 1;
if (not local (leader _grp) or BIS_EVO_tunit == player) exitWith {};
_name = name BIS_EVO_tunit;
_mess = format["Recruit %1",_name];
hint format["%1 wants to join your squad",_name];
_vec = vehicle player;
_Action = _vec addAction [_mess, "data\scripts\accept.sqf",[BIS_EVO_tunit]];
sleep 10.0;
_vec removeAction _Action;
if(group BIS_EVO_tunit != group player) then {(player) sideChat format["I have no position for you at this time %1", _name]};     

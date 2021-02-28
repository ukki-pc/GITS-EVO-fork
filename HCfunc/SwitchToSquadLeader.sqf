// Arma 2 function

private ["_leader"];

_leader = leader (group player);
[player, _leader] call F_PerformTeamSwitch;

nil;

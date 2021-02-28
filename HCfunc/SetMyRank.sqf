// Arma 2 function
 
private ["_TheRank"];
 
_TheRank = _this select 0;
[player, _TheRank] call F_SetUnitRankWithoutChangingRating;

nil;
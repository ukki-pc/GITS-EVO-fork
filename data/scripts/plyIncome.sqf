
while {true} do {
sleep EVO_incomeFrequency;
_allPlayers = call BIS_fnc_listPlayers;
{["jed_addscore", [_x, 1]] call CBA_fnc_globalEvent}forEach _allPlayers;
};
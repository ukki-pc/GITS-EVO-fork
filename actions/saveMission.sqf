// SAVES CAR ARAY
_saveCars = "";
for [{_loop=0}, {_loop<count buyCarList}, {_loop=_loop+1}] do 
{
    _saveCars = _saveCars + format ["%1", (((buyCarlist select _loop) select 2))];
    if(_loop < count buyCarList-1) then {_saveCars = _saveCars + ","};
};

// SAVES TANK ARAY
_saveTanks = "";
for [{_loop=0}, {_loop<count buyTankList}, {_loop=_loop+1}] do 
{
    _saveTanks = _saveTanks + format ["%1", (((buyTankList select _loop) select 2))];
    if(_loop < count buyTankList-1) then {_saveTanks = _saveTanks + ","};
};

// SAVES AIR ARAY
_saveAir = "";
for [{_loop=0}, {_loop<count buyAirList}, {_loop=_loop+1}] do 
{
    _saveAir = _saveAir + format ["%1", (((buyAirList select _loop) select 2))];
    if(_loop < count buyAirList-1) then {_saveAir = _saveAir + ","};
};

// SAVES STATIC ARAY
_saveStatic = "";
for [{_loop=0}, {_loop<count buyStatList}, {_loop=_loop+1}] do 
{
    _saveStatic = _saveStatic + format ["%1", (((buyStatList select _loop) select 2))];
    if(_loop < count buyStatList-1) then {_saveStatic = _saveStatic + ","};
};

_savePlayers = "";
//SAVE SCORES
/*
_allPlayers = call BIS_fnc_listPlayers;
_plyCount = count _allPlayers;

for [{_loop=0}, {_loop< _plyCount}, {_loop=_loop+1}] do 
{
    _savePlayers = _savePlayers + format ["[%1,%2]",_allPlayers select _loop,score (_allPlayers select _loop)];

    if(_loop <  _plyCount-1) then{
        _savePlayers = _savePlayers + ",";
    };
};
*/
/*
while {true} do {
sleep EVO_incomeFrequency;
_allPlayers = call BIS_fnc_listPlayers;
{["jed_addscore", [_x, 1]] call CBA_fnc_globalEvent}forEach _allPlayers;
};
*/

_allPlayers = call BIS_fnc_listPlayers;
	{["jed_getMoney", [_x,_forEachIndex]] call CBA_fnc_whereLocalEvent;
}forEach _allPlayers;


//GENERATE SAVE VALUES
_clipboard = format ["cars=[%1];tanks=[%2];air=[%3];stat=[%4];players=%5;prog=%6;unlocks=%7;",_saveCars,_saveTanks,_saveAir,_saveStatic,bank,BIS_EVO_conqueredTowns,BIS_EVO_unlocks];
_clipboard = _clipboard + format ["%1","[cars,tanks,air,stat,players,prog,unlocks] execVM ""actions\loadMission.sqf"";"];
copyToClipboard _clipboard;

hint "Saved to clipboard!";
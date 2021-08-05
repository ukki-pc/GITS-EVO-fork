//Distributes unlockables to objectives

_tempBases = BIS_EVO_MissionBigTowns+ BIS_EVO_MilitaryObjectives;
_unlockables = BIS_EVO_unlockables;
_vec = "";
BIS_EVO_unlocks = [];
{
    _rnd = round (random (count _unlockables-1));

        _vec = _unlockables select _rnd;
        _unlockables = _unlockables - [_vec];
        BIS_EVO_unlocks = BIS_EVO_unlocks + [_vec];
} forEach _tempBases;
publicVariable "BIS_EVO_unlocks";
[] call updCityMarkers;

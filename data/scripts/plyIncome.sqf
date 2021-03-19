countIncome = {
_income = 0;
{
    if(_x in BIS_EVO_MissionVillages) then 
    {
        _income = _income +1;
    };
    if(_x in BIS_EVO_MissionBigTowns) then 
    {
        _income = _income +2;
    };
}
forEach BIS_EVO_conqueredTowns;
_income;
};

while {true} do {
_income = 0;
if(isNil "EVO_incomeFrequency") then {EVO_incomeFrequency = 180};
sleep EVO_incomeFrequency;
_allPlayers = call BIS_fnc_listPlayers;
_income = [] call countIncome;

if(_income > 0) then 
{
    _msg = format ["Income from cities: $%1",_income];
        {["jed_msg", [_x, _msg]] call CBA_fnc_whereLocalEvent;
        ["jed_addMoney", [_x, _income]] call CBA_fnc_whereLocalEvent}forEach _allPlayers;
    };
};
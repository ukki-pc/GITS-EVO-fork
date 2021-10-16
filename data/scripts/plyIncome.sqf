countIncome = 
{
_income = 0;
{
    if(_x in BIS_EVO_MissionVillages) then 
    {
        _income = _income +100;
    };
    if(_x in BIS_EVO_MissionBigTowns) then 
    {
        _income = _income +200;
    };
}
forEach BIS_EVO_conqueredTowns;
_income;
};

while {sleep EVO_incomeFrequency; true} do 
{
    _income = 0;
    if(isNil "EVO_incomeFrequency") then {EVO_incomeFrequency = 180};

    _allPlayers = call BIS_fnc_listPlayers;
    _income = [] call countIncome;

        EVO_incomeFrequency = round(180+((_income^1.6)*0.001));
        //systemChat str EVO_incomeFrequency;

    if(_income > 0) then 
    {
        _msg = format ["Income from cities: $%1",_income];
        {
            ["sendToClient", [_x,fnc_msg,["ss",_msg]]] call CBA_fnc_whereLocalEvent;
            ["sendToClient",[_x,fnc_changeMoney,[_income,false]]] call CBA_fnc_whereLocalEvent;
        }forEach _allPlayers;
    };
};
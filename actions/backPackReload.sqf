_bp = unitBackpack player;
if(_bp == objNull or reloading) exitWith{hint "no backpakc or reloodin"};
reloading = true;
_ammo = (player ammo (currentWeapon player));

if(_ammo == 0) then 
{
    _bpMags = (getMagazineCargo _bp) select 0;
    _bpCounts = (getMagazineCargo _bp) select 1;
    _allMags = (getArray (configFile >> "CfgWeapons" >> currentWeapon player >> "magazines"));
    _similar = [[_allMags,_bpMags]] call fnc_getSimiliarIndexes;
    if(count _similar == 0) exitWith {};
    _mag = [_similar] call fnc_pickRandom;
    _index = (_bpMags) find _mag;
    if(_index > -1) then 
    {
        player addMagazine (_bpMags select _index);
       _bpCounts set [_index,(_bpCounts select _index)-1];
       
       clearMagazineCargo _bp;

            {
                _bp addMagazineCargoGlobal [_x,_bpCounts select _forEachIndex];
            } forEach _bpMags;
        reload player;
        sleep 4;
    };
};
reloading = false;
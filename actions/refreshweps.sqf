//Refills ammobox(es) with weapons you've unlocked
 _box = _this select 0;
clearMagazineCargo _box;
clearWeaponCargo _box;
 //clearItemCargo _box;

{
    _wep = isClass(configFile >> "cfgWeapons" >> _x);
    if(_wep) then 
    {
        _box addWeaponCargo [_x, 5];
    }
    else 
    {
        _box addMagazineCargo [_x, 10];
    };
} forEach weaponsNamespace;

{
    _box addMagazineCargo [_x,20];
} forEach allMagazines;
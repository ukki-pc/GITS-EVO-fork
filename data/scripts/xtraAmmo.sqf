 if ((_this select 0) ammo (currentWeapon (_this select 0)) == 0) then 
 {
     sleep 30;
    (_this select 0) setvehicleammo 1;
};
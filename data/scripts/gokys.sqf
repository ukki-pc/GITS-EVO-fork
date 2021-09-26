_heli = _this select 0;
_grp = group (driver _heli);
_grp addWaypoint [[0,0],1];



waitUntil{sleep 1;(getPos _heli distance [0,0] < 100 or !(canMove _heli)) };

if !(canMove _heli) exitWith 
{
    sleep 600;
    {deleteVehicle _x} forEach crew _heli;
    deleteVehicle _heli;
};
{deleteVehicle _x} forEach crew _heli;
deleteVehicle _heli;


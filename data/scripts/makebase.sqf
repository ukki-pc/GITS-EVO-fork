/*
_vecmode = _this select 0;// needed?

_posh1 = GetMarkerPos "westheliG1";
_posh2 = GetMarkerPos "westheliG2";
_posh3 = GetMarkerPos "westheliG3";
_posh4 = GetMarkerPos "westheliG4";
_posh5 = GetMarkerPos "westheliG5";
_posh6 = GetMarkerPos "westheliG6";
_posh7 = GetMarkerPos "westheliG7";
_posh8 = GetMarkerPos "westheliG8";

_dirh1 = GetDir airdir1;
_dirh2 = _dirh1+180;
_dirh3 = _dirh1+90;
_dirh4 = _dirh1-90;

_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh1, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh2, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh3, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh4, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh5, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh6, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh7, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _posh8, [], 0, "NONE"];sleep 0.05;

_heli1 = createVehicle [(EGG_EVO_westveh2 select 0), _posh1, [], 0, "NONE"];_heli1 setdir _dirh1;Sleep 0.05;
_heli2 = createVehicle [(EGG_EVO_westveh2 select 1), _posh2, [], 0, "NONE"];_heli2 setdir _dirh1;Sleep 0.05;
_heli3 = createVehicle [(EGG_EVO_westveh2 select 2), _posh3, [], 0, "NONE"];_heli3 setdir _dirh1;Sleep 0.05;
_heli4 = createVehicle [(EGG_EVO_westveh2 select 3), _posh4, [], 0, "NONE"];_heli4 setdir _dirh1;Sleep 0.05;
_heli5 = createVehicle [(EGG_EVO_westveh2 select 4), _posh5, [], 0, "NONE"];_heli5 setdir _dirh2;Sleep 0.05;
_heli6 = createVehicle [(EGG_EVO_westveh2 select 5), _posh6, [], 0, "NONE"];_heli6 setdir _dirh2;Sleep 0.05;
_heli7 = createVehicle [(EGG_EVO_westveh2 select 6), _posh7, [], 0, "NONE"];_heli7 setdir _dirh2;Sleep 0.05;
_heli8 = createVehicle [(EGG_EVO_westveh2 select 7), _posh8, [], 0, "NONE"];_heli8 setdir _dirh2;Sleep 0.05;

{_x setVehicleInit "veh = [this, 1, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf"""}forEach [_heli1,_heli2,_heli3,_heli4,_heli5,_heli6,_heli7,_heli8];
processInitCommands;

_posph1 = GetMarkerPos "westhangar1";
_posph2 = GetMarkerPos "westhangar2";
_posph3 = GetMarkerPos "westhangar3";
_posph4 = GetMarkerPos "westhangar4";

_posp1 = GetMarkerPos "westplane1";
_posp2 = GetMarkerPos "westplane2";
_posp3 = GetMarkerPos "westplane3";
_posp4 = GetMarkerPos "westplane4";
_posp5 = GetMarkerPos "westplane5";
_posp6 = GetMarkerPos "westplane6";
_posp7 = GetMarkerPos "westplane7";
_posp8 = GetMarkerPos "westplane8";
_posp9 = GetMarkerPos "westplane9";
_posp10 = GetMarkerPos "westplane10";

_hangar1 = createVehicle [(EGG_EVO_HANGARS select 1), _posph1, [], 0, "NONE"];_hangar1 setdir _dirh1; sleep 0.05;
_hangar2 = createVehicle [(EGG_EVO_HANGARS select 1), _posph2, [], 0, "NONE"];_hangar2 setdir _dirh1;sleep 0.05;
_hangar3 = createVehicle [(EGG_EVO_HANGARS select 1), _posph3, [], 0, "NONE"];_hangar3 setdir _dirh1;sleep 0.05;
_hangar4 = createVehicle [(EGG_EVO_HANGARS select 1), _posph4, [], 0, "NONE"];_hangar4 setdir _dirh1;sleep 0.05;

_plane1 = createVehicle [(EGG_EVO_westveh9 select 0), _posp1, [], 0, "NONE"];_plane1 setdir _dirh2;Sleep 0.05;
_plane2 = createVehicle [(EGG_EVO_westveh9 select 1), _posp2, [], 0, "NONE"];_plane2 setdir _dirh2;Sleep 0.05;
_plane3 = createVehicle [(EGG_EVO_westveh9 select 2), _posp3, [], 0, "NONE"];_plane3 setdir _dirh2;Sleep 0.05;
_plane4 = createVehicle [(EGG_EVO_westveh9 select 3), _posp4, [], 0, "NONE"];_plane4 setdir _dirh2;Sleep 0.05;
_plane5 = createVehicle [(EGG_EVO_westveh9 select 4), _posp5, [], 0, "NONE"];_plane5 setdir _dirh2;Sleep 0.05;
_plane6 = createVehicle [(EGG_EVO_westveh9 select 5), _posp6, [], 0, "NONE"];_plane6 setdir _dirh2;Sleep 0.05;
_plane7 = createVehicle [(EGG_EVO_westveh9 select 6), _posp7, [], 0, "NONE"];_plane7 setdir _dirh2;Sleep 0.05;
_plane8 = createVehicle [(EGG_EVO_westveh9 select 7), _posp8, [], 0, "NONE"];_plane8 setdir _dirh2;Sleep 0.05;

_plane9 = createVehicle [(EGG_EVO_westveh9 select 8), _posp9, [], 0, "NONE"];_plane9 setdir _dirh2;Sleep 0.05;
_plane10 = createVehicle [(EGG_EVO_westveh9 select 9), _posp10, [], 0, "NONE"];_plane10 setdir _dirh2;Sleep 0.05;

{_x setVehicleInit "veh = [this, 1, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf"""}forEach [_plane1,_plane2,_plane3,_plane4,_plane5,_plane6,_plane7,_plane8,_plane9];

{_x setVehicleInit "veh = [this, 300, 300, 0, False, False, ""veh2=[this] execVM 'LDL_ac130\Addon\ac130_init_AC130.sqf';""] execVM ""vehicle.sqf""; veh2=[this] execVM ""LDL_ac130\Addon\ac130_init_AC130.sqf"";"}forEach [_plane10];
processInitCommands;

//modded planes and helis

_poshM1 = GetMarkerPos "westheliMG1";
_poshM2 = GetMarkerPos "westheliMG2";
_poshM3 = GetMarkerPos "westheliMG3";
_poshM4 = GetMarkerPos "westheliMG4";

_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _poshM1, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _poshM2, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _poshM3, [], 0, "NONE"];sleep 0.05;
_hpad = createVehicle [(EGG_EVO_HELIPAD select 1), _poshM4, [], 0, "NONE"];sleep 0.05;

_heli9 = createVehicle [(EGG_EVO_westvehM2 select 0), _poshM1, [], 0, "NONE"];_heli9 setdir _dirh1;Sleep 0.05;
_heli10 = createVehicle [(EGG_EVO_westvehM2 select 1), _poshM2, [], 0, "NONE"];_heli10 setdir _dirh1;Sleep 0.05;
_heli11 = createVehicle [(EGG_EVO_westvehM2 select 2), _poshM3, [], 0, "NONE"];_heli11 setdir _dirh1;Sleep 0.05;
_heli12 = createVehicle [(EGG_EVO_westvehM2 select 3), _poshM4, [], 0, "NONE"];_heli12 setdir _dirh1;Sleep 0.05;

{_x setVehicleInit "veh = [this, 1, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf"""}forEach [_heli9,_heli10,_heli11,_heli12];
processInitCommands;

//planes

_posphM1 = GetMarkerPos "westhangarM1";
_posphM2 = GetMarkerPos "westhangarM2";
_posphM3 = GetMarkerPos "westhangarM3";

_pospM1 = GetMarkerPos "westplaneM1";
_pospM2 = GetMarkerPos "westplaneM2";
_pospM3 = GetMarkerPos "westplaneM3";
_pospM4 = GetMarkerPos "westplaneM4";
_pospM5 = GetMarkerPos "westplaneM5";
_pospM6 = GetMarkerPos "westplaneM6";

_hangarM1 = createVehicle [(EGG_EVO_HANGARS select 0), _posphM1, [], 0, "NONE"];_hangarM1 setdir _dirh1; sleep 0.05;
_hangarM2 = createVehicle [(EGG_EVO_HANGARS select 0), _posphM2, [], 0, "NONE"];_hangarM2 setdir _dirh1;sleep 0.05;
_hangarM3 = createVehicle [(EGG_EVO_HANGARS select 0), _posphM3, [], 0, "NONE"];_hangarM3 setdir _dirh1;sleep 0.05;

_planeM1 = createVehicle [(EGG_EVO_westvehM9 select 0), _pospM1, [], 0, "NONE"];_planeM1 setdir _dirh2;Sleep 0.05;
_planeM2 = createVehicle [(EGG_EVO_westvehM9 select 1), _pospM2, [], 0, "NONE"];_planeM2 setdir _dirh2;Sleep 0.05;
_planeM3 = createVehicle [(EGG_EVO_westvehM9 select 2), _pospM3, [], 0, "NONE"];_planeM3 setdir _dirh2;Sleep 0.05;
_planeM4 = createVehicle [(EGG_EVO_westvehM9 select 3), _pospM4, [], 0, "NONE"];_planeM4 setdir _dirh2;Sleep 0.05;
_planeM5 = createVehicle [(EGG_EVO_westvehM9 select 4), _pospM5, [], 0, "NONE"];_planeM5 setdir _dirh2;Sleep 0.05;
_planeM6 = createVehicle [(EGG_EVO_westvehM9 select 5), _pospM6, [], 0, "NONE"];_planeM6 setdir _dirh2;Sleep 0.05;

{_x setVehicleInit "veh = [this, 1, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf"""}forEach [_planeM1,_planeM2,_planeM3,_planeM4,_planeM5,_planeM6];

processInitCommands;

_posAA1 = GetMarkerPos "westAA1";
_posAA2 = GetMarkerPos "westAA2";
_posAA3 = GetMarkerPos "westAA3";
_posAA4 = GetMarkerPos "westAA4";

_max = (count EGG_EVO_westveh10)-1;

_AA1 = createVehicle [(EGG_EVO_westveh10 select (round random _max)), _posAA1, [], 0, "NONE"];_AA1 setdir _dirh3;Sleep 0.05;
_AA2 = createVehicle [(EGG_EVO_westveh10 select (round random _max)), _posAA2, [], 0, "NONE"];_AA2 setdir _dirh3;Sleep 0.05;
_AA3 = createVehicle [(EGG_EVO_westveh10 select (round random _max)), _posAA3, [], 0, "NONE"];_AA3 setdir _dirh4;Sleep 0.05;
_AA4 = createVehicle [(EGG_EVO_westveh10 select (round random _max)), _posAA4, [], 0, "NONE"];_AA4 setdir _dirh4;Sleep 0.05;

{_x setVehicleInit "veh = [this, 1, 3, 0, FALSE, FALSE] execVM ""vehicle.sqf"""}forEach [_AA1,_AA2,_AA3,_AA4];
processInitCommands;

{_x setVehicleInit "this allowdamage false"}forEach [_hangar1,_hangar2,_hangar3,_hangar4,_hangarM1,_hangarM2,_hangarM3];
processInitCommands;
*/
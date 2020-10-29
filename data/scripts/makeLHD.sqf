// make LHD script - populates LHD base with aircraft/vehicles based on the mod you are running
//mod management EGG_vecmods //## modify desc
//0,1,2,3,4,5,9 
//"Off", "GITS", "RKSL", "PRACS", "UNSUNG", "GLT", "Arma3"
_vecmode = _this select 0;// needed?
_lhdheight = _this select 1;

_posh1 = GetMarkerPos "lhdheli1";
_posh2 = GetMarkerPos "lhdheli2";
_posh3 = GetMarkerPos "lhdheli3";
_posh4 = GetMarkerPos "lhdheli4";
_posh5 = GetMarkerPos "lhdheli5";
_posh6 = GetMarkerPos "lhdheli6";

_dirh1 = GetDir airdir1;
_dirh2 = GetDir airdir2;

_heli1 = createVehicle [(EGG_EVO_westlhdheli1 select 0), _posh1, [], 0, "NONE"];
_heli1 setposASL [_posh1 select 0, _posh1 select 1, _lhdheight];
_heli1 setdir _dirh1;Sleep 0.05;
_heli2 = createVehicle [(EGG_EVO_westlhdheli1 select 1), _posh2, [], 0, "NONE"];
_heli2 setposASL [_posh2 select 0, _posh2 select 1, _lhdheight];
_heli2 setdir _dirh1;Sleep 0.05;
_heli3 = createVehicle [(EGG_EVO_westlhdheli1 select 2), _posh3, [], 0, "NONE"];
_heli3 setposASL [_posh3 select 0, _posh3 select 1, _lhdheight];
_heli3 setdir _dirh1;Sleep 0.05;
_heli4 = createVehicle [(EGG_EVO_westlhdheli1 select 3), _posh4, [], 0, "NONE"];
_heli4 setposASL [_posh4 select 0, _posh4 select 1, _lhdheight];
_heli4 setdir _dirh1;Sleep 0.05;
_heli5 = createVehicle [(EGG_EVO_westlhdheli1 select 4), _posh5, [], 0, "NONE"];
_heli5 setposASL [_posh5 select 0, _posh5 select 1, _lhdheight];
_heli5 setdir _dirh1;Sleep 0.05;
_heli6 = createVehicle [(EGG_EVO_westlhdheli1 select 5), _posh6, [], 0, "NONE"];
_heli6 setposASL [_posh6 select 0, _posh6 select 1, _lhdheight];_heli6 setdir _dirh1;Sleep 0.05;

//ATL

_posp1 = GetMarkerPos "lhdplane1";
_posp2 = GetMarkerPos "lhdplane2";
_posp3 = GetMarkerPos "lhdplane3";

_plane1 = createVehicle [(EGG_EVO_westlhdplane1 select 0), _posp1, [], 0, "NONE"];
_plane1 setposASL [_posp1 select 0, _posp1 select 1, _lhdheight];_plane1 setdir _dirh1;Sleep 0.05;
_plane2 = createVehicle [(EGG_EVO_westlhdplane1 select 1), _posp2, [], 0, "NONE"];
_plane2 setposASL [_posp2 select 0, _posp2 select 1, _lhdheight];
_plane2 setdir _dirh1;Sleep 0.05;
_plane3 = createVehicle [(EGG_EVO_westlhdplane1 select 2), _posp3, [], 0, "NONE"];
_plane3 setposASL [_posp3 select 0, _posp3 select 1, _lhdheight];_plane3 setdir _dirh1;Sleep 0.05;

_posAA1 = GetMarkerPos "lhdAA1";
_posAA2 = GetMarkerPos "lhdAA2";
_posAA3 = GetMarkerPos "lhdAA3";
_posAA4 = GetMarkerPos "lhdAA4";

_max = (count EGG_EVO_westveh10)-1;

_AA1 = createVehicle [(EGG_EVO_westveh10 select 0), _posAA1, [], 0, "NONE"];
_AA1 setposASL [_posAA1 select 0, _posAA1 select 1, _lhdheight];
_AA1 setdir _dirh3;Sleep 0.05;
_AA2 = createVehicle [(EGG_EVO_westveh10 select 0), _posAA2, [], 0, "NONE"];
_AA2 setposASL [_posAA2 select 0, _posAA2 select 1, _lhdheight];
_AA2 setdir _dirh3;Sleep 0.05;
_AA3 = createVehicle [(EGG_EVO_westveh10 select 0), _posAA3, [], 0, "NONE"];
_AA3 setposASL [_posAA3 select 0, _posAA3 select 1, _lhdheight+9];
_AA3 setdir _dirh4;Sleep 0.05;
_AA4 = createVehicle [(EGG_EVO_westveh10 select 0), _posAA4, [], 0, "NONE"];
_AA4 setposASL [_posAA4 select 0, _posAA4 select 1, _lhdheight+11.3];
_AA4 setdir _dirh4;Sleep 0.05;

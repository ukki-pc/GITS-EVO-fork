
	_vec = _this select 0;
	_vecType = typeOf _vec;

	if(_vec getVariable ["spotid",0]!= 0) exitWith{};
	
/*
	_mrktype = "b_mech_inf";
	if (_vec isKindOf "Car") then {_mrktype = "plp_icon_vehicle"};
	if (_vec isKindOf "Tank") then {_mrktype = "plp_icon_tank"};
	if (_vec isKindOf "Plane") then {_mrktype = "plp_icon_planeLight"};

	_markerobj6 = createMarker[format["%1",_vec],[getpos _vec select 0,getpos _vec select 1]];
	_markerobj6 setMarkerColor "ColorRed";
	_markerobj6 setMarkerType _mrktype;

*/
	spotId = spotId +1;
	_spotId = spotId;

	_vec setVariable ["spotid",_spotId];

	screenMarkerBuffer = screenMarkerBuffer + [[_vec,_spotId,"spotMarker",3,"data\spotMark.paa",enemyColor]];
	[] call fnc_marker_screenConsumeBuffer;

	["Spotting",10] spawn fnc_clientHudMessage;
	[10] call fnc_addMoney;

	_stop = (alive _vec);

	waituntil {sleep 4; side _vec != EGG_EVO_ENEMYFACTION};

	if(alive _vec) then {[_vec,[0.4,0.4,0.4,1],5] call fnc_changeScreenmarker;};
//	deleteMarker _markerobj6;

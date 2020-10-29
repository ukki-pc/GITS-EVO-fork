// EB_rearm called from mainthreadc
//EB_airload1 = _vec addAction [_astring, "Actions\EB_rearm.sqf",[_vec,_player], 5, true, true,"",""];

_vec = (vehicle player);
_type = typeOf vehicle player;

if (!(EB_airfn1<0) or (_vec == player) ) then 
{
	_vec removeAction EB_airfn1;
	_vec removeAction EB_airfn2;
	_vec removeAction EB_airfn3;
	_vec removeAction EB_airfn4;
	_vec removeAction EB_airfn5;
	_vec removeAction EB_airfn6;
	_vec removeAction EB_airfn7;

	EB_airfn1=-1;
	EB_airfn2=-1;
	EB_airfn3=-1;
	EB_airfn4=-1;
	EB_airfn5=-1;
	EB_airfn6=-1;
	EB_airfn7=-1;
};

_vec removeAction EB_airload1;
EB_airload1=-1;

if (EGG_vecmods == 0) then
{
	if ( (_vec != player) and (_vec iskindof "Plane") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfn.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfn.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfn.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfn.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfn.sqf",5, 5, true, true,"",""];
		EB_airfn6 = _vec addAction [EB_astring6, "Actions\EB_rearmfn.sqf",6, 5, true, true,"",""];
//		EB_airfn7 = _vec addAction [EB_astring7, "Actions\EB_rearmfn.sqf",7, 5, true, true,"",""];
	};
	if ( (_vec != player) and (_vec iskindof "Helicopter") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfn.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfn.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfn.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfn.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfn.sqf",5, 5, true, true,"",""];

	};
};

//GITS mod
if (EGG_vecmods == 1) then
{
	if ( (_vec != player) and (_vec iskindof "Plane") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnE.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnE.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnE.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnE.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnE.sqf",5, 5, true, true,"",""];
		EB_airfn6 = _vec addAction [EB_astring6, "Actions\EB_rearmfnE.sqf",6, 5, true, true,"",""];
		EB_airfn7 = _vec addAction [EB_astring8, "Actions\EB_rearmfnE.sqf",7, 5, true, true,"",""];
	};
	if ( (_vec != player) and (_vec iskindof "Helicopter") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnE.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnE.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnE.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnE.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnE.sqf",5, 5, true, true,"",""];

	};
};

//RKSL mod
if (EGG_vecmods == 2) then
{
	if ( (_vec != player) and (_vec iskindof "Plane") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnR.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnR.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnR.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnR.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnR.sqf",5, 5, true, true,"",""];
		EB_airfn6 = _vec addAction [EB_astring6, "Actions\EB_rearmfnR.sqf",6, 5, true, true,"",""];
		EB_airfn7 = _vec addAction [EB_astring7, "Actions\EB_rearmfnR.sqf",7, 5, true, true,"",""];
	};
	if ( (_vec != player) and (_vec iskindof "Helicopter") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnR.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnR.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnR.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnR.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnR.sqf",5, 5, true, true,"",""];

	};
};

//PRACS mod
if (EGG_vecmods == 3) then
{
	if ( (_vec != player) and ((_vec iskindof "Plane")||(_vec iskindof "Helicopter")) ) then
	{
		if !(_type in EB_PRACS_hydra) then
		{
			EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnP.sqf",1, 5, true, true,"",""];
			EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnP.sqf",3, 5, true, true,"",""];
			EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnP.sqf",5, 5, true, true,"",""];
			if (_vec iskindof "Plane") then
			{
				EB_airfn6 = _vec addAction [EB_astring6, "Actions\EB_rearmfnP.sqf",6, 5, true, true,"",""];
				EB_airfn7 = _vec addAction [EB_astring7, "Actions\EB_rearmfnP.sqf",7, 5, true, true,"",""];
			};
		};
		if !(_type in EB_PRACS_nohydra) then
		{
			EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnP.sqf",2, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnP.sqf",4, 5, true, true,"",""];
		};
	};
};

//unsung
if (EGG_vecmods == 4) then
{
	if ( (_vec != player) and ((_vec iskindof "Plane")||(_vec iskindof "Helicopter")) ) then
	{
		if !(_type in EB_unsung_hydra) then
		{
			EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnU.sqf",1, 5, true, true,"",""];
			EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnU.sqf",3, 5, true, true,"",""];
			EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnU.sqf",5, 5, true, true,"",""];
			if (_vec iskindof "Plane") then
			{
				EB_airfn6 = _vec addAction [EB_astring8, "Actions\EB_rearmfnU.sqf",6, 5, true, true,"",""];
//				EB_airfn7 = _vec addAction [EB_astring7, "Actions\EB_rearmfnU.sqf",7, 5, true, true,"",""];
			};
		};
		if !(_type in EB_unsung_nohydra) then
		{
			EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnU.sqf",2, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnU.sqf",4, 5, true, true,"",""];
		};
	};
};

//GLT
if (EGG_vecmods == 5) then
{
	if ( (_vec != player) and (_vec iskindof "Plane") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnG.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnG.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnG.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnG.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnG.sqf",5, 5, true, true,"",""];
		EB_airfn6 = _vec addAction [EB_astring6, "Actions\EB_rearmfnG.sqf",6, 5, true, true,"",""];
//		EB_airfn7 = _vec addAction [EB_astring7, "Actions\EB_rearmfnG.sqf",7, 5, true, true,"",""];
	};
	if ( (_vec != player) and (_vec iskindof "Helicopter") ) then
	{
		EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnG.sqf",1, 5, true, true,"",""];
		EB_airfn2 = _vec addAction [EB_astring2, "Actions\EB_rearmfnG.sqf",2, 5, true, true,"",""];
		EB_airfn3 = _vec addAction [EB_astring3, "Actions\EB_rearmfnG.sqf",3, 5, true, true,"",""];
		EB_airfn4 = _vec addAction [EB_astring4, "Actions\EB_rearmfnG.sqf",4, 5, true, true,"",""];
		EB_airfn5 = _vec addAction [EB_astring5, "Actions\EB_rearmfnG.sqf",5, 5, true, true,"",""];

	};
};

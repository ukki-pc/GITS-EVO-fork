disableSerialization;
_x = lbCurSel 2000;
//STR_M04t135,"Distance"
ctrlSetText [2003,(str (score player))];
ctrlSetText [2003,Format ["%1: %2",localize "STR_M04t134",(score player)]];//Score
	ctrlSetText [2203,""];
	ctrlSetText [2204,""];
	ctrlSetText [2205,""];
	ctrlSetText [2206,""]; 
  _recpage = Mpage select 0;
  _suppage = Mpage select 1;
  _asspage = Mpage select 2;
  _grppage = Mpage select 3;
  _optpage = Mpage select 4;
  _pos = [];
if (_recpage) then {
	_y = ((RecList select _x) select 0);
	_z = ((RecList select _x) select 3);
	_a = ((RecList select _x) select 2);
	_b = ((RecList select _x) select 4);
	_kind = ((RecList select _x) select 1);
	ctrlSetText [2201,localize "STR_M04t97"];
	ctrlSetText [2202,localize "STR_M04t96"];
	ctrlShow [6056,true];
	//ctrlSetText [6056,localize "STR_M04t98"];
	with uiNamespace do 
	{
		ctrlBut1 ctrlSetText localize "STR_M04t98";
	};
	ctrlSetText [2001,""];
	ctrlSetText [2002,""];
	ctrlSetText [2010,_y];
	ctrlSetText [2011,_z];
	ctrlSetText [2004,""];
	ctrlSetText [2005,_a];
};
if (_suppage) then {

	_y = ((SupList select _x) select 0);
	msize = (SupList select _x) select 2;
	_z = ((SupList select _x) select 1);
	_a = ((SupList select _x) select 5);
	bmark setMarkerSizeLocal [msize, msize];
	ctrlSetText [2202,localize "STR_M04t101"];
	ctrlSetText [2201,localize "STR_M04t102"];
	ctrlShow [6056,true];
	//ctrlSetText [6056,localize "STR_M04t103"];
	with uiNamespace do
	{
		ctrlBut1 ctrlSetText localize "STR_M04t103";
	};
	ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",((SupList select _x) select 3)]];//Cost
	ctrlSetText [2002,""];
	ctrlSetText [2010,_y];
	ctrlSetText [2011,_z];
	ctrlSetText [2005,_a];
	ctrlSetText [2004,""];
};

if (_asspage) then {
	_y = ((AssList select _x) select 0);
	_z = ((AssList select _x) select 1);
	_a = ((AssList select _x) select 2);
	_kind = ((AssList select _x) select 1);
	ctrlSetText [2202,localize "STR_M04t120"];
	ctrlSetText [2201,localize "STR_M04t121"];
	ctrlShow [6056,true];
	//if (BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t123"]};
	//if (not BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t122"]};
	if (BIS_EVO_Onmission) then 
	{
		with uiNamespace do 
		{
			ctrlBut1 ctrlSetText localize "STR_M04t123";
		};
	};
	if (not BIS_EVO_Onmission) then 
	{
	with uiNamespace do
		{
			ctrlBut1 ctrlSetText localize "STR_M04t122";
		};
	};

	ctrlSetText [2001,""];
	ctrlSetText [2002,Format ["%1: %2",localize "STR_M04t133",((AssList select _x) select 3)]];//Cost
	ctrlSetText [2010,_y];
	ctrlSetText [2011,_z];
	ctrlSetText [2005,_a];
	ctrlSetText [2004,""];
};

if (_grppage) then {
	_unit = (GrpList select _x);
	_y = format["%1",group _unit];
	_z = format["%1 : %2  x (%3)",group _unit,name _unit,count units _unit];
	//_a = "\ca\ui\data\lock_on_ca.paa";
	_a = "\ca\ui\data\lock_off_ca.paa";
	_kind = ((AssList select _x) select 1);
	ctrlSetText [2202,localize "STR_M04xt11"];
	ctrlSetText [2201,localize "STR_M04xt12"];
	ctrlShow [6056,true];
	//if (BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t123"]};
	//if (not BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04xt13"]};
	if (BIS_EVO_Onmission) then
	{
		with uiNamespace do
		{
			ctrlBut1 ctrlSetText localize "STR_M04t123";
		};
	};
	if (not BIS_EVO_Onmission) then
	{
		with uiNamespace do 
		{
			ctrlBut1 ctrlSetText localize "STR_M04xt13";
		};
	};	
	ctrlSetText [2001,""];
	ctrlSetText [2002,""];
	ctrlSetText [2010,_y];
	ctrlSetText [2011,_z];
	ctrlSetText [2005,""];
	ctrlSetText [2004,_a];
};

if (_optpage) then {
	_y = ((TerList select _x) select 0);
	_z = ((TerList select _x) select 1);
	ctrlSetText [2202,localize "STR_M04t124"];
	ctrlSetText [2201,localize "STR_M04t125"];
	ctrlShow [6056,false];
	ctrlShow [6057,true];
	ctrlShow [6058,true];
	((uiNamespace getVariable "ctrlListBox") displayCtrl 2000) ctrlSetPosition [0.0506555,0.22,0.31, 0.05];
	ctrlSetText [2203,localize "STR_M04t126"];
	ctrlSetText [2204,localize "STR_M04t127"]; 
	ctrlSetText [2001,""];
	ctrlSetText [2003,""];
	ctrlSetText [2002,""];
	ctrlSetText [2010,localize "STR_M04t124"];
	ctrlSetText [2011,localize "STR_M04t128"];
	ctrlSetText [2005,""];
	ctrlSetText [2004,""];
	setterraingrid _z;
};


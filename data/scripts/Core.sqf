disableSerialization;
uiNamespace setVariable ["displayVendor", findDisplay 100];
uiNamespace setVariable ["ctrlTitle", (uiNamespace getVariable "displayVendor") displayCtrl 101];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl 2000];
uiNamespace setVariable ["ctrlListBox2", (uiNamespace getVariable "displayVendor") displayCtrl 1995];
uiNamespace setVariable ["ctrlPrice", (uiNamespace getVariable "displayVendor") displayCtrl 2001];
uiNamespace setVariable ["ctrlAtit", (uiNamespace getVariable "displayVendor") displayCtrl 2201];
uiNamespace setVariable ["ctrlMtit", (uiNamespace getVariable "displayVendor") displayCtrl 2202];
uiNamespace setVariable ["ctrlCount", (uiNamespace getVariable "displayVendor") displayCtrl 2002];
uiNamespace setVariable ["ctrlMoney", (uiNamespace getVariable "displayVendor" )displayCtrl 2003];
uiNamespace setVariable ["ctrlPreview", (uiNamespace getVariable "displayVendor") displayCtrl 2004];
uiNamespace setVariable ["ctrlPreviewMag", (uiNamespace getVariable "displayVendor") displayCtrl 2005];
uiNamespace setVariable ["ctrlDescTtl", (uiNamespace getVariable "displayVendor") displayCtrl 2010];
uiNamespace setVariable ["ctrlDesc", (uiNamespace getVariable "displayVendor") displayCtrl 2011];
uiNamespace setVariable ["ctrlWEaponsBck", (uiNamespace getVariable "displayVendor") displayCtrl 150];
uiNamespace setVariable ["ctrlMagazinesBck", (uiNamespace getVariable "displayVendor") displayCtrl 151];
uiNamespace setVariable ["ctrlWeapons", (uiNamespace getVariable "displayVendor") displayCtrl 155];
uiNamespace setVariable ["ctrlMagazines", (uiNamespace getVariable "displayVendor") displayCtrl 156];
uiNamespace setVariable ["ctrlBut1", (uiNamespace getVariable "displayVendor") displayCtrl 6056];
uiNamespace setVariable ["buyBut1", (uiNamespace getVariable "displayVendor") displayCtrl 661];
uiNamespace setVariable ["buyButClose", (uiNamespace getVariable "displayVendor") displayCtrl 663];
uiNamespace setVariable ["buyCar", (uiNamespace getVariable "displayVendor") displayCtrl 664];
uiNamespace setVariable ["buyTank", (uiNamespace getVariable "displayVendor") displayCtrl 665];
uiNamespace setVariable ["buyAir", (uiNamespace getVariable "displayVendor") displayCtrl 666];
uiNamespace setVariable ["buyStatic", (uiNamespace getVariable "displayVendor") displayCtrl 667];
uiNamespace setVariable ["buySpecial", (uiNamespace getVariable "displayVendor") displayCtrl 668];
uiNamespace setVariable ["vehMenuBtn", (uiNamespace getVariable "displayVendor") displayCtrl 670];
uiNamespace setVariable ["vehUpgTur1", (uiNamespace getVariable "displayVendor") displayCtrl 671];
uiNamespace setVariable ["vehUpgMis1", (uiNamespace getVariable "displayVendor") displayCtrl 672];
uiNamespace setVariable ["vehLoadout", (uiNamespace getVariable "displayVendor") displayCtrl 673];
uiNamespace setVariable ["storeVeh", (uiNamespace getVariable "displayVendor") displayCtrl 674];
uiNamespace setVariable ["saveLoadout", (uiNamespace getVariable "displayVendor") displayCtrl 675];
uiNamespace setVariable ["unflipVeh", (uiNamespace getVariable "displayVendor") displayCtrl 676];
uiNamespace setVariable ["hitMark", (uiNamespace getVariable "displayVendor") displayCtrl 677];
uiNamespace setVariable ["vehUpg", (uiNamespace getVariable "displayVendor") displayCtrl 678];
uiNamespace setVariable ["ctrlVis", (uiNamespace getVariable "displayVendor") displayCtrl 6057];
uiNamespace setVariable ["ctrlAirvis", (uiNamespace getVariable "displayVendor") displayCtrl 6058];
uiNamespace setVariable ["ctrlTervis", (uiNamespace getVariable "displayVendor") displayCtrl 6059];
uiNamespace setVariable ["ctrlVTitle", (uiNamespace getVariable "displayVendor") displayCtrl 2203];
uiNamespace setVariable ["ctrlVactive", (uiNamespace getVariable "displayVendor") displayCtrl 2205];
uiNamespace setVariable ["ctrlAVTitle", (uiNamespace getVariable "displayVendor") displayCtrl 2204];
uiNamespace setVariable ["ctrlAVactive", (uiNamespace getVariable "displayVendor") displayCtrl 2206];
uiNamespace setVariable ["ctrlTTitle", (uiNamespace getVariable "displayVendor") displayCtrl 2207];
uiNamespace setVariable ["ctrlTactive", (uiNamespace getVariable "displayVendor") displayCtrl 2208];
uiNamespace setVariable ["ctrlName", (uiNamespace getVariable "displayVendor") displayCtrl 500];
uiNamespace setVariable ["ctrlPicture", (uiNamespace getVariable "displayVendor") displayCtrl 501];
uiNamespace setVariable ["GPSgmap", (uiNamespace getVariable "displayVendor") displayCtrl 895];
uiNamespace setVariable ["Construct", (uiNamespace getVariable "displayVendor") displayCtrl 679];

sliderSetRange [6057, 100, 10000];
sliderSetPosition [6057, BIS_EVO_vdist];
sliderSetRange [6058, 100, 10000];
sliderSetPosition [6058, BIS_EVO_avdist];
//
sliderSetRange [6059, 1, 5];
sliderSetPosition [6059, BIS_EVO_grid];

ctrlShow [6057,false];
ctrlShow [6058,false];
ctrlShow [6067,false];
ctrlShow [6068,false];
//
ctrlShow [6059,false];
ctrlShow [2203,false];
ctrlShow [2204,false];
ctrlShow [2205,false];
ctrlShow [2206,false];
ctrlShow [2207,false];
ctrlShow [2208,false];
ctrlShow [895,false];

ctrlSetText [2203,""];
ctrlSetText [2204,""];
ctrlSetText [2205,""];
ctrlSetText [2206,""];
//
ctrlSetText [2207,""];
ctrlSetText [2208,""];

ctrlShow [663,false];
ctrlShow [664,false];
ctrlShow [665,false];
ctrlShow [666,false];
ctrlShow [667,false];
ctrlShow [668,false];
ctrlShow [671,false]; //Turret page
ctrlShow [672,false]; //Weapon page
ctrlShow [673,false]; //Loadout page
ctrlShow [674,false]; //Storeveh btn
ctrlShow [675,true]; //Loadout btn
ctrlShow [676,false]; //Unflip btn
ctrlShow [677,false]; //Hitmark btn
ctrlShow [895,true]; //Map
ctrlShow [678,false]; //Upg btn
ctrlShow [1995,false]; //2nd list
ctrlShow [679,false]; // Construct page

if ((vehicle player isKindOf  "Air" ) ) then
{
	ctrlShow [669,false];
}
else
{
	ctrlShow [670,false];
};

if(vehicle player != player) then {
	ctrlShow [679,false];
	ctrlShow [678,true];
}
else{
	ctrlShow [679,true];
	ctrlShow [678,false];
};

bplace = false;

bmark = createMarkerLocal ["btarg", [0,0,0]];
bmark setMarkerShapeLocal "ELLIPSE";
bmark setMarkerTypeLocal "Destroy";
bmark setMarkerColorLocal "ColorGreen";
bmark setMarkerSizeLocal [0.5, 0.5];

onMapSingleClick {"btarg" setMarkerPos _pos;bplace=true};

(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"") then {closeDialog 0}"];

mrole = "";
mrank = 0;
mcost = 0;
msize = 0;
mtime = 0;
mord = 0;
upgIndex = -1;
// Lists
BIS_EVO_ListUpdate = 
{
	SupList = [];
	RecList = [];
	AssList = [];
	GrpList = [];

/*
	_infantry = [[],["USMC_Soldier","USMC_Soldier_Medic","USMC_Soldier_LAT"],["USMC_Soldier_MG","USMC_Soldier_GL"],["USMC_Soldier_AA","USMC_SoldierS_Sniper"],["USMC_Soldier_AT","USMC_Soldier_AR"],[],["USMC_Soldier_HAT"]];

	_crew = [[],["USMC_Soldier_Pilot"],[],[],[],[],[]];
	_forcerecon = [[],[],[],[],[],["FR_R"],[]];
	_command = [[],[],[],[],[],[],[]];
*/
	_rank = 0;
	_newstring = "";
	_rank = playerRank;

	_assemblelist =  
	{
		_list = _this select 0;
		_newstring = "";
		_count = _rank;
		_i = 0;
		while {_i <= _count} do 
		{	
			_units = (_list select _i);
			_arraycount = count _units;
			if(_arraycount > 0) then
			{
				while {_arraycount > 0} do 
				{
					_unit = _units select _arraycount-1;
					_uname = getText (configFile >> "CfgVehicles" >> _unit >> "DisplayName");
					_picture = getText (configFile >> "CfgVehicles" >> _unit >> "portrait");
					_guns = format["%1 %2",(getArray (configFile >> "CfgVehicles" >> _unit >> "weapons")) select 0,(getArray (configFile >> "CfgVehicles" >> _unit >> "weapons")) select 1];
					_guns = [_unit] call _GetGuns;
					_picture = "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca";
					RecList = RecList +[[_uname, _unit, _picture,_guns]];
					_arraycount = _arraycount-1;
				};
			};
			_i = _i+1;
		};
	};

	_txtmessage = "";
	_GetGuns =
	{
		_type = _this select 0;;
		_name = "";
		_array = getArray (configFile >> "CfgVehicles" >> _type >> "weapons");
		_count = count _array;
		_txtmessage = format ["%1:",localize "STR_M04t100"];
		_i=0;
		while {_i < _count} do 
		{
			_name = getText (configFile >> "CfgWeapons" >> (_array select _i) >> "displayName");
			if(_name != "throw" and _name != "put") then 
			{
				if(_i == _count-3) then 
				{
					_txtmessage = format["%1 and %2.",_txtmessage,_name];
				};
				if(_i == 0) then 
				{
					_txtmessage = format["%1 %2",_txtmessage,_name];
				};
				if(_i != _count-3 and _i != 0) then
				{
					_txtmessage = format["%1 %2",_txtmessage,_name];
				};
			};
			_i = _i+1;
		};
		_txtmessage
	};
	_GetMyGuns =
	{
		_player = _this select 0;;
		_name = "";
		_array = weapons _player;
		_count = count _array;
		_txtmessage = format ["%1:",localize "STR_M04t100"];
		_i=0;
		while {_i < _count} do 
		{
			_name = getText (configFile >> "CfgWeapons" >> (_array select _i) >> "displayName");
			if(_name != "throw" and _name != "put") then 
			{
				if(_i == _count-3) then 
				{
					_txtmessage = format["%1 and %2.",_txtmessage,_name];
				};
				if(_i == 0) then 
				{
					_txtmessage = format["%1 %2",_txtmessage,_name];
				};
				if(_i != _count-3 and _i != 0) then
				{
					_txtmessage = format["%1 %2",_txtmessage,_name];
				};
			};
			_i = _i+1;
		};
		_txtmessage
	};

	//-----------------------------------------------------------------


	//RECRUIT SETUP
	_recpage = Mpage select 0;
	_suppage = Mpage select 1;
	_asspage = Mpage select 2;
	_grppage = Mpage select 3;
	_optpage = Mpage select 4;
	_buypage = Mpage select 5;
	_buySubPage = Mpage select 6;
	_perkPage = Mpage select 7;
	_vecPage = Mpage select 8;
	_vecSubPage = Mpage select 9;
	_constructPage = Mpage select 10;

	ctrlShow [6057,false];
	ctrlShow [6058,false];
//
	ctrlShow [6059,false];
//	TerList = [[localize "STR_M04t129",50],[localize "STR_M04t130",25],[localize "STR_M04t131",12.5]];
	TerList = [[localize "str_terrain_50",50,0],[localize "str_terrain_25",25,1],[localize "str_terrain_12_5",12.5,2],[localize "str_terrain_6_25",6.25,3],[localize "str_terrain_3_125",3.125,4]];

	_sco = score player;

//RECRUIT

	if (helpersparam == 1) then 
	{
		RecList = [[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_EP1" >> "DisplayName"), "US_Delta_Force_EP1", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca", ["US_Delta_Force_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_Medic_EP1" >> "DisplayName"), "US_Delta_Force_Medic_EP1", "\Ca\characters\data\Ico\i_med_ca.paa",["US_Delta_Force_Medic_EP1"] call _GetGuns]];
	};

/* developing parameter for artillery cost based on:
EGG_EVO_Artycost = paramsArray select 14;
values[] = {1,2,3,4,5,6,7,8,9,10,1000};
use as:
SupList = SupList +[[localize "STR_M04t106",localize "STR_M04t107",20,(EGG_EVO_Artycost*1),10,"data\sup01.paa",2]];
*/


//support
	SupList = SupList +[[localize "str_dn_ammocrate","Cost: 5 All the ammo you need",10,5,10,"data\sup01.paa",1]];
	SupList = SupList +[["Vehicle ammo crate","Cost: 10 All the Vehicle ammo you need",10,10,10,"data\sup01.paa",25]];
	SupList = SupList +[["Fuel barrels","Cost: 10 All the fuel you need",10,10,10,"data\sup01.paa",26]];
	SupList = SupList +[[localize "strwfsmokegreen","Cost: 0 Mark a location with white/green smoke",10,0,3,"data\sup01.paa",9]];
	SupList = SupList +[[localize "str_dn_bike"
,"Emergency transport",20,0,10,"data\sup01.paa",19]];
	SupList = SupList +[[localize "str_som_marker_boat","Cost: 0 Ideal for crossing water",20,0,10,"data\sup01.paa",10]];
	SupList = SupList +[[localize "str_som_arty_barrage_mission_4"
,"Cost: 3 Ideal for night defence",20,3,20,"data\sup01.paa",20]];
//precision strike
	SupList = SupList +[[localize "STR_M04t106",localize "STR_M04t107",20,(EGG_EVO_Artycost*2),10,"data\sup01.paa",2]];
//blazes change
//new mortar barrage
	SupList = SupList +[["Mortar barrage","Cost: 5 Just perfect for Charlie in the Treeline!",20,(EGG_EVO_Artycost*2),10,"data\sup01.paa",23]];

//missions
AssList = [];
AssList = AssList +[["Relocate","Relocate to captured town or base.","data\offensive.paa",0,17]];
AssList = AssList +[["Town Conquest","Capture objective from enemy control.","data\offensive.paa",0,16]];
AssList = AssList +[["Save Game","Save game for next session.","data\offensive.paa",0,18]];

	if(_sco >= BIS_EVO_rank1) then 
	{
		mrank = BIS_EVO_rank1;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_AT_EP1" >> "DisplayName"), "US_Soldier_AT_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa", ["US_Soldier_AT_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_Pilot_EP1" >> "DisplayName"), "US_Soldier_Pilot_EP1", "\Ca\characters\data\portraits\combarhead_usmc_pilot_ca",["US_Soldier_Pilot_EP1"] call _GetGuns]];
	};
//support
	SupList = SupList +[[localize "str_dn_30rnd_105mmsmoke_m119","Cost: 3 Ideal for masking your movement",20,3,5,"data\sup01.paa",11]];
	SupList = SupList +[[localize "str_dn_motorcycle","Cost: 5 Emergency transport for two",20,5,10,"data\sup01.paa",8]];
//place mines
	SupList = SupList +[[localize "str_paradrop_obj12shorter","Ideal for protecting a road",50,(EGG_EVO_Artycost*2),5,"data\sup01.paa",22]];

//place traps
		if (gitsnades == 2) then {SupList = SupList +[["Set traps","Ideal for protecting an area against infantry",50,(EGG_EVO_Artycost*2),5,"data\sup01.paa",24]]};
	};
	if(_sco >= BIS_EVO_rank2) then 
	{
		mrank = BIS_EVO_rank2;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_MG_EP1" >> "DisplayName"), "US_Delta_Force_MG_EP1", "\Ca\weapons\data\Ico\i_mg_CA.paa",["US_Delta_Force_MG_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_GL_EP1" >> "DisplayName"), "US_Soldier_GL_EP1", "\Ca\characters\data\Ico\i_sf_ca.paa", ["US_Soldier_GL_EP1"] call _GetGuns]];
	};

//support
	SupList = SupList +[[localize "str_dn_staticmgweapon","Cost: 5 Ideal for defending an area against enemy troops",20,5,10,"data\sup01.paa",12]];
//small arty
	SupList = SupList +[[localize "STR_M04t108",localize "STR_M04t109",50,(EGG_EVO_Artycost*4),20,"data\sup01.paa",3]];

//missions
	};
	if(_sco >= BIS_EVO_rank3) then 
	{
		mrank = BIS_EVO_rank3;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_AA_EP1" >> "DisplayName"), "US_Soldier_AA_EP1", "\Ca\weapons\data\Ico\i_aa_CA.paa",["US_Soldier_AA_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_SniperH_EP1" >> "DisplayName"), "US_Soldier_SniperH_EP1", "\Ca\weapons\data\Ico\i_sniper_CA.paa",["US_Soldier_SniperH_EP1"] call _GetGuns]];
		};

//support

		SupList = SupList +[[localize "str_dn_staticgrenadelauncher","Cost: 15 Ideal for bombarding enemy troops",20,15,10,"data\sup01.paa",13]];
		SupList = SupList +[[localize "str_dn_fortification","Cost: 10 Ideal for securing an area and providing cover",20,10,10,"data\sup01.paa",14]];
//cluster bomb
		SupList = SupList +[[localize "STR_M04t110",localize "STR_M04t111",50,(EGG_EVO_Artycost*6),20,"data\sup01.paa",4]];
	};
	if(_sco >= BIS_EVO_rank4) then 
	{
		mrank = BIS_EVO_rank4;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "CZ_Soldier_AT_DES_EP1" >> "DisplayName"), "CZ_Soldier_AT_DES_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa", ["CZ_Soldier_AT_DES_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "CZ_Special_Forces_MG_DES_EP1" >> "DisplayName"), "CZ_Special_Forces_MG_DES_EP1", "\Ca\weapons\data\Ico\i_mg_CA.paa",["CZ_Special_Forces_MG_DES_EP1"] call _GetGuns]];
	};

//support	
		SupList = SupList +[[localize "str_dn_rhib2","Cost: 5 Ideal for assaulting positions from the sea",20,5,10,"data\sup01.paa",15]];
		SupList = SupList +[[localize "init.sqf7_3","Cost: 20 Ideal for Air Defences",20,20,10,"data\sup01.paa",16]];
	SupList = SupList +[[localize "str_artdlg_btnfirearea","Ideal for suppressing a city",200,(EGG_EVO_Artycost*5),30,"data\sup01.paa",21]];
//large arty
		SupList = SupList +[[localize "STR_M04t112",localize "STR_M04t113",100,(EGG_EVO_Artycost*8),30,"data\sup01.paa",5]];
	};
	if(_sco >= BIS_EVO_rank5) then 
	{
		mrank = BIS_EVO_rank5;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_SD_EP1" >> "DisplayName"), "US_Delta_Force_SD_EP1", "\Ca\characters\data\Ico\i_sf_ca.paa",["US_Delta_Force_SD_EP1"] call _GetGuns]];
	};

//support
		SupList = SupList +[[localize "str_dn_staticcannon","Cost: 25 Ideal for suppressing enemy armour and troops",20,25,10,"data\sup01.paa",17]];
//chem strike
		SupList = SupList +[[localize "STR_M04t114",localize "STR_M04t115",150,(EGG_EVO_Artycost*20),40,"data\sup01.paa",6]];

//missions	
};
	if(_sco >= BIS_EVO_rank6) then 
	{
		mrank = BIS_EVO_rank6;

//recruit
	if (helpersparam == 1) then 
	{
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_HAT_EP1" >> "DisplayName"), "US_Soldier_HAT_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa",["US_Soldier_HAT_EP1"] call _GetGuns]];
	};

//support
//rank 6
		SupList = SupList +[[localize "init.sqf_5_1","Cost: 5 Get me out of this hell-hole",20,5,5,"data\sup01.paa",18]];
//nuke
		SupList = SupList +[[localize "STR_M04t116",localize "STR_M04t117",200,(EGG_EVO_Artycost*40),60,"data\sup01.paa",7]];
	};

	if (helpersparam == 0) then 
	{
		RecList = [];
	};

/*
"US_Delta_Force_EP1"
"US_Delta_Force_Medic_EP1"
"US_Soldier_AT_EP1"
"US_Soldier_Pilot_EP1"
"US_Delta_Force_MG_EP1"
"US_Soldier_GL_EP1"
"US_Soldier_AA_EP1"
"US_Soldier_SniperH_EP1"
"CZ_Soldier_AT_DES_EP1"
"CZ_Special_Forces_MG_DES_EP1"
"US_Delta_Force_SD_EP1"
"US_Soldier_HAT_EP1"
*/

	//TÄÄ SEO
	if (helpersparam == 2) then 
	{
		RecList = [];
		RecList = [[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_EP1" >> "DisplayName"), "US_Delta_Force_EP1", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca", ["US_Delta_Force_EP1"] call _GetGuns]];
		RecList = RecList+ [[getText (configFile >> "CfgVehicles" >> "US_Soldier_Crew_EP1" >> "DisplayName"), "US_Soldier_Crew_EP1", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca", ["US_Soldier_Crew_EP1"] call _GetGuns]];
		RecList = RecList +[["Copy me","ME", "\Ca\characters\data\Ico\i_med_ca.paa",[player] call _GetMyGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_Medic_EP1" >> "DisplayName"), "US_Delta_Force_Medic_EP1", "\Ca\characters\data\Ico\i_med_ca.paa",["US_Delta_Force_Medic_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_AT_EP1" >> "DisplayName"), "US_Soldier_AT_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa", ["US_Soldier_AT_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_Pilot_EP1" >> "DisplayName"), "US_Soldier_Pilot_EP1", "\Ca\characters\data\portraits\combarhead_usmc_pilot_ca",["US_Soldier_Pilot_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Delta_Force_MG_EP1" >> "DisplayName"), "US_Delta_Force_MG_EP1", "\Ca\weapons\data\Ico\i_mg_CA.paa",["US_Delta_Force_MG_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_GL_EP1" >> "DisplayName"), "US_Soldier_GL_EP1", "\Ca\characters\data\Ico\i_sf_ca.paa", ["US_Soldier_GL_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_AA_EP1" >> "DisplayName"), "US_Soldier_AA_EP1", "\Ca\weapons\data\Ico\i_aa_CA.paa",["US_Soldier_AA_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_SniperH_EP1" >> "DisplayName"), "US_Soldier_SniperH_EP1", "\Ca\weapons\data\Ico\i_sniper_CA.paa",["US_Soldier_SniperH_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "CZ_Soldier_AT_DES_EP1" >> "DisplayName"), "CZ_Soldier_AT_DES_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa", ["CZ_Soldier_AT_DES_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "CZ_Special_Forces_MG_DES_EP1" >> "DisplayName"), "CZ_Special_Forces_MG_DES_EP1", "\Ca\weapons\data\Ico\i_mg_CA.paa",["CZ_Special_Forces_MG_DES_EP1"] call _GetGuns]];
		RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "US_Soldier_HAT_EP1" >> "DisplayName"), "US_Soldier_HAT_EP1", "\Ca\weapons\data\Ico\i_at_CA.paa",["US_Soldier_HAT_EP1"] call _GetGuns]];
	};

/*
	if (helpersparam > 0) then 
	{
		[_infantry] call _assemblelist;
		[_crew] call _assemblelist;
		[_forcerecon] call _assemblelist;
		[_command] call _assemblelist;
	};
*/

	if (_recpage) then 
	{
		ctrlShow [675,true]; //Loadout btn
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
		ctrlShow [895,true]; //Map
		ctrlShow [1995,false]; //2nd list
		ctrlShow [677,false];
		
		ctrlShow [663,false];
		ctrlShow [664,false];
		ctrlShow [665,false];
		ctrlShow [666,false];
		ctrlShow [667,false];		
		ctrlShow [668,false];
		ctrlShow [661,true];
		ctrlShow [656,true];
		ctrlShow [657,true];
		ctrlShow [658,true];
		ctrlShow [659,true];

		ctrlShow [671,false]; //Turret page
		ctrlShow [672,false]; //Missile page
		ctrlShow [678,true]; //Upg btn
		ctrlShow [673,false]; //Loadout page
		ctrlShow [674,false]; //Storeveh page
		ctrlShow [676,false]; //Unflip btn
		
		lbClear 2000;
		_i = 0;
		if(player distance backPacks > 4) then 
		{
			
			while {_i < count RecList} do 
			{
				_name = (RecList select _i) select 0;
				_pic = (RecList select _i) select 2;
				_index = lbAdd[2000, _name];
				_index = lbSetPicture [2000, _i, _pic];
				_i = _i + 1;
			};
		}
		else
		{
			while {_i < count BIS_EVO_PlayerModels} do 
			{
				_name = ((BIS_EVO_PlayerModels) select _i);
				_dispname = getText (configFile >> "cfgVehicles" >> _name >> "displayName");
				//_pic = (RecList select _i) select 2;
				_index = lbAdd[2000, _dispname];
				//_index = lbSetPicture [2000, _i, _pic];
				_i = _i + 1;
			};
		};
	};
	if (_suppage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
		ctrlShow [677,false];

		_i = 0;
		lbClear 2000;
		while {_i < count SupList} do 
		{
			_name = (SupList select _i) select 0;
			_pic = (SupList select _i) select 5;

			_index = lbAdd [2000, _name];
			_index = lbSetPicture[2000, _i, _pic];
			_i = _i + 1;
		};
	};

	if (_asspage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		_i = 0;
			lbClear 2000;
		while {_i < count AssList} do 
		{
			_name = (AssList select _i) select 0;
			_pic = (AssList select _i) select 2;

		_index = lbAdd [2000, _name];
			_index = lbSetPicture[2000, _i, _pic];
			_i = _i + 1;
		};
	};

//build list of players to join

	if (_grppage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		_i = 0;
		_Plist = [objNull];
		{_Plist = _Plist + [_x]} forEach playableUnits;
		lbClear 2000;
		
		while {_i < count _Plist} do 
		{
			_unit = (_Plist select _i);
			
			_name = name _unit;
			_grpunit = group _unit;
			_rank = rank _unit;
			_pic = "";
			if(isNull _unit) then {_name = "<New>";_rank = ""};
			if(isNull _grpunit) then {_grpunit = ""};
			switch (_rank) do
			{
				case "PRIVATE":
				{
					_pic = "data\pvt.paa";
				};
				case "CORPORAL":
				{
					_pic = "data\corp.paa";
				};
				case "SERGEANT":
				{
					_pic = "data\sgt.paa";
				};
				case "LIEUTENANT":
				{
					_pic = "data\ltn.paa";
				};
				case "CAPTAIN":
				{
					_pic = "data\cpt.paa";
				};
				case "MAJOR":
				{
					_pic = "data\mjr.paa";
				};
				case "COLONEL":
				{
					_pic = "data\col.paa";
				};
			};
			GrpList = GrpList+[_unit];
			_index = lbAdd [2000, format["%1 %2",_name, _grpunit]];
			_index = lbSetPicture[2000, _i, _pic];
			_i = _i + 1;
		};
	};

	if (_optpage) then 
	{
		_i = 0;
		lbClear 2000;
		while {_i < count TerList} do 
		{
			_name = (TerList select _i) select 0;
			_index = lbAdd [2000, _name];
			_i = _i + 1;
		};
	};

	if (_perkPage) then 
	{
/*
		_i = 0;
		lbClear 2000;
		
			//Officer Perk
			_maxLevel = 4;
			_name = "Officer";
			_text = format["%1 %2/%3",_name,perkOffLVL,_maxLevel];
			ctrlSetText [2010,_name];
			ctrlSetText [2011,"Perks"];
			_index = lbAdd [2000, _text];
			//Engineer Perk
			_maxLevel = 4;
			_name = "Engineer";
			_text = format["%1 %2/%3",_name,perkEngLVL,_maxLevel];
			ctrlSetText [2010,_name];
			ctrlSetText [2011,"Perks"];
			_index = lbAdd [2000, _text];

			//Recon Perk
			_maxLevel = 4;
			_name = "Recon";
			_text = format["%1 %2/%3",_name,perkSniperLVL,_maxLevel];
			ctrlSetText [2010,_name];
			ctrlSetText [2011,"Perks"];
			_index = lbAdd [2000, _text];

			//Pilot Perk
			_name = "Recon";
			_maxLevel = 4;
			_text = format["%1 %2/%3",_name,perkPilotLVL,_maxLevel];
			ctrlSetText [2010,_name];
			ctrlSetText [2011,"Perks"];
			_index = lbAdd [2000, _text];

*/

	};
		if (_vecPage) then 
	{
		ctrlShow [661,false];
		ctrlShow [663,true];
		ctrlShow [664,false];
		ctrlShow [665,false];
		ctrlShow [666,false];
		ctrlShow [667,false];
		ctrlShow [668,false];
		ctrlShow [656,false];
		ctrlShow [657,false];
		ctrlShow [658,false];
		ctrlShow [659,false];
		ctrlShow [671,true]; //Turret page
		ctrlShow [672,true]; //Missile page
		ctrlShow [673,true]; //Loadout page
		ctrlShow [675,false];
		ctrlShow [677,false];

		ctrlShow [895,false]; //Map
		ctrlShow [1995,true]; //2nd list


		lbClear 2000;

			
		switch (_vecSubPage) do 
		{
			case 1:
			{	
				if(vehicle player iskindof "Air") then 
				{
					_index = lbAdd [2000, "Combat Area Patrol"];
					_index = lbAdd [2000, "Close Air Support"];
					_index = lbAdd [2000, "Air to Ground Missile"];
					_index = lbAdd [2000, "Multi Role"];
					_index = lbAdd [2000, "Bombs"];
					_index = lbAdd [2000, "Laser Guided Bomb"];
					_index = lbAdd [2000, "SEAD"];
				};
			};
			case 2:
			{
				if(vehicle player iskindof "Air") then 
				{
					lbClear 2000;
					for [{_i=0}, {_i< count EB_turrets}, {_i=_i+1}] do
					{
						_class = EB_turrets select _i;
						_magazineArray = getArray (configFile >> "CfgWeapons" >> _class >> "magazines");
						_armament = _magazinearray select 0;
						_nameR =  getText(configFile >> "CfgMagazines" >> _armament >> "displayName");
						_name = format ["%1",_nameR];
						_description = "turret ";
						ctrlSetText [2010,_name];
						ctrlSetText [2011,_description];
						_index = lbAdd [2000, _name];
					};
				};
			};
			case 3:
			{
				lbClear 1995;
				if(vehicle player iskindof "Air") then 
				{
					for [{_i=0}, {_i< count EGG_missiles}, {_i=_i+1}] do
					{
						_class = EGG_missiles select _i;
						_magazineArray = getArray (configFile >> "CfgWeapons" >> _class >> "magazines");
						_armament = _magazinearray select 0;
						_nameR =  getText(configFile >> "CfgMagazines" >> _armament >> "displayName");
						_name = format ["%1",_nameR];

						_description = "missile ";

						ctrlSetText [2010,_name];
						ctrlSetText [2011,_description];
						_index = lbAdd [2000, _name];
						};
					

					_mags =  magazines vehicle player;
					for [{_i=0}, {_i< count _mags}, {_i=_i+1}] do
					{
						_nameR =  getText(configFile >> "CfgMagazines" >> _mags select _i >> "displayName");
						_name = nil;
						if(_namer == "") then 
						{
							//_name = format ["Slot: %1, Unknown",_i+1];
						}
						else
						{
							_name = format ["Slot: %1, %2",_i+1, _nameR];
							_index2 = lbAdd[1995,_name];	
						};	
					};
				};
				
			};
			case 4:
			{
				lbClear 1995;
				lbClear 2000;
				_found = false;
				
				for [{_y=0}, {_y< count vehUpgList}, {_y=_y+1}] do
				{
					for [{_i=0}, {_i< count (vehUpgList select _y)}, {_i=_i+1}] do
					{
						if((typeof (vehicle player)) in (vehUpgList select _y)) then //if current vehicle is upgradeable or can be upgraded to
						{
							upgIndex = _y;
							if(_i mod 2 == 0) then //every even index is vehicle class
							{
								_veh = (vehUpgList select _y) select _i;
								_displayName = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
								_index = lbAdd [2000, _displayName];
							};
							_found = true;
						};
					};
					if(_found) exitWith {};
				};
			};
		};
	};
		if (_buypage) then 
	{
		_ap = player;
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		ctrlShow [661,false];
		ctrlShow [663,true];
		ctrlShow [664,true];
		ctrlShow [665,true];
		ctrlShow [666,true];
		ctrlShow [667,true];
		ctrlShow [668,true];
		ctrlShow [656,false];
		ctrlShow [657,false];
		ctrlShow [658,false];
		ctrlShow [659,false];
		ctrlShow [675,false];
		//ctrlSetText [2012,format["Cooldown: %1 seconds.",buyCoolDown]];

		if(vehicle player != player) then {
			ctrlShow [674,true]; //Storeveh page
		}
		else{
			ctrlShow [676,true]; //Unflip btn
		};
//

		_i = 0;
		lbClear 2000;
		
		switch (_buySubPage) do
		{
			case 1:
			{
				_name = "";
				while {_i < count buyCarList} do 
				{
					_pic = "";
					_name = ((buyCarList select _i) select 0);
					_stored = ((buyCarList select _i) select 2);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_salesString = format["[%1] %2 ",_stored,_displayName];
					_index = lbAdd[2000, _salesString];

					//Locked vehicles are red, otherwise white

					if(_name in BIS_EVO_unlockables and !(_name in BIS_EVO_unlocked)) then {
					_index = lbSetColor [2000, _i, [1, 0, 0, 0.5]];
					};
					//_index = lbSetPicture [2000, _i, _pic];
					_i = _i + 1;
				};
			};
			case 2:
			{
				_name = "";
				while {_i < count buyTankList} do 
				{
					_pic = "";
					_unlock = ((buyTankList select _i) select 2);
					_name = ((buyTankList select _i) select 0);
					_stored = ((buyTankList select _i) select 2);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_salesString = format["[%1] %2",_stored,_displayName];
					_index = lbAdd[2000, _salesString];
					if(_name in BIS_EVO_unlockables and !(_name in BIS_EVO_unlocked)) then {
					_index = lbSetColor [2000, _i, [1, 0, 0, 0.5]];
					};
					_i = _i + 1;
				};
			};
			case 3:
			{
				_name = "";
				while {_i < count buyAirList} do 
				{
					_pic = "";
					_unlock = ((buyAirList select _i) select 2);
					_name = ((buyAirList select _i) select 0);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_stored = ((buyAirList select _i) select 2);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_salesString = format["[%1] %2",_stored,_displayName];
					_index = lbAdd[2000, _salesString];
					if(_name in BIS_EVO_unlockables and !(_name in BIS_EVO_unlocked)) then {
					_index = lbSetColor [2000, _i, [1, 0, 0, 0.5]];
					};
					_i = _i + 1;
				};
			};
			case 4:
			{
				_name = "";
				while {_i < count buyStatList} do 
				{
					_pic = "";
					_name = ((buyStatList select _i) select 0);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_stored = ((buyStatList select _i) select 2);
					_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
					_salesString = format["[%1] %2",_stored,_displayName];
					_index = lbAdd[2000, _salesString];
					if(_name in BIS_EVO_unlockables and !(_name in BIS_EVO_unlocked)) then {
					_index = lbSetColor [2000, _i, [1, 0, 0, 0.5]];
					};
					_i = _i + 1;
				};
			};
			case 5:
			{
				_name = "";
					while {_i < count buySpecialList} do 
					{
						_pic = "";
						_name = ((buySpecialList select _i)select 0);
						_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
						_stored = ((buySpecialList select _i) select 1);
						_displayName = getText(configFile >> "CfgVehicles" >> _name >> "displayName");
						_salesString = format["[%1] %2",_stored,_displayName];
						_index = lbAdd[2000, _salesString];
					if(_name in BIS_EVO_unlockables and !(_name in BIS_EVO_unlocked)) then {
					_index = lbSetColor [2000, _i, [1, 0, 0, 0.5]];
					};
						_i = _i + 1;
					};
				
			};
			case 6:
			{
			_vec = vehicle player;
			if(_vec != MHQ) then 
			{
			_nearestMarker = [BIS_EVO_conqueredTowns, position player] call BIS_fnc_nearestPosition;
			_plyDist = (getPos player) distance getMarkerPos _nearestMarker;

				if((inrepairzone or _plyDist < 200)) then
					{
						[_ap] execVM "data\scripts\storeVeh.sqf";
						ctrlShow [674,false]; //Storeveh page
						closeDialog 1;
					}
					else
					{
						[_vec,300] execVM "data\scripts\addToPurList.sqf";
						ctrlShow [674,false]; //Storeveh page
						closeDialog 1;
						hint "Sending vehicle to base, cooldown 5min";
					};
					Mpage =[false,false,false,false,false,true,1,false,false];
				}
				else{hint "Cannot store this vehicle";
				Mpage =[false,false,false,false,false,true,1,false,false];
				closeDialog 1;};
			};
			case 8:
			{
			_vec = vehicle player;
			if(_vec == player) then
				{
					[_ap] execVM "data\scripts\unflip.sqf";
					closeDialog 1;
				};
				Mpage =[false,false,false,false,false,true,1,false,false];
			};
		};		
	};
	_index = lbSetCurSel [2000, 0];

		if((_buySubPage == 7) && (_recpage)) then 
		{
			loadrec=[] execVM "data\scripts\loadoutrecorder.sqf";
			hint "Weapons Saved!";
			Mpage =[true,false,false,false,false,false,0,false,false];
			closeDialog 1;
		};

	if (_constructPage) then 
	{
		_i = 0;
		lbClear 2000;
		while {_i < count constructList} do 
		{
			_name = (constructList select _i);
			_uname = getText (configFile >> "CfgVehicles" >> _name >> "DisplayName");
			_pic = "data\wrench.paa";
			_index = lbAdd [2000, _uname];
			_index = lbSetPicture[2000, _i, _pic];
			_i = _i + 1;
		};
	};
	
};	
//Endlsts

BIS_EVO_ActButton = 
{
	   _index = lbCurSel 2000;
	   _index2 = lbCurSel 1995;
	  _recpage = Mpage select 0;
	  _suppage = Mpage select 1;
	  _asspage = Mpage select 2;
	  _grppage = Mpage select 3;
	  _optpage = Mpage select 4;
	_buypage = Mpage select 5;
	_buySubPage = Mpage select 6;
	_perkPage = Mpage select 7;
	_vecPage = Mpage select 8;
	_vecSubPage = Mpage select 9;
		_constructPage = Mpage select 10;

	if (_recpage) then 
	{
		if (helpersparam == 0) exitwith {ctrlSetText [2011,"AI Recruitment disabled"]};

		_item = ((RecList select _index) select 1);

/*
		if(score player < BIS_EVO_rank1 and helpersparam != 2 ) then 
		{
			ctrlDesc ctrlSetText localize "STR_M04t79"; // Higher rank required
		}
		else
		{
*/
			_grp = group player;
			_count = (count units _grp);
			_ainum = 0;
			_ap = player;
			_i = 0;
			_infCost = 3;

			if(player distance backPacks > 4) then 
			{
				_item = ((RecList select _index) select 1);
				while {_i < _count} do 
				{
					_ap = (units _grp select _i);
					if (not (isPlayer _ap)) then 
					{
						_ainum = _ainum +1;
					};
					_i = _i + 1;
				};

				if (playerRank < 1 and helpersparam != 2 and _ainum >= 1) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank < 2 and helpersparam != 2 and _ainum >= 2) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank < 3 and helpersparam != 2 and _ainum >= 3) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank < 4 and helpersparam != 2 and _ainum >= 4) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank < 5 and helpersparam != 2 and _ainum >= 5) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank < 6 and helpersparam != 2 and _ainum >= 6) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (playerRank >= 6 and helpersparam != 2 and _ainum >= 7) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};
				if (helpersparam == 2 and _ainum >= 8) exitwith {ctrlSetText [2011,localize "STR_M04t99"]};

				switch(recruitPlaces) do 
				{
					//Free everywhere
					case 0:
					{
						if(_item != "ME") then {_rec = [_item] execVM "data\scripts\recruit.sqf";}
						else {_rec = [_item] execVM "data\scripts\recruitMe.sqf";};
					};
					//Free at friendly locations
					case 1:
					{
						_nearestPoint = [BIS_EVO_conqueredTowns, position player] call BIS_fnc_nearestPosition;
						_objDist = player distance getMarkerPos _nearestPoint;
						if(inrepairzone or _objDist <= 100) then 
						{					
							if(_item != "ME") then {_rec = [_item] execVM "data\scripts\recruit.sqf";}
							else {_rec = [_item] execVM "data\scripts\recruitMe.sqf";};
						}
						else{
							hint "Cannot recruit outside of base or town!";
							closeDialog 1;
						};
					};
					//Free only at bases
					case 2:
					{
						_nearestPoint = [BIS_EVO_conqueredTowns, position player] call BIS_fnc_nearestPosition;
						_objDist = player distance getMarkerPos _nearestPoint;
						if(inrepairzone) then 
						{					
							if(_item != "ME") then {_rec = [_item] execVM "data\scripts\recruit.sqf";}
							else {_rec = [_item] execVM "data\scripts\recruitMe.sqf";};
						};
						if(_objDist < 100 and !inrepairzone) then 
						{
							if(money>=_infCost) then
							{
							if(_item != "ME") then {_rec = [_item] execVM "data\scripts\recruit.sqf";}
							else {_rec = [_item] execVM "data\scripts\recruitMe.sqf";};
								["jed_addMoney", [player, -4]] call CBA_fnc_whereLocalEvent;
							}
							else{hint "Not enough money!";};
						};
						if(_objDist >= 100 and !inrepairzone) then {
							hint "Cannot recruit outside of base or town!";
							closeDialog 1;
						};
					};
					case 3:
					{
						_nearestPoint = [BIS_EVO_conqueredTowns, position player] call BIS_fnc_nearestPosition;
						_objDist = player distance getMarkerPos _nearestPoint;

						if(inrepairzone or _objDist <= 100) then 
						{
							if(money>=_infCost) then
							{
							if(_item != "ME") then {_rec = [_item] execVM "data\scripts\recruit.sqf";}
							else {_rec = [_item] execVM "data\scripts\recruitMe.sqf";};
								["jed_addMoney", [player, -4]] call CBA_fnc_whereLocalEvent;
							}
							else{hint "Not enough money!";};
						}
						else {
							hint "Cannot recruit outside of base or town!";
							closeDialog 1;
						};
					};
				};
			}
			else
			{
				_item = (BIS_EVO_PlayerModels select _index);
				_rec = [_item] execVM "data\scripts\charactermenu.sqf";
			};
//		};
	};   

	if (_suppage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

	      mrole = (SupList select _index) select 0;
	      msize = (SupList select _index) select 2;
	      mcost = (SupList select _index) select 3;
	      mtime = (SupList select _index) select 4;
	      mord = (SupList select _index) select 6;

if (player hasWeapon "ItemRadio") then
		{

		  if (not BIS_EVO_fmission) then
		  {
			 if (bplace) then 
			 {

				if (((money)) >= mcost) then 
				{	
					if(airportin distance (getmarkerpos "btarg") < 400) then 
					{

					ctrlSetText [2011,localize "STR_M04t88"];//you cannot call support in the base
					}
					else
					{
						_rec = [mrole,msize,mtime,mord] execVM "data\scripts\csupport.sqf";
						ctrlSetText [2003,str (money)];
						BIS_EVO_punitC = player;
						BIS_EVO_prewC  = -mcost;
//						BIS_EVO_prew  = -1;
						publicVariable "BIS_EVO_prewC";
						publicVariable "BIS_EVO_punitC";
						//adding
						player addscore -mcost;
						ctrlSetText [2003,Format ["%1: %2",localize "STR_M04t134",(money)]];//Score
					};
				}
				else
				{
					ctrlSetText [2011,format[localize "STR_M04t89",mcost, ((money)-mrank)]];//You do not have the required spare points \nRequired: %1 \nCurrent: %2.
				};
			 }
			 else {ctrlSetText [2011,localize "STR_M04t90"]};//Click a point on the map first.
		}else{ctrlSetText [2011,localize "STR_M04t91"]};//Only one payload can be delivered at a time.
//EGG editing
	}else{ctrlSetText [2011,"You must have a radio to call support"]};
	};

	if (_asspage) then 
	{	
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
	      _boun = (AssList select _index) select 3;
	      _type = (AssList select _index) select 4;	
	      if (BIS_EVO_Onmission) then {BIS_EVO_Onmission=false}else{_launch = [player,_type,_boun] execVM "data\scripts\selectmis.sqf";BIS_EVO_Onmission = true};	
	      [] execVM "data\scripts\fcnListboxClk.sqf";
	};

//Join group button
	if(_grppage) then
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		if (BIS_EVO_Onmission) then 
		{
			BIS_EVO_Onmission=false;
			with uiNamespace do
			{
				ctrlBut1 ctrlSetText localize "STR_M04xt13";//Join		

			};
			//ctrlSetText [6056,localize "STR_M04xt13"];//Join
		}
		else
		{
			_unit = (GrpList select _index);
			if(isNull _unit) then {_grp = creategroup (EGG_EVO_PLAYERFACTION)}else{_grp = group unit};
			[player] join group _unit;
		};	
	};
	//wHEN CLICK BUY
	if (_buypage) then 
	{
		_ap = player;
		_buySubPage = Mpage select 6;
		_item = "";
		mcost = 0;
		unlock = true;
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
		ctrlShow [2012,true];

		switch(_buySubPage) do
					{
						case 1:
						{
							mcost = round (((buyCarList select _index) select 1)*EX_EVO_vehPriceMultiplier);
							_item = ((buyCarList select _index) select 0);
							stored = ((buyCarList select _index) select 2);

						};
						case 2:
						{
							mcost = round(((buyTankList select _index) select 1)*EX_EVO_vehPriceMultiplier);
							_item = ((buyTankList select _index) select 0);
							stored = ((buyTankList select _index) select 2);
						};
						case 3:
						{
							mcost = round(((buyAirList select _index) select 1)*EX_EVO_vehPriceMultiplier);
							_item = ((buyAirList select _index) select 0);
							stored = ((buyAirList select _index) select 2);
						};
						case 4:
						{
							mcost = round(((buyStatList select _index) select 1)*EX_EVO_vehPriceMultiplier);
							_item = ((buyStatList select _index) select 0);
							stored = ((buyStatList select _index) select 2);
						};
						case 5:
						{
							_item = (buySpecialList select _index) select 0;
							stored = ((buySpecialList select _index) select 1);
						};
					};

			if(stored > 0) then
			{	
				if  (inrepairzone and VehiclePlaced == 1 and vehicle _ap == player) then
				{	
					VehiclePlaced = 0;
					switch(_buySubPage) do
							{
								case 1:
								{
									buyCarList set [_index,[(buyCarList select _index) select 0,(buyCarList select _index) select 1,((buyCarList select _index) select 2)-1]];
									publicVariable "buyCarList";
								};
								case 2:
								{
									buyTankList set [_index,[(buyTankList select _index) select 0,(buyTankList select _index) select 1,((buyTankList select _index) select 2)-1]];
									publicVariable "buyTankList";	
								};
								case 3:
								{
									buyAirList set [_index,[(buyAirList select _index) select 0,(buyAirList select _index) select 1,((buyAirList select _index) select 2)-1]];
									publicVariable "buyAirList";	
								};
								case 4:
								{
									buyStatList set [_index,[(buyStatList select _index) select 0,(buyStatList select _index) select 1,((buyStatList select _index) select 2)-1]];
									publicVariable "buyStatList";	
								};
								case 5:
								{
									buySpecialList set [_index,[(buySpecialList select _index) select 0,((buySpecialList select _index) select 1)-1]];
									publicVariable "buySpecialList";	
								};
							};

							
								_place = [_ap, _item] execVM "actions\static\makeVehicle.sqf";
								closeDialog 1;
				};
			};


			//Vehicle is locked
			if ((stored == 0 and !(_item in BIS_EVO_unlocks)or editor == 1)) then 
			{
				if ((((money)) >= round mcost*EX_EVO_vehPriceMultiplier) or (editor == 1)) then 
					{
								if(inrepairzone and VehiclePlaced == 1) then 
									{
									_place = [_ap, _item] execVM "actions\static\makeVehicle.sqf";
									}
									else{
											switch(_buySubPage) do
											{
												case 1:
												{
													buyCarList set [_index,[(buyCarList select _index) select 0,(buyCarList select _index) select 1,((buyCarList select _index) select 2)+1]];
													publicVariable "buyCarList";
												};
												case 2:
												{
													buyTankList set [_index,[(buyTankList select _index) select 0,(buyTankList select _index) select 1,((buyTankList select _index) select 2)+1]];
													publicVariable "buyTankList";	
												};
												case 3:
												{
													buyAirList set [_index,[(buyAirList select _index) select 0,(buyAirList select _index) select 1,((buyAirList select _index) select 2)+1]];
													publicVariable "buyAirList";	
												};
												case 4:
												{
													buyStatList set [_index,[(buyStatList select _index) select 0,(buyStatList select _index) select 1,((buyStatList select _index) select 2)+1]];
													publicVariable "buyStatList";
												};
											};
										};
	
								// _pic = "img\support\lock_on_ca.paa";
								// lbSetPicture [2000, _index, _pic];
								ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",0]];//Cost
								ctrlSetText [2011,format["You bought: %1",getText(configFile >> "CfgVehicles" >> _item >> "displayName")]];
								["jed_addMoney", [_ap, ( round -(mcost*EX_EVO_vehPriceMultiplier))]] call CBA_fnc_whereLocalEvent;
								//player addscore round -(mcost*EX_EVO_vehPriceMultiplier);
								ctrlSetText [2003,Format ["%1: %2",localize "STR_M04t134",(money)]];//Score
								[] call BIS_EVO_ListUpdate;
								closeDialog 1;
					}
					else
					{
						ctrlSetText [2011,format[localize "STR_M04t89",round (mcost*EX_EVO_vehPriceMultiplier), ((score _ap)-mrank)]];//You do not have the required spare points \nRequired: %1 \nCurrent: %2.
					};
			};
	}; 
	if (_perkPage) then 
	{	
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

	if(perkPoints > 0) then 
	{
		switch(_index) do
		{
			case 0: {if(perkOffLVL<4) then {perkOffLVL = perkOffLVL+1;}};
			case 1: {if(perkEngLVL<4) then {perkEngLVL = perkEngLVL+1;}};
			case 2: {if(perkSniperLVL<4) then {perkSniperLVL = perkSniperLVL+1;}};
			case 3: {if(perkPilotLVL<4) then {perkPilotLVL = perkPilotLVL+1;}};
		};
		perkPoints = perkPoints -1;
		[_index] call setPerkLevel;
		[] call BIS_EVO_ListUpdate;
		};
	}; 

	if (_vecPage) then 
	{
		switch (_vecSubPage) do 
		{
			case 2:
			{
				if (vehicle player isKindOf  "Air") then 
				{
					_class = EB_turrets select _index;
					_magazineArray = getArray (configFile >> "CfgWeapons" >> _class >> "magazines");
					_armament = _magazinearray select 0;
					[_class] call armTurret;
				};
			};
			case 3:
			{
				if (vehicle player isKindOf  "Air") then 
				{
					_class = EGG_missiles select _index;
					_magazineArray = getArray (configFile >> "CfgWeapons" >> _class >> "magazines");
					_armament = _magazinearray select 0;
					[_armament, _class, _index2] call armWeapon;
				};
			};
			case 4:
			{
				_upgColumn = vehUpgList select upgIndex;
				_curVehIndex =_upgColumn find (typeof vehicle player);
				_priceIndex = (_index*2)+1;

				_price = 0;

				if(_priceIndex-1 > _curVehIndex) then { //IF upgrade vehicle is worse, dont charge
				_price = _upgColumn select _priceIndex;
				};

				if(money>=_price && inrepairzone && speed vehicle player < 4) then
				{
					[_upgColumn select _priceIndex-1] execVM "data\scripts\vehUpg.sqf";
					["jed_addMoney", [player, -_price]] call CBA_fnc_whereLocalEvent;
					hint "Upgraded!";
					closeDialog 1;
					Mpage =[true,false,false,false,false,false,0,false,false];
				}
				else {hint "Not possible right now!"};
			};
			case 1:
			{
				if (vehicle player isKindOf  "Air") then 
				{
					[_index] execVM "actions\EB_newReArm.sqf";
				};
			};
		};
	};

if (_constructPage and Foxholeplaced == 1) then 
	{
		_item = constructList select _index;
		[player,_item] execVM "actions\static\makestatic.sqf";
		closeDialog 1;
	}; 

};

BIS_EVO_ListSelect =
{
	_x = lbCurSel 2000;
	_lb2i = lbCurSel 1995;
	//STR_M04t135,"Distance";
	ctrlSetText [2003,str (money)];
	ctrlSetText [2003,Format ["%1: %2", "Money",(money)]];//Score
	ctrlSetText [2203,""];
	ctrlSetText [2204,""];
	ctrlSetText [2205,""];
	ctrlSetText [2206,""]; 
//
	ctrlSetText [2207,""];
	ctrlSetText [2208,""];

	 _recpage = Mpage select 0;
	 _suppage = Mpage select 1;
	 _asspage = Mpage select 2;
	 _grppage = Mpage select 3;
	 _optpage = Mpage select 4;
	 _buypage = Mpage select 5;
	 _buySubPage = Mpage select 6;
	_perkPage = Mpage select 7;
	_vecPage = Mpage select 8;		
	_vecSubPage = Mpage select 9;

	 _pos = [];

	if (_recpage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
		if (helpersparam == 0) exitwith {ctrlSetText [2011,"AI Recruitment disabled"]};

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


	if (_suppage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		_y = ((SupList select _x) select 0);
		msize = (SupList select _x) select 2;
		_z = ((SupList select _x) select 1);
		_a = ((SupList select _x) select 5);
		bmark setMarkerSizeLocal [msize, msize];
		ctrlSetText [2202,localize "STR_M04t101"];
		ctrlSetText [2201,localize "STR_M04t102"];
		ctrlShow [6056,true];
		//ctrlSetText [6056,localize "STR_M04t103"]; //request
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

	if (_asspage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		_y = ((AssList select _x) select 0);
		_z = ((AssList select _x) select 1);
		_a = ((AssList select _x) select 2);
		_kind = ((AssList select _x) select 1);
		ctrlSetText [2202, localize "STR_M04t120"];
		ctrlSetText [2201, localize "STR_M04t121"];
		ctrlShow [6056,true];
		//if (BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t123"]}; //abandon
		//if (not BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t122"]}; //request
		if (BIS_EVO_Onmission) then 
		{	
			with uiNamespace do 
			{		
				ctrlBut1 ctrlSetText localize "STR_M04t123"; //abandon
			};
		};
		if (not BIS_EVO_Onmission) then 
		{		
			with uinamespace do 
			{
				 ctrlBut1 ctrlSetText localize "STR_M04t122"; //request
			};
		};
		ctrlSetText [2001,""];
		ctrlSetText [2002,Format ["%1: %2",localize "STR_M04t133",((AssList select _x) select 3)]];//Cost
		ctrlSetText [2010,_y];
		ctrlSetText [2011,_z];
		ctrlSetText [2005,_a];
		ctrlSetText [2004,""];
	};

	if (_grppage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];

		_unit = (GrpList select _x);
		_y = "";
		_z = "";
		if(isnull _unit) then 
		{
			_y = "New squad";
			_z = "Form a new squad.";
		}
		else
		{
			_y = format["%1",group _unit];
			_z = format["%1 : %2  x (%3)",group _unit,name _unit,count units _unit];
		};
		//_a = "\ca\ui\data\lock_on_ca.paa";
		_a = "\ca\ui\data\lock_off_ca.paa";
		_kind = ((AssList select _x) select 1);
		ctrlSetText [2202,localize "STR_M04xt11"]; //Transfer
		ctrlSetText [2201,localize "STR_M04xt12"];//Squads
		ctrlShow [6056,true];
		//if (BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04t123"]};//Abandon
		//if (not BIS_EVO_Onmission) then {ctrlSetText [6056,localize "STR_M04xt13"]};//Join
		if (BIS_EVO_Onmission) then
		{
			with uiNamespace do
			{
				ctrlBut1 ctrlSetText localize "STR_M04t123";//Abandon
			};
		};
		if (not BIS_EVO_Onmission) then 
		{
			with uiNamespace do
			{
				ctrlBut1 ctrlSetText localize "STR_M04xt13";//Join
			};
		};
	
	ctrlSetText [2001,""];
	ctrlSetText [2002,""];
	ctrlSetText [2010,_y];
	ctrlSetText [2011,_z];
	ctrlSetText [2005,""];
	ctrlSetText [2004,_a];
	};

	if (_optpage) then 
	{
//		_y = ((TerList select _x) select 0);
//		_z = ((TerList select _x) select 1);
		ctrlSetText [2202,localize "STR_M04t124"];
		ctrlSetText [2201,localize "STR_M04t125"];
		ctrlShow [6056,false];
		ctrlShow [6057,true];
		ctrlShow [6058,true];
//
		ctrlShow [6059,true];
		ctrlShow [2203,true];
		ctrlShow [2204,true];
		ctrlShow [2205,true];
		ctrlShow [2206,true];
		ctrlShow [2207,true];
		ctrlShow [2208,true];

		ctrlShow [661,false];
		ctrlShow [663,true];
		ctrlShow [664,false];
		ctrlShow [665,false];
		ctrlShow [666,false];
		ctrlShow [667,false];
		ctrlShow [668,false];
		ctrlShow [656,false];
		ctrlShow [657,false];
		ctrlShow [658,false];
		ctrlShow [659,false];
		ctrlShow [675,false];
		ctrlShow [677,true];
		ctrlShow [895,false];

	(uiNamespace getVariable "ctrlListBox") ctrlSetPosition [0.0506555,0.22,0.31, 0.05];
		ctrlSetText [2203,localize "STR_M04t126"];
		ctrlSetText [2204,localize "STR_M04t127"];
//
//		ctrlTTitle ctrlSetText "Terrain";
		ctrlSetText [2207,""];

		ctrlSetText [2003,""];
		ctrlSetText [2001,""];
		ctrlSetText [2002,""];
		ctrlSetText [2010,localize "STR_M04t124"];
		ctrlSetText [2011,localize "STR_M04t128"];
		ctrlSetText [2005,""];
		ctrlSetText [2004,""];
//		setterraingrid _z;

		if((_buySubPage == 9) && (_optpage)) then {
		if(hitMarker) then {hitmarker = false; hint "Hitmarker disabled!";}else{hitMarker = true; hint "Hitmarker enabled!";};
		Mpage =[false,false,false,false,true,false,0,false,false];
		};
	};
		if (_buypage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];
	
		with uiNamespace do 
		{
			ctrlBut1 ctrlSetText "Select";
		};

			switch(_buySubPage) do
						{
							case 1:
							{
								ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",round (((buyCarList select _x) select 1)*EX_EVO_vehPriceMultiplier)]];//Cost
								_upgCount = [(buyCarList select _x) select 0] call fnc_countUpgrades;
								_name = [(buyCarList select _x) select 0] call fnc_getCfgName;
								_text = format["Price: %2\nVariants available: %1",_upgCount,round (((buyCarList select _x) select 1)*EX_EVO_vehPriceMultiplier)];
								ctrlSetText [2010,_name];
								ctrlSetText [2011,_text];
								_picture = getText (configFile >> "cfgVehicles" >> (buyCarList select _x) select 0 >> "picture");	// get picture from config
								ctrlSetText [2005,_picture];
							};
							case 2:
							{
								ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",round (((buyTankList select _x) select 1)*EX_EVO_vehPriceMultiplier)]];//Cost
								_upgCount = [(buyTankList select _x) select 0] call fnc_countUpgrades;
								_name = [(buyTankList select _x) select 0] call fnc_getCfgName;
								_text = format["Price: %2\nVariants available: %1",_upgCount,round (((buyTankList select _x) select 1)*EX_EVO_vehPriceMultiplier)];
								ctrlSetText [2010,_name];
								ctrlSetText [2011,_text];
								_picture = getText (configFile >> "cfgVehicles" >> (buyTankList select _x) select 0 >> "picture");	// get picture from config
								ctrlSetText [2005,_picture];
							};
							case 3:
							{
								ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",round (((buyAirList select _x) select 1)*EX_EVO_vehPriceMultiplier)]];//Cost
								_upgCount = [(buyAirList select _x) select 0] call fnc_countUpgrades;
								_name = [(buyAirList select _x) select 0] call fnc_getCfgName;
								_text = format["Price: %2\nVariants available: %1",_upgCount,round (((buyAirList select _x) select 1)*EX_EVO_vehPriceMultiplier)];
								ctrlSetText [2010,_name];
								ctrlSetText [2011,_text];
								_picture = getText (configFile >> "cfgVehicles" >> (buyAirList select _x) select 0 >> "picture");	// get picture from config
								ctrlSetText [2005,_picture];
							};
							case 4:
							{
								ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",round (((buyStatList select _x) select 1)*EX_EVO_vehPriceMultiplier)]];//Cost
								_upgCount = [(buyStatList select _x) select 0] call fnc_countUpgrades;
								_name = [(buyStatList select _x) select 0] call fnc_getCfgName;
								_text = format["Price: %2\nVariants available: %1",_upgCount,round (((buyStatList select _x) select 1)*EX_EVO_vehPriceMultiplier)];
								ctrlSetText [2010,_name];
								ctrlSetText [2011,_text];
								_picture = getText (configFile >> "cfgVehicles" >> (buyStatList select _x) select 0 >> "picture");	// get picture from config
								ctrlSetText [2005,_picture];
							};
						};
	};
if (_perkPage) then 
	{
//
		ctrlShow [6057,false];
		ctrlShow [6058,false];
		ctrlShow [6059,false];
		ctrlShow [2203,false];
		ctrlShow [2204,false];
		ctrlShow [2205,false];
		ctrlShow [2206,false];
		ctrlShow [2207,false];
		ctrlShow [2208,false];


			_i = 0;
		lbClear 2000;
			//Officer
			_name = "Officer";
			_maxLevel = 4;
			_text = format["%1 %2/%3",_name,perkOffLVL,_maxLevel];
			_index = lbAdd [2000, _text];
			ctrlSetText [2010,_name];

			//Engineer Perk
			_maxLevel = 4;
			_name = "Engineer";
			_text = format["%1 %2/%3",_name,perkEngLVL,_maxLevel];
			ctrlSetText [2010,_name];
			_index = lbAdd [2000, _text];

			//Recon Perk
			_maxLevel = 4;
			_name = "Recon";
			_text = format["%1 %2/%3",_name,perkSniperLVL,_maxLevel];
			ctrlSetText [2010,_name];
			_index = lbAdd [2000, _text];

			//Pilot Perk
			_name = "Pilot";
			_maxLevel = 4;
			_text = format["%1 %2/%3",_name,perkPilotLVL,_maxLevel];
			ctrlSetText [2010,_name];
			_index = lbAdd [2000, _text];
			ctrlSetText [2001,format["Perkpoints: %1",perkPoints]];
			switch(_x) do 
			{
				//Officer Perk
				case 0: 
				{			
					_name = "Officer";
					_description = "Can create static RECON HQ
					improve vehicle
					improve vehicle with supply
					improve vehicle with supply
					";
					_maxLevel = 4;
					_text = format["%1 %2/%3",_name,perkOffLVL,_maxLevel];
					ctrlSetText [2010,_name];
					ctrlSetText [2011,_description];
				};
				case 1: 
				{
					//Engineer Perk
					_description =  "paska engineer";
					_maxLevel = 4;
					_name = "Engineer";
					_text = format["%1 %2/%3",_name,perkEngLVL,_maxLevel];
					ctrlSetText [2010,_name];
					ctrlSetText [2011,_description];
				};
				case 2: 
				{
				//Recon Perk
					_description =  "paska sniper";
					_maxLevel = 4;
					_name = "Recon";
					_text = format["%1 %2/%3",_name,perkSniperLVL,_maxLevel];
					ctrlSetText [2010,_name];
					ctrlSetText [2011,_description];
				};
				case 3: 
				{
					//Pilot Perk
					_description =  "paska pilot";
					_name = "Pilot";
					_maxLevel = 4;
					_text = format["%1 %2/%3",_name,perkPilotLVL,_maxLevel];

					ctrlSetText [2010,_name];
					ctrlSetText [2011,_description];
				};
			};

		ctrlSetText [2202, "Perks"];
		ctrlSetText [2201, "Pick"];
		ctrlShow [6056,true];
		//ctrlSetText [6056,localize "STR_M04t103"]; //request
		// with uiNamespace do 
		// {
		// 	ctrlBut1 ctrlSetText localize "STR_M04t103";
		// };
	//	ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",((perkList select _x) select 3)]];//Cost
	};

	if(_vecPage) then
	{
		switch (_vecSubPage) do
		{
			case 4:
			{
				//

				_upgColumn = vehUpgList select upgIndex;
				_curVehIndex =_upgColumn find (typeof vehicle player);
				_priceIndex = (_x*2)+1;
				_price = 0;
				if(_priceIndex-1 > _curVehIndex) then { //IF upgrade vehicle is worse, dont charge
				_price = _upgColumn select _priceIndex;
				};
				ctrlSetText [2001,Format ["%1: %2",localize "STR_M04t132",_price]];//Cost
				_upgCount = [typeof vehicle player] call fnc_countUpgrades;
				ctrlSetText [6056, "Upgrade"];
				_name = "Upgrade";
				_text = format["Upgrades available: %1",_upgCount];
				ctrlSetText [2010,_name];
				ctrlSetText [2011,_text];
			};
		};
	};
};

[] call BIS_EVO_ListUpdate;

usedList = [];
GetoutClick = false;
ResetClick = false;
SupportClick = false;

while {dialog} do 
{
      if (GetoutClick) then 
	{
		closeDialog 1;
      };
      if(Mpage select 4) then 
	{
		_vpos = (sliderPosition 6057);
		_avpos = (sliderPosition 6058);
		setviewdistance _vpos;
		BIS_EVO_vdist = _vpos;
		BIS_EVO_avdist = _avpos;
		ctrlSetText [2205,format["Ground: %1",(round _vpos)]];
		ctrlSetText [2206,format["Air: %1",(round _avpos)]];

//TerList = [["No Grass",50,0] etc 	_z = ((TerList select _x) select 1);

		_gridval = (sliderPosition 6059);
		_gridrnd = (round _gridval) -1;
		_gridpos = ((TerList select _gridrnd) select 1);
		BIS_EVO_grid = _gridrnd;
		setterraingrid _gridpos;
	ctrlSetText [2208,format["Terrain: %1",((_gridrnd)+1)]];
		//
//		_z = ((TerList select _x) select 1);
//		setterraingrid _z;
//		BIS_EVO_grid = _z;
	};
	sleep 0.01;
};
(FindDisplay 46) DisplaySetEventHandler ["keydown","if ((_this select 1) In actionKeys ""TeamSwitch"" and (driver (vehicle player)) == player) then {a = createDialog 'evoUI'}"];
deleteMarkerLocal "btarg";
[] call BIS_EVO_ResetClick;

if (editor == 1) then
{

	onMapSingleClick "if (_alt) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
	player allowDamage false;
};
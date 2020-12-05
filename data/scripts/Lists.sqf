SupList = [];
RecList = [];
AssList = [];
GrpList = [];
_infantry = [["USMC_Soldier_LAT","USMC_Soldier"],["USMC_SoldierS","USMC_Soldier_MG","USMC_Soldier_AT"],["USMC_Soldier_GL","USMC_SoldierM_Marksman"],["USMC_Soldier_AR","USMC_Soldier_AA","USMC_SoldierS_Sniper"],[],[],["USMC_Soldier_Medic"]];
_crew = [[],[],["USMC_Soldier_Pilot"],["USMC_Soldier_Crew"],[],[],[]];
_forcerecon = [[],[],[],[],["FR_Assault_R","FR_AR","FR_GL"],["FR_TL","FR_Marksman","FR_R"],["FR_Corpsman","FR_Commander"]];
_command = [[],[],[],["USMC_Soldier_TL"],[],["USMC_Soldier_SL"],["USMC_Soldier_Officer"]];
_rank = 0;
_newstring = "";
	if (score player >= BIS_EVO_rank1-pointsSpent) then {_rank = 6};
	 if (score player >= BIS_EVO_rank2-pointsSpent && _rank == 1) then {_rank = 2};
	 if (score player >= BIS_EVO_rank3-pointsSpent && _rank == 2) then {_rank = 3};
	 if (score player >= BIS_EVO_rank4-pointsSpent && _rank == 3) then {_rank = 4};
	 if (score player >= BIS_EVO_rank5-pointsSpent && _rank == 4) then {_rank = 5};
	 if (score player >= BIS_EVO_rank6-pointsSpent && _rank == 5) then {_rank = 6};

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
				//_guns = [_unit] call _GetGuns;
				//_picture = "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca";
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

//-----------------------------------------------------------------


//RECRUIT SETUP
_recpage = Mpage select 0;
_suppage = Mpage select 1;
_asspage = Mpage select 2;
_grppage = Mpage select 3;
_optpage = Mpage select 4;


ctrlShow [6057,false];
ctrlShow [6058,false];
TerList = [[localize "STR_M04t129",50],[localize "STR_M04t130",25],[localize "STR_M04t131",12.5]];
_sco = score player;

//support
SupList = SupList +[[localize "str_dn_ammocrate","Cost: 5 All the ammo you need",10,5,10,"data\sup01.paa",1]];
SupList = SupList +[[localize "strwfsmokegreen","Cost: 0 Mark a location with white/green smoke",10,0,3,"data\sup01.paa",9]];
SupList = SupList +[[localize "str_dn_bike","Emergency transport",20,0,10,"data\sup01.paa",19]];
SupList = SupList +[[localize "str_som_marker_boat","Cost: 0 Ideal for crossing water",20,0,10,"data\sup01.paa",10]];
SupList = SupList +[[localize "str_som_arty_barrage_mission_4","Cost: 3 Ideal for night defence",20,3,20,"data\sup01.paa",20]];
SupList = SupList +[[localize "str_artdlg_btnfirearea","Cost: 25 Ideal for suppressing a city",200,25,30,"data\sup01.paa",21]];
//place mines
SupList = SupList +[[localize "str_paradrop_obj12shorter","Cost: 5 Ideal for protecting a road",50,5,5,"data\sup01.paa",22]];


/////nuke test
//	SupList = SupList +[[localize "STR_M04t116",localize "STR_M04t117",200,0,30,"data\sup01.paa",7]];

//missions
AssList = [];
AssList = AssList +[[localize "STR_M04t6_1",localize "STR_M04t7_1","data\offensive.paa",10,3]];
AssList = AssList +[[localize "STR_M04t16_0",localize "STR_M04t17_1","data\sabotage.paa",10,1]];
AssList = AssList +[[localize "STR_M04t20",localize "STR_M04t21_0","data\sabotage.paa",10,4]];
AssList = AssList +[[localize "STR_M04t24",localize "STR_M04t25_0","data\defend.paa",10,6]];
AssList = AssList +[["Rendition","A few moments ago we received satellite intel that a key member of the enemy high command is visiting a remote station on the island. Your mission is to go to the location search for the officer and eliminate any resistance in the area.","data\sabotage.paa",20,10]];
AssList = AssList +[["Extermination","We have received reports from an undercover agent on the location of a gathering of the People's Temple cult. They have a fertiliser bomb and may plan to use it. Go to the location and exterminate any civilians you find there.","data\sabotage.paa",10,11]];
AssList = AssList +[["Ambush troop convoy","Crossroad reports satellite recon has identified a heavily defended enemy infantry column moving cross-country.  Neutralise it.","data\sabotage.paa",10,12]];
AssList = AssList +[[localize "str_lib_chal_assassination","Crossroad reports a senior enemy general is approaching Chernogorsk, hoping to escape Chernarus by boat.  Position your sniper team on the roof of the International Hotel andtake him out.","data\sabotage.paa",10,13]];
AssList = AssList +[["Liberate Agent","Crossroad reports a major blow to security.  One of the CDF's top agents has been captured.  Locate him, eliminate ALL hostiles, extract him to HMS GITS.","data\sabotage.paa",20,14]];

//recruit
RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier" >> "DisplayName"), "USMC_Soldier", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca", ["USMC_Soldier"] call _GetGuns]];

if(_sco >= BIS_EVO_rank1-pointsSpent) then 
{
	mrank = BIS_EVO_rank1;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_AT" >> "DisplayName"), "USMC_Soldier_AT", "\Ca\weapons\data\Ico\i_at_CA.paa", ["USMC_Soldier_AT"] call _GetGuns]];

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_Medic" >> "DisplayName"), "USMC_Soldier_Medic", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca",["USMC_Soldier"] call _GetGuns]];

//support
	SupList = SupList +[[localize "str_dn_30rnd_105mmsmoke_m119","Cost: 3 Ideal for masking your movement",20,3,5,"data\sup01.paa",11]];
//precision strike
		SupList = SupList +[[localize "STR_M04t106",localize "STR_M04t107",20,5,10,"data\sup01.paa",2]];
	SupList = SupList +[[localize "str_dn_motorcycle","Cost: 5 Emergency transport for two",20,5,10,"data\sup01.paa",8]];
};
if(_sco >= BIS_EVO_rank2-pointsSpent) then 
{
	mrank = BIS_EVO_rank2;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_MG" >> "DisplayName"), "USMC_Soldier_MG", "\Ca\weapons\data\Ico\i_mg_CA.paa",["USMC_Soldier_MG"] call _GetGuns]];

//support
	SupList = SupList +[[localize "str_dn_staticmgweapon","Cost: 5 Ideal for defending an area against enemy troops",20,5,10,"data\sup01.paa",12]];
//small arty
	SupList = SupList +[[localize "STR_M04t108",localize "STR_M04t109",50,10,20,"data\sup01.paa",3]];

//missions
AssList = [];
AssList = AssList +[[localize "STR_M04t6_1",localize "STR_M04t7_1","data\offensive.paa",10,3]];
AssList = AssList +[[localize "STR_M04t9_1",localize "STR_M04t10_1","data\offensive.paa",20,2]];
AssList = AssList +[[localize "STR_M04t16_0",localize "STR_M04t17_1","data\sabotage.paa",20,1]];
AssList = AssList +[[localize "STR_M04t20",localize "STR_M04t21_0","data\offensive.paa",20,4]];
AssList = AssList +[[localize "STR_M04t32",localize "STR_M04t33","data\defend.paa",20,5]];
AssList = AssList +[[localize "STR_M04t37_0",localize "STR_M04t38_0","data\defend.paa",30,7]];

AssList = AssList +[["Rendition","A few moments ago we received satellite intel that a key member of the enemy high command is visiting a remote station on the island. Your mission is to go to the location search for the officer and eliminate any resistance in the area.","data\sabotage.paa",30,10]];
AssList = AssList +[["Extermination","We have received reports from an undercover agent on the location of a Red Brigade security arm of the People's Temple cult. They have a chemical weapon and may plan to use it. Go to the location and exterminate any civilians you find there.","data\sabotage.paa",20,11]];
AssList = AssList +[["Ambush troop convoy","Crossroad reports satellite recon has identified a heavily defended enemy infantry column moving cross-country.  Neutralise it.","data\sabotage.paa",20,12]];
AssList = AssList +[[localize "str_lib_chal_assassination","Crossroad reports a senior enemy general is approaching Chernogorsk, hoping to escape Chernarus by boat.  Position your sniper team on the roof of the International Hotel andtake him out.","data\sabotage.paa",20,13]];
AssList = AssList +[["Liberate Agent","Crossroad reports a major blow to security.  One of the CDF's top agents has been captured.  Locate him, eliminate ALL hostiles, extract him to HMS GITS.","data\sabotage.paa",20,14]];

};
if(_sco >= BIS_EVO_rank3-pointsSpent) then 
{
	mrank = BIS_EVO_rank3;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_AA" >> "DisplayName"), "USMC_Soldier_AA", "\Ca\weapons\data\Ico\i_aa_CA.paa",["USMC_Soldier_AA"] call _GetGuns]];
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_SoldierS_Sniper" >> "DisplayName"), "USMC_SoldierS_Sniper", "\Ca\weapons\data\Ico\i_sniper_CA.paa",["USMC_SoldierS_Sniper"] call _GetGuns]];

//support
	SupList = SupList +[[localize "str_dn_staticgrenadelauncher","Cost: 15 Ideal for bombarding enemy troops",20,15,10,"data\sup01.paa",13]];
	SupList = SupList +[[localize "str_dn_fortification","Cost: 10 Ideal for securing an area and providing cover",20,10,10,"data\sup01.paa",14]];
//cluster bomb
		SupList = SupList +[[localize "STR_M04t110",localize "STR_M04t111",50,15,20,"data\sup01.paa",4]];
	
};
if(_sco >= BIS_EVO_rank4-pointsSpent) then 
{
	mrank = BIS_EVO_rank4;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_AR" >> "DisplayName"), "USMC_Soldier_AR", "\Ca\weapons\data\Ico\i_mg_CA.paa",["USMC_Soldier_AR"] call _GetGuns]];	

//support
	SupList = SupList +[[localize "str_dn_rhib2","Cost: 5 Ideal for assaulting positions from the sea",20,5,10,"data\sup01.paa",15]];
		SupList = SupList +[[localize "init.sqf7_3","Cost: 20 Ideal for Air Defences",20,20,10,"data\sup01.paa",16]];
//large arty
		SupList = SupList +[[localize "STR_M04t112",localize "STR_M04t113",100,25,30,"data\sup01.paa",5]];
};
if(_sco >= BIS_EVO_rank5-pointsSpent) then 
{
	mrank = BIS_EVO_rank5;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "FR_R" >> "DisplayName"), "FR_R", "\Ca\characters\data\portraits\comBarHead_usmc_officer_ca",["FR_R"] call _GetGuns]];

//support
	SupList = SupList +[[localize "str_dn_staticcannon","Cost: 25 Ideal for suppressing enemy armour and troops",20,25,10,"data\sup01.paa",17]];
//chem strike
		SupList = SupList +[[localize "STR_M04t114",localize "STR_M04t115",150,60,40,"data\sup01.paa",6]];

//missions
AssList = [];
AssList = AssList +[[localize "STR_M04t6_1",localize "STR_M04t7_1","data\offensive.paa",10,3]];
AssList = AssList +[[localize "STR_M04t9_1",localize "STR_M04t10_1","data\offensive.paa",20,2]];
AssList = AssList +[[localize "STR_M04t16_0",localize "STR_M04t17_1","data\sabotage.paa",20,1]];
AssList = AssList +[[localize "STR_M04t20",localize "STR_M04t21_0","data\offensive.paa",20,4]];
AssList = AssList +[[localize "STR_M04t32",localize "STR_M04t33","data\defend.paa",20,5]];
AssList = AssList +[[localize "STR_M04t12",localize "STR_M04t13_1","data\offensive.paa",20,9]];
AssList = AssList +[[localize "STR_M04t37_0",localize "STR_M04t38_0","data\defend.paa",30,7]];
AssList = AssList +[["Rendition","A few moments ago we received satellite intel that a key member of the enemy high command is visiting a remote station on the island. Your mission is to go to the location search for the officer and eliminate any resistance in the area.","data\sabotage.paa",40,10]];
AssList = AssList +[["Extermination","We have received reports from an undercover agent on the location of a major Peoples Temple Agricultural Project. They have a nuclear weapon and plan to use it. Go to the location and exterminate all civilians you find there.","data\sabotage.paa",40,11]];
AssList = AssList +[["Ambush troop convoy","Crossroad reports satellite recon has identified a heavily defended enemy infantry column moving cross-country.  Neutralise it.","data\sabotage.paa",30,12]];
AssList = AssList +[[localize "str_lib_chal_assassination","Crossroad reports a senior enemy general is approaching Chernogorsk, hoping to escape Chernarus by boat.  Position your sniper team on the roof of the International Hotel andtake him out.","data\sabotage.paa",30,13]];
AssList = AssList +[["Liberate Agent","Crossroad reports a major blow to security.  One of the CDF's top agents has been captured.  Locate him, eliminate ALL hostiles, extract him to HMS GITS.","data\sabotage.paa",20,14]];

};
if(_sco >= BIS_EVO_rank6-pointsSpent) then 
{
	mrank = BIS_EVO_rank6;

//recruit
	RecList = RecList +[[getText (configFile >> "CfgVehicles" >> "USMC_Soldier_HAT" >> "DisplayName"), "USMC_Soldier_HAT", "\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca",["USMC_Soldier_HAT"] call _GetGuns]];

//support
	SupList = SupList +[[localize "init.sqf_5_1","Cost: 5 Get me out of this hell-hole",20,5,5,"data\sup01.paa",18]];
//nuke
	SupList = SupList +[[localize "STR_M04t116",localize "STR_M04t117",200,150,60,"data\sup01.paa",7]];
};

[_infantry] call _assemblelist;
[_crew] call _assemblelist;
[_forcerecon] call _assemblelist;
[_command] call _assemblelist;

if (_recpage) then {
	_i = 0;
//blazes
	lbClear 2000;
	while {_i < count RecList} do {
		_name = (RecList select _i) select 0;
		_pic = (RecList select _i) select 2;
		_index = lbAdd[2000, _name];
		_index = lbSetPicture [2000, _i, _pic];
		_i = _i + 1;
	};
};

if (_suppage) then {
	_i = 0;
//blazes
	lbClear 2000;
	while {_i < count SupList} do {
		_name = (SupList select _i) select 0;
		_pic = (SupList select _i) select 5;
		_index = lbAdd[2000, _name];
		_index = lbSetPicture [2000, _i, _pic];
		_i = _i + 1;
	};
};

if (_asspage) then {

	_i = 0;
//blazes
	lbClear 2000;
	while {_i < count AssList} do {
		_name = (AssList select _i) select 0;
		_pic = (AssList select _i) select 2;
		_index = lbAdd[2000, _name];
		_index = lbSetPicture [2000, _i, _pic];
		_i = _i + 1;
	};
};


if (_grppage) then {

	_i = 0;
	//_Plist = list BIS_EVO_ALLWEST;
//blazes
	lbClear 2000;
	_Plist = [];
	{if(isPlayer _x) then {_Plist set [count _Plist, _x];}}forEach allUnits;
	sleep BIS_EVO_GlobalSleep;
	while {_i < count _Plist} do {
		_unit = (_Plist select _i);
		_name = name _unit;
		_rank = rank _unit;
		_pic = "";
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
//blazes
		_index = lbAdd[2000, _name];
		_index = lbSetPicture [2000, _i, _pic];
		_i = _i + 1;
	};
};


if (_optpage) then {

	_i = 0;
//blazes
	lbClear 2000;
	while {_i < count TerList} do {
		_name = (TerList select _i) select 0;
		_index = lbAdd [2000,_name];
		_i = _i + 1;
	};
};
_index =  lbSetCurSel[2000, 0];

_oldhour = date select 3;
_tscore = 0;
_rankmes = localize "STR_M04t82";
_currentprog = 0;
_EGG_stations = [];
EB_airload1=-1;
EB_fieldRepair=-1;

 countPerkLevel = 
 {
 	_perk = _this select 0;
 	_currentLevel = count(perkList select _perk);
 	_count = 0;
 	for [{_loop=0}, {_loop<(count(perkList select _perk))}, {_loop=_loop + 1}] do
 	 	{
 			 if (!(((perkList select _perk) select _loop) select 2 )) then 
 			 {
 				_currentLevel = _loop;
 				_loop =  (count(perkList select _perk)-1);
 		 	 };
// 			 systemChat str (((perkList select _perk) select _loop) select 2 );
 		 };
	_currentLevel;
 };

 setPerkLevel = 
 {
 	_perk = _this select 0;
 	_currentLevel = count(perkList select _perk);
 	_count = 0;
 	for [{_loop=0}, {_loop<(count(perkList select _perk))}, {_loop=_loop + 1}] do
 	 	{
 			 if (!(((perkList select _perk) select _loop) select 2 )) then 
 			 {
 				_currentLevel = _loop;
 				_loop =  (count(perkList select _perk)-1);
 		 	 };
 			// systemChat str (((perkList select _perk) select _loop) select 2 );
 		 };

 			 if (_perk == 0) then  
 			 {
 			 	switch (_currentLevel) do
 			 	{
 			 		case 1:
 			 		{
 			 			egg_evo_westAmb = ["TK_WarfareBUAVterminal_Base_EP1"];

						  if !(allowRhq) then {
							_actionId8 = player addAction ["Deploy Recon HQ", "actions\ambtent.sqf",0,1, false, true,"test2"];
						 	 allowRHQ = true;
						  };
 			 		};
 			 		case 2:
 			 		{
 			 			egg_evo_westAmb = ["EB_BRDM2_HQ_TK"];
 			 		};
 			 		case 3:
 			 		{
 			 			egg_evo_westAmb = ["BAFX_Ridgeback_D"];
 			 		};
 			 		case 4:
 			 		{
 			 			egg_evo_westAmb = ["EB_LAV25_D2"];
 			 		};
 			 	};
 			 };
 			/*
 			EB_PLbombs = ["EB_Mk81_Launcher","EB_Mk82_Launcher","EB_Mk83_Launcher","EB_Mk84_Launcher","EB_Mk77_Launcher","EB_Mk770_Launcher","EB_BombLauncher_fab250","EB_BombLauncher_fab500","EB_CBU78B_Launcher","EB_CBU87B_Launcher","RKTR27Launcher","EB_R77_Launcher","EB_CBU89B_Launcher","EB_CBU100_Launcher","EB_GBU12_Launcher","EB_GBU16_Launcher","EB_GBU10_Launcher","EB_BombLauncher_kab250","EB_BombLauncher_kab500"];
 			EB_PLmissiles = ["","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
 			GLT_bombs = ["GLT_GBU24_Launcher","GLT_GBU53_Launcher","GLT_GBU39_Launcher","GLT_KAB1500_Launcher"];
 			GLT_missiles = ["GLT_AIM120_Launcher","GLT_AIM54_Launcher","GLT_R550_Launcher","GLT_AIM132_Launcher","GLT_METEOR_Launcher","GLT_AGM84_Launcher","GLT_AGM154A1_Launcher","GLT_AM39_Launcher","GLT_R3_Launcher","GLT_R27_Launcher","GLT_R77_Launcher","GLT_CH15S_Launcher","GLT_CH29T_Launcher","GLT_CH59_Launcher","GLT_CH31P_Launcher"];
 			rksl_missiles= ["RKSL_iristLauncher","RKSL_BrimstoneLauncher","RKSL_ALARM_Launcher","RKSL_stormshadow_Launcher","RKSL_agm119mk3_Launcher"];
 			extra_missiles = ["GLT_AM39_Launcher"];
 			EB_turrets = ["M197","EB_GAU8"];
 			extra_bombs = ["GLT_AGM154A_Launcher","GLT_AGM154A1_Launcher"];
 			 EB_PLmissiles +extra_missiles;
 			*/
 			_tempMissiles = [];
 			if (_perk == 1) then  
 			{
 				switch (_currentLevel) do
 				{
 					case 1:
 					{

 						_tempMissiles = _tempMissiles +  ["EB_AIM9M_Launcher","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
 						EGG_maxMissiles = 9;
 					};
 					case 2:
 					{	
 						_tempMissiles = _tempMissiles +  ["EB_AIM9M_Launcher","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
 						EGG_maxMissiles = 12;
 					};
 					case 3:
 					{
 						_tempMissiles = _tempMissiles +  ["EB_AIM9M_Launcher","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
 						EGG_maxMissiles = 15;
 					};
 				};
 				EGG_missiles = _tempMissiles;
 			};

			if (_perk == 3) then  
 			 {
 			 	switch (_currentLevel) do
 			 	{
 			 		case 1:
 			 		{
						repairStrength = 50;

 			 		};
 			 		case 2:
 			 		{ 

 			 		};
 			 		case 3:
 			 		{

 			 		};
 			 		case 4:
 			 		{
 			 		};
 			 	};
 			 };
						if (_perk ==2) then  
 			 {
 			 	switch (_currentLevel) do
 			 	{
 			 		case 1:
 			 		{
						buySpecialList set [count buySpecialList,["pook_brdm2_Sa9_tak",0,28]];
						sleep BIS_EVO_GlobalSleep;
						buySpecialList set [count buySpecialList,["pracs_tk_sa13",0,32]];
						sleep BIS_EVO_GlobalSleep;
						systemChat "sa9 and sa 13unlock";
 			 		};
 			 		case 2:
 			 		{ 
						buySpecialList set [count buySpecialList,["pracs_sa6_tk",0,32]];
						sleep BIS_EVO_GlobalSleep;
						buySpecialList set [count buySpecialList,["pracs_tk_sa8",0,35]];
						sleep BIS_EVO_GlobalSleep;
						systemChat "sa6 and sa8 unlock"; //	["pracs_tk_sa8",35],
 			 		};
 			 		case 3:
 			 		{

 			 		};
 			 		case 4:
 			 		{
 			 		};
 			 	};
 			 };
 };

BIS_EVO_CWeath =
{
	"rainmarkt" setMarkerPosLocal getMarkerPos "rainmark";
	
	"rainmarkt2" setMarkerPosLocal getMarkerPos "rainmark2";
	
	"rainmarkt3" setMarkerPosLocal getMarkerPos "rainmark3";

//	"fogmarkt" setMarkerPosLocal getMarkerPos "fogmark";
};

// FIELD REPAIRS

		rmv_fieldRepair = {
			_tveh = _this select 0;
			_tveh removeAction EB_fieldRepair;
			EB_fieldRepair = 1;
		};

		enb_fieldRepair =
		{
			EB_fieldRepair = -1;
		};

EGG_EVO_fieldRepair = 
{
	_hasKit = "EB_ItemRepairKit" in (magazines player) or "EB_ItemRepairKit" in ((getMagazineCargo unitBackpack player) select 0);
   	_nearestCar = getPos player nearestObject "Car";
	_proximity =  player distance _nearestCar;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeof _nearestCar) >> "displayName");
	_repStr = format["Toolkit repair: %1",_displayName];
		if(((vehicle player) == player) && (_proximity < 5) && (getDammage _nearestCar > 0) && (_hasKit))then{
			if(EB_fieldRepair < 0) then
			{
				EB_fieldRepair = _nearestCar addAction [_repStr, "actions\repair.sqf", [_nearestCar,player], 10, false, true, "", ""];	
			};		
		}
		else {
			if(EB_fieldRepair > 0) then {
				[_nearestCar] call rmv_fieldRepair;
				[] call enb_fieldRepair;
				};
		};
};

EGG_EVO_stationRepair = 
{
	_vec = (vehicle player);
	_type = typeOf vehicle player;
	_EGG_stations = [];
	_EGG_stations = nearestObjects [player, ["Land_A_FuelStation_Shed","Land_repair_center","FuelStation","FuelStation_army","Land_Mil_Repair_center_EP1","Land_A_FuelStation_Build","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_Ind_FuelStation_Build_EP1","Land_Ind_FuelStation_Shed_EP1","Land_Ind_Garage01_EP1","Land_benzina_schnell","Land_fuelstation","Land_fuelstation_army"], 30];
	_EGG_cargoTrucks = nearestObjects [player,EGG_EVO_cargoTruck, 4];

	if(count _EGG_cargoTrucks >0) then {
		nearSupplyTruck = true;
	}
	else
	{
		nearSupplyTruck = false;
	};

	if( (getDammage _vec > 0 or fuel _vec < 0.98) and (count _EGG_stations >0) and not (_vec isKindOf "Man") ) then
	{
		if( (_vec != player) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) ) then
		{
			 titleText [localize "STR_M04t83", "PLAIN DOWN",0.3];//Servicing
			 for [{_loop3=0}, {_loop3<1}, {_loop3=_loop3}] do
			 {
			    sleep 0.200;	    		    
			    if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec)-0.0125);};
			    if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec)+0.0125);};
			    if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop3=1;};
			    if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {_loop3=1;titleText [localize "STR_M04t84", "PLAIN DOWN",0.3];};
			    _dam = (getDammage _vec)*100;
			    _ful = (Fuel _vec)*100;
			    hint format["Damage: %1\nFuel: %2",Round _dam,Round _ful];
			};
		};
	};
	_EGG_stations = [];
};

BIS_EVO_Repair = 
{
	_vec = (vehicle player);
	_type = typeOf vehicle player;
//	hintsilent format["Type: %1",(_type)];

	inrepairzone = ((_vec in list AirportIn) or (_vec in list farp1) or (_vec in list farp2) or (_vec in list farp3) or (_vec in list farp4) or (_vec in list reng1) or (_vec in list reng2) or (_vec in list reng3) or (_vec in list reng4) or (_vec in list dock1) or (_vec in list LHDin));

	if(getDammage _vec > 0 or fuel _vec < 0.99 and not (_vec isKindOf "Man")) then
	{
		if((inrepairzone) and (_vec != player) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec)) then
		{
			 titleText [localize "STR_M04t83", "PLAIN DOWN",0.3];//Servicing
			 for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do
			 {
			    sleep 0.500;	    		    
			    if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec)-0.0100);};
			    if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec)+0.0200);};
			    if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop2=1;};
			    if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {_loop2=1;titleText [localize "STR_M04t84", "PLAIN DOWN",0.3];};
			    _dam = (getDammage _vec)*100;
			    _ful = (Fuel _vec)*100;
			    hint format["Damage: %1\nFuel: %2",Round _dam,Round _ful];
			};
			_vec setVehicleAmmo 1;
			if (_vec isKindof "Helicopter") then
			{
				_vec removeMagazine "LaserBatteries";
				_vec addMagazine "LaserBatteries";
				if(not ("LaserDesignator_mounted" in _weapons)) then {_vec addweapon "LaserDesignator_mounted"};
				_vec removeMagazine "6Rnd_Grenade_Camel";
				_vec addMagazine "6Rnd_Grenade_Camel";
				if(not ("CamelGrenades" in _weapons)) then {_vec addweapon "CamelGrenades"};
			};
		};
	};
//adding cheats to planes
	// if( (_inrepairzone) and (_type in EB_planes_west) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec) and (perkparam == 1) and (EB_airload1 <0) ) then
	// {
	// 	_texta1 = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
	// 	_astring0 = format["Rearm %1",_texta1];
	// 	_aicon = "<img image='img\crew\getingunner_ca.paa' size='1.0' shadow='false' />";
	// 	_astring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_aicon,_astring0];
	// 	EB_airload1 = _vec addAction [_astring, "Actions\EB_rearm.sqf",[_vec,_player], 5, true, true,"",""];
	// };
	// if ( !(EB_airload1 <0) and ( (speed _vec < -2) or (speed _vec > 2) or (position _vec select 2 > 2.0) ) )then
	// {
	// 	_vec removeaction EB_airload1;
	// 	EB_airload1 = -1;
	// };
	// if (_vec==player) then 
	// {
	// 	_oldvec = nearestObject [player, "Air"];
	// 	_oldvec removeaction EB_airload1;
	// 	EB_airload1 = -1;
	// };
};


BIS_EVO_HPM =
{
	if(not (alive vehicle player)) then
	{
		BIS_EVO_fattack = false;
	};
	if(BIS_EVO_fattack and getdammage player == 0) then
	{
		_medic = objNull;
		_Objects = (vehicle player) nearObjects 10;
		{if (_x in EGG_EVO_PlayerMedic or _x isKindOf "USMC_Soldier_Medic" or _x isKindOf "FR_Corpsman" or _x isKindOf "MASH") then {_medic = _x}} forEach _Objects;
		if (not (isNull _medic) and not (local _medic)) then
		{
			BIS_EVO_mpoint = _medic;
			publicVariable "BIS_EVO_mpoint";
		};
		BIS_EVO_fattack = false;
	};
};

BIS_EVO_Rdisp = 
{
	_iimg = _this select 0;
	_iname = _this select 1;
	_mesg = _this select 2;
	_separator1 = parseText "<br /><br />";
	_img = parseText format["<t size='2.2'><img image='data\%1.paa'/></t>",_iimg];
	_name = parseText format["<t color='#FFFFCC'>   %1</t>",_iname];
	_txt = composeText [_img,_name,_separator1,_mesg];
	hint _txt;
};

BIS_EVO_Rank = 
{
	_name = name player;
	_score = score player;
	_rank = rank player;
	if (_score < BIS_EVO_rank2-pointsSpent and _score >= BIS_EVO_rank1-pointsSpent and _rank == "PRIVATE")  exitWith  
	{
		_rname = format["Corp.%1",_name];
		_hint =  format[_rankmes,_rname];
		["corp","CORPORAL",_hint] call BIS_EVO_Rdisp;
		playSound "Paycall";
		[1] call BIS_EVO_AmmoBox;
		[1] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.2;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "CORPORAL";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	if (_score < BIS_EVO_rank3-pointsSpent and _score >= BIS_EVO_rank2-pointsSpent and _rank == "CORPORAL")  exitWith  
	{
		_rname = format["Sgt.%1",_name];
		_hint =  format[_rankmes,_rname];
		["sgt","SERGEANT",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		[2] call BIS_EVO_AmmoBox;
		[2] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.4;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "SERGEANT";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";		
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	if (_score < BIS_EVO_rank4-pointsSpent and _score >= BIS_EVO_rank3-pointsSpent and _rank  == "SERGEANT")  exitWith  
	{	
		_rname = format["Ltn.%1",_name];
		_hint =  format[_rankmes,_rname];
		["ltn","LIEUTENANT",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		[3] call BIS_EVO_AmmoBox;
		[3] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.6;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "LIEUTENANT";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	if (_score < BIS_EVO_rank5-pointsSpent and _score >= BIS_EVO_rank4-pointsSpent and _rank  == "LIEUTENANT")  exitWith  
	{
		_rname = format["Cpt.%1",_name];
		_hint =  format[_rankmes,_rname];
		["cpt","CAPTAIN",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		[4] call BIS_EVO_AmmoBox;
		[4] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.8;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "CAPTAIN";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	if (_score < BIS_EVO_rank6-pointsSpent and _score >= BIS_EVO_rank5-pointsSpent and _rank == "CAPTAIN")  exitWith  
	{	
		_rname = format["Mjr.%1",_name];
		_hint =  format[_rankmes,_rname];
		["mjr","MAJOR",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		[5] call BIS_EVO_AmmoBox;
		[5] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.9;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "MAJOR";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	if (_score >= BIS_EVO_rank6-pointsSpent and _rank  == "MAJOR")  exitWith  
	{
		_rname = format["Col.%1",_name];
		_hint =  format[_rankmes,_rname];
		["col","COLONEL",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		[6] call BIS_EVO_AmmoBox;
		[6] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 1;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "COLONEL";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";
		_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
	};
	_tscore = score player;
	
};

BIS_EVO_CTime = 
{
	_temp = compile BIS_EVO_gdate_packed;
	_date = call _temp;
	_hour = _date select 3;
	
	if(_hour != _oldhour) then
	{
		if(_hour == 0) then
		{
			10 setOvercast 0.0;
			10 setRain 0.0;
		};
		_oldhour = _hour;
		setDate _date;
	};
};

BIS_EVO_CityClear = 
{
	switch (BIS_EVO_MissionProgress) do
	{
	player sideChat format ["BIS_EVO_CityClear:%1",BIS_EVO_MissionProgress];
	_currentcity = (BIS_EVO_MissionProgress-1);
	_city = (BIS_EVO_Townnames select _currentcity);
	[West,"HQ"] SideChat format[localize "STR_M04t61",_city];//%1 IS CLEAR OF ENEMY, GREAT JOB MEN
playSound "CityClear";
		case 1:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_lopatino"];
			"1" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj2";
		};
		case 2:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_vybor"];
			"2" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj3";
		};
		case 3:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_grishino"];
			"3" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj4";
		};
		case 4:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_gvozdno"];
			"4" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj5";
		};
		case 5:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_krasnostav"];
			"5" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj6";
		};
		case 6:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_khelm"];
			"6" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj7";
		};
		case 7:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_berezino"];
			"7" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj8";
		};
		case 8:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_solnichniy"];
			"8" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj9";
		};
		case 9:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_kamyshovo"];
			"9" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj10";
		};
		case 10:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_elektrozavodsk"];
			"10" objstatus "done";
			BIS_EVO_MainObjective setMarkerPos getMarkerPos "mobj11";
		};
		case 11:
		{	
//			[West,"HQ"] SideChat format[localize "STR_M04t61",localize "str_location_chernogorsk"];
			"11" objstatus "done";
			deleteMarkerLocal BIS_EVO_MainObjective;
			playSound "Intro";
		};		
	};
	[] call BIS_EVO_AssignTasks;
	_currentprog = BIS_EVO_MissionProgress;
};

BIS_EVO_Surrender = 
{
	hint "surrender array called";
	sleep 2;
	if ((count west_surrender_array > count _base_west_surrender_array) || (count west_surrender_array < count _base_west_surrender_array)) then
	{
//		_surrender = player execvm "data\scripts\clientsoldieraddaction.sqf";
		hint "surrender script called";
		player execvm "data\scripts\clientsoldieraddaction.sqf";
		sleep 5;
		_base_west_surrender_array = west_surrender_array;
	};
	sleep 2;
};

//_base_west_surrender_array = west_surrender_array;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//[] call BIS_EVO_CWeath;
//	sleep 1.011;
	[] call BIS_EVO_Repair;
//	[] call EGG_EVO_fieldRepair;
	sleep 1.011;
	[] call EGG_EVO_stationRepair;
	sleep 1.011;
	if (score player != _tscore and alive player) then {[] call BIS_EVO_Rank};
	if (BIS_EVO_MissionProgress > _currentprog) then {[] call BIS_EVO_CityClear};
	sleep 1.011;
	[] call BIS_EVO_CTime;
	sleep 1.011;
	[] call BIS_EVO_HPM;
	sleep 1.011;
//	[] call BIS_EVO_Surrender;
};

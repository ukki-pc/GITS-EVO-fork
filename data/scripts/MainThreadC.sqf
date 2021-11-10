#include "macros.h"
//_oldhour = date select 3;
_tscore = 0;
_rankmes = localize "STR_M04t82";
_rankmes = _rankmes + "More perkpoints available!";
_currentprog = 0;
_EGG_stations = [];
EB_airload1=-1;
EB_fieldRepair=-1;
repaircooldown = 0;

BIS_EVO_CWeath =
{
	"rainmarkt" setMarkerPosLocal getMarkerPos "rainmark";
	"rainmarkt2" setMarkerPosLocal getMarkerPos "rainmark2";
	"rainmarkt3" setMarkerPosLocal getMarkerPos "rainmark3";

//	"fogmarkt" setMarkerPosLocal getMarkerPos "fogmark";
};

// FIELD REPAIRS
/*
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
*/

/*
EGG_EVO_stationRepair = 
{
	_vec = (vehicle player);
	_type = typeOf vehicle player;
	_EGG_stations = [];
	_EGG_stations = nearestObjects [player, ["Land_A_FuelStation_Shed","Land_repair_center","FuelStation","FuelStation_army","Land_Mil_Repair_center_EP1","Land_A_FuelStation_Build","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_Ind_FuelStation_Build_EP1","Land_Ind_FuelStation_Shed_EP1","Land_Ind_Garage01_EP1","Land_benzina_schnell","Land_fuelstation","Land_fuelstation_army"], 30];

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
*/

BIS_EVO_Repair = 
{
	canRefuel = false;
	canRepair = false;
	canAmmo = false;
	if !(inrepairzone or inFarp) exitWith {};
	_vec = (vehicle player);
	_type = typeOf vehicle player;
	if(inFarp) then //Calculate the current level of farp
	{
		_playerIn = objNull;
		// _inZone = [position player select 0,position player select 1] nearObjects ["EmptyDetector", 50];
		// if(_inZone!="") then {_farpLVL = _inZone getVariable ["lvl",0]};
		{sleep 0.1;if(vehicle player in list _x)exitWith{_playerIn =_x}}forEach BIS_EVO_rengZones;
		_farpLVL = _playerIn getVariable ["lvl",0];

		if(_farpLVL > 0) then {canRefuel = true};
		if(_farpLVL > 0) then {canRepair = true};
		if(_farpLVL > 1) then {canAmmo = true};
	};
	if(inrepairzone) then
	{
		canRefuel = true;
		canRepair = true;
		canAmmo = true;
	};

	// _playerIn = "";
	// {sleep 0.2;if(player in list _x)exitWith{_playerIn =_x}}forEach BIS_EVO_rengZones;
//	hintsilent format["Type: %1",(_type)];

	_interrupt = ((_vec != player) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec));
	_allowed = (((getDammage _vec > 0 and canRepair) or (fuel _vec < 0.99) and canRefuel) and !(_vec isKindOf "Man") and speed _vec < 2 and (getPos _vec select 2) < 2);

	if(getDammage _vec > 0 or fuel _vec < 0.99 and not (_vec isKindOf "Man") ) then
	{
		if((inrepairzone or inFarp) and repaircooldown == 0 and _allowed) then
		{
			 titleText [localize "STR_M04t83", "PLAIN DOWN",0.3];//Servicing
			 while {_interrupt and _allowed} do
			 {
			    sleep 0.500;
			    if (getDammage _vec > 0 and canRepair) then {_vec setDammage ((getDammage _vec)-0.0100)};
			    if (Fuel _vec < 1 and canRefuel) then {_vec setFuel ((Fuel _vec)+0.0200)};
			    _interrupt = ((_vec != player) and (speed _vec > -2) and (speed _vec < 2) and (position _vec select 2 < 2.0) and (local _vec));
				if(!_interrupt) then {titleText [localize "STR_M04t84", "PLAIN DOWN",0.3]};
				_allowed = (((getDammage _vec > 0 and canRepair)  or (fuel _vec < 0.99) and canRefuel) and !(_vec isKindOf "Man") and speed _vec < 2 and (getPos _vec select 2) < 2);
				_dam = (getDammage _vec)*100;
			    _ful = (Fuel _vec)*100;
			    hint format["Damage: %1\nFuel: %2",Round _dam,Round _ful];
			};
			if(canAmmo) then {_vec setVehicleAmmo 1};	
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
		if(inrepairzone and repaircooldown > 0 and !(player isKindof "Man")) then {hint "Cannot repair immediately after hit!"};
	};
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
	_score = money;
	_rank = rank player;
	if (_score >= BIS_EVO_rank1 and _rank == "PRIVATE")  exitWith  
	{
		perkPoints = perkPoints + 1;
		_rname = format["Corp.%1",_name];
		_hint =  format[_rankmes,_rname];
		["corp","CORPORAL",_hint] call BIS_EVO_Rdisp;
		playSound "Paycall";
		// [1] call BIS_EVO_AmmoBox;
		// [1] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.2;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "CORPORAL";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 1;
	};
	if (_score >= BIS_EVO_rank2 and _rank == "CORPORAL")  exitWith  
	{
		perkPoints = perkPoints + 1;
		_rname = format["Sgt.%1",_name];
		_hint =  format[_rankmes,_rname];
		["sgt","SERGEANT",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		// [2] call BIS_EVO_AmmoBox;
		// [2] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.4;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "SERGEANT";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";		
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 2;
	};
	if (_score >= BIS_EVO_rank3 and _rank  == "SERGEANT")  exitWith  
	{	
		perkPoints = perkPoints + 1;
		_rname = format["Ltn.%1",_name];
		_hint =  format[_rankmes,_rname];
		["ltn","LIEUTENANT",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		// [3] call BIS_EVO_AmmoBox;
		// [3] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.6;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "LIEUTENANT";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 3;
	};
	if (_score >= BIS_EVO_rank4 and _rank  == "LIEUTENANT")  exitWith  
	{
		perkPoints = perkPoints + 1;
		_rname = format["Cpt.%1",_name];
		_hint =  format[_rankmes,_rname];
		["cpt","CAPTAIN",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		// [4] call BIS_EVO_AmmoBox;
		// [4] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.8;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "CAPTAIN";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 4;
	};
	if (_score >= BIS_EVO_rank5 and _rank == "CAPTAIN")  exitWith  
	{	
		perkPoints = perkPoints + 1;
		_rname = format["Mjr.%1",_name];
		_hint =  format[_rankmes,_rname];
		["mjr","MAJOR",_hint] call BIS_EVO_Rdisp;		
		// playSound "Paycall";
		// [5] call BIS_EVO_AmmoBox;
		// [5] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 0.9;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "MAJOR";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";	
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 5;
	};
	if (_score >= BIS_EVO_rank6 and _rank  == "MAJOR")  exitWith  
	{
		perkPoints = perkPoints + 1;
		_rname = format["Col.%1",_name];
		_hint =  format[_rankmes,_rname];
		["col","COLONEL",_hint] call BIS_EVO_Rdisp;		
		playSound "Paycall";
		// [6] call BIS_EVO_AmmoBox;
		// [6] call BIS_EVO_AmmoBoxR;
		BIS_EVO_PlayerSkill = 1;
		player SetSkill BIS_EVO_PlayerSkill;		
		BIS_EVO_aunit = player;
		BIS_EVO_arank = "COLONEL";
		player setUnitRank BIS_EVO_arank;
		publicVariable "BIS_EVO_aunit";
		publicVariable "BIS_EVO_arank";
		//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";
		playerRank = 6;
	};
	_tscore = score player;
};
/*
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
*/
BIS_EVO_CityClear = 
{
	player sideChat format ["BIS_EVO_CityClear:%1",BIS_EVO_MissionProgress];
	//_city = (BIS_EVO_MissionTownNames select BIS_EVO_MissionTownNames );
	//[West,"HQ"] SideChat format[localize "STR_M04t61",_city];//%1 IS CLEAR OF ENEMY, GREAT JOB MEN
	//playSound "CityClear";
	[] call BIS_EVO_AssignTasks;
	_currentprog = BIS_EVO_MissionProgress;
};

BIS_EVO_locationActions =
{
	//inrepairzone = (vehicle player in list AirportIn and triggerActivated airportIn) or (vehicle player in list farp1 and triggerActivated farp1) or (vehicle player in list farp2 and triggerActivated farp2) or (vehicle player in list farp3 and triggerActivated farp3) or (vehicle player in list farp4 and triggerActivated farp4) or (vehicle player in list dock1) or (vehicle player in list LHDin);
	if(inrepairzone) exitWith {canRecruit = true; canFasttravel = true; showMoney = true};

	_nearPos = false;
	_positions = [];


	//Add cities to the array
	_positions = BIS_EVO_conqueredTowns + capturedFlags + [bam,p72];

	//Add rhq locations to the array
	{_positions = _positions + [getMarkerPos _x]}forEach RHQMarkers;

	//Add mhq position to the array
	if(alive MHQ) then {_positions = _positions + [MHQ]};

	//Finds nearest object of all
	_nearestPoint = [_positions, position player] call BIS_fnc_nearestPosition;

	_objDist = _positions call fnc_getDistanceToNearestCity;

	_nearPos = (_objDist<rhqTeleportDistance and _objdist != -1);

	if(((_nearestPoint in capturedFlags)) and _objdist < 30) exitWith {canFasttravel = true; canRecruit = true; showMoney = true};
	if(((_nearestPoint in BIS_EVO_conqueredTowns+[bam,p72])) and _objdist < townTeleportDistance) exitWith {canFasttravel = true; canRecruit = true; showMoney = true; inrepairzone = true;};

	canRecruit = false;

	if(_nearPos) exitWith {canFasttravel = true};

if(recruitPlaces == 1 or recruitPlaces == 2 or recruitPlaces == 3) then
{
	_objDist = player distance _nearestPoint;

	if(_objDist <= 100) then 
	{					
		canRecruit = true;
		 canFasttravel = true;
		 showMoney = true;
	}
	else{
		canRecruit = false;
		 canFasttravel = false;
		 showMoney = false;
	};
}else {canRecruit = true};


};

BIS_EVO_UpdateUI =
{
	//Welcome to if hell

	if(showMoney) then {call fnc_showMoney}
	else{9 cutRsc ["Default","PLAIN"]};

	if(canRepair) then {4 cutRsc ["UIrep","PLAIN"];}
	else{4 cutRsc ["Default","PLAIN"];};

	if(canAmmo) then {5 cutRsc ["UIammo","PLAIN"];}
	else{5 cutRsc ["Default","PLAIN"];};

	if(canRefuel) then {7 cutRsc ["UIgasoline","PLAIN"];}
	else{7 cutRsc ["Default","PLAIN"];};

	if(canFasttravel) then {6 cutRsc ["UIfastTravel","PLAIN"];}
	else{6 cutRsc ["Default","PLAIN"];};

	if(canRecruit) then {8 cutRsc ["UIrecruit","PLAIN"];}
	else{8 cutRsc ["Default","PLAIN"];};



	/*
	if(inrepairzone) exitWith 
	{
		4 cutRsc ["UIrep","PLAIN"];
		5 cutRsc ["UIammo","PLAIN"];
		6 cutRsc ["UIfastTravel","PLAIN"];
		7 cutRsc ["UIgasoline","PLAIN"];
		8 cutRsc ["UIrecruit","PLAIN"];
	};
	if(!inrepairzone) then
	{
		4 cutRsc ["Default","PLAIN"];
		5 cutRsc ["Default","PLAIN"];
		6 cutRsc ["Default","PLAIN"];
		7 cutRsc ["Default","PLAIN"];
		8 cutRsc ["Default","PLAIN"];
	};
	*/
};




//_base_west_surrender_array = west_surrender_array;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	//[] call BIS_EVO_CWeath;
//	sleep 1.011;
	//inFarp = (vehicle player in list reng1) or (vehicle player in list reng2) or (vehicle player in list reng3) or (vehicle player in list reng4);	
	[] call BIS_EVO_Repair;
//	[] call EGG_EVO_fieldRepair;
//	[] call EGG_EVO_stationRepair;
	sleep 1.011;
	if (money > _tscore and alive player) then {[] call BIS_EVO_Rank};
	if (BIS_EVO_MissionProgress != _currentprog) then {[] call BIS_EVO_CityClear};
	[] call	BIS_EVO_locationActions;
	sleep 1.011;
	//[] call BIS_EVO_CTime;
	[] call BIS_EVO_UpdateUI;
	sleep 1.011;
	//if(currentWeapon player in BIS_EVO_spottingWeapons and perkSniperLVL > 0) then {call fnc_spotVeh};
	//[] call BIS_EVO_HPM; //DUNNO WHAT IS
	
};

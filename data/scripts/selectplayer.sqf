/*
Player select script by Eggbeast
  
Put this in the players init line:
veh = [this] execVM "data\scripts\selectplayer.sqf"

Options:

There are some optional squads to play your mission with in the init of the mission, e.g.

	EGG_unitwest		Faction
===========================================
		0			"BAF_D"
		1			"BAF_W"
		2			"US_D"
		3			"USMC_W"
		4			"CZ_D"
		5			"CZ_W"
		6			"PMC_D"
		7			"PMC_W"
		8			"PRACS"
		9			"Unsung US 25ID (65)"
		10			"Unsung US 5SFG (65)"
		11			"Unsung USMC (65)"
		12			"Unsung US 1ID (68)"
		13			"Unsung USMC (68)"
		14			"Unsung USMC FR (68)"
		15			"Unsung US 6SFG (68)"
		16			"Unsung US 1AC LRRP"
		17			"Unsung US 1AC CIDG"
		18			"Duala/Afrenian"
		19			"Lingor"
		20			"A3"

EGG_unitwest is defined in the init by mission parameters managed in description.ext

EGG_unitwest = paramsArray select 30;

This then defines the array of player spawnunits (and AI recruit units) as follows:

EGG_EVO_west1 =
	Rifleman
	Medic
	AT
	Pilot
	MG
	Engineer
	AA
	Scout/Marksman
	Sniper
	GL
	HAT
	Officer

	Spy

EGG_EVO_westplayer = ["BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_EN_DDPM","BAF_Soldier_Officer_DDPM","BAF_Soldier_GL_DDPM","TK_CIV_Takistani04_EP1","BAF_Soldier_GL_DDPM","BAF_Soldier_AA_DDPM","BAF_Soldier_MG_DDPM","BAF_Soldier_AT_DDPM","BAF_Pilot_DDPM","BAF_Soldier_HAT_DDPM","BAF_Soldier_MG_DDPM","CIV_EuroMan02_EP1","BAF_Pilot_DDPM","BAF_Soldier_AAA_DDPM","BAF_Soldier_scout_DDPM","BAF_Soldier_Medic_DDPM","BAF_Soldier_SniperH_MTP","BAF_Soldier_Medic_DDPM","BAF_Soldier_Medic_DDPM","Dr_Hladik_EP1"];

Players enter in the following joining slots

	startname		class
========================================================
	p1			engineer
	p2			engineer
	p3			engineer/demolitions
	p4			engineer/demolitions/sapper
	p5			officer
	p6			GL
	p7			spy
	p8			GL
	p9			AA
	p10			MG
	p11			LAT
	p12			pilot
	p13			HAT
	p14			MG
	p15			spy
	p16			Pilot
	p17			AA
	p18			marksman
	p19			medic
	p20			sniper
	p21			medic
	p22			medic

	
Contact & Bugreport: eggbeast@robgraham.co.uk
==============================================================================================

if (!isServer) exitWith {};

// Define variables
_unit = _this select 0;
//_type = typeOf _unit;
_position = getPosASL _unit;

//_hasname = false;
_unitname = vehicleVarName _unit;
//if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};

//if (_hasname == false) exitwith {hint "you must give your playable units text names p1-p22"};

//move unit off map
_offside = getmarkerpos "boot_hill";
_unit setpos [_offside select 0, _offside select 1,0];

if (editor==0) then {_intro = player execVM "data\scripts\intro.sqf";};
waituntil {(EGG_sinit==1)};


//work out type to make and name to give
//return _nname and _ntype

_ntype ="";
_nname ="";

switch (_unitname) do
{
	 case "p1":
	{
		_nname = "eng1";
		_ntype = (EGG_EVO_westplayer select 0);
	};
	 case "p2":
	{
		_nname = "eng2";
		_ntype = (EGG_EVO_westplayer select 1);
	};
	 case "p3":
	{
		_nname = "eng3";
		_ntype = (EGG_EVO_westplayer select 2);
	};
	 case "p4":
	{
		_nname = "eng4";
		_ntype = (EGG_EVO_westplayer select 3);
	};
	 case "p5":
	{
		_nname = "eng5";
		_ntype = (EGG_EVO_westplayer select 4);
	};
	 case "p6":
	{
		_nname = "eng6";
		_ntype = (EGG_EVO_westplayer select 5);
	};
	 case "p7":
	{
		_nname = "eng7";
		_ntype = (EGG_EVO_westplayer select 6);
	};
	 case "p8":
	{
		_nname = "eng8";
		_ntype = (EGG_EVO_westplayer select 7);
	};
	 case "p9":
	{
		_nname = "eng9";
		_ntype = (EGG_EVO_westplayer select 8);
	};
	 case "p10":
	{
		_nname = "eng10";
		_ntype = (EGG_EVO_westplayer select 9);
	};
	 case "p11":
	{
		_nname = "eng11";
		_ntype = (EGG_EVO_westplayer select 10);
	};
	 case "p12":
	{
		_nname = "eng12";
		_ntype = (EGG_EVO_westplayer select 11);
	};
	 case "p13":
	{
		_nname = "eng13";
		_ntype = (EGG_EVO_westplayer select 12);
	};
	 case "p14":
	{
		_nname = "eng14";
		_ntype = (EGG_EVO_westplayer select 13);
	};
	 case "p15":
	{
		_nname = "eng15";
		_ntype = (EGG_EVO_westplayer select 14);
	};
	 case "p16":
	{
		_nname = "eng16";
		_ntype = (EGG_EVO_westplayer select 15);
	};
	 case "p17":
	{
		_nname = "eng17";
		_ntype = (EGG_EVO_westplayer select 16);
	};
	 case "p18":
	{
		_nname = "eng18";
		_ntype = (EGG_EVO_westplayer select 17);
	};
	 case "p19":
	{
		_nname = "eng19";
		_ntype = (EGG_EVO_westplayer select 18);
	};
	 case "p20":
	{
		_nname = "eng20";
		_ntype = (EGG_EVO_westplayer select 19);
	};
	 case "p21":
	{
		_nname = "eng21";
		_ntype = (EGG_EVO_westplayer select 20);
	};
	 case "p22":
	{
		_nname = "eng22";
		_ntype = (EGG_EVO_westplayer select 21);
	};
	 case "default": 
	//returns dr hladik so we can see theres a problem
	{
		_nname = "error";
		_ntype = (EGG_EVO_westplayer select 22);
	};
};
sleep 0.1;

//create new unit with correct name for evo
_group = createGroup west;
_nunit = _group createUnit [_ntype,_offside,[],0,"NONE"];

//switch into new unit
addSwitchableUnit _nunit;
setPlayable _nunit;
selectPlayer _nunit;

_nunit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_nname];
processInitCommands;

//delete old unit
sleep 0.1;
removeSwitchableUnit _unit;
deleteVehicle _unit;

//move unit back to spawn location and initialise them


_nunit setPosASL _position;
*/

_nunit = _this select 0;

markme = [_nunit] execVM "data\scripts\update.sqf";
sleep 0.1;
plays = [_nunit] execVM "data\scripts\pinit.sqf";
sleep 0.1;

{_nunit reveal _x;} forEach (_position nearObjects ["AllVehicles",100]);
{_nunit reveal _x;} forEach (_position nearObjects ["ReammoBox",50]);
{_nunit reveal _x;} forEach (_position nearObjects ["Misc_Backpackheap",50]);

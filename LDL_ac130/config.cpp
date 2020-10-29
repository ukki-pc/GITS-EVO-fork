class CfgPatches
{
	class LDL_ac130
 	{
  		units[] = {};
  		weapons[] = {};
  		requiredVersion = 0.1;
  		requiredAddons[] = {};
 	};
};

//Sounds
class CfgSounds
{
	#include "Sounds\CfgSounds.hpp"
};

//Titles
class RscTitles
{
	#include "RscTitles\RscTitles.hpp"
};
	
//Dialog
#include "Dialog\dialog.hpp"

class CfgVehicleClasses
{
	class LDL_Logics
 	{
  		displayName = "LDL Logics";
 	};
};

class CfgVehicles
{
	class Logic;
 	class LDL_Init: Logic
 	{
 		vehicleClass = "LDL_Logics";
  		displayName = "LDL AC-130 Init";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_init.paa";
  		class EventHandlers
  		{
   			init = "[] execVM""\LDL_ac130\LDL_init.sqf""";
  		};
 	};
 	class LDL_Call: Logic
 	{
 		vehicleClass = "LDL_Logics";
  		displayName = "Can call AC130";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_call.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_call.sqf""";
  		};
 	};
 	class LDL_CallAI: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Can call AC130 (AI)";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_callAI.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_callAI.sqf""";
  		};
 	};
 	class LDL_CallUAV: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Can call UAV";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_callUAV.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_callUAV.sqf""";
  		};
 	};
 	class LDL_Rearm: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Rearm";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_rearm.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_rearm.sqf""";
  		};
 	};
	/*
 	class LDL_StartRotate: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Start AC130 Type 1";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_start.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_start_rotate.sqf""";
  		};
 	};
 	class LDL_StartAttach: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Start AC130 Type 2";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_start.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_start_attach.sqf""";
  		};
 	};
 	class LDL_StartAI: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Start AC130 AI";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_start.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_start_AI.sqf""";
  		};
 	};
 	class LDL_StartUAV: Logic
 	{
		vehicleClass = "LDL_Logics";
  		displayName = "Start UAV";
  		model = "\ca\weapons\empty";
  		Icon = "\LDL_ac130\Pictures\icon_logic_start.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_logic_start_UAV.sqf""";
  		};
 	};
	*/

	class AllVehicles;
	class Air;
	class Plane;
	class C130J;
	class LDL_C130J: C130J
	{
		displayName = "AC-130H Spectre";
  		Icon = "\LDL_ac130\Pictures\icon_AC130.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_init_AC130.sqf""";
  		};
	};

	class C130J_base;
	class C130J_US_EP1;

	class LDL_C130J_US: C130J_US_EP1
	{
		displayName = "AC-130H Spectre";
  		Icon = "\LDL_ac130\Pictures\icon_AC130.paa";
  		class EventHandlers
  		{
   			init = "_this execVM""\LDL_ac130\Addon\ac130_init_AC130.sqf""";
  		};
	};
	
};

class CfgAmmo
{

	class ShellCore;
	class ShellBase : ShellCore {};

	class LDL_25mm : ShellBase
	{
		hit = 10;
		indirectHit = 5;
		indirectHitRange = 5;
		typicalspeed = 1300;
		explosive = 0.8;
		cost = 50;
		model = "\ca\Weapons\shell";
		CraterEffects = "ExploAmmoCrater";
		explosionEffects = "ExploAmmoExplosion";
		
	};

	class LDL_40mm : ShellBase
	{
		hit = 300;
		indirectHit = 30;
		indirectHitRange = 8;
		typicalspeed = 1300;
		explosive = 0.8;
		cost = 300;
		model = "\ca\Weapons\shell";
		CraterEffects = "ImpactEffectsBig";
		explosionEffects = "HEShellExplosion";
	};

	class LDL_105mm : ShellBase
	{
		hit = 1000;
		indirectHit = 100;
		indirectHitRange = 30;
		typicalspeed = 1300;
		explosive = 1.6;
		cost = 900;
		model = "\ca\Weapons\shell";
		CraterEffects = "BombCrater";
		explosionEffects = "BombExplosion";
	};
};
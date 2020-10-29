/*	LDL_init.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

LDL_initDone = false;

//ARMA2
/*
if (!(isClass (configfile >> "cfgpatches" >> "Chernarus"))) exitWith 
{
	hintc "You need ARMA2 to run AC130 Script!";
	LDL_initDone = true;
};
*/

//Operation Arrowhead
if (isClass (configfile >> "cfgpatches" >> "ca_E")) then 
{
	//Use OA FLIR	
	LDL_OAH_setCamUseTi = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_setCamUseTi.sqf";
};

//Addon
if (!(isClass(configFile>>"CfgPatches">>"LDL_ac130"))) then 
{
	//ARMA2 Weapons
	//LDL_ammo = ["G_30mm_HE","Sh_120_SABOT","Sh_120_HE"];
	LDL_ammo = ["B_25mm_HE","Sh_40_HE","ARTY_Sh_105_HE"];	
}
else
{
	//LDL Weapons
	LDL_ammo = ["LDL_25mm","LDL_40mm","LDL_105mm"];		
};

//Create some necessary objects
LDL_gunPosition = (createGroup (createCenter sideLogic)) createUnit ["LOGIC",[0,0,0],[],0,""];
LDL_cam_rotating_center = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0,0,0], [], 0, ""];
LDL_destination = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];
LDL_ac130_cam_target = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

//Misc
LDL_ac130_client = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_client.sqf";
LDL_ac130_functions = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_functions.sqf";
LDL_mando_angles = compile preprocessFileLineNumbers "LDL_ac130\Misc\mando_angles.sqf";
LDL_setPitchBank = compile preprocessFileLineNumbers "LDL_ac130\Misc\setPitchBank.sqf";
LDL_getPitchBank = compile preprocessFileLineNumbers "LDL_ac130\Misc\getPitchBank.sqf";
LDL_float = compile preprocessFileLineNumbers "LDL_ac130\Misc\float.sqf";
LDL_calculateBullet = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_calculateBullet.sqf";
LDL_ac130_correctAxis = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_correctAxis.sqf";
LDL_ac130_warning = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_warning.sqf";
LDL_ac130_delay = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_delay.sqf";
LDL_ac130_createPlane = compile preprocessFileLineNumbers "LDL_ac130\Misc\ac130_createPlane.sqf";
LDL_KeyDown = compile preprocessFileLineNumbers "LDL_ac130\Misc\keyDown.sqf";
LDL_KeyUp = compile preprocessFileLineNumbers "LDL_ac130\Misc\keyUp.sqf";
//LDL-Systems
LDL_ac130_systems_HUD_pilot = compile preprocessFileLineNumbers "LDL_ac130\Misc\LDLSystems\ac130_systems_HUD_pilot.sqf";

//AC130 Core
LDL_ac130_rot_camera = compile preprocessFileLineNumbers "LDL_ac130\ac130_rot_camera.sqf";
LDL_ac130_lite_camera = compile preprocessFileLineNumbers "LDL_ac130\ac130_lite_camera.sqf";
LDL_ac130_rot_camera_opt = compile preprocessFileLineNumbers "LDL_ac130\ac130_rot_camera_opt.sqf";
LDL_ac130_rot_main = compile preprocessFileLineNumbers "LDL_ac130\ac130_rot_main.sqf";
LDL_ac130_lite_main = compile preprocessFileLineNumbers "LDL_ac130\ac130_lite_main.sqf";
LDL_ac130_att_camera = compile preprocessFileLineNumbers "LDL_ac130\ac130_att_camera.sqf";
LDL_ac130_att_main = compile preprocessFileLineNumbers "LDL_ac130\ac130_att_main.sqf";
LDL_ac130_AI_main = compile preprocessFileLineNumbers "LDL_ac130\ac130_AI_main.sqf";
LDL_uav_rot_main = compile preprocessFileLineNumbers "LDL_ac130\uav_rot_main.sqf";
//LDL-Systems
LDL_ac130_systems_pilot_main = compile preprocessFileLineNumbers "LDL_ac130\LDLSystems\ac130_systems_pilot_main.sqf";
LDL_ac130_systems_gunner_main = compile preprocessFileLineNumbers "LDL_ac130\LDLSystems\ac130_systems_gunner_main.sqf";

//AC130
LDL_ac130_rot_waypoints = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_rot_waypoints.sqf";
LDL_ac130_rot_float = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_rot_float.sqf";
LDL_ac130_AI_shooting = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_AI_shooting.sqf";
LDL_ac130_guns = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_guns.sqf";
LDL_ac130_blink = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_blink.sqf";
LDL_ac130_troops = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_troops.sqf";
LDL_ac130_sound = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_sound.sqf";
LDL_ac130_bullet_cam = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_bulletCam.sqf";
LDL_ac130_interior = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_interior.sqf";
LDL_ac130_rearm = compile preprocessFileLineNumbers "LDL_ac130\AC130\ac130_rearm.sqf";

//UAV
LDL_uav_guns = compile preprocessFileLineNumbers "LDL_ac130\UAV\uav_guns.sqf";

//Setups
LDL_ac130_rot_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\ac130_rot_setup.sqf";
LDL_ac130_lite_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\ac130_lite_setup.sqf";
LDL_ac130_att_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\ac130_att_setup.sqf";
LDL_ac130_AI_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\ac130_AI_setup.sqf";
LDL_uav_rot_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\uav_rot_setup.sqf";
//LDL-Systems
LDL_ac130_systems_pilot_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\LDLSystems\ac130_systems_pilot_setup.sqf";
LDL_ac130_systems_gunner_setup = compile preprocessFileLineNumbers "LDL_ac130\Setups\LDLSystems\ac130_systems_gunner_setup.sqf";

//Camera
LDL_camera_approach = compile preprocessFileLineNumbers "LDL_ac130\Camera\camera_approach.sqf";
LDL_camera = compile preprocessFileLineNumbers "LDL_ac130\Camera\camera.sqf";

//Spawn Client script and call functions
[]spawn LDL_ac130_client;
[]call LDL_ac130_functions;
execVM "LDL_ac130\Dialog\dlg_init.sqf";

LDL_showParticles = true; //Every client will see the particles
LDL_ac130_active = false;
LDL_ac130_abort = false;
player setVariable ["LDL_AC130_Mapclicks", 0, true];
player setVariable ["LDL_AC130_AI_Mapclicks", 0, true];
player setVariable ["LDL_UAV_Mapclicks", 0, true];
LDL_AI_targets = [];
LDL_foreignScriptIdentifier = 0;
LDL_userInit = {};
LDL_RscLayer = 5; //Layer for RscTitle

//Bullet Cam
LDL_bulletCam_enabled = false;
if(LDL_bulletCam_enabled) then{LDL_ac130_cam_bullet = "camera" camcreate [0, 0, 0];};

//LDL-Systems
LDL_SystemsActivated = false;
LDL_coopPartner = objNull;
LDL_planeInPosition = false;

//Adjustments affect AC130. Don't change them here. Overwrite them in another script.
LDL_AC130_Adjustments = 
[
	/* 0. Radius*/ 		1000 	/*Explanation: Radius for the rotating AC130. Default: 1000*/,
	/* 1. Height*/ 		1000  /*Explanation: Height for the rotating AC130. Default: 1000*/,
	/* 2. Munition 25mm*/ 	2000  /*Explanation: 25mm Munition. Default: 1000*/,
	/* 3. Munition 40mm*/ 	100	/*Explanation: 40mm Munition. Default: 50*/,
	/* 4. Munition 105*/ 	20	/*Explanation: 105mm Munition. Default: 20*/,
	/* 5. 360° View*/ 	false /*Explanation: Activate 360° view. Default: false*/,
	/* 6. Zoom 25mm*/ 	9.5	/*Explanation: Maximum zoom level for the 25mm. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 7. Zoom 40mm*/ 	9	/*Explanation: Maximum zoom level for the 40mm. Default: 9 (only numbers between 1 and 10)*/,
	/* 8. Zoom 105mm*/ 	8	/*Explanation: Maximum zoom level for the 105mm. Default: 8 (only numbers between 1 and 10)*/,
	/* 9. Time AI*/ 	180	/*Explanation: Time in seconds the AI controlled AC130 stays in the air. Default: 180*/,
	/*10. Mapclicks*/ 	3	/*Explanation: Available AC130 mapclicks per player. Default: 3*/,
	/*11. Optical Zoom*/ 	false /*Explanation: Enable Optical Zoom. Default: false !BETA only available for rotating AC130 BETA!*/,
	/*12. Delay*/ 		120 	/*Explanation: Delay for mapclick AC130 to arrive. Default: 120*/
];

//Adjustments affect both AC130 and UAV. Don't change them here. Overwrite them in another script.
LDL_Adjustments =
[
	/* 0. Infantry Strobes*/  [true, true] 	/*Explanation: Enable Infantry Strobes / Show them at startup. Default: [true, true]*/,
	/* 1. Vehicle Detection*/ [false, false] 	/*Explanation: Enable Vehicle Detection / Show it at startup. Default: [false, false]*/,
	/* 2. Particles*/ 	  true 		/*Explanation: Show Particles. Default: true*/,
	/* 3. Monitor*/ 		  true		/*Explanation: Show Monitor. Default: true*/,
	/* 4. Third-Person View*/ true		/*Explanation: Enable Third-Person View. Default: true*/,
	/* 5. Radio Traffic*/ 	  true		/*Explanation: Enable Radio Traffic at startup. Default: true*/,
	/* 6. Sequence*/ 		  true		/*Explanation: Show sequence at startup. Default: true*/,
	/* 7. Camera Effect*/ 	  1 			/*Explanation: Camera effect at startup: 1 (Nothing), 2 (FLIR white), 3 (FLIR black), 4 (NVG). Default: 1*/,
	/* 8. Script Stop*/ 	  -1			/*Explanation: Time in seconds until script stops. Default: -1 (infinite)*/,
	/* 9. Waypoints*/ 	  false 		/*Explanation: Show waypoints at startup. Default: false*/,
	/*10. Faction*/ 	  	  faction player 	/*Explanation: Faction belonging the AC130. Default: faction player*/,
	/*11. Side*/ 	  	  side player 	/*Explanation: Side belonging the AC130. Default: side player*/
];

//Adjustments affect UAV. Don't change them here. Overwrite them in another script.
LDL_UAV_Adjustments = 
[
	/* 0. Radius*/ 				1000 	/*Explanation: Radius for the rotating UAV. Default: 1000*/,
	/* 1. Height*/ 				1000  /*Explanation: Height for the rotating UAV. Default: 1000*/,
	/* 2. Munition Mounted Hellfire*/ 	8  	/*Explanation: Available Hellfires. Default: 8*/,
	/* 3. Munition Hellfire Strike*/ 	3	/*Explanation: Available Hellfires Strikes. Default: 3*/,
	/* 4. Zoom Mounted Hellfire*/ 	9.5	/*Explanation: Maximum zoom level for the Mounted Hellfire. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 5. Zoom Hellfire Strike*/ 		9.5	/*Explanation: Maximum zoom level for the Hellfire Strike. Default: 9.5 (only numbers between 1 and 10)*/,
	/* 6. Mapclicks*/ 			3	/*Explanation: Available UAV mapclicks per player. Default: 3*/,
	/* 7. Delay*/ 				120 	/*Explanation: Delay for mapclick UAV to arrive. Default: 120*/
];

//Available in game actions to start the AC130. Don't change them here. Overwrite them in another script.
LDL_inGameActions =
[
	true, //0: AC130 Co-Pilot can activate camera view via "AC130 Camera"
	true, //1: AC130 Pilot can start rotate script via "AC130 Autopilot"
	true, //2: Player can command AI AC130 from the ground via "AC130 Cease/Open Fire", "AC130 Attack Position", "AC130 Return Home"
	true //3: LDL-Systems: AC130 Pilot and AC130 Co-Pilot have the ability to start coop script 
];

//Initialisation of PVEH
"LDL_PublicLDLCannon25Sound" addPublicVariableEventHandler
{
	_soundSource = _this select 1;
	_soundSource say format ["LDL_gun01"];
};
"LDL_PublicLDLCannon40Sound" addPublicVariableEventHandler
{
	_soundSource = _this select 1;
	_soundSource say format ["LDL_gun02"];
};
"LDL_PublicLDLCannon105Sound" addPublicVariableEventHandler
{
	_soundSource = _this select 1;
	_soundSource say format ["LDL_gun03"];
};

"LDL_PublicLDLCannon25FX" addPublicVariableEventHandler
{
	_shell = (_this select 1) select 0;
	_vel = (_this select 1) select 1;
	_weapon = (_this select 1) select 2;
	_position = (_this select 1) select 3;
	#include "Misc\ac130_createParticleSource.sqf"
};
"LDL_PublicLDLCannon40FX" addPublicVariableEventHandler
{
	_shell = (_this select 1) select 0;
	_vel = (_this select 1) select 1;
	_weapon = (_this select 1) select 2;
	_position = (_this select 1) select 3;
	#include "Misc\ac130_createParticleSource.sqf"
};
"LDL_PublicLDLCannon105FX" addPublicVariableEventHandler
{
	_shell = (_this select 1) select 0;
	_vel = (_this select 1) select 1;
	_weapon = (_this select 1) select 2;
	_position = (_this select 1) select 3;
	#include "Misc\ac130_createParticleSource.sqf"
};

"LDL_PublicLDLSystem_action_pilot" addPublicVariableEventHandler
{
	_player = (_this select 1) select 0;
	_plane = (_this select 1) select 1;
	_state = (_this select 1) select 2;
	#include "Misc\LDLSystems\ac130_pilot_activated.sqf"
};
"LDL_PublicLDLSystem_action_gunner" addPublicVariableEventHandler
{
	_player = (_this select 1) select 0;
	_plane = (_this select 1) select 1;
	_state = (_this select 1) select 2;
	#include "Misc\LDLSystems\ac130_gunner_activated.sqf"
};

//Init done
LDL_initDone = true;
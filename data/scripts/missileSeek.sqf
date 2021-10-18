// Engage target with ARM radar
// unit addAction ["ARM - Indirect Fire Mode", "\pook_SAM\scripts\ARMRadarEngage.sqf","",5,false,true,"AutoHoverCancel","unit GetVariable 'ELS_Active' == 1"];
/**  List of ARM missiles within Rangemaster
 // ALARM - supplies 100% expended in Gulf War
 // AGM78 - replaced by AGM-88 in US; possibly in use elsewhere
 // AGM-88E AARGM
	"EB_M_Shrike_AT", = AGM45 Shrike
	"EB_M_AGM88_AT", = AGM88 HARM
	"EB_M_AGM122_AT", = AGM122 Sidearm
	"EB_M_KH25MP_AT", = AS12 \ Kh-25MP "Kegler"
	"EB_M_KH15P_AT", =/ AS16 \ Kh-15 "Kickback"
	"EB_M_KH31_AT" = AS17 \ Kh-31  "Krypton"

**/

private ["_vehicle","_weapon","_ARMWepArray","_targetRadar","_type","_reportType","_radarType"];

_vehicle = _this select 0;
_weapon = toUpper (currentWeapon _vehicle);

// check for loiter mode (ALARM)
if (true) then {
	private "_target";
	_target = assignedTarget _vehicle;
	_missile = nearestObject [_vehicle, "MissileBase"];
	// check for no target, assume INDIRECT mode
	if (isNull _target) then {
		private ["_climbCounter","_loiterCounter","_counter","_targets","_targetFound","_dropMissile"];
		_climbCounter = 0;
		_loiterCounter = 0;
		_counter = 0;
		_targets = [];
		_targetFound = 0;

		sleep 1;

	// raise nose and climb for 30 seconds
			// missile thrustTime = 30; // missile timeToLive = 90;
			// simulate loiter climb for ~30 seconds (rl 40,000 ft altitude \ 12192 meters)
			// from ASL, missile will climb to ~ 15km altitude
		while {_climbCounter < 460} do {
			private ["_speed","_dir","_vel","_vectorUp"];
			_speed = -20;
			_dir = direction _missile;
			_vel = velocity _missile;
			_vectorUp = vectorUp _missile;

			_missile setVectorUp [(_vectorUp select 0),(_vectorUp select 1)-0.015,(_vectorUp select 2)];
			_missile setVelocity [(_vel select 0)+(sin _dir * _speed),(_vel select 1)+(cos _dir * _speed),(_vel select 2)+60];
			if (_vectorUp select 1 < -0.975) then {_vectorUp select 1 == -0.975}; // 85.5 degrees upward

			sleep 0.05;
			_climbCounter = _climbCounter + 1;
		};
		sleep 0.1;
		_pos = getPos _missile;
		_vehicle vehicleChat format ["ALARM Loiter chute deployed at %1",_pos];


	// drogue chute DEPLOY - reduces velocity for 10 seconds, point downward
		_missileLoiter = "pook_ALARM_LOITER" createVehicleLocal getPos _missile;
		_missileLoiter setDir (getDir _missile);
		_missileLoiter setPos (_missile modelToWorld [0,0,0]);
		_loiterVel = velocity _missile;
		deleteVehicle _missile;                
		_missileLoiter setVelocity [(_loiterVel select 0),(_loiterVel select 1),(_loiterVel select 2)];

		while {_counter < 100} do {
			_dir = direction _missileLoiter;
			_vel = velocity _missileLoiter;

			_missileLoiter setVelocity [(_vel select 0)+(sin _dir*(-7.5)),(_vel select 1)+(cos _dir*(-7.5)),(_vel select 2)+1.75];

			if (_vel select 0 < 0.1) then {_vel select 0 == 0};
			if (_vel select 1 < 0.1) then {_vel select 1 == 0};

			sleep 0.1;
			_counter = _counter + 1;
		};

	// drogue chute LOITER - reduce downward velocity and fall under chute for ~15 seconds
		while {_loiterCounter < 15} do {
			private ["_dir","_vel"];
			_dir = direction _missileLoiter;
			_vel = velocity _missileLoiter;

			_missileLoiter setVelocity [(_vel select 0)+(sin _dir*(-7.5)),(_vel select 1)+(cos _dir*(-7.5)),(_vel select 2)+5];

			if (_vel select 0 < 0.1) then {_vel select 0 == 0};
			if (_vel select 1 < 0.1) then {_vel select 1 == 0};

			sleep 1;
			_loiterCounter = _loiterCounter + 1;
		};

	// Begin search for targets
		_seekerHits = [(getPos _missileLoiter select 0), (getPos _missileLoiter select 1), 0] nearEntities [
			["pook_30N6E_Base", // pook_SA10
			 "pook_SA3_radar_base", // SA3
			 "pook_9K331_Base", // SA15
			 "pook_9K332_base",
			 "pook_9K37_Base", // SA11,SA17
			 "pook_9K37M2_base",
			 "POOK_9K317M3_BASE", // SA17-M3
			 "pook_9S36_Base",
			 "pook_96K6_base", // SA22
			 "pook_ANMPQ53", // MIM-104 Patriot radar
			 "pook_CRAM", // CRAM radar
			 "pook_ANMPQ64",  // NASAMS radar
			 "pook_NASAMS",  // NASAMS ADS vehicle
			 "2S6M_Tunguska", // SA-19 (BIS)
			 "pook_zsu_base", // SHILKA (rangemaster)
			 "pook_zsu_AA_base", // SHILKA
			 "ZSU_Base", // SHILKA (BIS)
			 "POOK_SON50_BASE", // AAA Fire Control radars
			 "POOK_SON9_BASE"
		],25000]; // 10km scan range

		// Get all targets that aren't already burning.
		{
			if (alive _x) then {
				_targets set [(count _targets), _x];
			};
		} forEach _seekerHits;

		if (count _targets > 0) then {_targetFound=1;};

	// Exit if no target is found; missile simply falls to ground
		if (_targetFound==0) exitWith {};

	// Deploy attack munition since a target was found.
		_targetToHit = _seekerHits select 0;

		if ((_missileLoiter distance _targetToHit) > 2000) then {
			_missileLoiter setPos (_targetToHit modelToWorld [0,0,2000]);
		};
	// create drop missile
		_dropMissile = "pook_ALARM_DROP" createVehicleLocal getPos _missileLoiter;
		_dropMissile setDir (getDir _missileLoiter);
		_dropMissile setPos (_missileLoiter modelToWorld [0,0,0]);
		_loiterVel = velocity _missileLoiter;
		deleteVehicle _missileLoiter;                
		_dropMissile setVelocity [(_loiterVel select 0),(_loiterVel select 1),(_loiterVel select 2)];

		_px = getPos _dropMissile select 0;
		_py = getPos _dropMissile select 1;
		_pz = getPos _dropMissile select 2;

	// Calculate direction
		_xoff = (getPos _targetToHit select 0) - _px;
		_yoff = (getPos _targetToHit select 1) - _py;
		_zoff = - _pz;
		_mag = sqrt(_xoff*_xoff + _yoff*_yoff + _zoff*_zoff);
		_dir = [_xoff/_mag, _yoff/_mag, _zoff/_mag];
		_dx = _dir select 0;
		_dy = _dir select 1;
		_dz = _dir select 2;
		_hmag = sqrt(_dx*_dx + _dy*_dy);
		_zcomp = -_dz/_hmag;
		_ux = _zcomp*_dx;
		_uy = _zcomp*_dy;
		_uz = _hmag;

		_dropMissile setVectorDir _dir;
		_dropMissile setVectorUp [_ux,_uy,_uz];
		_dropMissile setVelocity [(_dir select 0) * 300, (_dir select 1) * 300, (_dir select 2) * 300];

		while {alive _dropMissile} do {
			sleep 1;
			if ((getPos _dropMissile select 2) < 25) then {
				if ((_dropMissile distance _targetToHit) > 10) then {
					_dropMissile setPos (_targetToHit modelToWorld [0,0,10]);
					_dropMissile setVelocity [0,0,0];
					sleep 2;
					_boom = "pook_SAM_AAA_airburst12" createVehicleLocal position _targetToHit;
				};

			};
		};

	};

};

// Ensure fire criteria are met before launching missile
_ARMWepArray = [
	"EB_AGM45_LAUNCHER",
	"EB_AGM88_LAUNCHER",
	"EB_AGM122_LAUNCHER",
	"EB_KH25MP_LAUNCHER",
	"EB_KH15P_LAUNCHER",
	"EB_KH31_LAUNCHER",
	"EB_KH58_Launcher",
	"EB_KH59_Launcher",
	"POOK_ALARM_LAUNCHER"
];

if !(_weapon in _ARMWepArray) exitWith {_vehicle vehicleChat 'No AR Missile selected';};

_targetRadar = assignedTarget _vehicle;
if (isNull _targetRadar) exitWith {_vehicle vehicleChat 'No radar target selected';};

// _ARMTarget = "pook_ARMTarget" createVehicle position _targetRadar;
// _ARMTarget attachTo [_targetRadar, [0,0,0];

_vehicle setVariable ["ELS_Active", 1];  // establish ARM "active" setting for manual firing of ARM
publicVariable "ELS_Active";

// Target candidate passed criteria and is now a valid target
_type = toUpper (typeOf _targetRadar);

// Interpret radar type by root association
if ((_type) isKindof "POOK_SA3_RADAR_BASE") then {
	_reportType = "SA3";
};
if ((_type) isKindof "POOK_30N6E_BASE") then {
	_reportType = "SA10";
};
if ((_type) isKindof "POOK_9K37_BASE") then {
	_reportType = "SA11";
};
if ((_type) isKindof "POOK_9K37M2_BASE") then {
	_reportType = "SA11M1";
};
if ((_type) isKindof "POOK_9K317_BASE") then {
	_reportType = "SA17";
};
if ((_type) isKindof "POOK_9K317M2_BASE") then {
	_reportType = "SA17M1";
};
if ((_type) isKindof "POOK_9K331_BASE") then {
	_reportType = "SA15";
};
if ((_type) isKindof "POOK_9K332_BASE") then {
	_reportType = "SA15M";
};
if ((_type) isKindof "POOK_96K6_BASE") then {
	_reportType = "SA22";
};
if ((_type) isKindof "POOK_ANMPQ53") then {
	_reportType = "MIM104";
};
if ((_type) isKindof "POOK_ANMPQ64") then {
	_reportType = "NASAMS";
};
if ((_type) isKindof "POOK_NASAMS") then {
	_reportType = "NASAMSTRUCK";
};
if ((_type) isKindof "POOK_CRAM") then {
	_reportType = "CRAM";
};
if ((_type) isKindof "2S6M_TUNGUSKA") then {
	_reportType = "SA19";
};
if ((_type) isKindof "ZSU_BASE") then {
	_reportType = "ZSU";
};
if ((_type) isKindof "POOK_ZSU_BASE") then {
	_reportType = "ZSU";
};
if ((_type) isKindof "POOK_ZSU_AA_BASE") then {
	_reportType = "ZSU";
};
if ((_type) isKindof "POOK_SON50_BASE") then {
	_reportType = "SON50";
};
if ((_type) isKindof "POOK_SON9_BASE") then {
	_reportType = "SON9";
};

// Now derive friendly name of radar type for chat messages
switch (_reportType) do {
	case "SA3":{
		_radarType = "SNR-125 SA-3 Radar";
	};
	case "SA10":{
		_radarType = "30N6E SA-10 Radar";
	};
	case "SA11":{
		_radarType = "9S35 SA-11 Radar";
	};
	case "SA11M1":{
		_radarType = "9S35M1 SA-11 Radar";
	};
	case "SA17":{
		_radarType = "9S36 SA-17 Radar";
	};
	case "SA17M1":{
		_radarType = "9S36M1 SA-17 Radar";
	};
	case "SA15":{
		_radarType = "M1 SA-15 Radar";
	};
	case "SA15M":{
		_radarType = "M2E SA-15 Radar";
	};
	case "SA22":{
		_radarType = "1RS2-1 SA-22 Radar";
	};
	case "MIM104":{
		_radarType = "AN/MPQ-53 MIM-104 Radar";
	};
	case "NASAMS":{
		_radarType = "AN/MPQ-64 NASAMS Radar";
	};
	case "NASAMSTRUCK":{
		_radarType = "NASAMS Radar";
	};
	case "CRAM":{
		_radarType = "CIWS C-RAM Radar";
	};
	case "SA19":{
		_radarType = "1RL-144 SA-19 Radar";
	};
	case "ZSU":{
		_radarType = "RPK-2 ZSU-23-4 Radar";
	};
	case "SON9":{
		_radarType = "SON-9 AAA Radar";
	};
	case "SON50":{
		_radarType = "SON-50 AAA Radar";
	};
};


// Fire ARM missile!
_vehicle groupChat format ["MAGNUM - Engaging %2 located at grid %1",mapGridPosition _targetRadar,_radarType];
leader _vehicle sideRadio "RadioMsgStatic";
//_vehicle fireAtTarget [_ARMTarget,_weapon];
_vehicle fireAtTarget [_targetRadar,_weapon]; // is there a way to lock on aka GBU target?

TARGETMARKER1 = createMarker ["ARM_Target", [(position _targetRadar select 0), (position _targetRadar select 1)]];
TARGETMARKER1 setMarkerShape "ICON";
"ARM_Target" setMarkerType "AntiAir";
"ARM_Target" setMarkerColor "ColorOrange";
"ARM_Target" setMarkerText "RADAR TARGET";

sleep 5;
// reset ARM Emitter Locating System "active" setting
// ARM indirect mode and "detect" is now available once again
_vehicle setVariable ["ELS_Active", 0];
publicVariable "ELS_Active";

sleep 60;
deleteMarker "ARM_Target";

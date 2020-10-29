//format: 0=time in secs, 1= bombtype (1=chemstrike, 2=bomb, 3=nuke), 2= position of cult

_initialtime = _this select 0;
_time = _this select 0;
_tpos = _this select 1;

if (_initialtime == 420) then {hint "Extermination: You have 7 minutes\nSpare nobody to eliminate the WMD threat!"};
if (_initialtime == 600) then {hint "Extermination: You have 10 minutes\nSpare nobody to eliminate the WMD threat!"};
if (_initialtime == 780) then {hint "Extermination: You have 13 minutes\nSpare nobody to eliminate the WMD threat!"};
//wait 5;

while {_time >= 0} do
{
	sleep 1.00;
	if (_time == 540) then {hint "WARNING: Agent reports frantic activity - You have only nine minutes left to eliminate the threat!"};
	if (_time == 240) then {hint "WARNING: Agent is down! Four minutes left to eliminate the cult!"};
	if (_time == 120) then {hint "WARNING: In two minutes the freaks are going to blow you all to shit!"};
	if (_time == 60) then {hint "WARNING: They have armed the device - 60 seconds to doomsday! Kill them all NOW!"};

	if (_time <= 0) then
	{
		hint "EXTRM: Mission Failed\nWMD exploded!";
		Groundzero = createVehicle ["HeliHEmpty",_tpos, [], 0, "NONE"];
		if (_initialtime == 420) then
		{
			_k = createVehicle ["Bo_GBU12_LGB",[(position Groundzero select 0), (position Groundzero select 1)-50,50], [], 0, "NONE"];
			sleep 10;
		};
		if (_initialtime == 600) then
		{
			_crate1 = "#particlesource" createVehicleLocal position Groundzero;
			_crate2 = "#particlesource" createVehicleLocal position Groundzero;
			_crate3 = "#particlesource" createVehicleLocal position Groundzero;
			_crate3b = "#particlesource" createVehicleLocal position Groundzero;
			_crate3c = "#particlesource" createVehicleLocal position Groundzero;

			_crate1 setParticleCircle [0, [1, 0, 0]];
			_crate1 setParticleRandom [0, [0.25, 0.25, 0], [30.175, 30.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [25, 50, 4], [[0.1, 0.3, 0.1, 0.2], [0, 0.3, 0, 0.1], [0, 0.3, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 4.0;
		_objs = nearestObjects [_tpos, ["Man","Car","Tank"], 150];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		sleep 10.0;
		};
		if (_initialtime == 780) then
		{
			nul = execVM "nuke\nuke.sqf";
			processInitCommands;
		};

//	if (_initialtime != 420 && _initialtime != 600 && _initialtime != 780) then {hint "initialtime error"};
		processInitCommands;
		sleep 10.0;
		BIS_EVO_Onmission=false;
	};

	if (not BIS_EVO_Onmission) then {_time = 0};
	_time = _time - 1;
};
deleteVehicle Groundzero;
exit

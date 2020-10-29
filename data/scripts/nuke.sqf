//shroom

_base = _this select 0;
_type = _this select 1;
_crate1 = "#particlesource" createVehicleLocal position _base;
_crate2 = "#particlesource" createVehicleLocal position _base;
_crate3 = "#particlesource" createVehicleLocal position _base;
_crate3b = "#particlesource" createVehicleLocal position _base;
_crate3c = "#particlesource" createVehicleLocal position _base;
switch (_type) do
{
	case 1: //extermination mission gas bomb
	{
		_crate1 setParticleCircle [0, [1, 0, 0]];
		_crate1 setParticleRandom [0, [0.25, 0.25, 0], [30.175, 30.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [25, 50, 4], [[0.1, 0.3, 0.1, 0.2], [0, 0.3, 0, 0.1], [0, 0.3, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 4.0;
		_objs = nearestObjects [_base, ["Man","Car","Tank"], 150];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
//		sleep 120.0;
		sleep 10.0;

	};

	case 2:  //extermination mission large bomb
	{
		_i = 0;
		while {_i < 10} do 
		{
			_k = createVehicle ["Bo_GBU12_LGB",[(position _base select 0), (position _base select 1),50], [], 200, "NONE"];
			_i = _i + 1;
			sleep 0.1;			
		};
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 150];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
	};

	case 3:  //extermination mission nuke bomb
	{
		_pos = position _base;
		_nuke = "Barrel4" createVehicleLocal _pos;
		_nuke setpos [_pos select 0,_pos select 1,(_pos select 2)+2000];
		
		//missile
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 3.75], 0, 11, 6.9, 0.075, [1, 2, 0.5], [[0.2, 0.2, 1, 1], [0.0, 0.0, 1, 0.5]], [0.08], 1, 0, "", "", _nuke];
		_crate3b setDropInterval 0.001;
		sleep 5;
//		sleep 25;

		//First dome
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [70.25, 70.25, 0], [10.175, 10.175, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 4, 8], "", "Billboard", 1, 2.5, [0, 0, 0], [0, 0, -20], 0, 88, 24.9, 0.075, [100], [[1, 1, 1, 1], [1, 1, 1, 0.7], [1, 1, 1, 0], [1, 1, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		_crate3b setDropInterval 0.003;	
		//sleep 2.0;

		_i = -20;		
		while {_i <= 200} do
		{
			if(_i == 0) then 
			{		
				if(player distance _nuke < 1000) then
				{
					0 fadeSound 0;
					0 fadeRadio 0;
					titleCut ["","WHITE OUT", 0];
					sleep 2.0;
					titleCut ["","WHITE IN", 0];
					5 fadeSound 0.5;
					5 fadeRadio 0.5;
				};
			};
			//_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, -100], [0, 0, _i], 0, 0.5, 3.0, 0.075, [2, 10, 200], [[1, 0, 0, 0.5], [1, 1, 1, 0.2], [0, 0, 1, 0]], [0.08, 0.08, 0.08], 2, 0, "", "", XXXOBJECTXXX];
			_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, _i], [0, 0, 4], 0, 88, 24.9, 0.075, [400], [[1, 1, 1, 1], [1, 1, 1, 0.7], [0, 0, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
			sleep 0.001;

		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 25];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 50];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 75];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 100];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","House","Strategic","NonStrategic"], 150];{if(not (_x isKindOf "Land_radar")) then {_x setdamage 1}} forEach _objs;
		
			_i = _i +1;
			
			if(_i == 100) then 
			{
				//Light stalk
				_crate2 setParticleCircle [10, [0, 0, 0]];
				_crate2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1 , 1, 1], [1, 1, 1, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				_crate2 setDropInterval 0.01;				
			};
			
			//hint format["%1",_i];
		};
		
		
		// rings
		_crate3 setParticleCircle [0, [0, 0, 0]];
		_crate3 setParticleRandom [0, [0.25, 0.25, 0], [80.175, 80.175, 0], 0, 0.25, [0.3, 0.3, 0, 0.9], 0, 0];
		_crate3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[1, 1, 1, 0], [1, 1, 1, 0], [1, 1, 1, 0], [0, 0, 1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3 setDropInterval 0.001;	
		sleep 1;
		//stalk to orange
		_crate2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		sleep 5;
		//rings to orange
		_crate3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		//top to orange
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 6.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [400], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		//Dark stalk
		_crate3c setParticleCircle [10, [0, 0, 0]];
		_crate3c setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3c setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1, 1, 1], [0, 0, 0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3c setDropInterval 0.02;
		sleep 8;
		//Topplum
		_crate1 setParticleCircle [0, [0, 0, 0]];
                _crate1 setParticleRandom [0, [10.25, 10.25, 0], [60.0, 60.0, -3], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 300], [0, 0, 0], 0, 8.7, 2.1, 0.075, [5, 10, 5], [[0.1, 0.1, 0.1, 0.4], [0.5, 0.5, 0.5, 0.2], [0.9, 0.9, 0.9, 0]], [0.01, 0.01, 0.01], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.003;	
		//top big
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [50], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 0.5], [0.3, 0.3, 0.1, 0.2], [1, 1, 0.1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
//		sleep 120.0;
		sleep 30.0;
	};
	 case 4:
	{
		//napalm
		_crate1 setParticleCircle [0, [0, 0, 0]];	
		_crate1 setParticleRandom [0, [50.25, 50.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\Cl_fire", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1.2, 6, 4, 7], [[1, 1, 1, 1], [0, 0, 0, 0.5], [0.1, 0.1, 0.1, 0.5], [0.1, 0.1, 0.1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 120.0;
	};
	 case 5:
	{
	
		//gas
		_crate1 setParticleCircle [0, [1, 0, 0]];
		_crate1 setParticleRandom [0, [0.25, 0.25, 0], [30.175, 30.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [25, 50, 4], [[0.1, 0.3, 0.1, 0.2], [0, 0.3, 0, 0.1], [0, 0.3, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 120.0;
	};
	 case 6:
	{
		
		_pos = position _base;
		_nuke = "Barrel4" createVehicleLocal _pos;
		_nuke setpos [_pos select 0,_pos select 1,(_pos select 2)+2000];
		
		
		//missile
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 3.75], 0, 11, 6.9, 0.075, [1, 2, 0.5], [[0.2, 0.2, 1, 1], [0.0, 0.0, 1, 0.5]], [0.08], 1, 0, "", "", _nuke];
		_crate3b setDropInterval 0.001;
		sleep 25;

		//First dome
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [70.25, 70.25, 0], [10.175, 10.175, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 4, 8], "", "Billboard", 1, 2.5, [0, 0, 0], [0, 0, -20], 0, 88, 24.9, 0.075, [100], [[1, 1, 1, 1], [1, 1, 1, 0.7], [1, 1, 1, 0], [1, 1, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		_crate3b setDropInterval 0.003;	
		//sleep 2.0;
		
		_i = -20;		
		while {_i <= 200} do
		{
			if(_i == 0) then 
			{		
				if(player distance _nuke < 1000) then
				{
					0 fadeSound 0;
					0 fadeRadio 0;
					titleCut ["","WHITE OUT", 0];
					sleep 2.0;
					titleCut ["","WHITE IN", 0];
					5 fadeSound 0.5;
					5 fadeRadio 0.5;
				};
			};
			_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, _i], [0, 0, 4], 0, 88, 24.9, 0.075, [400], [[1, 1, 1, 1], [1, 1, 1, 0.7], [0, 0, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
			sleep 0.001;
			_i = _i +1;
			
			if(_i == 100) then 
			{
				//Light stalk
				_crate2 setParticleCircle [10, [0, 0, 0]];
				_crate2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1 , 1, 1], [1, 1, 1, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				_crate2 setDropInterval 0.01;				
			};
			
		};
		
		
		// rings
		_crate3 setParticleCircle [0, [0, 0, 0]];
		_crate3 setParticleRandom [0, [0.25, 0.25, 0], [80.175, 80.175, 0], 0, 0.25, [0.3, 0.3, 0, 0.9], 0, 0];
		_crate3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[1, 1, 1, 0], [1, 1, 1, 0], [1, 1, 1, 0], [0, 0, 1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3 setDropInterval 0.001;	
		sleep 1;
		//stalk to orange
		_crate2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		sleep 5;
		//rings to orange
		_crate3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 2.5, [0, 0, 110], [0, 0, 0], 0, 8.8, 6.9, 0.075, [10, 5, 1], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0.3, 0.1, 0, 1], [0, 0, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		//top to orange
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 6.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [400], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		//Dark stalk
		_crate3c setParticleCircle [10, [0, 0, 0]];
		_crate3c setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3c setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1, 1, 1], [0, 0, 0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3c setDropInterval 0.02;
		sleep 8;
		//Topplum
		_crate1 setParticleCircle [0, [0, 0, 0]];
                _crate1 setParticleRandom [0, [10.25, 10.25, 0], [60.0, 60.0, -3], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 300], [0, 0, 0], 0, 8.7, 2.1, 0.075, [5, 10, 5], [[0.1, 0.1, 0.1, 0.4], [0.5, 0.5, 0.5, 0.2], [0.9, 0.9, 0.9, 0]], [0.01, 0.01, 0.01], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.003;	
		//top big
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [50], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 0.5], [0.3, 0.3, 0.1, 0.2], [1, 1, 0.1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		sleep 120.0;
	};
	 case 7:
	{

		//stem
		//kouleSvetlo
		_crate1 setParticleCircle [0, [0, 0, 0]];
		_crate1 setParticleRandom [0, [20.25, 20.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 8], "", "Billboard", 1, 12.5, [0, 0, 0], [0, 0, 0.6], 0, 10.2, 7.9, 0.075, [1.2, 2, 4], [[1, 1, 1, 0.1], [1, 1, 1, 0.1], [1, 1, 1, 0.4]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 120.0;
	};
	 case 8:
	{
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
		{
			_i = 0;
			 while {_i < 3} do
			 {
				_crate1 setParticleCircle [0, [0, 0, 0]];
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.9, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				_crate1 setDropInterval 0.01;
				sleep 1.0;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 10.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.9, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [10.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];

				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 10.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];		
				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [10.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\FireAnim.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [0, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];		
				sleep 0.5;
				_i = _i +1;
			};
		};
	};	
};

deletevehicle _crate1;
deletevehicle _crate2;
deletevehicle _crate3;
deletevehicle _crate3c;
sleep 10;
deletevehicle _crate3b;
deletevehicle _base;

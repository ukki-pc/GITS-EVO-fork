/*	ac130_createParticleSource.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_shell setVelocity _vel;

if (LDL_showParticles) then
{	
	//Flash
	if (_weapon != 0) then
	{
		for [{_i = 1},{_i < 3 + random 2},{_i = _i + 1}] do 
		{
			drop [["\ca\Data\ParticleEffects\Universal\Universal",16,2,32],
			"", "Billboard", 1,(0.12 + 0.015*_i), 
			//[-0.5 + random 1, -0.5 + random 1, -0.5 + random 1],
			_position,
			[2.5, 2.5, 2.5], 
			0, 10, 7.9, 0.075, 
			[2, _i], 
			[[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
			[3 + random 2], 1, 0, "", "", ""];
		};
	};
	
	//Smoke
	_j = 8;
	_color = [[0.6,0.6,0.6,0],[0.7,0.7,0.7,0.8],[0.7,0.7,0.7,0.7],[0.8,0.8,0.8,0.35],[0.9,0.9,0.9,0.15], [1,1,1,0]];
	
	if(_weapon == 0) then
	{
		_j = 0;
		_color = [[0.6,0.6,0.6,0],[0.7,0.7,0.7,0.8],[0.7,0.7,0.7,0.3],[0.8,0.8,0.8,0.35],[0.9,0.9,0.9,0.15], [1,1,1,0]];
	};
	
	for [{_i = 1},{_i < _j + random 4},{_i = _i + 1}] do 
	{
		drop [["\ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48],
		"", "Billboard", 1, 4+random 2,
		_position,
		[random 1 - 1, _i, random 1 - 1],
		1, 1, 0.80, 0.4, 
		[2,(3+random 2)*_i],
		_color,
		[2,0.7,0.5],0.1,0.1,"","", ""];
	};
	
	//Tracer
	_color = [[1,0.5,0.1,0.2],[1,0.5,0.1,0],[1,0.5,0.1,0]];
	_size = [1];
	_weight = 80.0;
	_volume = 0.005;
	_rubbing = 0.001;

	if (_weapon == 0) then
	{
		_size = [0.5];
		_tracer = "#particlesource" createVehicleLocal getPos _shell;
		_tracer setParticleParams ["\ca\data\koulesvetlo","","Billboard",100,0.2,[0,0,0],[0,0,0],0,_weight,_volume,_rubbing,_size,_color,[0],0,0,"","", _shell];
		_tracer setDropInterval 0.001;
	}
	else
	{
		_tracer = "#particlesource" createVehicleLocal getPos _shell;
		_tracer setParticleParams ["\ca\data\koulesvetlo","","Billboard",100,0.2,[0,0,0],[0,0,0],0,_weight,_volume,_rubbing,_size,_color,[0],0,0,"","", _shell];
		_tracer setDropInterval 0.001;
		
		_smoketrail = "#particlesource" createVehicleLocal getPos _shell;
		_smoketrail setParticleParams ["\ca\data\missileSmoke","","Billboard",100,0.5,[0,0,0],[0,0,0],0,0.6,0.5,0.05,[1,2.5,3,3.5],[[1,1,1,0.05],[1,1,1,0.05],[0,0,0,0]],[0],0,0,"","",_shell];				
		_smoketrail setDropInterval 0.002;
	};
	
	sleep 0.05;
	
	//Light
	if(daytime > 20 || daytime < 6) then
	{
		_light = "#lightpoint" createVehicleLocal _position;
		if (_weapon == 0) then
		{
			_light setLightBrightness 0.2;
		}
		else
		{
			_light setLightBrightness 0.4;
		};
		_light setLightAmbient[0.0, 0.0, 0.0];
		_light setLightColor[1.0, 0.5, 0.0];
		_light lightAttachObject [_shell, [0,0,0]]; 
		
		waitUntil{(!alive _shell)};
		
		if(_weapon == 0) then
		{
			sleep 1;
		}
		else
		{
			sleep 1 + random 2;
		};
		
		deleteVehicle _light;	
	};
};
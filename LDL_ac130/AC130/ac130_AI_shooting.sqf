/*	ac130_AI_shooting.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_id","_shoot","_targets","_target","_getWeapon","_i"];

_id = LDL_foreignScriptIdentifier;

waitUntil {sleep 0.1; (LDL_ac130_active)};

LDL_logic = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0, 0, 0], [], 0, ""];

LDL_marker = createMarkerLocal ["Marker", [0,0,0]];
LDL_marker setMarkerShapeLocal "ICON";
LDL_marker setMarkerSizeLocal [0.7, 0.7];
LDL_marker setMarkerTypeLocal "Destroy";	
LDL_marker setMarkerTextLocal "AC-130 Target";	

_shoot =
{
	private ["_target","_weapon","_dif","_angles","_dirh","_dirv","_i"];
	
	_target = _this select 0;
	_weapon = _this select 1;
	
	_dif = LDL_logic distance _target;
		
	if(_dif < 4000) then
	{
		sleep (_dif/200);	
	};
	
	if (typeName _target == "ARRAY") then
	{
		LDL_logic setPos _target;
	}
	else
	{
		LDL_logic setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+3];
	};
	
	_target = LDL_logic;
	
	LDL_marker setMarkerPosLocal getPos LDL_logic;
	
	_angles = [LDL_gunPosition,_target]call LDL_getObjectAngles;
	_dirh = [_angles select 0]call LDL_normalizeAngle;
	_dirv = [_angles select 1]call LDL_normalizeAngle;
	
	if (!((LDL_weaponSlots select _weapon)select 3)) then
	{
		switch (_weapon) do
		{
			case 0:
			{
				//25mm
				for [{_i = 0;},{_i < 15 + random 10},{_i = _i + 1;}] do 
				{
					[_dirh,_dirv,0,getPos LDL_gunPosition]spawn LDL_calculateBullet;
					sleep 0.075;
					_angles = [LDL_gunPosition,_target]call LDL_getObjectAngles;
					_dirh = [_angles select 0]call LDL_normalizeAngle;
					_dirv = [_angles select 1]call LDL_normalizeAngle;
				};
			};
			
			case 1:
			{						
				//40mm
				for [{_i = 0;},{_i < 1 + random 2},{_i = _i + 1;}] do 
				{
					[_dirh,_dirv,1,getPos LDL_gunPosition]spawn LDL_calculateBullet;
					sleep 0.5;
					_angles = [LDL_gunPosition,_target]call LDL_getObjectAngles;
					_dirh = [_angles select 0]call LDL_normalizeAngle;
					_dirv = [_angles select 1]call LDL_normalizeAngle;
				};			
			};
			
			case 2:
			{						
				//105mm
				[_dirh,_dirv,2,getPos LDL_gunPosition]spawn LDL_calculateBullet;
				sleep 3.5;	
			};
		};
	};
};

_getWeapon =
{
	private["_target", "_weapon"];
	
	_target = _this select 0;
	
	if (typeName _target == "ARRAY") then
	{
		_weapon = 2;
	}
	else
	{
		if(_target isKindOf "LandVehicle" || _target isKindOf "Ship") then
		{
			_weapon = round(random  1)+1; //40mm or 105mm
		}
		else
		{
			_weapon = round(random  1); //25mm or 40mm
		};
	};
	
	_weapon;
};

while {alive LDL_ac130_plane && alive player && !LDL_ac130_abort && LDL_ac130_active} do
{
	sleep 1;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	if(LDL_AI_targetAssigned) then
	{
		//Assigned targets by player	
		if (typeName LDL_fixPos == "ARRAY") then
		{
			[LDL_fixPos, 2]call _shoot;
		}
		else
		{
			_i = 0;
			while{alive LDL_fixPos && _i < 3 && typeName LDL_fixPos == "OBJECT"} do
			{
				sleep 1;
				[LDL_fixPos, [LDL_fixPos]call _getWeapon]call _shoot;
				_i = _i + 1;
			};
		};
		
		LDL_AI_targetAssigned = false;
	}
	else
	{
		if(count LDL_AI_targets > 0) then
		{
			//Assigned targets by script
			_target = LDL_AI_targets select 0;

			_i = 0;
			while{alive _target && _i < 3} do
			{
				sleep 1;
				[_target, [_target]call _getWeapon]call _shoot;
				_i = _i + 1;
			};

			LDL_AI_targets = LDL_AI_targets - [_target];
		}
		else
		{
			if(!LDL_AI_ceaseFire) then
			{
				//Search for targets
				_targets = nearestObjects [getPos LDL_cam_rotating_center, ["LandVehicle","Air","Ship", "Man"], LDL_cam_rotating_radius-50];
				{
					
					if(side _x == (LDL_Adjustments select 11) || side _x == civilian) then {_targets = _targets - [_x]};
					
				} forEach _targets;
				
				_target = _targets select 0;
				
				if(count _targets > 0) then
				{
					[_target, [_target]call _getWeapon]call _shoot;
				};	
			};	
		};
	};
};

LDL_AI_targets = [];
deleteMarkerLocal "Marker";
deleteVehicle LDL_logic;
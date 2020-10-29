/*	uav_guns.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_display", "_weapon", "_i", "_hellfire", "_pos", "_spawn", "_target"];

disableSerialization;

waitUntil {sleep 0.1;(LDL_ac130_active)};

_display = (finddisplay  1000);
_weapon = LDL_equippedWeapon;

if ((!((LDL_weaponSlots select _weapon)select 3)) && (((LDL_weaponSlots select _weapon)select 2) > 0)) then
{
	(LDL_weaponSlots select _weapon) set [3, true]; 
	LDL_fired = false;

	switch (_weapon) do
	{
		//Mounted Hellfire
		case 0:
		{
			sleep 0.1;
			LDL_ac130_plane action ["useWeapon",LDL_ac130_plane,gunner LDL_ac130_plane,1];
			
			_hellfire = position LDL_ac130_plane nearestObject "M_Hellfire_AT";
			
			if (isNil "mando_missile_init_done") then
			{
				//MMA NOT present
				sleep 2;
			
				playSound "LDL_beep_short";
				sleep 0.1;
				playSound "LDL_beep_short";
				
				_pos = getPos _hellfire;
				deleteVehicle _hellfire;
				
				[LDL_logic_object,[0,0,0],_pos,1,"Sh_125_HE",0.1]spawn LDL_hellfire;	
			}
			else
			{
				//MMA present
				sleep 2;
			
				playSound "LDL_beep_short";
				sleep 0.1;
				playSound "LDL_beep_short";
				
				[_hellfire, LDL_logic_object, LDL_ac130_plane] execVM "LDL_ac130\Misc\mando_hellfire.sqf";
			};
			
			(LDL_weaponSlots select 0) set [2, ((LDL_weaponSlots select 0)select 2)-1]; 
		};	
		
		//Hellfire Strike
		case 1:
		{
			[]spawn
			{
				private["_i"];

				_i = 2;
				
				while{LDL_mouseButtons select 0 && LDL_equippedWeapon == 1 && !LDL_fired} do
				{
					playSound "LDL_beep_short"; 
					sleep (1/_i);	
					_i = _i + 1;
					if(LDL_fired) exitWith{};
				};
			};
			
			_i = 3;
			
			while{LDL_mouseButtons select 0 && LDL_equippedWeapon == 1 && _i < 14} do
			{
				(_display displayCtrl 1026) ctrlSetPosition [SafeZoneX + SafeZoneW/2 - SafeZoneW/(_i*2), SafeZoneY + SafeZoneH/2 - SafeZoneH/(_i*2), SafeZoneW/_i, SafeZoneH/_i];
				(_display displayCtrl 1026) ctrlCommit 0;
				sleep 0.01/_i;
				_i = _i + 0.1;
			};
			
			if(_i >= 14) then
			{
				LDL_fired = true;
			
				_pos = screenToWorld[0.5,0.5];
				
				[_pos]spawn
				{
					private["_display", "_pos"];
					
					disableSerialization;

					_display = (finddisplay  1000);
					_pos = _this select 0;
					
					while{((LDL_weaponSlots select 1) select 3)} do
					{
						sleep 0.01;
						(_display displayCtrl 1026) ctrlSetPosition [((worldToScreen _pos) select 0) - SafeZoneW/(28), ((worldToScreen _pos) select 1) - SafeZoneH/(28), SafeZoneW/14, SafeZoneH/14];
						(_display displayCtrl 1026) ctrlCommit 0;				
					};
					
					(_display displayCtrl 1026) ctrlSetPosition [-1, -1, SafeZoneW/4, SafeZoneH/4];
					(_display displayCtrl 1026) ctrlCommit 0;	
				};
				
				_spawn = [_pos, 500, 180]call LDL_getCirclePosition;
				
				if (isNil "mando_missile_init_done") then
				{
					//MMA NOT present
					sleep 3;
					
					[_pos,[0,0,-5],[_spawn select 0, _spawn select 1, 500],3,"Sh_125_HE",0.1]spawn LDL_hellfire;
				}
				else
				{
					//MMA present
					_target = (createGroup (createCenter sideLogic)) createUnit ["LOGIC", [0,0,0], [], 0, ""];
					_target setPos _pos;
					
					sleep 3;
					
					for [{_i = 0;},{_i < 3;},{_i = _i + 1;}] do 
					{
						_hellfire = "M_Hellfire_AT" createVehicle [_spawn select 0, _spawn select 1, 700];
						[_hellfire, _target, LDL_ac130_plane] execVM "LDL_ac130\Misc\mando_hellfire.sqf";
						sleep 1;	
					};
				};
				
				(LDL_weaponSlots select 1) set [2, ((LDL_weaponSlots select 1)select 2)-1]; 
								
				sleep 10;
				
				deleteVehicle _target;
			}
			else
			{
					(_display displayCtrl 1026) ctrlSetPosition [-1, -1, SafeZoneW/4, SafeZoneH/4];
					(_display displayCtrl 1026) ctrlCommit 0;	
			};		
		};
	};
	
	(LDL_weaponSlots select _weapon) set [3, false]; 
};
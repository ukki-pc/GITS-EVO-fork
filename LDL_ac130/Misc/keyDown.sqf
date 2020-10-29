/*	keyDown.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private ["_dikCode","_objects"];
	
_dikCode = _this select 0;

//Flight Axis
if (_dikCode == 200) then
{
	//Up
	if(LDL_plane_type == "AC130_LITE") then
	{
		LDL_cam_set_dirv = LDL_cam_dirv + 0.3;
	}
	else
	{
		LDL_cam_rotating_set_height = (LDL_cam_rotating_set_height + 3) min 5000;
	};
};

if (_dikCode == 208) then
{
	//Down
	if(LDL_plane_type == "AC130_LITE") then
	{
		LDL_cam_set_dirv = LDL_cam_dirv - 0.3;
	}
	else
	{
		LDL_cam_rotating_set_height = (LDL_cam_rotating_set_height - 3) max 100; 
	};
};

if (_dikCode == 203) then
{
	//Left
	if(LDL_plane_type == "AC130_LITE") then
	{
		LDL_cam_set_dirh = LDL_cam_dirh - 0.3;
	}
	else
	{
		LDL_cam_rotating_set_radius = (LDL_cam_rotating_set_radius - 3) max 500;
	}; 
};

if (_dikCode == 205) then
{
	//Right
	if(LDL_plane_type == "AC130_LITE") then
	{
		LDL_cam_set_dirh = LDL_cam_dirh + 0.3;
	}
	else
	{
		LDL_cam_rotating_set_radius = (LDL_cam_rotating_set_radius + 3) min 5000; 
	};
};

//Misc
if(_dikCode == 29) then
{
	//Strg pressed
	if(!LDL_dlg_strg_pressed) then
	{
		LDL_dlg_strg_pressed = true;
		LDL_dlg_mouseCtrlPos = LDL_mousePosition;		
	};
};

if (_dikCode == 19) then
{
	//R pressed
};

if (_dikCode == 35) then
{
	//H pressed
        if(ctrlShown ((findDisplay 1000) displayctrl (600))) then
        {
            ctrlShow [600, false];
        }
        else
        {
            ctrlShow [600, true];
        }
};

if (_dikCode == 46) then
{
	//C pressed
};

if (_dikCode == 28 && LDL_dlg_display == "Map") then
{
	//ENTER pressed
        []call LDL_changeParameters;
};

if (_dikCode == 42) then
{
	//Shift pressed	
	if (LDL_fixCam) then 
	{
		LDL_fixCam = false;
	}
	else
	{
		_objects = (nearestObjects [screenToWorld[0.5,0.5], ["LandVehicle","Air","Ship"], 5]);

		if(count _objects > 0) then
		{
			LDL_fixPos = (_objects select 0);
			//[format["%1", getText (configFile/"CfgVehicles"/(typeOf LDL_fixPos)/"displayName")], true]spawn LDL_ac130_warning;
		}
		else
		{
			LDL_fixPos = screenToWorld[0.5,0.5];
		};
		LDL_fixCam = true;
	};
};

if (_dikCode == 49) then
{
	//N pressed		
        if(LDL_cameraEffect + 1 <= 4) then
	{
		LDL_cameraEffect = LDL_cameraEffect + 1;
		if(LDL_cameraEffect == 3 && !((isClass(configFile>>"CfgMods">>"Expansion")))) then
		{
			LDL_cameraEffect = 4;
		};
	}
	else
	{
		LDL_cameraEffect = 1;
	};
	[]call LDL_createCamEffects;
};

if (_dikCode == 50) then
{
	//M pressed		
	LDL_dlg_display = "Map";
	[]call LDL_dlg_changeDisplay;	
};

if (_dikCode == 59) then
{
	//F1
        if(ctrlShown ((findDisplay 1000) displayctrl (600))) then
        {
            ctrlShow [600, false];
        }
        else
        {
            ctrlShow [600, true];
        }
};

if (_dikCode == 60 && LDL_plane_type != "AC130_LITE" && LDL_plane_type != "AC130_COOP") then
{
	//F2
	[]call LDL_changeView;
};

if (_dikCode == 61) then
{
	//F3 pressed
	//Enable: (LDL_Adjustments select 0) set [0, true];
	//Show: (LDL_Adjustments select 0) set [1, true];
	if(LDL_enableStrobes) then
	{
		if (LDL_showStrobes) then 
		{
			LDL_showStrobes = false;
		}
		else
		{
			LDL_showStrobes = true;
		};
	};	
};

if (_dikCode == 62) then
{
	//F4 pressed
	//Enable: (LDL_Adjustments select 1) set [0, true];
	//Show: (LDL_Adjustments select 1) set [1, true];
	if(LDL_enableVehicles) then
	{
		if (LDL_showVehicles) then 
		{
			LDL_showVehicles = false;
		}
		else
		{
			LDL_showVehicles = true;
		};
	};
};

if (_dikCode == 67) then
{
	//F9 pressed
	//Show: LDL_Adjustments set [9, true];
	if (LDL_showWaypoints) then 
	{
		LDL_showWaypoints = false;
	}
	else
	{
		LDL_showWaypoints = true;
	};
};

if (_dikCode == 68) then
{
	//F10 pressed
	//On: LDL_Adjustments set [5, true];
	if (LDL_enableSound) then 
	{
		LDL_enableSound = false;
	}
	else
	{
		LDL_enableSound = true;
	};
};

//Weapons
if (_dikCode == 41) then
{
	//^ pressed
	[-1]call LDL_switchWeapon
};

if(_dikCode >= 2 && _dikCode <= 10) then
{
	//1-9 pressed
	[_dikCode-2]call LDL_switchWeapon;	
};

if(_dikCode == 11) then
{
	//0 pressed
	[-1]call LDL_switchWeapon;	
};

//Camera Modes					
if (_dikCode == 63) then
{
	//F5 pressed
	//No view mode
	LDL_cameraEffect = 1;
	[]call LDL_createCamEffects;	
};

if (_dikCode == 64) then
{
	//F6 pressed
	//FLIR
	if(LDL_cameraEffect != 2 && LDL_cameraEffect != 3) then
	{
		LDL_cameraEffect = 2;
		[]call LDL_createCamEffects;	
	}
	else
	{
		if(LDL_cameraEffect == 2 && ((isClass(configFile>>"CfgMods">>"Expansion")))) then
		{
			LDL_cameraEffect = 3;
			[]call LDL_createCamEffects;	
		}
		else
		{
			LDL_cameraEffect = 1;
			[]call LDL_createCamEffects;	
		};
	};	
};

if (_dikCode == 65) then
{
	//F7 pressed
	//NVG
	if(LDL_cameraEffect != 4) then
	{
		LDL_cameraEffect = 4;
		[]call LDL_createCamEffects;	
	}
	else
	{
		LDL_cameraEffect = 1;
		[]call LDL_createCamEffects;	
	};	
};

if (_dikCode == 66) then
{
	//F8 pressed
	//Change mode
	if(LDL_cameraEffect + 1 <= 4) then
	{
		LDL_cameraEffect = LDL_cameraEffect + 1;
		if(LDL_cameraEffect == 3 && !((isClass(configFile>>"CfgMods">>"Expansion")))) then
		{
			LDL_cameraEffect = 4;
		};
	}
	else
	{
		LDL_cameraEffect = 1;
	};
	[]call LDL_createCamEffects;		
};
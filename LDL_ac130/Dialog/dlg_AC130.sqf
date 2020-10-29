/*	dlg_AC130.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private ["_display","_id","_difh","_difv","_x","_y","_w","_h","_screen","_structured","_infos","_color","_size","_i","_j"];

disableSerialization;

_display = (finddisplay 1000);
_id = _this select 0;

[true, 200, 217]call LDL_dlg_show;
ctrlShow [215, false];

if(LDL_plane_type == "AC130_ATTACH") then
{
	ctrlShow [210, false];	
	ctrlShow [211, false];	
};

//Button Events
[]call LDL_dlg_buttonInit;
[]call LDL_dlg_buttonInit_top;

//Buttons Left Side
ctrlSetText [105, "FLIR W"];
LDL_dlg_button_events set[105, 
{	
	LDL_cameraEffect = 2;
	[]call LDL_createCamEffects;
}];
ctrlSetText [106, "FLIR B"];
LDL_dlg_button_events set[106, 
{	
	LDL_cameraEffect = 3;
	[]call LDL_createCamEffects;
}];
ctrlSetText [107, "NVG"];
LDL_dlg_button_events set[107, 
{	
	LDL_cameraEffect = 4;
	[]call LDL_createCamEffects;
}];
ctrlSetText [108, "OFF"];
LDL_dlg_button_events set[108, 
{	
	LDL_cameraEffect = 1;
	[]call LDL_createCamEffects;
}];	

//Buttons Right Side
ctrlSetText [110, "IR-S"];
LDL_dlg_button_events set[110, 
{	
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
}];

ctrlSetText [111, "Veh-Det"];
LDL_dlg_button_events set[111, 
{	
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
}];

ctrlSetText [112, "Sound"];
LDL_dlg_button_events set[112, 
{	
	if (LDL_enableSound) then 
	{
		LDL_enableSound = false;
	}
	else
	{
		LDL_enableSound = true;
	};
}];

setMousePosition LDL_mouseOrigin;

while{LDL_dlg_display == "AC130"} do
{
	sleep 0.005;
	
	if(_id != LDL_dlg_id)exitWith{};
	
	//TOP LEFT
	#include "custom\info_tl.sqf"
	(_display displayctrl 200) ctrlSetStructuredText _structured;
	
	//TOP RIGHT
	#include "custom\info_tr.sqf"
	(_display displayctrl 201) ctrlSetStructuredText _structured;
	
	//DOWN LEFT
	#include "custom\info_weapon.sqf"
	(_display displayctrl 202) ctrlSetStructuredText _structured;
	
	//DOWN RIGHT
	#include "custom\info_zoom.sqf"
	(_display displayctrl 203) ctrlSetStructuredText _structured;	

	//Compass
	#include "custom\compass.sqf"
	
	//Indicator 
	#include "custom\indicator.sqf"
	
	//Range
	#include "custom\range.sqf"

	//Center
	#include "custom\center.sqf"
	
	//Cross
	#include "custom\cross.sqf"

	//Hide Display
	#include "custom\hide_display.sqf"
	
	//Fly Modes
	#include "custom\flyMode.sqf"
};
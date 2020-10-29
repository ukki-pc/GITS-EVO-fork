/*	ac130_HUD.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private ["_difh","_difv","_x","_y","_display","_effect","_structured","_infos","_secTotal","_screen","_color","_size","_i","_j"];

disableSerialization;
	
_difh = [(LDL_cam_dirh - LDL_cam_rotating_angle)]call LDL_normalizeAngle;
_difv = [LDL_cam_dirv - 180]call LDL_normalizeAngle;
_display = (finddisplay 1000);

//Compass
for [{_i = 0;_j = 0},{_i < 360;_j < 4},{_i = _i + 90;_j = _j + 1}] do 
{
	_x = (0.5- 0.035 + sin(_i - LDL_cam_dirh)*(SafeZoneW/4 - SafeZoneW/100));
	_y = (0.5- 0.025 - cos(_i - LDL_cam_dirh)*(SafeZoneH/4 - SafeZoneH/100));
	
	(_display displayCtrl 1009+_j) ctrlSetPosition [_x,_y];
	(_display displayCtrl 1009+_j) ctrlCommit 0;
};

//Diference indicator  
if(LDL_plane_type == "AC130_ATTACH") then
{
	_x = (SafeZoneX + SafeZoneW/2)+sin(_difh-90)*SafeZoneW/16;
}
else
{
	_x = (SafeZoneX + SafeZoneW/2)+sin(_difh)*SafeZoneW/16;
};

_y = (SafeZoneY + SafeZoneH - SafeZoneH/4 + SafeZoneH/64);

(_display displayCtrl 1013) ctrlSetPosition [_x,_y];
(_display displayCtrl 1013) ctrlCommit 0;

if(LDL_plane_type == "AC130_ATTACH") then
{
	(_display displayCtrl 1014) ctrlSetText format["%1�", round(_difh)-90];
}
else
{
	(_display displayCtrl 1014) ctrlSetText format["%1�", round(_difh)-180];
};

(_display displayCtrl 1014) ctrlSetPosition [_x - SafeZoneW/128, _y + SafeZoneH/64];
(_display displayCtrl 1014) ctrlCommit 0;

_x = (SafeZoneX + SafeZoneW - SafeZoneW/4);
_y = (SafeZoneY + SafeZoneH/2)+sin(_difv)*SafeZoneH/16;

(_display displayCtrl 1015) ctrlSetPosition [_x,_y];
(_display displayCtrl 1015) ctrlCommit 0;

(_display displayCtrl 1016) ctrlSetText format["%1�", round(_difv)-180];

(_display displayCtrl 1016) ctrlSetPosition [_x + SafeZoneW/64, _y - SafeZoneH/64];
(_display displayCtrl 1016) ctrlCommit 0;

//Links oben
_effect = switch(LDL_cameraEffect) do
{
	case 2:
	{
		"FLIR W";	
	};
	
	case 3:
	{
		"FLIR B";	
	};
	
	case 4:
	{
		"NVG";	
	};
	
	default
	{
		"";
	};
};

_structured = composeText [""];
_infos = 
[
	format ["H: %1�  V: %2�",round(LDL_cam_dirh),round(LDL_cam_dirv)],
	format ["Alt: %1m (%2m ASL)",round(getPos LDL_ac130_plane select 2),round(getPosASL LDL_ac130_plane select 2)],
	format[""],
	lineBreak,
	format ["%1",_effect]
];

{
	_structured = composeText [_structured,_x,lineBreak];
} forEach _infos;

(_display displayctrl 1003) ctrlSetStructuredText _structured;

_secTotal = (time-LDL_startTime);
			
//Rechts oben
_structured = composeText [""];

_infos = 
[
	format ["%1 : %2",[date select 3]call LDL_transformNumber,[date select 4]call LDL_transformNumber],
	format ["%1",[_secTotal]call LDL_secondsToTime],
	format [""]
];

if(LDL_showStrobes) then
{
	_infos  = _infos + [parseText "<t size='0.6'>Infantry Strobes</t>"];
};

if(LDL_showVehicles) then
{
	_infos  = _infos + [parseText "<t size='0.6'>Vehicle Detection</t>"];
};

{
	_structured = composeText [_structured,_x,lineBreak];

} forEach _infos;
(_display displayctrl 1004) ctrlSetStructuredText _structured;

//Links unten
_structured = composeText [""];
_infos = [];

for [{_i = 0;},{_i < count LDL_weaponSlots;},{_i = _i + 1;}] do 
{
	_color = '#FFFFFF';
	if((LDL_weaponSlots select _i)select 2 <= 0) then
	{
		_color = '#FF0000';	
	}
	else
	{
		if((LDL_weaponSlots select _i)select 3) then
		{
			_color = '#FF8C00';
		};
	};
	
	if(LDL_equippedWeapon == _i) then
	{
		_size = '1.5';	
	}
	else
	{
		_size = '1';	
	};
	
	_infos  = _infos + [parseText format["<t color='%3'><t size='%4'>%5: %1 / %2</t></t> ", (LDL_weaponSlots select _i)select 2,(LDL_weaponSlots select _i)select 1, _color, _size, (LDL_weaponSlots select _i)select 0]];	
};

{
	_structured = composeText [_structured,_x,lineBreak];

} forEach _infos;
(_display displayctrl 1001) ctrlSetStructuredText _structured;

//Range
if(LDL_plane_type == "AC130_LITE") then
{
	(_display displayctrl 1008) ctrlSetText format ["Range: %1",round(LDL_ac130_plane distance (screenToWorld [0.5,0.5]))];
}
else
{
	(_display displayctrl 1008) ctrlSetText format ["Range: %1",round(((LDL_ac130_plane distance LDL_ac130_cam)min 6000) + (LDL_ac130_cam distance (screenToWorld [0.5,0.5])))];
};

//Center
_screen = worldToScreen (getPos LDL_cam_rotating_center);

if (count _screen != 2) then
{                              
	_screen = [-1,-1];
};
     
(_display displayCtrl 1005) ctrlSetPosition [(_screen select 0)-SafeZoneW/32,(_screen select 1)-SafeZoneH/32];
(_display displayCtrl 1005) ctrlCommit 0;
/*	dlg_Map.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

private["_display", "_id", "_map", "_dest", "_ellipse", "_ac130", "_target"];

disableSerialization;

_display = (finddisplay 1000);
_id = _this select 0;
_map = (_display displayCtrl 300);

ctrlShow [300, true];	
ctrlShow [1002, true];

//ctrlSetFocus _map;

//Button Events
[]call LDL_dlg_buttonInit;
[]call LDL_dlg_buttonInit_top;

//Buttons Left Side
if(LDL_plane_type != "AC130_ATTACH") then
{
	ctrlSetText [105, "Target"];
	LDL_dlg_button_events set[105, 
	{
		private["_display", "_map"];
		disableSerialization;
		
		_display = (finddisplay 1000);
		_map = (_display displayCtrl 300);
			
		_map ctrlMapAnimAdd [1, ctrlMapScale _map, getPos LDL_cam_rotating_center];
		ctrlMapAnimCommit _map;
		
		waitUntil{ctrlSetFocus _map;(ctrlMapAnimDone _map)};
		ctrlSetFocus _map; 
	}];
};
ctrlSetText [106, "Player"];
LDL_dlg_button_events set[106, 
{
	private["_display", "_map"];
	disableSerialization;
	
	_display = (finddisplay 1000);
	_map = (_display displayCtrl 300);
		
	_map ctrlMapAnimAdd [1, ctrlMapScale _map, getPos player];
	ctrlMapAnimCommit _map;
	
	waitUntil{ctrlSetFocus _map;(ctrlMapAnimDone _map)};
	ctrlSetFocus _map; 
}];
if(LDL_plane_type != "AC130_LITE") then
{
	ctrlSetText [107, "Plane"];
	LDL_dlg_button_events set[107, 
	{
		private["_display", "_map"];
		disableSerialization;
		
		_display = (finddisplay 1000);
		_map = (_display displayCtrl 300);
		
		_map ctrlMapAnimAdd [1, ctrlMapScale _map, getPos LDL_ac130_plane];
		ctrlMapAnimCommit _map;
		
		waitUntil{ctrlSetFocus _map;(ctrlMapAnimDone _map)};
		ctrlSetFocus _map; 
	}];	
};

//Buttons Right Side
if(LDL_plane_type == "AC130_ROTATE" || LDL_plane_type == "UAV") then
{
        ctrlSetText [110, "Params"];
        LDL_dlg_button_events set[110, 
        {	
            ((finddisplay 1000) displayCtrl 303)ctrlSetText str(LDL_cam_rotating_radius);
            ((finddisplay 1000) displayCtrl 304)ctrlSetText str(LDL_cam_rotating_height);
            [true, 301, 308]call LDL_dlg_show;
        }];
};

if(LDL_plane_type == "AC130_ROTATE" || LDL_plane_type == "UAV") then
{
	onMapSingleClick 
	{
		[_pos]spawn
		{
			private["_pos"];
			_pos = _this select 0;
			
			LDL_destination setPos _pos;
			
			LDL_flyMode = 2;
		};
	};	
};

if(LDL_plane_type == "AC130_COOP") then
{
	onMapSingleClick 
	{
		[_pos]spawn
		{
			private["_pos"];
			_pos = _this select 0;
			
			LDL_cam_rotating_center setPosATL [_pos select 0, _pos select 1, 0];
		};
	};
};

while{LDL_dlg_display == "Map"} do
{
	if(_id != LDL_dlg_id)exitWith{};
	
	if(LDL_flyMode > 1 && (LDL_plane_type == "AC130_ROTATE"  || LDL_plane_type == "UAV")) then
	{
		_dest = createMarkerLocal ["Destination", LDL_destination];
		_dest setMarkerShapeLocal "ICON";
		_dest setMarkerSizeLocal [1, 1];
		_dest setMarkerTypeLocal "Marker";	
		_dest setMarkerTextLocal "Destiation";
	};
	
	_ellipse = createMarkerLocal ["Ellipse", LDL_cam_rotating_center];
	_ellipse setMarkerShapeLocal "ELLIPSE";
	_ellipse setMarkerSizeLocal [LDL_cam_rotating_radius, LDL_cam_rotating_radius];
	_ellipse setMarkerTextLocal "Target Area";
	
	_target = createMarkerLocal ["target", LDL_cam_rotating_center];
	_target setMarkerShapeLocal "ICON";
	_target setMarkerSizeLocal [1, 1];
	_target setMarkerTypeLocal "Marker";	
	_target setMarkerTextLocal "Target Area";
	
	if(LDL_plane_type != "AC130_LITE") then 
	{
		_ellipse setMarkerBrushLocal "BORDER";
		
		_ac130 = createMarkerLocal ["PlaneMark", LDL_ac130_plane];
		_ac130 setMarkerShapeLocal "ICON";
		_ac130 setMarkerSizeLocal [1, 1];
		_ac130 setMarkerTypeLocal "b_plane";	
		_ac130 setMarkerDirLocal (getDir LDL_ac130_plane);
		if(LDL_plane_type == "UAV") then
		{
			_ac130 setMarkerTextLocal "UAV";
		}
		else
		{
			_ac130 setMarkerTextLocal "AC-130";
		};
	}
	else
	{
		_ellipse setMarkerColorLocal "ColorGreenAlpha";
	};
	
	sleep 0.005;	
	
	deleteMarkerLocal "target";
	deleteMarkerLocal "Ellipse";
	deleteMarkerLocal "PlaneMark";
	deleteMarkerLocal "Destination";
};

onMapSingleClick 
{
	
};
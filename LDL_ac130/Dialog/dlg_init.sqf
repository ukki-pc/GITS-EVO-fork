/*	dlg_init.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

disableSerialization;

LDL_dlg_show = 
{
	private ["_show","_start","_end","_i"];
	
	_show = _this select 0;
	_start = _this select 1;
	_end = _this select 2;

	for [{_i=_start},{_i<_end+1},{_i=_i+1}] do 
	{
		ctrlShow [_i, _show];
	};
};

LDL_dlg_hideAll =
{
	//Black
	private ["_i"];
    
        ctrlShow [1001, false];
	ctrlShow [1002, false];
	
	//Camera
	for [{_i=200},{_i<230},{_i=_i+1}] do 
	{
		ctrlShow [_i, false];
	};
	
	//Map
        for [{_i=300},{_i<309},{_i=_i+1}] do 
	{
		ctrlShow [_i, false];
	};
	
	//UAV
	ctrlShow [400, false];	
	
	//Gunner
	ctrlShow [500, false];
        
        //Help
        ctrlShow [600, false];
};

LDL_dlg_buttonEvent =
{
	private["_idc", "_fnc"];
	
	_idc = _this select 0;
	_fnc = LDL_dlg_button_events select _idc;
	
	[]call _fnc;
};

LDL_dlg_changeDisplay =
{
	private["_id"];
	
	//Hide all ctrls
	[]call LDL_dlg_hideAll;
	
	LDL_dlg_id = LDL_dlg_id + 1;
	_id = LDL_dlg_id;
	
	//Show ctrls and start script
	switch (LDL_dlg_display) do 
	{
		case "AC130":
		{
			[_id]execVM "LDL_ac130\Dialog\dlg_AC130.sqf";
		}; 
		case "AC130_COOP":
		{
			[_id]execVM "LDL_ac130\Dialog\dlg_AC130_COOP.sqf";
		}; 
		case "Map":
		{		
			[_id]execVM "LDL_ac130\Dialog\dlg_Map.sqf";
		}; 
		case "UAV":
		{		
			[_id]execVM "LDL_ac130\Dialog\dlg_UAV.sqf";
		};
		case "null":
		{
			while{dialog} do
			{
				closeDialog 0;
			};	
		};
		default 
		{
			ctrlShow [1001, true];
		};
	}; 	
};

LDL_dlg_buttonInit_top =
{
	[]call LDL_dlg_buttonInit;
	ctrlSetText [100, "Camera"];
	ctrlSetText [101, "Map"];
        ctrlSetText [104, "Help"];
	
	//Camera
	LDL_dlg_button_events set[100, 
	{
		switch (LDL_plane_type) do 
		{
			case "UAV":
			{
				LDL_dlg_display = "UAV";
			}; 
			case "AC130_COOP":
			{
				LDL_dlg_display = "AC130_COOP";
			};
			default 
			{
				LDL_dlg_display = "AC130";
			};
		};
		
		[]call LDL_dlg_changeDisplay;	
	}];
	
	//Map	
	LDL_dlg_button_events set[101, 
	{
		LDL_dlg_display = "Map";
		[]call LDL_dlg_changeDisplay;	
	}];
        
        //Help	
	LDL_dlg_button_events set[104, 
	{
            if(ctrlShown ((findDisplay 1000) displayctrl (600))) then
            {
                ctrlShow [600, false];
            }
            else
            {
                ctrlShow [600, true];
            }
	}];
};

LDL_dlg_buttonInit =
{
	private["_idc", "_str"];
		
	for [{_idc=100},{_idc<120},{_idc=_idc+1}] do 
	{
		_str = format["[%1]spawn LDL_dlg_buttonEvent", _idc];
		
		buttonSetAction [_idc, _str];
		ctrlSetText [_idc, ""];
		LDL_dlg_button_events set[_idc, {}];	
	};
};

LDL_dlg_display = "null";
LDL_dlg_id = 0;
LDL_dlg_button_events = [];
LDL_dlg_mouseCtrlPos = [-1,-1];
LDL_dlg_strg_pressed = false;
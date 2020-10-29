/*	ac130_createPlane.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_side","_faction","_a2","_oa","_getPilotClass"];

_faction = LDL_Adjustments select 10;

_side = LDL_Adjustments select 11;
_a2 = isClass (configfile >> "cfgpatches" >> "Chernarus");
_oa = isClass (configfile >> "cfgpatches" >> "ca_E");

_getPilotClass =
{
	private["_faction", "_class"];
	
	_faction = _this select 0;
	
	switch(_faction) do
	{
		case "CDF":
		{
			_class = "CDF_Soldier_Pilot";
		};
		
		case "BIS_CZ":
		{
			_class = "CZ_Soldier_Pilot_EP1";			
		};
		
		case "CIV":
		{
			_class = "Pilot";		
		};
		
		case "GUE":
		{
			_class = "GUE_Soldier_Scout";		
		};	
		
		case "INS":
		{
			_class = "Ins_Soldier_Pilot";		
		};
		
		case "Default":
		{
			_class = "Civilian";	
		};	
		
		case "RU":
		{
			_class = "RU_Soldier_Pilot";		
		};
		
		case "BIS_TK_CIV":
		{
			_class = "TK_CIV_Takistani01_EP1";		
		};	
		
		case "BIS_TK":
		{
			_class = "TK_Soldier_Pilot_EP1";		
		};	
		
		case "BIS_TK_GUE":
		{
			_class = "TK_GUE_Soldier_EP1";		
		};	
		
		case "BIS_UN":
		{
			_class = "UN_CDF_Soldier_Pilot_EP1";		
		};
		
		case "BIS_US":
		{
			_class = "US_Soldier_Pilot_EP1";
		};		
		
		case "USMC":
		{
			_class = "USMC_Soldier_Pilot";		
		};
		
		default
		{
			_class = typeOf player;	
		};		
	};
	
	_class;
};

//Type
if(LDL_plane_type == "AC130_ROTATE" || LDL_plane_type == "AC130_AI" || LDL_plane_type == "AC130_LITE") then
{
	//AC130
	if(_faction == "BIS_US" || (_oa && !_a2)) then
	{
		LDL_ac130_plane = createVehicle ["C130J_US_EP1",[0,0,10000], [], 0, "FLY"];
	}
	else
	{
		LDL_ac130_plane = createVehicle ["C130J",[0,0,10000], [], 0, "FLY"];
	};
	
    LDL_ac130_pilot = ([_faction]call _getPilotClass) createUnit [[0,0,10000],createGroup _side,"LDL_ac130_pilot = this; this moveInDriver LDL_ac130_plane;", 0.6, "corporal"];
};

if(LDL_plane_type == "UAV") then
{
	//UAV
	if(_side == east) then
	{
		if(!(isClass (configFile >> "CfgVehicles" >> "Pchela1T"))) exitWith{hint "No UAV support available."};
		
		LDL_ac130_plane = createVehicle ["Pchela1T",[0,0,10000], [], 0, "FLY"];
		LDL_ac130_pilot = ([_faction]call _getPilotClass) createUnit [[0,0,10000],createGroup _side,"LDL_ac130_pilot = this; this moveInDriver LDL_ac130_plane;", 0.6, "corporal"];
	}
	else
	{
		if(_faction == "BIS_US" || (_oa && !_a2)) then
		{
			LDL_ac130_plane = createVehicle ["MQ9PredatorB_US_EP1",[0,0,10000], [], 0, "FLY"];
		}
		else
		{
			LDL_ac130_plane = createVehicle ["MQ9PredatorB",[0,0,10000], [], 0, "FLY"];
		};
		
		LDL_ac130_pilot = ([_faction]call _getPilotClass) createUnit [[0,0,10000],createGroup _side,"LDL_ac130_pilot = this; this moveInGunner LDL_ac130_plane;", 0.6, "corporal"];	
	};
};
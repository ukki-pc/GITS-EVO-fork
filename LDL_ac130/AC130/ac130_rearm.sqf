/*	ac130_rearm.sqf for AC130-Script
*	@author: =L2D=Curry
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_target","_caller","_id","_object","_25mm","_40mm","_105mm","_ac130_inUse","_args"];

_target	= _this select 0;
_caller	= if(count _this > 1) then {_this select 1} else {nil};
_id 	= if(count _this > 2) then {_this select 2} else {nil};
_args	= if(count _this > 3) then {_this select 3} else {nil};

_object = if(isNil "_caller") then {(vehicle _target)} else {(vehicle _caller)};	

if(!isNull _object) then 
{	
	//--- Start ---
	_ac130_inUse = _object getVariable "LDL_planeInUse";	
	
	if(!isNil "_ac130_inUse") then 
	{
		if(!_ac130_inUse && speed _object < 10) then 
		{			
			_25mm = _object getVariable "LDL_Ammo25";
			_40mm = _object getVariable "LDL_Ammo40";
			_105mm = _object getVariable "LDL_Ammo105";
			
			if(_25mm < (LDL_AC130_Adjustments select 2) || _40mm < (LDL_AC130_Adjustments select 3) || _105mm < (LDL_AC130_Adjustments select 4)) then
			{
				titleText ["Rearming.", "PLAIN"];	
				playSound "LDL_reload";
			
				_object setVariable ["LDL_Ammo25", (LDL_AC130_Adjustments select 2), true];
				_object setVariable ["LDL_Ammo40", (LDL_AC130_Adjustments select 3), true];
				_object setVariable ["LDL_Ammo105",(LDL_AC130_Adjustments select 4), true];
			};
		} 
		else 
		{
                    if(_ac130_inUse) then
                    {
                        hint "Cannot rearm while plane is in use.";
                    }
		};
	};
	//--- End ---
};
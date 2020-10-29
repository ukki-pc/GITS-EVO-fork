/*	dlg_event.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_state", "_idd"];

_state = _this select 0;
_idd = _this select 1;

disableSerialization;

switch (_state) do 
{
	case 0: 
	{
		//On Load
	}; 
	case 1: 
	{
		//On Unload
		if(_idd == 1000) then
		{
			//Parent
			createDialog "LDL_DialogClose";
		};
		if(_idd == 2000) then
		{
			//Close Dialog
			if(LDL_close_button_state == -1) then
			{
				//ESC
				LDL_dlg_display = "null";	
			};	
			if(LDL_close_button_state == 0) then
			{
				//close
				LDL_dlg_display = "null";
			};	
			if(LDL_close_button_state == 1) then
			{
				//continue
				[LDL_dlg_display]execVM "LDL_ac130\Dialog\dlg_create.sqf";
			};	
		};
	};
	default 
	{
	
	};
}; 
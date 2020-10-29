/*	ac130_warning.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_message","_info","_structured","_display"];

disableSerialization;

if(!LDL_ac130_abort && LDL_ac130_active) then
{
	_message = _this select 0;
	_info = _this select 1;
	_display = (finddisplay 1000);

	waitUntil{(!LDL_warnings || LDL_ac130_abort || !LDL_ac130_active)};
	
	if(!LDL_ac130_abort && LDL_ac130_active) then
	{
		LDL_warnings = true;

		playSound "LDL_beep_short";
		
		_structured = parseText "";

		if(_info) then
		{
			_structured = parseText (format["<t color='#FF0000'>%1</t>", _message]);
		}
		else
		{
			_structured = parseText (format["<t color='#FF0000'>Warning: </t><t color='#00000'>%1</t>", _message]);
		};
		
		(_display displayctrl 1017) ctrlSetStructuredText _structured;

		sleep 3;

		(_display displayctrl 1017) ctrlSetStructuredText (composeText [""]);

		sleep 0.5;
	};

	LDL_warnings = false;
};


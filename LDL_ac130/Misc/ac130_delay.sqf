/*	ac130_delay.sqf by LurchiDerLurch for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private ["_delay","_text","_startTime","_secTotal"];

_delay = _this select 0;
_text = _this select 1;
_startTime = time;
_secTotal = 0;

while{_secTotal >= 0} do
{	
	_secTotal = _delay-(time-_startTime);
	
	hintSilent format ["%1 %2",_text, [_secTotal]call LDL_secondsToTime];
	
	if(_secTotal <= 0) exitWith
	{
		hintSilent format ["%1 00:00:00",_text];
	};
	
	sleep 0.5;
};
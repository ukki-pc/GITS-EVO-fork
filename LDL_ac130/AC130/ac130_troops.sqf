/*	ac130_troops.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_id", "_display", "_control2001", "_setScreenPos", "_clearAll", "_targets", "_mainTarget", "_screen", "_text", "_target"];

_id = LDL_foreignScriptIdentifier;

disableSerialization;

_display = (findDisplay 1000);
_control2001 = _display displayCtrl 219;

_setScreenPos =
{
	private["_target","_idc","_screen","_display","_control"];

	_target = _this select 0;
	_idc = _this select 1;
	_display = findDisplay 1000;
	_control = _display displayCtrl _idc;

	_screen = worldToScreen (getPos _target);
	if ((count _screen) != 2) then
	{
		_screen = [-1,-1];
	};
	_control ctrlSetPosition [(_screen select 0) - 0.02,(_screen select 1) - 0.025];
	switch (side _target) do
	{
		case (civilian):	{_control ctrlSetTextColor [1,1,0,0.5];};
		case (playerSide):	{_control ctrlSetTextColor [0,0,1,0.5];};
		default			{_control ctrlSetTextColor [1,0,0,0.5];};
	};
	_control ctrlCommit 0;
};

_clearAll =
{
	private["_display", "_control2000", "_control2001"];
	
	_display = (findDisplay 1000);
	_control2000 = _display displayCtrl 218;
	_control2001 = _display displayCtrl 219;
	
	for "_i" from (1) to (10) do
	{
		(_display displayCtrl (219 + _i)) ctrlSetTextColor [0,0,0,0];
		(_display displayCtrl (219 + _i)) ctrlCommit 0;
	};
	_control2000 ctrlSetTextColor [0,0,0,0];
	_control2000 ctrlCommit 0;
	_control2001 ctrlSetTextColor [0,0,0,0];
	_control2001 ctrlCommit 0;
};

waitUntil {sleep 0.1; (LDL_ac130_active && LDL_enableVehicles)};

[true, 218, 229]call LDL_dlg_show;

while {!LDL_ac130_abort && LDL_ac130_active} do
{
	sleep 0.01;
	
	if(_id != LDL_foreignScriptIdentifier) exitWith{};
	
	//Enable: (LDL_Adjustments select 1) set [0, true];
	//Show: (LDL_Adjustments select 1) set [1, true];
	
	if (!LDL_enableVehicles || !LDL_showVehicles) then
	{
		[]call _clearAll;
		waitUntil{sleep 0.1; ((LDL_showVehicles && LDL_enableVehicles) || !LDL_ac130_active || LDL_ac130_abort)};
		if (!LDL_ac130_active || LDL_ac130_abort) exitWith {};
	}
	else
	{
		[]call _clearAll;

		_targets = nearestObjects [screenToWorld [0.5,0.5],["LandVehicle","Air","Ship"],200];

		//Main Target
		_mainTarget = _targets select 0;
		[_mainTarget,219] call _setScreenPos;
		_screen = worldToScreen (getPos _mainTarget);
		if (count _screen != 2) then
		{
			_screen = [-1,-1];
		};
		_control2001 ctrlSetPosition [(_screen select 0) - 0.05,(_screen select 1) + 0.02];
		switch (side _mainTarget) do
		{
			case (civilian):	{_control2001 ctrlSetTextColor [1,1,0,1];};
			case (playerSide):	{_control2001 ctrlSetTextColor [0,0,1,1];};
			default			{_control2001 ctrlSetTextColor [1,0,0,1];};
		};
		_text = getText (configFile/"CfgVehicles"/(typeOf _mainTarget)/"displayName");
		_control2001 ctrlSetText format ["%1",_text];
		_control2001 ctrlCommit 0;

		//All Targets
		for "_i" from (1) to (10 min (count _targets)) do
		{
			_target = _targets select _i;
			[_target,219 + _i] call _setScreenPos;
		};
	};
};

[]call _clearAll;

[false, 218, 229]call LDL_dlg_show;
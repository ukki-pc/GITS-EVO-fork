xPos = ( safeZoneX + ( safeZoneWAbs / 2 )) - ( 0.4 / 2 );

killFeedCleanup =
{
    private ["_ctrl"];
	disableSerialization;
	_ctrl = _this select 0;
	sleep 6;
	activeControls = activeControls - [_ctrl];
};

// [control,message,targetValue]
fnc_hudVal_smooth = 
{
    disableSerialization;
    private ["_ctrl","_msg","_value","_tempValue","_shownValue"];
    #define smoothingSpeed 0.1
    #define smoothingRange 50
    #define smoothingMin 0.12
    _ctrl = _this select 0;
    _msg = _this select 1;
    _value = _this select 2;
    _tempValue =  (_value - smoothingRange) max 0;
    _shownValue = 0; //This is just temp value but with decimals cut

    while {_tempValue < _value} do
    {
        _tempValue = _tempValue + (((_value - _tempValue)*smoothingSpeed) max smoothingMin);
        _tempValue = (_tempValue) min _value;
        _shownValue = [_tempValue, 0] call BIS_fnc_cutDecimals;
        _ctrl ctrlsetText format ["%1 %2",_msg,_shownValue];
        sleep BIS_EVO_frameDelay;
        _ctrl ctrlCommit 0;
    };
};

fnc_showHudMessage = {

    private ["_msg","_currentLayer","_uiString","_pos","_ctrl","_value","_valueInit"];

    #define killfeedControlCount 8
    #define killFeedIDCStart 100
    _msg = _this select 0;
    _value = _this select 1;

    disableSerialization;

    _currentLayer =  currentControl+killFeedIDCStart;

    _uiString = format ["killfeed%1",currentControl];
   _currentLayer cutRsc [_uiString,"PLAIN"];

    {
        if (!isNil "_x") then 
        {
            private ["_ctrl","_pos"];
            _ctrl = (uiNamespace  getVariable _x);
            _pos = ctrlPosition _ctrl;
            _pos set [1, (_pos select 1) + 0.04];
            _ctrl ctrlSetPosition _pos;
            _ctrl ctrlCommit 0.3;
        };
    }forEach activeControls;

    //UISleep 0.25;
    _ctrl = (uiNamespace  getVariable _uiString);

    //_ctrl = (findDisplay 1562) displayCtrl 116;

    _ctrl ctrlSetPosition [xPos, 0.6, 0.4, 0.1];

    //_ctrl ctrlsetText format ["%1%2",_msg, random(100)];
    //_ctrl ctrlSetTextColor [1, 0, 0, 1];
    
   // _currentLayer cutFadeOut 5;
    //_ctrl ctrlCommit 0;

    //Smoothing formula valueA + (valueA - valueB) * 0.2


    if (_value != 0) then
    {
        [_ctrl,_msg,_value] spawn fnc_hudVal_smooth;
    }
    else
    {
        _ctrl ctrlsetText format ["%1",_msg];
        _ctrl ctrlCommit 0;
    };
    //_ctrl ctrlSetTextColor [1, 0, 0, 1];
    /*
    _ctrl ctrlSetText ("You killed a " + (getText(configFile >> "CfgVehicles" >> typeOf (_this select 1) >> "displayName")));

    _ctrl ctrlCommit 0;

    _ctrl ctrlSetFade 1;
    _ctrl ctrlCommit 10;
    */

   [_uiString] spawn killfeedCleanup;

    activeControls = [_uiString] + activeControls;

    if(currentControl >= killfeedControlCount) then {currentControl = 1}
    else {currentControl = currentControl + 1};
};

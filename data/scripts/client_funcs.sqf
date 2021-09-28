//Common functions for clients only

allBunkerControls = ["screenobj1","screenobj2","screenobj3","screenobj4"];

//Runs in the background to draw world object positions to ui elements on screen
fnc_marker_screen = 
{
	disableSerialization;
	#define layerStart 11
	#define screenCtrlMaxDist 1600
	_objects = _this select 0;
	_clean = false;

	_currentTownPos = getPos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);

		{
			_targetObject = _x select 0;
			_ctrlName = allBunkerControls select _forEachIndex;
			_layerN = layerStart + _forEachindex;
			_layerN cutRsc [_ctrlName,"PLAIN"];
			_objName = format ["Flag %1",_forEachIndex+1];
			_ctrl = (uiNamespace  getVariable _ctrlName );
			// _ctrl ctrlsetText _objName;
			 _ctrl ctrlCommit 0;
		}forEach _objects;

	disableSerialization;
	while{sleep 0.016; BIS_EVO_MissionProgress != -1} do 
	{
		_draw = (!(visibleMap) and (player distance _currentTownPos < screenCtrlMaxDist));

		if(_draw) then
		{
			{
				_targetObject = _x select 0;
				_ctrlName = allBunkerControls select _forEachIndex;
				_ctrl = (uiNamespace  getVariable _ctrlName);
				_screenPos = worldToScreen getPos _targetObject;
				_ctrl ctrlSetPosition _screenPos;
				_ctrl ctrlSetScale ((screenCtrlMaxDist-(player distance _targetObject))/screenCtrlMaxDist) min 1 max 0;
				_ctrl ctrlCommit 0;
			}forEach _objects;
			_clean = true;
		}
		else 
		{
			if(_clean) then
			{
				{
					_targetObject = _x select 0;
					_ctrlName = allBunkerControls select _forEachIndex;
					_ctrl = (uiNamespace  getVariable _ctrlName);
					_ctrl ctrlSetPosition [2,2];
					_ctrl ctrlCommit 0;
					_clean = false;
				}forEach _objects;
			};
		};
	};

	//Clean layers
	{_layerN = layerStart + _forEachIndex; _layerN cutRsc ["Default","PLAIN"]}forEach _objects;
};



messageMutex = 0;
//Handles messages
fnc_clientHudMessage = 
{
	#define delayTime 0.8
	private ["_message","_score"];
	_message = _this select 0;
	_score = _this select 1;
	if(isNil "_score") then {_score = 0};

	waitUntil {sleep BIS_EVO_frameDelay; messageMutex == 0};
	messageMutex = 1;
	[_message,_score] call fnc_showhudMessage;
	sleep delayTime;
	messageMutex = 0;
};

//Broadcasts hud messages for players
["fnc_ctrlChangeColor", {
	disableSerialization;
	_ctrlN = _this select 1;
	_color = _this select 2;
	_ctrl = (uiNamespace  getVariable _ctrlN);
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlCommit 0;
}] call CBA_fnc_addLocalEventHandler;

//Broadcasts hud messages for players
["fnc_hudMessage", {
	private ["_player","_message","_score"];
	_message = _this select 1;
	_score = _this select 2;
	[_message,_score] spawn fnc_clientHudMessage;
}] call CBA_fnc_addLocalEventHandler;

//Broadcasts voices for players
["fnc_playSound", {
	private ["_sound"];
	_sound = _this select 1;
	playSound _sound;
}] call CBA_fnc_addLocalEventHandler;


//Broadcasts voices for players
["fnc_say3d", {
	private ["_sound"];
	_source = _this select 1;
    _sound = _this select 2;
    _dist = _this select 3;
	_source say3d [_sound,_dist];
}] call CBA_fnc_addLocalEventHandler;

//Server side score addition
   ["jed_addscore", {(_this select 0) addScore (_this select 1)}] call CBA_fnc_addEventHandler;
//Bandage init
[player,0.2,0,-1,true] execVM "data\scripts\cly_heal.sqf";

//Systemchat message
["jed_msg", {
	_msg = _this select 1;
	systemChat format ["%1",_msg];
}] call CBA_fnc_addLocalEventHandler;

//global message
["jed_SIDEmsg", {
	player globalChat format ["%1",_this select 1];
}] call CBA_fnc_addLocalEventHandler;

//Screen marker broadcast
["jed_screenMarker", 
{
	_screenMarkers = _this select 0;
	[_screenMarkers] spawn fnc_marker_screen;
}] call CBA_fnc_addEventHandler;

//Pick City broadcast
["jed_missionManager", {
_objId = _this select 0;
	if(isServer) then 
	{
		BIS_EVO_MissionProgress = _objId;
        publicVariable "BIS_EVO_MissionProgress";
       [] spawn missionManager;
	}
    else
    {
       _plays = [] execVM "data\scripts\update.sqf";
    };
}] call CBA_fnc_addEventHandler;

//Add money to clients
["jed_addMoney", {
	_player = _this select 0;
	_amount = _this select 1;

	if(!(isNil "_amount")) then 
	{
		money = money + _amount;
	    (uiNameSpace getVariable "myUI_DollarTitle") ctrlSetText format ["$%1",money];
	};
}] call CBA_fnc_addLocalEventHandler;

["jed_hitMarker", {
    _hitmarks = ["hit1","hit2","hit3"];
    3 cutRsc ["Hitmarker","PLAIN"];
    _sound = [_hitmarks] call fnc_pickRandom;
    playSound _sound;
}] call CBA_fnc_addLocalEventHandler;

//Just update the money
["jed_updMoney", {
	(uiNameSpace getVariable "myUI_DollarTitle") ctrlSetText format ["$%1",money];
}] call CBA_fnc_addLocalEventHandler;

["jed_getMoney", {
		_player = _this select 0;
		_count = _this select 1;
		bank set [_count,[name _player,money]];
		publicVariableServer "bank";

}] call CBA_fnc_addLocalEventHandler;

["jed_aggr", {
	_player = _this select 0;
	if(name _player == name player) then 
	{
		(uiNameSpace getVariable "myUI_AggressionTitle") ctrlSetText format ["%2%1","%",aggression];
	};
}] call CBA_fnc_addLocalEventHandler;

["fnc_broadcastScreenMarkers", {
    _screenMarkers = _this select 1;

	[_screenMarkers] spawn fnc_marker_screen;
}] call CBA_fnc_addLocalEventHandler;

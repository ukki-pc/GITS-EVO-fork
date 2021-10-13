
#include "factionDefines.h"

//Common functions for clients only

allBunkerControls = ["screenobj1","screenobj2","screenobj3","screenobj4"];

fnc_getBaseOwner = 
{
	_return = "US_DE";
	if(count BIS_EVO_ConqueredTowns == 0) exitWith {_return};
	_nearestObj = [BIS_EVO_ConqueredTowns+[farp1], position player] call BIS_fnc_nearestPosition;
	

	if(_nearestObj in BIS_EVO_cededCities) then {_return = BIS_EVO_cededOwners select (BIS_EVO_cededCities find _nearestObj)};

	_return;
};

fnc_spotEnemy = 
{
	_vec = _this select 0;
	_vecType = typeOf _vec;

	if(_vec getVariable ["spotid",0]!= 0) exitWith{};
	
/*
	_mrktype = "b_mech_inf";
	if (_vec isKindOf "Car") then {_mrktype = "plp_icon_vehicle"};
	if (_vec isKindOf "Tank") then {_mrktype = "plp_icon_tank"};
	if (_vec isKindOf "Plane") then {_mrktype = "plp_icon_planeLight"};

	_markerobj6 = createMarker[format["%1",_vec],[getpos _vec select 0,getpos _vec select 1]];
	_markerobj6 setMarkerColor "ColorRed";
	_markerobj6 setMarkerType _mrktype;

*/
	spotId = spotId +1;
	_spotId = spotId;

	_vec setVariable ["spotid",_spotId];

	screenMarkerBuffer = screenMarkerBuffer + [[_vec,(uiNamespace  getVariable "spotMarker" ),_spotId,"spotMarker",3,"data\spotMark.paa",enemyColor]];
	[] call fnc_marker_screenConsumeBuffer;

	["Spotting",10] spawn fnc_clientHudMessage;
	[10] call fnc_addMoney;

	_stop = (alive _vec);

		waitUntil{sleep 4; side _vec != EGG_EVO_ENEMYFACTION};

	if(alive _vec) then {[_vec,[0.4,0.4,0.4,1],5] call fnc_changeScreenmarker;};
//	deleteMarker _markerobj6;

/*
	[_vec] call fnc_deleteScreenmarker;
	screenMarkerBuffer = screenMarkerBuffer + [[_vec,(uiNamespace  getVariable "spotMarkerEmpty" ),_spotId,"spotMarkerEmpty",2.5]];
	[] call fnc_marker_screenConsumeBuffer;

	sleep 30;

	[_vec] call fnc_deleteScreenmarker;
	*/
};

//Insert [ELEMENT,ARRAY] RETURN parent index where element exists
fnc_find2d = 
{
	_item = _this select 0;
	_targetArray = _this select 1;
	_return = _targetArray find _item;

	if(_return == -1) then 
	{
		for [{_i = 0}, {_i < count _targetArray}, {_i = _i + 1}] do
		{
			if (typeName (_targetArray select _i) == "ARRAY") then 
			{
				_return = (_targetArray select _i) find _item;

				if(_return > -1) exitWith {_return = _i; _i = count _targetArray}; //Return parent array index
			}
		};
	};
	_return;
};

screenMarkerBuffer = [];

//[_targetObject,_ctrl,_layerN,_size,_pic,_color]
screenMarkers = [];

fnc_initFlagUi = 
{
	#define layerStart 11
	_objects = _this select 0;
	{
		_targetObject = _x select 0;
		_ctrlName = "screenobj1";
		_pic = ["data\flaga.paa","data\flagb.paa","data\flagc.paa","data\flagd.paa"] select _forEachindex;
		_layerN = layerStart + _forEachindex;
		_ctrl = (uiNamespace  getVariable _ctrlName);
		screenMarkerBuffer = screenMarkerBuffer + [[_targetObject,_ctrl,_layerN,_ctrlName,0,_pic,enemyColor,1]];
	}forEach _objects;

	[] call fnc_marker_screenConsumeBuffer;
};

//Transfers screen marker buffer to screen marker array
fnc_marker_screenConsumeBuffer = 
{
	disableSerialization;
	{
		_targetObject = _x select 0;
		_ctrl = _x select 1;
		_layerN = _x select 2;
		_ctrlName = _x select 3;
		_size = _x select 4;
		if(isNil "_size") then {_size = 2};
		_pic = _x select 5;
		_color = _x select 6;
		_scale = _x select 7;
		if(isNil "_color") then {_color = neutralcolor};
		if(isNil "_scale") then {_scale = 1};
		_layerN cutRsc [_ctrlName,"PLAIN"];
		_ctrl = (uiNamespace  getVariable _ctrlName);
		_ctrl ctrlCommit 0;
		screenMarkers = screenmarkers + [[_targetObject,_ctrl,_layerN,_size,_pic,_color,_scale]];
	}forEach screenMarkerBuffer;

	screenMarkerBuffer = [];
};

fnc_hideMarkers = 
{
	{
		_targetObject = _x select 0;
		_ctrl = _x select 1;
		_ctrl ctrlSetPosition [2,2];
		_ctrl ctrlCommit 0;
	}forEach screenMarkers;
};

//Runs in the background to draw world object positions to ui elements on screen
fnc_marker_screen = 
{
	disableSerialization;
	#define screenCtrlMaxDist 1600
	_clean = false;

	while{sleep 0.016; BIS_EVO_MissionProgress > -1} do 
	{
		if !(visibleMap) then
		{
			_size = count screenMarkers;
			for [{_i = 0}, {_i < _size}, {_i = _i}] do 
			{
				_obj = (screenMarkers select _i);
				_targetObject = _obj select 0;
				
				if(isNull _targetObject) then {[_targetObject] call fnc_deleteScreenmarker; _size = _size -1}
				else 
				{
					_pos = getPos _targetObject;
					
					if((_pos distance getPos player) > screenCtrlMaxDist) exitWith {_i = _i+1};

					_ctrl = _obj select 1;
					_ctrl ctrlsetText  (_obj select 4);
					_ctrl ctrlSetTextColor  (_obj select 5);
					_scale = _obj select 6;
					_screenPos = worldToScreen [_pos select 0,_pos select 1, ((_pos select 2)+ (_obj select 3))];
					_screenPos set [0,(_screenPos select 0)-0.006];
					_ctrl ctrlSetPosition _screenPos;
					_ctrl ctrlSetScale ((screenCtrlMaxDist-(player distance _targetObject))/screenCtrlMaxDist);
					_ctrl ctrlCommit 0;
					_i = _i +1;
				};
			};
			_clean = true;
		}
		else  //When hide markers
		{
			if(_clean) then
			{
				call fnc_hideMarkers;
				_clean = false;
			};
		};
	};

	//Clean layers
	{_layerN = _x select 2; _layerN cutRsc ["Default","PLAIN"]}forEach screenMarkers;
	screenMarkers = [];
};

fnc_deleteScreenmarker = 
{
	_name = _this select 0;
	_index = [_name,screenMarkers] call fnc_find2d;
	if(_index > -1) then 
	{
		_data = screenMarkers select _index;
		_layerN = _data select 2;
		_layerN cutRsc ["Default","PLAIN"];
		screenMarkers = [screenMarkers,_index] call BIS_fnc_removeIndex;
	};
};


//INSERT [name,value,index] finds name from screenmarkers and replaces data within that index
fnc_changeScreenmarker = 
{
	_name = _this select 0;
	_replacementVal = _this select 1;
	_replacementIndex = _this select 2;
	_index = [_name,screenMarkers] call fnc_find2d;

	if(_index > -1) then 
	{
		_data = screenMarkers select _index;
		_data set [_replacementIndex,_replacementVal];
		screenMarkers set [_index,_data];
	};
};

//INPUT array of arrays, RETURN items which exist on all arrays
fnc_getSimiliarIndexes = 
{
	_arrays = _this select 0;
	_return = [];
    
    //Make copy of the original first array
    _ogAr = _arrays select 0;
    _nAr = [];
    _count = count _arrays;
    
	for [{_i = 1}, {_i < _count }, {_i = _i + 1}] do 
	{
       _nAr = _ogAr - (_arrays select _i) + _nAr; //Delete same indexes
	};
    _return = _ogAr - _nAr;

    _return;
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

fnc_interpolate = 
{
	// https://www.desmos.com/calculator/tmeeconifi
	_a = _this select 0;
	_c = _this select 1;
	_n = _this select 2;
	_d = _n*(_c^-_a);
	_ex = _this select 3;

	_return = (_ex^(1-_d))*(_c^_d);

	_return;
};

fnc_increaseWpSkill = 
{
	#define skillAddition 1
	_skillCategory = _this select 0;

	switch(_skillCategory) do
	{
		case 0:
		{
			assaultSkill = assaultSkill + skillAddition;
		};
		case 1:
		{
			engSkill = engSkill + skillAddition;
		};
		case 2:
		{
			sniperSkill = sniperSkill + skillAddition;
		};
		case 3:
		{
			supSkill = supSkill + skillAddition;
		};
		case 4:
		{

		};
	};
};

//Takes vehicle classname and returns upgrade count
fnc_countUpgrades = 
{
	private ["_vecType","_count","_y","_i"];
	_vecType = _this select 0;
	_count = 0;

	for [{_y=0}, {_y< count vehUpgList}, {_y=_y+1}] do
		{
			for [{_i=0}, {_i< count (vehUpgList select _y)}, {_i=_i+1}] do
			{
				if((_vecType) in (vehUpgList select _y)) exitWith //if current vehicle is upgradeable or can be upgraded to
				{
					_count = count (vehUpgList select _y)/2;
				};
			};
		};
	_count;
};

//Adds perk abilities
 setPerkLevel = 
 {
	_perk = _this select 0;
	_side = side player;
	 switch (_perk) do
	 {
		 case 0:
		{
		//Support
			switch (perkSupLVL) do
			{
					case 1:
					{
						launchers = launchers + AAunlockW1;
					};
			};
		};
			
		//Engineer perk
		case 1: 
		{
			switch (perkEngLVL) do
			{
				case 1:
				{
					_actionId8 = player addAction [localize "STR_M04t53", "data\scripts\etent.sqf",0,1, false, true,"test2"];
					BIS_EVO_PlayerModels = BIS_EVO_PlayerModels + BIS_EVO_EngModels;
					
					if(_side == west) then {launchers = launchers + ATunlockW1};
				};
				case 2:
				{ 
					if(_side == west) then {launchers = launchers + ATunlockW2};
				};
				case 3:
				{
					if(_side == west) then {launchers = launchers + ATunlockW3};
				};
				case 4:
				{
				};
			};
			_zone = (BIS_EVO_rengZones select (owner player));
			_zone setVariable ["lvl",perkEngLVL];
			publicVariable "_zone";
		};

		//Sniper perk
		case 2:
		{

		switch (perkSniperLVL) do
			{
				case 1:
				{
					egg_evo_Amb = EGG_EVO_allAmbs select 0;
					_actionId8 = player addAction ["Deploy Recon HQ", "actions\ambtent.sqf",0,1, false, true,"test2"];
					if(_side == west) then {rifles = rifles + sniperUnlockW1};
				};
				case 2:
				{
					egg_evo_Amb = EGG_EVO_allAmbs select 1;
					if(_side == west) then {rifles = rifles +  sniperUnlockW2};
				};
				case 3:
				{
					egg_evo_Amb = EGG_EVO_allAmbs select 2;
					if(_side == west) then {rifles = rifles + sniperUnlockW3};
				};
				case 4:
				{
					egg_evo_Amb = EGG_EVO_allAmbs select 3;
					if(_side == west) then {rifles = rifles +  sniperUnlockW4};
				};
			};

		};

		case 3:
		{
		//Assault perk
			switch (perkAssaultLVL) do
			{
				case 0:
				{

				};
			};
		};
	};
};

fnc_showMoney = 
{
	9 cutRsc ["DollarTitle","PLAIN"];
	_text =  format["<t color='#7FBF70'  shadow=0 valign='top' align='right'>  %1$</t>", money];
	(uiNameSpace getVariable "myUI_DollarTitle") ctrlSetStructuredText parsetext format ["%1",_text];
};

//Client side money addition
fnc_addMoney = 
{
	_amount = _this select 0;

	if(!(isNil "_amount")) then 
	{
		money = money + _amount;
		_text =  format["<t color='#7FBF70'  shadow=0 valign='top' align='right'>  %1$</t>", money];
		(uiNameSpace getVariable "myUI_DollarTitle") ctrlSetStructuredText parsetext format ["%1",_text];
	};
};

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


["sendToClient", 
{
	//private ["_type","_data","_name","_color","_message","_sound","_source","_sound","_dist","_msgType","_msg","_amount","_hitSounds","_count","_screenMarkers"];
	local _type = _this select 1;

	switch (_type) do
	{
		case "hm": //Hitmarker
		{
			local _hitSounds = ["hit1","hit2","hit3"];
			3 cutRsc ["Hitmarker","PLAIN"];
			local _sound = _hitSounds select round (random ((count _hitSounds)-1));
			playSound _sound;
		};
		case "msg": //All Messages
		{
			local _data = _this select 2;
			local _msgType = _data select 0;
			local _msg = _data select 1;
			if(_msgType == "ss") exitWith {systemChat _msg};
			if(_msgType == "gs") exitWith {player globalChat _msg};
		};
		case "am": //Add Money
		{
			local _data = _this select 2;
			local _amount = _data select 0;
			local _ranked = _data select 1;
			if(!isNil "_ranked") then {totalIncome = totalIncome + _amount};
			[_amount] call fnc_addMoney;
		};
		case "fnc_ctrlChangeColor":
		{	
			local _data = _this select 2;		
			local _name = _data select 0;
			local _color = _data select 1;
			[_name,_color,5] call fnc_changeScreenmarker;
		};
		case "hdm": //Hud Message
		{
			local _data = _this select 2;
			local _message = _data select 0;
			local _amount = _data select 1;
			[_message,_amount] spawn fnc_clientHudMessage;
		};
		case "ps": //Play Sound
		{
		    local _data = _this select 2;
			local _sound = _data select 0;
			playSound _sound;
		};
		case "s3":
		{
		    local _data = _this select 2;
			local _source = _data select 0;
			local _sound = _data select 1;
			local _dist = _data select 2;
			_source say3d [_sound,_dist];
		};
		case "gm": //Get Money
		{
			local _data = _this select 2;
			local _count = _data select 0;
			bank set [_count,[name player,money]];
			publicVariable "bank";
		};
		case "bf": //Broadcast flags
		{
			local _data = _this select 2;
			local _screenMarkers = _data select 0;
			[_screenMarkers] call fnc_initFlagUi;
		};
	};
}] call CBA_fnc_addLocalEventHandler;


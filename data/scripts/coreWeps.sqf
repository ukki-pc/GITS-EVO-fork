#include "macros.h"

disableSerialization;
uiNamespace setVariable ["displayVendor", findDisplay 177];
uiNamespace setVariable ["ctrlTitle", (uiNamespace getVariable "displayVendor") displayCtrl 101];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl weaponListBox];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl magListBox];
//uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl ammoListBox];
uiNamespace setVariable["ctrlWeaponPreview", (uiNamespace getVariable "displayVendor") displayCtrl weaponPicture];
uiNamespace setVariable["wepDesc", (uiNamespace getVariable "displayVendor") displayCtrl weaponDesc];
uiNamespace setVariable["displayVendor", (uiNamespace getVariable "BMulti") displayCtrl weaponDesc];



allItems = [assaultRifles,smgs,pistols,rifles,launchers,mgs,miscs];
itemSkills = [assaultSkill,engSkill,100,sniperSkill,supSkill+engSkill,supSkill,100];

Wpage = 0;
lastSel = 0;

//Generates list of items
BIS_EVO_ListUpdate = 
{	
	local _sel = _this select 0;
	lbClear weaponListBox;
	lbClear magListBox;
	_item = "";
	_picture = "";
	_backpacks = ["Empty Pack","5.56 CQC Pack","7.62 CQC Pack","Grenadier Pack","Stealth MP5 pack","ENG Satchels","ENG Mines","AT M136", "AT SMAW","AT MAAWS","AT NLAW","AT Javelin","AT Dragon","Marksman DMR Pack","Sniper M24-M40 Pack","Sniper M24-M40 Pack", "Marksman M110 Pack","Sniper LRR Pack","AA Stinger Pack","Sniper M107-AS50 Pack","MG M240 Pack","MG SAW Pack"];
	
	_categoryItems = allItems select Wpage;
	_totalItems = count _categoryItems;
	_skillRequired = 0;

	//Backpack menu
	if(Wpage == 7) exitWith 
	{
		local _pic = (getText (configFile >> "cfgMarkers" >> "plp_icon_backpack" >> "icon"));
		{
			lbadd [weaponListBox,_x];
			lbSetPicture[weaponListBox, _forEachIndex,_pic];
		}forEach _backpacks;
		lbSetCurSel [weaponListBox,0]; 
	};

	if (count _categoryItems > 0) then 
	{
		for [{_i=0}, {_i<_totalItems}, {_i=_i+1}] do
		{
			_x = _categoryItems select _i;

			_item = [_x,"displayName","CfgWeapons"] call fnc_getCfgText;
			
			//If it's not weapon then its probs a magazine
			if (_item == "") then {_item = [_x,"displayName","CfgMagazines"] call fnc_getCfgText};
			if (_item != "") then 
			{
				_picture = getText(configFile >> "cfgWeapons" >> _x >> "picture");
				if(_picture == "") then {_picture = getText(configFile >> "cfgMagazines" >> _x >> "picture");};
			
				lbadd [weaponListBox,_item];
				lbSetData[weaponListBox,_i,_x]; //Might need remove loop too
				//lbSetValue[weaponListBox,_i,_skillRequired];
				lbSetPicture[weaponListBox, _i, _picture];

				if !(_x in weaponsNamespace) then { lbSetColor[weaponListBox, _i, colorLocked]}
				else { lbSetColor[weaponListBox, _i, colorUnlocked]};
			};
		};	
	};

	if(isNil "_sel") then {lbSetCurSel [weaponListBox,0]}
	else {lbSetCurSel [weaponListBox,_sel];};
	lbSetCurSel [magListBox,0]; 
};	
//Endlsts

BIS_EVO_ActButton = 
{
	_index = lbCurSel weaponListBox;
	_mIndex = lbCurSel magListBox;
	if(Wpage == 7) exitWith 
	{
		if(([weaponBoxes,position player] call BIS_fnc_nearestPosition) distance player < 15)
		then {[_index+1] execVM "data\scripts\backpacks.sqf";playSound "wepBuy"}
		else {hint "Must be near ammoboox!"};
	};
	_item =  lbData [weaponListBox,_index];
	_mag = lbData [magListBox,_mIndex];
	if(_item != "") then
	{
		if (!(_item in weaponsNamespace)) then 
		{
			weaponsNamespace = weaponsNamespace + [_item];

			if !(_mag in allMagazines) then {allMagazines = allMagazines + [_mag]};

			playSound "wepBuy";
			[_index] call BIS_EVO_ListUpdate;
			{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;
		}
		else
		{
			weaponsNamespace = weaponsNamespace - [_item];
			[_index] call BIS_EVO_ListUpdate;
			playSound "wepSell";
			{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;
		};
	};
	curSelW = _index;
};


BIS_EVO_ActButtonM = 
{
	local _index = lbCurSel magListBox;
	local _item =  lbData [magListBox,_index];

	if(_item != "") then
	{
		if (!(_item in allMagazines)) then 
		{
			allMagazines = allMagazines + [_item];
			{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;
			playSound "wepBuy";
		}
		else
		{
			allMagazines = allMagazines - [_item];
			{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;
			playSound "wepSell";
		};
	};
};


BIS_EVO_ListSelect = 
{
    _wepSel = lbCurSel weaponListBox;
    _magSel = lbCurSel magListBox;
	if(lastSel != _wepSel) then {playSound "wepSelect"};

	_weapon = lbData [weaponListBox,_wepSel];
	_mag = lbData[magListBox,_magSel];
	lbClear magListBox;

	_magazines = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
	local _isBackPack = ((wpage == 7));
	local _isMag = (isClass(configFile>>"cfgMagazines">>_weapon));
	local _count = 0;

	if(_isMag) then {_mag = _weapon};

	if(!_isBackPack) then 
	{	
		_ammo =  (getText (configFile >> "CfgMagazines" >> _mag >> "ammo"));
		_dis =  format["Damage: %1",(getNumber (configFile >> "CfgAmmo" >> _ammo >> "Hit"))];
		_oz =  getNumber (configFile >> "CfgWeapons" >> _weapon >> "OpticsZoomMax");
		_cal = format["Area Damage: %1",(getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHit"))];
		_spd =  format["Velocity: %1 m/s",(getNumber (configFile >> "CfgMagazines" >> _mag >> "initSpeed"))];
		if(_spd =="") then {_spd = "N/A"};
		_name = format["%1",(getText (configFile >> "CfgMagazines" >> _mag >> "displayName"))];
		(uiNamespace getVariable "wepDesc") ctrlSetStructuredText parsetext format ["%1<br/>%2<br/>%3<br/>%4<br/>Zoom: %5x",_name,_dis,_spd,_cal,(1.1/_oz)];

		//(uiNamespace getVariable "wepDesc") ctrlShow false;
		
		//ctrlSetText [weaponDesc,format["%1%2%3",_dis,_spd]];
		{
			if !(_x in magazineBanList) then 
			{	
				_name = getText(configFile >> "cfgMagazines" >> _x >> "displayName");
				_pic = (getText (configFile >> "cfgMagazines" >> _x >> "picture"));
				lbadd [magListBox,_name];
				lbSetData[magListBox,_count,_x];
				lbSetPicture[magListBox,_count,_pic];
				if(_x in allMagazines) then {lbSetColor[magListBox, _count, colorUnlocked]}
				else{lbSetColor[magListBox, _count, colorLocked]};
				_count = _count + 1;
			}
		}forEach _magazines;
	};
	lastSel = _wepSel;
};

[] call BIS_EVO_ListUpdate;
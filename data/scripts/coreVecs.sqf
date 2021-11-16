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

cPage = 0;
lastSel = 0;

//Generates list of items
BIS_EVO_ListUpdate = 
{	
	local _sel = _this select 0;
	lbClear weaponListBox;
	lbClear magListBox;
	_allItems = [buyCarList,buyTankList,buyAirList,buyStatList];

	_catItems = _allItems select cpage;

	{
		lbAdd [weaponListBox,[_x select 0,"displayName","cfgVehicles"] call fnc_getCfgText];
		///_picture = getText(configFile >> "cfgVehicles" >> _x >> "picture");
		lbSetPicture [weaponListBox, _forEachIndex,[_x select 0,"picture","cfgVehicles"] call fnc_getCfgText];
		lbSetData [weaponListBox,_forEachIndex,_x select 0];
		lbSetValue [weaponListBox,_forEachIndex,_x select 1];
	}forEach _catItems;

	if(isNil "_sel") then {lbSetCurSel [weaponListBox,0]}
	else {lbSetCurSel [weaponListBox,_sel];};
	lbSetCurSel [magListBox,0]; 
};	
//Endlsts

BIS_EVO_ActButton = 
{
	_mIndex = lbCurSel magListBox;
	_mag = lbData [magListBox,_mIndex];
};


BIS_EVO_ActButtonM = 
{
	local _index = lbCurSel magListBox;
	local _item =  lbData [magListBox,_index];

	local _canBuy = (inrepairzone and vehicle player isKindOf "Man");

	if(_canBuy) then {_nul = [player,_item] execVM "actions\static\makevehicle.sqf";closeDialog 1;}
	else {hint "Cant buy here!"};
};

BIS_EVO_ListSelect = 
{
    _wepSel = lbCurSel weaponListBox;
    _magSel = lbCurSel magListBox;
	if(lastSel != _wepSel) then {playSound "wepSelect"};

	_weapon = lbData [weaponListBox,_wepSel];
	_price = lbValue [weaponListBox,_wepSel];
	_mag = lbData[magListBox,_magSel];
	lbClear magListBox;

	_carI = 0;
	_priceI = 0;

	_name = format["%1",(getText (configFile >> "CfgVehicles" >> _weapon >> "displayName"))];
	_pic = format["%1",(getText (configFile >> "CfgVehicles" >> _weapon >> "picture"))];

	_spd =  (getNumber (configFile >> "CfgVehicles" >> _weapon >> "maxSpeed"));
	_dis =  format["Armor: %1",(getNumber (configFile >> "CfVehicles" >> _mag >> "Armor"))];
	// _oz =  getNumber (configFile >> "CfgWeapons" >> _weapon >> "OpticsZoomMax");
	// _cal = format["Area Damage: %1",(getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHit"))];
	//_spd =  format["Velocity: %1 m/s",(getNumber (configFile >> "CfgMagazines" >> _mag >> "initSpeed"))];

	_magazines = vehUpgList select ([_weapon,vehUpgList] call fnc_find2d);

	//Add select variant to top
	if(isNil "_magazines") then 
	{
		lbadd [magListBox,_name];
		lbSetPicture [magListBox,0,_pic];
		lbSetData [magListBox,0,_weapon];
		lbSetValue [magListBox,0,_price];
		if(_weapon in storedVehicles) then {lbSetColor[magListBox, 0, colorUnlocked]}
		else{lbSetColor[magListBox, 0, colorLocked]};
		_carI = 1;
		_priceI = 1;
	};

	//Add vehicle variants to the right side list
	{
		if (typename _x == "STRING") then 
		{	
			_name = getText(configFile >> "cfgVehicles" >> _x >> "displayName");
			_pic = (getText (configFile >> "cfgVehicles" >> _x >> "picture"));
			lbadd [magListBox,_name];
			lbSetData[magListBox,_carI,_x];
			lbSetPicture[magListBox,_carI,_pic];
			if(_x in storedVehicles) then {lbSetColor[magListBox, _carI, colorUnlocked]}
			else{lbSetColor[magListBox, _carI, colorLocked]};
			_carI = _carI + 1;
		}
		else 
		{
			_priceI + _priceI +1;
		};
	}forEach _magazines;

	(uiNamespace getVariable "wepDesc") ctrlSetStructuredText parsetext format ["%1<br/>Price: %2<br/>Speed: %3",_name,_price,_spd];
	lastSel = _wepSel;
};

[] call BIS_EVO_ListUpdate;
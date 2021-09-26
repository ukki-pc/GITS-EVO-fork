#define weaponListBox 4000
#define variantListBox 4002
#define weaponPicture 4003
#define ammoListBox 4004
#define colorUnlocked [0, 1, 0, 1]
#define colorLocked [1, 0, 0, 1]

disableSerialization;
uiNamespace setVariable ["displayVendor", findDisplay 177];
uiNamespace setVariable ["ctrlTitle", (uiNamespace getVariable "displayVendor") displayCtrl 101];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl weaponListBox];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl variantListBox];
//uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl ammoListBox];
uiNamespace setVariable["ctrlWeaponPreview", (uiNamespace getVariable "displayVendor") displayCtrl weaponPicture];

allItems = [assaultRifles,smgs,shotguns,pistols,rifles,launchers,mgs,miscs];

Wpage = 0;

//Generates list of items
BIS_EVO_ListUpdate = 
{	
	lbClear weaponListBox;
	_item = "";
	_picture = "";

	_categoryItems = allItems select Wpage;

	if (count _categoryItems > 0) then 
	{
		_size = 0;
		{
			_item = [_x,"displayName","CfgWeapons"] call fnc_getCfgText;
			
			//If it's not weapon then its probs a magazine
			if (_item == "") then {_item = [_x,"displayName","CfgMagazines"] call fnc_getCfgText};
			if (_item != "") then 
			{
				_picture = getText(configFile >> "cfgWeapons" >> _x >> "picture");
				if(_picture == "") then {_picture = getText(configFile >> "cfgMagazines" >> _x >> "picture");};
			
				lbadd [weaponListBox,_item];
				lbSetData[weaponListBox,_size,_x]; //Might need remove loop too
				lbSetPicture[weaponListBox, _size, _picture];

				if !(_x in weaponsNamespace) then { lbSetColor[weaponListBox, _size, colorLocked]}
				else {lbSetColor[weaponListBox, _size, colorUnlocked]};
				_size = _size + 1;
			};
		} forEach _categoryItems;	
	};
};	
//Endlsts

BIS_EVO_ActButton = 
{
	_index = lbCurSel weaponListBox;
	_categoryItems = allItems select Wpage;
	_item =  lbData [weaponListBox,_index];

	if(_item != "") then
	{
		if !(_item in weaponsNamespace) then 
		{
			weaponsNamespace = weaponsNamespace + [_item];
				_magazines = (getArray (configFile >> "CfgWeapons" >> _item >> "magazines"));
				{
					if !(_x in allMagazines) then 
					{
						if !(_x in magazineBanList) then 
						{	
							allMagazines = allMagazines + [_x];
						}
					};
				}forEach _magazines;
			playSound "caching";
			[] call BIS_EVO_ListUpdate;
			{_handle = [_x] execVM "actions\refreshweps.sqf"}forEach weaponBoxes;
		};
	};
};

BIS_EVO_ListSelect =
{
	_index = lbCurSel weaponListBox;
	lbClear ammoListBox;
};

[] call BIS_EVO_ListUpdate;


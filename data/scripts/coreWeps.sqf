#define weaponListBox 4000
#define variantListBox 4002
#define weaponPicture 4003
#define ammoListBox 4004
#define colorUnlocked [0, 1, 0, 1]
#define colorLocked [0.5, 0.5, 0.5, 1]
#define colorDisabled [0.5, 0.5, 0.5, 1]

disableSerialization;
uiNamespace setVariable ["displayVendor", findDisplay 177];
uiNamespace setVariable ["ctrlTitle", (uiNamespace getVariable "displayVendor") displayCtrl 101];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl weaponListBox];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl variantListBox];
//uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl ammoListBox];
uiNamespace setVariable["ctrlWeaponPreview", (uiNamespace getVariable "displayVendor") displayCtrl weaponPicture];

allItems = [assaultRifles,smgs,pistols,rifles,launchers,mgs,miscs];
itemSkills = [assaultSkill,engSkill,100,sniperSkill,supSkill+engSkill,supSkill,100];

Wpage = 0;

//Generates list of items
BIS_EVO_ListUpdate = 
{	
	lbClear weaponListBox;
	_item = "";
	_picture = "";

	_categoryItems = allItems select Wpage;
	_totalItems = count _categoryItems;
	_skillRequired = 0;

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

				if !(_x in weaponsNamespace) then { lbSetColor[weaponListBox, _i, colorLocked]};
				if (_x in weaponsNamespace) then { lbSetColor[weaponListBox, _i, colorUnlocked]};
			};
		};	
	};
};	
//Endlsts

BIS_EVO_ActButton = 
{
	_index = lbCurSel weaponListBox;
	_item =  lbData [weaponListBox,_index];
	if(_item != "") then
	{
		if (!(_item in weaponsNamespace)) then 
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

[] call BIS_EVO_ListUpdate;


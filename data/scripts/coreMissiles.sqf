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

EB_PLbombs = ["EB_Mk81_Launcher","EB_Mk82_Launcher","EB_Mk83_Launcher","EB_Mk84_Launcher","EB_Mk77_Launcher","EB_GBU12_Launcher","EB_Mk770_Launcher","EB_BombLauncher_fab250","EB_BombLauncher_fab500","EB_CBU78B_Launcher","EB_CBU87B_Launcher","EB_R77_Launcher","EB_CBU89B_Launcher","EB_CBU100_Launcher","EB_GBU12_Launcher","EB_GBU16_Launcher","EB_GBU10_Launcher","EB_BombLauncher_kab250","EB_BombLauncher_kab500"]; 
EB_PLmissiles = ["EB_AIM9M_Launcher","EB_AIM120_Launcher","EB_AIM9X_Launcher","EB_AIM7E_Launcher","EB_METEOR_Launcher","EB_AIM132_Launcher","EB_R60_Launcher","EB_R73_Launcher","EB_AT2_Launcher","EB_KH29D_Launcher","EB_KH29L_Launcher","EB_AGM65E_Launcher","EB_AGM114K_Launcher","EB_AGM88_Launcher"];
GLT_bombs = ["GLT_GBU24_Launcher","GLT_GBU53_Launcher","GLT_GBU39_Launcher","GLT_KAB1500_Launcher"];
GLT_missiles = ["GLT_AIM120_Launcher","GLT_AIM54_Launcher","GLT_R550_Launcher","GLT_AIM132_Launcher","GLT_METEOR_Launcher","GLT_AGM84_Launcher","GLT_AGM154A1_Launcher","GLT_AM39_Launcher","GLT_R3_Launcher","GLT_R27_Launcher","GLT_R77_Launcher","GLT_CH15S_Launcher","GLT_CH29T_Launcher","GLT_CH59_Launcher","GLT_CH31P_Launcher"];
uns_Missiles = ["uns_AIM9DLauncher","uns_AIM9ELauncher","uns_AGM65B_Launcher","uns_AGM45_Launcher","uns_AGM12_Launcher"];
uns_bombs = ["Uns_CBU24Launcher","Uns_NapalmLauncher_750","Uns_Napalm_blu1_Launcher","Uns_CBU75Launcher","Uns_CBU32ALauncher","Uns_CBU32BLauncher","Uns_GBU8Launcher",""];
rksl_missiles= ["RKSL_iristLauncher","RKSL_BrimstoneLauncher","RKSL_ALARM_Launcher","RKSL_stormshadow_Launcher","RKSL_agm119mk3_Launcher"];
extra_missiles = ["GLT_AM39_Launcher","AGM86Launcher","js_w_fa18_HarpoonLauncher","pook_BLU107_BombLauncher","pook_BetAB_BombLauncher","PRACS_JDAM_Launcher","PRACS_ET_CBU84_Launcher"];
EB_turrets = ["M197","PRACS_OV1_LA1","PRACS_SE_552","M621","2A42","YakB","M230","M168","EB_GAU8","GAU8","GAU12","ZPL_20","GSh301","GSh302","GSh23L","GSh23L","SMAF_MF1_DEFA_553","EB_GAU22","EB_M61A1","GLT_M61A1","EB_GP9","EB_NR30","EB_N37"];
extra_bombs = ["GLT_AGM154A_Launcher","GLT_AGM154A1_Launcher"];

EGG_missiles = uns_Missiles + uns_bombs + EB_PLmissiles + extra_missiles  + EB_PLbombs +GLT_bombs + extra_bombs ;// EB_PLmissiles +extra_missiles;

cPage = 0;
lastSel = 0;

//Generates list of items
BIS_EVO_ListUpdate = 
{	
	local _sel = _this select 0;
	lbClear weaponListBox;
	lbClear magListBox;
	local _plyWeps = weapons (vehicle player);
	_vec = vehicle player;
	_allItems = [EGG_missiles];

	//Get vehicle maximum weapons
	_ammoCount = 0;
	_typicalMags =  (getArray (configFile >> "CfgVehicles" >> typeof _vec >> "Magazines"));
	{
		_cAmmo = (getText (configFile >> "CfgMagazines" >> _x >> "Ammo"));
		if(_cAmmo isKindOf "MissileBase" or _cAmmo isKindOf "BombCore" and !(_cAmmo isKindof "RocketCore")) then {_ammoCount = _ammoCount + (getNumber (configFile >> "CfgMagazines" >> _x >> "Count"));};
	}forEach _typicalMags;

	_catItems = _allItems select cPage;
	{
		lbAdd [weaponListBox,[_x,"displayName","cfgWeapons"] call fnc_getCfgText];
		 lbSetData [weaponListBox,_forEachIndex,_x];
	}forEach _catItems;
	_i = 0;
	{
		_vec selectWeapon _x;
		_cMag = currentMagazine _vec;
		_ammoType = (getText (configFile >> "CfgMagazines" >> _cMag >> "Ammo"));
		_ammo =   (getNumber (configFile >> "CfgMagazines" >> _cMag >> "Count"));

		if (_ammoType isKindOf "MissileBase" or _ammoType isKindOf "BombCore") then 
		{
			lbAdd [magListBox,format ["[%1/%2] %3",_ammo,_ammoCount,[_x,"displayName","cfgWeapons"] call fnc_getCfgText]];
			lbSetData [magListBox,_i,_x];
			_i = _i + 1;
		};
	}forEach _plyWeps;
};	


BIS_EVO_ActButton = 
{
	_mIndex = lbCurSel weaponListBox;
	_wep = lbData [weaponListBox,_mIndex];
	_vec = vehicle player;

	_cMag = currentMagazine _vec;
	_cWep = currentWeapon _vec;

	_ammo =   (getNumber (configFile >> "CfgMagazines" >> _cMag >> "Count"));
	_purMags = getArray (configFile >> "CfgWeapons" >> _wep >> "magazines");
	//_ammoType = (getText (configFile >> "CfgMagazines" >> _cMag >> "Ammo"));

	// if(_ammoType isKindOf "MissileBase") then {systemChat "missile"};
	// if(_ammoType isKindOf "TurretBase") then {systemChat "turret"};
	// if(_ammoType isKindOf "RocketCore") then {systemChat "rocket"};
	// if(_ammoType isKindOf "BombCore") then {systemChat "bomb"};
	// if(_ammoType isKindOf "cmFlareAmmo") then {systemChat "Countermeasure"};

	// _gpsd = createDialog 'glt_airgpsmfd';
	//Find magazine with the same ammo count
	_removedAmmo = 0;
	_magsToAdd = [];
	_tempMagToAdd = [];
	_tempRemoveAmmo = 0;

	while {_removedAmmo < _ammo} do
	{
		{
			_ac = (getNumber (configFile >> "CfgMagazines" >> _x >> "Count"));
			if(_ac <= (_ammo - _removedAmmo)) then {_tempMagToAdd = [_x]; _tempRemoveAmmo = _ac};
		}forEach _purMags;
		
		_removedAmmo = _removedAmmo + _tempRemoveAmmo;
		_magsToAdd = _magsToAdd + _tempMagToAdd;
	};

	if(count _magsToAdd == 0) exitWith {hint "Could not find compatible weapon"};

	//Find all mags belonging to the current weapon
	

	//_vec removeWeapon _cWep;

	//Find the count of current same mags
	//_n = [_allMags,_cMag] call fnc_countItems;

	//Remove desired magazine
	//while {_cmag in magazines _vec} do {_vec removeMagazine _cmag};

	_allMags = magazines _vec;
	_allWeps = weapons _vec;

	_magTypes = getArray (configFile >> "CfgWeapons" >> _cWep >> "magazines");

	{
		if (_x in _magTypes) then {_vec removeMagazine _x; _allMags = _allMags - [_x]};
	}
	forEach _allMags;


	
	_lastindex = 0;
	{
		_fi = _allMags find _cMag;
		if(_fi > -1) then {_allMags set [_fi,_x]; _lastindex = _fi}
		 else {_allMags = [_allMags,[_x],_lastindex] call fnc_spliceToArray};
	}forEach _magsToAdd;
	
	_allWeps set [_allWeps find _cWep,_wep];

	{_vec removeMagazine _x}forEach magazines _vec;
	{_vec removeWeapon _x}forEach weapons _vec;

	{_vec addMagazine _x}forEach _allMags;
	{_vec addWeapon _x}forEach _allWeps;
	




	[] call BIS_EVO_ListUpdate;
};


BIS_EVO_ActButtonM = 
{
	local _index = lbCurSel magListBox;
	local _item =  lbData [magListBox,_index];
};


BIS_EVO_ListSelect = 
{
    _wepSel = lbCurSel weaponListBox;
    _plyVecWep = lbCurSel magListBox;
	if(lastSel != _wepSel) then {playSound "wepSelect"};
	_vec = vehicle player;

	_weapon = lbData [weaponListBox,_wepSel];
	_price = lbValue [weaponListBox,_wepSel];
	_plyWep = lbData[magListBox,_plyVecWep];
	_vec selectWeapon _plyWep;

};

[] call BIS_EVO_ListUpdate;
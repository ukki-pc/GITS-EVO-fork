//Eggbeast script for rearming planes and choppers with PRACS air weapons

// relies on EB_PRACS_hydra and EB_PRACS_nohydra in init
// EB_rearmfnP called from mainthreadc/EB_rearm
//EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnP.sqf",[_vec,_player,1], 5, true, true,"",""];

//1 Combat Air Patrol (CAP)
//2 Close Air Support (CAS)
//3 Anti Tank Air-Ground Missiles (AGM)
//4 Multi-role (MR)
//5 Bombs (BMB)
//6 Laser Guided Bombs (LGB)
//7 Suppression of Enemy Air Defences (SEAD)

EB_confirm_rearm=
{
	_fntype = _this select 0; //e.g.EB_astring1
	_stringa = "";
	_msg = "";
	_txt = "";
	_name = getText (configFile >> "CfgVehicles" >> typeOf (vehicle player)>> "displayName");
	_head = parseText format["<t color='#FFFFCC'>  %1</t>",_name];
	_separator1 = parseText "<br /><br />";
	_vecimg = parseText format["<t size='2.2'><img image='%1'/></t>",getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle player)] >> "picture")];
	_msgarray1 = [_vecimg," ",_head,_separator1];

	if (_fntype==1) then {_stringa = parseText "<img image='img\support\air.paa' size='2.0' shadow='false' /><br />Combat Air Patrol (CAP)</t>"};
	if (_fntype==2) then {_stringa = parseText "<img image='img\support\mark.paa' size='2.0' shadow='false' /><br />Close Air Support (CAS)</t>"};
	if (_fntype==3) then {_stringa = parseText "<img image='img\support\sup01.paa' size='2.0' shadow='false' /><br />Anti-Tank Air-Ground Missiles (AGM)</t>"};
	if (_fntype==4) then {_stringa = parseText "<img image='img\support\offensive.paa' size='2.0' shadow='false' /><br />Multi-Role Combat (MR)</t>"};
	if (_fntype==5) then {_stringa = parseText "<img image='img\support\strk.paa' size='2.0' shadow='false' /><br />Bombing Run (BMB)</t>"};
	if (_fntype==6) then {_stringa = parseText "<img image='img\support\vecs.paa' size='2.0' shadow='false' /><br />Laser Guided Bombs (LGB)</t>"};
	if (_fntype==7) then {_stringa = parseText "<img image='img\support\sead.paa' size='2.0' shadow='false' /><br />Suppressing Enemy Air Defences (SEAD)</t>"};

	_msgarray1 = _msgarray1+["Armed for "]+[_stringa];
	_txt = composeText _msgarray1;
	hintsilent _txt;
};

_vec = (vehicle player);
_type = typeOf (vehicle player);
_fnsel = _this select 3;

_vec removeAction EB_airfn1;
_vec removeAction EB_airfn2;
_vec removeAction EB_airfn3;
_vec removeAction EB_airfn4;
_vec removeAction EB_airfn5;
_vec removeAction EB_airfn6;
_vec removeAction EB_airfn7;

EB_airfn1=-1;
EB_airfn2=-1;
EB_airfn3=-1;
EB_airfn4=-1;
EB_airfn5=-1;
EB_airfn6=-1;
EB_airfn7=-1;

_weapons = weapons _vec;
{_vec removeweapon _x}forEach _weapons;
_magazines = magazines _vec;
//{if !(_x == "120Rnd_CMFlare_Chaff_Magazine") then {_vec removemagazine _x}}forEach _magazines;
{_vec removemagazine _x}forEach _magazines;

if ( (_vec isKindof "Helicopter") || (_type in  EB_twoseaterplanes) ) then
{
	_magt = _vec magazinesTurret [-1];
	{_vec removemagazine _x}forEach _magt;
	_wept = _vec weaponsTurret [-1];
	{_vec removeweapon _x}forEach _wept;
	{_vec removeMagazineTurret [_x,[-1]];}forEach _magt;

	_magt = _vec magazinesTurret [0];
	{_vec removemagazine _x}forEach _magt;
	_wept = _vec weaponsTurret [0];
	{_vec removeweapon _x}forEach _wept;
//	if(("LaserDesignator_mounted" in _weapons)) then {_vec removeweapon "LaserDesignator_mounted";_vec removeMagazine "LaserBatteries"};
};

_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
_vec addweapon "CMFlareLauncher";
player selectWeapon "CMFlareLauncher";
_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
player selectWeapon (_muzzles select 0);

if ( (_vec isKindof "Helicopter") || (_type in  EB_twoseaterplanes) ) then
{
	if (_vec isKindof "Helicopter") then
	{
		_vec removeMagazine "LaserBatteries";
		_vec addMagazine "LaserBatteries";
		if(not ("LaserDesignator_mounted" in _weapons)) then {_vec addweapon "LaserDesignator_mounted"};
	};
	_vec addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vec addweapon "CMFlareLauncher";
	player selectWeapon "CMFlareLauncher";
	_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
	player selectWeapon (_muzzles select 0);
};

_i = 0;
if (editor == 1) then 
{
	_i = 100;
} else
{
	//if CBA is running use this to play a global sound
	[-1, {_man = _this select 0; _man say "reload";},[player]] call cba_fnc_globalExecute;	
	//otherwise use this for private sound
//	playsound "reload";
	_i = 0;
};


_vec removeaction EB_airload1;
while {_i < 100} do 
{
	hintsilent format["Re-arming completion: %1",_i];
	if ((vehicle player) == player)then {_i=1000};
	if ((speed _vec < -1) or (speed _vec > 1) or (position _vec select 2 > 2.0) ) then {_i=1000};
	if ( (! alive _vec) or (! alive player) ) then {_i=1000};
	sleep 1.5;
	_i = _i + 5;
};
sleep 2;

if (_i < 1000) then 
{
  [_fnsel] call EB_confirm_rearm;
  EB_airload1 =-1;

  switch (_fnsel) do
  {
	case 1://CAP
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";

		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
		};
		if(_type == "AH1Z") then 
		{
//			_vec addMagazine "2100Rnd_20mm_M168";
//			_vec addweapon "M168";
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "8Rnd_Stinger";
			_vec addweapon "StingerLaucher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "8Rnd_Stinger";
			_vec addweapon "StingerLaucher";
		};

		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_F15_AIM7x2";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};

		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";

		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "6Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "6Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
//outer
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
//outer
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
//inner rack
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
//mid rack
			_vec addMagazine "PRACS_F15_AIM7x4";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_6Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "3lb_12Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";

		};
//no hydra
		if(_type == "PRACS_F16_PHSTRK") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";

		};
		if(_type == "PRACS_Mirage3_BMB") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";
		};
		if(_type == "PRACS_Etendard_GBU") then 
		{
			_vec addMagazine "DEFA_SE_552x320";
			_vec addMagazine "DEFA_SE_552x320";
			_vec addMagazine "DEFA_SE_552x320";
			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";
			_vec addMagazine "PRACS_ET_Magicx4";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";

		};
		if(_type == "PRACS_A4_HBMB") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
//helis
		if(_type == "PRACS_AH1S") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "PRACS_8Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "PRACS_AH1S_2") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "8Rnd_Stinger";
			_vec addweapon "StingerLaucher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "PRACS_RAH6") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_RAH_GA1F";
			_vec addMagazine "8Rnd_Stinger";
			_vec addweapon "StingerLaucher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};

	};
	case 2://CAS
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AH1Z") then 
		{
//			_vec addMagazine "1200Rnd_20mm_M621";
//			_vec addweapon "M621";
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "2Rnd_KB500";
			_vec addMagazine "2Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "2Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_A4_Mk83X2";
			_vec addweapon "PRACS_A4_Mk83_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
//mid
			_vec addMagazine "PRACS_GBU16x4";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
//mid
			_vec addMagazine "PRACS_GBU16x4";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_38Rnd_HYDRA70_laser";
			_vec addweapon "GLT_FFARLauncher_laser";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
		};
//hydra
		if(_type == "PRACS_F16_AT") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "PRACS_Mirage3_ATK") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACS_CBU52X3";
			_vec addweapon "PRACS_CBU52_Launcher";
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
		};
		if(_type == "PRACS_Etendard_ATK") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "PRACS_A4_ATK") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";

		};
//helis
		if(_type == "PRACS_AH1S") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "PRACS_AH1S_2") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "PRACS_AH6J") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
		};
	};
	case 3://AGM
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";			
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_TOW2";
			_vec addweapon "TOWLauncherSingle";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_4Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_4Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "6Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "6Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
//inner rack
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
//mid rack
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "PRACS_AGM88x2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addweapon "PRACS_AGM88_Launcher";
//inner rack
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
//mid rack
			_vec addMagazine "PRACs_A4_4rd_Maverick";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "GLT_6Rnd_AGM65";
			_vec addweapon "GLT_AGM65_Launcher";
			_vec addMagazine "3lb_12Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
//no hydra
		if(_type == "PRACS_F16_PHSTRK") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
		};
		if(_type == "PRACS_Mirage3_BMB") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";

		};
		if(_type == "PRACS_Etendard_GBU") then 
		{
			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";
			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";

		};
		if(_type == "PRACS_A4_HBMB") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";

		};
//helis
		if(_type == "PRACS_AH1S") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_8Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "PRACS_AH1S_2") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "PRACS_RAH6") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_RAH_GA1F";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
		};
	};
	case 4://MR
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_CBU52X3";
			_vec addweapon "PRACS_CBU52_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "40Rnd_80mm";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_4Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH1Z") then 
		{
//			_vec addMagazine "1200Rnd_20mm_M621";
//			_vec addweapon "M621";
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_4Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};

		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addMagazine "4Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
			_vec addweapon "RKT_fb250Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addMagazine "4Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
			_vec addweapon "RKT_fb250Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_4Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_AGM65";
			_vec addweapon "GLT_AGM65_Launcher";
			_vec addMagazine "3lb_2Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_GBU53";
			_vec addweapon "GLT_GBU53_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_OV1_M117x2";
			_vec addweapon "PRACS_OV1_M117_Launcher";
			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
		};
//hydra
		if(_type == "PRACS_F16_AT") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";

		};
		if(_type == "PRACS_Mirage3_ATK") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
		};
		if(_type == "PRACS_Etendard_ATK") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
		};
		if(_type == "PRACS_A4_ATK") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
			_vec addMagazine "PRACS_A4_Mk83X2";
			_vec addweapon "PRACS_A4_Mk83_Launcher";
		};
//helis
		if(_type == "PRACS_AH1S") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_8Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "PRACS_AH1S_2") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "PRACS_AH6J") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
	};
	case 5://BMB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
			_vec addMagazine "PRACS_Mk81X12";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";
			_vec addMagazine "PRACS_Mk81X12";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "PRACS_F16Mk82x12";
			_vec addweapon "PRACS_F16Mk82_Launcher";
			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
		};

		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addMagazine "PRACS_Mk81X2";
			_vec addweapon "PRACS_Mk81_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "4Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "2Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_A4_Mk83X2";
			_vec addweapon "PRACS_A4_Mk83_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";
			_vec addMagazine "PRACS_A4_Mk83X2";
			_vec addweapon "PRACS_A4_Mk83_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "js_w_fa18_GBU31BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "js_w_fa18_GBU31BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_2Rnd_MK84";
			_vec addweapon "GLT_MK84_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";
			_vec addMagazine "PRACS_Mk81X12";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "PRACS_F16Mk82x12";
			_vec addweapon "PRACS_F16Mk82_Launcher";
			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
		};
//no hydra
		if(_type == "PRACS_F16_PHSTRK") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "PRACS_Mirage3_BMB") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";

		};
		if(_type == "PRACS_Etendard_GBU") then 
		{
			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";
			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addweapon "PRACS_ET_Magic_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addweapon "PRACS_ET_750_Launcher";
		};
		if(_type == "PRACS_A4_HBMB") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_Mk82rx6";
			_vec addweapon "PRACS_F16_Mk82r_Launcher";
			_vec addMagazine "PRACS_A4_750lbX6";
			_vec addweapon "PRACS_A4_750lb_Launcher";
		};
//helis
		if(_type == "PRACS_AH1S") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
		};
		if(_type == "PRACS_AH1S_2") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
		};
		if(_type == "PRACS_RAH6") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_RAH_GA1F";
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
	};
	case 6://LGB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "10Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "2Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "8Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "PRACS_GBU10x2";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "PRACS_GBU16x4";
//centre body
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
//inner rack
//mid rack
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
			_vec addMagazine "PRACS_F16_GBU39x8";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_2Rnd_GBU12";
			_vec addweapon "GLT_GBU12_Launcher";
			_vec addMagazine "GLT_2Rnd_GBU24";
			_vec addweapon "GLT_GBU24_Launcher";
			_vec addMagazine "GLT_2Rnd_GBU53";
			_vec addweapon "GLT_GBU53_Launcher";
			_vec addMagazine "3lb_12Rnd_pylonblank";
		};
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
		};
//no hydra
		if(_type == "PRACS_F16_PHSTRK") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";

		};
		if(_type == "PRACS_Mirage3_BMB") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";
		};
		if(_type == "PRACS_Etendard_GBU") then 
		{
			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";
			_vec addMagazine "PRACS_ET_CBU84x4";
			_vec addweapon "PRACS_ET_CBU84_Launcher";

		};
		if(_type == "PRACS_A4_HBMB") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";

		};

	};
	case 7://SEAD
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";

		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
		};
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
		};
//Gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "4Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "4Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
//mid
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addweapon "js_w_fa18_HarpoonLauncher";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//centre body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";

		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
//outer
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
//body
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addweapon "PRACS_F16CBU84_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
	};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_2Rnd_AGM154A";
			_vec addweapon "GLT_AGM154A_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
		
//all
		if(_type == "PRACS_F15") then 
		{
			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
		};
		if(_type == "PRACS_Mohawk") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
		};
		if(_type == "PRACS_C130") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
		};
//no hydra
		if(_type == "PRACS_F16_PHSTRK") then 
		{
			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";
			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addweapon "PRACS_F16_SidewinderLauncher";
			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
		};
		if(_type == "PRACS_Mirage3_BMB") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";

		};
		if(_type == "PRACS_Etendard_GBU") then 
		{
			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";

		};
		if(_type == "PRACS_A4_HBMB") then 
		{
			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";
			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";
			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";


		};

	};
  };
};

/*

//PRACS air weapons

//door guns

//left
	_vec addWeapon "M240_VEH";
	_vec addMagazineTurret ["1200Rnd_762x51_M240",[0]];
	_vec addMagazineTurret ["1200Rnd_762x51_M240",[0]];
	_vec addMagazineTurret ["1200Rnd_762x51_M240",[0]];
	_vec addMagazineTurret ["1200Rnd_762x51_M240",[0]];

//right
same

//cannon
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";

			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_OV1_LA1";

			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "PRACS_RAH_GA1F";

			_vec addMagazine "4200Rnd_762x51_M240";
			_vec addweapon "PRACS_UH1N_M240";

			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";

			_vec addMagazine "PRACS_F16_510Rnd_M61";
			_vec addweapon "PRACS_F16_M61";

			_vec addMagazine "PRACS_F15_510Rnd_M61";
			_vec addweapon "PRACS_F15_M61";

			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "PRACS_DEFA";

			_vec addMagazine "DEFA_SE_552x320";
			_vec addweapon "PRACS_SE_552";

			_vec addMagazine "DEFA_558x644";
			_vec addweapon "PRACS_558";

//rockets

			_vec addMagazine "FFARLauncher_14";
			_vec addweapon "14Rnd_FFAR";

			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";

			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";

AAM
			_vec addMagazine "PRACS_Heli_StingerX2";
			_vec addweapon "PRACS_Heli_Stinger_Launcher";

			_vec addMagazine "PRACS_F16_Sidewinderx2";
			_vec addMagazine "PRACS_F16_Sidewinderx4";
			_vec addweapon "PRACS_F16_SidewinderLauncher";

			_vec addMagazine "PRACS_F16_AIM120x2";
			_vec addweapon "PRACS_F16_AIM120_Launcher";

			_vec addMagazine "PRACS_F15_AIM120x2";
			_vec addweapon "PRACS_F15_AIM120_Launcher";

			_vec addMagazine "PRACS_M3AIM120x2";
			_vec addweapon "PRACS_M3AIM120_Launcher";

			_vec addMagazine "PRACS_F16_AIM7x2";
			_vec addweapon "PRACS_F16_AIM7_Launcher";

			_vec addMagazine "PRACS_F15_AIM7x4";
			_vec addweapon "PRACS_F15_AIM7_Launcher";

			_vec addMagazine "PRACS_R530x1";
			_vec addweapon "PRACS_R530_Launcher";

			_vec addMagazine "PRACS_ET_Magicx2";
			_vec addMagazine "PRACS_ET_Magicx4";
			_vec addweapon "PRACS_ET_Magic_Launcher";

//AGM
			_vec addMagazine "PRACS_4Rnd_UH1_TOW2";
			_vec addweapon "PRACS_UH1_TOWLauncher";

			_vec addMagazine "PRACS_4Rnd_TOW2";
			_vec addMagazine "PRACS_8Rnd_TOW2";
			_vec addweapon "PRACS_AH1_TOWLauncher";

			_vec addMagazine "PRACS_OV1_Hellfirex4";
			_vec addweapon "PRACS_OV1_HellfireLauncher";

			_vec addMagazine "PRACs_M3_4rd_Maverick";
			_vec addweapon "PRACS_MaverickLauncher";

			_vec addMagazine "PRACs_A4_4rd_Maverick";
			_vec addweapon "PRACS_A4_MaverickLauncher";

			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";

			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";

//BMB
			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";
			_vec addMagazine "PRACS_Mk81X12";
			_vec addweapon "PRACS_Mk81_Launcher";
			_vec addMagazine "PRACS_F16Mk82x12";
			_vec addweapon "PRACS_F16Mk82_Launcher";
			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";
			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";


			_vec addMagazine "PRACS_OV1_M117x2";
			_vec addweapon "PRACS_OV1_M117_Launcher";

			_vec addMagazine "PRACS_ET_Mk80x6";
			_vec addweapon "PRACS_ET_Mk80_Launcher";

			_vec addMagazine "PRACS_Mk81X2";
			_vec addMagazine "PRACS_Mk81X12";
			_vec addweapon "PRACS_Mk81_Launcher";

			_vec addMagazine "PRACS_A4_Mk81X6";
			_vec addMagazine "PRACS_A4_Mk81X12";
			_vec addweapon "PRACS_A4_Mk81_Launcher";

			_vec addMagazine "PRACS_mk82X2";
			_vec addweapon "PRACS_M3_Mk82_Launcher";

			_vec addMagazine "PRACS_F16Mk82x12";
			_vec addweapon "PRACS_F16Mk82_Launcher";

			_vec addMagazine "PRACS_F16_Mk82rx6";
			_vec addweapon "PRACS_F16_Mk82r_Launcher";


			_vec addMagazine "PRACS_M3_Mk83X2";
			_vec addweapon "PRACS_M3_Mk83_Launcher";

			_vec addMagazine "PRACS_A4_Mk83X2";
			_vec addweapon "PRACS_A4_Mk83_Launcher";

			_vec addMagazine "PRACS_F16_Mk83x4";
			_vec addweapon "PRACS_F16_Mk83_Launcher";


			_vec addMagazine "PRACS_ET_750lbx2";
			_vec addMagazine "PRACS_ET_750lbx6";
			_vec addweapon "PRACS_ET_750_Launcher";

			_vec addMagazine "PRACS_A4_750lbX6";
			_vec addweapon "PRACS_A4_750lb_Launcher";


			_vec addMagazine "PRACS_F16Mk84x4";
			_vec addweapon "PRACS_F16Mk84_Launcher";

			_vec addMagazine "PRACS_F16CBU84x4";
			_vec addMagazine "PRACS_F16CBU84x6";
			_vec addweapon "PRACS_F16CBU84_Launcher";

			_vec addMagazine "PRACS_ET_CBU84x4";
			_vec addweapon "PRACS_ET_CBU84_Launcher";

			_vec addMagazine "PRACS_CBU52X3";
			_vec addweapon "PRACS_CBU52_Launcher";

//LGB
			_vec addMagazine "PRACS_JDAMx4";
			_vec addweapon "PRACS_JDAM_Launcher";

			_vec addMagazine "PRACS_GBU16x4";
			_vec addweapon "PRACS_F16_GBU16_Launcher";

			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";

			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";

			_vec addMagazine "PRACS_ET_GBU12x4";
			_vec addweapon "PRACS_ET_GBU12_Launcher";

			_vec addMagazine "PRACS_GBU10x2";
			_vec addweapon "PRACS_F16_GBU10_Launcher";

			_vec addMagazine "PRACS_F16_GBU39x8";
			_vec addweapon "PRACS_F16_GBU39_Launcher";

//SEAD
			_vec addMagazine "PRACS_F16_Delilahx2";
			_vec addweapon "PRACS_F16_Delilah_Launcher";


//ASW
			_vec addMagazine "PRACS_Exocetx1";
			_vec addweapon "PRACS_Exocet_Launcher";

			_vec addMagazine "PRACS_ET_Exocetx2";
			_vec addweapon "PRACS_ET_Exocet_Launcher";

			_vec addMagazine "60Rnd_CMFlareMagazine";
//			_vec addMagazine "60Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "CMFlareLauncher";


undefined Mags
PRACS_JSOWx4
PRACS_Exocetx1


//EB_PRACS ammo
if used: eggbeast mission patch for PRACS air loadouts

PRACS_M61
PRACS_510Rnd_M61
PRACS_1020Rnd_M61
PRACS_1530Rnd_M61
PRACS_2040Rnd_M61

PRACS_FFARLauncher
PRACS_28Rnd_FFAR
PRACS_38Rnd_FFAR
PRACS_56Rnd_FFAR
PRACS_76Rnd_FFAR
PRACS_84Rnd_FFAR
PRACS_114Rnd_FFAR

PRACS_FFARLauncherL
PRACS_28Rnd_FFARL
PRACS_38Rnd_FFARL
PRACS_56Rnd_FFARL
PRACS_76Rnd_FFARL
PRACS_84Rnd_FFARL
PRACS_114Rnd_FFARL


PRACS_Mk82_Launcher
PRACS_Mk82x2
PRACS_Mk82x4
PRACS_Mk82x3
PRACS_Mk82x6
PRACS_Mk82x8
PRACS_Mk82x10
PRACS_Mk82x12

PRACS_Mk82r_Launcher
PRACS_Mk82rx2
PRACS_Mk82rx3
PRACS_Mk82rx4
PRACS_Mk82rx6
PRACS_Mk82rx8
PRACS_Mk82rx10
PRACS_Mk82rx12

PRACS_Mk83_Launcher
PRACS_Mk83x2
PRACS_Mk83x3
PRACS_Mk83x4
PRACS_Mk83x6
PRACS_Mk83x8
PRACS_Mk83x10

PRACS_Mk84_Launcher
PRACS_Mk84x2
PRACS_Mk84x3
PRACS_Mk84x4
PRACS_Mk84x6
PRACS_Mk84x8
PRACS_Mk84x10

PRACS_CBU84_Launcher
class PRACS_ET_CBU84_Launcher
PRACS_CBU84x2
PRACS_CBU84x3
PRACS_CBU84x4
PRACS_CBU84x6
PRACS_CBU84x8
PRACS_CBU84x10
PRACS_CBU84x12


PRACS_JSOW_Launcher
PRACS_JSOWx2
PRACS_JSOWx3
PRACS_JSOWx4
PRACS_JSOWx6
PRACS_JSOWx8

PRACS_JDAM_Launcher
PRACS_JDAMx2
PRACS_JDAMx3
PRACS_JDAMx4
PRACS_JDAMx6
PRACS_JDAMx8

PRACS_GBU39_Launcher
PRACS_GBU39x4
PRACS_GBU39x8
PRACS_GBU39x12
PRACS_GBU39x16

PRACS_GBU10_Launcher
PRACS_GBU10x2
PRACS_GBU10x3
PRACS_GBU10x4
PRACS_GBU10x6
PRACS_GBU10x8

PRACS_GBU12_Launcher
PRACS_GBU12x2
PRACS_GBU12x3
PRACS_GBU12x4
PRACS_GBU12x6
PRACS_GBU12x8

PRACS_GBU16_Launcher
PRACS_GBU16x2
PRACS_GBU16x3
PRACS_GBU16x4
PRACS_GBU16x6
PRACS_GBU16x8

PRACS_AIM9X_Launcher
PRACS_AIM9Xx2
PRACS_AIM9Xx3
PRACS_AIM9Xx4
PRACS_AIM9Xx6
PRACS_AIM9Xx8

PRACS_AIM120_Launcher
PRACS_AIM120x2
PRACS_AIM120x3
PRACS_AIM120x4
PRACS_AIM120x6
PRACS_AIM120x8
PRACS_AIM120x10

PRACS_AIM7_Launcher
PRACS_AIM7x2
PRACS_AIM7x3
PRACS_AIM7x4
PRACS_AIM7x6
PRACS_AIM7x8

PRACS_AGM65D_Launcher
PRACS_AGM65Dx2
PRACS_AGM65Dx3
PRACS_AGM65Dx4
PRACS_AGM65Dx6
PRACS_AGM65Dx8
PRACS_AGM65Dx10

PRACS_Delilah_Launcher
PRACS_Delilahx1
PRACS_Delilahx2
PRACS_Delilahx3
PRACS_Delilahx4
PRACS_Delilahx5
PRACS_Delilahx6

PRACS_AGM88_Launcher
PRACS_AGM88x2
PRACS_AGM88x3
PRACS_AGM88x4
PRACS_AGM88x6
PRACS_AGM88x8

PRACS_Exocet_Launcher
PRACS_Exocetx1
PRACS_Exocetx2
PRACS_Exocetx3
PRACS_Exocetx4
PRACS_Exocetx5
PRACS_Exocetx6


*/

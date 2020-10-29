// EB_rearmfn called from mainthreadc/EB_rearm
//EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfn.sqf",[_vec,_player,1], 5, true, true,"",""];
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
			_vec addweapon "GAU8";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";

		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
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
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
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
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "PRACS_AA8x2";
			_vec addweapon "PRACS_AA8_Launcher";
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
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//inner rack
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//mid rack
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
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
	};
	case 2://CAS
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";		
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
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
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
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
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "28Rnd_FFAR";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
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
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
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
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
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
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "PRACS_AA8x2";
			_vec addweapon "PRACS_AA8_Launcher";
			_vec addMagazine "2Rnd_FAB_250";
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//mid
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";
//inner rack
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addweapon "js_w_fa18_Mk82BombLauncher";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addweapon "js_w_fa18_Mk82BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_38Rnd_HYDRA70_laser";
			_vec addweapon "GLT_FFARLauncher_laser";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "3lb_2Rnd_pylonblank";
		};
	};
	case 3://AGM
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";			
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";			
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
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
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "6Rnd_TOW2";
			_vec addweapon "TOWLauncherSingle";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "6Rnd_CRV7_FAT";
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
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_TOW2";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "8Rnd_AT9_Mi24V";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT2_Mi24D";
			_vec addweapon "AT2Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "12Rnd_Vikhr_KA50";
			_vec addweapon "VikhrLauncher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "12Rnd_Vikhr_KA50";
			_vec addweapon "VikhrLauncher";
		};
//mod planes
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
			_vec addMagazine "2Rnd_Maverick_A10";
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
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
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
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//inner rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//inner rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
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
	};
	case 4://MR
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
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
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
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
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
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
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
			_vec addMagazine "4Rnd_AT2_Mi24D";
			_vec addweapon "AT2Launcher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "150Rnd_30mmAP_2A42";
			_vec addMagazine "150Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
			_vec addMagazine "8Rnd_AT9_Mi24V";
			_vec addweapon "AT9Launcher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "ibr_viggen_arak135_12Rnd";
			_vec addweapon "ibr_viggen_arak135Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
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
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
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
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x4";
			_vec addweapon "js_w_fa18_MaverickLauncher";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
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
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x4";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "GLT_2Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_AGM65";
			_vec addweapon "GLT_AGM65_Launcher";
			_vec addMagazine "3lb_2Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_GBU53";
			_vec addweapon "GLT_GBU53_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
	};
	case 5://BMB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_Mk82";
			_vec addMagazine "6Rnd_Mk82";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_Mk82";
			_vec addMagazine "6Rnd_Mk82";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
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
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
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
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
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
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
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
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";
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
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "3Rnd_Mk82";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
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
			_vec addweapon "js_w_fa18_GBU31BombLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
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
			_vec addweapon "js_w_fa18_GBU31BombLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mid rack
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";
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
			_vec addMagazine "3lb_2Rnd_pylonblank";
		};
	};
	case 6://LGB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "4Rnd_GBU12";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "ibr_viggen_arak135_12Rnd";
			_vec addweapon "ibr_viggen_arak135Launcher";
			_vec addMagazine "ibr_4Rnd_GBU12";
			_vec addweapon "ibr_GBU12_Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
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
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//centre body
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_Maverick_x2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
//mid rack
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";
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
			_vec addMagazine "GLT_2Rnd_GBU24";
			_vec addweapon "GLT_GBU24_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_GBU12";
			_vec addweapon "GLT_GBU12_Launcher";
			_vec addMagazine "3lb_2Rnd_pylonblank";
			_vec addMagazine "GLT_2Rnd_GBU53";
			_vec addweapon "GLT_GBU53_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
	};
	case 7://SEAD
	{
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
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addweapon "js_w_fa18_HarpoonLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
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
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addweapon "js_w_fa18_aim9xLaucher";
//outer
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x1";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addweapon "js_w_fa18_HarpoonLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
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
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_2Rnd_AGM154A";
			_vec addweapon "GLT_AGM154A_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "3lb_4Rnd_pylonblank";
		};
		
	};
  };
};

/*

EB_planes_west = ["A10","A10_US_EP1","F35B","AV8B","AV8B2","L159_ACR","L39_2_ACR","L39_ACR","C130J","C130J_US_EP1","An2_2_TK_CIV_EP1","Su25_CDF","Su25_TK_EP1","Su25_Ins","Su39","Su34","L39_TK_EP1","AH64D","AH64D_EP1","AH64D_Sidewinders","BAF_Apache_AH1_D","AH1Z","AW159_Lynx_BAF","AH6J_EP1","Mi24_D_CZ_ACR","Mi24_D_TK_EP1","Mi24_D","Mi24_P","Mi24_V","Ka52","Ka52Black","ibr_viggen1","ibr_maule_M7","ibr_tucano_lin","ibrPRACS_MiG21_AGgal"];

EB_planes_west_no = ["BAF_Merlin_HC3_D","CH_47F_BAF","MH60S","UH1Y","UH60M_EP1","CH_47F_EP1","MV22","UH1H_TK_GUE_EP1","UH1H_TK_EP1"];

EB_planes_east = ["Su34","Su39","Su25_Ins","Su25_CDF","Su25_TK_EP1","L39_TK_EP1","Mi24_D_TK_EP1","Mi24_D","Mi24_P","Mi24_V","Ka52","Ka52Black"];

		if(_type == "BAF_Merlin_HC3_D") then 
		{
		};	
		if(_type == "CH_47F_BAF") then 
		{
		};
		if(_type == "MH60S") then 
		{
		};	
		if(_type == "UH1Y") then 
		{
		};	
		if(_type == "UH60M_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "M134";
		};	
		if(_type == "CH_47F_EP1") then 
		{
		};
		if(_type == "MV22") then 
		{
		};		
		if(_type == "Mi24_D_CZ_ACR") then 
		{
		};		

/////////////////////Weapons/////////////////////////////

//blanks
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_5Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_pylonblank";
			_vec addMagazine "EB_7Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_9Rnd_pylonblank";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_11Rnd_pylonblank";
			_vec addMagazine "EB_12Rnd_pylonblank"
			_vec addweapon "EB_pylonblanker";

Guns
			_vec addMagazine "EB_350Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_650Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_950Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_1350Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";

			_vec addMagazine "EB_220Rnd_25mm_GAU12";
			_vec addMagazine "EB_440Rnd_25mm_GAU12";
			_vec addMagazine "EB_660Rnd_25mm_GAU12";
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";

			_vec addMagazine "EB_320Rnd_25mm_GAU22";
			_vec addMagazine "EB_640Rnd_25mm_GAU22";
			_vec addMagazine "EB_960Rnd_25mm_GAU22";
			_vec addMagazine "EB_1280Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";

			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addMagazine "EB_1545Rnd_M61_HEI";
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addMagazine "EB_1545Rnd_M61";
			_vec addMagazine "EB_2060Rnd_M61";
			_vec addweapon "EB_M61A1";

			_vec addMagazine "EB_200Rnd_23mm_GP9";
			_vec addMagazine "EB_400Rnd_23mm_GP9";
			_vec addMagazine "EB_600Rnd_23mm_GP9";
			_vec addMagazine "EB_800Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";

			_vec addMagazine "EB_160Rnd_23mm_nr23";
			_vec addMagazine "EB_240rnd_23mm_nr23";
			_vec addweapon "EB_nr23";

			_vec addMagazine "EB_140rnd_30mm_nr30";
			_vec addMagazine "EB_280rnd_30mm_nr30";
			_vec addMagazine "EB_420rnd_30mm_nr30";
			_vec addweapon "EB_NR30";

			_vec addMagazine "EB_40rnd_37mm_n37";
			_vec addMagazine "EB_80rnd_37mm_n37";
			_vec addMagazine "EB_160rnd_37mm_n37";
			_vec addweapon "EB_N37";

Rockets

			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addMagazine "EB_56Rnd_FFAR";
			_vec addMagazine "EB_76Rnd_FFAR";
			_vec addMagazine "EB_84Rnd_FFAR";
			_vec addMagazine "EB_114Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";

			_vec addMagazine "EB_14Rnd_FFARL";
			_vec addMagazine "EB_28Rnd_FFARL";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addMagazine "EB_56Rnd_FFARL";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addMagazine "EB_84Rnd_FFARL";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";

			_vec addMagazine "EB_6Rnd_CRV7_PG";
			_vec addMagazine "EB_12Rnd_CRV7_PG";
			_vec addMagazine "EB_19Rnd_CRV7_PG";
			_vec addMagazine "EB_24Rnd_CRV7_PG";
			_vec addMagazine "EB_38Rnd_CRV7_PG";
			_vec addweapon "EB_CRV7_PG_Launcher";

			_vec addMagazine "EB_12Rnd_CRV7_FAT";
			_vec addMagazine "EB_19Rnd_CRV7_FAT";
			_vec addMagazine "EB_24Rnd_CRV7_FAT";
			_vec addMagazine "EB_38Rnd_CRV7_FAT";
			_vec addMagazine "EB_48Rnd_CRV7_FAT";
			_vec addMagazine "EB_76Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";

			_vec addMagazine "EB_12Rnd_CRV7_HEPD";
			_vec addMagazine "EB_19Rnd_CRV7_HEPD";
			_vec addMagazine "EB_24Rnd_CRV7_HEPD";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "EB_48Rnd_CRV7_HEPD";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";

			_vec addMagazine "EB_192Rnd_57mm";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_32Rnd_57mm";
			_vec addMagazine "EB_16Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";

			_vec addMagazine "EB_192Rnd_57mmL";
			_vec addMagazine "EB_128Rnd_57mmL";
			_vec addMagazine "EB_64Rnd_57mmL";
			_vec addMagazine "EB_32Rnd_57mmL";
			_vec addMagazine "EB_16Rnd_57mmL";
			_vec addweapon "EB_57mmL_Launcher";

			_vec addMagazine "EB_20Rnd_80mm";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_60Rnd_80mm";
			_vec addMagazine "EB_80Rnd_80mm";
			_vec addMagazine "EB_100Rnd_80mm";
			_vec addMagazine "EB_120Rnd_80mm";
			_vec addMagazine "EB_140Rnd_80mm";
			_vec addMagazine "EB_160Rnd_80mm";
			_vec addMagazine "EB_20Rnd_S8T";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_60Rnd_S8T";
			_vec addMagazine "EB_80Rnd_S8T";
			_vec addMagazine "EB_100Rnd_S8T";
			_vec addMagazine "EB_120Rnd_S8T";
			_vec addMagazine "EB_140Rnd_S8T";
			_vec addMagazine "EB_160Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";

			_vec addMagazine "EB_20Rnd_80mm_lsr";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_60Rnd_80mm_lsr";
			_vec addMagazine "EB_80Rnd_80mm_lsr";
			_vec addMagazine "EB_100Rnd_80mm_lsr";
			_vec addMagazine "EB_120Rnd_80mm_lsr";
			_vec addMagazine "EB_140Rnd_80mm_lsr";
			_vec addMagazine "EB_160Rnd_80mm_lsr";
			_vec addMagazine "EB_20Rnd_S8T_lsr";
			_vec addMagazine "EB_40Rnd_S8T_lsr";
			_vec addMagazine "EB_60Rnd_S8T_lsr";
			_vec addMagazine "EB_80Rnd_S8T_lsr";
			_vec addMagazine "EB_100Rnd_S8T_lsr";
			_vec addMagazine "EB_120Rnd_S8T_lsr";
			_vec addMagazine "EB_140Rnd_S8T_lsr";
			_vec addMagazine "EB_160Rnd_S8T_lsr";
			_vec addweapon "EB_80mmL_Launcher";

			_vec addMagazine "EB_10Rnd_S13T";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";

AAM

			_vec addMagazine "EB_Stingerx1";
			_vec addMagazine "EB_Stingerx2";
			_vec addMagazine "EB_Stingerx3";
			_vec addMagazine "EB_Stingerx4";
			_vec addMagazine "EB_Stingerx5";
			_vec addMagazine "EB_Stingerx6";
			_vec addMagazine "EB_Stingerx7";
			_vec addMagazine "EB_Stingerx8";
			_vec addMagazine "EB_Stingerx9";
			_vec addMagazine "EB_Stingerx10";
			_vec addMagazine "EB_Stingerx11";
			_vec addMagazine "EB_Stingerx12";
			_vec addweapon "EB_FIM92_Launcher";

			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_AIM9Mx3";
			_vec addMagazine "EB_AIM9Mx4";
			_vec addMagazine "EB_AIM9Mx5";
			_vec addMagazine "EB_AIM9Mx6";
			_vec addMagazine "EB_AIM9Mx7";
			_vec addMagazine "EB_AIM9Mx8";
			_vec addMagazine "EB_AIM9Mx9";
			_vec addMagazine "EB_AIM9Mx10";
			_vec addMagazine "EB_AIM9Mx11";
			_vec addMagazine "EB_AIM9Mx12";
			_vec addweapon "EB_AIM9M_Launcher";

			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AIM9Xx3";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_AIM9Xx5";
			_vec addMagazine "EB_AIM9Xx6";
			_vec addMagazine "EB_AIM9Xx7";
			_vec addMagazine "EB_AIM9Xx8";
			_vec addMagazine "EB_AIM9Xx9";
			_vec addMagazine "EB_AIM9Xx10";
			_vec addMagazine "EB_AIM9Xx11";
			_vec addMagazine "EB_AIM9Xx12";
			_vec addweapon "EB_AIM9X_Launcher";

			_vec addMagazine "EB_AIM7Ex1";
			_vec addMagazine "EB_AIM7Ex2";
			_vec addMagazine "EB_AIM7Ex3";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addMagazine "EB_AIM7Ex5";
			_vec addMagazine "EB_AIM7Ex6";
			_vec addMagazine "EB_AIM7Ex7";
			_vec addMagazine "EB_AIM7Ex8";
			_vec addMagazine "EB_AIM7Ex9";
			_vec addMagazine "EB_AIM7Ex10";
			_vec addMagazine "EB_AIM7Ex11";
			_vec addMagazine "EB_AIM7Ex12";
			_vec addweapon "EB_AIM7E_Launcher";

			_vec addMagazine "EB_SA24x1";
			_vec addMagazine "EB_SA24x2";
			_vec addMagazine "EB_SA24x3";
			_vec addMagazine "EB_SA24x4";
			_vec addMagazine "EB_SA24x5";
			_vec addMagazine "EB_SA24x6";
			_vec addMagazine "EB_SA24x7";
			_vec addMagazine "EB_SA24x8";
			_vec addMagazine "EB_SA24x9";
			_vec addMagazine "EB_SA24x10";
			_vec addMagazine "EB_SA24x11";
			_vec addMagazine "EB_SA24x12";
			_vec addweapon "EB_SA24_Launcher";

			_vec addMagazine "EB_R60x1";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_R60x3";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_R60x5";
			_vec addMagazine "EB_R60x6";
			_vec addMagazine "EB_R60x7";
			_vec addMagazine "EB_R60x8";
			_vec addMagazine "EB_R60x9";
			_vec addMagazine "EB_R60x10";
			_vec addMagazine "EB_R60x11";
			_vec addMagazine "EB_R60x12";
			_vec addweapon "EB_R60_Launcher";

			_vec addMagazine "EB_R73x1";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R73x3";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_R73x5";
			_vec addMagazine "EB_R73x6";
			_vec addMagazine "EB_R73x7";
			_vec addMagazine "EB_R73x8";
			_vec addMagazine "EB_R73x9";
			_vec addMagazine "EB_R73x10";
			_vec addMagazine "EB_R73x11";
			_vec addMagazine "EB_R73x12";
			_vec addweapon "EB_R73_Launcher";

AGM
			_vec addMagazine "EB_AT2x1";
			_vec addMagazine "EB_AT2x2";
			_vec addMagazine "EB_AT2x3";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_AT2x5";
			_vec addMagazine "EB_AT2x6";
			_vec addMagazine "EB_AT2x7";
			_vec addMagazine "EB_AT2x8";
			_vec addMagazine "EB_AT2x9";
			_vec addMagazine "EB_AT2x10";
			_vec addMagazine "EB_AT2x11";
			_vec addMagazine "EB_AT2x12";
			_vec addweapon "EB_AT2_Launcher";

			_vec addMagazine "EB_AT6x1";
			_vec addMagazine "EB_AT6x2";
			_vec addMagazine "EB_AT6x3";
			_vec addMagazine "EB_AT6x4";
			_vec addMagazine "EB_AT6x5";
			_vec addMagazine "EB_AT6x6";
			_vec addMagazine "EB_AT6x7";
			_vec addMagazine "EB_AT6x8";
			_vec addMagazine "EB_AT6x9";
			_vec addMagazine "EB_AT6x10";
			_vec addMagazine "EB_AT6x11";
			_vec addMagazine "EB_AT6x12";
			_vec addweapon "EB_AT6_Launcher";

			_vec addMagazine "EB_AT9x1";
			_vec addMagazine "EB_AT9x2";
			_vec addMagazine "EB_AT9x3";
			_vec addMagazine "EB_AT9x4";
			_vec addMagazine "EB_AT9x5";
			_vec addMagazine "EB_AT9x6";
			_vec addMagazine "EB_AT9x7";
			_vec addMagazine "EB_AT9x8";
			_vec addMagazine "EB_AT9x9";
			_vec addMagazine "EB_AT9x10";
			_vec addMagazine "EB_AT9x11";
			_vec addMagazine "EB_AT9x12";
			_vec addMagazine "EB_AT9x13";
			_vec addMagazine "EB_AT9x14";
			_vec addMagazine "EB_AT9x15";
			_vec addMagazine "EB_AT9x16";
			_vec addweapon "EB_AT9_Launcher";

			_vec addMagazine "EB_AT9Fx1";
			_vec addMagazine "EB_AT9Fx2";
			_vec addMagazine "EB_AT9Fx3";
			_vec addMagazine "EB_AT9Fx4";
			_vec addMagazine "EB_AT9Fx5";
			_vec addMagazine "EB_AT9Fx6";
			_vec addMagazine "EB_AT9Fx7";
			_vec addMagazine "EB_AT9Fx8";
			_vec addMagazine "EB_AT9Fx9";
			_vec addMagazine "EB_AT9Fx10";
			_vec addMagazine "EB_AT9Fx11";
			_vec addMagazine "EB_AT9Fx12";
			_vec addMagazine "EB_AT9Fx13";
			_vec addMagazine "EB_AT9Fx14";
			_vec addMagazine "EB_AT9Fx15";
			_vec addMagazine "EB_AT9Fx16";
			_vec addweapon "EB_AT9F_Launcher";

			_vec addMagazine "EB_AT16x1";
			_vec addMagazine "EB_AT16x2";
			_vec addMagazine "EB_AT16x3";
			_vec addMagazine "EB_AT16x4";
			_vec addMagazine "EB_AT16x5";
			_vec addMagazine "EB_AT16x6";
			_vec addMagazine "EB_AT16x7";
			_vec addMagazine "EB_AT16x8";
			_vec addMagazine "EB_AT16x9";
			_vec addMagazine "EB_AT16x10";
			_vec addMagazine "EB_AT16x11";
			_vec addMagazine "EB_AT16x12";
			_vec addweapon "EB_AT16_Launcher";

			_vec addMagazine "EB_KH29Dx1";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_KH29Dx3";
			_vec addMagazine "EB_KH29Dx4";
			_vec addMagazine "EB_KH29Dx5";
			_vec addMagazine "EB_KH29Dx6";
			_vec addMagazine "EB_KH29Dx7";
			_vec addMagazine "EB_KH29Dx8";
			_vec addMagazine "EB_KH29Dx9";
			_vec addMagazine "EB_KH29Dx10";
			_vec addMagazine "EB_KH29Dx11";
			_vec addMagazine "EB_KH29Dx12";
			_vec addweapon "EB_KH29D_Launcher";

			_vec addMagazine "EB_KH29Lx1";
			_vec addMagazine "EB_KH29Lx2";
			_vec addMagazine "EB_KH29Lx3";
			_vec addMagazine "EB_KH29Lx4";
			_vec addMagazine "EB_KH29Lx5";
			_vec addMagazine "EB_KH29Lx6";
			_vec addMagazine "EB_KH29Lx7";
			_vec addMagazine "EB_KH29Lx8";
			_vec addMagazine "EB_KH29Lx9";
			_vec addMagazine "EB_KH29Lx10";
			_vec addMagazine "EB_KH29Lx11";
			_vec addMagazine "EB_KH29Lx12";
			_vec addweapon "EB_KH29L_Launcher";

			_vec addMagazine "EB_TOWx1";
			_vec addMagazine "EB_TOWx2";
			_vec addMagazine "EB_TOWx3";
			_vec addMagazine "EB_TOWx4";
			_vec addMagazine "EB_TOWx5";
			_vec addMagazine "EB_TOWx6";
			_vec addMagazine "EB_TOWx7";
			_vec addMagazine "EB_TOWx8";
			_vec addMagazine "EB_TOWx9";
			_vec addMagazine "EB_TOWx10";
			_vec addMagazine "EB_TOWx11";
			_vec addMagazine "EB_TOWx12";
			_vec addweapon "EB_BGM71_Launcher";

			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_AGM65Ex3";
			_vec addMagazine "EB_AGM65Ex4";
			_vec addMagazine "EB_AGM65Ex5";
			_vec addMagazine "EB_AGM65Ex6";
			_vec addMagazine "EB_AGM65Ex7";
			_vec addMagazine "EB_AGM65Ex8";
			_vec addMagazine "EB_AGM65Ex9";
			_vec addMagazine "EB_AGM65Ex10";
			_vec addMagazine "EB_AGM65Ex11";
			_vec addMagazine "EB_AGM65Ex12";
			_vec addweapon "EB_AGM65E_Launcher";

			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_AGM114Kx2";
			_vec addMagazine "EB_AGM114Kx3";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addMagazine "EB_AGM114Kx5";
			_vec addMagazine "EB_AGM114Kx6";
			_vec addMagazine "EB_AGM114Kx7";
			_vec addMagazine "EB_AGM114Kx8";
			_vec addMagazine "EB_AGM114Kx9";
			_vec addMagazine "EB_AGM114Kx10";
			_vec addMagazine "EB_AGM114Kx11";
			_vec addMagazine "EB_AGM114Kx12";
			_vec addweapon "EB_AGM114K_Launcher";

			_vec addMagazine "EB_AGM114Rx1";
			_vec addMagazine "EB_AGM114Rx2";
			_vec addMagazine "EB_AGM114Rx3";
			_vec addMagazine "EB_AGM114Rx4";
			_vec addMagazine "EB_AGM114Rx5";
			_vec addMagazine "EB_AGM114Rx6";
			_vec addMagazine "EB_AGM114Rx7";
			_vec addMagazine "EB_AGM114Rx8";
			_vec addMagazine "EB_AGM114Rx9";
			_vec addMagazine "EB_AGM114Rx10";
			_vec addMagazine "EB_AGM114Rx11";
			_vec addMagazine "EB_AGM114Rx12";
			_vec addweapon "EB_AGM114R_Launcher";

			_vec addMagazine "EB_AGM88x1";
			_vec addMagazine "EB_AGM88x2";
			_vec addMagazine "EB_AGM88x3";
			_vec addMagazine "EB_AGM88x4";
			_vec addMagazine "EB_AGM88x5";
			_vec addMagazine "EB_AGM88x6";
			_vec addMagazine "EB_AGM88x7";
			_vec addMagazine "EB_AGM88x8";
			_vec addMagazine "EB_AGM88x9";
			_vec addMagazine "EB_AGM88x10";
			_vec addMagazine "EB_AGM88x11";
			_vec addMagazine "EB_AGM88x12";
			_vec addweapon "EB_AGM88_Launcher";

Bomb

"EB_BombLauncherBase"     ------>  ripple 1,2,all
"EB_LargeBombLauncherBase"------>  ripple 1,2

			_vec addMagazine "EB_1Rnd_Mk81";
			_vec addMagazine "EB_2Rnd_Mk81";
			_vec addMagazine "EB_3Rnd_Mk81";
			_vec addMagazine "EB_4Rnd_Mk81";
			_vec addMagazine "EB_5Rnd_Mk81";
			_vec addMagazine "EB_6Rnd_Mk81";
			_vec addMagazine "EB_7Rnd_Mk81";
			_vec addMagazine "EB_8Rnd_Mk81";
			_vec addMagazine "EB_9Rnd_Mk81";
			_vec addMagazine "EB_10Rnd_Mk81";
			_vec addMagazine "EB_11Rnd_Mk81";
			_vec addMagazine "EB_12Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";

			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addMagazine "EB_3Rnd_Mk82";
			_vec addMagazine "EB_4Rnd_Mk82";
			_vec addMagazine "EB_5Rnd_Mk82";
			_vec addMagazine "EB_6Rnd_Mk82";
			_vec addMagazine "EB_7Rnd_Mk82";
			_vec addMagazine "EB_8Rnd_Mk82";
			_vec addMagazine "EB_9Rnd_Mk82";
			_vec addMagazine "EB_10Rnd_Mk82";
			_vec addMagazine "EB_11Rnd_Mk82";
			_vec addMagazine "EB_12Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";

			_vec addMagazine "EB_1Rnd_Mk83";
			_vec addMagazine "EB_2Rnd_Mk83";
			_vec addMagazine "EB_3Rnd_Mk83";
			_vec addMagazine "EB_4Rnd_Mk83";
			_vec addMagazine "EB_5Rnd_Mk83";
			_vec addMagazine "EB_6Rnd_Mk83";
			_vec addMagazine "EB_7Rnd_Mk83";
			_vec addMagazine "EB_8Rnd_Mk83";
			_vec addMagazine "EB_9Rnd_Mk83";
			_vec addMagazine "EB_10Rnd_Mk83";
			_vec addMagazine "EB_11Rnd_Mk83";
			_vec addMagazine "EB_12Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";

			_vec addMagazine "EB_1Rnd_Mk84";
			_vec addMagazine "EB_2Rnd_Mk84";
			_vec addMagazine "EB_3Rnd_Mk84";
			_vec addMagazine "EB_4Rnd_Mk84";
			_vec addMagazine "EB_5Rnd_Mk84";
			_vec addMagazine "EB_6Rnd_Mk84";
			_vec addMagazine "EB_7Rnd_Mk84";
			_vec addMagazine "EB_8Rnd_Mk84";
			_vec addMagazine "EB_9Rnd_Mk84";
			_vec addMagazine "EB_10Rnd_Mk84";
			_vec addMagazine "EB_11Rnd_Mk84";
			_vec addMagazine "EB_12Rnd_Mk84";
			_vec addweapon "EB_Mk84_Launcher";

			_vec addMagazine "EB_1Rnd_Mk77";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addMagazine "EB_3Rnd_Mk77";
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addMagazine "EB_5Rnd_Mk77";
			_vec addMagazine "EB_6Rnd_Mk77";
			_vec addMagazine "EB_7Rnd_Mk77";
			_vec addMagazine "EB_8Rnd_Mk77";
			_vec addMagazine "EB_9Rnd_Mk77";
			_vec addMagazine "EB_10Rnd_Mk77";
			_vec addMagazine "EB_11Rnd_Mk77";
			_vec addMagazine "EB_12Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";

			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_3Rnd_FAB250";
			_vec addMagazine "EB_4Rnd_FAB250";
			_vec addMagazine "EB_5Rnd_FAB250";
			_vec addMagazine "EB_6Rnd_FAB250";
			_vec addMagazine "EB_7Rnd_FAB250";
			_vec addMagazine "EB_8Rnd_FAB250";
			_vec addMagazine "EB_9Rnd_FAB250";
			_vec addMagazine "EB_10Rnd_FAB250";
			_vec addMagazine "EB_11Rnd_FAB250";
			_vec addMagazine "EB_12Rnd_FAB250";
			_vec addweapon "EB_BombLauncher_fab250";

			_vec addMagazine "EB_1Rnd_FAB500";
			_vec addMagazine "EB_2Rnd_FAB500";
			_vec addMagazine "EB_3Rnd_FAB500";
			_vec addMagazine "EB_4Rnd_FAB500";
			_vec addMagazine "EB_5Rnd_FAB500";
			_vec addMagazine "EB_6Rnd_FAB500";
			_vec addMagazine "EB_7Rnd_FAB500";
			_vec addMagazine "EB_8Rnd_FAB500";
			_vec addMagazine "EB_9Rnd_FAB500";
			_vec addMagazine "EB_10Rnd_FAB500";
			_vec addMagazine "EB_11Rnd_FAB500";
			_vec addMagazine "EB_12Rnd_FAB500";
			_vec addweapon "EB_BombLauncher_fab500";

CBU

   --------> Mines AP
			_vec addMagazine "EB_1Rnd_CBU78B";
			_vec addMagazine "EB_2Rnd_CBU78B";
			_vec addMagazine "EB_3Rnd_CBU78B";
			_vec addMagazine "EB_4Rnd_CBU78B";
			_vec addMagazine "EB_5Rnd_CBU78B";
			_vec addMagazine "EB_6Rnd_CBU78B";
			_vec addMagazine "EB_7Rnd_CBU78B";
			_vec addMagazine "EB_8Rnd_CBU78B";
			_vec addMagazine "EB_9Rnd_CBU78B";
			_vec addMagazine "EB_10Rnd_CBU78B";
			_vec addMagazine "EB_11Rnd_CBU78B";
			_vec addMagazine "EB_12Rnd_CBU78B";
			_vec addweapon "EB_CBU78B_Launcher";

   --------> Airburst AP
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_2Rnd_CBU87B";
			_vec addMagazine "EB_3Rnd_CBU87B";
			_vec addMagazine "EB_4Rnd_CBU87B";
			_vec addMagazine "EB_5Rnd_CBU87B";
			_vec addMagazine "EB_6Rnd_CBU87B";
			_vec addMagazine "EB_7Rnd_CBU87B";
			_vec addMagazine "EB_8Rnd_CBU87B";
			_vec addMagazine "EB_9Rnd_CBU87B";
			_vec addMagazine "EB_10Rnd_CBU87B";
			_vec addMagazine "EB_11Rnd_CBU87B";
			_vec addMagazine "EB_12Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";

   --------> Mines AT
			_vec addMagazine "EB_1Rnd_CBU89B";
			_vec addMagazine "EB_2Rnd_CBU89B";
			_vec addMagazine "EB_3Rnd_CBU89B";
			_vec addMagazine "EB_4Rnd_CBU89B";
			_vec addMagazine "EB_5Rnd_CBU89B";
			_vec addMagazine "EB_6Rnd_CBU89B";
			_vec addMagazine "EB_7Rnd_CBU89B";
			_vec addMagazine "EB_8Rnd_CBU89B";
			_vec addMagazine "EB_9Rnd_CBU89B";
			_vec addMagazine "EB_10Rnd_CBU89B";
			_vec addMagazine "EB_11Rnd_CBU89B";
			_vec addMagazine "EB_12Rnd_CBU89B";
			_vec addweapon "EB_CBU89B_Launcher";

  --------> AT CB
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addMagazine "EB_3Rnd_CBU100";
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addMagazine "EB_5Rnd_CBU100";
			_vec addMagazine "EB_6Rnd_CBU100";
			_vec addMagazine "EB_7Rnd_CBU100";
			_vec addMagazine "EB_8Rnd_CBU100";
			_vec addMagazine "EB_9Rnd_CBU100";
			_vec addMagazine "EB_10Rnd_CBU100";
			_vec addMagazine "EB_11Rnd_CBU100";
			_vec addMagazine "EB_12Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";

LGB
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addMagazine "EB_3Rnd_GBU12";
			_vec addMagazine "EB_4Rnd_GBU12";
			_vec addMagazine "EB_5Rnd_GBU12";
			_vec addMagazine "EB_6Rnd_GBU12";
			_vec addMagazine "EB_7Rnd_GBU12";
			_vec addMagazine "EB_8Rnd_GBU12";
			_vec addMagazine "EB_9Rnd_GBU12";
			_vec addMagazine "EB_10Rnd_GBU12";
			_vec addMagazine "EB_11Rnd_GBU12";
			_vec addMagazine "EB_12Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";

			_vec addMagazine "EB_1Rnd_GBU16";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addMagazine "EB_3Rnd_GBU16";
			_vec addMagazine "EB_4Rnd_GBU16";
			_vec addMagazine "EB_5Rnd_GBU16";
			_vec addMagazine "EB_6Rnd_GBU16";
			_vec addMagazine "EB_7Rnd_GBU16";
			_vec addMagazine "EB_8Rnd_GBU16";
			_vec addMagazine "EB_9Rnd_GBU16";
			_vec addMagazine "EB_10Rnd_GBU16";
			_vec addMagazine "EB_11Rnd_GBU16";
			_vec addMagazine "EB_12Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";

			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addMagazine "EB_3Rnd_GBU10";
			_vec addMagazine "EB_4Rnd_GBU10";
			_vec addMagazine "EB_5Rnd_GBU10";
			_vec addMagazine "EB_6Rnd_GBU10";
			_vec addMagazine "EB_7Rnd_GBU10";
			_vec addMagazine "EB_8Rnd_GBU10";
			_vec addMagazine "EB_9Rnd_GBU10";
			_vec addMagazine "EB_10Rnd_GBU10";
			_vec addMagazine "EB_11Rnd_GBU10";
			_vec addMagazine "EB_12Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";

			_vec addMagazine "EB_1Rnd_kab250";
			_vec addMagazine "EB_2Rnd_kab250";
			_vec addMagazine "EB_3Rnd_kab250";
			_vec addMagazine "EB_4Rnd_kab250";
			_vec addMagazine "EB_5Rnd_kab250";
			_vec addMagazine "EB_6Rnd_kab250";
			_vec addMagazine "EB_7Rnd_kab250";
			_vec addMagazine "EB_8Rnd_kab250";
			_vec addMagazine "EB_9Rnd_kab250";
			_vec addMagazine "EB_10Rnd_kab250";
			_vec addMagazine "EB_11Rnd_kab250";
			_vec addMagazine "EB_12Rnd_kab250";
			_vec addweapon "EB_BombLauncher_kab250";

			_vec addMagazine "EB_1Rnd_kab500";
			_vec addMagazine "EB_2Rnd_kab500";
			_vec addMagazine "EB_3Rnd_kab500";
			_vec addMagazine "EB_4Rnd_kab500";
			_vec addMagazine "EB_5Rnd_kab500";
			_vec addMagazine "EB_6Rnd_kab500";
			_vec addMagazine "EB_7Rnd_kab500";
			_vec addMagazine "EB_8Rnd_kab500";
			_vec addMagazine "EB_9Rnd_kab500";
			_vec addMagazine "EB_10Rnd_kab500";
			_vec addMagazine "EB_11Rnd_kab500";
			_vec addMagazine "EB_12Rnd_kab500";
			_vec addweapon "EB_BombLauncher_kab500";



//stock weapons

			_vec addMagazine "60Rnd_CMFlareMagazine";
//			_vec addMagazine "60Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "CMFlareLauncher";

			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

			_vec addMagazine "SmokeLauncherMag";
			_vec addweapon "SmokeLauncher";

			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";

			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";

			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";

			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";

			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";

			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";

			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";

			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";

			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "M134";
			_vec addweapon "TwinM134";

			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";

			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";

			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";

			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";

			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";

			_vec addMagazine "150Rnd_30mmAP_2A42";
			_vec addMagazine "150Rnd_30mmHE_2A42";
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";

			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";

			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";

			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";

			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";

			_vec addMagazine "28Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";

			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "80mmLauncher";

			_vec addMagazine "40Rnd_S8T";
			_vec addMagazine "40Rnd_80mm";
			_vec addMagazine "80Rnd_S8T";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";

			_vec addMagazine "64Rnd_57mm";
			_vec addMagazine "128Rnd_57mm";
			_vec addMagazine "192Rnd_57mm";
			_vec addweapon "57mmLauncher";

			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";

			_vec addMagazine "8Rnd_Stinger";
			_vec addweapon "StingerLaucher";

			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";

			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";

			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";

			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";

			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";

			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";

			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";

			_vec addMagazine "6Rnd_TOW2";
			_vec addweapon "TOWLauncherSingle";

			_vec addMagazine "8Rnd_Hellfire";
			_vec addweapon "HellfireLauncher";

			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";

			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";

			_vec addMagazine "4Rnd_Ch29";
			_vec addMagazine "6Rnd_Ch29";
			_vec addweapon "Ch29Launcher_Su34";

			_vec addMagazine "4Rnd_AT2_Mi24D";
			_vec addweapon "AT2Launcher";

			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";

			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addMagazine "8Rnd_AT9_Mi24V";
			_vec addweapon "AT9Launcher";

			_vec addMagazine "12Rnd_Vikhr_KA50";
			_vec addweapon "VikhrLauncher";

			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";

			_vec addMagazine "2Rnd_FAB_250";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";

			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";

			_vec addMagazine "6Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher_6";

			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";

			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";

			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";

			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";


o	Tu-22m3 Anti-Ship - "RKTTU22M3A"
o	Tu-22m3 Precision Attack - "RKTTU22M3B"
o	Tu-22m3 Area Attack - "RKTTU22M3C"
o	Tu-22m3 Precision Strike - "RKTTU22M3D"
o	Tu-22m3 - "RKTTU22M3U"
o	Tu-22m3 Area Attack - "RKTTU22M3E"
o	Su33 Flanker-D Blackbird: RKTSU33MR  (Black Multi-Role)
o	Su33 Flanker-D AA: RKTSU33AA  (Blue Air to Air)
o	Su33 Flanker-D AG: RKTSU33AG  (Blue Ground Attack)
o	Su33 Flanker-D B1: RKTSU33B1  (Bomber)
o	Su33 Flanker-D TAA: RKTSU33TAA  (Tricolour Air to Air)
o	Su33 Flanker-D TAG: RKTSU33TAG  (Tricolour Ground Attack)
o	Su33 Flanker-D TB1: RKTSU33TB1  (Tricolour Bomber)
o	GNTB52: GNTB52 MK82
o	GNTB52u: GNTB52 Unarmed


			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";

			_vec addMagazine "84Rnd_GNTMK82";
			_vec addweapon "GNTMK82Launcher";

			_vec addMagazine "40Rnd_RKTS8T";
			_vec addweapon "RKTS8Launcher";

			_vec addMagazine "2Rnd_RKTR27";
			_vec addMagazine "4Rnd_RKTR27";
			_vec addMagazine "6Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";

			_vec addMagazine "2Rnd_RKTR73";
			_vec addMagazine "4Rnd_RKTR73";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";

			_vec addMagazine "2Rnd_RKTCh29";
			_vec addMagazine "4Rnd_RKTCh29";
			_vec addMagazine "6Rnd_RKTCh29";
			_vec addweapon "RKTCh29Launcher";

			_vec addMagazine "3Rnd_RKT_Kitchen_mis";
			_vec addweapon "RKT_Kitchen_Rail";

			_vec addMagazine "2Rnd_KB500";
			_vec addMagazine "8Rnd_KB500";
			_vec addMagazine "10Rnd_KB500";
			_vec addMagazine "20Rnd_KB500";
			_vec addweapon "RKT_kb500Launcher";

			_vec addMagazine "2Rnd_FB250";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "28Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";

			_vec addMagazine "GLT_6Rnd_CH15";
			_vec addweapon "GLT_CH15_Launcher";

			_vec addMagazine "GLT_2Rnd_CH31";
			_vec addweapon "GLT_CH31_Launcher";

			_vec addMagazine "GLT_3Rnd_AS4";
			_vec addweapon "GLT_AS4_Launcher";

			_vec addMagazine "GLT_36Rnd_FAB250";
			_vec addweapon "GLT_FAB250_Launcher";

			_vec addMagazine "GLT_24Rnd_FAB500";
			_vec addweapon "GLT_FAB500_Launcher";

			_vec addMagazine "GLT_8Rnd_KAB250";
			_vec addweapon "GLT_KAB250_Launcher";

			_vec addMagazine "GLT_8Rnd_KAB500";
			_vec addweapon "GLT_KAB500_Launcher";

			_vec addMagazine "GLT_5Rnd_KAB1500";
			_vec addweapon "GLT_KAB1500_Launcher";

//f22
3lb_f22
3lb_f22_sdb
3lb_f22_jdam

			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_6Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "GLT_2Rnd_GBU53";
			_vec addweapon "GLT_GBU53_Launcher";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";

//1-12
			_vec addMagazine "3lb_4Rnd_pylonblank";

*/

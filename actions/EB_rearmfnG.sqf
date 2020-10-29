//GLT missilebox version

// EB_rearmfnG called from mainthreadc/EB_rearm
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
	if (_fntype==7) then {_stringa = parseText "<img image='img\support\defend.paa' size='2.0' shadow='false' /><br />Suppressing Enemy Air Defences (SEAD)</t>"};

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

//otherwise use this for private sound
playsound "reload";

_i = 0;
if (editor == 1) then 
{
	_i = 100;
} else
{
	//if CBA is running use this to play a global sound
//	[-1, {_man = _this select 0; _man say "reload";},[player]] call cba_fnc_globalExecute;	
	//otherwise use this for private sound
	playsound "reload";
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
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
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
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "8Rnd_Sidewinder_AH64";
			_vec addweapon "SidewinderLaucher_AH64";
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
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
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
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
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
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
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
	};

	case 2://CAS
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";			
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";			
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
		};


//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
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
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "12Rnd_CRV7";
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
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

	};
	case 3://AGM
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";			
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";			
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addMagazine "4Rnd_Maverick_L159";
			_vec addweapon "MaverickLauncher_ACR";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
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
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
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
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "6Rnd_CRV7_HEPD";
			_vec addweapon "CRV7_HEPD";
			_vec addMagazine "6Rnd_CRV7_FAT";
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
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

	};
	case 4://MR
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
			_vec addMagazine "2Rnd_Sidewinder_F35";
			_vec addweapon "SidewinderLaucher_F35";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "3Rnd_Mk82";
			_vec addweapon "Mk82BombLauncher";
			_vec addMagazine "2Rnd_GBU12";
			_vec addweapon "BombLauncherF35";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
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
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
			_vec addweapon "HeliBombLauncher";
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
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "HeliBombLauncher";
		};


//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
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

	};
	case 5://BMB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "4Rnd_Sidewinder_AV8B";
			_vec addweapon "SidewinderLaucher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "6Rnd_Mk82";//reduce
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};

//helicopters
		if(_type == "AH64D") then 
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
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
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
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
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
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
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
	};
	case 6://LGB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_GBU12";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_GBU12";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
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
			_vec addweapon "GAU12";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
			_vec addMagazine "4Rnd_GBU12";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
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
			_vec addweapon "ZPL_20";
			_vec addMagazine "6Rnd_GBU12_AV8B";
			_vec addweapon "BombLauncher";
			_vec addMagazine "2Rnd_Sidewinder_AH1Z";
			_vec addweapon "SidewinderLaucher_AH1Z";
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
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "4Rnd_GBU12";
			_vec addweapon "BombLauncherA10";
		};

	};
	case 7://SEAD
	{
		
	};
  };
};

/*

EB_planes_west = ["A10","A10_US_EP1","F35B","AV8B","AV8B2","L159_ACR","C130J","C130J_US_EP1","An2_2_TK_CIV_EP1","L39_2_ACR","L39_ACR","AH64D","AH64D_EP1","AH64D_Sidewinders","BAF_Apache_AH1_D","AH1Z","AW159_Lynx_BAF","AH6J_EP1"];

EB_planes_west_no = ["BAF_Merlin_HC3_D","CH_47F_BAF","MH60S","UH1Y","UH60M_EP1","CH_47F_EP1","MV22","Mi24_D_CZ_ACR"];

EB_planes_east = ["Su34","Su39","Su25_Ins","Su25_CDF","Su25_TK_EP1","L39_TK_EP1","Mi24_D_TK_EP1","Mi24_D","Mi24_P","Mi24_V","Ka52","Ka52Black"];

//GLT may 2012

"GLT_Falcon_mk82","GLT_Falcon_CAP","GLT_Falcon_MR","GLT_Falcon_AGM","GLT_Falcon_GBU","GLT_Falcon_euro_mk82","GLT_Falcon_euro_cap","GLT_Falcon_euro","GLT_Falcon_euro_AGM","GLT_Falcon_euro_GBU"

missilebox for OA may 2012

GLT_M61A1
300Rnd_25mm_GAU12
480Rnd_20mm_M61A1_GLT
510Rnd_20mm_M61A1_GLT
500Rnd_20mm_M61A1_GLT
578Rnd_20mm_M61A1_GLT
640Rnd_20mm_M61A1_GLT
650Rnd_20mm_M61A1_GLT
675Rnd_20mm_M61A1_GLT
725Rnd_20mm_M61A1_GLT
940Rnd_20mm_M61A1_GLT
1028Rnd_20mm_M61A1_GLT
1030Rnd_20mm_M61A1_GLT
1100Rnd_20mm_M61A1_GLT
1550Rnd_20mm_M61A1_GLT
2050Rnd_20mm_M61A1_GLT

GLT_FFARLauncher_unguided
GLT_38Rnd_HYDRA70_unguided
GLT_76Rnd_HYDRA70_unguided
GLT_114Rnd_HYDRA70_unguided
GLT_152Rnd_HYDRA70_unguided

GLT_FFARLauncher_laser
//  laserLock = 1;
GLT_38Rnd_HYDRA70_laser
GLT_76Rnd_HYDRA70_laser
GLT_114Rnd_HYDRA70_laser
GLT_152Rnd_HYDRA70_laser

GLT_AIM9M_Launcher
//sidewinder range 9000 hit 150
GLT_2Rnd_AIM9M
GLT_4Rnd_AIM9M
GLT_6Rnd_AIM9M
GLT_8Rnd_AIM9M
GLT_10Rnd_AIM9M
GLT_12Rnd_AIM9M

GLT_AIM9X_Launcher
//range 15000 hit 200
GLT_2Rnd_AIM9X
GLT_4Rnd_AIM9X
GLT_6Rnd_AIM9X
GLT_8Rnd_AIM9X
GLT_10Rnd_AIM9X
GLT_12Rnd_AIM9X

GLT_AIM120_Launcher
//AMRAAM range 15000 hit 250
GLT_2Rnd_AIM120
GLT_4Rnd_AIM120
GLT_6Rnd_AIM120
GLT_8Rnd_AIM120
GLT_10Rnd_AIM120
GLT_12Rnd_AIM120

GLT_AIM7_Launcher
//sparrow range 15000 hit 330 
GLT_2Rnd_AIM7
GLT_4Rnd_AIM7
GLT_6Rnd_AIM7
GLT_8Rnd_AIM7
GLT_10Rnd_AIM7
GLT_12Rnd_AIM7

GLT_AIM54_Launcher
//phoenix range 50,000 hit 400
GLT_2Rnd_AIM54
GLT_4Rnd_AIM54
GLT_6Rnd_AIM54

GLT_R550_Launcher
//Magic 2 range 9000 hit 200
GLT_2Rnd_R550
GLT_4Rnd_R550
GLT_6Rnd_R550
GLT_8Rnd_R550
GLT_10Rnd_R550
GLT_12Rnd_R550

GLT_AIM132_Launcher
//ASRAAM range 15000 hit 200
GLT_2Rnd_AIM132
GLT_4Rnd_AIM132
GLT_6Rnd_AIM132
GLT_8Rnd_AIM132
GLT_10Rnd_AIM132
GLT_12Rnd_AIM132

GLT_METEOR_Launcher
//meteor BVRAAM range 15000 hit 250
GLT_2Rnd_METEOR
GLT_4Rnd_METEOR
GLT_6Rnd_METEOR
GLT_8Rnd_METEOR
GLT_10Rnd_METEOR
GLT_12Rnd_METEOR

GLT_AGM114_Launcher
//hellfire range 8000 hit 600 
//  irLock = 1; laserLock = 0;
GLT_2Rnd_AGM114
GLT_4Rnd_AGM114
GLT_6Rnd_AGM114
GLT_8Rnd_AGM114
GLT_10Rnd_AGM114
GLT_12Rnd_AGM114
GLT_14Rnd_AGM114
GLT_16Rnd_AGM114
GLT_18Rnd_AGM114

GLT_AGM114K_Launcher:
//hellfire range 8000 hit 600
//  irLock = 0;  laserLock = 1;
GLT_2Rnd_AGM114K
GLT_4Rnd_AGM114K
GLT_6Rnd_AGM114K
GLT_8Rnd_AGM114K
GLT_10Rnd_AGM114K
GLT_12Rnd_AGM114K
GLT_14Rnd_AGM114K
GLT_16Rnd_AGM114K
GLT_18Rnd_AGM114K

GLT_AGM65_Launcher
//maverick range 15000 hit 850 irlock
GLT_2Rnd_AGM65
GLT_4Rnd_AGM65
GLT_6Rnd_AGM65
GLT_8Rnd_AGM65
GLT_10Rnd_AGM65
GLT_12Rnd_AGM65

GLT_AGM65E_Launcher
//maverick range 15000 hit 850
//  irLock = 0;  laserLock = 1;
GLT_2Rnd_AGM65E
GLT_4Rnd_AGM65E
GLT_6Rnd_AGM65E
GLT_8Rnd_AGM65E
GLT_10Rnd_AGM65E
GLT_12Rnd_AGM65E

GLT_AGM84_Launcher
//HARPOON range 20000 hit 4000 irlock
GLT_2Rnd_AGM84
GLT_4Rnd_AGM84
GLT_6Rnd_AGM84

GLT_AGM88_Launcher
//HARM range 10000 hit 2000 irlock
GLT_2Rnd_AGM88
GLT_4Rnd_AGM88
GLT_6Rnd_AGM88

GLT_AGM154A1_Launcher
//JSOW
//GLT_isGPSguided = 1;
//  irLock = 0;laserLock = 1;
//hit 5000
GLT_1Rnd_AGM154A1
GLT_2Rnd_AGM154A1
GLT_4Rnd_AGM154A1

GLT_AGM154A_Launcher
//hit 100; 145 x 105mm shell clusterbomb
//also GPS irLock = 0;laserLock = 1;
GLT_1Rnd_AGM154A
GLT_2Rnd_AGM154A
GLT_4Rnd_AGM154A

GLT_AM39_Launcher
//exocet range 10000 hit 850
//irlock
GLT_1Rnd_AM39
GLT_2Rnd_AM39
GLT_4Rnd_AM39

GLT_MK81_Launcher
//hit 3300 range 10
GLT_2Rnd_MK81
GLT_4Rnd_MK81
GLT_6Rnd_MK81
GLT_8Rnd_MK81
GLT_10Rnd_MK81
GLT_12Rnd_MK81

GLT_MK82_Launcher
//hit 5000 range 12
GLT_2Rnd_MK82
GLT_4Rnd_MK82
GLT_6Rnd_MK82
GLT_8Rnd_MK82
GLT_10Rnd_MK82
GLT_12Rnd_MK82

GLT_MK84_Launcher
//hit 8300 range 16
GLT_2Rnd_MK84
GLT_4Rnd_MK84
GLT_6Rnd_MK84

GLT_GBU12_Launcher
//lgb hit 5000 range 12
GLT_2Rnd_GBU12
GLT_4Rnd_GBU12
GLT_6Rnd_GBU12
GLT_8Rnd_GBU12
GLT_10Rnd_GBU12
GLT_12Rnd_GBU12

GLT_GBU24_Launcher
//lgb hit 8300 range 16
GLT_2Rnd_GBU24
GLT_4Rnd_GBU24
GLT_6Rnd_GBU24

GLT_GBU53_Launcher
//GBU32 JDAM
//GLT_isGPSguided = 1;
//hit 6800 range 13
GLT_2Rnd_GBU53
GLT_4Rnd_GBU53
GLT_6Rnd_GBU53
GLT_2Rnd_GBU53BIS

GLT_GBU39_Launcher
//SDB small diameter bomb
//GLT_isGPSguided = 1;
//hit 8300 range 10
GLT_4Rnd_GBU39
GLT_8Rnd_GBU39
GLT_12Rnd_GBU39
GLT_16Rnd_GBU39

GLT_MOAB_Launcher
//MOAB
//hit 10000 range 250
//GLT_isGPSguided = 1;
1Rnd_GBU43_GLT

GLT_R3_Launcher
//Atoll range 9000 hit 150
GLT_2Rnd_R3
GLT_4Rnd_R3
GLT_6Rnd_R3
GLT_8Rnd_R3
GLT_10Rnd_R3
GLT_12Rnd_R3

GLT_R60_Launcher
//Aphid range 9000 hit 80
GLT_2Rnd_R60
GLT_4Rnd_R60
GLT_6Rnd_R60
GLT_8Rnd_R60
GLT_10Rnd_R60
GLT_12Rnd_R60

GLT_R27_Launcher
//Alamo range 12000 hit 200
GLT_2Rnd_R27
GLT_4Rnd_R27
GLT_6Rnd_R27
GLT_8Rnd_R27
GLT_10Rnd_R27
GLT_12Rnd_R27

GLT_R73_Launcher
//Archer range 12000 hit 220
GLT_2Rnd_R73
GLT_4Rnd_R73
GLT_6Rnd_R73
GLT_8Rnd_R73
GLT_10Rnd_R73
GLT_12Rnd_R73

GLT_R77_Launcher
//Adder range 15000 hit 250
GLT_2Rnd_R77
GLT_4Rnd_R77
GLT_6Rnd_R77
GLT_8Rnd_R77
GLT_10Rnd_R77
GLT_12Rnd_R77

GLT_CH15_Launcher
//kickback range 18000 hit 8000
//  laserLock = 1; irlock
//GLT_isGPSguided = 1;
GLT_1Rnd_CH15
GLT_2Rnd_CH15
GLT_4Rnd_CH15
GLT_6Rnd_CH15
GLT_10Rnd_CH15
GLT_12Rnd_CH15

GLT_CH15A_Launcher
GLT_CH15P_Launcher
GLT_CH15S_Launcher
//kickback non GPS range 18000 hit 8000
//GLT_isGPSguided = 0;
// laserlock = 0;
GLT_1Rnd_CH15APS
GLT_2Rnd_CH15APS
GLT_4Rnd_CH15APS
GLT_6Rnd_CH15APS
GLT_10Rnd_CH15APS
GLT_12Rnd_CH15APS

GLT_Ch29LauncherLaser
GLT_4Rnd_Ch29LBIS

GLT_Ch29Launcher_IR
GLT_2Rnd_Ch29TBIS
GLT_4Rnd_Ch29TBIS

GLT_CH29L_Launcher
//kedge range 10000 hit 4000
//  irLock = 0;  laserLock = 1;
GLT_2Rnd_CH29L
GLT_4Rnd_CH29L
GLT_6Rnd_CH29L
GLT_8Rnd_CH29L

GLT_CH29T_Launcher
//kedge range 10000 hit 4000
//  irLock = 1; laserLock = 0;
GLT_2Rnd_CH29T
GLT_4Rnd_CH29T
GLT_6Rnd_CH29T
GLT_8Rnd_CH29T

GLT_CH59_Launcher
//kingbolt or kazoo range 12000 hit 5000
//irlock
GLT_1Rnd_CH59
GLT_2Rnd_CH59
GLT_4Rnd_CH59

GLT_CH31_Launcher
//krypton range 13000 hit 1000
//GLT_isGPSguided = 1;
//laserlock; irlock
GLT_1Rnd_CH31
GLT_2Rnd_CH31
GLT_4Rnd_CH31

GLT_CH31P_Launcher
//krypton range 13000
//GLT_isGPSguided = 0; irlock
GLT_1Rnd_CH31P
GLT_2Rnd_CH31P
GLT_4Rnd_CH31P

GLT_AS4_Launcher
//kh22 kitchen range 15000 hit 10,000
//GLT_isGPSguided = 1; laserLock = 1; irlock
GLT_1Rnd_AS4
GLT_2Rnd_AS4
GLT_3Rnd_AS4

GLT_AS4PSI_Launcher
//kh22 kitchen range 15000
//non GPS?

GLT_FAB250_Launcher
//hit 5000 range 12
GLT_2Rnd_FAB250
GLT_4Rnd_FAB250
GLT_6Rnd_FAB250
GLT_8Rnd_FAB250
GLT_10Rnd_FAB250
GLT_12Rnd_FAB250
GLT_36Rnd_FAB250

GLT_FAB500_Launcher
//hit 8300 range 16
GLT_2Rnd_FAB500
GLT_4Rnd_FAB500
GLT_6Rnd_FAB500
GLT_24Rnd_FAB500

GLT_KAB250_Launcher
//hit 5000 range 12
GLT_2Rnd_KAB250
GLT_4Rnd_KAB250
GLT_6Rnd_KAB250
GLT_8Rnd_KAB250
GLT_10Rnd_KAB250
GLT_12Rnd_KAB250

GLT_KAB500_Launcher
//hit 8300 range 16
GLT_2Rnd_KAB500
GLT_4Rnd_KAB500
GLT_6Rnd_KAB500
GLT_8Rnd_KAB500

GLT_KAB500SE_Launcher
//JDAM   GLT_isGPSguided = 1;
GLT_2Rnd_KAB500_JDAM
GLT_4Rnd_KAB500_JDAM
GLT_4Rnd_KAB500_JDAMBIS
GLT_6Rnd_KAB500_JDAM
GLT_8Rnd_KAB500_JDAM

GLT_KAB1500_Launcher
//hit 13300 range 28
GLT_1Rnd_KAB1500
GLT_2Rnd_KAB1500
GLT_4Rnd_KAB1500
GLT_5Rnd_KAB1500

//BRU-61A
GLT_1Rnd_BRU61A
GLT_2Rnd_BRU61A
GLT_3Rnd_BRU61A
GLT_4Rnd_BRU61A

GLT_2Rnd_FFARPOD
GLT_4Rnd_FFARPOD
GLT_6Rnd_FFARPOD
GLT_8Rnd_FFARPOD

GLT_1Rnd_ANAAQ28
GLT_2Rnd_DUALRAIL
GLT_4Rnd_DUALRAIL
GLT_6Rnd_DUALRAIL

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
			_vec addweapon "R73Launcher_2"

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

"IkaR_F14_AIM_54","IkaR_F14_AGM_65","IkaR_F14_GBU_12","IkaR_F14_GBU_12_racs","IkaR_F14_AIM_54L","IkaR_F14_AIM_54_ir","IkaR_F14_AGM_65_ir","IkaR_F14_GBU_12_ir"


			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";

			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";

			_vec addMagazine "IkaR_F14_AIM9Launcher2_ir";
			_vec addweapon "IkaR_F14_AIM9Launcher2_ir";

			_vec addMagazine "IkaR_F14_AGM65Launcher4_ir";
			_vec addweapon "IkaR_F14_AGM65Launcher4_ir";

			_vec addMagazine "IkaR_F14_GBU12Launcher5_ir";
			_vec addweapon "IkaR_F14_GBU12Launcher5_ir";

"JS_FA18E","JS_FA18F","JS_JC_FA18F_RAAF","JS_JC_FA18E_USMC","JS_JC_FA18F_USMC"

			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";

			_vec addMagazine "js_m_fa18_aim9x_x1";
			_vec addMagazine "js_m_fa18_aim9x_x2";
			_vec addweapon "js_w_fa18_aim9xLaucher";

			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x2";
			_vec addMagazine "js_m_fa18_aim120c_x4";
			_vec addweapon "js_w_fa18_aim120cLaucher";

			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x2";
			_vec addMagazine "js_m_fa18_Maverick_x4";
			_vec addweapon "js_w_fa18_MaverickLauncher";

			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x2";
			_vec addweapon "js_w_fa18_HarpoonLauncher";

			_vec addMagazine "js_m_fa18_MK82_x1";
			_vec addMagazine "js_m_fa18_MK82_x2";
			_vec addMagazine "js_m_fa18_MK82_x4";
			_vec addweapon "js_w_fa18_Mk82BombLauncher";

			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x4";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";

			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";

			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";

			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU31BombLauncher";

			_vec addMagazine "js_m_fa18_bombrack_x1";
			_vec addMagazine "js_m_fa18_bombrack_x2";
			_vec addMagazine "js_m_fa18_altflir_pod_x1";

			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addMagazine "js_m_fa18_wing_tank_x2";
			_vec addweapon "js_w_fa18_fueltank_holder";

//Extend Refueling Drogue
			_vec addMagazine "js_m_fa18_buddypod_x1";

			_vec addMagazine "js_m_fa18_empty";
			_vec addMagazine "js_m_fa18_fake_empty";

			_vec addweapon "js_w_master_arms_safe";

*/

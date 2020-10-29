//RKSL weapons version - set in parameters EGG_vecmods=2

// EB_rearmfnR called from mainthreadc/EB_rearm
//EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnR.sqf",[_vec,_player,1], 5, true, true,"",""];

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
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addweapon "RKSL_iristLauncher";
			_vec addweapon "RKSL_AIM9Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "AH1Z") then 
		{
//			_vec addMagazine "2100Rnd_20mm_M168";
//			_vec addweapon "M168";
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
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
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
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
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "6Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
//east heli
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_R73";
			_vec addweapon "R73Launcher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
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
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
//outer
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";

//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM120";
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
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
//outer
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "RKSL_1Rnd_AIM132";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
//inner rack
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
//mid rack
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1rnd_efa_fueltank";
			_vec addweapon "RKSL_efa_fueltank_launcher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addmagazine "RKSL_60Rnd_pylonblank";			
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1rnd_efa_fueltank";
			_vec addweapon "RKSL_efa_fueltank_launcher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
	case 2://CAS
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
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
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
		};
		if(_type == "C130J") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_6Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "M168";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "12Rnd_CRV7";
			_vec addweapon "CRV7_PG";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_6Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
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
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003Podx2";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003Podx2";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003Podx2";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "AH1Z") then 
		{
//			_vec addMagazine "1200Rnd_20mm_M621";
//			_vec addweapon "M621";
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003Podx2";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
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
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
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
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};

		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
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
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
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
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "250Rnd_30mmAP_2A42";
			_vec addMagazine "250Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addweapon "RKSL_Paveway1000Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
//outer
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
//inner rack
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
//mid rack
			_vec addMagazine "RKSL_4Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
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
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
//outer
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
//centre body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "GLT_38Rnd_HYDRA70_laser";
			_vec addweapon "GLT_FFARLauncher_laser";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_1Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
	case 3://AGM
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_12Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_6Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_6Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";
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
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
			_vec addMagazine "RKSL_6Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_12Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_4Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_4rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_4rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_12Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_4rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
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
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "6Rnd_TOW2";
			_vec addweapon "TOWLauncherSingle";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "6Rnd_TOW2";
			_vec addweapon "TOWLauncherSingle";
			_vec addweapon "RKSL_MaverickLauncher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "6Rnd_CRV7_FAT";
			_vec addweapon "CRV7_FAT";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_S8T";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_1Rnd_kh29t";
			_vec addMagazine "RKSL_1Rnd_kh29t";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_6Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_4Rnd_kh29t";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "8Rnd_AT9_Mi24V";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_AT2_Mi24D";
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
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
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
			_vec addMagazine "RKSL_6Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//outer
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_1Rnd_AIM120";
//inner rack
			_vec addMagazine "RKSL_1Rnd_agm88harm";
			_vec addMagazine "RKSL_1Rnd_ALARM";
			_vec addMagazine "RKSL_1Rnd_agm88harm";
			_vec addMagazine "RKSL_1Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addweapon "RKSL_agm88harm_Launcher";
//mid rack
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
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
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
//outer
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addmagazine "RKSL_2Rnd_spear_carrier_mag";
//body
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
//inner rack
			_vec addMagazine "RKSL_4Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
//mid rack
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
			_vec addMagazine "RKSL_4Rnd_spear3";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addmagazine "RKSL_2Rnd_spear_carrier_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";

			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_3Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_1Rnd_kh25mp";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
	case 4://MR
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_4Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
			_vec addMagazine "RKSL_6Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_6Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addMagazine "RKSL_6Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_4Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addweapon "RKSL_BrimstoneLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_4Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_4Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "RKSL_6Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "2Rnd_TOW2";
			_vec addweapon "TOWLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "2Rnd_R73";
			_vec addweapon "R73Launcher_2";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
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
//east heli
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "4Rnd_AT6_Mi24V";
			_vec addweapon "AT6Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_AT2_Mi24D";
			_vec addweapon "AT2Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "4Rnd_AT9_Mi24P";
			_vec addweapon "AT9Launcher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "150Rnd_30mmAP_2A42";
			_vec addMagazine "150Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "8Rnd_AT9_Mi24V";
			_vec addweapon "AT9Launcher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};

		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_6Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_6Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//outer
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";

			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "RKSL_1Rnd_PAVE4_500";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "RKSL_1Rnd_PAVE4_500";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "RKSL_Paveway4500Launcher";
//mid rack
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addweapon "RKSL_MaverickLauncher";
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
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
//outer
			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";

			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "RKSL_1Rnd_PAVE4_500";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "RKSL_1Rnd_PAVE4_500";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "RKSL_Paveway4500Launcher";
//mid rack
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addweapon "RKSL_MaverickLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_CRV_lau5002Podx2";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_b8_Pod";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
//			_vec addMagazine "RKSL_litening_Pod_mag";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
	case 5://BMB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_4Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_4Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_mk83";
			_vec addweapon "RKSL_MK83Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";			
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_4Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_6Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_6Rnd_GP_500RET";
			_vec addMagazine "RKSL_2rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_6Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addweapon "Mk82BombLauncher_6";
			_vec addMagazine "RKSL_6Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};

//helicopters
		if(_type == "AH64D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH64D_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "AH64D_Sidewinders") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};	
		if(_type == "BAF_Apache_AH1_D") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "2Rnd_Stinger";
			_vec addweapon "StingerLauncher_twice";
		};
		if(_type == "AH1Z") then 
		{
			_vec addMagazine "750Rnd_M197_AH1";
			_vec addweapon "M197";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};	
		if(_type == "AW159_Lynx_BAF") then 
		{
			_vec addMagazine "1200Rnd_20mm_M621";
			_vec addweapon "M621";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
		};
		if(_type == "AH6J_EP1") then 
		{
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "TwinM134";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "80Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D_CZ_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_D_TK_EP1") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
		};
		if(_type == "Mi24_D") then 
		{
			_vec addMagazine "1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "128Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_V") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Mi24_P") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "4Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
		if(_type == "Ka52Black") then 
		{
			_vec addMagazine "230Rnd_30mmAP_2A42";
			_vec addMagazine "230Rnd_30mmHE_2A42";
			_vec addweapon "2A42";
			_vec addMagazine "40Rnd_80mm";
			_vec addweapon "S8Launcher";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addMagazine "RKSL_4Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addweapon "RKSL_mk84Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//outer
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
//body
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_4Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
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
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
//outer
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x1";
			_vec addMagazine "RKSL_1rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
//body
			_vec addMagazine "RKSL_2Rnd_mk84";
//inner rack
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_4Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addweapon "RKSL_mk84Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_2Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addMagazine "RKSL_1Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_1rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addMagazine "2Rnd_FAB_250";
			_vec addweapon "AirBombLauncher";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
	case 6://LGB
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";
			_vec addMagazine "RKSL_4Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_1rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_1rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_6Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_PAVE4_500";
			_vec addMagazine "RKSL_6Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_6Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_4rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";
			_vec addMagazine "RKSL_4rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_2Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "Su25_CDF") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "4Rnd_FB250";
			_vec addweapon "RKT_fb250Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "150Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L_L39";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addweapon "RKSL_gbu10Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//outer
			_vec addMagazine "RKSL_2rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_1Rnd_pw2_gbu12";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu16";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu12";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu12Launcher";
			_vec addweapon "RKSL_gbu16Launcher";
//centre body
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
//outer
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
//inner rack
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
//mid rack
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1Rnd_kh29l";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};

	};
	case 7://SEAD
	{
		if(_type == "A10") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
		};
		if(_type == "A10_US_EP1") then 
		{
			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_1rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_1rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
		};
		if(_type == "F35B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_4Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
		};
		if(_type == "AV8B") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
		};
		if(_type == "AV8B2") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";
			_vec addMagazine "RKSL_6Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
		};
		if(_type == "L159_ACR") then 
		{
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addMagazine "210Rnd_20mm_ZPL_20";
			_vec addweapon "ZPL_20";
			_vec addMagazine "RKSL_4Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
		};
		if(_type == "L39_2_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
		};
		if(_type == "L39_ACR") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
		};

		if(_type == "C130J") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_6Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_4rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";
			_vec addMagazine "RKSL_4rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_4rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_4rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";
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
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
		};
		if(_type == "Su25_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
		};
		if(_type == "Su25_Ins") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
		};
		if(_type == "Su39") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
		};
		if(_type == "Su34") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";
			_vec addMagazine "2Rnd_RKTR73";
			_vec addweapon "RKTR73Launcher";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
		};
		if(_type == "L39_TK_EP1") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "64Rnd_57mm";
			_vec addweapon "57mmLauncher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
		};
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "14Rnd_FFAR";
			_vec addweapon "FFARLauncher_14";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_2rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "IkaR_F14_canon20mm_ir";
			_vec addweapon "IkaR_F14_canon20mm_ir";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";
//outer
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";
//mid
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
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
			_vec addMagazine "RKSL_1rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addweapon "js_w_fa18_fueltank_holder";

		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "js_m_fa18_m61";
			_vec addweapon "js_w_fa18_m61";
//wingtip
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";
//outer
			_vec addMagazine "RKSL_2rnd_am39";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "RKSL_2rnd_stormshadow";
//body
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";

			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addweapon "RKSL_am39_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "3lb_20mm_M61A2";
			_vec addweapon "3lb_M61A2";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "GLT_2Rnd_AGM154A";
			_vec addweapon "GLT_AGM154A_Launcher";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
		};
//typhoons
		if(_type == "rksl_efa_fgr4_raf_1") then 
		{
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";
			_vec addMagazine "RKSL_1rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addweapon "RKSL_MaverickLauncher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
//red
		if(_type == "rksl_efa_fgr4_17_red") then 
		{
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addMagazine "RKSL_200Rnd_23mmAP";
//			_vec addweapon "RKSL_23mmcannon";
			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";
			_vec addMagazine "RKSL_efa_pylons_7_mag";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";

			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1rnd_rbs15";
			_vec addMagazine "RKSL_1rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_1rnd_rbs15";
			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
		};
	};
  };
} else
{
	hint "Re-arm aborted";
};

/*

//RKSL weapons

//MG
			_vec addMagazine "RKSL_150Rnd_30mmAP_ADEN";
			_vec addweapon "RKSL_30mmaden";

			_vec addMagazine "RKSL_150Rnd_27mmAP_Mauser";
			_vec addweapon "RKSL_27mmmauser";

			_vec addMagazine "RKSL_200Rnd_23mmAP";//not defined!
			_vec addweapon "RKSL_23mmcannon";

//AAM
			_vec addMagazine "RKSL_1Rnd_AIM9";
			_vec addMagazine "RKSL_2Rnd_AIM9";
			_vec addMagazine "RKSL_4Rnd_AIM9";
			_vec addweapon "RKSL_AIM9Launcher";

			_vec addMagazine "RKSL_1Rnd_AIM132";
			_vec addMagazine "RKSL_2Rnd_AIM132";
			_vec addMagazine "RKSL_4Rnd_AIM132";
			_vec addweapon "RKSL_AIM132Launcher";

			_vec addMagazine "RKSL_1Rnd_irist";
			_vec addMagazine "RKSL_2Rnd_irist";
			_vec addMagazine "RKSL_4Rnd_irist";
			_vec addweapon "RKSL_iristLauncher";

			_vec addMagazine "RKSL_1Rnd_AIM120";
			_vec addMagazine "RKSL_2Rnd_AIM120";
			_vec addMagazine "RKSL_4Rnd_AIM120";
			_vec addMagazine "RKSL_6Rnd_AIM120";
			_vec addweapon "RKSL_AIM120Launcher";

			_vec addMagazine "RKSL_1Rnd_Meteor";
			_vec addMagazine "RKSL_2Rnd_Meteor";
			_vec addMagazine "RKSL_4Rnd_Meteor";
			_vec addMagazine "RKSL_6Rnd_Meteor";
			_vec addweapon "RKSL_MeteorLauncher";

			_vec addMagazine "RKSL_2Rnd_R60";
			_vec addMagazine "RKSL_4Rnd_R60";
			_vec addweapon "RKSL_R60Launcher";

//rksl_r27r_alamoA
			_vec addMagazine "RKSL_2Rnd_R27R";
			_vec addMagazine "RKSL_4Rnd_R27R";
			_vec addMagazine "RKSL_6Rnd_R27R";
			_vec addweapon "RKSL_R27RLauncher";

//rksl_r27t_alamoB
			_vec addMagazine "RKSL_2Rnd_R27T";
			_vec addMagazine "RKSL_4Rnd_R27T";
			_vec addMagazine "RKSL_6Rnd_R27T";
			_vec addweapon "RKSL_R27TLauncher";

//rksl_r77_adder
			_vec addMagazine "RKSL_2Rnd_R77";
			_vec addMagazine "RKSL_4Rnd_R77";
			_vec addMagazine "RKSL_6Rnd_R77";
			_vec addweapon "RKSL_R77Launcher";

//Rocketpods

			_vec addMagazine "RKSL_CRV_lau5003FPodx2";
			_vec addMagazine "RKSL_CRV_lau5003FPodx1";
			_vec addMagazine "RKSL_CRV_lau5003Podx2";
			_vec addMagazine "RKSL_CRV_lau5003Podx1";
			_vec addMagazine "RKSL_CRV_lau5002Podx2";
			_vec addMagazine "RKSL_CRV_lau5002Podx1";

			_vec addMagazine "RKSL_2Rnd_b8_Pod";

//Rockets

			_vec addMagazine "RKSL_6Rnd_CRV7_HEPD";
			_vec addMagazine "RKSL_12Rnd_CRV7_HEPD";
			_vec addMagazine "RKSL_19Rnd_CRV7_HEPD";
			_vec addMagazine "RKSL_38Rnd_CRV7_HEPD";
			_vec addweapon "RKSL_CRV7_hepd_Launcher";

			_vec addMagazine "RKSL_6Rnd_CRV7_FAT";
			_vec addMagazine "RKSL_12Rnd_CRV7_FAT";
			_vec addMagazine "RKSL_19Rnd_CRV7_FAT";
			_vec addMagazine "RKSL_38Rnd_CRV7_FAT";
			_vec addweapon "RKSL_CRV7_FAT_Launcher";

			_vec addMagazine "RKSL_20Rnd_S8T";
			_vec addMagazine "RKSL_40Rnd_S8T";
			_vec addMagazine "RKSL_80Rnd_S8T";
			_vec addweapon "RKSL_S8T_Launcher";

//racks

			_vec addMagazine "RKSL_litening_Pod_mag";

			_vec addMagazine "RKSL_1Rnd_brimstone_rack_mag";
			_vec addMagazine "RKSL_2Rnd_brimstone_rack_mag";
			_vec addmagazine "RKSL_4Rnd_brimstone_rack_mag";
			_vec addmagazine "RKSL_6Rnd_brimstone_rack_mag";

			_vec addmagazine "RKSL_1Rnd_spear_carrier_mag";
			_vec addmagazine "RKSL_2Rnd_spear_carrier_mag";
			_vec addmagazine "RKSL_3Rnd_spear_carrier_mag";
			_vec addmagazine "RKSL_4Rnd_spear_carrier_mag";
			_vec addmagazine "RKSL_5Rnd_spear_carrier_mag";
			_vec addmagazine "RKSL_6Rnd_spear_carrier_mag";

//AGM
			_vec addMagazine "RKSL_1Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_2Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_3Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_6Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_12Rnd_Brimstone_DM";
			_vec addMagazine "RKSL_18Rnd_Brimstone_DM";

			_vec addMagazine "RKSL_1Rnd_Brimstone";
			_vec addMagazine "RKSL_2Rnd_Brimstone";
			_vec addMagazine "RKSL_3Rnd_Brimstone";
			_vec addMagazine "RKSL_6Rnd_Brimstone";
			_vec addMagazine "RKSL_12Rnd_Brimstone";
			_vec addMagazine "RKSL_18Rnd_Brimstone";
			_vec addweapon "RKSL_BrimstoneLauncher";

			_vec addMagazine "RKSL_4Rnd_spear3";
			_vec addMagazine "RKSL_8Rnd_spear3";
			_vec addMagazine "RKSL_12Rnd_spear3";
			_vec addMagazine "RKSL_16Rnd_spear3";
			_vec addMagazine "RKSL_20Rnd_spear3";
			_vec addMagazine "RKSL_24Rnd_spear3";
			_vec addweapon "RKSL_Spear3Launcher";

			_vec addMagazine "RKSL_1Rnd_Maverick";
			_vec addMagazine "RKSL_2Rnd_Maverick";
			_vec addMagazine "RKSL_4Rnd_Maverick";
			_vec addMagazine "RKSL_6Rnd_Maverick";
			_vec addMagazine "RKSL_1Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_2Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_4Rnd_Maverick_IIR";
			_vec addMagazine "RKSL_6Rnd_Maverick_IIR";
			_vec addweapon "RKSL_MaverickLauncher";

//laser only
//rksl_kh25ml

			_vec addMagazine "RKSL_1rnd_kh25ml";
			_vec addMagazine "RKSL_2Rnd_kh25ml";
			_vec addMagazine "RKSL_3Rnd_kh25ml";
			_vec addMagazine "RKSL_4Rnd_kh25ml";
			_vec addMagazine "RKSL_5Rnd_kh25ml";
			_vec addMagazine "RKSL_6Rnd_kh25ml";
			_vec addweapon "RKSL_kh25ml_Launcher";
//laser and IR
//rksl_kh25mp
			_vec addMagazine "RKSL_1rnd_kh25mp";
			_vec addMagazine "RKSL_2Rnd_kh25mp";
			_vec addMagazine "RKSL_3Rnd_kh25mp";
			_vec addMagazine "RKSL_4Rnd_kh25mp";
			_vec addMagazine "RKSL_5Rnd_kh25mp";
			_vec addMagazine "RKSL_6Rnd_kh25mp";
			_vec addweapon "RKSL_kh25mp_Launcher";

//laser
//rksl_kh29l
			_vec addMagazine "RKSL_1rnd_kh29l";
			_vec addMagazine "RKSL_2Rnd_kh29l";
			_vec addMagazine "RKSL_3Rnd_kh29l";
			_vec addMagazine "RKSL_4Rnd_kh29l";
			_vec addMagazine "RKSL_5Rnd_kh29l";
			_vec addMagazine "RKSL_6Rnd_kh29l";
//laser and ir
//rksl_kh29t
			_vec addMagazine "RKSL_1rnd_kh29t";
			_vec addMagazine "RKSL_2Rnd_kh29t";
			_vec addMagazine "RKSL_3Rnd_kh29t";
			_vec addMagazine "RKSL_4Rnd_kh29t";
			_vec addMagazine "RKSL_5Rnd_kh29t";
			_vec addMagazine "RKSL_6Rnd_kh29t";
			_vec addweapon "RKSL_kh29_Launcher";

//iron bombs (lgb and ir)
			_vec addMagazine "RKSL_1Rnd_mk82";
			_vec addMagazine "RKSL_2Rnd_mk82";
			_vec addMagazine "RKSL_4Rnd_mk82";
			_vec addMagazine "RKSL_6Rnd_mk82";
			_vec addweapon "RKSL_MK82Launcher";

			_vec addMagazine "RKSL_1Rnd_GP_500";
			_vec addMagazine "RKSL_2Rnd_GP_500";
			_vec addMagazine "RKSL_4Rnd_GP_500";
			_vec addMagazine "RKSL_6Rnd_GP_500";
			_vec addweapon "RKSL_500GPLauncher";

			_vec addMagazine "RKSL_1Rnd_mk83";
			_vec addMagazine "RKSL_2Rnd_mk83";
			_vec addMagazine "RKSL_3Rnd_mk83";
			_vec addMagazine "RKSL_4Rnd_mk83";
			_vec addMagazine "RKSL_6Rnd_mk83";
			_vec addweapon "RKSL_mk83Launcher";

			_vec addMagazine "RKSL_1Rnd_GP_1000";
			_vec addMagazine "RKSL_2Rnd_GP_1000";
			_vec addMagazine "RKSL_4Rnd_GP_1000";
			_vec addMagazine "RKSL_6Rnd_GP_1000";
			_vec addweapon "RKSL_1000GPLauncher";

			_vec addMagazine "RKSL_1Rnd_mk84";
			_vec addMagazine "RKSL_2Rnd_mk84";
			_vec addMagazine "RKSL_3Rnd_mk84";
			_vec addMagazine "RKSL_4Rnd_mk84";
			_vec addMagazine "RKSL_6Rnd_mk84";
			_vec addweapon "RKSL_mk84Launcher";

//retarded bombs
			_vec addMagazine "RKSL_1Rnd_GP_500RET";
			_vec addMagazine "RKSL_2Rnd_GP_500RET";
			_vec addMagazine "RKSL_4Rnd_GP_500RET";
			_vec addMagazine "RKSL_6Rnd_GP_500RET";
			_vec addweapon "RKSL_500GPRETLauncher";

			_vec addMagazine "RKSL_1Rnd_GP_1000RET";
			_vec addMagazine "RKSL_2Rnd_GP_1000RET";
			_vec addMagazine "RKSL_4Rnd_GP_1000RET";
			_vec addMagazine "RKSL_6Rnd_GP_1000RET";
			_vec addweapon "RKSL_1000GPRETLauncher";

//LGB


//laser only
			_vec addMagazine "RKSL_1Rnd_PAVE2_500";
			_vec addMagazine "RKSL_2Rnd_PAVE2_500";
			_vec addMagazine "RKSL_4Rnd_PAVE2_500";
			_vec addMagazine "RKSL_6Rnd_PAVE2_500";
			_vec addweapon "RKSL_Paveway500Launcher";

			_vec addMagazine "RKSL_1Rnd_pw2_gbu12";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu12";
			_vec addMagazine "RKSL_4Rnd_pw2_gbu12";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu12";
			_vec addweapon "RKSL_gbu12Launcher";

			_vec addMagazine "RKSL_1Rnd_PAVE2_1000";
			_vec addMagazine "RKSL_2Rnd_PAVE2_1000";
			_vec addMagazine "RKSL_4Rnd_PAVE2_1000";
			_vec addMagazine "RKSL_6Rnd_PAVE2_1000";
			_vec addweapon "RKSL_Paveway1000Launcher";

			_vec addMagazine "RKSL_1Rnd_pw2_gbu16";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu16";
			_vec addMagazine "RKSL_4Rnd_pw2_gbu16";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu16";
			_vec addweapon "RKSL_gbu16Launcher";

			_vec addMagazine "RKSL_1Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_2Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_4Rnd_pw2_gbu10";
			_vec addMagazine "RKSL_6Rnd_pw2_gbu10";
			_vec addweapon "RKSL_gbu10Launcher";

			_vec addMagazine "RKSL_1Rnd_kab500kr";
			_vec addMagazine "RKSL_2Rnd_kab500kr";
			_vec addMagazine "RKSL_3Rnd_kab500kr";
			_vec addMagazine "RKSL_4Rnd_kab500kr";
			_vec addMagazine "RKSL_5Rnd_kab500kr";
			_vec addMagazine "RKSL_6Rnd_kab500kr";
			_vec addweapon "RKSL_kab500krLauncher";

//laser and ir 250lb
			_vec addMagazine "RKSL_1Rnd_PAVE4_500";
			_vec addMagazine "RKSL_2Rnd_PAVE4_500";
			_vec addMagazine "RKSL_4Rnd_PAVE4_500";
			_vec addMagazine "RKSL_6Rnd_PAVE4_500";
			_vec addweapon "RKSL_Paveway4500Launcher";

			_vec addMagazine "RKSL_1Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_2Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_3Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_4Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_5Rnd_GP_fab500m62";
			_vec addMagazine "RKSL_6Rnd_GP_fab500m62";
			_vec addweapon "RKSL_fab500m62Launcher";

//SEAD
			_vec addMagazine "RKSL_1Rnd_ALARM";
			_vec addMagazine "RKSL_2Rnd_ALARM";
			_vec addMagazine "RKSL_4Rnd_ALARM";
			_vec addMagazine "RKSL_6Rnd_ALARM";
			_vec addweapon "RKSL_ALARM_Launcher";

			_vec addMagazine "RKSL_1Rnd_agm88harm";
			_vec addMagazine "RKSL_2Rnd_agm88harm";
			_vec addMagazine "RKSL_4Rnd_agm88harm";
			_vec addMagazine "RKSL_6Rnd_agm88harm";
			_vec addweapon "RKSL_agm88harm_Launcher";

			_vec addMagazine "RKSL_1rnd_stormshadow";
			_vec addMagazine "RKSL_2rnd_stormshadow";
			_vec addweapon "RKSL_stormshadow_Launcher";

			_vec addMagazine "RKSL_1rnd_kepd350";
			_vec addMagazine "RKSL_2rnd_kepd350";
			_vec addweapon "RKSL_kepd350_Launcher";

//ASW
			_vec addMagazine "RKSL_1rnd_harpoon";
			_vec addMagazine "RKSL_2rnd_harpoon";
			_vec addMagazine "RKSL_4rnd_harpoon";
			_vec addweapon "RKSL_harpoon_Launcher";

			_vec addMagazine "RKSL_1rnd_seaeagle";
			_vec addMagazine "RKSL_2rnd_seaeagle";
			_vec addMagazine "RKSL_4rnd_seaeagle";
			_vec addweapon "RKSL_seaeagle_Launcher";

			_vec addMagazine "RKSL_1rnd_agm119mk3";
			_vec addMagazine "RKSL_2rnd_agm119mk3";
			_vec addMagazine "RKSL_3rnd_agm119mk3";
			_vec addMagazine "RKSL_4rnd_agm119mk3";
			_vec addweapon "RKSL_agm119mk3_Launcher";

			_vec addMagazine "RKSL_1rnd_am39";
			_vec addMagazine "RKSL_2rnd_am39";
			_vec addMagazine "RKSL_3rnd_am39";
			_vec addMagazine "RKSL_4rnd_am39";
			_vec addweapon "RKSL_am39_Launcher";

			_vec addMagazine "RKSL_1rnd_rbs15";
			_vec addMagazine "RKSL_2rnd_rbs15";
			_vec addMagazine "RKSL_3rnd_rbs15";
			_vec addMagazine "RKSL_4rnd_rbs15";
			_vec addweapon "RKSL_rbs15_Launcher";

//pylon types

			_vec addMagazine "RKSL_1Rnd_pylonblank";
			_vec addMagazine "RKSL_2Rnd_pylonblank";
			_vec addMagazine "RKSL_3Rnd_pylonblank";
			_vec addMagazine "RKSL_4Rnd_pylonblank";
			_vec addMagazine "RKSL_5Rnd_pylonblank";
			_vec addMagazine "RKSL_6Rnd_pylonblank";
			_vec addMagazine "RKSL_7Rnd_pylonblank";
			_vec addMagazine "RKSL_8Rnd_pylonblank";
			_vec addMagazine "RKSL_12Rnd_pylonblank";
			_vec addMagazine "RKSL_16Rnd_pylonblank";
			_vec addMagazine "RKSL_18Rnd_pylonblank";
			_vec addMagazine "RKSL_20Rnd_pylonblank";
			_vec addMagazine "RKSL_24Rnd_pylonblank";
			_vec addMagazine "RKSL_28Rnd_pylonblank";
			_vec addMagazine "RKSL_32Rnd_pylonblank";
			_vec addMagazine "RKSL_36Rnd_pylonblank";
			_vec addMagazine "RKSL_40Rnd_pylonblank";
			_vec addMagazine "RKSL_60Rnd_pylonblank";
			_vec addweapon "RKSL_pylonblanker";

			_vec addMagazine "RKSL_efa_pylons_1_mag";
			_vec addMagazine "RKSL_efa_pylons_2_mag";
			_vec addMagazine "RKSL_efa_pylons_3_mag";
			_vec addMagazine "RKSL_efa_pylons_4_mag";
			_vec addMagazine "RKSL_efa_pylons_5_mag";
			_vec addMagazine "RKSL_efa_pylons_6_mag";
			_vec addMagazine "RKSL_efa_pylons_7_mag";

//fuel tanks 
//are loaded with the typhoon addon, NOT the airweapons pbo

			_vec addMagazine "RKSL_1rnd_efa_fueltank";
			_vec addMagazine "RKSL_2rnd_efa_fueltank";
			_vec addMagazine "RKSL_1rnd_efa_cft";
			_vec addweapon "RKSL_efa_fueltank_launcher";

//line for the init tes get rid of everything
//{this removeweapon _x} forEach (weapons this);{this removemagazine _x} forEach (magazines this);

//possible default models - but best to use only one in init

//all models
//NEW
"rksl_efa_fgr4_raf_1"
"rksl_efa_fgr4_raf_2"
"rksl_efa_fgr4_raf_3"
"rksl_efa_fgr4_raf_4"
"rksl_efa_fgr4_raf_5"
"rksl_efa_fgr4_raf_6"
"rksl_efa_fgr4_raf_7"
"rksl_efa_fgr4_raf_8"
"rksl_efa_fgr4_raf_9"
"rksl_efa_fgr4_raf_10"
"rksl_efa_fgr4_raf_11"
"rksl_efa_fgr4_raf_12"
"rksl_efa_fgr4_raf_13"
"rksl_efa_fgr4_raf_14"
"rksl_efa_fgr4_raf_15"
"rksl_efa_fgr4_raf_16"
"rksl_efa_fgr4_raf_17"
"rksl_efa_fgr4_raf_18"
"rksl_efa_fgr4_raf_19"
"rksl_efa_fgr4_raf_20"
"rksl_efa_fgr4_raf_21"

"rksl_efa_fgr4_17_red"
"rksl_efa_fgr4_2_red"
"rksl_efa_fgr4_3_red"
"rksl_efa_fgr4_4_red"
"rksl_efa_fgr4_5_red"
"rksl_efa_fgr4_6_red"
"rksl_efa_fgr4_7_red"
"rksl_efa_fgr4_8_red"
"rksl_efa_fgr4_9_red"
"rksl_efa_fgr4_raf_10_red"
"rksl_efa_fgr4_raf_11_red"
"rksl_efa_fgr4_raf_12_red"
"rksl_efa_fgr4_raf_13_red"
"rksl_efa_fgr4_raf_14_red"
"rksl_efa_fgr4_raf_15_red"
"rksl_efa_fgr4_raf_16_red"
"rksl_efa_fgr4_raf_17_red"
"rksl_efa_fgr4_raf_18_red"
"rksl_efa_fgr4_raf_19_red"
"rksl_efa_fgr4_20_red"

//Gnat
//"RKTSU33AG"
//"RKTSU33TAG"

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

*/

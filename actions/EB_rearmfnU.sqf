///   Unsung Planes rearm script

// EB_rearmfnU called from mainthreadc/EB_rearm
//EB_airfn1 = _vec addAction [EB_astring1, "Actions\EB_rearmfnU.sqf",[_vec,_player,1], 5, true, true,"",""];
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
	if (_fntype==3) then {_stringa = parseText "<img image='img\support\sup01.paa' size='2.0' shadow='false' /><br />Anti-Tank Air-Ground Support (AGM)</t>"};
	if (_fntype==4) then {_stringa = parseText "<img image='img\support\offensive.paa' size='2.0' shadow='false' /><br />Multi-Role Combat (MR)</t>"};
	if (_fntype==5) then {_stringa = parseText "<img image='img\support\strk.paa' size='2.0' shadow='false' /><br />Bombing Run (BMB)</t>"};
	if (_fntype==6) then {_stringa = parseText "<img image='img\support\cbu.paa' size='2.0' shadow='false' /><br />Cluster Munitions (CBU)</t>"};
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
	if(("LaserDesignator_mounted" in _weapons)) then {_vec removeweapon "LaserDesignator_mounted";_vec removeMagazine "LaserBatteries"};
};

_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
_vec addweapon "CMFlareLauncher";
player selectWeapon "CMFlareLauncher";
_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
player selectWeapon (_muzzles select 0);

if ( (_vec isKindof "Helicopter") || (_type in  EB_twoseaterplanes) ) then
{
	_vec removeMagazine "LaserBatteries";
	_vec addMagazine "LaserBatteries";
	if(not ("LaserDesignator_mounted" in _weapons)) then {_vec addweapon "LaserDesignator_mounted"};
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
		if(_type == "uns_F4_CAP") then 
		{
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_Fuel";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
//mid lower 6
			_vec addMagazine "uns_6Rnd_pylonblank";
//body 4
			_vec addMagazine "uns_AIM7Ex4";
			_vec addweapon "uns_AIM7ELauncher";
		};
		if(_type == "uns_F4Navy_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_FuelNavy";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
//mid lower 6
			_vec addMagazine "uns_6Rnd_pylonblank";
//body 4
			_vec addMagazine "uns_AIM7Ex4";
			_vec addweapon "uns_AIM7ELauncher";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniHE";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx3";
//inner wing
			_vec addMagazine "A7uns_2Rnd_Fuel";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_AIM9Ex6";
			_vec addweapon "uns_AIM9ELauncher";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//
			_vec addweapon "A7unsFuelauncher";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniHE";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx3";
//inner wing
			_vec addMagazine "A7uns_2Rnd_Fuel";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_AIM9Ex6";
			_vec addweapon "uns_AIM9ELauncher";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//
			_vec addweapon "A7unsFuelauncher";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_550Rnd_M39_HEI";
			_vec addweapon "uns_M39E";
//outer 2
			_vec addMagazine "uns_2Rnd_pylonblank";
//inner 6
			_vec addMagazine "uns_AIM9Dx6";
			_vec addweapon "uns_AIM9DLauncher";
//body 4
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
		};
		if(_type == "uns_mig17_CAP") then 
		{
			_vec addMagazine "uns_80rnd_37mm_n37";
			_vec addweapon "uns_N37";
			_vec addMagazine "uns_240Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";
			_vec addMagazine "uns_R60x2";
			_vec addweapon "uns_R60_Launcher";
			_vec addMagazine "uns_K13x2";
			_vec addweapon "uns_K13Launcher";
//			_vec addMagazine "uns_mig17_Fueltank";
//			_vec addweapon "uns_mig17_Fuelauncher";
		};
		if(_type == "uns_mig21_CAP") then 
		{
			_vec addMagazine "uns_600Rnd_23mm_GP9";
			_vec addweapon "uns_GP9";
			_vec addMagazine "uns_140rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
//outer 2
//			_vec addMagazine "uns_K13x2";
			_vec addweapon "uns_K13Launcher";
//inner 6
			_vec addMagazine "uns_R60x6";
			_vec addweapon "uns_R60_Launcher";
//body 1
			_vec addMagazine "Mig21_1Rnd_Fuel";
			_vec addweapon "Mig21Fuelauncher";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_AIM9Dx12";
			_vec addweapon "uns_AIM9DLauncher";
			_vec addMagazine "uns_AIM9Ex8";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_AIM7Ex6";
			_vec addweapon "uns_AIM7ELauncher";
		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm_HEI";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_36Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_AIM9Ex5";
			_vec addweapon "uns_AIM9ELauncher";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_28Rnd_FFAR",[-1]];
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
		};
		if(_type == "uns_A6_Intruder") then 
		{
			_vec addMagazine "uns_12Rnd_zuniHE";
			_vec addweapon "Uns_ZuniLauncher";
//outer 2
			_vec addMagazine "uns_2rnd_rackx3";
//inner 2
			_vec addMagazine "A6uns_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_rackx3";
//outer wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body rack x6
			_vec addMagazine "uns_6Rnd_pylonblank";

//outer wing racks x3
			_vec addMagazine "uns_AIM9Ex6";
			_vec addweapon "uns_AIM9ELauncher";
//inner wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//body rack x3
			_vec addMagazine "uns_LAU10_125mmpodx3";
			_vec addweapon  "A6unsFuelauncher";
		};
//F105
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_F105_1Rnd_Fuel";
			_vec addweapon "uns_F105_FuelTank";
			_vec addMagazine "uns_12Rnd_pylonblank";
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer wing x2
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_AIM9Ex1";
			_vec addweapon "uns_AIM9ELauncher";
//inner wing x2
			_vec addMagazine "uns_F105_2Rnd_Fuel";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
			_vec addweapon "uns_F105F_FuelTanks";
//body x1
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "uns_12Rnd_pylonblank";

//body racks
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_1Rnd_pylonblank";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
			_vec addMagazine "uns_8Rnd_zuniHE";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing x2
			_vec addMagazine "uns_AIM9Ex2";
			_vec addweapon "uns_AIM9ELauncher";
//inner wing x2
			_vec addMagazine "uns_2rnd_rackx3";
//body x1
			_vec addMagazine "uns_1Rnd_A4_fueltank";
			_vec addweapon "uns_A4_FuelLauncher";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body racks x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_2Rnd_pylonblank";
//body racks x3
			_vec addMagazine "uns_3Rnd_pylonblank";
		};
	};
	case 2://CAS
	{
		if(_type == "uns_F4_CAS") then 
		{
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//4 wing
			_vec addMagazine "Uns_4Rnd_Napalm_750_bis";
			_vec addweapon "Uns_NapalmLauncher_750_bis";
//4 body
			_vec addMagazine "Uns_2rnd_CBU75_bis";
			_vec addweapon "uns_CBU75Launcher";
			_vec addMagazine "Uns_2Rnd_GBU8_bis";
			_vec addweapon "Uns_GBU8Launcher";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer wing
			_vec addMagazine "uns_M200_70mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx3";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "Uns_6Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer wing
			_vec addMagazine "uns_M200_70mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx3";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "Uns_6Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_550Rnd_M39_HEI";
			_vec addweapon "uns_M39E";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addweapon "Uns_ZuniLauncher";
//outer 2
			_vec addMagazine "uns_2Rnd_pylonblank";
//inner 6
			_vec addMagazine "Uns_1Rnd_CBU32A";
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "Uns_1Rnd_CBU32B";
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "Uns_1Rnd_CBU75";
//body 4
			_vec addMagazine "Uns_4Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";
			_vec addweapon "Uns_CBU75Launcher";
			_vec addweapon "uns_CBU32BLauncher";
			_vec addweapon "Uns_CBU32ALauncher";
		};
		if(_type == "uns_mig17_CAS") then 
		{
			_vec addMagazine "uns_160rnd_37mm_n37";
			_vec addweapon "uns_N37";
			_vec addMagazine "uns_160Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";
			_vec addMagazine "uns_32Rnd_57mm";
			_vec addweapon "Uns_57mmLauncher";
			_vec addMagazine "Uns_2Rnd_Napalm_500_bis";
			_vec addweapon "Uns_NapalmLauncher_500";
//			_vec addMagazine "uns_mig17_Fueltank";
//			_vec addweapon "uns_mig17_Fuelauncher";
		};
		if(_type == "uns_mig21_CAS") then 
		{
			_vec addMagazine "uns_420rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
//outer 2
			_vec addMagazine "Uns_2Rnd_Napalm_500_bis";
			_vec addweapon "Uns_NapalmLauncher_500";
//inner 6
			_vec addMagazine "Uns_4Rnd_kab250";
			_vec addweapon "Uns_BombLauncher_kab250";
			_vec addMagazine "uns_2Rnd_pylonblank";
//body 1
			_vec addMagazine "Uns_1Rnd_kab500";
			_vec addweapon "Uns_BombLauncher_kab500";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_114Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_28Rnd_WP_FFAR";
			_vec addweapon "uns_WPLauncher";
			_vec addMagazine "Uns_12Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
			_vec addMagazine "Uns_8Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
			_vec addMagazine "Uns_4Rnd_CBU75";
			_vec addweapon "Uns_CBU75Launcher";
			_vec addMagazine "Uns_4Rnd_CBU32A";
			_vec addweapon "Uns_CBU32ALauncher";
			_vec addMagazine "Uns_4Rnd_CBU32B";
			_vec addweapon "Uns_CBU32BLauncher";
			_vec addMagazine "Uns_4Rnd_GBU8";
			_vec addweapon "Uns_GBU8Launcher";

		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm_HEI";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_56Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer L
			_vec addMagazine "Uns_1Rnd_CBU75_bis";
			_vec addweapon "Uns_CBU75Launcher";
//inner L
			_vec addMagazine "Uns_1Rnd_Napalm_500_bis";
			_vec addweapon "Uns_NapalmLauncher_500";
//outer R
			_vec addMagazine "Uns_1Rnd_CBU75_bis";
//inner R
			_vec addMagazine "Uns_1Rnd_Napalm_500_bis";
//centre
			_vec addMagazine "Uns_1Rnd_Napalm_500_bis";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_76Rnd_FFAR",[-1]];
			_vec addMagazine "Uns_1Rnd_CBU32A_bis";
			_vec addweapon "Uns_CBU32ALauncher";
			_vec addMagazine "Uns_1Rnd_CBU32B_bis";
			_vec addweapon "Uns_CBU32BLauncher";
		};
		if(_type == "uns_A6_Intruder") then 
		{
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addMagazine "uns_8Rnd_zuniWP";
			_vec addweapon "Uns_ZuniLauncher";
//outer 2
			_vec addMagazine "uns_2rnd_rackx3";
//inner 2
			_vec addMagazine "uns_2rnd_rackx6";
//body
			_vec addMagazine "uns_1rnd_rackx6";
//outer wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner wing racks x6
			_vec addMagazine "Uns_12Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";
//body rack x6
			_vec addMagazine "Uns_6Rnd_CBU75";
			_vec addweapon "uns_CBU75Launcher";

//outer wing racks x3
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx2";
 			_vec addMagazine "uns_M200_70mmpodx2";
//inner wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//body rack x3
			_vec addMagazine "uns_3Rnd_pylonblank";
		};
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_WP_FFAR";
			_vec addweapon "uns_WPLauncher";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_M200_70mmpodx2";
//mid wing x2
			_vec addMagazine "uns_2rnd_F105_rackx6";
//body
			_vec addMagazine "uns_F105_1Rnd_Fuel";
//wing racks
			_vec addMagazine "Uns_12Rnd_Napalm_500_bis";
			_vec addweapon "Uns_NapalmLauncher_500";
//body rack
			_vec addMagazine "uns_6Rnd_pylonblank";
			_vec addweapon "uns_F105_FuelTank";

		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "Uns_NapalmLauncher_500";
//body rack
			_vec addMagazine "Uns_6Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_4Rnd_zuniFRAG";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing x2
			_vec addMagazine "Uns_2Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//inner wing x2
			_vec addMagazine "uns_2rnd_rackx6";
//body x1
			_vec addMagazine "uns_1rnd_rackx3";
//inner wing racks x6
			_vec addMagazine "Uns_12Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";
//body racks x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//body racks x3
			_vec addMagazine "uns_M200_70mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx1";
		};
	};
	case 3://AGM
	{
		if(_type == "uns_F4_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_Fuel";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
//mid lower 6
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addweapon "uns_AGM65B_Launcher";
//body 4
			_vec addMagazine "uns_AGM45_bisx2";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addMagazine "uns_AGM12_bisx2";
			_vec addweapon "uns_AGM12_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_F4Navy_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_FuelNavy";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
//mid lower 6
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addweapon "uns_AGM65B_Launcher";
//body 4
			_vec addMagazine "uns_AGM45_bisx2";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addMagazine "uns_AGM12_bisx2";
			_vec addweapon "uns_AGM12_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing
			_vec addMagazine "uns_AGM12x2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx3";
//inner wing
			_vec addMagazine "uns_2rnd_rackx3";
//body 2
			_vec addMagazine "uns_AIMEx2";
			_vec addweapon "uns_AIM9ELauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
//inner x3
			_vec addMagazine "uns_AGM65Bx4";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addweapon "uns_AGM65B_Launcher";
			_vec addweapon "Uns_AGM12_Launcher";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing
			_vec addMagazine "uns_AGM12x2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx3";
//inner wing
			_vec addMagazine "uns_2rnd_rackx3";
//body 2
			_vec addMagazine "uns_AIMEx2";
			_vec addweapon "uns_AIM9ELauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
//inner x3
			_vec addMagazine "uns_AGM65Bx4";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addweapon "uns_AGM65B_Launcher";
			_vec addweapon "Uns_AGM12_Launcher";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_550Rnd_M39";
			_vec addweapon "uns_M39E";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
			_vec addMagazine "uns_2Rnd_pylonblank";

			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_AGM12_bisx2";
			_vec addweapon "uns_AGM12_Launcher";
			_vec addMagazine "uns_1Rnd_pylonblank";
		};
		if(_type == "uns_mig17_CAP") then 
		{
			_vec addMagazine "uns_800Rnd_23mm_GP9";
			_vec addweapon "uns_GP9";
			_vec addMagazine "uns_420rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
			_vec addMagazine "uns_mig17_Fueltank";
			_vec addweapon "uns_mig17_Fuelauncher";
		};
		if(_type == "uns_mig21_CAP") then 
		{
			_vec addMagazine "uns_800Rnd_23mm_GP9";
			_vec addweapon "uns_GP9";
			_vec addMagazine "uns_420rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
//outer 2
			_vec addMagazine "uns_K13x8";
			_vec addweapon "uns_K13Launcher";
//body 1
			_vec addMagazine "Mig21_1Rnd_Fuel";
			_vec addweapon "Mig21Fuelauncher";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_76Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_AGM65Bx8";
			_vec addweapon "uns_AGM65B_Launcher";
			_vec addMagazine "uns_AGM45x8";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addMagazine "uns_AGM12x4";
			_vec addweapon "uns_AGM12_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_36Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "Uns_5Rnd_CBU24_bis";
			_vec addweapon "Uns_CBU24Launcher";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_38Rnd_FFAR",[-1]];
			_vec addMagazine "uns_AGM65Bx2";
			_vec addweapon "uns_AGM65B_Launcher";
		};
		if(_type == "uns_A6_Intruder") then 
		{
//outer 2
			_vec addMagazine "uns_AGM12x2";
			_vec addweapon "uns_AGM12_Launcher";
//inner 2
			_vec addMagazine "uns_2rnd_rackx3";
//body
			_vec addMagazine "uns_1rnd_rackx6";
//outer wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body rack x6
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
 			_vec addMagazine "uns_ALQ110";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "uns_AGM65B_Launcher";
//outer wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
//body rack x3
			_vec addMagazine "uns_3Rnd_pylonblank";
		};
//F105
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_M200_70mmpodx2";
//inner wing x2
			_vec addMagazine "uns_F105_2Rnd_Fuel";
			_vec addMagazine "uns_AGM12x1";
			_vec addweapon "uns_AGM12_Launcher";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";

//wing racks
			_vec addMagazine "uns_12Rnd_pylonblank";

//body rack
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_LAU10_125mmpodx2";
//inner wing x2
			_vec addMagazine "uns_AGM12x2";
			_vec addweapon "uns_AGM12_Launcher";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";

//wing racks
			_vec addMagazine "uns_12Rnd_pylonblank";

//body rack
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
//outer wing x2
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_AGM12x1";
			_vec addweapon "uns_AGM12_Launcher";
//inner wing x2
			_vec addMagazine "uns_2rnd_rackx3";
//body x1
			_vec addMagazine "uns_1rnd_rackx3";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body racks x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "uns_AGM45x4";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addMagazine "uns_2Rnd_pylonblank";
//body racks x3
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_AGM12x1";
 			_vec addMagazine "uns_ALQ110";
		};
	};
	case 4://MR
	{
		if(_type == "uns_F4_CAS") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//4 wing
			_vec addMagazine "Uns_2rnd_CBU24_bis";
			_vec addweapon "uns_CBU24Launcher";
			_vec addMagazine "Uns_2Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
//4 body
			_vec addMagazine "uns_AGM65Bx2";
			_vec addweapon "uns_AGM65B_Launcher";
			_vec addMagazine "uns_AIM7Ex2";
			_vec addweapon "uns_AIM7ELauncher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx6";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";
//inner x6
			_vec addMagazine "uns_12Rnd_mk81";
			_vec addweapon "uns_MK81Launcher";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx6";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";
//inner x6
			_vec addMagazine "uns_12Rnd_mk81";
			_vec addweapon "uns_MK81Launcher";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_275Rnd_M39";
			_vec addweapon "uns_M39E";
//outer 2
			_vec addMagazine "uns_2Rnd_pylonblank";
//inner 6
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_4Rnd_Mk83_bis";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "uns_Mk83Launcher";
//body 4
			_vec addMagazine "Uns_4Rnd_Mk82_snake_bis";
			_vec addweapon "Uns_Mk82SnakeLauncher";
		};
		if(_type == "uns_mig17_CAS") then 
		{
			_vec addMagazine "uns_80rnd_37mm_n37";
			_vec addweapon "uns_N37";
			_vec addMagazine "uns_160Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";
			_vec addMagazine "uns_16Rnd_57mm";
			_vec addweapon "Uns_57mmLauncher";
			_vec addMagazine "Uns_2Rnd_fab500";
			_vec addweapon "Uns_BombLauncher_fab500";
			_vec addMagazine "uns_R60x2";
			_vec addweapon "uns_R60_Launcher";
		};
		if(_type == "uns_mig21_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_23mm_GP9";
			_vec addweapon "uns_GP9";
			_vec addMagazine "uns_280rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
//outer 2
			_vec addMagazine "uns_K13x2";
			_vec addweapon "uns_K13Launcher";
//inner 6
			_vec addMagazine "Uns_4Rnd_fab250";
			_vec addweapon "Uns_BombLauncher_fab250";
			_vec addMagazine "uns_2Rnd_pylonblank";
//body 1
			_vec addMagazine "Uns_1Rnd_Napalm_750_bis";
			_vec addweapon "Uns_NapalmLauncher_750";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_84Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "Uns_4Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
			_vec addMagazine "Uns_2Rnd_CBU75";
			_vec addweapon "Uns_CBU75Launcher";
			_vec addMagazine "Uns_2Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";
			_vec addMagazine "Uns_2Rnd_CBU32A";
			_vec addweapon "Uns_CBU32ALauncher";
			_vec addMagazine "Uns_2Rnd_CBU32B";
			_vec addweapon "Uns_CBU32BLauncher";
			_vec addMagazine "Uns_2Rnd_Mk84";
			_vec addweapon "Uns_Mk84Launcher";
			_vec addMagazine "uns_AGM45x4";
			_vec addweapon "uns_AGM45_Launcher";

		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_8Rnd_WP_FFAR";
			_vec addweapon "uns_WPLauncher";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//OL
			_vec addMagazine "Uns_1Rnd_CBU24_bis";
			_vec addweapon "Uns_CBU24Launcher";
//iL
			_vec addMagazine "Uns_1Rnd_Mk82_snake_bis";
			_vec addweapon "uns_MK82SnakeLauncher";
//oR
			_vec addMagazine "Uns_1Rnd_CBU24_bis";
//iR
			_vec addMagazine "Uns_1Rnd_Mk82_snake_bis";
//c
			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_56Rnd_FFAR",[-1]];
			_vec addMagazine "Uns_4Rnd_Mk81_bis";
			_vec addweapon "Uns_Mk81Launcher"; 
		};
		if(_type == "uns_A6_Intruder") then 
		{
			_vec addMagazine "uns_12Rnd_zuniFRAG";
			_vec addMagazine "uns_12Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer 2
			_vec addMagazine "uns_2rnd_rackx3";
//inner 2
			_vec addMagazine "uns_2rnd_rackx6";
//body
			_vec addMagazine "uns_1rnd_rackx6";
//outer wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner wing racks x6
			_vec addMagazine "Uns_12Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//body rack x6
			_vec addMagazine "Uns_3Rnd_CBU75";
			_vec addweapon "uns_CBU75Launcher";
			_vec addMagazine "Uns_3Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";
//outer wing racks x3
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx2";
//inner wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//body rack x3
			_vec addMagazine "uns_3Rnd_pylonblank";
		};
//F105
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_WP_FFAR";
			_vec addweapon "uns_WPLauncher";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_M200_70mmpodx2";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "uns_MK82SnakeLauncher";
//body rack
			_vec addMagazine "Uns_6Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniWP";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "Uns_NapalmLauncher_500";
//body rack
			_vec addMagazine "Uns_6Rnd_Mk83";
			_vec addweapon "Uns_Mk83Launcher";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
			_vec addMagazine "uns_19Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "uns_4Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing x2
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "uns_M200_70mmpodx1";
//inner wing x2
			_vec addMagazine "uns_2rnd_rackx6";
//body x1
			_vec addMagazine "uns_1rnd_rackx6";
//inner wing racks x6
			_vec addMagazine "Uns_12Rnd_Mk81";
			_vec addweapon "Uns_Mk81Launcher";
//body racks x6
			_vec addMagazine "Uns_1Rnd_Napalm_750";
			_vec addMagazine "Uns_1Rnd_Napalm_750";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Napalm_750";
			_vec addMagazine "Uns_1Rnd_Napalm_750";
 			_vec addMagazine "uns_ALQ110";
			_vec addweapon "Uns_NapalmLauncher_750";
//inner wing racks x3
			_vec addMagazine "uns_9Rnd_pylonblank";
//body racks x3
		};
	};
	case 5://BMB
	{
		if(_type == "uns_F4_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_Fuel";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Dx4";
			_vec addweapon "uns_AIM9DLauncher";
//mid lower 6
			_vec addMagazine "Uns_6Rnd_Mk82_bis";
			_vec addweapon "uns_MK82Launcher";
//body 4
			_vec addMagazine "Uns_2Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
			_vec addMagazine "Uns_2Rnd_Mk84_bis";
			_vec addweapon "Uns_Mk84Launcher";
		};
		if(_type == "uns_F4Navy_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_FuelNavy";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Dx4";
			_vec addweapon "uns_AIM9DLauncher";
//mid lower 6
			_vec addMagazine "Uns_6Rnd_Mk82_bis";
			_vec addweapon "uns_MK82Launcher";
//body 4
			_vec addMagazine "Uns_2Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
			_vec addMagazine "Uns_2Rnd_Mk84_bis";
			_vec addweapon "Uns_Mk84Launcher";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing
			_vec addMagazine "uns_2rnd_rackx6";
//mid wing
			_vec addMagazine "uns_2rnd_rackx3";
//inner wing
			_vec addMagazine "uns_2rnd_rackx6";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "Uns_12Rnd_Mk82";
			_vec addweapon "uns_MK82Launcher";
//mid x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner x6
			_vec addMagazine "uns_12Rnd_mk81";
			_vec addweapon "uns_MK81Launcher";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "Uns_6Rnd_Mk83";
			_vec addweapon "uns_MK83Launcher";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing
			_vec addMagazine "uns_2rnd_rackx6";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx3";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addweapon "uns_MK82snakeLauncher";
//mid x6
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
//inner x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_275Rnd_M39";
			_vec addweapon "uns_M39E";
//outer 2
			_vec addMagazine "Uns_2Rnd_Mk82_snake_bis";
			_vec addweapon "Uns_Mk82SnakeLauncher";
//inner 6
			_vec addMagazine "Uns_6Rnd_Mk83_bis";
			_vec addweapon "Uns_Mk83Launcher";
//body 4
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_2Rnd_Mk84_bis";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "Uns_Mk84Launcher";
		};
		if(_type == "uns_mig17_CAP") then 
		{
			_vec addMagazine "uns_40rnd_37mm_n37";
			_vec addweapon "uns_N37";
			_vec addMagazine "uns_160Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";
			_vec addMagazine "Uns_4Rnd_fab250";
			_vec addweapon "Uns_BombLauncher_fab250";
			_vec addMagazine "Uns_2Rnd_fab500";
			_vec addweapon "Uns_BombLauncher_fab500";
//			_vec addMagazine "uns_mig17_Fueltank";
//			_vec addweapon "uns_mig17_Fuelauncher";
		};
		if(_type == "uns_mig21_CAP") then 
		{
			_vec addMagazine "uns_200Rnd_23mm_GP9";
			_vec addweapon "uns_GP9";
//outer 2
			_vec addMagazine "Uns_1Rnd_fab500";
			_vec addMagazine "Uns_1Rnd_fab500";
			_vec addweapon "Uns_BombLauncher_fab500";
//inner 6
			_vec addMagazine "Uns_4Rnd_fab250";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addweapon "Uns_BombLauncher_fab250";
//body 1
			_vec addMagazine "Uns_1Rnd_fab500";
//			_vec addMagazine "Mig21_1Rnd_Fuel";
//			_vec addweapon "Mig21Fuelauncher";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "Uns_10Rnd_Mk81";
			_vec addweapon "Uns_Mk81Launcher"; 
			_vec addMagazine "Uns_8Rnd_Mk82";
			_vec addweapon "uns_MK82Launcher"; 
			_vec addMagazine "Uns_6Rnd_Mk83";
			_vec addweapon "Uns_Mk83Launcher";
			_vec addMagazine "Uns_4Rnd_Mk84";
			_vec addweapon "Uns_Mk84Launcher";
		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_600Rnd_Skyraider_4x20mm";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";
			_vec addMagazine "Uns_1Rnd_Mk81_bis";
			_vec addweapon "Uns_Mk81Launcher";
			_vec addMagazine "Uns_1Rnd_Mk82_bis";
			_vec addweapon "uns_MK82Launcher";
			_vec addMagazine "Uns_1Rnd_Mk81_bis";
			_vec addMagazine "Uns_1Rnd_Mk82_bis";
			_vec addMagazine "Uns_1Rnd_Mk84_bis";
			_vec addweapon "Uns_Mk84Launcher";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_38Rnd_FFAR",[-1]];
			_vec addMagazine "Uns_2Rnd_Mk82_snake_bis";
			_vec addweapon "uns_MK82SnakeLauncher";
		};
		if(_type == "uns_A6_Intruder") then 
		{
//outer 2
			_vec addMagazine "uns_2rnd_rackx6";
//inner 2
			_vec addMagazine "uns_2rnd_rackx3";
//body
			_vec addMagazine "uns_1rnd_rackx3";
//outer wing racks x6
			_vec addMagazine "Uns_12Rnd_Mk82";
			_vec addweapon "uns_MK82Launcher";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body rack x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//outer wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "Uns_6Rnd_Mk83";
			_vec addweapon "uns_MK83Launcher";
//body rack x3
			_vec addMagazine "Uns_2Rnd_Mk84";
			_vec addweapon "uns_MK84Launcher";
 			_vec addMagazine "uns_ALQ110";
		};

//F105
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing rocketproxies x2
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addweapon "uns_MK83Launcher";
//body rack
			_vec addMagazine "Uns_1Rnd_Mk84";
			_vec addMagazine "Uns_1Rnd_Mk84";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk84";
			_vec addMagazine "Uns_1Rnd_Mk84";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "uns_MK84Launcher";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addweapon "uns_M61A1";
//outer wing rocketproxies x2
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addweapon "uns_MK83Launcher";
//body rack
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "Uns_GBU8Launcher";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
//outer wing x2
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
//inner wing x2
			_vec addMagazine "uns_2rnd_rackx3";
//body x1
			_vec addMagazine "Uns_1Rnd_Mk84";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body racks x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addweapon "uns_MK82Launcher";
//body racks x3
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addweapon "uns_MK84Launcher";
		};
	};
	case 6://LGB
	{
		if(_type == "uns_F4_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_Fuel";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Dx4";
			_vec addweapon "uns_AIM9DLauncher";
//mid lower 6
			_vec addMagazine "Uns_3Rnd_CBU24_bis";
			_vec addweapon "uns_CBU24Launcher";
			_vec addMagazine "Uns_3rnd_CBU75_bis";
			_vec addweapon "uns_CBU75Launcher";
//body 4
			_vec addMagazine "Uns_4Rnd_GBU8_bis";
			_vec addweapon "Uns_GBU8Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_F4Navy_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer 2
			_vec addMagazine "F4uns_1Rnd_FuelNavy";
			_vec addweapon "uns_F4Fuelauncher";
//mid top 4
			_vec addMagazine "uns_AIM9Dx4";
			_vec addweapon "uns_AIM9DLauncher";
//mid lower 6
			_vec addMagazine "Uns_2Rnd_CBU75_bis";
			_vec addweapon "uns_CBU75Launcher";
			_vec addMagazine "Uns_2rnd_CBU32A_bis";
			_vec addweapon "uns_CBU32ALauncher";
			_vec addMagazine "Uns_2rnd_CBU32B_bis";
			_vec addweapon "uns_CBU32BLauncher";
//body 4
			_vec addMagazine "Uns_4Rnd_GBU8_bis";
			_vec addweapon "Uns_GBU8Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "uns_A7_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx6";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_CBU24";
			_vec addweapon "uns_CBU24Launcher";
//inner x6
			_vec addMagazine "Uns_8Rnd_CBU75";
			_vec addMagazine "Uns_1Rnd_CBU32A";
			_vec addMagazine "Uns_1Rnd_CBU32B";
			_vec addweapon "uns_CBU75Launcher";
			_vec addweapon "uns_CBU32ALauncher";
			_vec addweapon "uns_CBU32BLauncher";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_A7N_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniWP";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing
			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing
			_vec addMagazine "uns_2rnd_rackx6";
//inner wing
			_vec addMagazine "uns_2rnd_rackx6";
//body 2
			_vec addMagazine "uns_AIMDx2";
			_vec addweapon "uns_AIM9DLauncher";
//outer x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//mid x6
			_vec addMagazine "Uns_12Rnd_CBU24";
			_vec addweapon "uns_CBU24Launcher";
//inner x6
			_vec addMagazine "Uns_8Rnd_CBU75";
			_vec addMagazine "Uns_1Rnd_CBU32A";
			_vec addMagazine "Uns_1Rnd_CBU32B";
			_vec addweapon "uns_CBU75Launcher";
			_vec addweapon "uns_CBU32ALauncher";
			_vec addweapon "uns_CBU32BLauncher";
//outer x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//mid x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner x3
			_vec addMagazine "uns_6Rnd_pylonblank";
		};
		if(_type == "uns_f100b_CAP") then 
		{
			_vec addMagazine "uns_275Rnd_M39_HEI";
			_vec addweapon "uns_M39E";
//outer 2
			_vec addMagazine "uns_AIM9Dx2";
			_vec addweapon "uns_AIM9DLauncher";
//inner 6
			_vec addMagazine "Uns_6Rnd_CBU24_bis";
			_vec addweapon "uns_CBU24Launcher";
//body 4
			_vec addMagazine "Uns_6Rnd_CBU75_bis";
			_vec addweapon "uns_CBU75Launcher";
		};
		if(_type == "uns_mig17_CAP") then 
		{
			_vec addMagazine "uns_40rnd_37mm_n37";
			_vec addweapon "uns_N37";
			_vec addMagazine "uns_160Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";
			_vec addMagazine "Uns_2Rnd_kab500";
			_vec addweapon "Uns_BombLauncher_kab500";
			_vec addMagazine "Uns_4Rnd_kab250";
			_vec addweapon "Uns_BombLauncher_kab250";
//			_vec addMagazine "uns_mig17_Fueltank";
//			_vec addweapon "uns_mig17_Fuelauncher";
		};
		if(_type == "uns_mig21_CAP") then 
		{
			_vec addMagazine "uns_140rnd_30mm_nr30";
			_vec addweapon "uns_NR30";
//outer 2
			_vec addMagazine "Uns_1Rnd_kab500";
			_vec addMagazine "Uns_1Rnd_kab500";
			_vec addweapon "Uns_BombLauncher_kab500";
//inner 6
			_vec addMagazine "Uns_4Rnd_kab250";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addweapon "Uns_BombLauncher_kab250";
//body 1
			_vec addMagazine "Uns_1Rnd_kab500";
//			_vec addMagazine "Mig21_1Rnd_Fuel";
//			_vec addweapon "Mig21Fuelauncher";
		};
		if(_type == "CSJ_C123") then 
		{
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addweapon "uns_AIM9ELauncher";
			_vec addMagazine "uns_28Rnd_WP_FFAR";
			_vec addweapon "uns_WPLauncher";
			_vec addMagazine "Uns_12Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";
			_vec addMagazine "Uns_12Rnd_CBU75";
			_vec addweapon "Uns_CBU75Launcher";
			_vec addMagazine "Uns_6Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";
			_vec addMagazine "Uns_6Rnd_CBU32A";
			_vec addweapon "Uns_CBU32ALauncher";
			_vec addMagazine "Uns_6Rnd_CBU32B";
			_vec addweapon "Uns_CBU32BLauncher";
		};
		if(_type == "uns_A1J") then 
		{
			_vec addMagazine "Uns_600Rnd_Skyraider_4x20mm_HEI";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addweapon "Uns_FFARLauncher";

			_vec addMagazine "Uns_1Rnd_CBU24_bis";
			_vec addweapon "Uns_CBU24Launcher";
			_vec addMagazine "Uns_1Rnd_CBU75_bis";
			_vec addweapon "Uns_CBU75Launcher";
			_vec addMagazine "Uns_1Rnd_CBU24_bis";
			_vec addMagazine "Uns_1Rnd_CBU75_bis";
//c
			_vec addMagazine "Uns_1Rnd_CBU32B_bis";
			_vec addweapon "Uns_CBU32BLauncher";
		};
//helicopters
		if(_type == "CSJ_AH1g") then 
		{
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";
			_vec addMagazineTurret ["uns_38Rnd_FFAR",[-1]];
			_vec addMagazine "Uns_2Rnd_CBU24_bis";
			_vec addweapon "Uns_CBU24Launcher";
		};
		if(_type == "uns_A6_Intruder") then 
		{
//outer 2
			_vec addMagazine "uns_2rnd_rackx3";
//inner 2
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "Uns_1Rnd_GBU8";
//body
			_vec addMagazine "uns_1rnd_rackx3";
//outer wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body rack x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//outer wing racks x3
			_vec addMagazine "uns_AGM45x6";
			_vec addweapon "uns_AGM45_Launcher";
//inner wing racks x3
			_vec addMagazine "uns_6Rnd_pylonblank";
//body rack x3
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addweapon "Uns_GBU8Launcher";
 			_vec addMagazine "uns_ALQ110";
		};
//F105
		if(_type == "uns_f105D_CAP") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
//outer wing rocketproxies x2
			_vec addMagazine "uns_AGM45x1";
			_vec addMagazine "uns_AGM45x1";
			_vec addweapon "uns_AGM45_Launcher";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "Uns_CBU75Launcher";
//body rack
			_vec addMagazine "Uns_1Rnd_CBU24";
			_vec addMagazine "Uns_1Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";
			_vec addMagazine "Uns_1Rnd_CBU32A";
			_vec addweapon "Uns_CBU32ALauncher";
			_vec addMagazine "Uns_1Rnd_CBU24";
			_vec addMagazine "Uns_1Rnd_CBU24";
			_vec addMagazine "Uns_1Rnd_CBU32B";
			_vec addweapon "Uns_CBU32BLauncher";
			_vec addweapon "uns_F105_FuelTanks";

		};
		if(_type == "uns_f105F_WW") then 
		{
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addweapon "uns_M61A1";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing rocketproxies x2
 			_vec addMagazine "uns_LAU10_125mmpodx2";
//mid wing x2
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_F105_2Rnd_Fuel";
//body
			_vec addMagazine "uns_1rnd_F105_rackx6";
//wing racks
			_vec addMagazine "uns_AGM45x1";
			_vec addweapon "uns_AGM45_Launcher";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_AGM45x1";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addMagazine "uns_AGM45x1";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_AGM45x1";
			_vec addMagazine "uns_3Rnd_pylonblank";
//body rack
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addweapon "uns_AGM12_Launcher";
			_vec addweapon "uns_F105_FuelTanks";
		};
		if(_type == "uns_A4E_skyhawk_CAS") then 
		{
			_vec addMagazine "uns_200Rnd_20mm_Mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addMagazine "uns_4Rnd_zuniHE";
			_vec addMagazine "uns_4Rnd_zuniWP";
			_vec addweapon "Uns_ZuniLauncher";
//outer wing x2
			_vec addMagazine "Uns_2Rnd_CBU75";
			_vec addweapon "Uns_CBU75Launcher";
//inner wing x2
			_vec addMagazine "uns_3rnd_rackx3";
//body x1
//inner wing racks x6
			_vec addMagazine "uns_12Rnd_pylonblank";
//body racks x6
			_vec addMagazine "uns_6Rnd_pylonblank";
//inner wing racks x3
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addMagazine "uns_LAU10_125mmpodx2";
//body racks x3
			_vec addMagazine "Uns_3Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";
		};
	};
	case 7://SEAD
	{
		
	};
  };
};

/*

1/2/3/4/5/6/7	"uns_A7_CAP","uns_A7N_CAP","uns_f100b_CAP"

1/2/3/4/5 		"CSJ_AH1g"

1/3/5/6/7		"uns_F4_CAP","uns_F4Navy_CAP","uns_mig17_CAP","uns_mig21_CAP"

2/4			"uns_F4_CAS","uns_mig17_CAS","uns_mig21_CAS"



extra 
EB_planes_west = ["uns_A7_CAP","uns_A7N_CAP","uns_f100b_CAP","uns_F4_CAP","uns_F4Navy_CAP","uns_F4_CAS","uns_mig17_CAP","uns_mig17_CAS","uns_mig21_CAP","uns_mig21_CAS","CSJ_C123","uns_A1J","CSJ_AH1g"];

//new unsung air ammo crate

//new racks and pods

			_vec addMagazine "uns_1rnd_rackx6";
			_vec addMagazine "uns_2rnd_rackx6";
			_vec addMagazine "uns_3rnd_rackx6";
			_vec addMagazine "uns_1rnd_rackx3";
			_vec addMagazine "uns_2rnd_rackx3";
			_vec addMagazine "uns_3rnd_rackx3";

			_vec addMagazine "uns_1rnd_rackx6_BIS";
			_vec addMagazine "uns_2rnd_rackx6_BIS";
			_vec addMagazine "uns_3rnd_rackx6_BIS";
			_vec addMagazine "uns_1rnd_rackx3_BIS";
			_vec addMagazine "uns_2rnd_rackx3_BIS";
			_vec addMagazine "uns_3rnd_rackx3_BIS";

 			_vec addMagazine "uns_ALQ110";
 			_vec addMagazine "uns_ALQ131";

 			_vec addMagazine "uns_S8podx2";
 			_vec addMagazine "uns_S8podx1";
 			_vec addMagazine "uns_S8pod_helix2";
 			_vec addMagazine "uns_S8pod_helix1";
 			_vec addMagazine "uns_S5_ub16_podx2";
 			_vec addMagazine "uns_S5_ub16_podx1";
 			_vec addMagazine "uns_S5_ub32_podx2";
 			_vec addMagazine "uns_S5_ub32_podx1";

 			_vec addMagazine "uns_M158_70mmpodx1";
 			_vec addMagazine "uns_M158_70mmpodx2";
 			_vec addMagazine "uns_M158_70mmpodx3";
 			_vec addMagazine "uns_M200_70mmpodx1";
 			_vec addMagazine "uns_M200_70mmpodx2";
 			_vec addMagazine "uns_M200_70mmpodx3";
			_vec addMagazine "uns_LAU10_125mmpodx1";
			_vec addMagazine "uns_LAU10_125mmpodx2";
			_vec addMagazine "uns_LAU10_125mmpodx3";

 			_vec addMagazine "uns_M158_70mmpodx1_BIS";
 			_vec addMagazine "uns_M158_70mmpodx2_BIS";
 			_vec addMagazine "uns_M158_70mmpodx3_BIS";
 			_vec addMagazine "uns_M200_70mmpodx1_BIS";
 			_vec addMagazine "uns_M200_70mmpodx2_BIS";
 			_vec addMagazine "uns_M200_70mmpodx3_BIS";
			_vec addMagazine "uns_LAU10_125mmpodx1_BIS";
			_vec addMagazine "uns_LAU10_125mmpodx2_BIS";
			_vec addMagazine "uns_LAU10_125mmpodx3_BIS";

//blanker

			_vec addMagazine "uns_1Rnd_pylonblank";
			_vec addMagazine "uns_2Rnd_pylonblank";
			_vec addMagazine "uns_3Rnd_pylonblank";
			_vec addMagazine "uns_4Rnd_pylonblank";
			_vec addMagazine "uns_5Rnd_pylonblank";
			_vec addMagazine "uns_6Rnd_pylonblank";
			_vec addMagazine "uns_7Rnd_pylonblank";
			_vec addMagazine "uns_8Rnd_pylonblank";
			_vec addMagazine "uns_9Rnd_pylonblank";
			_vec addMagazine "uns_10Rnd_pylonblank";
			_vec addMagazine "uns_11Rnd_pylonblank";
			_vec addMagazine "uns_12Rnd_pylonblank";
			_vec addweapon "uns_pylonblanker";

//cannon
			_vec addMagazine "Uns_600Rnd_Skyraider_4x20mm_HEI";
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm_HEI";
			_vec addMagazine "Uns_600Rnd_Skyraider_4x20mm";
			_vec addMagazine "Uns_1200Rnd_Skyraider_4x20mm";
			_vec addweapon "Uns_M2_4x20mm";
			_vec addweapon "Uns_Skyraider4x20mm";

//supersabre pontiac cannon
			_vec addMagazine "uns_275Rnd_M39_HEI";
			_vec addMagazine "uns_550Rnd_M39_HEI";
			_vec addMagazine "uns_275Rnd_M39";
			_vec addMagazine "uns_550Rnd_M39";
			_vec addweapon "uns_M39E";

//new VULCAN
			_vec addMagazine "uns_515Rnd_M61_HEI";
			_vec addMagazine "uns_1030Rnd_M61_HEI";
			_vec addMagazine "uns_1545Rnd_M61_HEI";
			_vec addMagazine "uns_2060Rnd_M61_HEI";
			_vec addMagazine "uns_515Rnd_M61";
			_vec addMagazine "uns_1030Rnd_M61";
			_vec addMagazine "uns_1545Rnd_M61";
			_vec addMagazine "uns_2060Rnd_M61";
			_vec addMagazine "2100Rnd_20mm_M168";
			_vec addweapon "uns_M61A1";

//A4
			_vec addMagazine "uns_200Rnd_20mm_mk12";
			_vec addweapon "uns_20mm_Cannon_mk12";

//stock modern
			_vec addMagazine "300Rnd_25mm_GAU12";
			_vec addweapon "GAU12";

			_vec addMagazine "1350Rnd_30mmAP_A10";
			_vec addweapon "GAU8";

			_vec addMagazine "uns_350Rnd_30mmAP_A10";
			_vec addMagazine "uns_650Rnd_30mmAP_A10";
			_vec addMagazine "uns_950Rnd_30mmAP_A10";
			_vec addMagazine "uns_1350Rnd_30mmAP_A10";
			_vec addweapon "uns_GAU8";

//heli weps
			_vec addMagazine "uns_m60_mounted_500rnd";
			_vec addMagazine "uns_200Rnd_762x51_M240_I";
			_vec addMagazine "uns_200Rnd_762x51_M240_AP";
			_vec addMagazine "uns_600Rnd_762x51_M240";
			_vec addweapon "uns_m60_mounted";
			_vec addweapon "uns_m60_mounted_2";

			_vec addMagazine "uns_1300Rnd_762x51_M60";
			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addweapon "uns_M60_dual";

			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "uns_M134";

			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addMagazine "4000Rnd_762x51_M134";
			_vec addweapon "Uns_TwinM134";

			_vec addMagazine "2000Rnd_762x51_M134";
			_vec addMagazine "uns_suu_3000Rnd_762x51_M134";
			_vec addweapon "uns_suu11a_gunpod";

			_vec addMagazine "750Rnd_M197_AH1";
			_vec addMagazine "uns_1900Rnd_M195_20mm";
			_vec addweapon "uns_cobra_M195";

			_vec addMagazine "uns_cobra_GL_300rnd";
			_vec addMagazine "48Rnd_40mm_MK19";
			_vec addweapon "uns_cobra_GL";

			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addMagazine "uns_12Rnd_Grenade_Camel";
			_vec addweapon "uns_H13Grenades";

//east planes
			_vec addMagazine "uns_200Rnd_23mm_GP9";
			_vec addMagazine "uns_400Rnd_23mm_GP9";
			_vec addMagazine "uns_600Rnd_23mm_GP9";
			_vec addMagazine "uns_800Rnd_23mm_GP9";
			_vec addMagazine "520Rnd_23mm_GSh23L";
			_vec addweapon "uns_GP9";

			_vec addMagazine "uns_140rnd_30mm_nr30";
			_vec addMagazine "uns_280rnd_30mm_nr30";
			_vec addMagazine "uns_420rnd_30mm_nr30";
			_vec addweapon "uns_NR30";

			_vec addMagazine "uns_80rnd_37mm_n37";
			_vec addMagazine "uns_160rnd_37mm_n37";
			_vec addMagazine "uns_40rnd_37mm_n37";
			_vec addweapon "uns_N37";

			_vec addMagazine "uns_240rnd_23mm_nr23";
			_vec addMagazine "uns_160Rnd_23mm_nr23";
			_vec addweapon "uns_nr23";

//rockets
			_vec addMagazine "uns_8Rnd_WP_FFAR";
			_vec addMagazine "uns_14Rnd_WP_FFAR";
			_vec addMagazine "uns_28Rnd_WP_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_purple";
			_vec addweapon "uns_WPLauncher";

			_vec addMagazine "uns_sm_wp_14Rnd_FFAR";
			_vec addMagazine "14Rnd_FFAR";
			_vec addMagazine "uns_14Rnd_WP_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_purple";
			_vec addweapon "uns_ah1g_FFARLauncher_14";

			_vec addMagazine "14Rnd_FFAR";
			_vec addMagazine "28Rnd_FFAR";
			_vec addMagazine "38Rnd_FFAR";
			_vec addMagazine "uns_19Rnd_FFAR";
			_vec addMagazine "uns_28Rnd_FFAR";
			_vec addMagazine "uns_36Rnd_FFAR";
			_vec addMagazine "uns_38Rnd_FFAR";
			_vec addMagazine "uns_56Rnd_FFAR";
			_vec addMagazine "uns_57Rnd_FFAR";
			_vec addMagazine "uns_76Rnd_FFAR";
			_vec addMagazine "uns_84Rnd_FFAR";
			_vec addMagazine "uns_114Rnd_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "uns_smoke_14Rnd_FFAR_purple";
			_vec addweapon "Uns_FFARLauncher";

			_vec addMagazine "uns_28Rnd_FFARL";
			_vec addMagazine "uns_38Rnd_FFARL";
			_vec addMagazine "uns_56Rnd_FFARL";
			_vec addMagazine "uns_76Rnd_FFARL";
			_vec addMagazine "uns_84Rnd_FFARL";
			_vec addMagazine "uns_114Rnd_FFARL";
			_vec addweapon "Uns_FFARL_Launcher";

			_vec addMagazine "38Rnd_FFAR";
			_vec addweapon "FFARLauncher";

			_vec addMagazine "uns_4Rnd_zuniHE";
			_vec addMagazine "uns_8Rnd_zuniHE";
			_vec addMagazine "uns_12Rnd_zuniHE";
			_vec addMagazine "uns_16Rnd_zuniHE";
			_vec addMagazine "uns_4Rnd_zuniAT";
			_vec addMagazine "uns_8Rnd_zuniAT";
			_vec addMagazine "uns_12Rnd_zuniAT";
			_vec addMagazine "uns_16Rnd_zuniAT";
			_vec addMagazine "uns_4Rnd_zuniFRAG";
			_vec addMagazine "uns_8Rnd_zuniFRAG";
			_vec addMagazine "uns_12Rnd_zuniFRAG";
			_vec addMagazine "uns_16Rnd_zuniFRAG";
			_vec addMagazine "uns_4Rnd_zuniWP";
			_vec addMagazine "uns_8Rnd_zuniWP";
			_vec addMagazine "uns_12Rnd_zuniWP";
			_vec addMagazine "uns_16Rnd_zuniWP";
			_vec addMagazine "uns_4Rnd_zuniSMOKE";
			_vec addMagazine "uns_8Rnd_zuniSMOKE";
			_vec addMagazine "uns_12Rnd_zuniSMOKE";
			_vec addMagazine "uns_16Rnd_zuniSMOKE";
			_vec addweapon "Uns_ZuniLauncher";

			_vec addMagazine "uns_16Rnd_57mm";
			_vec addMagazine "uns_32Rnd_57mm";
			_vec addMagazine "64Rnd_57mm";
			_vec addMagazine "128Rnd_57mm";
			_vec addMagazine "192Rnd_57mm";
			_vec addweapon "uns_57mmLauncher";

//AAM
//Uns_AIM9D
			_vec addMagazine "uns_AIM9Dx1";
			_vec addMagazine "uns_AIM9Dx2";
			_vec addMagazine "uns_AIM9Dx3";
			_vec addMagazine "uns_AIM9Dx4";
			_vec addMagazine "uns_AIM9Dx5";
			_vec addMagazine "uns_AIM9Dx6";
			_vec addMagazine "uns_AIM9Dx7";
			_vec addMagazine "uns_AIM9Dx8";
			_vec addMagazine "uns_AIM9Dx9";
			_vec addMagazine "uns_AIM9Dx10";
			_vec addMagazine "uns_AIM9Dx11";
			_vec addMagazine "uns_AIM9Dx12";
			_vec addweapon "uns_AIM9DLauncher";

//Uns_AIM9E
			_vec addMagazine "uns_AIM9Ex1";
			_vec addMagazine "uns_AIM9Ex2";
			_vec addMagazine "uns_AIM9Ex3";
			_vec addMagazine "uns_AIM9Ex4";
			_vec addMagazine "uns_AIM9Ex5";
			_vec addMagazine "uns_AIM9Ex6";
			_vec addMagazine "uns_AIM9Ex7";
			_vec addMagazine "uns_AIM9Ex8";
			_vec addMagazine "uns_AIM9Ex9";
			_vec addMagazine "uns_AIM9Ex10";
			_vec addMagazine "uns_AIM9Ex11";
			_vec addMagazine "uns_AIM9Ex12";
			_vec addweapon "uns_AIM9ELauncher";

//2			_vec addMagazine "A7Uns_AIM9_mag";
			_vec addweapon "A7uns_AIM9Launcher";

//4
			_vec addMagazine "Uns_AIM9_mag";
			_vec addweapon "uns_AIM9Launcher";

//Uns_AIM7
			_vec addMagazine "uns_AIM7Ex1";
			_vec addMagazine "uns_AIM7Ex2";
			_vec addMagazine "uns_AIM7Ex3";
			_vec addMagazine "uns_AIM7Ex4";
			_vec addMagazine "uns_AIM7Ex5";
			_vec addMagazine "uns_AIM7Ex6";
			_vec addMagazine "uns_AIM7Ex7";
			_vec addMagazine "uns_AIM7Ex8";
			_vec addMagazine "uns_AIM7Ex9";
			_vec addMagazine "uns_AIM7Ex10";
			_vec addMagazine "uns_AIM7Ex11";
			_vec addMagazine "uns_AIM7Ex12";
			_vec addweapon "uns_AIM7ELauncher";

//4
			_vec addMagazine "Uns_AIM7_mag";
			_vec addweapon "uns_AIM7Launcher";

			_vec addMagazine "uns_R60x1";
			_vec addMagazine "uns_R60x2";
			_vec addMagazine "uns_R60x3";
			_vec addMagazine "uns_R60x4";
			_vec addMagazine "uns_R60x5";
			_vec addMagazine "uns_R60x6";
			_vec addMagazine "uns_R60x7";
			_vec addMagazine "uns_R60x8";
			_vec addMagazine "uns_R60x9";
			_vec addMagazine "uns_R60x10";
			_vec addMagazine "uns_R60x11";
			_vec addMagazine "uns_R60x12";
			_vec addweapon "uns_R60_Launcher";

//6
			_vec addMagazine "R60_mag";
			_vec addweapon "R60Launcher";

			_vec addMagazine "uns_K13x1";
			_vec addMagazine "uns_K13x2";
			_vec addMagazine "uns_K13x3";
			_vec addMagazine "uns_K13x4";
			_vec addMagazine "uns_K13x5";
			_vec addMagazine "uns_K13x6";
			_vec addMagazine "uns_K13x7";
			_vec addMagazine "uns_K13x8";
			_vec addMagazine "uns_K13x9";
			_vec addMagazine "uns_K13x10";
			_vec addMagazine "uns_K13x11";
			_vec addMagazine "uns_K13x12";
//2
			_vec addMagazine "uns_K13_mag";
			_vec addweapon "uns_K13Launcher";
//AGM
//uns_M_MaverickB_AT
			_vec addMagazine "uns_AGM65Bx1";
			_vec addMagazine "uns_AGM65Bx2";
			_vec addMagazine "uns_AGM65Bx3";
			_vec addMagazine "uns_AGM65Bx4";
			_vec addMagazine "uns_AGM65Bx5";
			_vec addMagazine "uns_AGM65Bx6";
			_vec addMagazine "uns_AGM65Bx7";
			_vec addMagazine "uns_AGM65Bx8";
			_vec addMagazine "uns_AGM65Bx9";
			_vec addMagazine "uns_AGM65Bx10";
			_vec addMagazine "uns_AGM65Bx11";
			_vec addMagazine "uns_AGM65Bx12";
			_vec addweapon "uns_AGM65B_Launcher";

//M_Shrike_AT_bis
			_vec addMagazine "uns_AGM45_bisx1";
			_vec addMagazine "uns_AGM45_bisx2";
			_vec addMagazine "uns_AGM45_bisx3";
			_vec addMagazine "uns_AGM45_bisx4";
			_vec addMagazine "uns_AGM45_bisx5";
			_vec addMagazine "uns_AGM45_bisx6";
			_vec addMagazine "uns_AGM45_bisx7";
			_vec addMagazine "uns_AGM45_bisx8";
			_vec addMagazine "uns_AGM45_bisx9";
			_vec addMagazine "uns_AGM45_bisx10";
			_vec addMagazine "uns_AGM45_bisx11";
			_vec addMagazine "uns_AGM45_bisx12";
//M_Shrike_AT
			_vec addMagazine "uns_AGM45x1";
			_vec addMagazine "uns_AGM45x2";
			_vec addMagazine "uns_AGM45x3";
			_vec addMagazine "uns_AGM45x4";
			_vec addMagazine "uns_AGM45x5";
			_vec addMagazine "uns_AGM45x6";
			_vec addMagazine "uns_AGM45x7";
			_vec addMagazine "uns_AGM45x8";
			_vec addMagazine "uns_AGM45x9";
			_vec addMagazine "uns_AGM45x10";
			_vec addMagazine "uns_AGM45x11";
			_vec addMagazine "uns_AGM45x12";
			_vec addweapon "uns_AGM45_Launcher";

//M_Bullpup_AT_bis
			_vec addMagazine "uns_AGM12x1_bis";
			_vec addMagazine "uns_AGM12x2_bis";
			_vec addMagazine "uns_AGM12x3_bis";
			_vec addMagazine "uns_AGM12x4_bis";
			_vec addMagazine "uns_AGM12x5_bis";
			_vec addMagazine "uns_AGM12x6_bis";
			_vec addMagazine "uns_AGM12x7_bis";
			_vec addMagazine "uns_AGM12x8_bis";
			_vec addMagazine "uns_AGM12x9_bis";
			_vec addMagazine "uns_AGM12x10_bis";
			_vec addMagazine "uns_AGM12x11_bis";
			_vec addMagazine "uns_AGM12x12_bis";
//M_Bullpup_AT
			_vec addMagazine "uns_AGM12x1";
			_vec addMagazine "uns_AGM12x2";
			_vec addMagazine "uns_AGM12x3";
			_vec addMagazine "uns_AGM12x4";
			_vec addMagazine "uns_AGM12x5";
			_vec addMagazine "uns_AGM12x6";
			_vec addMagazine "uns_AGM12x7";
			_vec addMagazine "uns_AGM12x8";
			_vec addMagazine "uns_AGM12x9";
			_vec addMagazine "uns_AGM12x10";
			_vec addMagazine "uns_AGM12x11";
			_vec addMagazine "uns_AGM12x12";
			_vec addweapon "uns_AGM12_Launcher";

//BMB

			_vec addMagazine "F4uns_4Rnd_MK82Snake";
			_vec addMagazine "F4uns_6Rnd_MK82Snake";
			_vec addweapon "uns_MK82SnakeLauncher";

			_vec addMagazine "A7uns_6Rnd_MK82Snake";
			_vec addweapon "A7uns_MK82SnakeLauncher";

			_vec addMagazine "A7uns_6Rnd_MK82";
			_vec addweapon "A7uns_MK82BombLauncher";

//Uns_Mk81Bomb_bis
			_vec addMagazine "Uns_1Rnd_Mk81_bis";
			_vec addMagazine "Uns_2Rnd_Mk81_bis";
			_vec addMagazine "Uns_3Rnd_Mk81_bis";
			_vec addMagazine "Uns_4Rnd_Mk81_bis";
			_vec addMagazine "Uns_5Rnd_Mk81_bis";
			_vec addMagazine "Uns_6Rnd_Mk81_bis";
			_vec addMagazine "Uns_7Rnd_Mk81_bis";
			_vec addMagazine "Uns_8Rnd_Mk81_bis";
			_vec addMagazine "Uns_9Rnd_Mk81_bis";
			_vec addMagazine "Uns_10Rnd_Mk81_bis";
			_vec addMagazine "Uns_11Rnd_Mk81_bis";
			_vec addMagazine "Uns_12Rnd_Mk81_bis";
//Uns_Mk81Bomb
			_vec addMagazine "Uns_1Rnd_Mk81";
			_vec addMagazine "Uns_2Rnd_Mk81";
			_vec addMagazine "Uns_3Rnd_Mk81";
			_vec addMagazine "Uns_4Rnd_Mk81";
			_vec addMagazine "Uns_5Rnd_Mk81";
			_vec addMagazine "Uns_6Rnd_Mk81";
			_vec addMagazine "Uns_7Rnd_Mk81";
			_vec addMagazine "Uns_8Rnd_Mk81";
			_vec addMagazine "Uns_9Rnd_Mk81";
			_vec addMagazine "Uns_10Rnd_Mk81";
			_vec addMagazine "Uns_11Rnd_Mk81";
			_vec addMagazine "Uns_12Rnd_Mk81";
			_vec addweapon "Uns_BombLauncher";
			_vec addweapon "Uns_Mk81Launcher"; 

//uns_MK82_bis
			_vec addMagazine "Uns_1Rnd_Mk82_bis";
			_vec addMagazine "Uns_2Rnd_Mk82_bis";
			_vec addMagazine "Uns_3Rnd_Mk82_bis";
			_vec addMagazine "Uns_4Rnd_Mk82_bis";
			_vec addMagazine "Uns_5Rnd_Mk82_bis";
			_vec addMagazine "Uns_6Rnd_Mk82_bis";
			_vec addMagazine "Uns_7Rnd_Mk82_bis";
			_vec addMagazine "Uns_8Rnd_Mk82_bis";
			_vec addMagazine "Uns_9Rnd_Mk82_bis";
			_vec addMagazine "Uns_10Rnd_Mk82_bis";
			_vec addMagazine "Uns_11Rnd_Mk82_bis";
			_vec addMagazine "Uns_12Rnd_Mk82_bis";
//uns_MK82
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_2Rnd_Mk82";
			_vec addMagazine "Uns_3Rnd_Mk82";
			_vec addMagazine "Uns_4Rnd_Mk82";
			_vec addMagazine "Uns_5Rnd_Mk82";
			_vec addMagazine "Uns_6Rnd_Mk82";
			_vec addMagazine "Uns_7Rnd_Mk82";
			_vec addMagazine "Uns_8Rnd_Mk82";
			_vec addMagazine "Uns_9Rnd_Mk82";
			_vec addMagazine "Uns_10Rnd_Mk82";
			_vec addMagazine "Uns_11Rnd_Mk82";
			_vec addMagazine "Uns_12Rnd_Mk82";
//Uns_Mk82Bomb
			_vec addMagazine "Uns_1Rnd_Mk82";
			_vec addMagazine "Uns_2Rnd_Mk82";
			_vec addMagazine "Uns_3Rnd_Mk82";
			_vec addMagazine "Uns_4Rnd_Mk82";
			_vec addMagazine "Uns_5Rnd_Mk82";
			_vec addMagazine "Uns_6Rnd_Mk82";
			_vec addMagazine "Uns_7Rnd_Mk82";
			_vec addMagazine "Uns_8Rnd_Mk82";
			_vec addMagazine "Uns_9Rnd_Mk82";
			_vec addMagazine "Uns_10Rnd_Mk82";
			_vec addMagazine "Uns_11Rnd_Mk82";
			_vec addMagazine "Uns_12Rnd_Mk82";
			_vec addweapon "uns_MK82Launcher";

//uns_Mk82Snake
			_vec addMagazine "Uns_1Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_2Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_3Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_4Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_5Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_6Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_7Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_8Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_9Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_10Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_11Rnd_Mk82_snake_bis";
			_vec addMagazine "Uns_12Rnd_Mk82_snake_bis";
//uns_Mk82Snake
			_vec addMagazine "Uns_1Rnd_Mk82_snake";
			_vec addMagazine "Uns_2Rnd_Mk82_snake";
			_vec addMagazine "Uns_3Rnd_Mk82_snake";
			_vec addMagazine "Uns_4Rnd_Mk82_snake";
			_vec addMagazine "Uns_5Rnd_Mk82_snake";
			_vec addMagazine "Uns_6Rnd_Mk82_snake";
			_vec addMagazine "Uns_7Rnd_Mk82_snake";
			_vec addMagazine "Uns_8Rnd_Mk82_snake";
			_vec addMagazine "Uns_9Rnd_Mk82_snake";
			_vec addMagazine "Uns_10Rnd_Mk82_snake";
			_vec addMagazine "Uns_11Rnd_Mk82_snake";
			_vec addMagazine "Uns_12Rnd_Mk82_snake";
			_vec addweapon "uns_MK82SnakeLauncher";

//Uns_Mk83Bomb_bis
			_vec addMagazine "Uns_1Rnd_Mk83_bis";
			_vec addMagazine "Uns_2Rnd_Mk83_bis";
			_vec addMagazine "Uns_3Rnd_Mk83_bis";
			_vec addMagazine "Uns_4Rnd_Mk83_bis";
			_vec addMagazine "Uns_5Rnd_Mk83_bis";
			_vec addMagazine "Uns_6Rnd_Mk83_bis";
			_vec addMagazine "Uns_7Rnd_Mk83_bis";
			_vec addMagazine "Uns_8Rnd_Mk83_bis";
			_vec addMagazine "Uns_9Rnd_Mk83_bis";
			_vec addMagazine "Uns_10Rnd_Mk83_bis";
			_vec addMagazine "Uns_11Rnd_Mk83_bis";
			_vec addMagazine "Uns_12Rnd_Mk83_bis";
//Uns_Mk83Bomb
			_vec addMagazine "Uns_1Rnd_Mk83";
			_vec addMagazine "Uns_2Rnd_Mk83";
			_vec addMagazine "Uns_3Rnd_Mk83";
			_vec addMagazine "Uns_4Rnd_Mk83";
			_vec addMagazine "Uns_5Rnd_Mk83";
			_vec addMagazine "Uns_6Rnd_Mk83";
			_vec addMagazine "Uns_7Rnd_Mk83";
			_vec addMagazine "Uns_8Rnd_Mk83";
			_vec addMagazine "Uns_9Rnd_Mk83";
			_vec addMagazine "Uns_10Rnd_Mk83";
			_vec addMagazine "Uns_11Rnd_Mk83";
			_vec addMagazine "Uns_12Rnd_Mk83";
			_vec addweapon "Uns_Mk83Launcher";

//Uns_Mk84Bomb_bis
			_vec addMagazine "Uns_1Rnd_Mk84_bis";
			_vec addMagazine "Uns_2Rnd_Mk84_bis";
			_vec addMagazine "Uns_3Rnd_Mk84_bis";
			_vec addMagazine "Uns_4Rnd_Mk84_bis";
			_vec addMagazine "Uns_5Rnd_Mk84_bis";
			_vec addMagazine "Uns_6Rnd_Mk84_bis";
			_vec addMagazine "Uns_7Rnd_Mk84_bis";
			_vec addMagazine "Uns_8Rnd_Mk84_bis";
			_vec addMagazine "Uns_9Rnd_Mk84_bis";
			_vec addMagazine "Uns_10Rnd_Mk84_bis";
			_vec addMagazine "Uns_11Rnd_Mk84_bis";
			_vec addMagazine "Uns_12Rnd_Mk84_bis";
//Uns_Mk84Bomb
			_vec addMagazine "Uns_1Rnd_Mk84";
			_vec addMagazine "Uns_2Rnd_Mk84";
			_vec addMagazine "Uns_3Rnd_Mk84";
			_vec addMagazine "Uns_4Rnd_Mk84";
			_vec addMagazine "Uns_5Rnd_Mk84";
			_vec addMagazine "Uns_6Rnd_Mk84";
			_vec addMagazine "Uns_7Rnd_Mk84";
			_vec addMagazine "Uns_8Rnd_Mk84";
			_vec addMagazine "Uns_9Rnd_Mk84";
			_vec addMagazine "Uns_10Rnd_Mk84";
			_vec addMagazine "Uns_11Rnd_Mk84";
			_vec addMagazine "Uns_12Rnd_Mk84";
			_vec addweapon "Uns_Mk84Launcher";

			_vec addMagazine "Uns_1Rnd_fab250";
			_vec addMagazine "Uns_2Rnd_fab250";
			_vec addMagazine "Uns_3Rnd_fab250";
			_vec addMagazine "Uns_4Rnd_fab250";
			_vec addMagazine "Uns_5Rnd_fab250";
			_vec addMagazine "Uns_6Rnd_fab250";
			_vec addMagazine "Uns_7Rnd_fab250";
			_vec addMagazine "Uns_8Rnd_fab250";
			_vec addMagazine "Uns_9Rnd_fab250";
			_vec addMagazine "Uns_10Rnd_fab250";
			_vec addMagazine "Uns_11Rnd_fab250";
			_vec addMagazine "Uns_12Rnd_fab250";
			_vec addweapon "Uns_BombLauncher_fab";
			_vec addweapon "Uns_BombLauncher_fab250";  

			_vec addMagazine "Uns_1Rnd_fab500";
			_vec addMagazine "Uns_2Rnd_fab500";
			_vec addMagazine "Uns_3Rnd_fab500";
			_vec addMagazine "Uns_4Rnd_fab500";
			_vec addMagazine "Uns_5Rnd_fab500";
			_vec addMagazine "Uns_6Rnd_fab500";
			_vec addMagazine "Uns_7Rnd_fab500";
			_vec addMagazine "Uns_8Rnd_fab500";
			_vec addMagazine "Uns_9Rnd_fab500";
			_vec addMagazine "Uns_10Rnd_fab500";
			_vec addMagazine "Uns_11Rnd_fab500";
			_vec addMagazine "Uns_12Rnd_fab500";
			_vec addweapon "Uns_BombLauncher_fab500";  

//Uns_Napalm_500_bis
			_vec addMagazine "Uns_1Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_2Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_3Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_4Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_5Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_6Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_7Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_8Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_9Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_10Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_11Rnd_Napalm_500_bis";
			_vec addMagazine "Uns_12Rnd_Napalm_500_bis";
//Uns_Napalm_500
			_vec addMagazine "Uns_1Rnd_Napalm_500";
			_vec addMagazine "Uns_2Rnd_Napalm_500";
			_vec addMagazine "Uns_3Rnd_Napalm_500";
			_vec addMagazine "Uns_4Rnd_Napalm_500";
			_vec addMagazine "Uns_5Rnd_Napalm_500";
			_vec addMagazine "Uns_6Rnd_Napalm_500";
			_vec addMagazine "Uns_7Rnd_Napalm_500";
			_vec addMagazine "Uns_8Rnd_Napalm_500";
			_vec addMagazine "Uns_9Rnd_Napalm_500";
			_vec addMagazine "Uns_10Rnd_Napalm_500";
			_vec addMagazine "Uns_11Rnd_Napalm_500";
			_vec addMagazine "Uns_12Rnd_Napalm_500";
			_vec addweapon "Uns_NapalmLauncher_500";

//Uns_Napalm_750
			_vec addMagazine "Uns_1Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_2Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_3Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_4Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_5Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_6Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_7Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_8Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_9Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_10Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_11Rnd_Napalm_750_bis";
			_vec addMagazine "Uns_12Rnd_Napalm_750_bis";
//Uns_Napalm_750
			_vec addMagazine "Uns_1Rnd_Napalm_750";
			_vec addMagazine "Uns_2Rnd_Napalm_750";
			_vec addMagazine "Uns_3Rnd_Napalm_750";
			_vec addMagazine "Uns_4Rnd_Napalm_750";
			_vec addMagazine "Uns_5Rnd_Napalm_750";
			_vec addMagazine "Uns_6Rnd_Napalm_750";
			_vec addMagazine "Uns_7Rnd_Napalm_750";
			_vec addMagazine "Uns_8Rnd_Napalm_750";
			_vec addMagazine "Uns_9Rnd_Napalm_750";
			_vec addMagazine "Uns_10Rnd_Napalm_750";
			_vec addMagazine "Uns_11Rnd_Napalm_750";
			_vec addMagazine "Uns_12Rnd_Napalm_750";
			_vec addweapon "Uns_NapalmLauncher_750";

//uns_Napalm_blu1
//1000lb
			_vec addMagazine "Uns_1Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_2Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_3Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_4Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_5Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_6Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_7Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_8Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_9Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_10Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_11Rnd_Napalm_Blu1";
			_vec addMagazine "Uns_12Rnd_Napalm_Blu1";
			_vec addweapon "Uns_Napalm_blu1_Launcher";

//CBU24 Combined effects munition (CEM)
//uns_BLU26B_AP -Anti-personnel mine
//uns_BLU26B_AT - Anti-tank mine
//uns_BLU26B_AV - Anti-vehicle mine
//uns_BLU26B_IN - Incendiary mine
//uns_BLU26B_TM - Timed-delay bomblet
//uns_BLU26B_TX - AP/AV Gas mine

//Uns_CBU24Bomb_bis
			_vec addMagazine "Uns_1Rnd_CBU24_bis";
			_vec addMagazine "Uns_2Rnd_CBU24_bis";
			_vec addMagazine "Uns_3Rnd_CBU24_bis";
			_vec addMagazine "Uns_4Rnd_CBU24_bis";
			_vec addMagazine "Uns_5Rnd_CBU24_bis";
			_vec addMagazine "Uns_6Rnd_CBU24_bis";
			_vec addMagazine "Uns_7Rnd_CBU24_bis";
			_vec addMagazine "Uns_8Rnd_CBU24_bis";
			_vec addMagazine "Uns_9Rnd_CBU24_bis";
			_vec addMagazine "Uns_10Rnd_CBU24_bis";
			_vec addMagazine "Uns_11Rnd_CBU24_bis";
			_vec addMagazine "Uns_12Rnd_CBU24_bis";
//Uns_CBU24Bomb
			_vec addMagazine "Uns_1Rnd_CBU24";
			_vec addMagazine "Uns_2Rnd_CBU24";
			_vec addMagazine "Uns_3Rnd_CBU24";
			_vec addMagazine "Uns_4Rnd_CBU24";
			_vec addMagazine "Uns_5Rnd_CBU24";
			_vec addMagazine "Uns_6Rnd_CBU24";
			_vec addMagazine "Uns_7Rnd_CBU24";
			_vec addMagazine "Uns_8Rnd_CBU24";
			_vec addMagazine "Uns_9Rnd_CBU24";
			_vec addMagazine "Uns_10Rnd_CBU24";
			_vec addMagazine "Uns_11Rnd_CBU24";
			_vec addMagazine "Uns_12Rnd_CBU24";
			_vec addweapon "Uns_CBU24Launcher";


//CBU75 Sadeye clusterbomb

//Uns_CBU75Bomb_bis
			_vec addMagazine "Uns_1Rnd_CBU75_bis";
			_vec addMagazine "Uns_2Rnd_CBU75_bis";
			_vec addMagazine "Uns_3Rnd_CBU75_bis";
			_vec addMagazine "Uns_4Rnd_CBU75_bis";
			_vec addMagazine "Uns_5Rnd_CBU75_bis";
			_vec addMagazine "Uns_6Rnd_CBU75_bis";
			_vec addMagazine "Uns_7Rnd_CBU75_bis";
			_vec addMagazine "Uns_8Rnd_CBU75_bis";
			_vec addMagazine "Uns_9Rnd_CBU75_bis";
			_vec addMagazine "Uns_10Rnd_CBU75_bis";
			_vec addMagazine "Uns_11Rnd_CBU75_bis";
			_vec addMagazine "Uns_12Rnd_CBU75_bis";
//Uns_CBU75Bomb
			_vec addMagazine "Uns_1Rnd_CBU75";
			_vec addMagazine "Uns_2Rnd_CBU75";
			_vec addMagazine "Uns_3Rnd_CBU75";
			_vec addMagazine "Uns_4Rnd_CBU75";
			_vec addMagazine "Uns_5Rnd_CBU75";
			_vec addMagazine "Uns_6Rnd_CBU75";
			_vec addMagazine "Uns_7Rnd_CBU75";
			_vec addMagazine "Uns_8Rnd_CBU75";
			_vec addMagazine "Uns_9Rnd_CBU75";
			_vec addMagazine "Uns_10Rnd_CBU75";
			_vec addMagazine "Uns_11Rnd_CBU75";
			_vec addMagazine "Uns_12Rnd_CBU75";
			_vec addweapon "Uns_CBU75Launcher";


//cbu32a AP clustermines
//uns_BLU26B_AP

//Uns_CBU32ABomb
			_vec addMagazine "Uns_1Rnd_CBU32A_bis";
			_vec addMagazine "Uns_2Rnd_CBU32A_bis";
			_vec addMagazine "Uns_3Rnd_CBU32A_bis";
			_vec addMagazine "Uns_4Rnd_CBU32A_bis";
			_vec addMagazine "Uns_5Rnd_CBU32A_bis";
			_vec addMagazine "Uns_6Rnd_CBU32A_bis";
			_vec addMagazine "Uns_7Rnd_CBU32A_bis";
			_vec addMagazine "Uns_8Rnd_CBU32A_bis";
			_vec addMagazine "Uns_9Rnd_CBU32A_bis";
			_vec addMagazine "Uns_10Rnd_CBU32A_bis";
			_vec addMagazine "Uns_11Rnd_CBU32A_bis";
			_vec addMagazine "Uns_12Rnd_CBU32A_bis";
//Uns_CBU32ABomb
			_vec addMagazine "Uns_1Rnd_CBU32A";
			_vec addMagazine "Uns_2Rnd_CBU32A";
			_vec addMagazine "Uns_3Rnd_CBU32A";
			_vec addMagazine "Uns_4Rnd_CBU32A";
			_vec addMagazine "Uns_5Rnd_CBU32A";
			_vec addMagazine "Uns_6Rnd_CBU32A";
			_vec addMagazine "Uns_7Rnd_CBU32A";
			_vec addMagazine "Uns_8Rnd_CBU32A";
			_vec addMagazine "Uns_9Rnd_CBU32A";
			_vec addMagazine "Uns_10Rnd_CBU32A";
			_vec addMagazine "Uns_11Rnd_CBU32A";
			_vec addMagazine "Uns_12Rnd_CBU32A";
			_vec addweapon "Uns_CBU32ALauncher";

//cbu32b AT clustermines
//uns_BLU26B_AT

//Uns_CBU32BBomb_bis
			_vec addMagazine "Uns_1Rnd_CBU32B_bis";
			_vec addMagazine "Uns_2Rnd_CBU32B_bis";
			_vec addMagazine "Uns_3Rnd_CBU32B_bis";
			_vec addMagazine "Uns_4Rnd_CBU32B_bis";
			_vec addMagazine "Uns_5Rnd_CBU32B_bis";
			_vec addMagazine "Uns_6Rnd_CBU32B_bis";
			_vec addMagazine "Uns_7Rnd_CBU32B_bis";
			_vec addMagazine "Uns_8Rnd_CBU32B_bis";
			_vec addMagazine "Uns_9Rnd_CBU32B_bis";
			_vec addMagazine "Uns_10Rnd_CBU32B_bis";
			_vec addMagazine "Uns_11Rnd_CBU32B_bis";
			_vec addMagazine "Uns_12Rnd_CBU32B_bis";
//Uns_CBU32BBomb
			_vec addMagazine "Uns_1Rnd_CBU32B";
			_vec addMagazine "Uns_2Rnd_CBU32B";
			_vec addMagazine "Uns_3Rnd_CBU32B";
			_vec addMagazine "Uns_4Rnd_CBU32B";
			_vec addMagazine "Uns_5Rnd_CBU32B";
			_vec addMagazine "Uns_6Rnd_CBU32B";
			_vec addMagazine "Uns_7Rnd_CBU32B";
			_vec addMagazine "Uns_8Rnd_CBU32B";
			_vec addMagazine "Uns_9Rnd_CBU32B";
			_vec addMagazine "Uns_10Rnd_CBU32B";
			_vec addMagazine "Uns_11Rnd_CBU32B";
			_vec addMagazine "Uns_12Rnd_CBU32B";
			_vec addweapon "Uns_CBU32BLauncher";

//LGB

//Uns_GBU8Bomb_bis
			_vec addMagazine "Uns_1Rnd_GBU8_bis";
			_vec addMagazine "Uns_2Rnd_GBU8_bis";
			_vec addMagazine "Uns_3Rnd_GBU8_bis";
			_vec addMagazine "Uns_4Rnd_GBU8_bis";
			_vec addMagazine "Uns_5Rnd_GBU8_bis";
			_vec addMagazine "Uns_6Rnd_GBU8_bis";
			_vec addMagazine "Uns_7Rnd_GBU8_bis";
			_vec addMagazine "Uns_8Rnd_GBU8_bis";
			_vec addMagazine "Uns_9Rnd_GBU8_bis";
			_vec addMagazine "Uns_10Rnd_GBU8_bis";
			_vec addMagazine "Uns_11Rnd_GBU8_bis";
			_vec addMagazine "Uns_12Rnd_GBU8_bis";
//Uns_GBU8Bomb
			_vec addMagazine "Uns_1Rnd_GBU8";
			_vec addMagazine "Uns_2Rnd_GBU8";
			_vec addMagazine "Uns_3Rnd_GBU8";
			_vec addMagazine "Uns_4Rnd_GBU8";
			_vec addMagazine "Uns_5Rnd_GBU8";
			_vec addMagazine "Uns_6Rnd_GBU8";
			_vec addMagazine "Uns_7Rnd_GBU8";
			_vec addMagazine "Uns_8Rnd_GBU8";
			_vec addMagazine "Uns_9Rnd_GBU8";
			_vec addMagazine "Uns_10Rnd_GBU8";
			_vec addMagazine "Uns_11Rnd_GBU8";
			_vec addMagazine "Uns_12Rnd_GBU8";
			_vec addweapon "Uns_GBU8Launcher";

//uns_KAB250
			_vec addMagazine "Uns_1Rnd_kab250";
			_vec addMagazine "Uns_2Rnd_kab250";
			_vec addMagazine "Uns_3Rnd_kab250";
			_vec addMagazine "Uns_4Rnd_kab250";
			_vec addMagazine "Uns_5Rnd_kab250";
			_vec addMagazine "Uns_6Rnd_kab250";
			_vec addMagazine "Uns_7Rnd_kab250";
			_vec addMagazine "Uns_8Rnd_kab250";
			_vec addMagazine "Uns_9Rnd_kab250";
			_vec addMagazine "Uns_10Rnd_kab250";
			_vec addMagazine "Uns_11Rnd_kab250";
			_vec addMagazine "Uns_12Rnd_kab250";
			_vec addweapon "Uns_BombLauncher_kab250";  //uns_KAB500

			_vec addMagazine "Uns_1Rnd_kab500";
			_vec addMagazine "Uns_2Rnd_kab500";
			_vec addMagazine "Uns_3Rnd_kab500";
			_vec addMagazine "Uns_4Rnd_kab500";
			_vec addMagazine "Uns_5Rnd_kab500";
			_vec addMagazine "Uns_6Rnd_kab500";
			_vec addMagazine "Uns_7Rnd_kab500";
			_vec addMagazine "Uns_8Rnd_kab500";
			_vec addMagazine "Uns_9Rnd_kab500";
			_vec addMagazine "Uns_10Rnd_kab500";
			_vec addMagazine "Uns_11Rnd_kab500";
			_vec addMagazine "Uns_12Rnd_kab500";
			_vec addweapon "Uns_BombLauncher_kab500";  

//fuel
			_vec addMagazine "A7uns_1Rnd_Fuel";
			_vec addMagazine "A7uns_2Rnd_Fuel";
			_vec addMagazine "A7uns_1Rnd_FuelNavy";
			_vec addMagazine "A7uns_2Rnd_FuelNavy";
			_vec addweapon "A7unsFuelauncher";

			_vec addMagazine "F4uns_1Rnd_Fuel";
			_vec addMagazine "F4uns_1Rnd_FuelNavy";
			_vec addweapon "uns_F4Fuelauncher";

			_vec addMagazine "uns_mig17_Fueltank";
			_vec addweapon "uns_mig17_Fuelauncher";

			_vec addMagazine "Mig21_1Rnd_Fuel";
			_vec addweapon "Mig21Fuelauncher";

//beware!
			_vec addMagazine "uns_1Rnd_F100_Fuel";
			_vec addweapon "uns_F105_FuelTank";
			_vec addMagazine "uns_2Rnd_F100_Fuel";
			_vec addweapon "uns_F100_FuelTanks";

			_vec addMagazine "A6uns_1Rnd_Fuel";
			_vec addMagazine "A6uns_2Rnd_Fuel";
			_vec addweapon "A6unsFuelauncher";

			_vec addMagazine "uns_F105_2Rnd_Fuel";
			_vec addweapon "uns_F105_FuelTanks";

			_vec addMagazine "uns_F105_1Rnd_Fuel";
			_vec addweapon "uns_F105_FuelTank";
//racks F105
			_vec addMagazine "uns_1rnd_F105_rackx6";
			_vec addMagazine "uns_2rnd_F105_rackx6";
			_vec addMagazine "uns_3rnd_F105_rackx6";

*/

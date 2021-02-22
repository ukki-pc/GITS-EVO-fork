
_vec = _this select 0;
_type = typeof _vec;

_weapons = weapons _vec;
{_vec removeweapon _x}forEach _weapons;
_magazines = magazines _vec;
//{if !(_x == "120Rnd_CMFlare_Chaff_Magazine") then {_vec removemagazine _x}}forEach _magazines;
{_vec removemagazine _x}forEach _magazines;

 switch (_type) do
  {
	case 'A7'://CAP
	{
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank";      
			_vec addMagazine "EB_AIM9Mx4";      
			_vec addMagazine "EB_2Rnd_pylonblank";      
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";  
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
	};
};

/*
 switch (_vec) do
  {
	case 'A7'://CAP
	{
		if(_type == "F4M_Des") then 
		{
			_vec addweapon "EB_AIM120_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank"; //Dummy for dumb spot
			_vec addMagazine "EB_AIM120x4";      
			_vec addMagazine "EB_2Rnd_pylonblank";      
			_vec addMagazine "EB_AIM120x2";  
			_vec addMagazine "EB_2Rnd_pylonblank"; 
			_vec addMagazine "GLT_2Rnd_AIM9M";     
			_vec addweapon "GLT_AIM9M_Launcher";
		};
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
//BLUFOR FIXED		
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12_API";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AIM120x4";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_3Rnd_pylonblank";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1350Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_14Rnd_CRV7_FAT";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_LAU59_70mmx7podx4";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_AV8_fueltankx2";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addMagazine "EB_24Rnd_pylonblank";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM132x6";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addweapon "EB_METEOR_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addMagazine "EB_52Rnd_pylonblank";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addweapon "EB_METEOR_Launcher";
			_vec addMagazine "EB_8Rnd_pylonblank";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_F15_fueltankx1";

			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AIM7Ex2";
			_vec addMagazine "EB_F16_wingtankx2";
			_vec addMagazine "EB_37Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_F111_fueltankx4";
			_vec addMagazine "EB_AIM54_bayx1";
			_vec addMagazine "EB_AIM54_bayx1";
			_vec addMagazine "EB_AIM9Mx4";
			_vec addMagazine "EB_44Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_AIM54_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltank_smallx2";
			_vec addMagazine "EB_AIM132x4";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EB_13Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_6xRack";
			_vec addMagazine "EB_METEORx6";
			_vec addMagazine "EB_18Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_METEOR_Launcher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_AIM132x6";
			_vec addweapon "EB_AIM132_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_R3x4";
			_vec addweapon "EB_R3_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_500Rnd_127x99_HMP250_twin";
			_vec addweapon "EB_HMP";
			_vec addMagazine "EB_2rnd_HMPpod";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED		
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_1120rnd_23mm_SPPU22";
			_vec addweapon "EB_SPPU22x4";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_R77x2";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_4rnd_SPPU22pod";
			_vec addMagazine "EB_32Rnd_pylonblank";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_R77x4";
			_vec addMagazine "EB_R27x4";
			_vec addweapon "EB_R27_Launcher";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_62Rnd_pylonblank";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_R24Tx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_R24T_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_R24Tx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_R24T_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_R24Tx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_R24T_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_R24Tx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_R24T_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_R27x2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R27_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_R27x4";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R27_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_R27x4";
			_vec addMagazine "EB_40Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R27_Launcher";
			_vec addweapon "EB_R73_Launcher";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x4";
			_vec addMagazine "EB_R27x4";
			_vec addMagazine "EB_62Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R27_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_400Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_TOW_4rackx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_360Rnd_20mm_HEI_M621";
			_vec addweapon "EB_TwinM621";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_8000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY		
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_127x108_QuadYakB";
			_vec addweapon "EB_YakB_quad";
			_vec addMagazine "EB_6000Rnd_762x54_GshG_quad";
			_vec addweapon "EB_GshG_quad";
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_4rnd_GUVMGpod";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_RU_300Rnd_30mm_HEI";
			_vec addMagazine "EB_RU_160Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_HEI";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then {};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then {}; 
		if(_type == "FRL_Mi8_AMTSh_MR") then {}; 
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then {}; 
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then {}; 
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_AIM9Mx8";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AIM9Xx8";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_AIM9Mx12";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_stingerpodx2";
			_vec addMagazine "EB_Stingerx2";
			_vec addweapon "EB_FIM92_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_stingerpodx2";
			_vec addMagazine "EB_Stingerx2";
			_vec addweapon "EB_FIM92_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_800Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_280rnd_30mm_nr30";
			_vec addweapon "EB_NR30";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_R60x4";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "PRACS_AA8x2";
			_vec addweapon "PRACS_AA8_Launcher";
		};
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_R60x2";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_R73x4";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "6Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_R60x6";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "4Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
		};
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "IkaR_F14_AIM54Launcher6_ir";
			_vec addweapon "IkaR_F14_AIM54Launcher6_ir";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_1545Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
//outer
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
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
			_vec addMagazine "EB_1545Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
//outer
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
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
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "GLT_2Rnd_AIM9M";
			_vec addweapon "GLT_AIM9M_Launcher";
			_vec addMagazine "GLT_6Rnd_AIM120";
			_vec addweapon "GLT_AIM120_Launcher";
			_vec addMagazine "EB_12Rnd_pylonblank";
		};
	};

	case 2://CAS
	{
			if(_type == "F4M_Des") then 
		{
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank";      
			_vec addMagazine "EB_AIM9Mx4";      
			_vec addMagazine "EB_2Rnd_pylonblank";      
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";  
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
		};
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
//BLUFOR FIXED CAS
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12_API";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addMagazine "EB_bombrackx2x4";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_LAU5003_70mmx19podx4";
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "EB_6Rnd_pylonblank";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1350Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addMagazine "EB_LAU68_70mmx19podx4";
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addMagazine "EB_5Rnd_pylonblank";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addMagazine "EB_2rnd_BRU61A_4xRack";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_36Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_GBU39_bay";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "EB_GBU39_Launcher";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_1Rnd_Mk770_bay";
			_vec addMagazine "EB_1Rnd_Mk770_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "EB_8Rnd_pylonblank";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_F15_fueltankx2";
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_F15_fueltankx2";
			_vec addMagazine "EB_5Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61_HEI";
			_vec addMagazine "EB_114Rnd_CRV7_HEPD";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addMagazine "EB_LAU68_70mmx19podx6";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addMagazine "EB_bombrackx2x4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_CBU100";
			_vec addMagazine "EB_36Rnd_pylonblank";
			_vec addMagazine "EB_1rnd_suu23";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_M61A1";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_360Rnd_BK27_twin";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltank_smallx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_1Rnd_BL755";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_BL755";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_13Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27_twin";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU32_Launcher";
			_vec addweapon "EB_BL755_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_2xRack";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex6";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk770_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_32Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_2Rnd_SAB500";
			_vec addweapon "EB_SAB500_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_14Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED CAS
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_560rnd_23mm_SPPU22";
			_vec addweapon "EB_SPPU22x2";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_2Rnd_SAB500";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2rnd_SPPU22pod";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_SAB500_Launcher";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_80Rnd_80mm_lsr";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_2Rnd_SAB500";
			_vec addMagazine "EB_MBD267rackx4x2";
			_vec addMagazine "EB_S8podx4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_RBK500";
			_vec addMagazine "EB_30Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_RBK500";
			_vec addweapon "EB_SAB500_Launcher";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_2Rnd_ZB500";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_kab500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_240mm_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_ZB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_250mmL_Launcher";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_5Rnd_ZB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_240mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_mig29bombrackx2x2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_240mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_80Rnd_80mm_lsr";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_2Rnd_RBK500";
			_vec addMagazine "EB_2Rnd_ZB500";
			_vec addMagazine "EB_S8podx4";
			_vec addMagazine "EB_36Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
			_vec addweapon "EB_BombLauncher_RBK500";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_80Rnd_80mm_lsr";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_2Rnd_ZB500";
			_vec addMagazine "EB_2Rnd_RBK500";
			_vec addMagazine "EB_S8podx4";
			_vec addMagazine "EB_58Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_ZB500_Launcher";
			_vec addweapon "EB_BombLauncher_RBK500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY CAS
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx4";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_8Rnd_zuniFRAG";
			_vec addweapon "EB_ZuniLauncher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_LAU10_125mmpodx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx4";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_400Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_19Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_LAU68_70mmx19podx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_2400Rnd_127x107_GAU19_twin";
			_vec addweapon "EB_TwinGAU19";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_LAU68_70mmx19podx1";
			_vec addMagazine "EB_AGMrackx2x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_AGM114Rx1";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_AGM114Rx1";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_AGM114Rx1";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_AGM114Rx1";
			_vec addMagazine "EB_Stingerx2";
			_vec addMagazine "EB_19Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addweapon "EB_AGM114R_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY CAS
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_S5_ub32_podx4";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_80Rnd_S8T_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_AT9x2rackx2";
			_vec addMagazine "EB_S8pod_helix4";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_AT9Fx4";
			_vec addweapon "EB_AT9F_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_AT9x2rackx2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_AT9Fx4";
			_vec addweapon "EB_AT9F_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_RU_300Rnd_30mm_HEI";
			_vec addMagazine "EB_RU_160Rnd_30mm_APBC";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then
 		{
			_vec addMagazine "EB_S5_ub32_podx6";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_192Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then
		{
			_vec addMagazine "EB_S5_ub32_podx6";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_192Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi8_AMTSh_MR") then
 		{
			_vec addMagazine "EB_S8pod_helix6";
			_vec addMagazine "EB_120Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then
 		{
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_2rnd_GUVAGSpod";
			_vec addMagazine "EB_600Rnd_30mm_AGS17A_twin";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_RU_AGS17A_30mm_twin";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then
 		{
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_2rnd_GUVAGSpod";
			_vec addMagazine "EB_600Rnd_30mm_AGS17A_twin";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_RU_AGS17A_30mm_twin";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addMagazine "EB_76Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_4Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addMagazine "EB_6Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "EB_6Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_4Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addMagazine "EB_10Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addMagazine "EB_28Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "EB_19Rnd_CRV7_HEPD";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_19Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_56Rnd_FFAR";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_800Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_420rnd_30mm_nr30";
			_vec addweapon "EB_NR30";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "PRACS_AA8x2";
			_vec addweapon "PRACS_AA8_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
		};
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "EB_600Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_160rnd_37mm_n37";
			_vec addweapon "EB_N37";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_80Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "EB_600Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_160rnd_37mm_n37";
			_vec addweapon "EB_N37";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_6Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
		};
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_2Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_56Rnd_FFARL";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFARL_Launcher";
//			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_LAU68_70mmx19podx2";

//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addweapon "EB_AGM65E_Launcher";
//inner rack
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
//mid rack
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_56Rnd_FFARL";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
//			_vec addMagazine "EB_S8podx2";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addweapon "EB_AGM65E_Launcher";
//inner rack
			_vec addMagazine "EB_4Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
//mid rack
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_6Rnd_Mk77";
			_vec addweapon "EB_Mk77_Launcher";
			_vec addMagazine "EB_12Rnd_pylonblank";
		};
	};
	case 3://AGM
	{
//BLUFOR FIXED AGM
	if(_type == "F4M_Des") then 
		{
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank";      
			_vec addMagazine "PRACS_AGM88x2";
			_vec addMagazine "PRACS_AGM88x2";  
			_vec addMagazine "EB_2Rnd_pylonblank";      
			_vec addMagazine "PRACS_AGM88x2";
			_vec addweapon "PRACS_AGM88_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";  
			_vec addMagazine "PRACS_Maverickx6";
			_vec addweapon "PRACS_Maverick_Launcher";
			_vec addMagazine "EB_AIM9Mx4";    
		};
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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

		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12_API";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_114Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "EB_AGM65Ex4";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_9Rnd_pylonblank";
			_vec addMagazine "EB_LAU5003_70mmx19podx6";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_3Rnd_pylonblank";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_38Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "EB_8Rnd_zuniAT";
			_vec addweapon "EB_ZuniLauncher";
			_vec addMagazine "EB_bombrackx2x1";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_LAU10_125mmpodx2";
			_vec addMagazine "EB_2rnd_rackx3";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_7Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_24Rnd_pylonblank";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_4rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_JAGM_bayx1";
			_vec addMagazine "EB_JAGM_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex12";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_JAGM_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addMagazine "EB_32Rnd_pylonblank";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_JAGM_bayx1";
			_vec addMagazine "EB_JAGM_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_JAGM_Launcher";
			_vec addMagazine "EB_8Rnd_pylonblank";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM130x1";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_AGM130_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM130x2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_AGM130_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_AGM84Hx2";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex6";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_AGM84H_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_AGM130x4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_46Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_AGM130_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_360Rnd_BK27_twin";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltank_smallx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_4rnd_brimstone_3xRack";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex12";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27_twin";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "EB_38Rnd_CRV7_FAT";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_2xRack";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex12";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AGM65Ex4";
			_vec addweapon "EB_AGM65E_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_2Rnd_RBK250";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addweapon "EB_BombLauncher_RBK250";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_8Rnd_zuniAT";
			_vec addMagazine "EB_LAU10_125mmpodx2";
			_vec addMagazine "EB_AGM65Dx2";
			_vec addweapon "EB_ZuniLauncher";
			_vec addweapon "EB_AGM65D_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED AGM
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_5Rnd_S13T";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_S13_ub13_podx1";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_KH25MTPx2";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_250mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_AT16_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_KH25MTP_Launcher";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addMagazine "EB_KH25MTPx4";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_KH25MTP_Launcher";
			_vec addMagazine "EB_58Rnd_pylonblank";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_1Rnd_kab500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_250mm_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addMagazine "EB_2Rnd_RBK500_SPBED";
			_vec addMagazine "EB_40Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_RBK500_SPBED_Launcher";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_KH29Dx6";
			_vec addMagazine "EB_62Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY AGM
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGMrackx4x4";
			_vec addMagazine "EB_AGM114Kx16";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_8Rnd_zuniAT";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AGMrackx4x2";
			_vec addMagazine "EB_LAU10_125mmpodx2";
			_vec addMagazine "EB_AGM114Kx8";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_ZuniLauncher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_AGMrackx4x4";
			_vec addMagazine "EB_AGM114Kx16";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_1800Rnd_127x107_GAU19_twin";
			_vec addweapon "EB_TwinGAU19";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addweapon "EB_AGM114K_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_1800Rnd_127x107_GAU19_twin";
			_vec addweapon "EB_TwinGAU19";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_HOTx6";
			_vec addweapon "EB_HOT_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_TOW_4rackx2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_TOWx8";
			_vec addweapon "EB_BGM71_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx4x4";
			_vec addMagazine "EB_AGM114Kx16";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_GBU54";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addweapon "EB_GBU54_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY AGM
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_80Rnd_S8T";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_S8pod_helix4";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_AT9x2rackx4";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_AT9x8";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_AT9x2rackx4";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_AT9x8";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_RU_230Rnd_30mm_APDS";
			_vec addMagazine "EB_RU_230Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_APU6_vikhrpodx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT16x12";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_AT16_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_APFSDST";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_ATAKArackx8x2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x16";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then
		{
			_vec addMagazine "EB_S5_ub16_podx4";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_AT3rackx4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then
		{
			_vec addMagazine "EB_S5_ub16_podx4";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_AT3rackx4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AT3x4";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT3_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi8_AMTSh_MR") then
		{
			_vec addMagazine "EB_ATAKA4rackx2";
			_vec addMagazine "EB_S8pod_helix4";
			_vec addMagazine "EB_AT6x8";
			_vec addMagazine "EB_80Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT6_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then
		{
			_vec addMagazine "EB_ATAKA4rackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x8";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then
		{
			_vec addMagazine "EB_ATAKA4rackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x8";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi17_TVK_TAK_MR") then
		{
			_vec addMagazine "EB_ATAKA4rackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x8";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_2060Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AGM65Ex12";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_AGM88x4";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_2060Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AGM65Ex8";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_AGM114Kx12";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "EB_AIM9Xx6";
			_vec addweapon "EB_AIM9X_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_AGM114Kx2";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "ibr_viggen_adenpods_2Rnd";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addMagazine "ibr_aden30_300rnds";
			_vec addweapon "ibr_aden30";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_AGM114Kx4";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AGM65Ex3";
			_vec addweapon "EB_AGM65E_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_600Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_R60x2";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_KH29Dx4";
			_vec addweapon "EB_KH29D_Launcher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R60x2";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_10Rnd_S13T";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_AT16_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_10Rnd_S13T";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_KH29Dx4";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_AT16_Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "EB_AGM65Ex4";
			_vec addweapon "EB_AGM65E_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_AGM65E_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "js_m_fa18_aim120c_x1";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
//inner rack
			_vec addMagazine "EB_AGM88x4";
			_vec addweapon "EB_AGM88_Launcher";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
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
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addweapon "js_w_fa18_MaverickLauncher";
//mid rack
			_vec addMagazine "EB_AGM65Ex4";
			_vec addweapon "EB_AGM65E_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addMagazine "EB_4Rnd_pylonblank";
		};
	};
	case 4://MR
	{
		if(_type == "F4M_Des") then 
		{
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_1Rnd_pylonblank";      
			_vec addMagazine "EB_AIM9Mx4";      
			_vec addMagazine "EB_2Rnd_pylonblank";      
			_vec addMagazine "PRACS_M3_GBU12X2";
			_vec addweapon "PRACS_M3_GBU12_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";  
			_vec addMagazine "PRACS_F16_gbu12x2";
			_vec addweapon "PRACS_F16_GBU12_Launcher";
			_vec addMagazine "2Rnd_Maverick_A10";
			_vec addweapon "MaverickLauncher";
		};
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
//BLUFOR FIXED MR
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12_API";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_16Rnd_zuniWP";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_LAU10_125mmpodx4";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_Mk81";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_ZuniLauncher";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "EB_bombrackx2x1";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_AGM65Ex4";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_2rnd_BRU61A_4xRack";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_GBU54";
			_vec addMagazine "EB_Brimstonex6";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_GBU39_bay";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EB_GBU39_Launcher";
			_vec addweapon "EB_GBU54_Launcher";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_2rnd_BRU61A_4xRack";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_8Rnd_GBU39_bay";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_GBU39_Launcher";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_5Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_GBU12";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_Mk82";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_LAU10_125mmpodx4";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_Mk82";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_ZuniLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_2rnd_f111_rackx6";
			_vec addMagazine "EB_AGM84Hx2";
			_vec addMagazine "EB_1Rnd_GBU38_bay";
			_vec addMagazine "EB_1Rnd_GBU38_bay";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addMagazine "EB_12Rnd_Mk82";
			_vec addMagazine "EB_13Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_AGM84H_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_GBU38_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_360Rnd_BK27_twin";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltank_smallx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_1Rnd_GBU38";
			_vec addMagazine "EB_1rnd_brimstone_3xRack";
			_vec addMagazine "EB_1Rnd_GBU38";
			_vec addMagazine "EB_1rnd_brimstone_3xRack";
			_vec addMagazine "EB_1Rnd_pylonblank";

			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex1";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27_twin";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EB_GBU38_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_2xRack";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_Brimstonex6";
			_vec addMagazine "EB_4Rnd_BL755";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_Brimstone_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_BL755_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED MR
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_MBD267rackx4x2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_8Rnd_fab100";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_AT16_Launcher";
			_vec addweapon "EB_BombLauncher_fab100";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_KH25MTPx4";
			_vec addMagazine "EB_4Rnd_fab500";
			_vec addMagazine "EB_54Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_KH25MTP_Launcher";
			_vec addweapon "EB_BombLauncher_fab500";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_1Rnd_kab500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_RBK250";
			_vec addMagazine "EB_1Rnd_RBK250";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_1Rnd_RBK250";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_BombLauncher_RBK250";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_mig23_twinpylon_R";
			_vec addMagazine "EB_mig23_twinpylon_L";
			_vec addMagazine "EB_1Rnd_RBK500";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_R60x4";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_BombLauncher_RBK500";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_2rnd_rackx6";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_BombLauncher_fab100";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_1Rnd_S24";
			_vec addMagazine "EB_4Rnd_fab500";
			_vec addMagazine "EB_54Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_240mm_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addweapon "EB_BombLauncher_fab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY MR
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_AGMrackx4x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx8";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_TOW_4rackx2";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "EB_TOWx8";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_BGM71_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_19Rnd_CRV7_HEPD";
			_vec addMagazine "EB_19Rnd_CRV7_FAT";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx1";
			_vec addMagazine "EB_LAU5003_70mmx19podx1";
			_vec addMagazine "EB_AGMrackx4x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx8";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x1";
			_vec addMagazine "EB_LAU59_70mmx7podx1";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_7Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x1";
			_vec addMagazine "EB_LAU59_70mmx7podx1";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AGM114Kx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_7Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_AGM114K_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_250Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_LAU120_70mmx12podx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_CRV7_PG";
			_vec addweapon "EB_CRV7_PG_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_180Rnd_20mm_HEI_M621";
			_vec addweapon "M621";
			_vec addMagazine "EB_24Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_LAU120_70mmx12podx1";
			_vec addMagazine "EB_9Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_8000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY MR
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_1500Rnd_127x108_TwinYakB";
			_vec addweapon "EB_YakB_twin";
			_vec addMagazine "EB_3000Rnd_762x54_GshG_twin";
			_vec addweapon "EB_GshG_twin";
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_2rnd_GUVMGpod";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_1500Rnd_127x108_TwinYakB";
			_vec addweapon "EB_YakB_twin";
			_vec addMagazine "EB_3000Rnd_762x54_GshG_twin";
			_vec addweapon "EB_GshG_twin";
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_AT6x2rackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_2rnd_GUVMGpod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_AT6x4";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT6_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_1500Rnd_127x108_TwinYakB";
			_vec addweapon "EB_YakB_twin";
			_vec addMagazine "EB_3000Rnd_762x54_GshG_twin";
			_vec addweapon "EB_GshG_twin";
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addMagazine "EB_AT6x2rackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_2rnd_GUVMGpod";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_grinchpodx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "EB_SA24x2";
			_vec addMagazine "EB_AT6x4";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_AT6_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_RU_230Rnd_30mm_APBC";
			_vec addMagazine "EB_RU_230Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_20Rnd_S8T";
			_vec addMagazine "EB_20Rnd_80mm_lsr";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_ATAKArackx2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x6";
			_vec addMagazine "EB_AT9Fx6";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addweapon "EB_AT9F_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_APBC";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_20Rnd_S8T";
			_vec addMagazine "EB_20Rnd_80mm_lsr";
			_vec addMagazine "EB_ATAKArackx8x2";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT9x8";
			_vec addMagazine "EB_AT9Fx8";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_AT9_Launcher";
			_vec addweapon "EB_AT9F_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then
		{
			_vec addMagazine "EB_560rnd_23mm_SPPU22";
			_vec addweapon "EB_SPPU22x2";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_AT3rackx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AT2x2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT2_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then
		{
			_vec addMagazine "EB_560rnd_23mm_SPPU22";
			_vec addweapon "EB_SPPU22x2";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_AT3rackx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AT3x2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT3_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Mi8_AMTSh_MR") then
		{
			_vec addMagazine "EB_3000Rnd_762x54_GshG_twin";
			_vec addMagazine "EB_1500Rnd_127x108_TwinYakB";
			_vec addweapon "EB_GshG_twin";
			_vec addweapon "EB_YakB_twin";
			_vec addMagazine "EB_ATAKA4rackx2";
			_vec addMagazine "EB_2rnd_GUVMGpod";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_AT6x8";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_AT6_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then
		{
			_vec addMagazine "EB_3000Rnd_762x54_GshG_twin";
			_vec addMagazine "EB_1500Rnd_127x108_TwinYakB";
			_vec addweapon "EB_GshG_twin";
			_vec addweapon "EB_YakB_twin";
			_vec addMagazine "EB_2rnd_GUVMGpod";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then
		{
			_vec addMagazine "EB_600Rnd_30mm_AGS17A_twin";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_RU_AGS17A_30mm_twin";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_2rnd_GUVAGSpod";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
		if(_type == "FRL_Mi17_TVK_TAK_MR") then
		{
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_AT3rackx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AT3x2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_560rnd_23mm_SPPU22";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addweapon "EB_SPPU22x2";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_AT3_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_38Rnd_CRV7_PG";
			_vec addweapon "EB_CRV7_PG_Launcher";
			_vec addMagazine "EB_AIM9Mx4";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_6Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";
			_vec addMagazine "EB_6Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_AIM7Ex6";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addMagazine "EB_AGM65Ex8";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_AGM88x4";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "EB_12Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_24Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "ibr_viggen_arak135_12Rnd";
			_vec addweapon "ibr_viggen_arak135Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_4Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AGM65Ex1";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_400Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_140rnd_30mm_nr30";
			_vec addweapon "EB_NR30";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_AT16_Launcher";
		};
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "EB_400Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_80rnd_37mm_n37";
			_vec addweapon "EB_N37";
			_vec addMagazine "EB_R73x6";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_2Rnd_fab500";
			_vec addweapon "EB_BombLauncher_fab500";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_AT16_Launcher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "EB_400Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "EB_80rnd_37mm_n37";
			_vec addweapon "EB_N37";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_40Rnd_80mm";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_4Rnd_fab250";
			_vec addMagazine "EB_APU8_vikhrpodx2";
			_vec addMagazine "EB_KH29Dx2";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "EB_KH29D_Launcher";
			_vec addMagazine "EB_AT16x16";
			_vec addweapon "EB_AT16_Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_2Rnd_Mk770";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "EB_2Rnd_GBU16";
//inner rack
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addweapon "js_w_fa18_MaverickLauncher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "EB_GBU16_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_2Rnd_Mk770";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "EB_2Rnd_GBU16";
//inner rack
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
//mid rack
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addMagazine "js_m_fa18_Maverick_x1";
			_vec addMagazine "js_m_fa18_aim120c_x1";
			_vec addweapon "js_w_fa18_aim120cLaucher";
			_vec addweapon "js_w_fa18_MaverickLauncher";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
			_vec addweapon "EB_GBU16_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_1030Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "28Rnd_FFAR";
			_vec addweapon "FFARLauncher";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
		};
	};
	case 5://BMB
	{
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
//BLUFOR FIXED BMB
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_2Rnd_Mk81";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addMagazine "EB_8Rnd_zuniAT";
			_vec addMagazine "EB_bombrackx2x1";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_LAU10_125mmpodx2";
			_vec addMagazine "EB_2rnd_rackx3";
			_vec addMagazine "EB_2rnd_rackx6";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_7Rnd_pylonblank";
			_vec addMagazine "EB_18Rnd_Mk82";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addweapon "EB_ZuniLauncher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "EB_24Rnd_pylonblank";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_bombrackx2x4";
			_vec addMagazine "EB_1Rnd_Mk83_bay";
			_vec addMagazine "EB_1Rnd_Mk83_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_8Rnd_Mk82";
			_vec addMagazine "EB_44Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_Mk83_Launcher";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_1Rnd_Mk83_bay";
			_vec addMagazine "EB_1Rnd_Mk83_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_Mk83_Launcher";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_6Rnd_Mk82";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk84";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_F15_fueltankx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_Mk82";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_Mk84_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_bombrackx3x4";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_12Rnd_Mk82";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_4rnd_f111_rackx6";
			_vec addMagazine "EB_2Rnd_Mk83";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addMagazine "EB_24Rnd_Mk82";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_Mk83_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltank_smallx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_4Rnd_GBU32";
			_vec addMagazine "EB_13Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU32_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "EB_6Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_GBU38";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_1Rnd_GBU32";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_GBU38_Launcher";
			_vec addweapon "EB_GBU32_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_4Rnd_Mk82";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_4Rnd_FAB250";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_4Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED BMB
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_MBD267rackx4x2";
			_vec addMagazine "EB_2Rnd_FAB500";
			_vec addMagazine "EB_2Rnd_FAB250";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_8Rnd_fab100";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_BombLauncher_fab100";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_BombLauncher_fab500";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_MBD267_su34_rackx4x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_5Rnd_FAB250";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_250mm_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_6Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_kab500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_MBD267rackx4x2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_1Rnd_FAB100";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_BombLauncher_fab100";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_MBD267rackx4x2";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_1Rnd_FAB250";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_FAB100";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_BombLauncher_fab100";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_mig29bombrackx2x2";
			_vec addMagazine "EB_2Rnd_FAB500";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_4Rnd_FAB250";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_fab500";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_mig29bombrackx2x4";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_FAB250";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2rnd_rackx6";
			_vec addMagazine "EB_2rnd_rackx6";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "EB_12Rnd_fab100";
			_vec addMagazine "EB_12Rnd_FAB250";
			_vec addweapon "EB_80mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_fab100";
			_vec addweapon "EB_BombLauncher_fab250";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_S13_ub13_podx2";
			_vec addMagazine "EB_MBD267_su34_rackx4x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addMagazine "EB_1Rnd_fab250";
			_vec addweapon "EB_130mm_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY BMB
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_400Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_TOW_4rackx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_360Rnd_20mm_HEI_M621";
			_vec addweapon "EB_TwinM621";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_8000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY BMB
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_127x108_QuadYakB";
			_vec addweapon "EB_YakB_quad";
			_vec addMagazine "EB_6000Rnd_762x54_GshG_quad";
			_vec addweapon "EB_GshG_quad";
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_4rnd_GUVMGpod";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_RU_300Rnd_30mm_HEI";
			_vec addMagazine "EB_RU_160Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_HEI";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then {};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then {}; 
		if(_type == "FRL_Mi8_AMTSh_MR") then {}; 
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then {}; 
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then {}; 
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_12Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "EB_8Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "EB_6Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";
			_vec addMagazine "EB_4Rnd_Mk84";
			_vec addweapon "EB_Mk84_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_12Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "EB_8Rnd_Mk84";
			_vec addweapon "EB_Mk84_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_5Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_2Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addMagazine "EB_4Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_6Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_10Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_400Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_6Rnd_FAB500";
			_vec addweapon "EB_BombLauncher_fab500";
		};
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_20Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_10Rnd_S13T";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "EB_4Rnd_fab250";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "EB_6Rnd_fab500";
			_vec addweapon "EB_BombLauncher_fab500";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_40Rnd_S8T";
			_vec addweapon "EB_80mm_Launcher";
			_vec addMagazine "EB_4Rnd_fab250";
			_vec addweapon "EB_BombLauncher_fab250";
			_vec addMagazine "EB_6Rnd_fab500";
			_vec addweapon "EB_BombLauncher_fab500";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_2Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "EB_2Rnd_Mk84";
			_vec addMagazine "EB_4Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";
			_vec addweapon "EB_Mk84_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_28Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_Mk81";
			_vec addweapon "EB_Mk81_Launcher";
			_vec addMagazine "EB_4Rnd_Mk83";
			_vec addweapon "EB_Mk83_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
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
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_2Rnd_Mk84";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
			_vec addMagazine "js_m_fa18_GBU31_JDAM_x1";
//inner rack
			_vec addMagazine "EB_4Rnd_Mk83";
//mid rack
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addMagazine "EB_3Rnd_Mk82";
			_vec addweapon "EB_Mk82_Launcher";
			_vec addweapon "EB_Mk83_Launcher";
			_vec addweapon "EB_Mk84_Launcher";
			_vec addweapon "js_w_fa18_GBU31BombLauncher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_2Rnd_Mk84";
			_vec addweapon "EB_Mk84_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "GLT_8Rnd_GBU39";
			_vec addweapon "GLT_GBU39_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
		};
	};
	case 6://LGB
	{
//BLUFOR FIXED LGB
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_9Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_GBU16_Launcher";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addMagazine "EB_bombrackx2x1";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_4Rnd_GBU12";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addMagazine "EB_1Rnd_GBU12_bay";
			_vec addMagazine "EB_1Rnd_GBU12_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_52Rnd_pylonblank";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_1Rnd_GBU12_bay";
			_vec addMagazine "EB_1Rnd_GBU12_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "EB_8Rnd_pylonblank";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_F15_fueltankx2";
			_vec addMagazine "EB_4Rnd_GBU10";
			_vec addMagazine "EB_4Rnd_GBU10";
			_vec addMagazine "EB_21Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_F15_fueltankx2";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_5Rnd_GBU12";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_bombrackx2x2";
			_vec addMagazine "EB_2rnd_BRU61A_4xRack";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_4Rnd_GBU38";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addMagazine "EB_8Rnd_GBU39";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_GBU39_Launcher";
			_vec addweapon "EB_GBU38_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addMagazine "EB_2rnd_rackx3";
			_vec addMagazine "EB_2Rnd_GBU15";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_10Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_GBU12";
			_vec addMagazine "EB_30Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_M61A1";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addweapon "EB_GBU15_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_360Rnd_BK27_twin";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_GR4_fueltankx2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_1Rnd_GBU10";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27_twin";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_6xRack";
			_vec addMagazine "EB_1Rnd_GBU16";
			_vec addMagazine "EB_1Rnd_GBU16";
			_vec addMagazine "EF2K_fueltank";
			_vec addMagazine "EB_1Rnd_GBU16";
			_vec addMagazine "EB_1Rnd_GBU16";
			_vec addMagazine "EB_18Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EF2K_fueltank_CL";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_4Rnd_GBU54";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU54_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_2Rnd_kab250";
			_vec addMagazine "EB_2Rnd_kab500";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_4Rnd_GBU54";
			_vec addweapon "EB_GBU54_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED LGB
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_2Rnd_RBK500_SPBED";
			_vec addMagazine "EB_2Rnd_kab500";
			_vec addMagazine "EB_2Rnd_kab500SE";
			_vec addMagazine "EB_2Rnd_kab500Kr";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_RBK500_SPBED_Launcher";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addweapon "EB_BombLauncher_kab500SE";
			_vec addweapon "EB_BombLauncher_kab500KR";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_4Rnd_kab500KR";
			_vec addMagazine "EB_2Rnd_kab500SE";
			_vec addMagazine "EB_1Rnd_KAB1500KR";
			_vec addMagazine "EB_62Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_kab500SE";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_BombLauncher_kab1500KR";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_57mm_Launcher";
			_vec addweapon "EB_250mmL_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_4Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_KAB250";
			_vec addMagazine "EB_24Rnd_pylonblank";
			_vec addweapon "EB_250mmL_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_40Rnd_80mm_Lsr";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2Rnd_KAB250";
			_vec addMagazine "EB_3Rnd_KAB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_mig29bombrackx2x2";
			_vec addMagazine "EB_2Rnd_kab500";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_4Rnd_kab250";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x4";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_mig29bombrackx2x2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_kab500SE";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_kab500SE";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_2Rnd_kab500SE";
			_vec addMagazine "EB_1Rnd_kab1500";
			_vec addMagazine "EB_41Rnd_pylonblank";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_BombLauncher_kab500SE";
			_vec addweapon "EB_BombLauncher_kab1500";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_2Rnd_kab500";
			_vec addMagazine "EB_2Rnd_kab500SE";
			_vec addMagazine "EB_1Rnd_kab1500";
			_vec addMagazine "EB_62Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH25MP_Launcher";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addweapon "EB_BombLauncher_kab500SE";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_BombLauncher_kab1500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY LGB
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_400Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_TOW_4rackx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_360Rnd_20mm_HEI_M621";
			_vec addweapon "EB_TwinM621";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_8000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY LGB
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_127x108_QuadYakB";
			_vec addweapon "EB_YakB_quad";
			_vec addMagazine "EB_6000Rnd_762x54_GshG_quad";
			_vec addweapon "EB_GshG_quad";
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_4rnd_GUVMGpod";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_RU_300Rnd_30mm_HEI";
			_vec addMagazine "EB_RU_160Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_HEI";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then {};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then {}; 
		if(_type == "FRL_Mi8_AMTSh_MR") then {}; 
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then {}; 
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then {}; 
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_8Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "EB_6Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_6Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_AIM7Ex4";
			_vec addweapon "EB_AIM7E_Launcher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_10Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "EB_10Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_AIM9Xx6";
			_vec addweapon "EB_AIM9X_Launcher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_1Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "ibr_viggen_arak135_12Rnd";
			_vec addweapon "ibr_viggen_arak135Launcher";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_3Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_2Rnd_kab250";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addMagazine "EB_4Rnd_kab500";
			_vec addweapon "EB_BombLauncher_kab500";
		};
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_20Rnd_80mm_lsr";
			_vec addMagazine "EB_20Rnd_S8T_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_4Rnd_kab250";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addMagazine "EB_6Rnd_kab500";
			_vec addweapon "EB_BombLauncher_kab500";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_4Rnd_kab250";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addMagazine "EB_20Rnd_80mm_lsr";
			_vec addMagazine "EB_20Rnd_S8T_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addMagazine "EB_4Rnd_kab500";
			_vec addweapon "EB_BombLauncher_kab500";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_4Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_4Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "EB_4Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
//centre body
			_vec addMagazine "EB_ALQ131";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_ALQ131";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
//inner rack
			_vec addMagazine "EB_4Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
//mid rack
			_vec addMagazine "EB_4Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_2Rnd_GBU10";
			_vec addweapon "EB_GBU10_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_2Rnd_GBU16";
			_vec addweapon "EB_GBU16_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_2Rnd_GBU12";
			_vec addweapon "EB_GBU12_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
		};
	};
	case 7://SEAD or CBU
	{
//BLUFOR FIXED SEAD
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
		if(_type == "PRACS_Mirage3") then 
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
		if(_type == "PRACS_Etendard") then 
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
		if( (_type == "FRL_AV8B_MR") || (_type == "FRL_AV8B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_300Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";
			_vec addMagazine "EB_2Rnd_CBU87B";
			_vec addMagazine "EB_AGM88x2";
			_vec addMagazine "EB_bombrackx3x2";
			_vec addMagazine "EB_9Rnd_pylonblank";
			_vec addMagazine "pook_6Rnd_BLU107";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addweapon "pook_BLU107_BombLauncher";
		};
		if ( (_type == "FRL_A10_MR") || (_type == "FRL_A10_BAFX_MR") || (_type == "FRL_A10_D_MR") ) then 
		{
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";
			_vec addMagazine "EB_14Rnd_FFAR_WP";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_2rnd_rackx3";
			_vec addMagazine "EB_2rnd_rackx6";
			_vec addMagazine "EB_11Rnd_pylonblank";
			_vec addMagazine "EB_6Rnd_CBU100";
			_vec addMagazine "EB_12Rnd_Mk82";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addweapon "EB_Mk82_Launcher";
		};
		if( (_type == "FRL_F35_MR") || (_type == "FRL_F35_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EB_AGM88x2";
			_vec addMagazine "EB_AGM158x2";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addMagazine "EB_METEOR_bayx1";
			_vec addweapon "EB_METEOR_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addweapon "EB_AGM158_Launcher";
			_vec addMagazine "EB_52Rnd_pylonblank";
		};
		if( (_type == "FRL_F35B_MR") || (_type == "FRL_F35B_BAFX_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addweapon "EB_GAU22";
			_vec addMagazine "EB_1Rnd_GBU54_bay";
			_vec addMagazine "EB_1Rnd_GBU54_bay";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addMagazine "EB_AIM120_bayx1";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_GBU54_Launcher";
			_vec addMagazine "EB_8Rnd_pylonblank";
		};
		if( (_type == "FRL_F15C_MR") || (_type == "FRL_F15C_D_MR") ) then 
		{
			_vec addMagazine "EB_960Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM130x2";
			_vec addMagazine "EB_AIM7Ex2";
			_vec addMagazine "EB_2Rnd_GBU31";
			_vec addMagazine "EB_ALQ131";
			_vec addMagazine "EB_20Rnd_pylonblank";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM130_Launcher";
			_vec addweapon "EB_GBU31_Launcher";
		};
		if( (_type == "FRL_F15E_MR") || (_type == "FRL_F15E_D_MR") ) then 
		{
			_vec addMagazine "EB_515Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x2";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addMagazine "EB_AGM84Hx2";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_AGM158x1";
			_vec addMagazine "EB_5Rnd_pylonblank";
			_vec addMagazine "EB_1rnd_BRU61A_4xRack";
			_vec addMagazine "EB_5Rnd_pylonblank";
			_vec addMagazine "EB_1rnd_BRU61A_4xRack";
			_vec addMagazine "EB_8Rnd_GBU39";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_GBU39_Launcher";
			_vec addweapon "EB_AGM84H_Launcher";
			_vec addweapon "EB_AGM158_Launcher";
		};
		if( (_type == "FRL_F16_MR") || (_type == "FRL_F16_D_MR") ) then 
		{
			_vec addMagazine "EB_511Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM120x3";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AGM154x1";
			_vec addMagazine "EB_AGM158x1";
			_vec addMagazine "EB_AGM88x2";
			_vec addMagazine "EB_F16_bellytankx1";
			_vec addMagazine "EB_36Rnd_pylonblank";
			_vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addweapon "EB_AGM154_Launcher";
			_vec addweapon "EB_AGM158_Launcher";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addweapon "EB_FuelTank_Launcher";
			_vec addweapon "EB_CMFlareLauncher";
		};
		if ( (_type == "FRL_F111_MR") || (_type == "FRL_F111_D_MR") ) then 
		{
			_vec addMagazine "EB_2060Rnd_M61_HEI";
			_vec addMagazine "EB_2rnd_rackx3";
			_vec addMagazine "EB_AGM88x4";
			_vec addMagazine "EB_2Rnd_GBU38";
			_vec addMagazine "EB_AIM9Mx4";
			_vec addMagazine "EB_45Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_M61A1";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addweapon "EB_GBU38_Launcher";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_GR4_D_MR") || (_type == "FRL_GR4_MR") ) then 
		{
			_vec addMagazine "EB_360Rnd_BK27_twin";
			_vec addMagazine "EB_360Rnd_CM_Mag";
			_vec addMagazine "EB_GR4_BOZ";
			_vec addMagazine "EB_GR4_SS";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "pook_ALARMx4";
			_vec addMagazine "EB_13Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "EB_BK27_twin";
			_vec addweapon "EB_CMFlareLauncher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "pook_ALARM_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "pook_EF2000_BAF_MR") || (_type == "pook_EF2000_BAF_D_MR") || (_type == "pook_EF2000_GER_MR") || (_type == "pook_EF2000_CDF_MR") || (_type == "pook_EF2000_CDF_IND_MR") || (_type == "pook_EF2000_GUE_MR") || (_type == "pook_EF2000_INS_MR") || (_type == "pook_EF2000_UNO_MR") || (_type == "pook_EF2000_TAK_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_BK27";
			_vec addMagazine "240Rnd_CMFlare_Chaff_Magazine";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EF2K_4xRack";
			_vec addMagazine "EB_2rnd_brimstone_3xRack_flat";
			_vec addMagazine "pook_ALARMx2";
			_vec addMagazine "EF2K_fueltank";
			_vec addMagazine "EB_14Rnd_pylonblank";
			_vec addMagazine "EB_4Rnd_BL755";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM120x4";
			_vec addMagazine "EB_Stormshadowx1";
			_vec addweapon "EB_BK27";
			_vec addweapon "EF2K_CMFlareLauncher";
			_vec addweapon "EB_AIM120_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "pook_ALARM_Launcher";
			_vec addweapon "EB_Stormshadow_Launcher";
			_vec addweapon "EB_BL755_Launcher";
			_vec addweapon "EF2K_FuelTankLauncher";
		};
		if(_type == "FRL_L159_MR") then 
		{
			_vec addMagazine "EB_210Rnd_23mm_ZPL";
			_vec addweapon "EB_ZPL20";
			_vec addMagazine "EB_38Rnd_CRV7_FAT";
			_vec addMagazine "EB_AIM132x2";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_AGM65Ex2";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addweapon "EB_AIM132_Launcher";
			_vec addweapon "EB_AGM65E_Launcher";
		};
		if(_type == "FRL_L39_MR") then 
		{
			_vec addMagazine "EB_180Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_32Rnd_57mm";
			_vec addweapon "EB_57mm_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_L59_MR") then 
		{
			_vec addMagazine "EB_14Rnd_CRV7_FAT";
			_vec addweapon "EB_CRV7_FAT_Launcher";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_AGM65Dx2";
			_vec addweapon "EB_AGM65D_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//OPFOR FIXED SEAD
		if ( (_type == "FRL_Su25_MR") || (_type == "FRL_Su25_CDF_MR") || (_type == "FRL_Su25_INS_MR") || (_type == "FRL_Su25_TK_MR") || (_type == "FRL_Su25_D_MR") ) then 
		{
			_vec addMagazine "EB_250Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_KH25MPx4";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_KH31x1";
			_vec addMagazine "EB_KH58x1";
			_vec addMagazine "EB_32Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_KH25MP_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_KH58_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
		};
		if ( (_type == "FRL_Su34_MR") || (_type == "FRL_Su34_D_MR") ) then 
		{
			_vec addMagazine "EB_180Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R77x4";
			_vec addMagazine "EB_Su34bombrackx2x2";
			_vec addMagazine "EB_KH31x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_KH58x1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_KH25MPx4";
			_vec addMagazine "EB_60Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_KH25MP_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_KH58_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "LaserDesignator_mounted";
			_vec addMagazine "LaserBatteries";
		};
		if ( (_type == "FRL_Mig23B_RU_MR") || (_type == "FRL_Mig23B_CDF_MR") || (_type == "FRL_Mig23B_INS_MR") || (_type == "FRL_Mig23B_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_KAB250";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig23C_RU_MR") || (_type == "FRL_Mig23C_CDF_MR") || (_type == "FRL_Mig23C_INS_MR") || (_type == "FRL_Mig23C_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_KAB250";
			_vec addMagazine "EB_R60x2";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_R60_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mig23K_RU_MR") || (_type == "FRL_Mig23K_CDF_MR") || (_type == "FRL_Mig23K_INS_MR") || (_type == "FRL_Mig23K_TK_MR") ) then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GSh23L";
			_vec addweapon "GSh23L";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_1Rnd_S25";
			_vec addMagazine "EB_1Rnd_KAB500";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_250mm_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_BombLauncher_kab500";
		};
		if ( (_type == "FRL_Mig27M_RU_MR") || (_type == "FRL_Mig27M_CDF_MR") || (_type == "FRL_Mig27M_INS_MR") || (_type == "FRL_Mig27M_TK_MR") ) then 
		{
			_vec addMagazine "EB_260rnd_23mm_GSh630";
			_vec addweapon "EB_GSh630";
			_vec addMagazine "EB_KH23Mx2";
			_vec addMagazine "EB_2Rnd_KAB250";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_1Rnd_S25L";
			_vec addMagazine "EB_Mig23_fueltankx1";
			_vec addMagazine "EB_28Rnd_pylonblank";
			_vec addweapon "EB_250mmL_Launcher";
			_vec addweapon "EB_KH23M_Launcher";
			_vec addweapon "EB_BombLauncher_kab250";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig29_RU_MR") || (_type == "FRL_Mig29_RU_D_MR") || (_type == "FRL_Mig29_INS_MR") || (_type == "FRL_Mig29_CDF_MR") || (_type == "FRL_Mig29_CDF_IND_MR") || (_type == "FRL_Mig29_GUE_MR") || (_type == "FRL_Mig29_TAK_MR") || (_type == "FRL_Mig29_TK_INS_MR") || (_type == "FRL_Mig29_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_KH31x2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Mig35_RU_MR") || (_type == "FRL_Mig35_RU_D_MR") || (_type == "FRL_Mig35_INS_MR") || (_type == "FRL_Mig35_CDF_MR") || (_type == "FRL_Mig35_CDF_IND_MR") || (_type == "FRL_Mig35_GUE_MR") || (_type == "FRL_Mig35_TAK_MR") || (_type == "FRL_Mig35_TK_INS_MR") || (_type == "FRL_Mig35_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_R77x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_KH31x2";
			_vec addMagazine "EB_PTB800_fueltankx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addweapon "EB_R77_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_FuelTank_Launcher";
		};
		if ( (_type == "FRL_Su27_RU_MR") || (_type == "FRL_Su27_RU_D_MR") || (_type == "FRL_Su27_INS_MR") || (_type == "FRL_Su27_CDF_MR") || (_type == "FRL_Su27_CDF_IND_MR") || (_type == "FRL_Su27_GUE_MR") || (_type == "FRL_Su27_TAK_MR") || (_type == "FRL_Su27_TK_INS_MR") || (_type == "FRL_Su27_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_KH31x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_2Rnd_RBK500_SPBED";
			_vec addMagazine "EB_40Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addweapon "EB_RBK500_SPBED_Launcher";
		};
		if ( (_type == "FRL_Su30_RU_MR") || (_type == "FRL_Su30_RU_D_MR") || (_type == "FRL_Su30_INS_MR") || (_type == "FRL_Su30_CDF_MR") || (_type == "FRL_Su30_CDF_IND_MR") || (_type == "FRL_Su30_GUE_MR") || (_type == "FRL_Su30_TAK_MR") || (_type == "FRL_Su30_TK_INS_MR") || (_type == "FRL_Su30_TK_GUE_MR") || (_type == "FRL_Su30MKM_RU_MR") || (_type == "FRL_Su30MKM_RU_D_MR") || (_type == "FRL_Su30MKM_INS_MR") || (_type == "FRL_Su30MKM_CDF_MR") || (_type == "FRL_Su30MKM_CDF_IND_MR") || (_type == "FRL_Su30MKM_GUE_MR") || (_type == "FRL_Su30MKM_TAK_MR") || (_type == "FRL_Su30MKM_TK_INS_MR") || (_type == "FRL_Su30MKM_TK_GUE_MR") ) then 
		{
			_vec addMagazine "EB_150Rnd_30mm_GSh301";
			_vec addweapon "GSh301";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2Rnd_kab500KR";
			_vec addMagazine "EB_KH31x4";
			_vec addMagazine "EB_KH59x1";
			_vec addMagazine "EB_65Rnd_pylonblank";
			_vec addweapon "EB_R73_Launcher";
			_vec addweapon "EB_KH31_Launcher";
			_vec addweapon "EB_KH59_Launcher";
			_vec addweapon "EB_BombLauncher_kab500KR";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//BLUFOR ROTARY SEAD
		if(_type == "FRL_AH1Z_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_LAU59_70mmx7podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addMagazine "EB_AIM9Xx1";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH1W_MR") then 
		{
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addweapon "M197";
			_vec addMagazine "EB_38Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_16Rnd_pylonblank";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if(_type == "FRL_AH64D_MR") then 
		{
			_vec addMagazine "EB_1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addweapon "EB_CRV7_HEPD_Launcher";
			_vec addMagazine "EB_stingerpodx4";
			_vec addMagazine "EB_LAU68_70mmx19podx2";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addMagazine "EB_4Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_AH6J_MR") || (_type == "FRL_AH6J_MR_D") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
		};
		if ((_type == "FRL_AH6M_MR") || (_type == "FRL_AH6M_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};	
		if ( (_type == "FRL_Bo105pah_MR_DE") || (_type == "FRL_Bo105pah_MR_ACR") || (_type == "FRL_Bo105pah_MR_CDF") || (_type == "FRL_Bo105pah_MR_CDF_IND") || (_type == "FRL_Bo105pah_MR_GUE") || (_type == "FRL_Bo105pah_MR_INS") || (_type == "FRL_Bo105pah_MR_TAK") || (_type == "FRL_Bo105pah_MR_TK_GUE") || (_type == "FRL_Bo105pah_MR_TK_INS") ) then 
		{
			_vec addMagazine "EB_400Rnd_127x99_HMP250";
			_vec addweapon "EB_HMPx1";
			_vec addMagazine "EB_1Rnd_pylonblank";
			_vec addMagazine "EB_TOW_4rackx1";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_Lynx_MR") then 
		{
			_vec addMagazine "EB_360Rnd_20mm_HEI_M621";
			_vec addweapon "EB_TwinM621";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if(_type == "FRL_UH60M_MR") then 
		{
			_vec addMagazine "EB_8000Rnd_762x51_M134_twin";
			_vec addweapon "EB_TwinM134";
			_vec addMagazine "1200Rnd_30x113mm_M789_HEDP";
			_vec addweapon "M230";
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_2Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_12Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_MQ9_MR") || (_type == "FRL_MQ9_D_MR") ) then 
		{
			_vec addMagazine "EB_AGMrackx2x2";
			_vec addMagazine "EB_3Rnd_pylonblank";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_stingerpodx1";
			_vec addMagazine "EB_8Rnd_pylonblank";
			_vec addMagazine "EB_Stingerx4";
			_vec addweapon "EB_AIM92_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};		
//OPFOR ROTARY SEAD
		if ( (_type == "FRL_Mi24D_MR") || (_type == "FRL_Mi24D_CDF_MR") || (_type == "FRL_Mi24D_TK_MR") || (_type == "FRL_Mi24D_D_MR") ) then 
		{
			_vec addMagazine "EB_3000Rnd_127x108_QuadYakB";
			_vec addweapon "EB_YakB_quad";
			_vec addMagazine "EB_6000Rnd_762x54_GshG_quad";
			_vec addweapon "EB_GshG_quad";
			_vec addMagazine "EB_1470Rnd_127x108_YakB";
			_vec addweapon "YakB";
			_vec addMagazine "EB_AT2x2rackx2";
			_vec addMagazine "EB_4rnd_GUVMGpod";
			_vec addMagazine "EB_AT2x4";
			_vec addMagazine "EB_22Rnd_pylonblank";
			_vec addweapon "EB_AT2_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24V_MR") || (_type == "FRL_Mi24V_D_MR") || (_type == "FRL_Mi24V_CDF_MR") || (_type == "FRL_Mi24V_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_450Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if ( (_type == "FRL_Mi24P_MR") || (_type == "FRL_Mi24P_D_MR") || (_type == "FRL_Mi24P_CDF_MR") || (_type == "FRL_Mi24P_TK_MR") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_26Rnd_pylonblank";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";

		};
		if ( (_type == "FRL_Ka52_MR") || (_type == "FRL_Ka52_MR_D") ) then 
		{
			_vec addMagazine "EB_480Rnd_23mm_UPK2350";
			_vec addweapon "EB_UPK23x2";
			_vec addMagazine "EB_RU_300Rnd_30mm_HEI";
			_vec addMagazine "EB_RU_160Rnd_30mm_HET";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchpodx4";
			_vec addMagazine "EB_R73x2";
			_vec addMagazine "EB_2rnd_UPK2350pod";
			_vec addMagazine "EB_SA24x4";
			_vec addweapon "EB_SA24_Launcher";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
		if( (_type == "FRL_Mi28_MR") || (_type == "FRL_Mi28_INS_MR") || (_type == "FRL_Mi28D_TK_MR") || (_type == "FRL_Mi28NE_CDF_MR") ) then 
		{
			_vec addMagazine "EB_RU_250Rnd_30mm_HEI";
			_vec addweapon "EB_2A42";
			_vec addMagazine "EB_grinchrackx2x4";
			_vec addMagazine "EB_SA24x8";
			_vec addweapon "EB_SA24_Launcher";
			_vec addMagazine "LaserBatteries";
			_vec addweapon "LaserDesignator_mounted";
		};
//edit?
		if(_type == "FRL_Mi8_TBK_RUS_MR") then {};
		if(_type == "FRL_Mi17_TVK_TAK_MR") then {}; 
		if(_type == "FRL_Mi8_AMTSh_MR") then {}; 
		if(_type == "FRL_Mi8_MTV3_RUS_MR") then {}; 
		if(_type == "FRL_Mi8_MTKO_RUS_MR") then {}; 
//stock
		if(_type == "C130J") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_5Rnd_CBU78B";
			_vec addweapon "EB_CBU78B_Launcher";
			_vec addMagazine "EB_5Rnd_CBU89B";
			_vec addweapon "EB_CBU89B_Launcher";
			_vec addMagazine "EB_5Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "EB_5Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addMagazine "EB_AIM7Ex2";
			_vec addweapon "EB_AIM7E_Launcher";
			_vec addMagazine "pook_6Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
		};
		if(_type == "C130J_US_EP1") then 
		{
			_vec addMagazine "EB_1030Rnd_M61_HEI";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_2Rnd_CBU78B";
			_vec addweapon "EB_CBU78B_Launcher";
			_vec addMagazine "EB_2Rnd_CBU89B";
			_vec addweapon "EB_CBU89B_Launcher";
			_vec addMagazine "EB_12Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "EB_4Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addMagazine "EB_AIM9Xx4";
			_vec addweapon "EB_AIM9X_Launcher";
			_vec addMagazine "pook_6Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
		};
		if(_type == "An2_2_TK_CIV_EP1") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
//mod planes
		if(_type == "ibr_viggen1") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "ibr_viggen_arak135_12Rnd";
			_vec addweapon "ibr_viggen_arak135Launcher";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "ibr_viggen_rocketlauncherpods_2Rnd";
		};
		if(_type == "ibr_maule_M7") then 
		{
			_vec addMagazine "500Rnd_TwinVickers";
			_vec addweapon "TwinVickers";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
			_vec addMagazine "6Rnd_Grenade_Camel";
			_vec addweapon "CamelGrenades";
		};
		if(_type == "ibr_tucano_lin") then 
		{
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";
			_vec addMagazine "EB_14Rnd_FFAR";
			_vec addweapon "EB_FFAR_Launcher";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
		};
		if(_type == "ibrPRACS_MiG21_AGgal") then 
		{
			_vec addMagazine "EB_200Rnd_23mm_GP9";
			_vec addweapon "EB_GP9";
			_vec addMagazine "32Rnd_57mm";
			_vec addweapon "UB32Launcher";
			_vec addMagazine "EB_2Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addMagazine "pook_4Rnd_BetAB500";
			_vec addweapon "pook_BetAB_BombLauncher";
		};
//gnat
		if(_type == "RKTSU33AG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "2Rnd_RKTR27";
			_vec addweapon "RKTR27Launcher";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_10Rnd_S13OF";
			_vec addMagazine "EB_10Rnd_S13D";
			_vec addweapon "EB_130mm_Launcher";
			_vec addMagazine "pook_4Rnd_BetAB500";
			_vec addweapon "pook_BetAB_BombLauncher";
		};
		if(_type == "RKTSU33TAG") then 
		{
			_vec addMagazine "750Rnd_30mm_GSh301";
			_vec addweapon "GSh302";
			_vec addMagazine "EB_R73x2";
			_vec addweapon "EB_R73_Launcher";
			_vec addMagazine "EB_R60x4";
			_vec addweapon "EB_R60_Launcher";
			_vec addMagazine "EB_40Rnd_80mm_lsr";
			_vec addweapon "EB_80mmL_Launcher";
			_vec addMagazine "EB_2Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
		};
//F14/F18
		if(_type == "IkaR_F14_AIM_54") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
			_vec addMagazine "EB_4Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
		};
		if(_type == "IkaR_F14_AGM_65") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addweapon "EB_FFARL_Launcher";
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
		};
		if(_type == "JS_FA18E") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addMagazine "js_m_fa18_Harpoon_x1";
			_vec addweapon "js_w_fa18_HarpoonLauncher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_wing_tank_x2";
//body
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
//inner rack
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
			_vec addMagazine "js_m_fa18_fake_empty";
//mid rack
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_1Rnd_CBU100";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addweapon "EB_CBU100_Launcher";
			_vec addweapon "EB_CBU87B_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_altflir_pod_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";

		};
		if(_type == "JS_FA18F") then 
		{
			_vec addweapon "js_w_master_arms_safe";
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
//wingtip
			_vec addMagazine "EB_AIM9Xx2";
			_vec addweapon "EB_AIM9X_Launcher";
//outer
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
//mid
			_vec addMagazine "js_m_fa18_bombrack_x2";
//inner
			_vec addMagazine "js_m_fa18_bombrack_x2";
//body
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
//inner rack
			_vec addMagazine "EB_4Rnd_CBU100";
			_vec addweapon "EB_CBU100_Launcher";
//mid rack
			_vec addMagazine "EB_1Rnd_CBU78B";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addMagazine "EB_1Rnd_CBU89B";
			_vec addMagazine "EB_1Rnd_CBU87B";
			_vec addweapon "EB_CBU87B_Launcher";
			_vec addweapon "EB_CBU78B_Launcher";
			_vec addweapon "EB_CBU89B_Launcher";
//centre body
			_vec addMagazine "js_m_fa18_wing_tank_x1";
			_vec addweapon "js_w_fa18_fueltank_holder";
		};
//f22
		if(_type == "3lb_f22") then 
		{
			_vec addMagazine "EB_515Rnd_M61";
			_vec addweapon "EB_M61A1";
			_vec addMagazine "EB_AIM9Mx2";
			_vec addweapon "EB_AIM9M_Launcher";
			_vec addMagazine "EB_AGM88x2";
			_vec addweapon "EB_AGM88_Launcher";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
			_vec addMagazine "GLT_2Rnd_AGM154A";
			_vec addweapon "GLT_AGM154A_Launcher";
			_vec addMagazine "EB_12Rnd_pylonblank";
		};

	};
  };
  _vec addMagazine "120Rnd_CMFlare_Chaff_Magazine";
_vec addweapon "CMFlareLauncher";
player selectWeapon "CMFlareLauncher";
_muzzles = getArray(configFile>>"cfgWeapons" >> "CMFlareLauncher" >> "muzzles");
player selectWeapon (_muzzles select 0);


/*


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

//pods
			_vec addMagazine "EB_ALQ131";

			_vec addMagazine "EB_LAU5003_70mmx19podx1";
			_vec addMagazine "EB_LAU5003_70mmx19podx2";
			_vec addMagazine "EB_TOW_4rackx1";
			_vec addMagazine "EB_TOW_4rackx2";

			_vec addMagazine "EB_S8podx2";
			_vec addMagazine "EB_S8podx1";
			_vec addMagazine "EB_S8pod_helix2";
			_vec addMagazine "EB_S8pod_helix1";
			_vec addMagazine "EB_S5_ub16_podx2";
			_vec addMagazine "EB_S5_ub16_podx1";
			_vec addMagazine "EB_S5_ub32_podx2";
			_vec addMagazine "EB_S5_ub32_podx1";

//fails
//			_vec addMagazine "EB_70mmpodx2";
//			_vec addMagazine "EB_TOW_podx2";

			_vec addMagazine "EB_TOW_pod2x2";
			_vec addMagazine "EB_TOW_pod2x1";
			_vec addMagazine "EB_TOW_pod2x4";
			_vec addMagazine "EB_TOW_pod2x8";

			_vec addMagazine "EB_strelapodx2";
			_vec addMagazine "EB_strelapodx4";

			_vec addMagazine "EB_iglapodx2";

			_vec addMagazine "EB_stingerpodx2";

Guns

			_vec addMagazine "750Rnd_M197_AH1";
			_vec addMagazine "EB_700Rnd_M197_HEI";
			_vec addMagazine "EB_700Rnd_M197_API";
			_vec addweapon "M197";

			_vec addMagazine "EB_350Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_650Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_950Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_1174Rnd_30mmAP_GAU8";
			_vec addMagazine "EB_1350Rnd_30mmAP_GAU8";
			_vec addweapon "EB_GAU8";

			_vec addMagazine "EB_220Rnd_25mm_GAU12";
			_vec addMagazine "EB_300Rnd_25mm_GAU12_API";
			_vec addMagazine "EB_660Rnd_25mm_GAU12";
			_vec addMagazine "EB_880Rnd_25mm_GAU12";
			_vec addweapon "EB_GAU12";

			_vec addMagazine "EB_180Rnd_25mm_GAU22";
			_vec addMagazine "EB_320Rnd_25mm_GAU22";
			_vec addMagazine "EB_640Rnd_25mm_GAU22";
			_vec addMagazine "EB_960Rnd_25mm_GAU22";
			_vec addMagazine "EB_1280Rnd_25mm_GAU22";
			_vec addMagazine "EB_180Rnd_25mm_GAU22_API";
			_vec addMagazine "EB_320Rnd_25mm_GAU22_API";
			_vec addMagazine "EB_640Rnd_25mm_GAU22_API";
			_vec addMagazine "EB_960Rnd_25mm_GAU22_API";
			_vec addMagazine "EB_1280Rnd_25mm_GAU22_API";
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
			_vec addMagazine "pook_smoke_14Rnd_FFAR";
			_vec addMagazine "pook_smoke_19Rnd_FFAR";
			_vec addMagazine "pook_smoke_28Rnd_FFAR";
			_vec addMagazine "pook_smoke_38Rnd_FFAR";
			_vec addMagazine "pook_smoke_56Rnd_FFAR";
			_vec addMagazine "pook_smoke_76Rnd_FFAR";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_purple";
			_vec addweapon "EB_FFAR_Launcher";

			_vec addMagazine "EB_14Rnd_FFARL";
			_vec addMagazine "EB_28Rnd_FFARL";
			_vec addMagazine "EB_38Rnd_FFARL";
			_vec addMagazine "EB_56Rnd_FFARL";
			_vec addMagazine "EB_76Rnd_FFARL";
			_vec addMagazine "EB_84Rnd_FFARL";
			_vec addMagazine "EB_114Rnd_FFARL";
			_vec addMagazine "pook_smoke_14Rnd_FFAR";
			_vec addMagazine "pook_smoke_19Rnd_FFAR";
			_vec addMagazine "pook_smoke_28Rnd_FFAR";
			_vec addMagazine "pook_smoke_38Rnd_FFAR";
			_vec addMagazine "pook_smoke_56Rnd_FFAR";
			_vec addMagazine "pook_smoke_76Rnd_FFAR";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_purple";
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
			_vec addMagazine "pook_smoke_14Rnd_FFAR";
			_vec addMagazine "pook_smoke_19Rnd_FFAR";
			_vec addMagazine "pook_smoke_28Rnd_FFAR";
			_vec addMagazine "pook_smoke_38Rnd_FFAR";
			_vec addMagazine "pook_smoke_56Rnd_FFAR";
			_vec addMagazine "pook_smoke_76Rnd_FFAR";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_purple";
			_vec addweapon "EB_CRV7_FAT_Launcher";

			_vec addMagazine "EB_12Rnd_CRV7_HEPD";
			_vec addMagazine "EB_19Rnd_CRV7_HEPD";
			_vec addMagazine "EB_24Rnd_CRV7_HEPD";
			_vec addMagazine "EB_38Rnd_CRV7_HEPD";
			_vec addMagazine "EB_48Rnd_CRV7_HEPD";
			_vec addMagazine "EB_76Rnd_CRV7_HEPD";
			_vec addMagazine "pook_smoke_14Rnd_FFAR";
			_vec addMagazine "pook_smoke_19Rnd_FFAR";
			_vec addMagazine "pook_smoke_28Rnd_FFAR";
			_vec addMagazine "pook_smoke_38Rnd_FFAR";
			_vec addMagazine "pook_smoke_56Rnd_FFAR";
			_vec addMagazine "pook_smoke_76Rnd_FFAR";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_yellow";
			_vec addMagazine "pook_smoke_14Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_19Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_28Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_38Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_56Rnd_FFAR_purple";
			_vec addMagazine "pook_smoke_76Rnd_FFAR_purple";
			_vec addweapon "EB_CRV7_HEPD_Launcher";

			_vec addMagazine "EB_192Rnd_57mm";
			_vec addMagazine "EB_128Rnd_57mm";
			_vec addMagazine "EB_64Rnd_57mm";
			_vec addMagazine "EB_32Rnd_57mm";
			_vec addMagazine "EB_16Rnd_57mm";
			_vec addMagazine "pook_smoke_16Rnd_57mm";
			_vec addMagazine "pook_smoke_32Rnd_57mm";
			_vec addMagazine "pook_smoke_64Rnd_57mm";
			_vec addMagazine "pook_smoke_16Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_32Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_64Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_16Rnd_57mm_purple";
			_vec addMagazine "pook_smoke_32Rnd_57mm_purple";
			_vec addMagazine "pook_smoke_64Rnd_57mm_purple";
			_vec addweapon "EB_57mm_Launcher";

			_vec addMagazine "EB_192Rnd_57mmL";
			_vec addMagazine "EB_128Rnd_57mmL";
			_vec addMagazine "EB_64Rnd_57mmL";
			_vec addMagazine "EB_32Rnd_57mmL";
			_vec addMagazine "EB_16Rnd_57mmL";
			_vec addMagazine "pook_smoke_16Rnd_57mm";
			_vec addMagazine "pook_smoke_32Rnd_57mm";
			_vec addMagazine "pook_smoke_64Rnd_57mm";
			_vec addMagazine "pook_smoke_16Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_32Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_64Rnd_57mm_yellow";
			_vec addMagazine "pook_smoke_16Rnd_57mm_purple";
			_vec addMagazine "pook_smoke_32Rnd_57mm_purple";
			_vec addMagazine "pook_smoke_64Rnd_57mm_purple";
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
			_vec addMagazine "pook_smoke_20Rnd_80mm";
			_vec addMagazine "pook_smoke_40Rnd_80mm";
			_vec addMagazine "pook_smoke_80Rnd_80mm";
			_vec addMagazine "pook_smoke_20Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_40Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_80Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_20Rnd_80mm_purple";
			_vec addMagazine "pook_smoke_40Rnd_80mm_purple";
			_vec addMagazine "pook_smoke_80Rnd_80mm_purple";
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
			_vec addMagazine "pook_smoke_20Rnd_80mm";
			_vec addMagazine "pook_smoke_40Rnd_80mm";
			_vec addMagazine "pook_smoke_80Rnd_80mm";
			_vec addMagazine "pook_smoke_20Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_40Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_80Rnd_80mm_yellow";
			_vec addMagazine "pook_smoke_20Rnd_80mm_purple";
			_vec addMagazine "pook_smoke_40Rnd_80mm_purple";
			_vec addMagazine "pook_smoke_80Rnd_80mm_purple";
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
			_vec addMagazine "EB_AT16x16";
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

			_vec addMagazine "EB_1Rnd_Mk770";
			_vec addMagazine "EB_2Rnd_Mk770";
			_vec addMagazine "EB_3Rnd_Mk770";
			_vec addMagazine "EB_4Rnd_Mk770";
			_vec addMagazine "EB_5Rnd_Mk770";
			_vec addMagazine "EB_6Rnd_Mk770";
			_vec addMagazine "EB_7Rnd_Mk770";
			_vec addMagazine "EB_8Rnd_Mk770";
			_vec addMagazine "EB_9Rnd_Mk770";
			_vec addMagazine "EB_10Rnd_Mk770";
			_vec addMagazine "EB_11Rnd_Mk770";
			_vec addMagazine "EB_12Rnd_Mk770";
			_vec addweapon "EB_Mk770_Launcher";

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

Runway busters

			_vec addMagazine "pook_1Rnd_BetAB500";
			_vec addMagazine "pook_2Rnd_BetAB500";
			_vec addMagazine "pook_3Rnd_BetAB500";
			_vec addMagazine "pook_4Rnd_BetAB500";
			_vec addMagazine "pook_5Rnd_BetAB500";
			_vec addMagazine "pook_6Rnd_BetAB500";
			_vec addweapon "pook_BetAB_BombLauncher";

			_vec addMagazine "pook_1Rnd_BLU107";
			_vec addMagazine "pook_2Rnd_BLU107";
			_vec addMagazine "pook_3Rnd_BLU107";
			_vec addMagazine "pook_4Rnd_BLU107";
			_vec addMagazine "pook_5Rnd_BLU107";
			_vec addMagazine "pook_6Rnd_BLU107";
			_vec addweapon "pook_BLU107_BombLauncher";
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


//mod stuff

//tucano_lin
			_vec addMagazine "250Rnd_127x99_M3P";
			_vec addweapon "M3P";

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

//stock weapons

			_vec addMagazine "400Rnd_30mm_AGS17";
			_vec addweapon "AGS17";

			_vec addMagazine "29Rnd_30mm_AGS30";
			_vec addweapon "AGS30";

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

//500lb
			_vec addMagazine "js_m_fa18_GBU12_x1";
			_vec addMagazine "js_m_fa18_GBU12_x4";
			_vec addweapon "js_w_fa18_GBU12LGBLaucher";

//mk82 500lb
			_vec addMagazine "js_m_fa18_GBU38_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU38BombLauncher";
//mk83 1,000lb
			_vec addMagazine "js_m_fa18_GBU32_JDAM_x1";
			_vec addweapon "js_w_fa18_GBU32BombLauncher";
//mk84 2,000lb
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


BIS_EVO_ResetClick =
{
	onMapSingleClick "if (_alt and debug) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
};

BIS_EVO_AmmoBoxR = // Creates and fills local rank based ammo box of Russian Weapons
{
	_rank = _this select 0;

//unranked russian ammo box

	_FillAmmoBoxR =
	{
		_vecRu = _this select 0;
		clearWeaponCargo _vecRu;
		clearMagazineCargo _vecRu;

		_vecRu addweaponCargo ["ItemCompass",2];	
		_vecRu addweaponCargo ["ItemGPS",2];	
		_vecRu addweaponCargo ["ItemMap",2];	
		_vecRu addweaponCargo ["ItemRadio",2];	
		_vecRu addweaponCargo ["ItemWatch",2];	
		_vecRu addWeaponCargo ["Binocular",2];
		_vecRu addWeaponCargo ["Binocular_Vector",2];
		_vecRu addWeaponCargo ["NVGoggles",2];
		_vecRu addWeaponCargo ["Laserdesignator",2];

//HEAVY WEAPONS
		_vecRu addWeaponCargo ["Strela",12];
		_vecRu addWeaponCargo ["Igla",12];
		_vecRu addWeaponCargo ["RPG7V",12];
		_vecRu addWeaponCargo ["RPG18",12];
		_vecRu addWeaponCargo ["MetisLauncher",12];

//PISTOLS
		_vecRu AddWeaponCargo ["Makarov",12];
//		_vecRu AddWeaponCargo ["MakarovSD",12];
		_vecRu AddWeaponCargo ["revolver_gold_EP1",12];
		_vecRu AddWeaponCargo ["Sa61_EP1",12];

/*
		_vecRu AddWeaponCargo ["RH_vz61",12];
		_vecRu AddWeaponCargo ["RH_tt33",12];
		_vecRu AddWeaponCargo ["RH_pm",12];
//		_vecRu AddWeaponCargo ["RH_pmsd",12];
		_vecRu AddWeaponCargo ["RH_aps",12];
//		_vecRu AddWeaponCargo ["RH_apssd",12];
*/
		_vecRu AddWeaponCargo ["Sa61_EP1",12];
		_vecRu AddWeaponCargo ["UZI_EP1",12];
//		_vecRu AddWeaponCargo ["UZI_SD_EP1",12];

//SMG
		_vecRu AddWeaponCargo ["AKS_74_U",12];
//		_vecRu AddWeaponCargo ["AKS_74_UN_kobra",12];
		_vecRu AddWeaponCargo ["bizon",12];
//		_vecRu AddWeaponCargo ["bizon_silenced",12];
		_vecRu AddWeaponCargo ["Saiga12K",12];

/*
		_vecRu AddWeaponCargo ["RH_bizon",12];
//		_vecRu AddWeaponCargo ["RH_bizonsd",12];
		_vecRu AddWeaponCargo ["RH_bizonsdk",12];
		_vecRu AddWeaponCargo ["RH_gr1sp",12];
//		_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
		_vecRu AddWeaponCargo ["RH_asval",12];
		_vecRu AddWeaponCargo ["RH_asvalk",12];
*/

//CARBINES
		_vecRu AddWeaponCargo ["AK_47_M",12];
		_vecRu AddWeaponCargo ["AK_47_S",12];
		_vecRu AddWeaponCargo ["Sa58P_EP1",12];
		_vecRu AddWeaponCargo ["Sa58V_CCO_EP1",12];
		_vecRu AddWeaponCargo ["Sa58V_EP1",12];
		_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];

		_vecRu AddWeaponCargo ["AKS_GOLD", 12];
		_vecRu AddWeaponCargo ["AK_74",12];
		_vecRu AddWeaponCargo ["AKS_74_kobra",12];
		_vecRu AddWeaponCargo ["AK_107_kobra",12];

/*
		_vecRu AddWeaponCargo ["RH_akms",12];
//		_vecRu AddWeaponCargo ["RH_akmssd",12];
		_vecRu AddWeaponCargo ["RH_ak103",12];
		_vecRu AddWeaponCargo ["RH_ak104k",12];
		_vecRu AddWeaponCargo ["RH_ak105sp",12];
		_vecRu AddWeaponCargo ["RH_ak107_1p29",12];
		_vecRu AddWeaponCargo ["RH_oc14sp",12];
//		_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
		_vecRu AddWeaponCargo ["RH_rk95aim",12];
//		_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
		_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
		_vecRu addWeaponCargo ["RH_SCARAKACOG",12];
*/

//GL
		_vecRu AddWeaponCargo ["AK_74_GL",12];
		_vecRu AddWeaponCargo ["AK_107_GL_pso",12];
		_vecRu AddWeaponCargo ["AK_107_GL_kobra",12];
		_vecRu AddWeaponCargo ["AK_74_GL_kobra",12];

/*
		_vecRu AddWeaponCargo ["RH_an94gl",12];
		_vecRu AddWeaponCargo ["RH_aks74upt",12];
		_vecRu AddWeaponCargo ["RH_aks74uptsp",12];
		_vecRu AddWeaponCargo ["RH_aks74uptk",12];
		_vecRu AddWeaponCargo ["RH_ak74mkgl",12];
		_vecRu AddWeaponCargo ["RH_aks74mglsp",12];
		_vecRu AddWeaponCargo ["RH_ak104gl",12];
		_vecRu AddWeaponCargo ["RH_ak105kgl",12];
*/

		_vecRu AddWeaponCargo ["EB_DP28",12];
//SNIPER
		_vecRu AddWeaponCargo ["AKS_74_pso",12];
		_vecRu AddWeaponCargo ["AK_107_pso",12];
		_vecRu AddWeaponCargo ["ksvk",12];
		_vecRu AddWeaponCargo ["EB_OSV96",12];
		_vecRu addWeaponCargo ["SVD",12];
		_vecRu AddWeaponCargo ["SVD_CAMO",12];
		_vecRu AddWeaponCargo ["VSS_vintorez",12];
		_vecRu AddWeaponCargo ["SVD_des_EP1",12];
		_vecRu AddWeaponCargo ["SVD_NSPU_EP1",12];
		_vecRu AddWeaponCargo ["AKS_74_GOSHAWK",12];
		_vecRu AddWeaponCargo ["AKS_74_NSPU",12];

/*
		_vecRu AddWeaponCargo ["RH_asvalsp",12];
		_vecRu AddWeaponCargo ["RH_svu",12];
*/

//MG
		_vecRu AddWeaponCargo ["PK",12];
		_vecRu AddWeaponCargo ["RPK_74",12];
		_vecRu AddWeaponCargo ["Pecheneg",12];

/*
		_vecRu AddWeaponCargo ["RH_rpk74m1p29",12];
*/

//new stuff
/*
		_vecRu addWeaponCargo ["AEK_971",12];
		_vecRu addWeaponCargo ["AEK_971_1p78",12];
		_vecRu addWeaponCargo ["AEK_971_1p63",12];
		_vecRu addWeaponCargo ["AEK_971_gp",12];
		_vecRu addWeaponCargo ["AEK_971_gp_1p63",12];
		_vecRu addWeaponCargo ["AEK_971_1pn100",12];
		_vecRu addWeaponCargo ["AEK_971_tgp_cln",12];
		_vecRu addWeaponCargo ["AEK_971_shahin",12];
		_vecRu addWeaponCargo ["AEK_973s",12];
		_vecRu addWeaponCargo ["AEK_973s_1p78",12];
		_vecRu addWeaponCargo ["AEK_973s_1p63",12];
		_vecRu addWeaponCargo ["AEK_973s_gp",12];
		_vecRu addWeaponCargo ["AEK_973s_gp_1p63",12];
		_vecRu addWeaponCargo ["AEK_973s_1pn100",12];
		_vecRu addWeaponCargo ["AEK_973s_tgp_cln",12];
		_vecRu addWeaponCargo ["AEK_973s_shahin",12];
*/
/*
		_vecRu AddWeaponCargo ["rhs_weap_pya",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
//		_vecRu addWeaponCargo ["rhs_weap_ak74m_desert",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag_camo",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_s",12];
		_vecRu addWeaponCargo ["rhs_weap_ak74m_s_gp25",12];
*/
/*
//		_vecRu addWeaponCargo ["SUD_AK74m",12];
		_vecRu addWeaponCargo ["SUD_AK74m_F",12];
		_vecRu addWeaponCargo ["SUD_AK74m_TB",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_GL",12];
		_vecRu addWeaponCargo ["SUD_AK74m_GL_F",12];
		_vecRu addWeaponCargo ["SUD_AK74m_GL_TB",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_C",12];
		_vecRu addWeaponCargo ["SUD_AK74m_F_C",12];
		_vecRu addWeaponCargo ["SUD_AK74m_TB_C",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_GL_C",12];
		_vecRu addWeaponCargo ["SUD_AK74m_GL_F_C",12];
		_vecRu addWeaponCargo ["SUD_AK74m_GL_TB_C",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_1p78",12];
		_vecRu addWeaponCargo ["SUD_AK74m_F_1p78",12];
		_vecRu addWeaponCargo ["SUD_AK74m_tb_1p78",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_gl_1p78",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_f_1p78",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_1p78",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_pso",12];
		_vecRu addWeaponCargo ["SUD_AK74m_F_pso",12];
		_vecRu addWeaponCargo ["SUD_AK74m_tb_pso",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_gl_pso",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_f_pso",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_pso",12];
		_vecRu addWeaponCargo ["SUD_AK74m_n",12];
		_vecRu addWeaponCargo ["SUD_AK74m_F_n",12];
		_vecRu addWeaponCargo ["SUD_AK74m_tb_n",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_gl_n",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_f_n",12];
		_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_n",12];

//		_vecRu addWeaponCargo ["SUD_AK74m_s",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_tb",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_c",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_f_c",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_tb_c",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_1p78",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_f_1p78",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_tb_1p78",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_pso",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_f_pso",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_tb_pso",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_n",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_f_n",12];
//		_vecRu addWeaponCargo ["SUD_AK74m_s_tb_n",12];
//be careful
//		_vecRu addWeaponCargo ["SG_KRINKOV",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_SD",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_AIM",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_AIM_SD",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_C",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_SD_C",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_AIM_C",12];
//		_vecRu addWeaponCargo ["SG_KRINKOV_AIM_SD_C",12];
//		_vecRu addWeaponCargo ["Da_MagpulAK",12];
//		_vecRu addWeaponCargo ["VityazKN",12];
//		_vecRu addWeaponCargo ["VityazSN",12];
//ammo 
//new ammo
//		_vecRu addMagazineCargo ["30Rnd_545x39_AK_7N24",12];
//		_vecRu addMagazineCargo ["30rnd_9x19_VityazSN_tracer",12];
//		_vecRu addMagazineCargo ["30rnd_9x19_VityazSn",12];
//		_vecRu addMagazineCargo ["rhs_mag_9x19_17",12];
*/

//ammo 
		_vecRu addWeaponCargo ["huntingrifle",12];
		_vecRu addWeaponCargo ["Binocular",12];
		_vecRu addWeaponCargo ["Binocular_Vector",12];
		_vecRu addWeaponCargo ["NVGoggles",12];
		_vecRu addWeaponCargo ["Laserdesignator",12];
		_vecRu addMagazineCargo ["Laserbatteries",12];
//		_vecRu addMagazineCargo ["HandGrenade_East",12];

		_vecRu addMagazineCargo ["pipebomb",12];
		_vecRu addMagazineCargo ["MineE",12];
		_vecRu addMagazineCargo ["OG7",12];
		_vecRu addMagazineCargo ["PG7V",12];
		_vecRu addMagazineCargo ["PG7VR",12];
		_vecRu addMagazineCargo ["PG7VL",12];
		_vecRu addMagazineCargo ["RPG18",12];
		_vecRu addMagazineCargo ["AT13",12];
		_vecRu addMagazineCargo ["Strela",12];
		_vecRu addMagazineCargo ["Igla",12];

		_vecRu addmagazinecargo ["8Rnd_9x18_Makarov",12];
		_vecRu addmagazinecargo ["8Rnd_9x18_MakarovSD",12];
		_vecRu addMagazineCargo ["6Rnd_45ACP",12];

/*
		_vecRu addMagazineCargo ["RH_20Rnd_9x18_aps",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x18_apssd",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x39_val_mag",12];
		_vecRu addMagazineCargo ["RH_30Rnd_762x39_SDmag",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x39_SP6SD_mag",12];
		_vecRu addMagazineCargo ["RH_1Rnd_30mm",12];
		_vecRu addMagazineCargo ["RH_45Rnd_545x39_mag",12];
		_vecRu addMagazineCargo ["RH_8Rnd_762_tt33",12];
		_vecRu addMagazineCargo ["RH_20Rnd_32cal_vz61",12];
*/

		_vecRu addMagazineCargo ["10x_303",12];
		_vecRu addMagazineCargo ["30Rnd_9x19_UZI",12];
		_vecRu addMagazineCargo ["30Rnd_9x19_UZI_SD",12];
		_vecRu addMagazineCargo ["20Rnd_762x51_FNFAL",12];

		_vecRu AddMagazineCargo ["30Rnd_762x39_SA58",12];
		_vecRu addmagazinecargo ["30Rnd_762x39_AK47",12];
		_vecRu addmagazinecargo ["30Rnd_545x39_AK",12];
		_vecRu addmagazinecargo ["30Rnd_545x39_AKSD",12];
		_vecRu addmagazinecargo ["64Rnd_9x19_Bizon",12];
		_vecRu addmagazinecargo ["64Rnd_9x19_SD_Bizon",12];
		_vecRu addmagazinecargo ["8Rnd_B_Saiga12_74Slug",12];
		_vecRu addmagazinecargo ["8Rnd_B_Saiga12_Pellets",12];

		_vecRu addmagazinecargo ["75Rnd_545x39_RPK",12];
		_vecRu addmagazinecargo ["100Rnd_762x54_PK",12];

		_vecRu addmagazinecargo ["EB_47Rnd_DP28",12];
		_vecRu addmagazinecargo ["5Rnd_127x108_KSVK",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_T",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_NT",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_HEI",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_API",12];
		_vecRu addmagazinecargo ["10Rnd_762x54_SVD",12];
		_vecRu addmagazinecargo ["20Rnd_9x39_SP5_VSS",12];
		_vecRu addmagazinecargo ["10Rnd_9x39_SP5_VSS",12];
		_vecRu addMagazineCargo ["EB_5Rnd_762x51_CZ550_p",12];
		_vecRu addMagazineCargo ["5x_22_LR_17_HMR",12];
		_vecRu addMagazineCargo ["20Rnd_B_765x17_Ball",12];

		if (gitsnades == 1) then
		{
//new weapons
			_vecRu AddWeaponCargo ["EB_svd",2];
			_vecRu addmagazinecargo ["EB_10Rnd_svd",12];
			_vecRu addmagazinecargo ["EB_20Rnd_svd",12];
			_vecRu addmagazinecargo ["EB_10Rnd_svd_T",12];
			_vecRu addmagazinecargo ["EB_20Rnd_svd_T",12];
			_vecRu addMagazineCargo ["EB_t67gren",12];
			_vecRu addMagazineCargo ["EB_rkg3gren",12];
			_vecRu addMagazineCargo ["EB_rdg2",12];
			_vecRu addMagazineCargo ["EB_rdg3",12];
			_vecRu addMagazineCargo ["EB_f1gren",12];
			_vecRu addMagazineCargo ["EB_rg42gren",12];
			_vecRu addMagazineCargo ["EB_rgd5gren",12];
			_vecRu addMagazineCargo ["EB_rgd33gren",12];
//new GL AMMO
			_vecRu AddWeaponCargo ["EB_TIscanner",2];
			_vecRu AddWeaponCargo ["EB_TIGoggles",2];
			_vecRu AddWeaponCargo ["EB_S10",2];
			_vecRu addmagazinecargo ["EB_knife",12];
			_vecRu addmagazinecargo ["EB_kabar",12];
			_vecRu addmagazinecargo ["EB_ItemFuelcanEmpty",12];
			_vecRu addmagazinecargo ["EB_ItemRepairKit",12];
			_vecRu AddWeaponCargo ["EB_ItemSiphon",2]; //EB_ItemRepairKit
			_vecRu AddWeaponCargo ["EB_ItemSil_hgun",12];
			_vecRu AddWeaponCargo ["EB_ItemSil_rifle",12];
			_vecRu addMagazineCargo ["EB_SmokeShellChem",12];
			_vecRu addMagazineCargo ["1Rnd_Chem_GP25",12];
			_vecRu addMagazineCargo ["1Rnd_Buckshot_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Chem_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Buckshot_GP25",12];
			_vecRu addMagazineCargo ["LWS_Laserbatteries",12];
			_vecRu addMagazineCargo ["5Rnd_HE_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_HEDP_M203",12];
			_vecRu addMagazineCargo ["5Rnd_FlareWhite_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareGreen_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareRed_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareYellow_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Smoke_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeRed_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeGreen_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeYellow_GP25",12];
		};
//old GL ammo
			_vecRu addMagazineCargo ["1rnd_HE_GP25",12];
			_vecRu addMagazineCargo ["FlareWhite_GP25",12];
			_vecRu addMagazineCargo ["FlareRed_GP25",12];
			_vecRu addMagazineCargo ["FlareGreen_GP25",12];
			_vecRu addMagazineCargo ["FlareYellow_GP25",12];
			_vecRu addMagazineCargo ["SmokeShell",12];
			_vecRu addMagazineCargo ["SmokeShellRed",12];
			_vecRu addMagazineCargo ["SmokeShellGreen",12];
			_vecRu addMagazineCargo ["SmokeShellYellow",12];
			_vecRu addMagazineCargo ["SmokeShellPurple",12];
			_vecRu addMagazineCargo ["SmokeShellBlue",12];
			_vecRu addMagazineCargo ["SmokeShellOrange",12];
//added
		Sleep 1.0;
	};

//ranked russian ammo box

	_FillAmmoBoxRR =
	{
		_vecRu = _this select 0;
		_playertype = typeOf (vehicle player);
		clearWeaponCargo _vecRu;
		clearMagazineCargo _vecRu;

		_vecRu addWeaponCargo ["huntingrifle",12];
		_vecRu addweaponCargo ["ItemCompass",2];	
		_vecRu addweaponCargo ["ItemGPS",2];	
		_vecRu addweaponCargo ["ItemMap",2];	
		_vecRu addweaponCargo ["ItemRadio",2];	
		_vecRu addweaponCargo ["ItemWatch",2];	
		switch (_rank) do
		{
			 case 0:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
//new
/*
				_vecRu AddWeaponCargo ["rhs_weap_pya",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
*/
/*
				_vecRu addWeaponCargo ["SUD_AK74m",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s",12];
				_vecRu addWeaponCargo ["AEK_971",12];
//RH
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
*/
			};

			 case 1:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];

//RH
/*
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
*/
//new
/*
				_vecRu AddWeaponCargo ["rhs_weap_pya",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
*/
/*
				_vecRu addWeaponCargo ["SUD_AK74m",12];
				_vecRu addWeaponCargo ["SUD_AK74m_GL",12];
				_vecRu addWeaponCargo ["SUD_AK74m_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s",12];
				_vecRu addWeaponCargo ["AEK_971",12];
				_vecRu addWeaponCargo ["AEK_971_1p78",12];
*/
			};
			 case 2:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu AddWeaponCargo ["MakarovSD",12];
				_vecRu addWeaponCargo ["RPG7V",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AKS_74_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_kobra",12];
				_vecRu AddWeaponCargo ["bizon",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["AK_107_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["EB_OSV96",12];
				_vecRu addWeaponCargo ["SVD",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];
//RH
/*
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_aps",12];
				_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
				_vecRu AddWeaponCargo ["RH_akmssd",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
				_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
				_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
*/
	//new
/*
				_vecRu AddWeaponCargo ["rhs_weap_pya",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
*/
/*
				_vecRu addWeaponCargo ["SUD_AK74m",12];
				_vecRu addWeaponCargo ["SUD_AK74m_GL",12];
				_vecRu addWeaponCargo ["SUD_AK74m_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_pso",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_c",12];
				_vecRu addWeaponCargo ["AEK_971",12];
				_vecRu addWeaponCargo ["AEK_971_1p78",12];
				_vecRu addWeaponCargo ["AEK_971_1p63",12];
				_vecRu addWeaponCargo ["AEK_973s",12];
*/
			};
			 case 3:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu AddWeaponCargo ["MakarovSD",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["RPG7V",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu addWeaponCargo ["Igla",12];
				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_CCO_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AKS_74_UN_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_kobra",12];
				_vecRu AddWeaponCargo ["bizon",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["AK_107_GL_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["AK_107_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["EB_OSV96",12];
				_vecRu addWeaponCargo ["SVD",12];
				_vecRu AddWeaponCargo ["AKS_74_NSPU",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];
				_vecRu AddWeaponCargo ["Pecheneg",12];
//RH
/*
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_aps",12];
				_vecRu AddWeaponCargo ["Sa61_EP1",12];
				_vecRu AddWeaponCargo ["UZI_EP1",12];
				_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
				_vecRu AddWeaponCargo ["RH_asval",12];
				_vecRu AddWeaponCargo ["RH_akmssd",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_ak104k",12];
				_vecRu AddWeaponCargo ["RH_ak105sp",12];
				_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
				_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
				_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
				_vecRu AddWeaponCargo ["RH_aks74upt",12];
				_vecRu AddWeaponCargo ["RH_ak74mkgl",12];
*/
//new
/*
				_vecRu AddWeaponCargo ["rhs_weap_pya",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_desert",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
*/

/*
//				_vecRu addWeaponCargo ["SUD_AK74m",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F",12];
				_vecRu addWeaponCargo ["SUD_AK74m_GL",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_TB_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_n",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_c",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_n",12];
				_vecRu addWeaponCargo ["AEK_971",12];
				_vecRu addWeaponCargo ["AEK_971_1p78",12];
				_vecRu addWeaponCargo ["AEK_971_1p63",12];
				_vecRu addWeaponCargo ["AEK_971_gp",12];
				_vecRu addWeaponCargo ["AEK_973s",12];
				_vecRu addWeaponCargo ["AEK_973s_1p78",12];
*/
			};
			 case 4:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu AddWeaponCargo ["MakarovSD",12];
				_vecRu AddWeaponCargo ["Sa61_EP1",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["RPG7V",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu addWeaponCargo ["Igla",12];

				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_CCO_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["AKS_74_UN_kobra",12];
				_vecRu AddWeaponCargo ["bizon",12];
				_vecRu AddWeaponCargo ["bizon_silenced",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["AK_107_GL_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["EB_OSV96",12];
				_vecRu addWeaponCargo ["SVD",12];
				_vecRu AddWeaponCargo ["VSS_vintorez",12];
				_vecRu AddWeaponCargo ["AKS_74_NSPU",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];
				_vecRu AddWeaponCargo ["Pecheneg",12];
//RH
/* 				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_vz61",12];	
				_vecRu AddWeaponCargo ["RH_pmsd",12];
				_vecRu AddWeaponCargo ["RH_aps",12];
				_vecRu AddWeaponCargo ["UZI_EP1",12];
				_vecRu AddWeaponCargo ["RH_bizonsd",12];
				_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
				_vecRu AddWeaponCargo ["RH_asval",12];
				_vecRu AddWeaponCargo ["RH_akmssd",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_ak104k",12];
				_vecRu AddWeaponCargo ["RH_ak105sp",12];
				_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
				_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
				_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
				_vecRu addWeaponCargo ["RH_SCARAKACOG",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
				_vecRu AddWeaponCargo ["RH_aks74upt",12];
				_vecRu AddWeaponCargo ["RH_aks74uptk",12];
				_vecRu AddWeaponCargo ["RH_ak74mkgl",12];
				_vecRu AddWeaponCargo ["RH_ak104gl",12];
				_vecRu AddWeaponCargo ["RH_ak105kgl",12];
				_vecRu AddWeaponCargo ["RH_rpk74m1p29",12];
*/
//new
/*
				_vecRu AddWeaponCargo ["rhs_weap_pya",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_desert",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag_camo",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
				_vecRu addWeaponCargo ["rhs_weap_ak74m_s",12];
*/

/* 
//				_vecRu addWeaponCargo ["SUD_AK74m",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F",12];
				_vecRu addWeaponCargo ["SUD_AK74m_TB",12];
				_vecRu addWeaponCargo ["SUD_AK74m_GL",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_TB_C",12];
				_vecRu addWeaponCargo ["SUD_AK74m_GL_C",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F_1p78",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_gl_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_f_1p78",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_pso",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_n",12];
				_vecRu addWeaponCargo ["SUD_AK74m_F_n",12];
				_vecRu addWeaponCargo ["SUD_AK74m_gl_n",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s_c",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f_c",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s_1p78",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f_1p78",12];
//				_vecRu addWeaponCargo ["SUD_AK74m_s_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_f_pso",12];
				_vecRu addWeaponCargo ["SUD_AK74m_s_n",12];
				_vecRu addWeaponCargo ["AEK_971",12];
				_vecRu addWeaponCargo ["AEK_971_1p78",12];
				_vecRu addWeaponCargo ["AEK_971_1p63",12];
				_vecRu addWeaponCargo ["AEK_971_gp",12];
				_vecRu addWeaponCargo ["AEK_971_gp_1p63",12];
				_vecRu addWeaponCargo ["AEK_973s",12];
				_vecRu addWeaponCargo ["AEK_973s_1p78",12];
				_vecRu addWeaponCargo ["AEK_973s_1p63",12];
				_vecRu addWeaponCargo ["AEK_973s_gp",12];
				_vecRu addWeaponCargo ["AEK_973s_gp_1p63",12];
 */
			};
			 case 5:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu AddWeaponCargo ["MakarovSD",12];
				_vecRu AddWeaponCargo ["Sa61_EP1",12];
				_vecRu AddWeaponCargo ["revolver_gold_EP1",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["RPG7V",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu addWeaponCargo ["Igla",12];
				_vecRu addWeaponCargo ["MetisLauncher",12];

				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_CCO_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["AK_107_pso",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["bizon",12];
				_vecRu AddWeaponCargo ["AKS_74_UN_kobra",12];
				_vecRu AddWeaponCargo ["bizon_silenced",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["AK_107_GL_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_GL_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["EB_OSV96",12];
				_vecRu addWeaponCargo ["SVD",12];
				_vecRu AddWeaponCargo ["VSS_vintorez",12];
				_vecRu AddWeaponCargo ["SVD_des_EP1",12];
				_vecRu AddWeaponCargo ["AKS_74_NSPU",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];
				_vecRu AddWeaponCargo ["Pecheneg",12];
//RH
/*
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_vz61",12];	
				_vecRu AddWeaponCargo ["RH_pmsd",12];
				_vecRu AddWeaponCargo ["RH_aps",12];
				_vecRu AddWeaponCargo ["RH_apssd",12];
				_vecRu AddWeaponCargo ["UZI_EP1",12];
				_vecRu AddWeaponCargo ["UZI_SD_EP1",12];
				_vecRu AddWeaponCargo ["RH_bizonsd",12];
				_vecRu AddWeaponCargo ["RH_bizonsdk",12];
				_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
				_vecRu AddWeaponCargo ["RH_asval",12];
				_vecRu AddWeaponCargo ["RH_akmssd",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_ak104k",12];
				_vecRu AddWeaponCargo ["RH_ak105sp",12];
				_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
				_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
				_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
				_vecRu addWeaponCargo ["RH_SCARAKACOG",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
				_vecRu AddWeaponCargo ["RH_aks74upt",12];
				_vecRu AddWeaponCargo ["RH_aks74uptsp",12];
				_vecRu AddWeaponCargo ["RH_aks74uptk",12];
				_vecRu AddWeaponCargo ["RH_ak74mkgl",12];
				_vecRu AddWeaponCargo ["RH_aks74mglsp",12];
				_vecRu AddWeaponCargo ["RH_ak104gl",12];
				_vecRu AddWeaponCargo ["RH_ak105kgl",12];
				_vecRu AddWeaponCargo ["RH_rpk74m1p29",12];
*/
//new
/*
			_vecRu AddWeaponCargo ["rhs_weap_pya",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag_camo",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_s",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_s_gp25",12];
*/
/*
			_vecRu addWeaponCargo ["SUD_AK74m_F",12];
			_vecRu addWeaponCargo ["SUD_AK74m_TB",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_F",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_TB_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_F_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_c",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_c",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_n",12];
			_vecRu addWeaponCargo ["AEK_971",12];
			_vecRu addWeaponCargo ["AEK_971_1p78",12];
			_vecRu addWeaponCargo ["AEK_971_1p63",12];
			_vecRu addWeaponCargo ["AEK_971_gp",12];
			_vecRu addWeaponCargo ["AEK_971_gp_1p63",12];
			_vecRu addWeaponCargo ["AEK_971_1pn100",12];
			_vecRu addWeaponCargo ["AEK_971_tgp_cln",12];
			_vecRu addWeaponCargo ["AEK_973s",12];
			_vecRu addWeaponCargo ["AEK_973s_1p78",12];
			_vecRu addWeaponCargo ["AEK_973s_1p63",12];
			_vecRu addWeaponCargo ["AEK_973s_gp",12];
			_vecRu addWeaponCargo ["AEK_973s_gp_1p63",12];
			_vecRu addWeaponCargo ["AEK_973s_1pn100",12];
			_vecRu addWeaponCargo ["AEK_973s_tgp_cln",12];
*/
			};
			 case 6:
			{
				_vecRu AddWeaponCargo ["Makarov",12];
				_vecRu AddWeaponCargo ["MakarovSD",12];
				_vecRu AddWeaponCargo ["Sa61_EP1",12];
				_vecRu AddWeaponCargo ["revolver_gold_EP1",12];
				_vecRu addWeaponCargo ["RPG18",12];
				_vecRu addWeaponCargo ["RPG7V",12];
				_vecRu addWeaponCargo ["MetisLauncher",12];
				_vecRu addWeaponCargo ["Strela",12];
				_vecRu addWeaponCargo ["Igla",12];

				_vecRu AddWeaponCargo ["AK_47_S",12];
				_vecRu AddWeaponCargo ["AK_47_M",12];
				_vecRu AddWeaponCargo ["Sa58P_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_CCO_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_EP1",12];
				_vecRu AddWeaponCargo ["Sa58V_RCO_EP1",12];
				_vecRu AddWeaponCargo ["AK_74",12];
				_vecRu AddWeaponCargo ["AKS_74_kobra",12];
				_vecRu AddWeaponCargo ["AK_107_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_U",12];
				_vecRu AddWeaponCargo ["AKS_74_pso",12];
				_vecRu AddWeaponCargo ["AK_107_pso",12];
				_vecRu AddWeaponCargo ["AK_74_GL",12];
				_vecRu AddWeaponCargo ["bizon",12];
				_vecRu AddWeaponCargo ["Saiga12K",12];
				_vecRu AddWeaponCargo ["VSS_vintorez",12];
				_vecRu AddWeaponCargo ["AK_107_GL_kobra",12];
				_vecRu AddWeaponCargo ["AKS_74_UN_kobra",12];
				_vecRu AddWeaponCargo ["AKS_GOLD", 3];
				_vecRu AddWeaponCargo ["bizon_silenced",12];
				_vecRu AddWeaponCargo ["AK_107_GL_pso",12];
				_vecRu AddWeaponCargo ["EB_DP28",12];
				_vecRu AddWeaponCargo ["ksvk",12];
				_vecRu AddWeaponCargo ["EB_OSV96",12];
				_vecRu addWeaponCargo ["SVD",12];
				_vecRu AddWeaponCargo ["SVD_CAMO",12];
				_vecRu AddWeaponCargo ["SVD_des_EP1",12];
				_vecRu AddWeaponCargo ["SVD_NSPU_EP1",12];
				_vecRu AddWeaponCargo ["AKS_74_GOSHAWK",12];
				_vecRu AddWeaponCargo ["AKS_74_NSPU",12];
				_vecRu AddWeaponCargo ["RPK_74",12];
				_vecRu AddWeaponCargo ["PK",12];
				_vecRu AddWeaponCargo ["Pecheneg",12];
//RH
/*
				_vecRu AddWeaponCargo ["RH_pm",12];
				_vecRu AddWeaponCargo ["RH_tt33",12];
				_vecRu AddWeaponCargo ["RH_vz61",12];	
				_vecRu AddWeaponCargo ["RH_pmsd",12];
				_vecRu AddWeaponCargo ["RH_aps",12];
				_vecRu AddWeaponCargo ["RH_apssd",12];
				_vecRu AddWeaponCargo ["UZI_EP1",12];
				_vecRu AddWeaponCargo ["UZI_SD_EP1",12];
				_vecRu AddWeaponCargo ["RH_bizonsd",12];
				_vecRu AddWeaponCargo ["RH_bizonsdk",12];
				_vecRu AddWeaponCargo ["RH_gr1sdsp",12];
				_vecRu AddWeaponCargo ["RH_asval",12];
				_vecRu AddWeaponCargo ["RH_asvalk",12];
				_vecRu AddWeaponCargo ["RH_akmssd",12];
				_vecRu AddWeaponCargo ["RH_ak103",12];
				_vecRu AddWeaponCargo ["RH_ak104k",12];
				_vecRu AddWeaponCargo ["RH_ak105sp",12];
				_vecRu AddWeaponCargo ["RH_ak107_1p29",12];
				_vecRu AddWeaponCargo ["RH_oc14sdsp",12];
				_vecRu AddWeaponCargo ["RH_rk95sdaim",12];
				_vecRu addWeaponCargo ["RH_SCARAKBAIM",12];
				_vecRu addWeaponCargo ["RH_SCARAKACOG",12];
				_vecRu AddWeaponCargo ["RH_an94gl",12];
				_vecRu AddWeaponCargo ["RH_aks74upt",12];
				_vecRu AddWeaponCargo ["RH_aks74uptsp",12];
				_vecRu AddWeaponCargo ["RH_aks74uptk",12];
				_vecRu AddWeaponCargo ["RH_ak74mkgl",12];
				_vecRu AddWeaponCargo ["RH_aks74mglsp",12];
				_vecRu AddWeaponCargo ["RH_ak104gl",12];
				_vecRu AddWeaponCargo ["RH_ak105kgl",12];
				_vecRu AddWeaponCargo ["RH_asvalsp",12];
				_vecRu AddWeaponCargo ["RH_svu",12];
				_vecRu AddWeaponCargo ["RH_rpk74m1p29",12];
*/
//new
/*
			_vecRu AddWeaponCargo ["rhs_weap_pya",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_folded",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_camo",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_2mag_camo",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_gp25",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_s",12];
			_vecRu addWeaponCargo ["rhs_weap_ak74m_s_gp25",12];
*/
/*
			_vecRu addWeaponCargo ["SUD_AK74m_F",12];
			_vecRu addWeaponCargo ["SUD_AK74m_TB",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_F",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_TB",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_TB_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_F_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_GL_TB_C",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_F_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_tb_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_f_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_gl_tb_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_c",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_c",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_1p78",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_pso",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_f_n",12];
			_vecRu addWeaponCargo ["SUD_AK74m_s_tb_n",12];
			_vecRu addWeaponCargo ["AEK_971",12];
			_vecRu addWeaponCargo ["AEK_971_1p78",12];
			_vecRu addWeaponCargo ["AEK_971_1p63",12];
			_vecRu addWeaponCargo ["AEK_971_gp",12];
			_vecRu addWeaponCargo ["AEK_971_gp_1p63",12];
			_vecRu addWeaponCargo ["AEK_971_1pn100",12];
			_vecRu addWeaponCargo ["AEK_971_tgp_cln",12];
			_vecRu addWeaponCargo ["AEK_971_shahin",12];
			_vecRu addWeaponCargo ["AEK_973s",12];
			_vecRu addWeaponCargo ["AEK_973s_1p78",12];
			_vecRu addWeaponCargo ["AEK_973s_1p63",12];
			_vecRu addWeaponCargo ["AEK_973s_gp",12];
			_vecRu addWeaponCargo ["AEK_973s_gp_1p63",12];
			_vecRu addWeaponCargo ["AEK_973s_1pn100",12];
			_vecRu addWeaponCargo ["AEK_973s_tgp_cln",12];
			_vecRu addWeaponCargo ["AEK_973s_shahin",12];
*/
			};
		};
//ammo 
		_vecRu addWeaponCargo ["Binocular",2];
		_vecRu addWeaponCargo ["NVGoggles",2];
		_vecRu addWeaponCargo ["Laserdesignator",2];
		_vecRu addMagazineCargo ["Laserbatteries",2];
//		_vecRu addMagazineCargo ["HandGrenade_East",12];

		_vecRu addMagazineCargo ["pipebomb",12];
		_vecRu addMagazineCargo ["RPG18",12];
		_vecRu addMagazineCargo ["mineE",12];
		_vecRu addMagazineCargo ["OG7",12];
		_vecRu addMagazineCargo ["PG7V",12];
		_vecRu addMagazineCargo ["PG7VR",12];
		_vecRu addMagazineCargo ["PG7VL",12];
		_vecRu addMagazineCargo ["Strela",12];
		_vecRu addMagazineCargo ["Igla",12];
		_vecRu addMagazineCargo ["AT13",12];

		_vecRu addmagazinecargo ["8Rnd_9x18_Makarov",12];
		_vecRu addmagazinecargo ["8Rnd_9x18_MakarovSD",12];

/*
		_vecRu addMagazineCargo ["RH_20Rnd_9x18_aps",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x18_apssd",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x39_val_mag",12];
		_vecRu addMagazineCargo ["RH_30Rnd_762x39_SDmag",12];
		_vecRu addMagazineCargo ["RH_20Rnd_9x39_SP6SD_mag",12];
		_vecRu addMagazineCargo ["RH_1Rnd_30mm",12];
		_vecRu addMagazineCargo ["RH_45Rnd_545x39_mag",12];
		_vecRu addMagazineCargo ["RH_8Rnd_762_tt33",12];
		_vecRu addMagazineCargo ["RH_20Rnd_32cal_vz61",12];
*/
		_vecRu addMagazineCargo ["10x_303",12];
		_vecRu addMagazineCargo ["30Rnd_9x19_UZI",12];
		_vecRu addMagazineCargo ["30Rnd_9x19_UZI_SD",12];
		_vecRu addMagazineCargo ["20Rnd_762x51_FNFAL",12];

		_vecRu AddMagazineCargo ["30Rnd_762x39_SA58",12];
		_vecRu addmagazinecargo ["30Rnd_762x39_AK47",12];
		_vecRu addmagazinecargo ["30Rnd_545x39_AK",12];
		_vecRu addmagazinecargo ["30Rnd_545x39_AKSD",12];
		_vecRu addmagazinecargo ["64Rnd_9x19_Bizon",12];
		_vecRu addmagazinecargo ["64Rnd_9x19_SD_Bizon",12];
		_vecRu addmagazinecargo ["8Rnd_B_Saiga12_74Slug",12];
		_vecRu addmagazinecargo ["8Rnd_B_Saiga12_Pellets",12];

		_vecRu addmagazinecargo ["75Rnd_545x39_RPK",12];
		_vecRu addmagazinecargo ["100Rnd_762x54_PK",12];

		_vecRu addmagazinecargo ["EB_47Rnd_DP28",12];
		_vecRu addmagazinecargo ["5Rnd_127x108_KSVK",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_T",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_NT",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_HEI",12];
		_vecRu addmagazinecargo ["EB_5Rnd_127x108_OSV_API",12];
		_vecRu addmagazinecargo ["10Rnd_762x54_SVD",12];
		_vecRu addmagazinecargo ["10Rnd_9x39_SP5_VSS",12];
		_vecRu addmagazinecargo ["20Rnd_9x39_SP5_VSS",12];
		_vecRu addMagazineCargo ["5x_22_LR_17_HMR",12];
		_vecRu addMagazineCargo ["EB_5Rnd_762x51_CZ550_p",12];

		_vecRu addMagazineCargo ["6Rnd_45ACP",12];
		_vecRu addMagazineCargo ["20Rnd_B_765x17_Ball",12];

		if (gitsnades == 1) then
		{
//new weapons
			_vecRu AddWeaponCargo ["EB_svd",2];
			_vecRu addmagazinecargo ["EB_10Rnd_svd",12];
			_vecRu addmagazinecargo ["EB_20Rnd_svd",12];
			_vecRu addmagazinecargo ["EB_10Rnd_svd_T",12];
			_vecRu addmagazinecargo ["EB_20Rnd_svd_T",12];
			_vecRu addMagazineCargo ["EB_t67gren",12];
			_vecRu addMagazineCargo ["EB_rkg3gren",12];
			_vecRu addMagazineCargo ["EB_rdg2",12];
			_vecRu addMagazineCargo ["EB_rdg3",12];
			_vecRu addMagazineCargo ["EB_f1gren",12];
			_vecRu addMagazineCargo ["EB_rg42gren",12];
			_vecRu addMagazineCargo ["EB_rgd5gren",12];
			_vecRu addMagazineCargo ["EB_rgd33gren",12];

//new GL AMMO
			_vecRu AddWeaponCargo ["EB_TIscanner",2];
			_vecRu AddWeaponCargo ["EB_TIGoggles",2];
			_vecRu AddWeaponCargo ["EB_S10",2];
			_vecRu addmagazinecargo ["EB_knife",12];
			_vecRu addmagazinecargo ["EB_kabar",12];
			_vecRu addmagazinecargo ["EB_ItemFuelcanEmpty",12];
			_vecRu AddWeaponCargo ["EB_ItemSiphon",2];
			_vecRu AddWeaponCargo ["EB_ItemSil_hgun",12];
			_vecRu AddWeaponCargo ["EB_ItemSil_rifle",12];
			_vecRu addMagazineCargo ["EB_SmokeShellChem",12];
			_vecRu addMagazineCargo ["1Rnd_Chem_GP25",12];
			_vecRu addMagazineCargo ["1Rnd_Buckshot_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Chem_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Buckshot_GP25",12];
			_vecRu addMagazineCargo ["LWS_Laserbatteries",12];
			_vecRu addMagazineCargo ["5Rnd_HE_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_HEDP_M203",12];
			_vecRu addMagazineCargo ["5Rnd_FlareWhite_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareGreen_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareRed_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_FlareYellow_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_Smoke_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeRed_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeGreen_GP25",12];
			_vecRu addMagazineCargo ["5Rnd_SmokeYellow_GP25",12];
		};
//old GL ammo
			_vecRu addMagazineCargo ["1rnd_HE_GP25",12];
			_vecRu addMagazineCargo ["FlareWhite_GP25",12];
			_vecRu addMagazineCargo ["FlareRed_GP25",12];
			_vecRu addMagazineCargo ["FlareGreen_GP25",12];
			_vecRu addMagazineCargo ["FlareYellow_GP25",12];
			_vecRu addMagazineCargo ["SmokeShell",12];
			_vecRu addMagazineCargo ["SmokeShellRed",12];
			_vecRu addMagazineCargo ["SmokeShellGreen",12];
			_vecRu addMagazineCargo ["SmokeShellYellow",12];
			_vecRu addMagazineCargo ["SmokeShellPurple",12];
			_vecRu addMagazineCargo ["SmokeShellBlue",12];
			_vecRu addMagazineCargo ["SmokeShellOrange",12];
		Sleep 1.0;
	};

	If (ranklock ==1 || ranklock == 3) then //russian 
	{
		deletevehicle ammobox6;ammobox6 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob6";ammobox6 setpos getmarkerpos "ammob6";[ammobox6] call _FillAmmoBoxR;
		deletevehicle ammobox7;ammobox7 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob7";ammobox7 setpos getmarkerpos "ammob7";[ammobox7] call _FillAmmoBoxR;
		deletevehicle ammobox8;ammobox8 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob8";ammobox8 setpos getmarkerpos "ammob8";[ammobox8] call _FillAmmoBoxR;
		deletevehicle ammobox9;ammobox9 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob9";ammobox9 setpos getmarkerpos "ammob9";[ammobox9] call _FillAmmoBoxR;
		deletevehicle ammobox10;ammobox10 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob10";ammobox10 setpos getmarkerpos "ammob10";[ammobox10] call _FillAmmoBoxR;
		player reveal ammobox6
	} 
	else //russian ranked
	{
		deletevehicle ammobox6;ammobox6 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob6";ammobox6 setpos getmarkerpos "ammob6";[ammobox6] call _FillAmmoBoxRR;
		deletevehicle ammobox7;ammobox7 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob7";ammobox7 setpos getmarkerpos "ammob7";[ammobox7] call _FillAmmoBoxRR;
		deletevehicle ammobox8;ammobox8 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob8";ammobox8 setpos getmarkerpos "ammob8";[ammobox8] call _FillAmmoBoxRR;
		deletevehicle ammobox9;ammobox9 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob9";ammobox9 setpos getmarkerpos "ammob9";[ammobox9] call _FillAmmoBoxRR;
		deletevehicle ammobox10;ammobox10 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob10";ammobox10 setpos getmarkerpos "ammob10";[ammobox10] call _FillAmmoBoxRR;
		player reveal ammobox6
	};
};

BIS_EVO_AmmoBox = // Creates and fills local rank based ammo boxes
{
	_rank = _this select 0;

//US weapons unranked

	_FillAmmoBoxU =
	{
		_vec = _this select 0;
		clearWeaponCargo _vec;
		clearMagazineCargo _vec;

//CZ weapons
		_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
		_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
		_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM",12];
		_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM_SD",12];
		_vec AddWeaponCargo ["Evo_ACR",12];
		_vec AddWeaponCargo ["Evo_mrad_ACR",12];
		_vec AddWeaponCargo ["evo_sd_ACR",12];
		_vec AddWeaponCargo ["UK59_ACR",12];
		_vec AddWeaponCargo ["CZ_750_S1_ACR",12];
		_vec AddWeaponCargo ["CZ805_A1_ACR",12];
		_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];
		_vec AddWeaponCargo ["CZ805_A2_ACR",12];
		_vec AddWeaponCargo ["CZ805_A2_SD_ACR",12];
		_vec AddWeaponCargo ["CZ805_B_GL_ACR",12];
		_vec AddWeaponCargo ["LRTV_ACR",12];
//BAFX LEN
		_vec addWeaponCargo ["LEN_L119A1_Acog",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_HG",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_CQB",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_CQB_SD",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_CQB_SD_HG",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_PF_SD",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_UGL",12];
		_vec addWeaponCargo ["LEN_L119A1_Acog_UGL_PF",12];
		_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
		_vec addWeaponCargo ["LEN_L119A1_EOT_CQB_SD",12];
		_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
		_vec addWeaponCargo ["LEN_L119A1_EOT_PF_SD",12];
		_vec addWeaponCargo ["LEN_L119A1_EOT_UGL_PF",12];
		
//new stuff
/*
		_vec addWeaponCargo ["R3F_AT4CS",12];
		_vec addWeaponCargo ["R3F_Minimi_EOT",12];
		_vec addWeaponCargo ["R3F_Minimi_J4",12];
		_vec addWeaponCargo ["R3F_Minimi_762_J4",12];
		_vec addWeaponCargo ["R3F_Minimi_762_OB50",12];
		_vec addWeaponCargo ["R3F_minimi_AIM_HG",12];
		_vec addWeaponCargo ["R3F_Minimi_762_EOT_HG",12];
		_vec addWeaponCargo ["R3F_JIM_LR",12];
		_vec addWeaponCargo ["R3F_Famas_F1",12];
		_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
//		_vec addWeaponCargo ["R3F_Famas_F1_EOT_HG_SD",12];
		_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
		_vec addWeaponCargo ["R3F_Famas_F1_J4_M203",12];
//		_vec addWeaponCargo ["R3F_Famas_F1_J4_M203_SD",12];
		_vec addWeaponCargo ["R3F_Famas_felin",12];
		_vec addWeaponCargo ["R3F_Famas_G2",12];
		_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
		_vec addWeaponCargo ["R3F_Famas_G2_J4",12];
		_vec addWeaponCargo ["R3F_Famas_G2_J4_HG",12];
		_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
		_vec addWeaponCargo ["R3F_Famas_G2_AIM_HG",12];
		_vec addWeaponCargo ["R3F_Famas_surb",12];
//		_vec addWeaponCargo ["R3F_Famas_surb_EOT_SD",12];
		_vec addWeaponCargo ["R3F_Famas_surb_AIM_HG",12];
//		_vec addWeaponCargo ["R3F_Famas_surb_AIM_SD",12];
		_vec addWeaponCargo ["R3F_Famas_surb_EOT_M203",12];
		_vec addWeaponCargo ["R3F_HK417L_NF",12];
		_vec addWeaponCargo ["R3F_HK417M_AIM",12];
		_vec addWeaponCargo ["R3F_HK417S_EOT_HG",12];
//		_vec addWeaponCargo ["R3F_HK417S_HG_SD",12];
		_vec addWeaponCargo ["R3F_FRF2_J8",12];
//		_vec addWeaponCargo ["R3F_FRF2_J8_SD",12];
		_vec addWeaponCargo ["R3F_PGM_Hecate_II",12];
		_vec addWeaponCargo ["R3F_PGM_Hecate_II_MILDOT",12];
		_vec addWeaponCargo ["R3F_PGM_Hecate_II_POLY",12];
//		_vec addWeaponCargo ["ACR_M4A3",12];
//		_vec addWeaponCargo ["ACR_M4A3_B",12];
		_vec addWeaponCargo ["ACR_M4A3_D",12];
//		_vec addWeaponCargo ["ACR_M4A3REF",12];
//		_vec addWeaponCargo ["ACR_M4A3REF_B",12];
		_vec addWeaponCargo ["ACR_M4A3REF_D",12];
//		_vec addWeaponCargo ["ACR_M4A3ACOG",12];
//		_vec addWeaponCargo ["ACR_M4A3ACOG_B",12];
		_vec addWeaponCargo ["ACR_M4A3ACOG_D",12];
//		_vec addWeaponCargo ["ACR_SD6",12];
//		_vec addWeaponCargo ["ACR_SD6_B",12];
		_vec addWeaponCargo ["ACR_SD6_D",12];
		_vec addWeaponCargo ["ACR_M60E4",12];
		_vec addWeaponCargo ["ACR_M60E4M1",12];
//		_vec addWeaponCargo ["ACR_SA58REF",12];
//		_vec addWeaponCargo ["ACR_SA58REF_B",12];
		_vec addWeaponCargo ["ACR_SA58REF_D",12];
//		_vec addWeaponCargo ["ACR_SA58ACOG",12];
//		_vec addWeaponCargo ["ACR_SA58ACOG_B",12];
		_vec addWeaponCargo ["ACR_SA58ACOG_D",12];
		_vec addWeaponCargo ["ACR_GLOCK17",12];
//		_vec addWeaponCargo ["ACR_GLOCK17SD",12];
		_vec addWeaponCargo ["ACR_CG",12];
//		_vec addWeaponCargo ["ACR_AW_308",12];
		_vec addWeaponCargo ["ACR_AW_308_D",12];

		_vec addWeaponCargo ["C1987_MP7",12];
//		_vec addWeaponCargo ["C1987_MP7_sd",12];
//		_vec addWeaponCargo ["C1987_MP7_su",12];
//		_vec addWeaponCargo ["C1987_MP7_su_sd",12];
//		_vec addWeaponCargo ["C1987_MP7_zp",12];
//		_vec addWeaponCargo ["C1987_MP7_zp_sd",12];
		_vec addWeaponCargo ["C1987_MP7_eot",12];
//		_vec addWeaponCargo ["C1987_MP7_eot_sd",12];
		_vec addWeaponCargo ["C1987_MP7_acog",12];
//		_vec addWeaponCargo ["C1987_MP7_acog_sd",12];
		_vec addWeaponCargo ["C1987_MP7_t",12];
//		_vec addWeaponCargo ["C1987_MP7_sd_t",12];
//		_vec addWeaponCargo ["C1987_MP7_su_t",12];
//		_vec addWeaponCargo ["C1987_MP7_su_sd_t",12];
		_vec addWeaponCargo ["C1987_MP7_zp_t",12];
//		_vec addWeaponCargo ["C1987_MP7_zp_sd_t",12];
		_vec addWeaponCargo ["C1987_MP7_eot_t",12];
//		_vec addWeaponCargo ["C1987_MP7_eot_sd_t",12];
		_vec addWeaponCargo ["C1987_MP7_acog_t",12];
//		_vec addWeaponCargo ["C1987_MP7_acog_sd_t",12];
//		_vec addWeaponCargo ["C1987_P99_black",12];
		_vec addWeaponCargo ["C1987_P99_green",12];
//		_vec addWeaponCargo ["C1987_P99_silver",12];
//		_vec addWeaponCargo ["C1987_P99_black_laser",12];
		_vec addWeaponCargo ["C1987_P99_green_laser",12];
//		_vec addWeaponCargo ["C1987_P99_silver_laser",12];
//		_vec addWeaponCargo ["C1987_P99_black_sd",12];
//		_vec addWeaponCargo ["C1987_P99_green_sd",12];
//		_vec addWeaponCargo ["C1987_P99_silver_sd",12];
//		_vec addWeaponCargo ["C1987_P99_black_laser_sd",12];
//		_vec addWeaponCargo ["C1987_P99_green_laser_sd",12];
//		_vec addWeaponCargo ["C1987_P99_silver_laser_sd",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_GL",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_SIL_GL",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_GL",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_SIL_GL",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL_GL",12];

//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_SIL",12];
		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_SIL_FG",12];
		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_GL",12];
//		_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_SIL_GL",12];

//FHQ
		_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
		_vec AddWeaponCargo ["FHQ_RSASS_TWS_TAN",12];
//		_vec AddWeaponCargo ["FHQ_RSASS_SD_TAN",12];
//		_vec AddWeaponCargo ["FHQ_RSASS_TWS_SD_TAN",12];

		_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_XM2010_SD_DESERT",12];
		_vec AddWeaponCargo ["FHQ_XM2010_NV_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_XM2010_NV_SD_DESERT",12];
		_vec AddWeaponCargo ["FHQ_XM2010_TWS_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_XM2010_TWS_SD_DESERT",12];

		_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];
		_vec AddWeaponCargo ["FHQ_MSR_NV_DESERT",12];
		_vec AddWeaponCargo ["FHQ_MSR_TWS_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_MSR_SD_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_MSR_NV_SD_DESERT",12];
//		_vec AddWeaponCargo ["FHQ_MSR_TWS_SD_DESERT",12];

//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_SD_F",12];

//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_SD_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL",12];
		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_F",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_SD",12];
//		_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_SD_F",12];
//RH Weapons
			_vec addWeaponCargo ["RH_m93r",12];
			_vec addWeaponCargo ["RH_p226",12];
//			_vec addWeaponCargo ["RH_g17",12];
			_vec addWeaponCargo ["RH_g18",12];
			_vec addWeaponCargo ["RH_g19t",12];
//			_vec addWeaponCargo ["RH_mk2",12];
			_vec addWeaponCargo ["RH_mk22v",12];
//			_vec addWeaponCargo ["RH_mk22vsd",12];
			_vec addWeaponCargo ["RH_usp",12];
//			_vec addWeaponCargo ["RH_uspsd",12];
			_vec addWeaponCargo ["RH_m9",12];
//			_vec addWeaponCargo ["RH_m9sd",12];
			_vec addWeaponCargo ["RH_m1911",12];
//			_vec addWeaponCargo ["RH_m1911sd",12];
			_vec addWeaponCargo ["RH_anac",12];
			_vec addWeaponCargo ["RH_bull",12];
			_vec addWeaponCargo ["RH_python",12];
			_vec addWeaponCargo ["RH_deagle",12];
			_vec addWeaponCargo ["RH_pp2000p",12];
			_vec addWeaponCargo ["RH_mac10p",12];
			_vec addWeaponCargo ["RH_tec9",12];
//			_vec addWeaponCargo ["RH_muzi",12];
			_vec addWeaponCargo ["RH_mp5kp",12];
			_vec addWeaponCargo ["RH_mp7p",12];
			_vec addWeaponCargo ["RH_HK53aim",12];
			_vec addWeaponCargo ["RH_mp5a4rfx",12];
//			_vec addWeaponCargo ["RH_mp5a5eot",12];
			_vec addWeaponCargo ["RH_mp5a5ris",12];
			_vec addWeaponCargo ["RH_mp5a5eodRFX",12];
			_vec addWeaponCargo ["RH_mp5sd6eot",12];
//			_vec addWeaponCargo ["RH_mp5kpdw",12];
			_vec addWeaponCargo ["RH_P90i",12];
//			_vec addWeaponCargo ["RH_P90isd",12];
			_vec addWeaponCargo ["RH_p90aim",12];
//			_vec addWeaponCargo ["RH_p90sdaim",12];
			_vec addWeaponCargo ["RH_umpeot",12];
			_vec addWeaponCargo ["RH_ump",12];
//			_vec addWeaponCargo ["RH_umpsd",12];
			_vec addWeaponCargo ["RH_umpaim",12];
//			_vec addWeaponCargo ["RH_umpsdaim",12];
//			_vec addWeaponCargo ["RH_krissRFX",12];
			_vec addWeaponCargo ["RH_kriss",12];
//			_vec addWeaponCargo ["RH_krisssd",12];
			_vec addWeaponCargo ["RH_krisseot",12];
//			_vec addWeaponCargo ["RH_krisssdeot",12];
			_vec addWeaponCargo ["RH_uzi",12];
//			_vec addWeaponCargo ["RH_uzisd",12];
			_vec addWeaponCargo ["RH_tmp",12];
//			_vec addWeaponCargo ["RH_tmpsd",12];
			_vec addWeaponCargo ["RH_tmpaim",12];
//			_vec addWeaponCargo ["RH_tmpsdaim",12];
			_vec addWeaponCargo ["RH_pp2000eot",12];
			_vec addWeaponCargo ["RH_mp7eot",12];
//			_vec addWeaponCargo ["RH_mp7sdeot",12];
			_vec addWeaponCargo ["RH_mp7aim",12];
//			_vec addWeaponCargo ["RH_mp7sdaim",12];
			_vec addWeaponCargo ["RH_fmg9",12];
			_vec addWeaponCargo ["RH_pdreot",12];
			_vec addWeaponCargo ["RH_PDW_AIM",12];
//			_vec addWeaponCargo ["RH_M4CMK",12];
//			_vec addWeaponCargo ["RH_M4CMKAIM",12];
			_vec addWeaponCargo ["RH_M4CMKEOTECH",12];
			_vec addWeaponCargo ["RH_M4CMKACOG",12];
			_vec addWeaponCargo ["RH_ar10",12];
			_vec addWeaponCargo ["RH_ar10s",12];
//			_vec addWeaponCargo ["RH_m14",12];
//			_vec addWeaponCargo ["RH_m14aim",12];
//			_vec addWeaponCargo ["RH_mk14teot",12];
			_vec addWeaponCargo ["RH_mk14t",12];
//			_vec addWeaponCargo ["RH_mk14tsd",12];
			_vec addWeaponCargo ["RH_MK14AIM",12];
//			_vec addWeaponCargo ["RH_MK14SDAIM",12];
			_vec addWeaponCargo ["RH_MK14",12];
//			_vec addWeaponCargo ["RH_MK14SD",12];
			_vec addWeaponCargo ["RH_MK14EOTECH",12];
//			_vec addWeaponCargo ["RH_MK14SDEOTECH",12];
			_vec addWeaponCargo ["RH_m16a3cs",12];
//			_vec addWeaponCargo ["RH_m4a1r",12];
			_vec addWeaponCargo ["RH_m4a1eotech",12];
//			_vec addWeaponCargo ["RH_m4sdeotech",12];
//			_vec addWeaponCargo ["RH_m4acog",12];
			_vec addWeaponCargo ["RH_m4",12];
//			_vec addWeaponCargo ["RH_m4sd",12];
//			_vec addWeaponCargo ["RH_m4macog",12];
			_vec addWeaponCargo ["RH_M4sdaim_wdl",12];
			_vec addWeaponCargo ["RH_m4sbraim",12];
			_vec addWeaponCargo ["RH_M4CTSD_F",12];
//			_vec addWeaponCargo ["RH_sc2",12];
			_vec addWeaponCargo ["RH_sc2aim",12];
			_vec addWeaponCargo ["RH_sc2shd",12];

			_vec addWeaponCargo ["RH_mk18",12];
			_vec addWeaponCargo ["RH_Mk18aim",12];
			_vec addWeaponCargo ["RH_mk18eot",12];
			_vec addWeaponCargo ["RH_Mk18acog",12];

			_vec addWeaponCargo ["RH_mk18sd",12];
			_vec addWeaponCargo ["RH_Mk18sdaim",12];
			_vec addWeaponCargo ["RH_Mk18sdeot",12];
			_vec addWeaponCargo ["RH_Mk18sdacog",12];

			_vec addWeaponCargo ["RH_Mk18gl",12];
			_vec addWeaponCargo ["RH_Mk18glaim",12];
			_vec addWeaponCargo ["RH_Mk18gleot",12];
			_vec addWeaponCargo ["RH_mk18glacog",12];

//			_vec addWeaponCargo ["RH_SCARL_AIM",12];
			_vec addWeaponCargo ["RH_SCARL_MK4",12];
			_vec addWeaponCargo ["RH_SCARL_SD_DOC",12];
			_vec addWeaponCargo ["RH_SCARLB_SD_EOTECH",12];
			_vec addWeaponCargo ["RH_SCARH_MK4",12];
//			_vec addWeaponCargo ["RH_SCARH_SPECTERDR",12];
			_vec addWeaponCargo ["RH_SCARH_SD_ACOG",12];
//			_vec addWeaponCargo ["RH_m16a2gl",12];
			_vec addWeaponCargo ["RH_m16a3sgl",12];
//			_vec addWeaponCargo ["RH_m16a4glacog",12];
			_vec addWeaponCargo ["RH_m16a4gleotech",12];
//			_vec addWeaponCargo ["RH_m4gl",12];
			_vec addWeaponCargo ["RH_M4sdgleotech_wdl",12];
//			_vec addWeaponCargo ["RH_m4sdglaim",12];
//			_vec addWeaponCargo ["RH_m4sdglacog",12];
			_vec addWeaponCargo ["RH_M4CTSDGLACOG_F",12];
//			_vec addWeaponCargo ["RH_M4CTSDGL_F",12];
			_vec addWeaponCargo ["RH_XM8DGL",12];
			_vec addWeaponCargo ["RH_SCARH_GL_EOTECH",12];
			_vec addWeaponCargo ["RH_SCARH_GL_SPECTERDR",12];
			_vec addWeaponCargo ["RH_SCARLB_SD_GL_AIM",12];
			_vec addWeaponCargo ["RH_SCARL_GL_EOTECH",12];
			_vec addWeaponCargo ["RH_SCARLB_GL_ACOG",12];
//			_vec addWeaponCargo ["RH_m1s",12];
//			_vec addWeaponCargo ["RH_m1saim",12];
			_vec addWeaponCargo ["RH_m1ssp",12];
			_vec addWeaponCargo ["RH_m1steot",12];
			_vec addWeaponCargo ["RH_M14EBRSP",12];
//			_vec addWeaponCargo ["RH_M14EBRSP_SD",12];
//			_vec addWeaponCargo ["RH_mk14ebrsp",12];
//			_vec addWeaponCargo ["RH_mk14ebr_sd",12];
			_vec addWeaponCargo ["RH_mk14ebrsp_sd",12];
			_vec addWeaponCargo ["RH_m39emr",12];
			_vec addWeaponCargo ["RH_mk12mod1",12];
//			_vec addWeaponCargo ["RH_mk12sd",12];
			_vec addWeaponCargo ["RH_m21",12];
			_vec addWeaponCargo ["RH_MK21A5SD",12];
			_vec addWeaponCargo ["RH_m27",12];
			_vec addWeaponCargo ["RH_m27aim",12];
			_vec addWeaponCargo ["RH_m27cacog",12];
			_vec addWeaponCargo ["RH_m27ceotech",12];
			_vec addWeaponCargo ["RH_M249",12];
//			_vec addWeaponCargo ["RH_M249acog",12];
//			_vec addWeaponCargo ["RH_M249elcan",12];
			_vec addWeaponCargo ["RH_M249p",12];
//			_vec addWeaponCargo ["RH_M249pacog",12];
			_vec addWeaponCargo ["RH_M249pelcan",12];
			_vec addWeaponCargo ["RH_Mk48mod1",12];
			_vec addWeaponCargo ["RH_Mk48mod1acog",12];
//			_vec addWeaponCargo ["RH_Mk48mod1elcan",12];
			_vec addWeaponCargo ["RH_M60E4_EOTECH",12];
			_vec addWeaponCargo ["RH_MK43_ACOG",12];
			_vec addWeaponCargo ["RH_MK43_ELCAN",12];
			_vec addWeaponCargo ["RH_XM8DSAW",12];
*/
//HEAVY WEAPONS
		_vec addWeaponCargo ["M136",12];
		_vec addWeaponCargo ["SMAW",12];
		_vec addWeaponCargo ["Stinger",12];
		_vec addWeaponCargo ["JAVELIN",12];
		_vec addWeaponCargo ["M47Launcher_EP1",12];
		_vec addWeaponCargo ["MAAWS",12];
		_vec addWeaponCargo ["BAF_NLAW_Launcher",12];
//PISTOLS
		_vec AddWeaponCargo ["M9",12];
//		_vec AddWeaponCargo ["M9SD",12];
		_vec AddWeaponCargo ["Colt1911",12];
		_vec AddWeaponCargo ["glock17_EP1",12];
		_vec AddWeaponCargo ["revolver_EP1",12];
//SMG
		_vec AddWeaponCargo ["M1014",12];
		_vec AddWeaponCargo ["AA12_PMC",12];
		_vec AddWeaponCargo ["UZI_EP1",12];
		_vec AddWeaponCargo ["UZI_SD_EP1",12];
		_vec AddWeaponCargo ["MP5A5",12];
		_vec AddWeaponCargo ["MP5SD",12];
		_vec AddWeaponCargo ["G36A_camo",12];
		_vec AddWeaponCargo ["G36_C_SD_eotech",12];
		_vec AddWeaponCargo ["m8_compact",12];
		_vec AddWeaponCargo ["G36C_camo",12];
		_vec AddWeaponCargo ["G36_C_SD_camo",12];

//CARBINES
		_vec AddWeaponCargo ["LeeEnfield",12];
		_vec AddWeaponCargo ["FN_FAL",12];
		_vec AddWeaponCargo ["M14_EP1",12];
		_vec AddWeaponCargo ["M16A2",12];
		_vec AddWeaponCargo ["M4A1",12];
		_vec AddWeaponCargo ["M4A1_AIM_SD_camo",12];
		_vec AddWeaponCargo ["M4A1_Aim_camo",12];
		_vec AddWeaponCargo ["G36C",12];
		_vec AddWeaponCargo ["G36K",12];
		_vec AddWeaponCargo ["m8_carbine",12];
		_vec AddWeaponCargo ["m8_holo_sd",12];
		_vec AddWeaponCargo ["m8_compact_pmc",12];
		_vec AddWeaponCargo ["G36A_camo",12];
		_vec AddWeaponCargo ["G36K_camo",12];
		_vec AddWeaponCargo ["M4A3_CCO_EP1",12];
		_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
		_vec AddWeaponCargo ["Scar_H_CQC_CCO_SD",12];
		_vec AddWeaponCargo ["Scar_L_CQC",12];
		_vec AddWeaponCargo ["Scar_L_CQC_CCO_SD",12];
		_vec AddWeaponCargo ["Scar_L_CQC_Holo",12];
		_vec AddWeaponCargo ["Scar_L_STD_Holo",12];
		_vec AddWeaponCargo ["Scar_L_STD_Mk4CQT",12];
		_vec AddWeaponCargo ["SCAR_H_STD_TWS_SD",12];
		_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
//GL
		_vec AddWeaponCargo ["M16A2GL",12];
		_vec AddWeaponCargo ["M16A4_GL",12];
		_vec AddWeaponCargo ["M16A4_ACG_GL",12];
		_vec AddWeaponCargo ["M4A1_RCO_GL",12];
		_vec AddWeaponCargo ["M4A1_HWS_GL_camo",12];
		_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo",12];
		_vec AddWeaponCargo ["m8_carbineGL",12];
		_vec AddWeaponCargo ["M4A3_RCO_GL_EP1",12];
		_vec AddWeaponCargo ["SCAR_H_STD_EGLM_Spect",12];
		_vec AddWeaponCargo ["SCAR_L_CQC_EGLM_Holo",12];
		_vec AddWeaponCargo ["SCAR_L_STD_EGLM_RCO",12];
		_vec AddWeaponCargo ["SCAR_L_STD_EGLM_TWS",12];
		_vec AddWeaponCargo ["BAF_L85A2_UGL_ACOG",12];
		_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
		_vec AddWeaponCargo ["BAF_L85A2_UGL_SUSAT",12];
		_vec AddWeaponCargo ["M32_EP1",12];
		_vec AddWeaponCargo ["M79_EP1",12];
		_vec AddWeaponCargo ["Mk13_EP1",12];
//SNIPER
		_vec AddWeaponCargo ["BAF_L85A2_RIS_ACOG",12];
		_vec AddWeaponCargo ["BAF_L85A2_RIS_CWS",12];
		_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
		_vec AddWeaponCargo ["SCAR_H_LNG_Sniper",12];
		_vec AddWeaponCargo ["SCAR_H_LNG_Sniper_SD",12];
		_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
		_vec AddWeaponCargo ["m16a4_acg",12];
		_vec AddWeaponCargo ["M4SPR",12];
		_vec AddWeaponCargo ["m8_tws",12];
		_vec AddWeaponCargo ["m8_tws_sd",12];
		_vec AddWeaponCargo ["m8_sharpshooter",12];
		_vec AddWeaponCargo ["DMR",12];
//		_vec AddWeaponCargo ["M24",12];
		_vec AddWeaponCargo ["M24_des_EP1",12];
		_vec AddWeaponCargo ["M40A3",12];
//		_vec AddWeaponCargo ["EB_M24A2",12];
		_vec AddWeaponCargo ["EB_M24A2_D",12];
//		_vec AddWeaponCargo ["EB_M24A3",12];
		_vec AddWeaponCargo ["EB_M24A3_D",12];

		_vec AddWeaponCargo ["BAF_LRR_scoped",12];
//		_vec AddWeaponCargo ["BAF_LRR_scoped_W",12];
		_vec AddWeaponCargo ["M107",12];
		_vec AddWeaponCargo ["M107_TWS_EP1",12];
		_vec AddWeaponCargo ["M110_NVG_EP1",12];
		_vec AddWeaponCargo ["M110_TWS_EP1",12];
		_vec AddWeaponCargo ["BAF_AS50_scoped",12];
		_vec AddWeaponCargo ["BAF_AS50_TWS",12];
//MG
		_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
//		_vec AddWeaponCargo ["MG36",12];
		_vec AddWeaponCargo ["MG36_camo",12];		
		_vec AddWeaponCargo ["M249",12];
		_vec AddWeaponCargo ["M249_m145_EP1",12];
		_vec AddWeaponCargo ["M249_TWS_EP1",12];
		_vec AddWeaponCargo ["m8_SAW",12];
		_vec AddWeaponCargo ["M240",12];
		_vec AddWeaponCargo ["m240_scoped_EP1",12];
		_vec AddWeaponCargo ["M60A4_EP1",12];
		_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//		_vec AddWeaponCargo ["Mk_48",12];
		_vec AddWeaponCargo ["Mk_48_DES_EP1",12];
//ammo 
//FHQ ammo
/*
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD_SD",12];
//new ammo
		_vec addMagazineCargo ["R3F_25Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_FRF2",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_SD_FRF2",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_TRACER_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_SD_HK417",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PGM",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PEI_PGM",12];
		_vec addMagazineCargo ["R3F_AT4CS_Mag",12];
		_vec addMagazineCargo ["R3F_200Rnd_556x45_MINIMI",12];
		_vec addMagazineCargo ["R3F_100Rnd_762x51_MINIMI",12];
		_vec addMagazineCargo ["ACR_17Rnd_9x19",12];
		_vec addMagazineCargo ["ACR_17Rnd_9x19SD",12];
		_vec addMagazineCargo ["ACR_100Rnd_762x51_M240",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_StanagSD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5SD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5",12];
		_vec addMagazineCargo ["ACR_30Rnd_762x39_SA58",12];
		_vec addMagazineCargo ["ACR_CG_HEAT",12];
		_vec addMagazineCargo ["ACR_10Rnd_762x51",12];
		_vec addMagazineCargo ["40Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["40Rnd_46x30_sd_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_sd_mp7",12];
		_vec addMagazineCargo ["15Rnd_9x19_p99",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99",12];
		_vec addMagazineCargo ["15Rnd_9x19_p99_sd",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99_sd",12];
//RH ammo##
		_vec addMagazineCargo ["RH_7Rnd_50_AE",12];
		_vec addMagazineCargo ["RH_6Rnd_44_Mag",12];
		_vec addMagazineCargo ["RH_6Rnd_357_Mag",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mksd",12];
		_vec addMagazineCargo ["RH_8Rnd_762_tt33",12];
		_vec addMagazineCargo ["RH_10Rnd_22LR_mk2",12];
		_vec addMagazineCargo ["RH_7Rnd_32cal_ppk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_P38",12];
		_vec addMagazineCargo ["RH_13Rnd_9x19_BHP",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17SD",12];
		_vec addMagazineCargo ["RH_19Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_33Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_20Rnd_9x19_M93",12];
		_vec addMagazineCargo ["RH_20Rnd_32cal_vz61",12];
		_vec addMagazineCargo ["RH_12Rnd_45cal_usp",12];
		_vec addMagazineCargo ["RH_8Rnd_45cal_m1911",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_usp",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_uspsd",12];
		_vec addMagazineCargo ["RH_30Rnd_9x19_tec",12];
		_vec addMagazineCargo ["RH_32Rnd_9x19_Muzi",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_13RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_pMag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_Mag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_pMag",12];
//adding
		_vec addMagazineCargo ["30Rnd_9x19_MP5p",12];
//
		_vec addMagazineCargo ["RH_30Rnd_6x35_PDW",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_AR10",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD_mk14",12];
		_vec addMagazineCargo ["RH_30Rnd_556x45_AK",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_Pellets",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_74Slug",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_HK417",12];
*/
//cz ammo
		_vec addMagazineCargo ["30Rnd_762x39_SA58",12];
		_vec addMagazineCargo ["18Rnd_9x19_Phantom",12];
		_vec addMagazineCargo ["18Rnd_9x19_PhantomSD",12];
		_vec addMagazineCargo ["10Rnd_9x19_Compact",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVOSD",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVO",12];
		_vec addMagazineCargo ["10Rnd_762x51_CZ750",12];
		_vec addMagazineCargo ["10Rnd_B_765x17_Ball",12];
		_vec addmagazinecargo ["100Rnd_762x54_PK",12];

//basics
		_vec addWeaponCargo ["huntingrifle",12];
		_vec addWeaponCargo ["Binocular",2];
		_vec addWeaponCargo ["Binocular_Vector",2];
		_vec addWeaponCargo ["NVGoggles",2];
		_vec addWeaponCargo ["Laserdesignator",2];
		_vec addMagazineCargo ["M136",12];
		_vec addMagazineCargo ["SMAW_HEAA",12];
		_vec addMagazineCargo ["SMAW_HEDP",12];
		_vec addMagazineCargo ["Stinger",12];
		_vec addMagazineCargo ["JAVELIN",12];
		_vec addMagazineCargo ["pipebomb",12];
		_vec addMagazineCargo ["mine",12];
		_vec addMagazineCargo ["Dragon_EP1",12];
		_vec addMagazineCargo ["MAAWS_HEAT",12];
		_vec addMagazineCargo ["MAAWS_HEDP",12];
		_vec addMagazineCargo ["NLAW",12];
		_vec addMagazineCargo ["Laserbatteries",2];
//		_vec addMagazineCargo ["HandGrenade_West",12];
//		_vec addMagazineCargo ["BAF_L109A1_HE",12];
		_vec addMagazineCargo ["IRStrobe",2];
		_vec addMagazineCargo ["IR_Strobe_Marker",2];		
		_vec addmagazinecargo ["7rnd_45ACP_1911",12];
		_vec addmagazinecargo ["15rnd_9x19_m9sd",12];
		_vec addmagazinecargo ["15rnd_9x19_m9",12];
		_vec addmagazinecargo ["8Rnd_B_Beneli_74Slug",12];
		_vec addmagazinecargo ["8Rnd_B_Beneli_Pellets",12];
		_vec addmagazinecargo ["30Rnd_9x19_MP5SD",12];
		_vec addmagazinecargo ["30Rnd_9x19_MP5",12];
		_vec addmagazinecargo ["30Rnd_556x45_StanagSD",12];
		_vec addmagazinecargo ["30rnd_556x45_Stanag",12];
		_vec addmagazinecargo ["30Rnd_556x45_G36",12];
		_vec addmagazinecargo ["30Rnd_556x45_G36SD",12];
		_vec addmagazinecargo ["200Rnd_556x45_M249",12];
		_vec addmagazinecargo ["100Rnd_762x51_M240",12];
		_vec addmagazinecargo ["5Rnd_762x51_M24",12];
		_vec addmagazinecargo ["20Rnd_762x51_DMR",12];
		_vec addmagazinecargo ["10Rnd_127x99_m107",12];
		_vec addMagazineCargo ["5x_22_LR_17_HMR",12];
		_vec addMagazineCargo ["EB_5Rnd_762x51_CZ550_p",12];
		_vec addMagazineCargo ["100Rnd_556x45_BetaCMag",12];
		_vec addMagazineCargo ["20Rnd_762x51_FNFAL",12];
		_vec addMagazineCargo ["20Rnd_762x51_B_SCAR",12];
		_vec addMagazineCargo ["20Rnd_762x51_SB_SCAR",12];
		_vec addMagazineCargo ["6Rnd_HE_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareGreen_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareRed_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareWhite_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareYellow_M203",12];
		_vec addMagazineCargo ["6Rnd_Smoke_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeGreen_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeRed_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeYellow_M203",12];
		_vec addMagazineCargo ["6Rnd_45ACP",12];
		_vec addMagazineCargo ["17Rnd_9x19_glock17",12];
		_vec addMagazineCargo ["5Rnd_127x99_as50",12];
		_vec addMagazineCargo ["200Rnd_556x45_L110A1",12];
		_vec addMagazineCargo ["5Rnd_86x70_L115A1",12];
		_vec addMagazineCargo ["10x_303",12];	
		_vec addMagazineCargo ["30Rnd_9x19_UZI",12];
		_vec addMagazineCargo ["30Rnd_9x19_UZI_SD",12];
		_vec addMagazineCargo ["20Rnd_B_AA12_74Slug",12];
		_vec addMagazineCargo ["20Rnd_B_AA12_HE",12];
		_vec addMagazineCargo ["20Rnd_B_AA12_Pellets",12];
		_vec addmagazinecargo ["200Rnd_762x51_M240",12];
		_vec addmagazinecargo ["100Rnd_556x45_M249",12];
		if (gitsnades == 1) then
		{
//new weapons
		_vec AddWeaponCargo ["EB_BAF_LRR_scoped_O",2];
		_vec AddWeaponCargo ["EB_m79p",2];
		_vec AddWeaponCargo ["EB_m1911SD",2];
		_vec AddWeaponCargo ["EB_MX991_w",2];
		_vec AddWeaponCargo ["EB_MX991_r",2];
		_vec AddWeaponCargo ["EB_MX991_g",2];
		_vec AddWeaponCargo ["EB_mkvFlarePistol",2];

//new ammo
		_vec addmagazinecargo ["EB_5Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_60Rnd_556x45_Stanag",12];

		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_T",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_P",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_PT",12];
		_vec addMagazineCargo ["EB_7rnd_m1911SD",12];
		_vec addMagazineCargo ["EB_7rnd_m1911",12];
		_vec addMagazineCargo ["EB_1Rnd_BS_M576",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M381",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M406",12];
		_vec addMagazineCargo ["EB_1Rnd_HEDP_M433",12];
		_vec addMagazineCargo ["EB_1Rnd_AB_M397",12];
		_vec addMagazineCargo ["EB_m406vest",12];
		_vec addMagazineCargo ["EB_1Rnd_Smoke_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeRed_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeGreen_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeYellow_40mm",12];
		_vec addMagazineCargo ["EB_40mm_white",12];
		_vec addMagazineCargo ["EB_40mm_green",12];
		_vec addMagazineCargo ["EB_40mm_red",12];
		_vec addMagazineCargo ["EB_40mm_yellow",12];
		_vec addMagazineCargo ["EB_1Rnd_Smoke_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeRed_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeGreen_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeYellow_MKV",12];
		_vec addMagazineCargo ["EB_40mm_mkv_White",12];
		_vec addMagazineCargo ["EB_40mm_mkv_red",12];
		_vec addMagazineCargo ["EB_40mm_mkv_green",12];
		_vec addMagazineCargo ["EB_40mm_mkv_yellow",12];
		_vec addMagazineCargo ["EB_10Rnd_svd",12];
		_vec addMagazineCargo ["EB_20Rnd_svd",12];
		_vec addMagazineCargo ["EB_10Rnd_svd_T",12];
		_vec addMagazineCargo ["EB_20Rnd_svd_T",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_AP",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_AP",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_BT",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_BT",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_T",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_T",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_DT",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_DT",12];
		_vec addMagazineCargo ["EB_molotov_mag",12];
		_vec addMagazineCargo ["EB_M118_mag_remote",12];
		_vec addMagazineCargo ["EB_v40gren",12];
		_vec addMagazineCargo ["EB_m308gren",12];
		_vec addMagazineCargo ["EB_m14gren",12];
		_vec addMagazineCargo ["EB_mk40gren",12];
		_vec addMagazineCargo ["EB_m34gren",12];
		_vec addMagazineCargo ["EB_m61gren",12];
		_vec addMagazineCargo ["EB_m67gren",12];
		_vec addMagazineCargo ["EB_mk3a2gren",12];
		_vec addMagazineCargo ["EB_m18white",12];
		_vec addMagazineCargo ["EB_m18green",12];
		_vec addMagazineCargo ["EB_m18purple",12];
		_vec addMagazineCargo ["EB_m18red",12];
		_vec addMagazineCargo ["EB_m18yellow",12];
		_vec addMagazineCargo ["EB_m18blue",12];
		_vec addMagazineCargo ["EB_m18orange",12];

//new M107 ammo
		_vec addMagazineCargo ["LWS_Laserbatteries",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_AP",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_HE",12];
//new MG ammo
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_I",12];
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_AP",12];
		_vec addmagazinecargo ["EB_600Rnd_762x51_M240",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_AP",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_I",12];

//new items
		_vec AddWeaponCargo ["EB_TIscanner",2];
		_vec AddWeaponCargo ["EB_TIGoggles",2];
		_vec AddWeaponCargo ["EB_S10",2];
		_vec addmagazinecargo ["EB_knife",12];
		_vec addmagazinecargo ["EB_kabar",12];
		_vec addmagazinecargo ["EB_ItemFuelcanEmpty",12];
		_vec AddWeaponCargo ["EB_ItemSiphon",2];
		_vec AddWeaponCargo ["EB_ItemSil_hgun",12];
		_vec AddWeaponCargo ["EB_ItemSil_rifle",12];

//new GL AMMO
		_vec addMagazineCargo ["5Rnd_HE_M203",12];
		_vec addMagazineCargo ["5Rnd_HEDP_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareWhite_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareRed_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareYellow_M203",12];
		_vec addMagazineCargo ["5Rnd_Smoke_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeRed_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeYellow_M203",12];

		_vec addMagazineCargo ["EB_SmokeShellChem",12];
		_vec addMagazineCargo ["BD_1Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Chem_M203",12];
		_vec addMagazineCargo ["5Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_1Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["5Rnd_Buckshot_M203",12];
		};
//old GL ammo
		_vec addMagazineCargo ["1rnd_HE_M203",12];
		_vec addMagazineCargo ["FlareWhite_M203",12];
		_vec addMagazineCargo ["FlareRed_M203",12];
		_vec addMagazineCargo ["FlareGreen_M203",12];
		_vec addMagazineCargo ["FlareYellow_M203",12];
		_vec addMagazineCargo ["SmokeShell",12];
		_vec addMagazineCargo ["SmokeShellRed",12];
		_vec addMagazineCargo ["SmokeShellGreen",12];
		_vec addMagazineCargo ["SmokeShellYellow",12];
		_vec addMagazineCargo ["SmokeShellPurple",12];
		_vec addMagazineCargo ["SmokeShellBlue",12];
		_vec addMagazineCargo ["SmokeShellOrange",12];
	Sleep 1.0;
	};

//US weapons ranked

	_FillAmmoBoxUR =
	{
		_vec = _this select 0;
		_playertype = typeOf (vehicle player);
		clearWeaponCargo _vec;
		clearMagazineCargo _vec;
		switch (_rank) do
		{
			 case 0:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_M60",5];

				_vec addWeaponCargo ["M136",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
				_vec AddWeaponCargo ["M107",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];

				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
//new stuff
/*
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
//RH
				_vec addWeaponCargo ["RH_mk18",12];
				_vec addWeaponCargo ["RH_Mk18aim",12];

				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_M249",12];

//FHQ
//				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];				
*/
			};
			 case 1:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_M60",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["Stinger",12];

				_vec AddWeaponCargo ["Colt1911",12];

				_vec AddWeaponCargo ["UZI_EP1",12];

				_vec AddWeaponCargo ["M1014",12];

				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];

				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["m8_compact",12];

				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["M79_EP1",12];

				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
				_vec AddWeaponCargo ["M107",12];

				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];

				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				
/*
//RH
				_vec addWeaponCargo ["RH_mk18",12];
				_vec addWeaponCargo ["RH_Mk18aim",12];
//				_vec addWeaponCargo ["RH_mk18eot",12];
//				_vec addWeaponCargo ["RH_Mk18acog",12];

//				_vec addWeaponCargo ["RH_mk18sd",12];
//				_vec addWeaponCargo ["RH_Mk18sdaim",12];
//				_vec addWeaponCargo ["RH_Mk18sdeot",12];
//				_vec addWeaponCargo ["RH_Mk18sdacog",12];

				_vec addWeaponCargo ["RH_Mk18gl",12];
//				_vec addWeaponCargo ["RH_Mk18glaim",12];
//				_vec addWeaponCargo ["RH_Mk18gleot",12];
//				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_M249",12];
//new stuff
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
//FHQ
//				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
//				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
*/
			};
			case 2:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK33A4_EO",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_FAL_I",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM1",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_SG1",5];
				_vec AddWeaponCargo ["PRACS_M60",5];
				_vec AddWeaponCargo ["PRACS_MAG58",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["JAVELIN",12];
				_vec addWeaponCargo ["Stinger",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["revolver_EP1",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["MP5A5",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["M16A4_ACG",12];
				_vec AddWeaponCargo ["M4A1_Aim",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36A_camo",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
				_vec AddWeaponCargo ["m8_compact",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL",12];
				_vec AddWeaponCargo ["m8_carbineGL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
				_vec AddWeaponCargo ["m8_sharpshooter",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
//				_vec AddWeaponCargo ["EB_M24A2",12];
				_vec AddWeaponCargo ["EB_M24A2_D",12];
				_vec AddWeaponCargo ["M107",12];

				_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["M240",12];
				_vec AddWeaponCargo ["M60A4_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["Evo_mrad_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];

				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
/*
//RH
				_vec addWeaponCargo ["RH_mk18",12];
				_vec addWeaponCargo ["RH_Mk18aim",12];
				_vec addWeaponCargo ["RH_mk18eot",12];
//				_vec addWeaponCargo ["RH_Mk18acog",12];

				_vec addWeaponCargo ["RH_mk18sd",12];
//				_vec addWeaponCargo ["RH_Mk18sdaim",12];
//				_vec addWeaponCargo ["RH_Mk18sdeot",12];
//				_vec addWeaponCargo ["RH_Mk18sdacog",12];

				_vec addWeaponCargo ["RH_Mk18gl",12];
//				_vec addWeaponCargo ["RH_Mk18glaim",12];
//				_vec addWeaponCargo ["RH_Mk18gleot",12];
//				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_m9sd",12];
				_vec addWeaponCargo ["RH_m1911sd",12];
				_vec addWeaponCargo ["RH_mac10p",12];
				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_krisssd",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_PDW_AIM",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_m4sd",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_sc2aim",12];
				_vec addWeaponCargo ["RH_SCARL_MK4",12];
				_vec addWeaponCargo ["RH_m16a3sgl",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_m27aim",12];
				_vec addWeaponCargo ["RH_M249",12];
				_vec addWeaponCargo ["RH_M249p",12];
//new stuff
				_vec addWeaponCargo ["R3F_JIM_LR",12];
				_vec addWeaponCargo ["ACR_CG",12];
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["ACR_GLOCK17SD",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["C1987_MP7_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_zp",12];
				_vec addWeaponCargo ["ACR_SD6",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["ACR_M4A3REF",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
				_vec addWeaponCargo ["R3F_Famas_surb",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
//				_vec addWeaponCargo ["ACR_AW_308_D",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
				_vec addWeaponCargo ["R3F_Minimi_EOT",12];

//FHQ
//				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
				_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];	
*/
			};
			case 3:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK33A4_EO",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_HK53A3_EO",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_FAL_I",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a3t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM1",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM2",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4k",5];
				_vec AddWeaponCargo ["PRACS_SG1",5];
				_vec AddWeaponCargo ["PRACS_M60",5];
				_vec AddWeaponCargo ["PRACS_MAG58",5];
				_vec AddWeaponCargo ["PRACS_Mk48",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["JAVELIN",12];
				_vec addWeaponCargo ["BAF_NLAW_Launcher",12];
				_vec addWeaponCargo ["Stinger",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["revolver_EP1",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["UZI_SD_EP1",12];
				_vec AddWeaponCargo ["MP5A5",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["AA12_PMC",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["M16A4_ACG",12];
				_vec AddWeaponCargo ["M4A1_Aim",12];
				_vec AddWeaponCargo ["M4A1_Aim_camo",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36A_camo",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["G36C_camo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["Scar_L_CQC_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Holo",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
				_vec AddWeaponCargo ["m8_compact",12];
				_vec AddWeaponCargo ["m8_carbine",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL",12];
				_vec AddWeaponCargo ["M4A1_RCO_GL",12];
				_vec AddWeaponCargo ["M4A3_RCO_GL_EP1",12];
				_vec AddWeaponCargo ["M4A3_CCO_EP1",12];
				_vec AddWeaponCargo ["m8_carbineGL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_SUSAT",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["Mk13_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
				_vec AddWeaponCargo ["m8_sharpshooter",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
//				_vec AddWeaponCargo ["EB_M24A2",12];
				_vec AddWeaponCargo ["EB_M24A2_D",12];
//				_vec AddWeaponCargo ["EB_M24A3",12];
				_vec AddWeaponCargo ["EB_M24A3_D",12];
				_vec AddWeaponCargo ["M40A3",12];
				_vec AddWeaponCargo ["BAF_LRR_scoped",12];
//				_vec AddWeaponCargo ["BAF_LRR_scoped_W",12];
				_vec AddWeaponCargo ["M107",12];
				_vec AddWeaponCargo ["M110_NVG_EP1",12];
				_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["m8_SAW",12];
				_vec AddWeaponCargo ["M240",12];
				_vec AddWeaponCargo ["m240_scoped_EP1",12];
				_vec AddWeaponCargo ["M60A4_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["Evo_mrad_ACR",12];
				_vec AddWeaponCargo ["UK59_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];
				_vec AddWeaponCargo ["CZ805_A2_ACR",12];
				_vec AddWeaponCargo ["LRTV_ACR",12];

				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_HG",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_UGL_PF",12];
/*
//RH
				_vec addWeaponCargo ["RH_mk18",12];
				_vec addWeaponCargo ["RH_Mk18aim",12];
				_vec addWeaponCargo ["RH_mk18eot",12];
				_vec addWeaponCargo ["RH_Mk18acog",12];

				_vec addWeaponCargo ["RH_mk18sd",12];
//				_vec addWeaponCargo ["RH_Mk18sdaim",12];
//				_vec addWeaponCargo ["RH_Mk18sdeot",12];
//				_vec addWeaponCargo ["RH_Mk18sdacog",12];

				_vec addWeaponCargo ["RH_Mk18gl",12];
				_vec addWeaponCargo ["RH_Mk18glaim",12];
//				_vec addWeaponCargo ["RH_Mk18gleot",12];
//				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_m93r",12];
				_vec addWeaponCargo ["RH_p226",12];
				_vec addWeaponCargo ["RH_m9sd",12];
				_vec addWeaponCargo ["RH_m1911sd",12];
				_vec addWeaponCargo ["RH_anac",12];
				_vec addWeaponCargo ["RH_mac10p",12];
				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_umpsd",12];
				_vec addWeaponCargo ["RH_krisssd",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_pdreot",12];
				_vec addWeaponCargo ["RH_PDW_AIM",12];
				_vec addWeaponCargo ["RH_M4CMKEOTECH",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_ar10s",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_m16a3cs",12];
				_vec addWeaponCargo ["RH_m4a1eotech",12];
				_vec addWeaponCargo ["RH_m4sd",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_sc2aim",12];
				_vec addWeaponCargo ["RH_SCARL_MK4",12];
				_vec addWeaponCargo ["RH_SCARH_MK4",12];
				_vec addWeaponCargo ["RH_m16a3sgl",12];
				_vec addWeaponCargo ["RH_m16a4gleotech",12];
				_vec addWeaponCargo ["RH_M4sdgleotech_wdl",12];
				_vec addWeaponCargo ["RH_M4CTSDGLACOG_F",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_M14EBRSP",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_m27aim",12];
				_vec addWeaponCargo ["RH_m21",12];
				_vec addWeaponCargo ["RH_M249",12];
				_vec addWeaponCargo ["RH_M249p",12];
				_vec addWeaponCargo ["RH_XM8DSAW",12];

//new stuff
				_vec addWeaponCargo ["R3F_JIM_LR",12];
				_vec addWeaponCargo ["ACR_CG",12];
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["ACR_GLOCK17SD",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["C1987_MP7_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_zp",12];
				_vec addWeaponCargo ["C1987_MP7_eot",12];
				_vec addWeaponCargo ["ACR_SD6",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["ACR_M4A3REF",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2_J4_HG",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
				_vec addWeaponCargo ["R3F_Famas_surb",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_HG",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
				_vec addWeaponCargo ["R3F_HK417S_HG_SD",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II",12];
//				_vec addWeaponCargo ["ACR_AW_308_D",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
				_vec addWeaponCargo ["R3F_Minimi_EOT",12];
				_vec addWeaponCargo ["R3F_Minimi_762_EOT_HG",12];
//FHQ
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_F",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
				_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_DESERT",12];
*/
			};
			 case 4:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK33A4_EO",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_HK53A3_EO",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SUIT",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_FAL_I",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a3t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM1",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM2",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4k",5];
				_vec AddWeaponCargo ["PRACS_g3a4_M68",5];
				_vec AddWeaponCargo ["PRACS_SG1",5];
				_vec AddWeaponCargo ["PRACS_SG1_NVS",5];
				_vec AddWeaponCargo ["PRACS_M60",5];
				_vec AddWeaponCargo ["PRACS_MAG58",5];
				_vec AddWeaponCargo ["PRACS_Mk48",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["JAVELIN",12];
				_vec addWeaponCargo ["BAF_NLAW_Launcher",12];
				_vec addWeaponCargo ["MAAWS",12];
				_vec addWeaponCargo ["Stinger",12];
				_vec AddWeaponCargo ["M9SD",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["revolver_EP1",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["UZI_SD_EP1",12];
				_vec AddWeaponCargo ["MP5A5",12];
				_vec AddWeaponCargo ["MP5SD",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["AA12_PMC",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["M16A4_ACG",12];
				_vec AddWeaponCargo ["M4A1_Aim",12];
				_vec AddWeaponCargo ["M4A1_Aim_camo",12];
				_vec AddWeaponCargo ["M4A1_AIM_SD_camo",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36A_camo",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["G36C_camo",12];
				_vec AddWeaponCargo ["G36_C_SD_camo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_ACOG",12];
				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["Scar_L_CQC_CCO_SD",12];
				_vec AddWeaponCargo ["Scar_L_CQC_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Mk4CQT",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
				_vec AddWeaponCargo ["m8_holo_sd",12];
				_vec AddWeaponCargo ["m8_compact",12];
				_vec AddWeaponCargo ["m8_carbine",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_camo",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo",12];
				_vec AddWeaponCargo ["M4A1_RCO_GL",12];
				_vec AddWeaponCargo ["M4A3_RCO_GL_EP1",12];
				_vec AddWeaponCargo ["M4A3_CCO_EP1",12];
				_vec AddWeaponCargo ["m8_carbineGL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_ACOG",12];
				_vec AddWeaponCargo ["SCAR_H_STD_EGLM_Spect",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["Mk13_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
				_vec AddWeaponCargo ["M4SPR",12];
				_vec AddWeaponCargo ["m8_sharpshooter",12];
				_vec AddWeaponCargo ["DMR",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
//				_vec AddWeaponCargo ["EB_M24A2",12];
				_vec AddWeaponCargo ["EB_M24A2_D",12];
//				_vec AddWeaponCargo ["EB_M24A3",12];
				_vec AddWeaponCargo ["EB_M24A3_D",12];
				_vec AddWeaponCargo ["M40A3",12];
				_vec AddWeaponCargo ["BAF_LRR_scoped",12];
//				_vec AddWeaponCargo ["BAF_LRR_scoped_W",12];
				_vec AddWeaponCargo ["M107",12];
				_vec AddWeaponCargo ["BAF_AS50_scoped",12];
				_vec AddWeaponCargo ["SCAR_H_LNG_Sniper",12];
				_vec AddWeaponCargo ["M110_NVG_EP1",12];
				_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["MG36_camo",12];		
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["M249_m145_EP1",12];
				_vec AddWeaponCargo ["m8_SAW",12];
				_vec AddWeaponCargo ["M240",12];
				_vec AddWeaponCargo ["m240_scoped_EP1",12];
				_vec AddWeaponCargo ["M60A4_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["Evo_mrad_ACR",12];
				_vec AddWeaponCargo ["evo_sd_ACR",12];
				_vec AddWeaponCargo ["UK59_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];
				_vec AddWeaponCargo ["CZ805_A2_ACR",12];
				_vec AddWeaponCargo ["CZ805_B_GL_ACR",12];
				_vec AddWeaponCargo ["LRTV_ACR",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_HG",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_UGL_PF",12];

/*
//RH
//				_vec addWeaponCargo ["RH_mk18",12];
//				_vec addWeaponCargo ["RH_Mk18aim",12];
				_vec addWeaponCargo ["RH_mk18eot",12];
				_vec addWeaponCargo ["RH_Mk18acog",12];

				_vec addWeaponCargo ["RH_mk18sd",12];
				_vec addWeaponCargo ["RH_Mk18sdaim",12];
//				_vec addWeaponCargo ["RH_Mk18sdeot",12];
//				_vec addWeaponCargo ["RH_Mk18sdacog",12];

				_vec addWeaponCargo ["RH_Mk18gl",12];
				_vec addWeaponCargo ["RH_Mk18glaim",12];
//				_vec addWeaponCargo ["RH_Mk18gleot",12];
//				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_m93r",12];
				_vec addWeaponCargo ["RH_p226",12];
				_vec addWeaponCargo ["RH_mk22vsd",12];
				_vec addWeaponCargo ["RH_m9sd",12];
				_vec addWeaponCargo ["RH_m1911sd",12];
				_vec addWeaponCargo ["RH_anac",12];
				_vec addWeaponCargo ["RH_bull",12];
				_vec addWeaponCargo ["RH_pp2000p",12];
				_vec addWeaponCargo ["RH_mac10p",12];
				_vec addWeaponCargo ["RH_tec9",12];
				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_mp5a4rfx",12];
				_vec addWeaponCargo ["RH_P90isd",12];
				_vec addWeaponCargo ["RH_umpsd",12];
				_vec addWeaponCargo ["RH_krisssd",12];
				_vec addWeaponCargo ["RH_uzisd",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_pp2000eot",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_pdreot",12];
				_vec addWeaponCargo ["RH_PDW_AIM",12];
				_vec addWeaponCargo ["RH_M4CMKEOTECH",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_ar10s",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_m16a3cs",12];
				_vec addWeaponCargo ["RH_m4a1eotech",12];
				_vec addWeaponCargo ["RH_m4sd",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_sc2aim",12];
				_vec addWeaponCargo ["RH_SCARL_MK4",12];
				_vec addWeaponCargo ["RH_SCARH_MK4",12];
				_vec addWeaponCargo ["RH_m16a3sgl",12];
				_vec addWeaponCargo ["RH_m16a4gleotech",12];
				_vec addWeaponCargo ["RH_M4sdgleotech_wdl",12];
				_vec addWeaponCargo ["RH_M4CTSDGLACOG_F",12];
				_vec addWeaponCargo ["RH_SCARH_GL_EOTECH",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_M14EBRSP",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_m27aim",12];
				_vec addWeaponCargo ["RH_m27ceotech",12];
				_vec addWeaponCargo ["RH_m21",12];
				_vec addWeaponCargo ["RH_M249",12];
				_vec addWeaponCargo ["RH_M249p",12];
				_vec addWeaponCargo ["RH_Mk48mod1",12];
				_vec addWeaponCargo ["RH_XM8DSAW",12];
//new stuff
				_vec addWeaponCargo ["R3F_JIM_LR",12];
				_vec addWeaponCargo ["ACR_CG",12];
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["C1987_P99_green_sd",12];
				_vec addWeaponCargo ["ACR_GLOCK17SD",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["C1987_MP7_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_zp",12];
				_vec addWeaponCargo ["C1987_MP7_zp_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_eot",12];
				_vec addWeaponCargo ["C1987_MP7_eot_sd_t",12];
				_vec addWeaponCargo ["ACR_SD6",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_SA58ACOG",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["ACR_M4A3REF",12];
				_vec addWeaponCargo ["ACR_M4A3ACOG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_GL",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203_SD",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2_J4_HG",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
				_vec addWeaponCargo ["R3F_Famas_surb",12];
				_vec addWeaponCargo ["R3F_Famas_surb_EOT_SD",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_HG",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
				_vec addWeaponCargo ["R3F_HK417S_EOT_HG",12];
				_vec addWeaponCargo ["R3F_HK417S_HG_SD",12];
				_vec addWeaponCargo ["R3F_FRF2_J8",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II",12];
//				_vec addWeaponCargo ["ACR_AW_308_D",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
				_vec addWeaponCargo ["ACR_M60E4M1",12];
				_vec addWeaponCargo ["R3F_Minimi_EOT",12];
				_vec addWeaponCargo ["R3F_Minimi_J4",12];
				_vec addWeaponCargo ["R3F_minimi_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Minimi_762_EOT_HG",12];
//FHQ
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_F",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TWS_TAN",12];
				_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_SD_DESERT",12];
*/
			};
			 case 5:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK33A4_EO",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_HK53A3_EO",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SUIT",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203_SUIT",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_FAL_I",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_M16A1_NVS",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a3t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM1",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM2",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4k",5];
				_vec AddWeaponCargo ["PRACS_g3a4_M68",5];
				_vec AddWeaponCargo ["PRACS_g3a4sp",5];
				_vec AddWeaponCargo ["PRACS_SG1",5];
				_vec AddWeaponCargo ["PRACS_SG1_SD",5];
				_vec AddWeaponCargo ["PRACS_SG1_NVS",5];
				_vec AddWeaponCargo ["PRACS_M60",5];
				_vec AddWeaponCargo ["PRACS_MAG58",5];
				_vec AddWeaponCargo ["PRACS_Mk48",5];
				_vec AddWeaponCargo ["PRACS_Mk48_SP",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["SMAW",12];
				_vec addWeaponCargo ["JAVELIN",12];
				_vec addWeaponCargo ["BAF_NLAW_Launcher",12];
				_vec addWeaponCargo ["MAAWS",12];
				_vec addWeaponCargo ["Stinger",12];
				_vec AddWeaponCargo ["M9SD",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["glock17_EP1",12];
				_vec AddWeaponCargo ["revolver_EP1",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["UZI_SD_EP1",12];
				_vec AddWeaponCargo ["MP5A5",12];
				_vec AddWeaponCargo ["MP5SD",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["AA12_PMC",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["M16A4_ACG",12];
				_vec AddWeaponCargo ["M4A1_Aim",12];
				_vec AddWeaponCargo ["M4A1_Aim_camo",12];
				_vec AddWeaponCargo ["M4A1_AIM_SD_camo",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36A_camo",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["G36C_camo",12];
				_vec AddWeaponCargo ["G36_C_SD_camo",12];
				_vec AddWeaponCargo ["G36_C_SD_eotech",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_ACOG",12];
				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["Scar_L_CQC_CCO_SD",12];
				_vec AddWeaponCargo ["Scar_L_CQC_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Mk4CQT",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO_SD",12];
				_vec AddWeaponCargo ["m8_holo_sd",12];
				_vec AddWeaponCargo ["m8_compact_pmc",12];
				_vec AddWeaponCargo ["m8_compact",12];
				_vec AddWeaponCargo ["m8_carbine",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL",12];
				_vec AddWeaponCargo ["M16A4_ACG_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_camo",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo",12];
				_vec AddWeaponCargo ["M4A1_RCO_GL",12];
				_vec AddWeaponCargo ["M4A3_RCO_GL_EP1",12];
				_vec AddWeaponCargo ["M4A3_CCO_EP1",12];
				_vec AddWeaponCargo ["m8_carbineGL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_ACOG",12];
				_vec AddWeaponCargo ["SCAR_H_STD_EGLM_Spect",12];
				_vec AddWeaponCargo ["SCAR_L_CQC_EGLM_Holo",12];
				_vec AddWeaponCargo ["SCAR_L_STD_EGLM_RCO",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["Mk13_EP1",12];
				_vec AddWeaponCargo ["M32_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
				_vec AddWeaponCargo ["M4SPR",12];
				_vec AddWeaponCargo ["m8_sharpshooter",12];
				_vec AddWeaponCargo ["m8_tws",12];
				_vec AddWeaponCargo ["m8_tws_sd",12];
				_vec AddWeaponCargo ["DMR",12];
//				_vec AddWeaponCargo ["M24",12];
				_vec AddWeaponCargo ["M24_des_EP1",12];
//				_vec AddWeaponCargo ["EB_M24A2",12];
				_vec AddWeaponCargo ["EB_M24A2_D",12];
//				_vec AddWeaponCargo ["EB_M24A3",12];
				_vec AddWeaponCargo ["EB_M24A3_D",12];
				_vec AddWeaponCargo ["M40A3",12];
				_vec AddWeaponCargo ["BAF_LRR_scoped",12];
//				_vec AddWeaponCargo ["BAF_LRR_scoped_W",12];
				_vec AddWeaponCargo ["M107",12];
				_vec AddWeaponCargo ["BAF_AS50_scoped",12];
				_vec AddWeaponCargo ["BAF_AS50_TWS",12];
				_vec AddWeaponCargo ["SCAR_H_LNG_Sniper",12];
				_vec AddWeaponCargo ["SCAR_H_LNG_Sniper_SD",12];
				_vec AddWeaponCargo ["M110_NVG_EP1",12];
				_vec AddWeaponCargo ["M110_TWS_EP1",12];
				_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["MG36_camo",12];		
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["M249_m145_EP1",12];
				_vec AddWeaponCargo ["M249_TWS_EP1",12];
				_vec AddWeaponCargo ["m8_SAW",12];
				_vec AddWeaponCargo ["M240",12];
				_vec AddWeaponCargo ["m240_scoped_EP1",12];
				_vec AddWeaponCargo ["M60A4_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//				_vec AddWeaponCargo ["Mk_48",12];
				_vec AddWeaponCargo ["Mk_48_DES_EP1",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM_SD",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["Evo_mrad_ACR",12];
				_vec AddWeaponCargo ["evo_sd_ACR",12];
				_vec AddWeaponCargo ["UK59_ACR",12];
				_vec AddWeaponCargo ["CZ_750_S1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];
				_vec AddWeaponCargo ["CZ805_A2_ACR",12];
				_vec AddWeaponCargo ["CZ805_B_GL_ACR",12];
				_vec AddWeaponCargo ["LRTV_ACR",12];

				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_HG",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_UGL_PF",12];

				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_UGL_PF",12];
				
/*
//RH
//				_vec addWeaponCargo ["RH_mk18",12];
//				_vec addWeaponCargo ["RH_Mk18aim",12];
//				_vec addWeaponCargo ["RH_mk18eot",12];
				_vec addWeaponCargo ["RH_Mk18acog",12];

				_vec addWeaponCargo ["RH_mk18sd",12];
				_vec addWeaponCargo ["RH_Mk18sdaim",12];
				_vec addWeaponCargo ["RH_Mk18sdeot",12];
//				_vec addWeaponCargo ["RH_Mk18sdacog",12];

//				_vec addWeaponCargo ["RH_Mk18gl",12];
				_vec addWeaponCargo ["RH_Mk18glaim",12];
				_vec addWeaponCargo ["RH_Mk18gleot",12];
//				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_m93r",12];
				_vec addWeaponCargo ["RH_p226",12];
				_vec addWeaponCargo ["RH_g18",12];
				_vec addWeaponCargo ["RH_mk22vsd",12];
				_vec addWeaponCargo ["RH_uspsd",12];
				_vec addWeaponCargo ["RH_m9sd",12];
				_vec addWeaponCargo ["RH_m1911sd",12];
				_vec addWeaponCargo ["RH_anac",12];
				_vec addWeaponCargo ["RH_bull",12];
				_vec addWeaponCargo ["RH_python",12];
				_vec addWeaponCargo ["RH_pp2000p",12];
				_vec addWeaponCargo ["RH_mac10p",12];
				_vec addWeaponCargo ["RH_tec9",12];
				_vec addWeaponCargo ["RH_mp5kp",12];
				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_mp5a4rfx",12];
				_vec addWeaponCargo ["RH_mp5a5ris",12];
				_vec addWeaponCargo ["RH_mp5sd6eot",12];
				_vec addWeaponCargo ["RH_P90isd",12];
				_vec addWeaponCargo ["RH_umpsd",12];
				_vec addWeaponCargo ["RH_umpsdaim",12];
				_vec addWeaponCargo ["RH_krisssd",12];
				_vec addWeaponCargo ["RH_krisssdeot",12];
				_vec addWeaponCargo ["RH_uzisd",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_pp2000eot",12];
				_vec addWeaponCargo ["RH_mp7sdaim",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_pdreot",12];
				_vec addWeaponCargo ["RH_PDW_AIM",12];
				_vec addWeaponCargo ["RH_M4CMKEOTECH",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_ar10s",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_MK14SDEOTECH",12];
				_vec addWeaponCargo ["RH_m16a3cs",12];
				_vec addWeaponCargo ["RH_m4a1eotech",12];
				_vec addWeaponCargo ["RH_m4sd",12];
				_vec addWeaponCargo ["RH_M4sdaim_wdl",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_sc2aim",12];
				_vec addWeaponCargo ["RH_SCARL_MK4",12];
				_vec addWeaponCargo ["RH_SCARH_MK4",12];
				_vec addWeaponCargo ["RH_SCARH_SD_ACOG",12];
				_vec addWeaponCargo ["RH_m16a3sgl",12];
				_vec addWeaponCargo ["RH_m16a4gleotech",12];
				_vec addWeaponCargo ["RH_M4sdgleotech_wdl",12];
				_vec addWeaponCargo ["RH_M4CTSDGLACOG_F",12];
				_vec addWeaponCargo ["RH_SCARH_GL_EOTECH",12];
				_vec addWeaponCargo ["RH_SCARLB_SD_GL_AIM",12];
				_vec addWeaponCargo ["RH_SCARL_GL_EOTECH",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_M14EBRSP",12];
				_vec addWeaponCargo ["RH_mk14ebrsp_sd",12];
				_vec addWeaponCargo ["RH_mk12sd",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_m27aim",12];
				_vec addWeaponCargo ["RH_m27cacog",12];
				_vec addWeaponCargo ["RH_m27ceotech",12];
				_vec addWeaponCargo ["RH_m21",12];
				_vec addWeaponCargo ["RH_M249",12];
				_vec addWeaponCargo ["RH_M249p",12];
				_vec addWeaponCargo ["RH_M249pelcan",12];
				_vec addWeaponCargo ["RH_Mk48mod1",12];
				_vec addWeaponCargo ["RH_M60E4_EOTECH",12];
				_vec addWeaponCargo ["RH_MK43_ELCAN",12];
				_vec addWeaponCargo ["RH_XM8DSAW",12];
//new stuff
				_vec addWeaponCargo ["R3F_JIM_LR",12];
				_vec addWeaponCargo ["ACR_CG",12];
				_vec addWeaponCargo ["R3F_AT4CS",12];
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["C1987_P99_green_sd",12];
				_vec addWeaponCargo ["C1987_P99_green_laser",12];
				_vec addWeaponCargo ["ACR_GLOCK17SD",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["C1987_MP7_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_zp",12];
				_vec addWeaponCargo ["C1987_MP7_zp_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_eot",12];
				_vec addWeaponCargo ["C1987_MP7_eot_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_acog_t",12];
				_vec addWeaponCargo ["ACR_SD6",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_SA58ACOG",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["ACR_M4A3REF",12];
				_vec addWeaponCargo ["ACR_M4A3ACOG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_GL",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT_HG_SD",12];
				_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203_SD",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2_J4_HG",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
				_vec addWeaponCargo ["R3F_Famas_surb",12];
				_vec addWeaponCargo ["R3F_Famas_surb_EOT_SD",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_SD",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
				_vec addWeaponCargo ["R3F_HK417S_EOT_HG",12];
				_vec addWeaponCargo ["R3F_HK417S_HG_SD",12];
				_vec addWeaponCargo ["R3F_FRF2_J8",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II_MILDOT",12];
//				_vec addWeaponCargo ["ACR_AW_308_D",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
				_vec addWeaponCargo ["ACR_M60E4M1",12];
				_vec addWeaponCargo ["R3F_Minimi_EOT",12];
				_vec addWeaponCargo ["R3F_Minimi_J4",12];
				_vec addWeaponCargo ["R3F_Minimi_762_J4",12];
				_vec addWeaponCargo ["R3F_minimi_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Minimi_762_EOT_HG",12];
//FHQ
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_SD",12];

				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_SD",12];
		
				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TWS_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_SD_TAN",12];

				_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_TWS_DESERT",12];

				_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_TWS_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_SD_DESERT",12];
*/
			};
			 case 6:
			{
				_vec AddWeaponCargo ["PRACS_CG",5];
				_vec AddWeaponCargo ["PRACS_UMP45",5];
				_vec AddWeaponCargo ["PRACS_HK33A4",5];
				_vec AddWeaponCargo ["PRACS_HK33A4_EO",5];
				_vec AddWeaponCargo ["PRACS_HK53A3",5];
				_vec AddWeaponCargo ["PRACS_HK53A3_EO",5];
				_vec AddWeaponCargo ["PRACS_GalilAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SAR",5];
				_vec AddWeaponCargo ["PRACS_Galil_SUIT",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203",5];
				_vec AddWeaponCargo ["PRACS_Galil_M203_SUIT",5];
				_vec AddWeaponCargo ["PRACS_CETME",5];
				_vec AddWeaponCargo ["PRACS_FNC",5];
				_vec AddWeaponCargo ["PRACS_FAL_I",5];
				_vec AddWeaponCargo ["PRACS_M16A1",5];
				_vec AddWeaponCargo ["PRACS_M16A1_NVS",5];
				_vec AddWeaponCargo ["PRACS_g3a3",5];
				_vec AddWeaponCargo ["PRACS_g3a3t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM1",5];
				_vec AddWeaponCargo ["PRACS_g3a4SM2",5];
				_vec AddWeaponCargo ["PRACS_g3a4t40",5];
				_vec AddWeaponCargo ["PRACS_g3a4k",5];
				_vec AddWeaponCargo ["PRACS_g3a4_M68",5];
				_vec AddWeaponCargo ["PRACS_g3a4sp",5];
				_vec AddWeaponCargo ["PRACS_g3a4F1",5];
				_vec AddWeaponCargo ["PRACS_SG1",5];
				_vec AddWeaponCargo ["PRACS_SG1_SD",5];
				_vec AddWeaponCargo ["PRACS_SG1_NVS",5];
				_vec AddWeaponCargo ["PRACS_SG1_SD_NVS",5];
				_vec AddWeaponCargo ["PRACS_M60",5];
				_vec AddWeaponCargo ["PRACS_MAG58",5];
				_vec AddWeaponCargo ["PRACS_Mk48",5];
				_vec AddWeaponCargo ["PRACS_Mk48_SP",5];
				_vec AddWeaponCargo ["PRACS_Mk48_SD",5];

				_vec addWeaponCargo ["M136",12];
				_vec addWeaponCargo ["SMAW",12];
				_vec addWeaponCargo ["JAVELIN",12];
				_vec addWeaponCargo ["M47Launcher_EP1",12];
				_vec addWeaponCargo ["BAF_NLAW_Launcher",12];
				_vec addWeaponCargo ["MAAWS",12];
				_vec addWeaponCargo ["Stinger",12];
				_vec AddWeaponCargo ["M9SD",12];
				_vec AddWeaponCargo ["Colt1911",12];
				_vec AddWeaponCargo ["glock17_EP1",12];
				_vec AddWeaponCargo ["revolver_EP1",12];
				_vec AddWeaponCargo ["UZI_EP1",12];
				_vec AddWeaponCargo ["UZI_SD_EP1",12];
				_vec AddWeaponCargo ["MP5A5",12];
				_vec AddWeaponCargo ["MP5SD",12];
				_vec AddWeaponCargo ["M1014",12];
				_vec AddWeaponCargo ["AA12_PMC",12];
				_vec AddWeaponCargo ["M16A2",12];
				_vec AddWeaponCargo ["M16A4",12];
				_vec AddWeaponCargo ["M4A1",12];
				_vec AddWeaponCargo ["M16A4_ACG",12];
				_vec AddWeaponCargo ["M4A1_Aim",12];
				_vec AddWeaponCargo ["M4A1_Aim_camo",12];
				_vec AddWeaponCargo ["M4A1_AIM_SD_camo",12];
				_vec AddWeaponCargo ["LeeEnfield",12];
				_vec AddWeaponCargo ["M14_EP1",12];
				_vec AddWeaponCargo ["FN_FAL",12];
				_vec AddWeaponCargo ["G36A_camo",12];
				_vec AddWeaponCargo ["G36K",12];
				_vec AddWeaponCargo ["G36C",12];
				_vec AddWeaponCargo ["G36C_camo",12];
				_vec AddWeaponCargo ["G36_C_SD_camo",12];
				_vec AddWeaponCargo ["G36_C_SD_eotech",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_CWS",12];
				_vec AddWeaponCargo ["BAF_L85A2_RIS_ACOG",12];

				_vec AddWeaponCargo ["Scar_L_CQC",12];
				_vec AddWeaponCargo ["Scar_L_CQC_CCO_SD",12];
				_vec AddWeaponCargo ["Scar_L_CQC_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Holo",12];
				_vec AddWeaponCargo ["Scar_L_STD_Mk4CQT",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO",12];
				_vec AddWeaponCargo ["Scar_H_CQC_CCO_SD",12];
				_vec AddWeaponCargo ["SCAR_H_STD_TWS_SD",12];
				_vec AddWeaponCargo ["m8_holo_sd",12];
				_vec AddWeaponCargo ["m8_compact_pmc",12];
				_vec AddWeaponCargo ["m8_compact",12];
				_vec AddWeaponCargo ["m8_carbine",12];
				_vec AddWeaponCargo ["M16A2GL",12];
				_vec AddWeaponCargo ["M16A4_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL",12];
				_vec AddWeaponCargo ["M16A4_ACG_GL",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_camo",12];
				_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo",12];
				_vec AddWeaponCargo ["M4A1_RCO_GL",12];
				_vec AddWeaponCargo ["M4A3_RCO_GL_EP1",12];
				_vec AddWeaponCargo ["M4A3_CCO_EP1",12];
				_vec AddWeaponCargo ["m8_carbineGL",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_Holo",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_SUSAT",12];
				_vec AddWeaponCargo ["BAF_L85A2_UGL_ACOG",12];
				_vec AddWeaponCargo ["SCAR_H_STD_EGLM_Spect",12];
				_vec AddWeaponCargo ["SCAR_L_CQC_EGLM_Holo",12];
				_vec AddWeaponCargo ["SCAR_L_STD_EGLM_RCO",12];
				_vec AddWeaponCargo ["SCAR_L_STD_EGLM_TWS",12];
				_vec AddWeaponCargo ["M79_EP1",12];
				_vec AddWeaponCargo ["Mk13_EP1",12];
				_vec AddWeaponCargo ["M32_EP1",12];
				_vec AddWeaponCargo ["FN_FAL_ANPVS4",12];
				_vec AddWeaponCargo ["M4SPR",12];
				_vec AddWeaponCargo ["m8_sharpshooter",12];
				_vec AddWeaponCargo ["m8_tws",12];
				_vec AddWeaponCargo ["m8_tws_sd",12];
				_vec AddWeaponCargo ["DMR",12];
				_vec AddWeaponCargo ["M24",12];
//				_vec AddWeaponCargo ["M24_des_EP1",12];
//				_vec AddWeaponCargo ["EB_M24A2",12];
				_vec AddWeaponCargo ["EB_M24A2_D",12];
//				_vec AddWeaponCargo ["EB_M24A3",12];
				_vec AddWeaponCargo ["EB_M24A3_D",12];
				_vec AddWeaponCargo ["M40A3",12];
				_vec AddWeaponCargo ["BAF_LRR_scoped",12];
//				_vec AddWeaponCargo ["BAF_LRR_scoped_W",12];
				_vec AddWeaponCargo ["M107",12];
				_vec AddWeaponCargo ["M107_TWS_EP1",12];
				_vec AddWeaponCargo ["BAF_AS50_scoped",12];
				_vec AddWeaponCargo ["BAF_AS50_TWS",12];
				_vec AddWeaponCargo ["SCAR_H_LNG_Sniper",12];
				_vec AddWeaponCargo ["SCAR_H_LNG_Sniper_SD",12];
				_vec AddWeaponCargo ["M110_NVG_EP1",12];
				_vec AddWeaponCargo ["M110_TWS_EP1",12];
				_vec AddWeaponCargo ["BAF_L86A2_ACOG",12];
				_vec AddWeaponCargo ["MG36",12];
				_vec AddWeaponCargo ["MG36_camo",12];		
				_vec AddWeaponCargo ["M249_EP1",12];
				_vec AddWeaponCargo ["M249_m145_EP1",12];
				_vec AddWeaponCargo ["M249_TWS_EP1",12];
				_vec AddWeaponCargo ["m8_SAW",12];
				_vec AddWeaponCargo ["M240",12];
				_vec AddWeaponCargo ["m240_scoped_EP1",12];
				_vec AddWeaponCargo ["M60A4_EP1",12];
				_vec AddWeaponCargo ["BAF_L110A1_Aim",12];
//				_vec AddWeaponCargo ["Mk_48",12];
				_vec AddWeaponCargo ["Mk_48_DES_EP1",12];
//CZ weapons
				_vec AddWeaponCargo ["CZ_75_P_07_DUTY",12];
				_vec AddWeaponCargo ["CZ_75_D_COMPACT",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM",12];
				_vec AddWeaponCargo ["CZ_75_SP_01_PHANTOM_SD",12];
				_vec AddWeaponCargo ["Evo_ACR",12];
				_vec AddWeaponCargo ["Evo_mrad_ACR",12];
				_vec AddWeaponCargo ["evo_sd_ACR",12];
				_vec AddWeaponCargo ["UK59_ACR",12];
				_vec AddWeaponCargo ["CZ_750_S1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_ACR",12];
				_vec AddWeaponCargo ["CZ805_A1_GL_ACR",12];
				_vec AddWeaponCargo ["CZ805_A2_ACR",12];
				_vec AddWeaponCargo ["CZ805_A2_SD_ACR",12];
				_vec AddWeaponCargo ["CZ805_B_GL_ACR",12];
				_vec AddWeaponCargo ["LRTV_ACR",12];

//				_vec addWeaponCargo ["LEN_L119A1_Acog",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_HG",12];
//				_vec addWeaponCargo ["LEN_L119A1_Acog_CQB",12];
//				_vec addWeaponCargo ["LEN_L119A1_Acog_CQB_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_CQB_SD_HG",12];
//				_vec addWeaponCargo ["LEN_L119A1_Acog_PF_SD",12];
//				_vec addWeaponCargo ["LEN_L119A1_Acog_UGL",12];
				_vec addWeaponCargo ["LEN_L119A1_Acog_UGL_PF",12];

				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_CQB_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_PF_SD",12];
				_vec addWeaponCargo ["LEN_L119A1_EOT_UGL_PF",12];
/*
//RH
//				_vec addWeaponCargo ["RH_mk18",12];
//				_vec addWeaponCargo ["RH_Mk18aim",12];
//				_vec addWeaponCargo ["RH_mk18eot",12];
//				_vec addWeaponCargo ["RH_Mk18acog",12];

				_vec addWeaponCargo ["RH_mk18sd",12];
				_vec addWeaponCargo ["RH_Mk18sdaim",12];
				_vec addWeaponCargo ["RH_Mk18sdeot",12];
				_vec addWeaponCargo ["RH_Mk18sdacog",12];

//				_vec addWeaponCargo ["RH_Mk18gl",12];
//				_vec addWeaponCargo ["RH_Mk18glaim",12];
				_vec addWeaponCargo ["RH_Mk18gleot",12];
				_vec addWeaponCargo ["RH_mk18glacog",12];

				_vec addWeaponCargo ["RH_m93r",12];
				_vec addWeaponCargo ["RH_p226",12];
				_vec addWeaponCargo ["RH_g18",12];
				_vec addWeaponCargo ["RH_g19t",12];
				_vec addWeaponCargo ["RH_mk22vsd",12];
				_vec addWeaponCargo ["RH_uspsd",12];
				_vec addWeaponCargo ["RH_m9sd",12];
				_vec addWeaponCargo ["RH_m1911sd",12];
				_vec addWeaponCargo ["RH_anac",12];
				_vec addWeaponCargo ["RH_bull",12];
				_vec addWeaponCargo ["RH_python",12];
				_vec addWeaponCargo ["RH_deagle",12];
				_vec addWeaponCargo ["RH_pp2000p",12];
				_vec addWeaponCargo ["RH_mac10p",12];
				_vec addWeaponCargo ["RH_tec9",12];
				_vec addWeaponCargo ["RH_mp5kp",12];
				_vec addWeaponCargo ["RH_mp7p",12];
				_vec addWeaponCargo ["RH_HK53aim",12];
				_vec addWeaponCargo ["RH_mp5a4rfx",12];
				_vec addWeaponCargo ["RH_mp5a5ris",12];
				_vec addWeaponCargo ["RH_mp5a5eodRFX",12];
				_vec addWeaponCargo ["RH_mp5sd6eot",12];
				_vec addWeaponCargo ["RH_P90isd",12];
				_vec addWeaponCargo ["RH_p90sdaim",12];
				_vec addWeaponCargo ["RH_umpsd",12];
				_vec addWeaponCargo ["RH_umpsdaim",12];
				_vec addWeaponCargo ["RH_krisssd",12];
				_vec addWeaponCargo ["RH_krisssdeot",12];
				_vec addWeaponCargo ["RH_uzisd",12];
				_vec addWeaponCargo ["RH_tmpsd",12];
				_vec addWeaponCargo ["RH_tmpsdaim",12];
				_vec addWeaponCargo ["RH_pp2000eot",12];
				_vec addWeaponCargo ["RH_mp7sdaim",12];
				_vec addWeaponCargo ["RH_fmg9",12];
				_vec addWeaponCargo ["RH_pdreot",12];
				_vec addWeaponCargo ["RH_PDW_AIM",12];
				_vec addWeaponCargo ["RH_M4CMKEOTECH",12];
				_vec addWeaponCargo ["RH_M4CMKACOG",12];
				_vec addWeaponCargo ["RH_ar10",12];
				_vec addWeaponCargo ["RH_ar10s",12];
				_vec addWeaponCargo ["RH_MK14AIM",12];
				_vec addWeaponCargo ["RH_MK14SDEOTECH",12];
				_vec addWeaponCargo ["RH_m16a3cs",12];
				_vec addWeaponCargo ["RH_m4a1eotech",12];
				_vec addWeaponCargo ["RH_m4sd",12];
				_vec addWeaponCargo ["RH_M4sdaim_wdl",12];
				_vec addWeaponCargo ["RH_m4sbraim",12];
				_vec addWeaponCargo ["RH_M4CTSD_F",12];
				_vec addWeaponCargo ["RH_sc2aim",12];
				_vec addWeaponCargo ["RH_sc2shd",12];
				_vec addWeaponCargo ["RH_SCARL_MK4",12];
				_vec addWeaponCargo ["RH_SCARL_SD_DOC",12];
				_vec addWeaponCargo ["RH_SCARLB_SD_EOTECH",12];
				_vec addWeaponCargo ["RH_SCARH_MK4",12];
				_vec addWeaponCargo ["RH_SCARH_SD_ACOG",12];
				_vec addWeaponCargo ["RH_m16a3sgl",12];
				_vec addWeaponCargo ["RH_m16a4gleotech",12];
				_vec addWeaponCargo ["RH_M4sdgleotech_wdl",12];
				_vec addWeaponCargo ["RH_M4CTSDGLACOG_F",12];
				_vec addWeaponCargo ["RH_XM8DGL",12];
				_vec addWeaponCargo ["RH_SCARH_GL_EOTECH",12];
				_vec addWeaponCargo ["RH_SCARH_GL_SPECTERDR",12];
				_vec addWeaponCargo ["RH_SCARLB_SD_GL_AIM",12];
				_vec addWeaponCargo ["RH_SCARL_GL_EOTECH",12];
				_vec addWeaponCargo ["RH_SCARLB_GL_ACOG",12];
				_vec addWeaponCargo ["RH_m1ssp",12];
				_vec addWeaponCargo ["RH_M14EBRSP",12];
				_vec addWeaponCargo ["RH_mk14ebrsp_sd",12];
				_vec addWeaponCargo ["RH_m39emr",12];
				_vec addWeaponCargo ["RH_mk12sd",12];
				_vec addWeaponCargo ["RH_m27",12];
				_vec addWeaponCargo ["RH_m27aim",12];
				_vec addWeaponCargo ["RH_m27cacog",12];
				_vec addWeaponCargo ["RH_m27ceotech",12];
				_vec addWeaponCargo ["RH_m21",12];
				_vec addWeaponCargo ["RH_MK21A5SD",12];
				_vec addWeaponCargo ["RH_M249",12];
				_vec addWeaponCargo ["RH_M249p",12];
				_vec addWeaponCargo ["RH_M249pelcan",12];
				_vec addWeaponCargo ["RH_Mk48mod1",12];
				_vec addWeaponCargo ["RH_Mk48mod1acog",12];
				_vec addWeaponCargo ["RH_M60E4_EOTECH",12];
				_vec addWeaponCargo ["RH_MK43_ACOG",12];
				_vec addWeaponCargo ["RH_MK43_ELCAN",12];
				_vec addWeaponCargo ["RH_XM8DSAW",12];
//new stuff
				_vec addWeaponCargo ["R3F_JIM_LR",12];
				_vec addWeaponCargo ["ACR_CG",12];
				_vec addWeaponCargo ["R3F_AT4CS",12];
				_vec addWeaponCargo ["C1987_P99_green",12];
				_vec addWeaponCargo ["C1987_P99_green_sd",12];
				_vec addWeaponCargo ["C1987_P99_green_laser",12];
				_vec addWeaponCargo ["C1987_P99_green_laser_sd",12];
				_vec addWeaponCargo ["ACR_GLOCK17SD",12];
				_vec addWeaponCargo ["C1987_MP7_t",12];
				_vec addWeaponCargo ["C1987_MP7_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_zp",12];
				_vec addWeaponCargo ["C1987_MP7_zp_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_eot",12];
				_vec addWeaponCargo ["C1987_MP7_eot_sd_t",12];
				_vec addWeaponCargo ["C1987_MP7_acog_t",12];
				_vec addWeaponCargo ["C1987_MP7_acog_sd_t",12];
				_vec addWeaponCargo ["ACR_SD6",12];
				_vec addWeaponCargo ["ACR_SA58REF",12];
				_vec addWeaponCargo ["ACR_SA58ACOG",12];
				_vec addWeaponCargo ["ACR_M4A3",12];
				_vec addWeaponCargo ["ACR_M4A3REF",12];
				_vec addWeaponCargo ["ACR_M4A3ACOG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_EO_IR_SIL_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_CCO_IR_SIL_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL_FG",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_LP_GL",12];
				_vec addWeaponCargo ["DM_CAMO_M4_RCO_IR_SIL_GL",12];
				_vec addWeaponCargo ["R3F_Famas_F1",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_F1_EOT_HG_SD",12];
				_vec addWeaponCargo ["R3F_Famas_F1_AIM",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203",12];
				_vec addWeaponCargo ["R3F_Famas_F1_J4_M203_SD",12];
				_vec addWeaponCargo ["R3F_Famas_felin",12];
				_vec addWeaponCargo ["R3F_Famas_G2",12];
				_vec addWeaponCargo ["R3F_Famas_G2_EOT",12];
				_vec addWeaponCargo ["R3F_Famas_G2_J4_HG",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_M203",12];
				_vec addWeaponCargo ["R3F_Famas_G2_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Famas_surb",12];
				_vec addWeaponCargo ["R3F_Famas_surb_EOT_SD",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Famas_surb_AIM_SD",12];
				_vec addWeaponCargo ["R3F_Famas_surb_EOT_M203",12];
				_vec addWeaponCargo ["R3F_HK417L_NF",12];
				_vec addWeaponCargo ["R3F_HK417M_AIM",12];
				_vec addWeaponCargo ["R3F_HK417S_EOT_HG",12];
				_vec addWeaponCargo ["R3F_HK417S_HG_SD",12];
				_vec addWeaponCargo ["R3F_FRF2_J8",12];
				_vec addWeaponCargo ["R3F_FRF2_J8_SD",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II_MILDOT",12];
				_vec addWeaponCargo ["R3F_PGM_Hecate_II_POLY",12];
//				_vec addWeaponCargo ["ACR_AW_308_D",12];
				_vec addWeaponCargo ["ACR_M60E4",12];
				_vec addWeaponCargo ["ACR_M60E4M1",12];
				_vec addWeaponCargo ["R3F_Minimi_EOT",12];
				_vec addWeaponCargo ["R3F_Minimi_J4",12];
				_vec addWeaponCargo ["R3F_Minimi_762_J4",12];
				_vec addWeaponCargo ["R3F_Minimi_762_OB50",12];
				_vec addWeaponCargo ["R3F_minimi_AIM_HG",12];
				_vec addWeaponCargo ["R3F_Minimi_762_EOT_HG",12];
//FHQ
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_IRN_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_CCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_RCO_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HWS_GL_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_G33_GL_SD",12];

				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_SD",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_F",12];
				_vec AddWeaponCargo ["FHQ_ACR_WDL_HAMR_GL_SD",12];

				_vec AddWeaponCargo ["FHQ_RSASS_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TWS_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_SD_TAN",12];
				_vec AddWeaponCargo ["FHQ_RSASS_TWS_SD_TAN",12];

				_vec AddWeaponCargo ["FHQ_XM2010_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_NV_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_TWS_DESERT",12];
				_vec AddWeaponCargo ["FHQ_XM2010_TWS_SD_DESERT",12];

				_vec AddWeaponCargo ["FHQ_MSR_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_TWS_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_NV_SD_DESERT",12];
				_vec AddWeaponCargo ["FHQ_MSR_TWS_SD_DESERT",12];
*/
			};
		};

//PRACS ammo
		_vec addmagazinecargo ["PRACS_20Rnd_762x51",20];
		_vec addmagazinecargo ["PRACS_30Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_25Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_40Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_25Rnd_UMP45",20];
		_vec addmagazinecargo ["PRACS_35Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_CG_HEAAX1",20];
		_vec addmagazinecargo ["PRACS_CG_HEDPX1",20];

//new ammo
/*
		_vec addMagazineCargo ["R3F_25Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_FRF2",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_SD_FRF2",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_TRACER_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_SD_HK417",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PGM",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PEI_PGM",12];
		_vec addMagazineCargo ["R3F_AT4CS_Mag",12];
		_vec addMagazineCargo ["R3F_200Rnd_556x45_MINIMI",12];
		_vec addMagazineCargo ["R3F_100Rnd_762x51_MINIMI",12];

		_vec addMagazineCargo ["ACR_17Rnd_9x19",12];
		_vec addMagazineCargo ["ACR_17Rnd_9x19SD",12];
		_vec addMagazineCargo ["ACR_100Rnd_762x51_M240",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_StanagSD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5SD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5",12];
		_vec addMagazineCargo ["ACR_30Rnd_762x39_SA58",12];
		_vec addMagazineCargo ["ACR_CG_HEAT",12];
		_vec addMagazineCargo ["ACR_10Rnd_762x51",12];

		_vec addMagazineCargo ["40Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["40Rnd_46x30_sd_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_sd_mp7",12];

		_vec addMagazineCargo ["15Rnd_9x19_p99",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99",12];
		_vec addMagazineCargo ["15Rnd_9x19_p99_sd",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99_sd",12];
//RH ammo
		_vec addMagazineCargo ["30Rnd_9x19_MP5p",12];
		_vec addMagazineCargo ["20Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["30Rnd_762x39_AK47",12];
		_vec addMagazineCargo ["20Rnd_762x51_DMR",12];
		_vec addMagazineCargo ["RH_7Rnd_50_AE",12];
		_vec addMagazineCargo ["RH_6Rnd_44_Mag",12];
		_vec addMagazineCargo ["RH_6Rnd_357_Mag",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mksd",12];
		_vec addMagazineCargo ["RH_8Rnd_762_tt33",12];
		_vec addMagazineCargo ["RH_10Rnd_22LR_mk2",12];
		_vec addMagazineCargo ["RH_7Rnd_32cal_ppk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_P38",12];
		_vec addMagazineCargo ["RH_13Rnd_9x19_BHP",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17SD",12];
		_vec addMagazineCargo ["RH_19Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_33Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_20Rnd_9x19_M93",12];
		_vec addMagazineCargo ["RH_20Rnd_32cal_vz61",12];
		_vec addMagazineCargo ["RH_12Rnd_45cal_usp",12];
		_vec addMagazineCargo ["RH_8Rnd_45cal_m1911",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_usp",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_uspsd",12];
		_vec addMagazineCargo ["RH_30Rnd_9x19_tec",12];
		_vec addMagazineCargo ["RH_32Rnd_9x19_Muzi",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_13RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_pMag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_Mag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_pMag",12];
		_vec addMagazineCargo ["RH_30Rnd_6x35_PDW",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_AR10",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD_mk14",12];
		_vec addMagazineCargo ["RH_30Rnd_556x45_AK",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_Pellets",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_74Slug",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_HK417",12];
//FHQ ammo
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD_SD",12];
*/

//basics
		_vec AddWeaponCargo ["M9",12];
		_vec addWeaponCargo ["huntingrifle",12];
		_vec addWeaponCargo ["Binocular",2];
		_vec addWeaponCargo ["Binocular_Vector",2];
		_vec addWeaponCargo ["NVGoggles",2];
		_vec addWeaponCargo ["Laserdesignator",2];
		_vec addMagazineCargo ["Laserbatteries",2];
//		_vec addMagazineCargo ["HandGrenade_West",12];
		_vec addMagazineCargo ["IRStrobe",2];
		_vec addMagazineCargo ["IR_Strobe_Marker",2];		
		_vec addMagazineCargo ["SMAW_HEDP",12];
		_vec addMagazineCargo ["SMAW_HEAA",12];
		_vec addMagazineCargo ["MAAWS_HEAT",12];
		_vec addMagazineCargo ["MAAWS_HEDP",12];
		_vec addMagazineCargo ["pipebomb",12];
		_vec addMagazineCargo ["mine",12];
		_vec addMagazineCargo ["M136",12];
		_vec addMagazineCargo ["Stinger",12];
		_vec addMagazineCargo ["JAVELIN",12];
		_vec addMagazineCargo ["Dragon_EP1",12];
		_vec addMagazineCargo ["NLAW",12];
		_vec addmagazinecargo ["8Rnd_B_Beneli_74Slug",12];
		_vec addmagazinecargo ["8Rnd_B_Beneli_Pellets",12];
		_vec addmagazinecargo ["7rnd_45ACP_1911",12];
		_vec addmagazinecargo ["15rnd_9x19_m9sd",12];
		_vec addmagazinecargo ["15rnd_9x19_m9",12];
		_vec addmagazinecargo ["30Rnd_9x19_MP5SD",12];
		_vec addmagazinecargo ["30Rnd_9x19_MP5",12];
		_vec addmagazinecargo ["30Rnd_556x45_StanagSD",12];
		_vec addmagazinecargo ["30rnd_556x45_Stanag",12];
		_vec addmagazinecargo ["30Rnd_556x45_G36",12];
		_vec addmagazinecargo ["30Rnd_556x45_G36SD",12];
		_vec addmagazinecargo ["200Rnd_556x45_M249",12];
		_vec addmagazinecargo ["100Rnd_762x51_M240",12];
		_vec addmagazinecargo ["5Rnd_762x51_M24",12];
		_vec addmagazinecargo ["20Rnd_762x51_DMR",12];
		_vec addmagazinecargo ["10Rnd_127x99_m107",12];
		_vec addMagazineCargo ["100Rnd_556x45_BetaCMag",12];
		_vec addMagazineCargo ["5x_22_LR_17_HMR",12];	
		_vec addMagazineCargo ["EB_5Rnd_762x51_CZ550_p",12];
		_vec addMagazineCargo ["20Rnd_762x51_FNFAL",12];
		_vec addMagazineCargo ["20Rnd_762x51_B_SCAR",12];
		_vec addMagazineCargo ["20Rnd_762x51_SB_SCAR",12];
		_vec addMagazineCargo ["17Rnd_9x19_glock17",12];
		_vec addMagazineCargo ["5Rnd_127x99_as50",12];
		_vec addMagazineCargo ["200Rnd_556x45_L110A1",12];
		_vec addMagazineCargo ["5Rnd_86x70_L115A1",12];
		_vec addMagazineCargo ["10x_303",12];	
		_vec addMagazineCargo ["20Rnd_B_AA12_74Slug",12];
		_vec addMagazineCargo ["20Rnd_B_AA12_HE",12];
		_vec addMagazineCargo ["20Rnd_B_AA12_Pellets",12];
		_vec addMagazineCargo ["BAF_L109A1_HE",12];
		_vec addMagazineCargo ["6Rnd_HE_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareGreen_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareRed_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareWhite_M203",12];
		_vec addMagazineCargo ["6Rnd_FlareYellow_M203",12];
		_vec addMagazineCargo ["6Rnd_Smoke_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeGreen_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeRed_M203",12];
		_vec addMagazineCargo ["6Rnd_SmokeYellow_M203",12];
		_vec addMagazineCargo ["6Rnd_45ACP",12];
		_vec addMagazineCargo ["30Rnd_9x19_UZI",12];
		_vec addMagazineCargo ["30Rnd_9x19_UZI_SD",12];
//cz ammo
		_vec addMagazineCargo ["30Rnd_762x39_SA58",12];
		_vec addMagazineCargo ["18Rnd_9x19_Phantom",12];
		_vec addMagazineCargo ["18Rnd_9x19_PhantomSD",12];
		_vec addMagazineCargo ["10Rnd_9x19_Compact",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVOSD",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVO",12];
		_vec addMagazineCargo ["10Rnd_762x51_CZ750",12];
		_vec addMagazineCargo ["10Rnd_B_765x17_Ball",12];
		_vec addmagazinecargo ["100Rnd_762x54_PK",12];

//new MG ammo
		_vec addmagazinecargo ["200Rnd_762x51_M240",12];
		_vec addmagazinecargo ["100Rnd_556x45_M249",12];
		if (gitsnades == 1) then
		{
//new weapons
		_vec AddWeaponCargo ["EB_BAF_LRR_scoped_O",2];
		_vec AddWeaponCargo ["EB_m79p",2];
		_vec AddWeaponCargo ["EB_m1911SD",2];
		_vec AddWeaponCargo ["EB_MX991_w",2];
		_vec AddWeaponCargo ["EB_MX991_r",2];
		_vec AddWeaponCargo ["EB_MX991_g",2];
		_vec AddWeaponCargo ["EB_mkvFlarePistol",2];

//new ammo
		_vec addmagazinecargo ["EB_5Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_60Rnd_556x45_Stanag",12];
		
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_T",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_P",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_PT",12];
		_vec addMagazineCargo ["EB_7rnd_m1911SD",12];
		_vec addMagazineCargo ["EB_7rnd_m1911",12];
		_vec addMagazineCargo ["EB_1Rnd_BS_M576",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M381",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M406",12];
		_vec addMagazineCargo ["EB_1Rnd_HEDP_M433",12];
		_vec addMagazineCargo ["EB_1Rnd_AB_M397",12];
		_vec addMagazineCargo ["EB_m406vest",12];
		_vec addMagazineCargo ["EB_1Rnd_Smoke_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeRed_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeGreen_40mm",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeYellow_40mm",12];
		_vec addMagazineCargo ["EB_40mm_white",12];
		_vec addMagazineCargo ["EB_40mm_green",12];
		_vec addMagazineCargo ["EB_40mm_red",12];
		_vec addMagazineCargo ["EB_40mm_yellow",12];
		_vec addMagazineCargo ["EB_1Rnd_Smoke_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeRed_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeGreen_MKV",12];
		_vec addMagazineCargo ["EB_1Rnd_SmokeYellow_MKV",12];
		_vec addMagazineCargo ["EB_40mm_mkv_White",12];
		_vec addMagazineCargo ["EB_40mm_mkv_red",12];
		_vec addMagazineCargo ["EB_40mm_mkv_green",12];
		_vec addMagazineCargo ["EB_40mm_mkv_yellow",12];
		_vec addMagazineCargo ["EB_10Rnd_svd",12];
		_vec addMagazineCargo ["EB_20Rnd_svd",12];
		_vec addMagazineCargo ["EB_10Rnd_svd_T",12];
		_vec addMagazineCargo ["EB_20Rnd_svd_T",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_AP",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_AP",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_BT",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_BT",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_T",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_T",12];
		_vec addMagazineCargo ["EB_100Rnd_762x51_NATO_DT",12];
		_vec addMagazineCargo ["EB_200Rnd_762x51_NATO_DT",12];
		_vec addMagazineCargo ["EB_molotov_mag",12];
		_vec addMagazineCargo ["EB_M118_mag_remote",12];
		_vec addMagazineCargo ["EB_v40gren",12];
		_vec addMagazineCargo ["EB_m308gren",12];
		_vec addMagazineCargo ["EB_m14gren",12];
		_vec addMagazineCargo ["EB_mk40gren",12];
		_vec addMagazineCargo ["EB_m34gren",12];
		_vec addMagazineCargo ["EB_m61gren",12];
		_vec addMagazineCargo ["EB_m67gren",12];
		_vec addMagazineCargo ["EB_mk3a2gren",12];
		_vec addMagazineCargo ["EB_m18white",12];
		_vec addMagazineCargo ["EB_m18green",12];
		_vec addMagazineCargo ["EB_m18purple",12];
		_vec addMagazineCargo ["EB_m18red",12];
		_vec addMagazineCargo ["EB_m18yellow",12];
		_vec addMagazineCargo ["EB_m18blue",12];
		_vec addMagazineCargo ["EB_m18orange",12];

//new M107 ammo
		_vec addMagazineCargo ["LWS_Laserbatteries",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_AP",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_HE",12];
//new MG ammo
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_I",12];
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_AP",12];
		_vec addmagazinecargo ["EB_600Rnd_762x51_M240",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_AP",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_I",12];
//new items
		_vec AddWeaponCargo ["EB_TIscanner",2];
		_vec AddWeaponCargo ["EB_TIGoggles",2];
		_vec AddWeaponCargo ["EB_S10",2];
		_vec addmagazinecargo ["EB_knife",12];
		_vec addmagazinecargo ["EB_kabar",12];
		_vec addmagazinecargo ["EB_ItemFuelcanEmpty",12];
		_vec AddWeaponCargo ["EB_ItemSiphon",2];
		_vec AddWeaponCargo ["EB_ItemSil_hgun",12];
		_vec AddWeaponCargo ["EB_ItemSil_rifle",12];
//new GL AMMO
		_vec addMagazineCargo ["5Rnd_HE_M203",12];
		_vec addMagazineCargo ["5Rnd_HEDP_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareWhite_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareRed_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareYellow_M203",12];
		_vec addMagazineCargo ["5Rnd_Smoke_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeRed_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeYellow_M203",12];

		_vec addMagazineCargo ["EB_SmokeShellChem",12];
		_vec addMagazineCargo ["BD_1Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Chem_M203",12];
		_vec addMagazineCargo ["5Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_1Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["5Rnd_Buckshot_M203",12];
		};

//old GL ammo
			_vec addMagazineCargo ["1rnd_HE_M203",12];
			_vec addMagazineCargo ["FlareWhite_M203",12];
			_vec addMagazineCargo ["FlareRed_M203",12];
			_vec addMagazineCargo ["FlareGreen_M203",12];
			_vec addMagazineCargo ["FlareYellow_M203",12];
			_vec addMagazineCargo ["SmokeShell",12];
			_vec addMagazineCargo ["SmokeShellRed",12];
			_vec addMagazineCargo ["SmokeShellGreen",12];
			_vec addMagazineCargo ["SmokeShellYellow",12];
			_vec addMagazineCargo ["SmokeShellPurple",12];
			_vec addMagazineCargo ["SmokeShellBlue",12];
			_vec addMagazineCargo ["SmokeShellOrange",12];
		Sleep 1.0;
	};

	If (ranklock ==1 || ranklock == 3) then //US weapons
	{
		deletevehicle ammobox1;ammobox1 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1";[ammobox1] call _FillAmmoBoxU;
		deletevehicle ammobox2;ammobox2 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob2";ammobox2 setpos getmarkerpos "ammob2";[ammobox2] call _FillAmmoBoxU;
		deletevehicle ammobox3;ammobox3 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob3";ammobox3 setpos getmarkerpos "ammob3";[ammobox3] call _FillAmmoBoxU;
		deletevehicle ammobox4;ammobox4 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob4";ammobox4 setpos getmarkerpos "ammob4";[ammobox4] call _FillAmmoBoxU;
		deletevehicle ammobox5;ammobox5 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob5";ammobox5 setpos getmarkerpos "ammob5";[ammobox5] call _FillAmmoBoxU;
		deletevehicle ammobox11;ammobox11 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob11";ammobox11 SetPosASL [(getMarkerPos "HMS-GITS" select 0)+1,(getMarkerPos "HMS-GITS" select 1)+1, 18];[ammobox11] call _FillAmmoBoxU;
//		deletevehicle ammobox11;ammobox11 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob11";ammobox11 SetPos getMarkerPos "HMS-GITS";[ammobox11] call _FillAmmoBoxU;
		player reveal ammobox1
	} 
	else //US weapons ranked
	{
		deletevehicle ammobox1;ammobox1 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1";[ammobox1] call _FillAmmoBoxUR;
		deletevehicle ammobox2;ammobox2 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob2";ammobox2 setpos getmarkerpos "ammob2";[ammobox2] call _FillAmmoBoxUR;
		deletevehicle ammobox3;ammobox3 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob3";ammobox3 setpos getmarkerpos "ammob3";[ammobox3] call _FillAmmoBoxUR;
		deletevehicle ammobox4;ammobox4 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob4";ammobox4 setpos getmarkerpos "ammob4";[ammobox4] call _FillAmmoBoxUR;
		deletevehicle ammobox5;ammobox5 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob5";ammobox5 setpos getmarkerpos "ammob5";[ammobox5] call _FillAmmoBoxUR;
		deletevehicle ammobox11;ammobox11 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob11";ammobox11 SetPosASL [(getMarkerPos "HMS-GITS" select 0)+1,(getMarkerPos "HMS-GITS" select 1)+2, 18];[ammobox11] call _FillAmmoBoxUR;
//		deletevehicle ammobox11;ammobox11 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob11";ammobox11 SetPos getMarkerPos "HMS-GITS";[ammobox11] call _FillAmmoBoxUR;
		player reveal ammobox1
	};
};


BIS_EVO_DropBox =
{
	_vec = _this select 0;
	clearWeaponCargo _vec;
	clearMagazineCargo _vec;
	_vec AddWeaponCargo ["M9SD", 2];
	_vec addWeaponCargo ["huntingrifle",2];
	_vec AddWeaponCargo ["M1014", 2];
	_vec AddWeaponCargo ["MP5SD", 2];
	_vec AddWeaponCargo ["M16A2", 2];
	_vec AddWeaponCargo ["m8_compact", 2];
//	_vec AddWeaponCargo ["Mk_48",12];
	_vec AddWeaponCargo ["Mk_48_DES_EP1",12];
	_vec addWeaponCargo ["RPG18",2];
	_vec addWeaponCargo ["RPG7V",2];
	_vec addWeaponCargo ["Igla",2];

//PRACS ammo
		_vec addmagazinecargo ["PRACS_20Rnd_762x51",20];
		_vec addmagazinecargo ["PRACS_30Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_25Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_40Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_25Rnd_UMP45",20];
		_vec addmagazinecargo ["PRACS_35Rnd_556x45",20];
		_vec addmagazinecargo ["PRACS_CG_HEAAX1",20];
		_vec addmagazinecargo ["PRACS_CG_HEDPX1",20];

//cz ammo
//		_vec addMagazineCargo ["30Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["30Rnd_762x39_SA58",12];
//		_vec addMagazineCargo ["1Rnd_HE_M203",12];
//		_vec addMagazineCargo ["30Rnd_556x45_G36SD",12];
//		_vec addMagazineCargo ["30Rnd_556x45_StanagSD",12];
//		_vec addMagazineCargo ["100Rnd_556x45_BetaCMag",12];
//		_vec addMagazineCargo ["20Rnd_762x51_B_SCAR",12];
//		_vec addMagazineCargo ["20Rnd_762x51_SB_SCAR",12];
		_vec addMagazineCargo ["18Rnd_9x19_Phantom",12];
		_vec addMagazineCargo ["18Rnd_9x19_PhantomSD",12];
		_vec addMagazineCargo ["10Rnd_9x19_Compact",12];
//		_vec addmagazinecargo ["15rnd_9x19_m9sd",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVOSD",12];
		_vec addMagazineCargo ["20Rnd_9x19_EVO",12];
		_vec addMagazineCargo ["10Rnd_762x51_CZ750",12];
//		_vec addMagazineCargo ["20Rnd_B_765x17_Ball",12];
		_vec addMagazineCargo ["10Rnd_B_765x17_Ball",12];
		_vec addmagazinecargo ["100Rnd_762x54_PK",12];
/*
//RH ammo
		_vec addMagazineCargo ["30Rnd_9x19_MP5p",12];
		_vec addMagazineCargo ["20Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["30Rnd_762x39_AK47",12];
		_vec addMagazineCargo ["20Rnd_762x51_DMR",12];
		_vec addMagazineCargo ["RH_7Rnd_50_AE",12];
		_vec addMagazineCargo ["RH_6Rnd_44_Mag",12];
		_vec addMagazineCargo ["RH_6Rnd_357_Mag",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_Mksd",12];
		_vec addMagazineCargo ["RH_8Rnd_762_tt33",12];
		_vec addMagazineCargo ["RH_10Rnd_22LR_mk2",12];
		_vec addMagazineCargo ["RH_7Rnd_32cal_ppk",12];
		_vec addMagazineCargo ["RH_8Rnd_9x19_P38",12];
		_vec addMagazineCargo ["RH_13Rnd_9x19_BHP",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17",12];
		_vec addMagazineCargo ["RH_17Rnd_9x19_g17SD",12];
		_vec addMagazineCargo ["RH_19Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_33Rnd_9x19_g18",12];
		_vec addMagazineCargo ["RH_20Rnd_9x19_M93",12];
		_vec addMagazineCargo ["RH_20Rnd_32cal_vz61",12];
		_vec addMagazineCargo ["RH_12Rnd_45cal_usp",12];
		_vec addMagazineCargo ["RH_8Rnd_45cal_m1911",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_usp",12];
		_vec addMagazineCargo ["RH_15Rnd_9x19_uspsd",12];
		_vec addMagazineCargo ["RH_30Rnd_9x19_tec",12];
		_vec addMagazineCargo ["RH_32Rnd_9x19_Muzi",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_30RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_13RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_Mag",12];
		_vec addMagazineCargo ["RH_45ACP_25RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_9mm_32RND_pMag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_Mag",12];
		_vec addMagazineCargo ["RH_57x28mm_50RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_SD_Mag",12];
		_vec addMagazineCargo ["RH_46x30mm_40RND_pMag",12];
		_vec addMagazineCargo ["RH_30Rnd_6x35_PDW",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_AR10",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD_mk14",12];
		_vec addMagazineCargo ["RH_30Rnd_556x45_AK",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_Pellets",12];
		_vec addMagazineCargo ["RH_5Rnd_B_Beneli_74Slug",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_SD",12];
		_vec addMagazineCargo ["RH_20Rnd_762x51_HK417",12];
//new ammo
		_vec addMagazineCargo ["R3F_25Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_TRACER_FAMAS",12];
		_vec addMagazineCargo ["R3F_25Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_30Rnd_556x45_SD_FAMAS",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_FRF2",12];
		_vec addMagazineCargo ["R3F_10Rnd_762x51_SD_FRF2",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_TRACER_HK417",12];
		_vec addMagazineCargo ["R3F_20Rnd_762x51_SD_HK417",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PGM",12];
		_vec addMagazineCargo ["R3F_7Rnd_127x99_PEI_PGM",12];
		_vec addMagazineCargo ["R3F_AT4CS_Mag",12];
		_vec addMagazineCargo ["R3F_200Rnd_556x45_MINIMI",12];
		_vec addMagazineCargo ["R3F_100Rnd_762x51_MINIMI",12];

		_vec addMagazineCargo ["ACR_17Rnd_9x19",12];
		_vec addMagazineCargo ["ACR_17Rnd_9x19SD",12];
		_vec addMagazineCargo ["ACR_100Rnd_762x51_M240",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["ACR_30Rnd_556x45_StanagSD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5SD",12];
		_vec addMagazineCargo ["ACR_30Rnd_9x19_MP5",12];
		_vec addMagazineCargo ["ACR_30Rnd_762x39_SA58",12];
		_vec addMagazineCargo ["ACR_CG_HEAT",12];
		_vec addMagazineCargo ["ACR_10Rnd_762x51",12];

		_vec addMagazineCargo ["40Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["40Rnd_46x30_sd_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_mp7",12];
		_vec addMagazineCargo ["20Rnd_46x30_sd_mp7",12];

		_vec addMagazineCargo ["15Rnd_9x19_p99",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99",12];
		_vec addMagazineCargo ["15Rnd_9x19_p99_sd",12];
		_vec addMagazineCargo ["10Rnd_9x19_p99_sd",12];
//FHQ
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_762x51_PMAG_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_300Win_XM2010_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_5Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_7Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_NT_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_10Rnd_338Lapua_MSR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_30Rnd_680x43_ACR_TD_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_T_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TS_SD",12];
		_vec addMagazineCargo ["FHQ_rem_20Rnd_680x43_ACR_TD_SD",12];
*/
//basic
	_vec addmagazinecargo ["30Rnd_556x45_Stanag",12];
	_vec addmagazinecargo ["100Rnd_762x51_M240",12];
	_vec addWeaponCargo ["Laserdesignator",2];
	_vec addMagazineCargo ["Laserbatteries",2];
	_vec addWeaponCargo ["Binocular",2];
	_vec addWeaponCargo ["NVGoggles",2];
	_vec addMagazineCargo ["pipebomb",9];
	_vec addMagazineCargo ["mine",9];
//	_vec addMagazineCargo ["HandGrenade_West",9];
	_vec addMagazineCargo ["M136",9];
	_vec addMagazineCargo ["Stinger",9];
	_vec addMagazineCargo ["SMAW_HEAA",9];
	_vec addMagazineCargo ["SMAW_HEDP",9];
	_vec addMagazineCargo ["JAVELIN",9];
	_vec addMagazineCargo ["PG7V",9];
	_vec addMagazineCargo ["PG7VR",9];
	_vec addMagazineCargo ["PG7VL",9];
	_vec addMagazineCargo ["RPG18",9];
	_vec addMagazineCargo ["Igla",9];
	_vec addmagazinecargo ["8Rnd_B_Beneli_74Slug",12];
	_vec addmagazinecargo ["8Rnd_B_Beneli_Pellets",12];
	_vec addmagazinecargo ["7rnd_45ACP_1911",12];
	_vec addmagazinecargo ["15rnd_9x19_m9sd",12];
	_vec addmagazinecargo ["15rnd_9x19_m9",12];
	_vec addmagazinecargo ["30Rnd_9x19_MP5SD",12];
	_vec addmagazinecargo ["30Rnd_9x19_MP5",12];
	_vec addmagazinecargo ["30Rnd_556x45_StanagSD",12];
	_vec addmagazinecargo ["30rnd_556x45_Stanag",12];
	_vec addmagazinecargo ["30Rnd_556x45_G36",12];
	_vec addmagazinecargo ["30Rnd_556x45_G36SD",12];
	_vec addmagazinecargo ["200Rnd_556x45_M249",12];
	_vec addmagazinecargo ["100Rnd_762x51_M240",12];
	_vec addmagazinecargo ["5Rnd_762x51_M24",12];
	_vec addmagazinecargo ["10Rnd_127x99_m107",12];
	_vec addmagazinecargo ["20Rnd_762x51_DMR",12];
	_vec addMagazineCargo ["5x_22_LR_17_HMR",12];
	_vec addMagazineCargo ["EB_5Rnd_762x51_CZ550_p",12];
	_vec addMagazineCargo ["100Rnd_556x45_BetaCMag",12];
	_vec addMagazineCargo ["IRStrobe",2];
	_vec addMagazineCargo ["IR_Strobe_Marker",2];		
	_vec addMagazineCargo ["Dragon_EP1",9];
	_vec addMagazineCargo ["NLAW",9];
	_vec addMagazineCargo ["MAAWS_HEAT",9];
	_vec addMagazineCargo ["MAAWS_HEDP",9];
	_vec addMagazineCargo ["BAF_L109A1_HE",12];
	_vec addMagazineCargo ["20Rnd_762x51_FNFAL",12];
	_vec addMagazineCargo ["20Rnd_762x51_B_SCAR",12];
	_vec addMagazineCargo ["20Rnd_762x51_SB_SCAR",12];
	_vec addMagazineCargo ["6Rnd_HE_M203",12];
	_vec addMagazineCargo ["6Rnd_FlareGreen_M203",12];
	_vec addMagazineCargo ["6Rnd_FlareRed_M203",12];
	_vec addMagazineCargo ["6Rnd_FlareWhite_M203",12];
	_vec addMagazineCargo ["6Rnd_FlareYellow_M203",12];
	_vec addMagazineCargo ["6Rnd_Smoke_M203",12];
	_vec addMagazineCargo ["6Rnd_SmokeGreen_M203",12];
	_vec addMagazineCargo ["6Rnd_SmokeRed_M203",12];
	_vec addMagazineCargo ["6Rnd_SmokeYellow_M203",12];
	_vec addMagazineCargo ["6Rnd_45ACP",12];
	_vec addMagazineCargo ["17Rnd_9x19_glock17",12];
	_vec addMagazineCargo ["5Rnd_127x99_as50",12];
	_vec addMagazineCargo ["200Rnd_556x45_L110A1",12];
	_vec addMagazineCargo ["5Rnd_86x70_L115A1",12];
	_vec addMagazineCargo ["10x_303",12];	
	_vec addMagazineCargo ["6Rnd_45ACP",12];
	_vec addMagazineCargo ["30Rnd_9x19_UZI",12];
	_vec addMagazineCargo ["30Rnd_9x19_UZI_SD",12];
	_vec addMagazineCargo ["20Rnd_B_765x17_Ball",12];
	_vec addMagazineCargo ["20Rnd_B_AA12_74Slug",12];
	_vec addMagazineCargo ["20Rnd_B_AA12_HE",12];
	_vec addMagazineCargo ["20Rnd_B_AA12_Pellets",12];
//new MG ammo
		_vec addmagazinecargo ["200Rnd_762x51_M240",12];
		_vec addmagazinecargo ["100Rnd_556x45_M249",12];
		_vec addmagazinecargo ["100Rnd_556x45_BetaCMag_airLock",12];
		if (gitsnades == 1) then
		{
		_vec addmagazinecargo ["EB_5Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24",12];
		_vec addmagazinecargo ["EB_10Rnd_762x51_M24_p",12];
		_vec addmagazinecargo ["EB_60Rnd_556x45_Stanag",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_T",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_P",12];
		_vec addMagazineCargo ["EB_5Rnd_86x70_L115A1_PT",12];
		_vec addMagazineCargo ["EB_7rnd_m1911SD",12];
		_vec addMagazineCargo ["EB_7rnd_m1911",12];
		_vec addMagazineCargo ["EB_1Rnd_BS_M576",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M381",12];
		_vec addMagazineCargo ["EB_1Rnd_HE_M406",12];
		_vec addMagazineCargo ["EB_1Rnd_HEDP_M433",12];
		_vec addMagazineCargo ["EB_1Rnd_AB_M397",12];
		_vec addMagazineCargo ["EB_m406vest",12];
		//new M107 ammo
		_vec addMagazineCargo ["LWS_Laserbatteries",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_AP",12];
		_vec addMagazineCargo ["EB_10Rnd_127x99_m107_HE",12];
//new MG ammo
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_I",12];
		_vec addmagazinecargo ["EB_200Rnd_762x51_M240_AP",12];
		_vec addmagazinecargo ["EB_600Rnd_762x51_M240",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_AP",12];
		_vec addmagazinecargo ["EB_200Rnd_556x45_M249_I",12];
//new items
		_vec AddWeaponCargo ["EB_TIscanner",1];
		_vec AddWeaponCargo ["EB_TIGoggles",1];
		_vec AddWeaponCargo ["EB_S10",1];
		_vec addmagazinecargo ["EB_knife",2];
		_vec addmagazinecargo ["EB_kabar",2];
		_vec addmagazinecargo ["EB_ItemFuelcanEmpty",2];
		_vec AddWeaponCargo ["EB_ItemSiphon",2];
		_vec AddWeaponCargo ["EB_ItemSil_hgun",12];
		_vec AddWeaponCargo ["EB_ItemSil_rifle",12];
//new GL AMMO
		_vec addMagazineCargo ["5Rnd_HE_M203",12];
		_vec addMagazineCargo ["5Rnd_HEDP_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareWhite_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareRed_M203",12];
		_vec addMagazineCargo ["5Rnd_FlareYellow_M203",12];
		_vec addMagazineCargo ["5Rnd_Smoke_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeRed_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeGreen_M203",12];
		_vec addMagazineCargo ["5Rnd_SmokeYellow_M203",12];
		_vec addMagazineCargo ["EB_SmokeShellChem",12];
		_vec addMagazineCargo ["BD_1Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Chem_M203",12];
		_vec addMagazineCargo ["5Rnd_Chem_M203",12];
		_vec addMagazineCargo ["BD_1Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["BD_6Rnd_Buckshot_M203",12];
		_vec addMagazineCargo ["5Rnd_Buckshot_M203",12];
	};
//old GL ammo
	_vec addMagazineCargo ["1rnd_HE_M203",12];
	_vec addMagazineCargo ["FlareWhite_M203",12];
	_vec addMagazineCargo ["FlareRed_M203",12];
	_vec addMagazineCargo ["FlareGreen_M203",12];
	_vec addMagazineCargo ["FlareYellow_M203",12];
	_vec addMagazineCargo ["SmokeShell",12];
	_vec addMagazineCargo ["SmokeShellRed",12];
	_vec addMagazineCargo ["SmokeShellGreen",12];
	_vec addMagazineCargo ["SmokeShellYellow",12];
	_vec addMagazineCargo ["SmokeShellPurple",12];
	_vec addMagazineCargo ["SmokeShellBlue",12];
	_vec addMagazineCargo ["SmokeShellOrange",12];
};

BIS_EVO_Mrew =
{
	_bscore = 0;
	_unit = player;
	if (score _unit <= BIS_EVO_rank1 and _bscore < 2) then{_bscore = 14};
	 if (score _unit > BIS_EVO_rank1 and _bscore < 4) then{_bscore = 4};
	 if (score _unit > BIS_EVO_rank2 and _bscore < 6) then{_bscore = 6};
	 if (score _unit > BIS_EVO_rank3 and _bscore < 8) then{_bscore = 8};
	 if (score _unit > BIS_EVO_rank4 and _bscore < 10) then{_bscore = 10};
	 if (score _unit > BIS_EVO_rank5 and _bscore < 12) then {_bscore = 12};
	 if (score _unit >= BIS_EVO_rank6 and _bscore < 14) then{_bscore = 14};
	BIS_EVO_punitC = player;
	BIS_EVO_prewC  = _bscore;
	publicVariable "BIS_EVO_prewC";
	publicVariable "BIS_EVO_punitC";
	_txtcommon = localize "STR_M04t0_5";
	_txtpasshead = localize "STR_M04t77";
	_txtpassbody = format["+%1 %2",_bscore,_txtcommon];
	["#00FF00",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

BIS_EVO_Erew =
{
	_zone = _this select 0;
	_unit = player;
	_bscore = 0;
	if (_zone == BIS_EVO_EngZone) then
	{
		if (score _unit <= BIS_EVO_rank1) then {_bscore = 2;};
		if (score _unit > BIS_EVO_rank1) then {_bscore = 4};
		if (score _unit > BIS_EVO_rank2) then {_bscore = 6};
		if (score _unit > BIS_EVO_rank3) then {_bscore = 8};
		if (score _unit > BIS_EVO_rank4) then {_bscore = 10};
		if (score _unit > BIS_EVO_rank5) then {_bscore = 12};
		if (score _unit >= BIS_EVO_rank6) then {_bscore = 14};
		BIS_EVO_punitC = player;
		BIS_EVO_prewC  = _bscore;
		publicVariable "BIS_EVO_prewC";
		publicVariable "BIS_EVO_punitC";
		_txtcommon = localize "STR_M04t0_5";//Points
		_txtpasshead = localize "STR_M04t75";//Repair Bonus
		_txtpassbody = format["+%1 %2",_bscore,_txtcommon];
		["#00FF00",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
	};
};

BIS_EVO_AssignTasks =  // Assigns common main city objectives
{
	_MissionBriefingHUD = "";
	_MissionBriefingShort = "";
	_MissionBriefingLong = "";
	if(isNull BIS_EVO_Objective0) then
	{
		_MissionBriefingLong = localize "STR_M04t57";//Take a break for a while.
		_MissionBriefingHUD = "";
		_MissionBriefingShort = localize "STR_M04t56";//Unassign
		BIS_EVO_Objective0 = player createSimpleTask ["obj0"];
		BIS_EVO_Objective0 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective0 settaskstate "Created";
	};
	
	if( (BIS_EVO_MissionProgress != -1) ) then {
		_MissionBriefingHUD = localize "STR_M04t58";//ASSAULT
		_MissionBriefingShort = (BIS_EVO_Townnames select 0);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];// Command has issued an order to launch a full scale assault on %1. The primary objective is to neutralize all enemy in the area. Secondary objectives are to disable their radio tower and capture any high ranking officers you find in the town.
		BIS_EVO_Objective1 = player createSimpleTask ["obj1"];
		BIS_EVO_Objective1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective1 setSimpleTaskDestination GetMarkerPos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress) ;
		BIS_EVO_Objective1 settaskstate "Created";
		player setCurrentTask BIS_EVO_Objective1;
	};
/*
	if(BIS_EVO_MissionProgress == 0 ) then
	{
		_MissionBriefingHUD = localize "STR_M04t58";//ASSAULT
		//_MissionBriefingShort = "Lopatino";
		//_MissionBriefingShort = localize "str_location_lopatino";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];// Command has issued an order to launch a full scale assault on %1. The primary objective is to neutralize all enemy in the area. Secondary objectives are to disable their radio tower and capture any high ranking officers you find in the town.
		BIS_EVO_Objective1 = player createSimpleTask ["obj1"];
		BIS_EVO_Objective1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective1 setSimpleTaskDestination GetMarkerPos "mobj1";
		BIS_EVO_Objective1 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective0};
	};
	if(BIS_EVO_MissionProgress == 1) then
	{
		BIS_EVO_Objective1 settaskstate "Succeeded";
//		_MissionBriefingShort = "Vybor";
//		_MissionBriefingShort = localize "str_location_vybor";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective2 = player createSimpleTask ["obj2"];
		BIS_EVO_Objective2 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective2 setSimpleTaskDestination GetMarkerPos "mobj2";
		BIS_EVO_Objective2 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective2};
	};
	if(BIS_EVO_MissionProgress == 2) then
	{
		BIS_EVO_Objective2 settaskstate "Succeeded";
//		_MissionBriefingShort = "Grishino";
//		_MissionBriefingShort = localize "str_location_grishino";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective3 = player createSimpleTask ["obj3"];
		BIS_EVO_Objective3 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective3 setSimpleTaskDestination GetMarkerPos "mobj3";
		BIS_EVO_Objective3 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective3};
	};
	if(BIS_EVO_MissionProgress == 3) then
	{
		BIS_EVO_Objective3 settaskstate "Succeeded";
//		_MissionBriefingShort = "Gvozdno";
//		_MissionBriefingShort = localize "str_location_gvozdno";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective4 = player createSimpleTask ["obj4"];
		BIS_EVO_Objective4 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective4 setSimpleTaskDestination GetMarkerPos "mobj4";
		BIS_EVO_Objective4 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective4};
	};
	if(BIS_EVO_MissionProgress == 4) then
	{
		BIS_EVO_Objective4 settaskstate "Succeeded";

//		_MissionBriefingShort = "Krasnostav";
//		_MissionBriefingShort = localize "str_location_krasnostav";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective5 = player createSimpleTask ["obj5"];
		BIS_EVO_Objective5 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective5 setSimpleTaskDestination GetMarkerPos "mobj5";
		BIS_EVO_Objective5 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective5};
	};
	if(BIS_EVO_MissionProgress == 5) then
	{
		BIS_EVO_Objective5 settaskstate "Succeeded";
//		_MissionBriefingShort = "Khelm";
//		_MissionBriefingShort = localize "str_location_khelm";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective6 = player createSimpleTask ["obj6"];
		BIS_EVO_Objective6 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective6 setSimpleTaskDestination GetMarkerPos "mobj6";
		BIS_EVO_Objective6 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective6};
	};
	if(BIS_EVO_MissionProgress == 6) then
	{
		BIS_EVO_Objective6 settaskstate "Succeeded";
//		_MissionBriefingShort = "Berezino";
//		_MissionBriefingShort = localize "str_location_berezino";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective7 = player createSimpleTask ["obj7"];
		BIS_EVO_Objective7 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective7 setSimpleTaskDestination GetMarkerPos "mobj7";
		BIS_EVO_Objective7 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective7};
	};
	if(BIS_EVO_MissionProgress == 7) then
	{
		BIS_EVO_Objective7 settaskstate "Succeeded";
//		_MissionBriefingShort = "Solnichniy";
//		_MissionBriefingShort = localize "str_location_solnichniy";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective8 = player createSimpleTask ["obj8"];
		BIS_EVO_Objective8 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective8 setSimpleTaskDestination GetMarkerPos "mobj8";
		BIS_EVO_Objective8 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective8};
	};
	if(BIS_EVO_MissionProgress == 8) then
	{
		BIS_EVO_Objective8 settaskstate "Succeeded";
//		_MissionBriefingShort = "Kamyshovo";
//		_MissionBriefingShort = localize "str_location_kamyshovo";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective9 = player createSimpleTask ["obj9"];
		BIS_EVO_Objective9 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective9 setSimpleTaskDestination GetMarkerPos "mobj9";
		BIS_EVO_Objective9 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective9};
	};
	if(BIS_EVO_MissionProgress == 9) then
	{
		BIS_EVO_Objective9 settaskstate "Succeeded";
//		_MissionBriefingShort = "Elektrozadovsk";
//		_MissionBriefingShort = localize "str_location_elektrozavodsk";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective10 = player createSimpleTask ["obj10"];
		BIS_EVO_Objective10 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective10 setSimpleTaskDestination GetMarkerPos "mobj10";
		BIS_EVO_Objective10 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective10};
	};
	if(BIS_EVO_MissionProgress == 10 ) then
	{
		BIS_EVO_Objective10 settaskstate "Succeeded";
//		_MissionBriefingShort = "Chernogorsk";
//		_MissionBriefingShort = localize "str_location_chernogorsk";
		_MissionBriefingShort = (BIS_EVO_Townnames select BIS_EVO_MissionProgress);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];
		BIS_EVO_Objective11 = player createSimpleTask ["obj11"];
		BIS_EVO_Objective11 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective11 setSimpleTaskDestination GetMarkerPos "mobj11";
		BIS_EVO_Objective11 settaskstate "Created";
		if(not BIS_EVO_Onmission) then {player setCurrentTask BIS_EVO_Objective11};
	};*/
		if(BIS_EVO_MissionProgress == -1 ) then {
		//	BIS_EVO_Objective1 settaskstate "Succeeded";
		};

	if(BIS_EVO_MissionProgress == 11) then
	{
		
	};

};

BIS_EVO_Message = // Most hint messages are sent here for a common display and record to log
{
	_headcolor = _this select 0;
	_head = _this select 1;
	_body = _this select 2;
	_plaintext = format["%1: %2",_head,_body];
	_parsedtext = parseText format["<t color='%1'>%2</t><br/><br/>%3",_headcolor,_head,_body];
	_msg = [_parsedtext];
	_txt = composeText _msg;
	hint _txt;
	_record = player createDiaryRecord ["diary", [localize "STR_M04t78", _plaintext]];//"Message Log"
};

BIS_EVO_RankReq = // Displays required rank when player is ejected.
{
	_player = _this select 0;
	_name = name vehicle _player;
	_rank = rank _player;
	_reqrank = _this select 1;
	_nrank = "";

	switch (_reqrank) do
	{
	    case BIS_EVO_rank1:
	    {
		_nrank = "CORPORAL";
	    };
	    case BIS_EVO_rank2:
	    {
		_nrank = "SERGEANT";
	    };
	    case BIS_EVO_rank3:
	    {
		_nrank = "LIEUTENANT";
	    };
	    case  BIS_EVO_rank4:
	    {
		_nrank = "CAPTAIN";
	    };
	    case  BIS_EVO_rank5:
	    {
		_nrank = "MAJOR";
	    };
	    case  BIS_EVO_rank6:
	    {
		_nrank = "COLONEL";
	    };
	};

	_txtpasshead = localize "STR_M04t79";//Higher Rank Required
	_txtreq = localize "STR_M04t80";//Rank Required
	_textcur = localize "STR_M04t81";//Current Rank
	_txtpassbody = format["%1 : %2<br/>%3 : %4",_textcur,_rank,_txtreq,_nrank];
	["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

true
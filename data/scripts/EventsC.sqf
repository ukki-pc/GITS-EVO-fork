
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

BIS_EVO_ResetClick =
{
	onMapSingleClick "if (_alt and debug) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
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
		BIS_EVO_Objective1 setSimpleTaskDestination getPos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
		BIS_EVO_Objective1 settaskstate "Created";
		player setCurrentTask BIS_EVO_Objective1;
	};
		if(BIS_EVO_MissionProgress == -1 ) then {
		BIS_EVO_Objective1 settaskstate "Succeeded";
		//	BIS_EVO_Objective1 settaskstate "Succeeded";
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
	hintSilent _txt;
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
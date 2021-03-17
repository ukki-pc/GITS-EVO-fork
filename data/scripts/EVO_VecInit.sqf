BIS_EVO_VecInit = 
{ 
	_unit = _this select 0;
	_vec = _this select 1;
	_Vehicle = typeOf _vec;
	_pilotchecktype = typeOf _unit;
	_rank1 = BIS_EVO_rank1;
	_rank2 = BIS_EVO_rank2;
	_rank3 = BIS_EVO_rank3;
	_rank4 = BIS_EVO_rank4;
	_rank5 = BIS_EVO_rank5;
	_rank6 = BIS_EVO_rank6;
	_dunit = _unit;
	_warning = 0;

	if (not (local _unit)) exitwith {};
	if(_unit == player) then {disableUserInput true};

	BIS_EVO_Eject = 
	{
		_unit = _this select 0;
		_unit action ["ENGINEOFF", _vec];
		_unit action ["Eject",_vec];
		_vec setVelocity [0, 0, 0];
		sleep 1.0;
		_unit action ["ENGINEOFF", _vec];
		_unit action ["Eject",_vec];
		_vec setVelocity [0, 0, 0];		
		if(_unit == player) then {disableUserInput false};
	};


	if (getdammage _vec == 0) then
	{
		_vec setdammage 0.01;
	};
	if (not (isPlayer _unit)) then
	{
		_dunit = (leader _unit);
	};
	_vec removeaction wcam;

//unlocks everything for pilots

	switch (_Vehicle) do
	{
//modded desert BAF
/*

NEW
"EB_ArmoredSUV_Gau19"
"EB_ArmoredSUV_Gau2"

"EB_Dingo_M2_Dst"
"EB_Dingo_M2_Wdl"

"pook_Pandur_RCWS30_ACR"
"pook_Pandur_RWS_ACR"
"pook_Pandur_M2_ACR"
"pook_Pandur_Mk19_ACR"
"pook_Pandur_AT_ACR"
"pook_Pandur_HQ_ACR"
"pook_Pandur_AA_ACR"
"pook_Pandur_RCWS30_TKGUE"
"pook_Pandur_RWS_TKGUE"
"pook_Pandur_M2_TKGUE"
"pook_Pandur_Mk19_TKGUE"
"pook_Pandur_AT_TKGUE"
"pook_Pandur_HQ_TKGUE"
"pook_Pandur_AA_TKGUE"

"pook_HEMTT"
"pook_HEMTT_US"
"pook_HEMTT_CDF"
"pook_HEMTT_CDF_IND"
"pook_HEMTT_gun"
"pook_HEMTT_gun_US"
"pook_HEMTT_gun_CDF"
"pook_HEMTT_gun_CDF_IND"
"pook_HEMTT_ammo"
"pook_HEMTT_ammo_US"
"pook_HEMTT_ammo_CDF"
"pook_HEMTT_ammo_CDF_IND"
"pook_HEMTT_fuel"
"pook_HEMTT_fuel_US"
"pook_HEMTT_fuel_CDF"
"pook_HEMTT_fuel_CDF_IND"
"pook_HEMTT_repair"
"pook_HEMTT_repair_US"
"pook_HEMTT_repair_CDF"
"pook_HEMTT_repair_CDF_IND"

"pook_SCUD_CDF"
"pook_SCUD_GUE"
"pook_9K331_CDF"
"pook_9K332_CDF"
"pook_9K37_CDF"
"pook_9K37M2_CDF"
"pook_9K317_CDF"
"pook_9K317M2_CDF"
"pook_96K6_CDF"
"pook_NASAMS"
"pook_NASAMS_US"
"pook_NASAMS_CDF"
"pook_NASAMS_CDF_IND"
"pook_CRAM"
"pook_CRAM_US"
"pook_CRAM_CDF"
"pook_CRAM_CDF_IND"

"pook_TO55_TK_GUE"

"EB_M1A2_US_D"
"EB_M1A3_US"
"EB_M1A3_US_D"
"EB_M1A3_TUSK"
"EB_M1A3_TUSK_D"
"EB_OT34_TK"
"EB_T34_76_TK"
"EB_T34_85_TK"
"EB_OT55_TK"
"T55_TK_GUE_EP1"
"T55_TK_EP1"
"EB_T72B_RU"
"EB_M2A3_WH"
"EB_M3A1"
"EB_AAV_D"
"EB_AAV_FT"
"EB_AAV_FT_D"
"EB_LAV25_HQ_D"
"EB_LAV25_D"

"RE_mhq"
"RE_landrover6x6_BAF"
"RE_landrover_BAF"
"re_lav25"
"RE_LAV35"
"Chenowth_BAF_W"
"Chenowth_BAF_D",

//release updates
"EB_M1114_Armored_D",
"EB_HMMWV_M1151_M2_W",
"EB_M1128_MGS_AP",
"EB_M1128_MGS_AT",
"EB_M1128_MGS_LRS",
"EB_M1128_MGS_AGM",
"EB_M1128_MGS_ARTY",
"EB_LAV25_W2",
"EB_LAV25_D2",
"EB_LAV25_UN",
"EB_Pandur2_D",
"EB_M1135_JAV",

"EB_M1_US",
"EB_M1_US_D",
"EB_M1A2_US",
"EB_M1A2_US_D",
"EB_M1A3_US",
"EB_M1A3_US_D",
"EB_M1A3_TUSK",
"EB_M1A3_TUSK_D",

"EB_GAZ_Vodnik_HMG_TK",
"EB_GAZ_Vodnik_TK",
"EB_GAZ_Vodnik_MedEvac_TK",
"EB_BRDM2_RU",
"EB_BRDM2_HQ_RU",
"EB_BRDM2_ATGM_RU",
"EB_BRDM2_HQ_TK",
"EB_BTR60_RU",
"EB_BTR90_HQ_TK",
"EB_BTR90_TK",

"EB_BMP2_Ambul_TK",
"EB_BMP2_RU",
"EB_BMP1_RU",
"EB_BMP2_HQ_RU",
"EB_BMP2_Ambul_RU",
"EB_BMP3_TK",
"EB_OT34_TK",
"EB_T34_76_TK",
"EB_T34_85_TK",
"EB_OT55_TK",
"EB_T72B_RU",
"EB_2S6M_Tunguska_D",

"dpv_BAF_W",
"dpv_BAF_D",
"BAFX_Ridgeback_W",
"BAFX_Ridgeback_D",
"BAFX_Mastiff_HMG_D",
"BAFX_Mastiff_GMG_D",
"BAFX_Mastiff_GPMG_D",
"BAFX_Mastiff_HMG_W",
"BAFX_Mastiff_GMG_W",
"BAFX_Mastiff_GPMG_W",

"BAFX_Spartan_W",
"BAFX_Spartan_W2",
"BAFX_Spartan_D",
"BAFX_Scimitar_W",
"BAFX_Scimitar_D",
"BAFX_Scorpion_W",
"BAFX_Scorpion_D",
"BAFX_Bulldog_W",
"BAFX_Bulldog_RWS_W",
"BAFX_Bulldog_D",
"BAFX_Bulldog_RWS_D",
"BAFX_warrior_W1",
"BAFX_warrior_W2",
"BAFX_warrior_D1",
"BAFX_warrior_D2",
"BAFX_warrior_D3",
"BAFX_warrior_UN",
"BAFX_Chieftain_mk9_D",
"BAFX_Chieftain_mk9A_D",
"BAFX_Chieftain_Mk11_D",
"BAFX_Chieftain_Mk11_L_D",
"BAFX_Chieftain_mk9_W",
"BAFX_Chieftain_mk9A_W",
"BAFX_Chieftain_mk9B_W",
"BAFX_Chieftain_mk9_stow_W",
"BAFX_Chieftain_mk9D_W",
"BAFX_Chieftain_Mk10_W",
"BAFX_Chieftain_Mk11_W",
"BAFX_Chieftain_Mk11_Stow_W",
"BAFX_Chieftain_AVLB_W",
"BAFX_Chieftain_ARRV_W",
"BAFX_Chieftain_AVLB_D",
"BAFX_Chieftain_ARRV_D",
"BAFX_Challenger_D",
"BAFX_Challenger_LR_EX_D",
"BAFX_Challenger_Stow_D",
"BAFX_Challenger_W",
"BAFX_Challenger_LR_W",
"BAFX_Challenger_LR_EX_W",
"BAFX_Challenger_LR_L_W",
"BAFX_Challenger_Stow_W",
"BAFX_Challenger_Stow_LR_W",
"BAFX_Challenger2_W",
"BAFX_Challenger2_W2",
"BAFX_Challenger2_WC",
"BAFX_Challenger2_LR_W",
"BAFX_Challenger2_Stow_W",
"BAFX_Challenger2_D",
"BAFX_Challenger2_LR_D",

"BAFX_Scout",
"BAFX_Scout1",
"BAFX_Scout2",
"BAFX_Scout3",
"BAFX_Scout4",
"BAFX_Scout5",
"BAFX_Lynx_MT",
"BAFX_Lynx_WT",
"BAFX_Lynx_M",
"BAFX_Lynx_W",
"BAFX_Gazelle_MG",
"BAFX_Gazelle_W",
"BAFX_Gazelle_C1",
"BAFX_Gazelle_C2",
"BAFX_Gazelle_C3",
"BAFX_Gazelle_CO",
"BAFX_Gazelle_P",
"BAFX_Gazelle_PO",
"BAFX_Gazelle_D",
"BAFX_Gazelle_UN"


*/
		case "Dingo_GL_DST_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Dingo_DST_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "dingo_2_cz_mg":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Dingo_GL_Wdl_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Dingo_WDL_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_Dingo_M2_Dst":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_Dingo_M2_Wdl":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_ArmoredSUV_Gau2":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_ArmoredSUV_Gau19":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
		case "Pandur2_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "pook_Pandur_HQ_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_M2_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_Mk19_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_RWS_ACR":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_RCWS30_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_AT_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_AA_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    

	    case "pook_Pandur_HQ_TKGUE":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_M2_TKGUE":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_Mk19_TKGUE":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_RWS_TKGUE":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_RCWS30_TKGUE":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_AT_TKGUE":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_Pandur_AA_TKGUE":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    

	    case "pook_TO55_TK_GUE":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_US":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_CDF_IND":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_gun":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_gun_US":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_gun_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_gun_CDF_IND":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_ammo":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_ammo_US":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_ammo_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_ammo_CDF_IND":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_fuel":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_fuel_US":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_fuel_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_fuel_CDF_IND":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_repair":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_repair_US":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_repair_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_HEMTT_repair_CDF_IND":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_SCUD_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_SCUD_GUE":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K331_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K332_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K37_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K37M2_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K317_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_9K317M2_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_96K6_CDF":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_NASAMS":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_NASAMS_US":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_NASAMS_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_NASAMS_CDF_IND":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_CRAM":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_CRAM_US":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_CRAM_CDF":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "pook_CRAM_CDF_IND":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    

	    case "EB_M1114_Armored_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_HMMWV_M1151_M2_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1128_MGS_AP":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1128_MGS_AT":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1128_MGS_LRS":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1128_MGS_AGM":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1128_MGS_ARTY":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_LAV25_W2":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_LAV25_D2":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_LAV25_UN":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_Pandur2_D":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1135_JAV":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1_US":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1_US_D":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A2_US":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A2_US_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_US":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_US_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_TUSK":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_TUSK_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_GAZ_Vodnik_HMG_TK":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_GAZ_Vodnik_TK":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_GAZ_Vodnik_MedEvac_TK":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BRDM2_RU":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BRDM2_HQ_RU":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BRDM2_ATGM_RU":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BRDM2_HQ_TK":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BTR60_RU":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BTR90_HQ_TK":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BTR90_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP2_Ambul_TK":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP2_RU":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP1_RU":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP2_HQ_RU":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP2_Ambul_RU":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_BMP3_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_OT34_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T34_76_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T34_85_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_OT55_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T72B_RU":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_2S6M_Tunguska_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "dpv_BAF_W":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "dpv_BAF_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Ridgeback_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Ridgeback_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_HMG_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_GMG_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_GPMG_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_HMG_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_GMG_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Mastiff_GPMG_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Spartan_W":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Spartan_W2":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Spartan_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scimitar_W":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scimitar_D":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scorpion_W":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scorpion_D":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Bulldog_W":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Bulldog_RWS_W":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Bulldog_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Bulldog_RWS_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_W1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_W2":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_D1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_D2":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_D3":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_warrior_UN":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9_D":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9A_D":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_Mk11_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_Mk11_L_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9_W":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9A_W":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9B_W":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9_stow_W":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_mk9D_W":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_Mk10_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_Mk11_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_Mk11_Stow_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_AVLB_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_ARRV_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_AVLB_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Chieftain_ARRV_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_LR_EX_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_Stow_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_LR_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_LR_EX_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_LR_L_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_Stow_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger_Stow_LR_W":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_W":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_W2":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_WC":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_LR_W":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_Stow_W":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Challenger2_LR_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout2":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout3":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout4":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Scout5":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Lynx_MT":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Lynx_WT":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Lynx_M":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Lynx_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_MG":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_C1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_C2":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_C3":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_CO":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_P":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_PO":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BAFX_Gazelle_UN":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_110_des":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_wmik_des":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_wmik_gpmg_des":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_wmik_gmg_des":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Chenowth":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Chenowth_BAF_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Chenowth_BAF_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "RE_landrover_BAF":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "RE_landrover6x6_BAF":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "RE_mhq":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "re_lav25":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "RE_LAV35":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };

	    case "ukf_jackal_mwmik":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_jackal_mwmik_gpmg":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ukf_jackal_mwmik_gmg":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPPolicePatrol_PMCWest":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPPolice_PMCWest":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPM240_PMCwest":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPHQ_PMCWest":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPHQcomm_PMCWest":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "BRDM2IMPm134":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "SpartanD":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Spartan":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "rksl_foxhound_lppv":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "blx_fv432_bulldog":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "blx_fv432_bulldog_RWS":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "blx_ridgeback_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "LGN_GMGDES":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "LGN_GPMGDES":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "LGN_HMGDES":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A2_US_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_US":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_US_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_TUSK":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_M1A3_TUSK_D":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    

	    case "EB_OT34_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T34_76_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T34_85_TK":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_OT55_TK":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "T55_TK_GUE_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "T55_TK_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "EB_T72B_RU":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior2":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior3":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior4":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "warrior5":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "PRACS_FV107":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "PRACS_FV101":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ScimitarD":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ScorpionD":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainAVLB":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainARRV":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainMK11B":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainMK11C":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainMK9F":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "ChieftainMK9EE":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger1":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger1CATCNB":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger1EXD":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger1NB":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger2CC":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Challenger2D":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "HMMWV":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "HMMWV_Ambulance":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "HMMWV_Armored":
	    {	    
	   	 if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "HMMWV_M2":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "HMMWV_TOW":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "HMMWV_MK19":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };   
	    case "HMMWV_Avenger":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "AAV":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "LAV25_HQ":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "LAV25":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_LAV25_HQ_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_LAV25_D":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_AAV_D":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_AAV_FT":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "EB_AAV_FT_D":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "M1A1":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "M1A2_TUSK_MG":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "MH60S":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    }; 
	    case "UH1Y":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "MV22":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    }; 
	    case "AH1Z":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AH64D_Sidewinders":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AH64D":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AV8B":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AV8B2":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    }; 
	    case "F35B":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };    
	    case "A10":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "C130J":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	    
	    case "UAZ_RU":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_Ins":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_MG_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_MG_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_AGS30_RU":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_AGS30_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_AGS30_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_SPG9_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Pickup_PK_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Offroad_DSHKM_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Offroad_SPG9_Gue":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "GAZ_Vodnik_MedEvac":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "GAZ_Vodnik":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "GAZ_Vodnik_HMG":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_HQ_Gue":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_INS":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_CDF":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_Gue":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_ATGM_INS":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_ATGM_CDF":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BTR90_HQ":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BTR90":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BMP2_Ambul_INS":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_Ambul_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_HQ_INS":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_HQ_CDF":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_INS":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP2_Gue":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP3":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
  	    case "T34":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_INS":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_RU":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_CDF":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_Gue":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T90":
	    {
		if (score _dunit < _rank6 && ranklock < 2) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Ural_ZU23_CDF":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Ural_ZU23_INS":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Ural_ZU23_Gue":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "ZSU_CDF":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "ZSU_INS":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "2S6M_Tunguska":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "GRAD_RU":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "GRAD_CDF":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "GRAD_INS":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Mi17_medevac_CDF":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_CDF":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_medevac_Ins":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_Ins":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_medevac_RU":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_rockets_RU":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi24_D":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Mi24_P":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Mi24_V":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Ka52":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Ka52Black":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
/*
	    case "CMA_Mi28_RUS":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
*/
	    case "Su34":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Su34B":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Su25_CDF":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	
	    case "Su25_Ins":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	    
	    case "Su39":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	    
		case "C130J_US_EP1":
	    {
		if (score _dunit < _rank6 && ranklock < 2 ) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };

		case "BAF_Apache_AH1_D":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	 
		case "CH_47F_BAF":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	
		case "BAF_Merlin_HC3_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };		
		case "AW159_Lynx_BAF":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };		
		case "A10_US_EP1":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "AH6J_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "An2_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "MH6J_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "L39_TK_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "Mi24_D_TK_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "Mi17_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "Su25_TK_EP1":
	    {
		if (score _dunit < _rank6 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "UH1H_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "An2_1_TK_CIV_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "An2_2_TK_CIV_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
		case "M1A1_US_DES_EP1":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
		case "M1A2_US_TUSK_MG_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "MLRS_DES_EP1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M2A2_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M2A3_EP1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M6_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "EB_M2A3_WH":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "EB_M3A1":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1135_ATGMV_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1130_CV_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1126_ICV_M2_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1126_ICV_mk19_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1129_MC_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1128_MGS_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "MTVR_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "MtvrReammo_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "MtvrRefuel_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		
		case "M1133_MEV_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_CZ_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_Special_CZ_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BMP2_TK_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BMP2_HQ_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BRDM2_TK_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BRDM2_ATGM_TK_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BTR60_TK_EP1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M113_TK_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T34_TK_EP1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T55_TK_EP1":
	    {
		if (score _dunit < _rank4 && ranklock < 2) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T72_TK_EP1":
	    {
		if (score _dunit < _rank5 && ranklock < 2) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "ZSU_TK_EP1":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "GRAD_TK_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_MG_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_SPG9_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "TT650_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "ArmoredSUV_PMC":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "SUV_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "UAZ_Unarmed_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "UAZ_AGS30_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Ural_ZU23_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "V3S_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "V3S_Open_TK_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BTR40_TK_INS_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BTR40_MG_TK_INS_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_MG_TK_INS_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_SPG9_TK_INS_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Old_bike_TK_INS_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M113_UN_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "SUV_UN_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_FV510_D":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_FV510_W":
	    {
		if (score _dunit < _rank3 && ranklock < 2) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_ATV_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Jackal2_GMG_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Jackal2_L2A1_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Jackal2_L2A1_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Jackal2_GMG_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Jackal2_L2A1_2_W":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BAF_Offroad_D":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M119_US_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M252_US_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Ka60_PMC":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Ka60_GL_PMC":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };

		case "HMMWV_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_MK19_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_TOW_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M1151_M2_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M998_crows_MK2_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M998_crows_MK19_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_Avenger_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M998A2_SOV_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_Terminal_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1030_US_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M1035_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };

//adding ACR CZ vecs

		case "L159_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "L39_ACR":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "L39_2_ACR":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Mi171Sh_CZ_EP1":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Mi171Sh_rockets_CZ_EP1":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Mi24_D_CZ_ACR":
	    {
		if (score _dunit < _rank4 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BMP2_Des_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BRDM2_Desert_ACR":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BMP2_ACR":
	    {
		if (score _dunit < _rank3 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "BRDM2_ACR":
	    {
		if (score _dunit < _rank2 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T72_ACR":
	    {
		if (score _dunit < _rank5 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "ATV_CZ_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1114_AGS_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "M1114_DSK_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_M1151_M2_CZ_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "RM70_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810_Open_Des_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810A_Des_MG_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };

		case "T810_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810A_MG_ACR":
	    {
		if (score _dunit < _rank1 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810_Open_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "Octavia_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "PBX_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "HMMWV_Ambulance_CZ_DES_EP1":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_Ambulance_Des_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810Reammo_Des_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810Refuel_Des_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "LandRover_Ambulance_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810Reammo_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "T810Refuel_ACR":
	    {
		if (score _dunit < _rank0 && ranklock < 2 && _pilotcheck !=1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
		case "t810_repair":
	    {
		if (_pilotchecktype in EGG_EVO_playerEng) then
		{    
			if(not (isNull BIS_EVO_ltrk)) then
			{
				BIS_EVO_ltrk removeaction BIS_EVO_elock;
				BIS_EVO_ltrk lock false;
			};
			BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];BIS_EVO_ltrk = _vec
		};
	    };
		case "T810Repair_ACR":
	    {
		if (_pilotchecktype in EGG_EVO_playerEng) then
		{    
			if(not (isNull BIS_EVO_ltrk)) then
			{
				BIS_EVO_ltrk removeaction BIS_EVO_elock;
				BIS_EVO_ltrk lock false;
			};
			BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];BIS_EVO_ltrk = _vec
		};
	    };

	    case "MtvrRepair":
	    {
//		if (player isKindOf "BAF_Soldier_EN_MTP") then
		if (_pilotchecktype in EGG_EVO_playerEng) then
		{    
			if(not (isNull BIS_EVO_ltrk)) then
			{
				BIS_EVO_ltrk removeaction BIS_EVO_elock;
				BIS_EVO_ltrk lock false;
			};
			BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];BIS_EVO_ltrk = _vec
		};
	    };
		case "MtvrRepair_DES_EP1":
	    {
//		if (player isKindOf "BAF_Soldier_EN_MTP") then
		if (_pilotchecktype in EGG_EVO_playerEng) then
		{    
			if(not (isNull BIS_EVO_ltrk)) then
			{
				BIS_EVO_ltrk removeaction BIS_EVO_elock;
				BIS_EVO_ltrk lock false;
			};
			BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];BIS_EVO_ltrk = _vec
		};
	    };
	    case "KamazRepair":
	    {
//		if (player isKindOf "BAF_Soldier_EN_MTP") then
		if (_pilotchecktype in EGG_EVO_playerEng) then
		{
		if(not (isNull BIS_EVO_ltrk)) then
		{
			BIS_EVO_ltrk removeaction elock;
			BIS_EVO_ltrk lock false;
		};
		if(BIS_EVO_ltrk != _vec) then {BIS_EVO_elock = _vec addaction [localize "STR_M04t54", "data\scripts\englock.sqf",0,1, false, true,"test2"];BIS_EVO_ltrk = _vec};
		};
	     };
	};
	if(_unit == player) then {disableUserInput false};
	if(_vec isKindOf "Air") then
	{
		setViewDistance BIS_EVO_avdist;
	};
	Waituntil {player != driver _vec};
	//_vec removeaction wcam;
	_vec removealleventhandlers "Fired";
	setViewDistance BIS_EVO_vdist;
	if(_unit != player) exitWith {};
};

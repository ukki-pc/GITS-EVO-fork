/*
//Selects random vehicles
for [{_loop=0}, {_loop<4}, {_loop=_loop+1}] do {

	_randomIndex = [count buyCarList,100, 10, false] call weightedRandom;
	buyCarList set [_randomIndex,[(buyCarList select _randomIndex) select 0, (buyCarList select _randomIndex) select 1,((buyCarList select _randomIndex) select 2)+1]];
};
publicVariable "buyCarList";
//Selects random vehicles
for [{_loop=0}, {_loop<3}, {_loop=_loop+1}] do 
{
	_randomIndex = [count buyTankList,100, 10, false] call weightedRandom;
	buyTankList set [_randomIndex,[(buyTankList select _randomIndex) select 0, (buyTankList select _randomIndex) select 1,((buyTankList select _randomIndex) select 2)+1]];
};
publicVariable "buyTankList";
	//Selects random vehicles
	for [{_loop=0}, {_loop<2}, {_loop=_loop+1}] do {
		_randomIndex = [count buyAirList,100, 0, false, 2] call weightedRandom;
		buyAirList set [_randomIndex,[(buyAirList select _randomIndex) select 0, (buyAirList select _randomIndex) select 1,((buyAirList select _randomIndex) select 2)+1]];
	};
publicVariable "buyAirList";
				//Selects random vehicles
	for [{_loop=0}, {_loop<3}, {_loop=_loop+1}] do 
	{
		_randomIndex = [count buyStatList,100, 8, false, 100] call weightedRandom;
		buyStatList set [_randomIndex,[(buyStatList select _randomIndex) select 0, (buyStatList select _randomIndex) select 1,((buyStatList select _randomIndex) select 2)+1]];
	};
	publicVariable "buyStatList";

*/



// Main vehicle init
sleep 2.0;
{
	_type = TypeOf _x;
	switch (_type) do
	{


		
//modded desert BAF
//
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

"pook_Pandur_SLAT_RWS_TKGUE"
"pook_Pandur_SLAT_M2_TKGUE"
"pook_Pandur_SLAT_RCWS30_TKGUE"
"pook_Pandur_SLAT_Mk19_TKGUE"
"pook_Pandur_SLAT_SP30_TKGUE"
"pook_Pandur_MGS_TKGUE"
"pook_Pandur_Mortar_TKGUE"

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

"EB_M1128_MGS_AP"
"EB_M1128_MGS_AT"
"EB_M1128_MGS_LRS"
"EB_M1128_MGS_AGM"
"EB_M1128_MGS_ARTY"

"EB_M1_US_D"
"EB_M1_US"
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
"EB_M1128_MGS_AP"
"EB_M1128_MGS_AT"
"EB_M1128_MGS_LRS"
"EB_M1128_MGS_AGM"
"EB_M1128_MGS_ARTY"
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
"Chenowth_BAF_D"

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

"pook_M1161_ITV"
"pook_M1161_M2"
"pook_M1161_Mk19"
"pook_M1161_M2_SOV"
"pook_M1161_Mk19_SOV"
"pook_M1161_amb"
"pook_brdm2_sa9_UNO"
"pook_brdm2_UNO"
"pook_brdm2DSHK_UNO"
"pook_brdm2M2"
"pook_brdm2Mk19"
"pook_brdm2TOW"
"pook_brdm2M240_PMCwest"
"pook_brdm2m134"
"pook_brdm2Police_PMCWest"
"pook_brdm2PolicePatrol_PMCWest"
"pook_brdm2HQcomm_PMCWest"
"pook_brdm2HQ_PMCWest"
"pook_brdm2PKM_UNO"
"pook_brdm2AA_UNO"
*/

		case "Dingo_GL_DST_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Dingo_DST_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "dingo_2_cz_mg":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Dingo_GL_Wdl_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Dingo_WDL_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_Dingo_M2_Dst":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_Dingo_M2_Wdl":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dingo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_ArmoredSUV_Gau19":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_ArmoredSUV_Gau2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Pandur2_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_RCWS30_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_RWS_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_M2_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_Mk19_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_AT_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_HQ_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_AA_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "pook_Pandur_RCWS30_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_RWS_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_M2_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_Mk19_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_AT_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_HQ_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_AA_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_SLAT_RWS_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_SLAT_M2_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_SLAT_RCWS30_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_SLAT_Mk19_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_SLAT_SP30_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_MGS_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_Pandur_Mortar_TKGUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"APC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "pook_TO55_TK_GUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T55",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_SCUD_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SCUD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_SCUD_GUE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SCUD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K331_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K332_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K37_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K37M2_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K317_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_9K317M2_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_96K6_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_NASAMS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_NASAMS_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_NASAMS_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_NASAMS_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_CRAM":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"CRAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_CRAM_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"CRAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_CRAM_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"CRAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_CRAM_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"CRAM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_gun":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_gun_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_gun_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_gun_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_ammo":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_ammo_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_ammo_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_ammo_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_fuel":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_fuel_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_fuel_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_fuel_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_repair":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_repair_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_repair_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_HEMTT_repair_CDF_IND":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HEMTT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_M1161_M2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1161 Growler",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_M1161_Mk19":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1161 Growler",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_M1161_M2_SOV":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1161 Growler",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_M1161_Mk19_SOV":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1161 Growler",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_M1161_amb":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1161 Growler",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2_sa9_UNO":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2_UNO":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2DSHK_UNO":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2M2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2Mk19":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2TOW":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2M240_PMCwest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2m134":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2Police_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2PolicePatrol_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2HQcomm_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2HQ_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2PKM_UNO":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "pook_brdm2AA_UNO":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "EB_M1114_Armored_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_HMMWV_M1151_M2_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AP":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AT":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_LRS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AGM":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_ARTY":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_LAV25_W2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_LAV25_D2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_LAV25_UN":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_Pandur2_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1135_JAV":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A2_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A2_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_TUSK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_TUSK_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_GAZ_Vodnik_HMG_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_GAZ_Vodnik_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_GAZ_Vodnik_MedEvac_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BRDM2_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BRDM2_HQ_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BRDM2_ATGM_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BRDM2_HQ_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BTR60_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BTR90_HQ_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BTR90_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP2_Ambul_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP2_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP1_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP2_HQ_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP2_Ambul_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_BMP3_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_OT34_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T34_76_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T34_85_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_OT55_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T72B_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_2S6M_Tunguska_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "dpv_BAF_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "dpv_BAF_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Ridgeback_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Ridgeback_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_HMG_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_GMG_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_GPMG_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_HMG_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_GMG_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Mastiff_GPMG_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Spartan_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Spartan_W2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Spartan_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Scimitar_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Scimitar_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Scorpion_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Scorpion_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Bulldog_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Bulldog_RWS_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Bulldog_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Bulldog_RWS_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_W1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_W2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_D1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_D2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_D3":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_warrior_UN":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9A_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_Mk11_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_Mk11_L_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9A_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9B_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9_stow_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_mk9D_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_Mk10_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_Mk11_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_Mk11_Stow_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_AVLB_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_ARRV_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_AVLB_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Chieftain_ARRV_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_LR_EX_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_Stow_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_LR_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_LR_EX_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_LR_L_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_Stow_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger_Stow_LR_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_W2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_WC":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_LR_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_Stow_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAFX_Challenger2_LR_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vehicle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_ARTY":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AGM":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_LRS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AT":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1128_MGS_AP":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A2_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A2_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_US":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_US_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_TUSK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M1A3_TUSK_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1 Abrams",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_OT34_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T34",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T34_76_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T34",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T34_85_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T34",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_OT55_TK":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T55",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T55_TK_GUE_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T55",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_T72B_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "warrior":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "warrior1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "warrior2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "warrior3":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "warrior4":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "warrior5":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "blx_fv432_bulldog":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Bulldog",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "blx_fv432_bulldog_RWS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Bulldog",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "blx_ridgeback_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ridgeback",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LGN_GMGDES":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Mastiff",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LGN_GPMGDES":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Mastiff",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LGN_HMGDES":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Mastiff",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger1CATCNB":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger1EXD":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger1NB":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger2CC":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Challenger2D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainAVLB":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainARRV":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainMK11B":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainMK11C":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainMK9F":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ChieftainMK9EE":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tank",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ScimitarD":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Scimitar",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ScorpionD":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Scorpion",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SpartanD":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Spartan",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Spartan":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Spartan",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "rksl_foxhound_lppv":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Foxhound",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_110_des":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_jackal_mwmik":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_jackal_mwmik_gpmg":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_jackal_mwmik_gmg":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "ukf_wmik_des":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_wmik_gpmg_des":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ukf_wmik_gmg_des":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "RE_mhq":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "re_lav25":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "RE_LAV35":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV35",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		

		case "RE_landrover6x6_BAF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "RE_landrover_BAF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Landrover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Chenowth":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dune Buggy",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Chenowth_BAF_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dune Buggy",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Chenowth_BAF_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Dune Buggy",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "BRDM2IMPPolicePatrol_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2IMPPolice_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2IMPM240_PMCwest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2IMPHQ_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2IMPHQcomm_PMCWest":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2IMPm134":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "PRACS_FV107":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"FV107",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "PRACS_FV101":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"FV101",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};


		case "ArmoredSUV_PMC":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M2":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV 50",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "HMMWV_Armored":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV M240",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "HMMWV_MK19":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV Mk19",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "HMMWV_TOW":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV TOW",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "HMMWV_Avenger":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_Avenger",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "AAV":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"AAV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "LAV25_HQ":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "LAV25":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		

		 case "EB_AAV_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"AAV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "EB_AAV_FT":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"AAV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "EB_AAV_FT_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"AAV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "EB_LAV25_HQ_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "EB_LAV25_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LAV25",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "M1A1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1A1",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "M1A2_TUSK_MG":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1A2_TUSK_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};	
		case "MtvrReammo":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrReammo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrRefuel":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrRefuel",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrRepair":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrRepair",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "UAZ_MG_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "UAZ_MG_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "UAZ_AGS30_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_AGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "UAZ_AGS30_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_AGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "UAZ_AGS30_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_AGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};	
		 case "UAZ_SPG9_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_SPG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Pickup_PK_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Offroad_DSHKM_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "Offroad_DSHKM_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Offroad_SPG9_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GAZ_Vodnik_MedEvac":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vodnik",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GAZ_Vodnik":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vodnik",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GAZ_Vodnik_HMG":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Vodnik",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BRDM2_HQ_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BRDM2_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BRDM2_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		 case "BRDM2_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BRDM2_ATGM_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BRDM2_ATGM_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BTR90_HQ":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BTR90",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BTR90":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BTR90",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_Ambul_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_Ambul_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_HQ_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_HQ_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP2_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "BMP3":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP3",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T34":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T34",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T72_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T72_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T72_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T72_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "T90":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T90",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Ural_ZU23_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ural_ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Ural_ZU23_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ural_ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "Ural_ZU23_Gue":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ural_ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "ZSU_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Shilka",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "ZSU_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Shilka",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "2S6M_Tunguska":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Tunguska",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GRAD_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"GRAD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GRAD_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"GRAD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		 case "GRAD_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"GRAD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};		
		case "KamazReammo":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"KamazReammo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "KamazRefuel":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"KamazRefuel",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "KamazRepair":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"KamazRepair",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		case "M1A1_US_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1A1",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1A2_US_TUSK_MG_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M1A2_TUSK",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MLRS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M270_MLRS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MLRS_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M270_MLRS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M2A2_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M2A2_Bradley",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M2A3_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M2A3_ERA_Bradley ",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M6_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M6_Linebacker",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M2A3_WH":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M2A3_Bradley",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "EB_M3A1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M3A1_ERA_Bradley ",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1135_ATGMV_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_TOW",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1130_CV_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_CV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1126_ICV_M2_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_ICV_M2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1129_MC_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_MC",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1126_ICV_mk19_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_ICV_Mk19",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1128_MGS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_MGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_MK19_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_MK19",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_TOW_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_TOW",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M1151_M2_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_M2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M998_crows_M2_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_M2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M998_crows_MK2_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_M2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M998_crows_MK19_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_M998_crows_MK19",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_Avenger_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_Avenger",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M998A2_SOV_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_M998A2_SOV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_Terminal_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_Terminal",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_Ambulance_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_Ambulance",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M1035_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV_Utility",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Kamaz":
		{
			_unit = [_x,2,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "KamazOpen":
		{
			_unit = [_x,2,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
/*
		 case "AAVAmbul":
		{
			_unit = [_x,1,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
*/
		case "MTVR":
		{
			_unit = [_x,2,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "MTVR_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MTVR",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrReammo_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrReammo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrRefuel_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrRefuel",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrRepair_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrRepair",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MtvrSupply_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"MtvrSupply",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_CZ_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_Special_CZ_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover_Special",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BMP2_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BMP2_HQ_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2_HQ",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2_ATGM_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2_ATGM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BTR60_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BTR60",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};case "M113_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M113",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T34_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T34",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T55_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T55",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T72_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ZSU_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ZSU",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "GRAD_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BM21-GRAD",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_MG_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_SPG9_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover_SPG9",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "TT650_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"TT650",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UAZ_Unarmed_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UAZ_AGS30_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_AGS301",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UAZ_MG_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UAZ_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Ural_ZU23_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ural_ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "V3S_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"V3S",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "V3S_Open_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"V3S",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UralReammo_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UralReammo",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UralRefuel_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UralRefuel",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "UralRepair_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UralRepair",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BTR40_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BTR40",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BTR40_MG_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BTR40_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_MG_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover_MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_SPG9_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover_SPG9",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_FV510_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_FV510_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Warrior",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Jackal2_L2A1_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"L2A1_Jackal",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Jackal2_GMG_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal2_GMG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Jackal2_GMG_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Jackal2_L2A1_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal2_L2A1",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Jackal2_L2A1_2_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Jackal2_L2A1",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M113_UN_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M113",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
/*
		case "RHIB2Turret":
		{
			_unit = [_x,2,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "RHIB":
		{
			_unit = [_x,2,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "Zodiac":
		{
			_unit = [_x,1,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "PBX":
		{
			_unit = [_x,1,600] spawn {[_this select 0,_this select 1,_this select 2] call BIS_EVO_VecRm};
		};
		case "UH60M_MEV_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"UH60M_MEV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1133_MEV_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stryker_MEV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M113Ambul_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M113Ambulance",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ATV_US_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ATV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Offroad_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_Offroad_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Offroad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_ATV_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ATV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ArmoredSUV_PMC":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SUV_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Old_bike_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Old_bike",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SUV_UN_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SUV_PMC_BAF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"SUV",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1030_US_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Motorcycle",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
*/
		case "M2HD_mini_TriPod":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M2StaticMG":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHKM_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHkM_Mini_TriPod_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHKM_Ins":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHkM_Mini_TriPod":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHKM_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHkM_Mini_TriPod_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "KORD_high_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "KORD_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "KORD":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_GMG_Tripod_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_GPMG_Minitripod_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_L2A1_Minitripod_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_L2A1_Tripod_D":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_GMG_Tripod_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_GPMG_Minitripod_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_L2A1_Minitripod_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BAF_L2A1_Tripod_W":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "MK19_TriPod":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_Ins":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M252":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M252_US_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M252_Mortar",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SPG9_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SPG9_Ins":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "SPG9_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Metis_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Metis":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "TOW_TriPod":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Stinger_Pod":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Stinger_Pod_US_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Stinger_Pod",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Igla_AA_pod_East":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Igla_AA_pod_TK_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Static Weapon",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M119_US_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M119",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M119":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"M119",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "D30_RU":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"D30",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "D30_Ins":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"D30",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "D30_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"D30",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ZU23":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ZU23_CDF":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ZU23_INS":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "ZU23_TK_INS_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"ZU23",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
//adding ACR CZ vecs

		case "BMP2_Des_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2_Desert_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BMP2_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BMP2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "BRDM2_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"BRDM2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T72_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T72 MBT",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1114_AGS_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV AGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "M1114_DSK_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV DSK",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_M1151_M2_CZ_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"HMMWV M2",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "LandRover_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"LandRover",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "RM70_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"RM70 Grad",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810A_Des_MG_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T810 Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810_Open_Des_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T810 Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T810 Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810A_MG_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T810 Truck MG",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810_Open_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"T810 Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Octavia_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Octavia Car",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "AGS_CZ_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"AGS",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "DSHKM_CZ_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"DSHKM",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "2b14_82mm_CZ_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Mortar",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "Rbs70_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"RBS-70",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810Reammo_Des_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ammo Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810Reammo_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ammo Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810Refuel_Des_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Fuel Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810Refuel_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Fuel Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "t810_repair":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Repair Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "T810Repair_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Repair Truck",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
		case "HMMWV_Ambulance_CZ_DES_EP1":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ambulance",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
/*
		case "LandRover_Ambulance_Des_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ambulance",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};
*/
		case "LandRover_Ambulance_ACR":
		{
			if(Param1 == 7) then {deletevehicle _x} else {
			_unit = [_x,_type,"Ambulance",position _x] spawn {[_this select 0,_this select 1,_this select 2,_this select 3] call BIS_EVO_VecR};
			};
		};

		default
		{
		};
	};
	if(not (_x isKindOf "air") and _x in list cull) then {deletevehicle _x};
	
} forEach list BIS_EVO_ALL;
deletevehicle BIS_EVO_ALL;


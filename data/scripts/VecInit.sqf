_unit = _this select 0;
_vec = _this select 1;
_Vehicle = typeOf _vec;
_rank1 = rank1;
_rank2 = rank1;
_rank3 = rank1;
_rank4 = rank1;
_rank5 = rank1;
_rank6 = rank1;
_dunit = _unit;
_warning = 0;
if (not (local _unit)) exitwith {};


EVO_Eject = 
{
	_unit = _this select 0;
	_unit action ["ENGINEOFF", _vec];
	_unit action ["Eject",_vec];
	sleep 1;
	_unit action ["Eject",_vec];
	_vec setVelocity [0, 0, 0];
};


if (getdammage _vec == 0) then
{
	_vec setdammage 0.01;
};
if (not (isPlayer _unit)) then
{
	_dunit = (leader _unit);
};
switch (_Vehicle) do
{
	    case "HMMWV_Armored":
	    {	    
	   	 if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "HMMWV_M2":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "HMMWV_TOW":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "HMMWV_MK19":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };   
	    case "HMMWV_Avenger":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Truck5tMG":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "AAV":
	    {
		if (score _dunit < _rank3) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "LAV25_HQ":
	    {
		if (score _dunit < _rank2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "LAV25":
	    {
		if (score _dunit < _rank3) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
  	    case "M119":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "M1A1":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "M1A2_TUSK_MG":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "MH60S":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    }; 
	    case "UH1Y":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "MV22":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    }; 
	    case "AH1Z":
	    {
		if (score _dunit < _rank3) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AH64D_Sidewinders":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AH64D":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AV8B":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "AV8B2":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    }; 
	    case "F35B":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };    
	    case "A10":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "C130J":
	    {
		if (score _dunit < 300) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	    
	    case "UAZ_CDF":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_MG_CDF":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_MG_INS":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_AGS30_RU":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_AGS30_CDF":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "UAZ_SPG9_INS":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Pickup_PK_INS":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Offroad_DSHKM_INS":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "Offroad_SPG9_Gue":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };    
	    case "GAZ_Vodnik":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "GAZ_Vodnik_MedEvac":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "GAZ_Vodnik_HMG":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_INS":
	    {
		if (score _dunit < _rank1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BRDM2_ATGM_INS":
	    {
		if (score _dunit < _rank1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BTR90":
	    {
		if (score _dunit < _rank3) then {[_dunit,_rank3] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "BMP2_INS":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "BMP3":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
  	    case "D30_CDF":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_INS":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T72_RU":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "T90":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "2S6M_Tunguska":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "GRAD_CDF":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "GRAD_INS":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Ural_ZU23_CDF":
	    {
		if (score _dunit < _rank2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Ural_ZU23_INS":
	    {
		if (score _dunit < _rank2) then {[_dunit,_rank2] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "ZSU_CDF":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "ZSU_INS":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };  
	    case "Mi17_Ins":
	    {
		if (score _dunit < _rank0) then {[_dunit,_rank0] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi17_rockets_RU":
	    {
		if (score _dunit < _rank1) then {[_dunit,_rank1] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	    };
	    case "Mi24_P":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Mi24_D":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Mi24_V":
	    {
		if (score _dunit < _rank4) then {[_dunit,_rank4] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Ka52":
	    {
		if (score _dunit < _rank5) then {[_dunit,_rank5] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "CMA_Mi28_RUS":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Su34":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Su34B":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };
	    case "Su25_CDF":
	    {
		if (score _dunit < _rank6) then {[_dunit,_rank6] call BIS_EVO_RankReq;[_unit] call BIS_EVO_Eject};
	if(_unit == player) then {wcam = _vec addaction ["Weapon Camera On", "actions\wepcam.sqf",0,1, false, true,"test2"]};
	    };	    
    case "BMP2Ambul":
    {
	if (score _dunit < 1000) then {_handle = [_dunit,_rank3] execVM "data\scripts\req.sqf";[_unit] call EVO_Eject};
    };
    case "MtvrRepair":
    {
    	if (player isKindOf "USMC_SoldierS_Engineer") then
    	{    
		if(not (isNull ltrk)) then
		{
			ltrk removeaction elock;
			ltrk lock false;
		};
		//if(ltrk != _vec) then {elock = _vec addaction ["Lock Truck", "data\scripts\englock.sqf",0,1, false, true,"test2"];ltrk = _vec};
		elock = _vec addaction ["Lock Truck", "data\scripts\englock.sqf",0,1, false, true,"test2"];ltrk = _vec
    	};
    };
    case "KamazRepair":
    {
    	if (player isKindOf "USMC_SoldierS_Engineer") then
    	{
    	if(not (isNull ltrk)) then
    	{
    		ltrk removeaction elock;
    		ltrk lock false;
    	};
    	if(ltrk != _vec) then {elock = _vec addaction ["Lock Truck", "data\scripts\englock.sqf",0,1, false, true,"test2"];ltrk = _vec};
    	};
     };
};
if(_unit != player) exitWith {};
if(_vec isKindOf "Air") then
{
	if(_Vehicle == "AV8B") then 
	{
		_fireb = _vec addEventHandler["Fired",{if ((_this select 2) == "BombLauncher") then {trkbmb = [(_this select 0)] execVM "data\scripts\Trkbmb.sqf"}}];
	};
setViewDistance avdist;
};

Waituntil {player != driver _vec};
_vec removeaction wcam;
_vec removealleventhandlers "Fired";
setViewDistance vdist;

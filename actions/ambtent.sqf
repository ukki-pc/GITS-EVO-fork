//ambtent famb ambnest_pos _amb_name actions\removeamb

// by Xeno
//private ["_posamb","_amb_name","_marker1"];
private ["_posamb","_amb_name","_markerLUP"];

_amb = objNull;

if (inrepairzone) exitWith {hint "You cannot deploy a Recon HQ in the base"};
_name = format ["%1amb",player];


//Check if RHQ:s marker exists
if !(getMarkerColor _name == "") exitWith 
	{
		hint "You have already established a Recon HQ. You must destroy/remove it to make a new one"
	};

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};

if (!(alive player)) exitWith 
	{
		amb_pos = [];
	};
	
_amb = egg_evo_Amb createVehicle (getposASL player);
_amb setVariable ["RHQ",true,true];
//if(egg_evo_Amb == EGG_EVO_allAmbs select 3) then {_amb setFuelCargo 1; _amb setAmmoCargo 1; _amb setRepairCargo 1;};
_dir  = getdir player;
_amb setdir _dir;
amb_pos = position _amb;



//rksl_foxhound_lppv
//"HMMWV_Ambulance"
//"LAV25_HQ"
//HMMWV_M1151_M2_DES_EP1

_amb_name = "EB_BRDM2_HQ_TK";


_amb addAction ["Remove Recon HQ", "actions\removeamb.sqf",_amb,1,false,true];

player moveInDriver _amb;
_ambmarker = [player,_amb] execVM "data\scripts\ambmarker.sqf";
if (true) exitWith {};

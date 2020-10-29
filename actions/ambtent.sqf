//ambtent famb ambnest_pos _amb_name actions\removeamb

// by Xeno
//private ["_posamb","_amb_name","_marker1"];
private ["_posamb","_amb_name","_markerLUP"];

if (player in list AirportIn) exitWith {hint "You cannot deploy a Recon HQ in the base"};

if (alive amb) exitWith 
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

amb = (egg_evo_westAmb select 0) createVehicle (position player);
_dir  = getdir player;
amb setdir _dir;
amb_pos = position amb;


publicVariable "amb";

//rksl_foxhound_lppv
//"HMMWV_Ambulance"
//"LAV25_HQ"
//HMMWV_M1151_M2_DES_EP1

_amb_name = "HMMWV_M1151_M2_DES_EP1";

amb addAction ["Remove Recon HQ", "actions\removeamb.sqf",0,1,false,true];
player moveInDriver amb;

if (true) exitWith {};

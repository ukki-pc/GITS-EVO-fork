// Arma 2 function

private ["_Vehicle","_UseType","_DoGet","_VehicleTypes","_Result"];

_Vehicle = _this select 0;
_UseType = _this select 1;

_DoGet = false;
if ( (count _this) >= 3 ) then { _DoGet = _this select 2; }; 

switch (_UseType) do {

	case "FuelSP":				{ _VehicleTypes = ["MtvrRefuel","UralRefuel_Base","KamazRefuel","V3S_Refuel_TK_GUE_EP1"]; };
	case "AmmoSP":				{ _VehicleTypes = ["MtvrReammo","UralReammo_Base","KamazReammo","V3S_Reammo_TK_GUE_EP1","ReammoBox"]; };
	case "RepairSP":			{ _VehicleTypes = ["MtvrRepair","UralRepair_Base","KamazRepair","V3S_Repair_TK_GUE_EP1"]; };
	
	case "TrackedAPC":			{ _VehicleTypes = ["Tracked_APC","M2A2_Base","BAF_FV510_D","M113_UN_EP1",
	                                               "M113_TK_EP1","I44_HT_G_SdKfz251_1D"]; };
	                                        
	case "Truck":				{ _VehicleTypes = ["MTVR","Ural_Base","Kamaz_Base","V3S_Base_EP1","V3S_Civ"]; };
	case "AAGun":				{ _VehicleTypes = ["ZU23_base","I44_GunAA_G_Flak38"]; };
	case "SPArt":				{ _VehicleTypes = ["vil_2s1","vil_m109_sph"]; };
	case "RocketArt":			{ _VehicleTypes = ["MLRS","GRAD_Base"]; };
	case "StaticArtGun":  		{ _VehicleTypes = ["M119","D30_Base"]; };
		
	case "MechRecon":			{ _VehicleTypes = ["BRDM2_Base","GAZ_Vodnik_HMG","M1130_CV_EP1","LAV25_HQ",
	                                               "BTR90_HQ","BMP2_HQ_Base"]; };
	
	case "ATRocketMotorRecon":	{ _VehicleTypes = ["HMMWV_TOW","UAZ_SPG9_Base","Offroad_SPG9_base",
	                                               "LandRover_SPG9_Base_EP1","Offroad_SPG9_Gue"]; };
	                                                 
	case "StaticMortar":		{ _VehicleTypes = ["StaticMortar","2b14_82mm_CDF"]; };
	
	case "Ambulance":			{ _VehicleTypes = ["HMMWV_Ambulance","BMP2_Ambul_Base","M113Ambul_Base",
												   "GAZ_Vodnik_MedEvac","M1133_MEV_EP1"]; };

	case "MotorVehicle":		{ _VehicleTypes = ["Car","Tank","Motorcycle","Air","Ship"]; };
	
	case "AllVehicles":			{ _VehicleTypes = ["LandVehicle","Air","Ship"]; };
	 

	default { _VehicleTypes = []; };
};

if ( _DoGet ) then {
	_Result = _VehicleTypes;
} else {
	_Result = (([_VehicleTypes, [_Vehicle]] call F_CountObjectsOfTypes) >= 1);
};

_Result;
private ["_blueicons","_redicons","_greenicons","_EmjwMarkers",
         "_maxsizebattalion","_MaxSizeRegiment","_maxsizebrigade","_vs","_ui","_unit","_vehicle","_NumSupport",
         "_cInf","_cMotInf","_TankIndex","_cMechInf","_cMaint",
         "_cMed","_cSupport","_cArt","_cHeli","_cPlane",
         "_cHQ","_cUAV","_cRecon","_cMortar","_cRecon","_cService",
         "_cAA","_cAACannon","_cAAMissile","_cAmmo","_cAT",
         "_cATCannon","_cATRocket","_cEngineers","_cFuel","_cMissile",
         "_cMP","_cRocketArt","_cSPArt","_cHMechInf","_cTransport",
         "_cArmoredRecon","_cMechRecon","_cMotorRecon","_cMotorAA","_cSPAA",
         "_cGrenadeLauncher","_cMachineGun","_cWhArmInf",
         "_NumAmbulances","_NumRepair","_NumRefuel","_NumReammo",
         "_TrackedAPCs","_Transports","_AAGunType","_SPArtTypes","_RocketArtTypes","_MechReconTypes",
         "_cATRocketMotorRecon","_StaticMortarTypes","_StaticArtTypes",
         "_AmbulanceTypes","_RepairTypes","_RefuelTypes","_ReammoTypes",
         "_UnknownIconColour","_BlueIconColour","_RedIconColour","_GreenIconColour","_NoUnitsIconColour"];


_TrackedAPCs = [objNull, "TrackedAPC", false] call F_VehicleOfUseType;
_Transports = [objNull, "Truck", false] call F_VehicleOfUseType;
_AAGunType = [objNull, "AAGun", false] call F_VehicleOfUseType;
_SPArtTypes = [objNull, "SPArt", false] call F_VehicleOfUseType;
_RocketArtTypes = [objNull, "RocketArt", false] call F_VehicleOfUseType;
_MechReconTypes = [objNull, "MechRecon", false] call F_VehicleOfUseType;
_cATRocketMotorRecon = [objNull, "ATRocketMotorRecon", false] call F_VehicleOfUseType;
_StaticMortarTypes = [objNull, "StaticMortar", false] call F_VehicleOfUseType;
_StaticArtTypes = [objNull, "StaticArtGun", false] call F_VehicleOfUseType;
_AmbulanceTypes = [objNull, "Ambulance", false] call F_VehicleOfUseType;

_RefuelTypes = [objNull, "FuelSP", false] call F_VehicleOfUseType;
_RepairTypes = [objNull, "RepairSP", false] call F_VehicleOfUseType;
_ReammoTypes = [objNull, "AmmoSP", false] call F_VehicleOfUseType;

_cInf = 0;
_cMotInf = 1;
_cTank = 2;
_cMechInf = 3;
_cMaint = 4;
_cMed = 5;
_cSupport = 6;
_cArt = 7;
_cHeli = 8;
_cPlane = 9;
_cHQ = 10;
_cUAV = 11;
_cRecon = 12;
_cMortar = 13;
_cService = 14;

_cAA = 15;
_cAACannon = 16;
_cAAMissile = 17;
_cAmmo = 18;
_cAT = 19;
_cATCannon = 20;
_cATRocket = 21;
_cEngineers = 22;
_cFuel = 23;
_cMissile = 24;
_cMP = 25;
_cRocketArt = 26;
_cSPArt = 27;
_cHMechInf = 28;
_cTransport = 29;
_cArmoredRecon = 30;
_cMechRecon = 31;
_cMotorRecon = 32;
_cMotorAA = 33;
_cSPAA = 34;
_cGrenadeLauncher = 35;
_cMachineGun = 36;
_cWhArmInf = 37;
_cEmpty = 38;

_EmjwMarkers = (isClass (configFile >> "CfgPatches"  >> "mjw_markers")) 
               and (isClass (configFile >> "CfgPatches"  >> "mjw_markers2"));

//_EmjwMarkers = false;
if ( _EmjwMarkers ) then {

	_blueicons = ["b_inf","b_motor_inf","b_armor","b_mech_inf","b_maint",
	              "b_med","b_support","b_art","b_air","b_plane",
	              "b_hq","b_uav","b_recon","b_mortar","b_service",
	              "mjw_b_aa","mjw_b_aa_cannon","mjw_b_aa_missile","mjw_b_ammo","mjw_b_at",
	              "mjw_b_at_cannon","mjw_b_at_rocket","mjw_b_engineers","mjw_b_fuel","mjw_b_missile",
	              "mjw_b_mp","mjw_b_rocket_art","mjw_b_sp_art","mjw_b_t_mech_inf","mjw_b_transport",
	              "mjw_b_armored_recon","mjw_b_mech_recon","mjw_b_motor_recon","mjw_b_motor_aa","mjw_b_sp_aa",
	              "mjw_b_grenadelauncher","mjw_b_machinegun","mjw_b_w_mech_inf","b_empty"];
	              
	_redicons = ["o_inf","o_motor_inf","o_armor","o_mech_inf","o_maint",
	             "o_med","o_support","o_art","o_air","o_plane",
	             "o_hq","o_uav","o_recon","o_mortar","o_service",
	             "mjw_o_aa","mjw_o_aa_cannon","mjw_o_aa_missile","mjw_o_ammo","mjw_o_at",
	             "mjw_o_at_cannon","mjw_o_at_rocket","mjw_o_engineers","mjw_o_fuel","mjw_o_missile",
	             "mjw_o_mp","mjw_o_rocket_art","mjw_o_sp_art","mjw_o_t_mech_inf","mjw_o_transport",
	             "mjw_o_armored_recon","mjw_o_mech_recon","mjw_o_motor_recon","mjw_o_motor_aa","mjw_o_sp_aa",
	             "mjw_o_grenadelauncher","mjw_o_machinegun","mjw_o_w_mech_inf","o_empty"];
	             
	_greenicons = ["n_inf","n_motor_inf","n_armor","n_mech_inf","n_maint",
	               "n_med","n_support","n_art","n_air","n_plane",
	               "n_hq","n_uav","n_recon","n_mortar","n_service",
	               "mjw_n_aa","mjw_n_aa_cannon","mjw_n_aa_missile","mjw_n_ammo","mjw_n_at",
	               "mjw_n_at_cannon","mjw_n_at_rocket","mjw_n_engineers","mjw_n_fuel","mjw_n_missile",
	               "mjw_n_mp","mjw_n_rocket_art","mjw_n_sp_art","mjw_n_t_mech_inf","mjw_n_transport",
	               "mjw_n_armored_recon","mjw_n_mech_recon","mjw_n_motor_recon","mjw_n_motor_aa","mjw_n_sp_aa",
	               "mjw_n_grenadelauncher","mjw_n_machinegun","mjw_n_w_mech_inf","n_empty"];
} else {

	_blueicons = ["b_inf","b_motor_inf","b_armor","b_mech_inf","b_maint",
	              "b_med","b_support","b_art","b_air","b_plane",
	              "b_hq","b_uav","b_recon","b_mortar","b_service",
	              "b_unknown","b_unknown","b_unknown","b_support","b_unknown",
	              "b_unknown","b_unknown","b_unknown","b_support","b_unknown",
	              "b_unknown","b_art","b_art","b_mech_inf","b_motor_inf",
	              "b_motor_inf","b_mech_inf","b_motor_inf","b_motor_inf","b_armor",
	              "b_inf","b_inf","b_mech_inf","b_empty"];
	              
	_redicons = ["o_inf","o_motor_inf","o_armor","o_mech_inf","o_maint",
	             "o_med","o_support","o_art","o_air","o_plane",
	             "o_hq","o_uav","o_recon","o_mortar","o_service",
	             "o_unknown","o_unknown","o_unknown","o_support","o_unknown",
	             "o_unknown","o_unknown","o_unknown","o_support","o_unknown",
	             "o_unknown","o_art","o_art","o_mech_inf","o_motor_inf",
	             "o_motor_inf","o_mech_inf","o_motor_inf","o_motor_inf","o_armor",
	             "o_inf","o_inf","o_mech_inf","o_empty"];
	             
	_greenicons = ["n_inf","n_motor_inf","n_armor","n_mech_inf","n_maint",
	               "n_med","n_support","n_art","n_air","n_plane",
	               "n_hq","n_uav","n_recon","n_mortar","n_service",
	               "n_unknown","n_unknown","n_unknown","n_support","n_unknown",
	               "n_unknown","n_unknown","n_unknown","n_support","n_unknown",
	               "n_unknown","n_art","n_art","n_mech_inf","n_motor_inf",
	               "n_motor_inf","n_mech_inf","n_motor_inf","n_motor_inf","n_armor",
	               "n_inf","n_inf","n_mech_inf","n_empty"];
};

_UnknownIconColour = [1,1,0,1];
_BlueIconColour = [0,0,1,1];
_RedIconColour = [1,0,0,1];
_GreenIconColour = [0,0.698039,0,1];
_NoUnitsIconColour = [0,0,0,1];
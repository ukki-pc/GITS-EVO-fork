// by Xeno
private ["_amb_name"];

if (vehicle player == amb) exitWith 
	{
		hint "You have to get out of the Recon HQ before you can remove it."
	};

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!(alive player)) exitWith {};
deleteVehicle amb;
amb_pos = [];

if (true) exitWith {};
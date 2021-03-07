// by Xeno
private ["_amb_name"];

if (vehicle player == amb) exitWith 
	{
		hint "You have to get out of the Recon HQ before you can remove it."
	};
_amb = _this select 3;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!(alive player)) exitWith {};
deleteVehicle _amb;
amb_pos = [];

_name = format ["%1amb",player];



deleteMarker _name;

if (true) exitWith {};
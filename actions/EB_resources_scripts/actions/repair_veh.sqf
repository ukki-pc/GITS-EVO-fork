/*
CIVILIAN FACTION SIMPLE VEHICLE REPAIR SCRIPT - by Demonized & app0815

put this in the init line of the vehicles which are to be repairable:
_id = this addAction ["Repair", "scripts\repair.sqf", [], 1, false, true, "", "(getDammage _target) < 1 AND (getDammage _target) > 0 AND (side _this) == civilian AND (vehicle _this) == _this"];

in conjuction with the vehicle respawn script I'm using it looks like this (the "_id= this add..." code is twice in here. once for the current vehicle placed in the editor and once for the same respawning vehicle):
veh = [this, 100, 0, 0, false, false, "_id = this addAction [""Repair"", ""scripts\repair.sqf"", [], 1, false, true, """", ""(getDammage _target) < 1 AND (getDammage _target) > 0 AND (side _this) == civilian AND (vehicle _this) == _this""];"] execVM "scripts\vehicle.sqf"; _id = this addAction ["Repair", "scripts\repair.sqf", [], 1, false, true, "", "(getDammage _target) < 1 AND (getDammage _target) > 0 AND (side _this) == civilian AND (vehicle _this) == _this"];

*/

_vehicle = _this select 0;		// this is the vehicle.
_playerUnit = player;		// this is the repairing player.

[] call rmvAcRp;

//_repStrength = (_this select 3) select 2;

//systemChat format ["1: %1, 2: %2 3: %3",_vehicle,_playerUnit,_repStrength];
//_curDmg = getDammage _vehicle;
 // Disables the repair so player cannot it spam

_playerUnit playMove "AinvPknlMstpSlayWrflDnon_medic";		// here the player starts the repair animation.
sleep 4;
if(vehicle player != player) exitWith {hint "Repair interrupted."};
_vehicle setDammage (getDammage _vehicle)-0.3;	// here we reset the damage of the vehicle to 0.
hint "Vehicle repaired!";



//_vehicle setFuel 1;	// here we fill up the fuel tank. (uncomment this if you want to refuel the vehicle as well)

// this is a sqf script so it will exit here on its own, no need to end it.
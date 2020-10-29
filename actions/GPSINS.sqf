//called from spawn.sqf for sniper class to get a GPS/INS marker
//_gpsd = createDialog 'glt_airgpsmfd';


if NOT ( (("Laserdesignator") in (weapons player)) OR (("Binocular_Vector") in (weapons player)) OR(("LRTV_ACR") in (weapons player)) OR (("R3F_JIM_LR") in (weapons player)) ) exitWith {hint "You cannot use the GPS Target System without a Laser Target Spotter"};

_gpsd = createDialog 'glt_airgpsmfd';

exit

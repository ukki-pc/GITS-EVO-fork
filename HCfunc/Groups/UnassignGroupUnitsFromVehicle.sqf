// Arma 2 function

private ["_Group","_Units","_NumUnits","_ui","_Pos"];

_Group = _this;

_Units = units _Group;
_NumUnits = count _Units;

for [{ _ui = 0 }, { _ui < _NumUnits }, { _ui = _ui + 1 }] do {

	unassignVehicle (_Units select _ui); 
};

// allowGetIn does not stop units getting back in always!
//_Units allowGetIn false;
//_Units doMove (position (leader _Group));
//_Group move (position (leader _Group));

nil;
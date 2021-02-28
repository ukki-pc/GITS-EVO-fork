// Arma 2 function

private ["_DeleteEnemyMarkers","_NumEnemyMarkers","_mi"];

/*
_DeleteEnemyMarkers = + (missionNamespace getVariable "HCExtEnemyMarkers");
_NumEnemyMarkers = count _DeleteEnemyMarkers;

for [{ _mi = 0 }, { _mi < _NumEnemyMarkers }, { _mi = _mi + 1 }] do {
	
	deleteMarkerLocal (_DeleteEnemyMarkers select _mi);
};

missionNamespace setVariable ["HCExtEnemyMarkers", []];

hintSilent format ["Markers Deleted = %1\n_DeleteEnemyMarkers = %2", 
                   _NumEnemyMarkers, _DeleteEnemyMarkers];
*/

/*
for [{ _mi = 0 }, { _mi < 1000 }, { _mi = _mi + 1 }] do {
	
	deleteMarkerLocal (format ["HCExtEnemyMarker%1", _mi]);
};
*/

for [{ _mi = 0 }, { _mi < 1000 }, { _mi = _mi + 1 }] do {
	
	(format ["HCExtEnemyMarker%1", _mi]) setMarkerAlphaLocal 0;
};


nil;
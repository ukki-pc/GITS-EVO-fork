// Arma 2 function

private ["_selgpgs","_ngps","_gpi","_nunits","_nwalk","_damaged","_invehicle","_crew","_incargo","_assignedcargo",
         "_assignedvehicle","_nfreecargo","_numvehicles","_groupsvehicles","_gubits","_gcount","_gpui","_nunits","_unit",
         "_Vehicle","_unitsinvehicle","_nuiv","_ncrewinvehicle","_nincargo","_uivi","_nvassignedcargo",
         "_wheeled","_tracked","_helicopter","_plane","_ships","_str","_vi","_CargoCapacity","_TotalCapacity"];

_selgpgs = + _this;

_ngps = count _selgpgs;
_nunits = 0;
_nwalk = 0;
_damaged = 0;
_invehicle = 0;
_crew = 0;
_incargo = 0;
_assignedcargo = 0;
_assignedvehicle = 0;
_nfreecargo = 0;
_numvehicles = 0;
_groupsvehicles = [];
_SelGroupsUnits = [];

for [{ _gpi = 0 }, { _gpi < _ngps }, { _gpi = _gpi + 1 }] do {

	_gubits = units (_selgpgs select _gpi);
	_gcount = count _gubits;
	_SelGroupsUnits = _SelGroupsUnits + _gubits;
	
	for [{ _gpui = 0 }, { _gpui < _gcount }, { _gpui = _gpui + 1 }] do {

		_nunits = _nunits + 1;
		_unit = _gubits select _gpui;
		if ((damage _unit)>=0.2 ) then {_damaged = _damaged + 1;};
		if (canStand _unit) then {_nwalk = _nwalk + 1;};
		_Vehicle = vehicle _unit;
		if (_Vehicle != _unit) then {_invehicle = _invehicle + 1;};
		if ( (count (assignedVehicleRole _Vehicle)) >= 1 ) then {_assignedvehicle = _assignedvehicle + 1; };
		if ( (_Vehicle != _unit) && (! (_Vehicle in _groupsvehicles)) ) then { _groupsvehicles = _groupsvehicles + [_Vehicle]; };
	};
};

_numvehicles = count _groupsvehicles;

for [{ _vi = 0 }, { _vi < _numvehicles }, { _vi = _vi + 1 }] do {

    _Vehicle = _groupsvehicles select _vi;
	_unitsinvehicle = crew _Vehicle;
	_nuiv = count _unitsinvehicle;
	_ncrewinvehicle = 0;
	_nincargo = 0;
    
    for [{ _uivi = 0 }, { _uivi < _nuiv }, { _uivi = _uivi + 1 }] do {

		_unit = _unitsinvehicle select _uivi;
		if ( ((assignedVehicleRole _unit) select 0) != "Cargo" ) then {
		
			_ncrewinvehicle = _ncrewinvehicle + 1;
			if (_unit in _SelGroupsUnits) then {
				_crew = _crew + 1;
			};
		} else {
			_nincargo = _nincargo + 1;
		};
	};

	_nvassignedcargo = count (assignedCargo _Vehicle);
	_assignedcargo = _assignedcargo + _nvassignedcargo;
	_nfreecargo = _nfreecargo + (_Vehicle emptyPositions "Cargo") - (_nvassignedcargo - _nincargo);
};

_incargo = _invehicle - _crew;
_CargoCapacity = _assignedcargo + _nfreecargo;
_TotalCapacity = _assignedcargo + _nfreecargo;

_wheeled = "Car" countType _groupsvehicles;
_tracked = "Tank" countType _groupsvehicles;
_helicopter = "Helicopter" countType _groupsvehicles;
_plane = "Plane" countType _groupsvehicles;
_ships = "Ship" countType _groupsvehicles;

_str = format ["Selected HC Groups:\nNo. Units: %1;\nNo. Units damaged >= 0.2: %2;\nNo. Units Can Walk: %3;\nNo. Units in Vehicles: %4;\nUnits on foot: %5;", 
               _nunits, _damaged, _nwalk, _invehicle, (_nunits - _invehicle)];
 
_str = _str + format ["\nNo. Crew: %1;\nIn Cargo: %2;\nNo. Assigned Cargo: %3;\nNo. Assigned vehicles: %4;\nNo. Unassigned vehicle: %5;", 
                      _crew, _incargo, _assignedcargo, _assignedvehicle, _nunits - _assignedvehicle];

_str = _str + format ["\nNo. Free Cargo: %1;\nTotal Cargo Capacity: %2;", 
                      _nfreecargo, _CargoCapacity];


_str = _str + format ["\nNo. Wheeled: %1;\nNo. Tracked: %2;\nNo. Helicopters: %3;\nNo. Planes: %4;\nNo. Ships: %5;", 
                      _wheeled, _tracked, _helicopter, _plane, _ships];

_str = _str + format ["\nNo. Vehicles: %1;\nGroups: %2", 
                      _numvehicles, _ngps];

hintSilent _str;
copyToClipboard _str;

nil;
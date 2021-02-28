// Arma 2 function

private ["_Objects","_Still","_OnGround","_NumObjects","_FilteredObjects",
         "_obi","_Object","_ObjectStill","_ObjectOnGround"];

_Objects = + (_this select 0);
_Still = _this select 1;
_OnGround = _this select 2;

_NumObjects = count _Objects;
_FilteredObjects = [];

for [{ _obi = 0 }, { _obi < _NumObjects }, { _obi = _obi + 1 }] do {
	
	_Object = _Objects select _obi;
	_ObjectStill = (speed _Object) <= 0.5;
	_ObjectOnGround = ((getPosATL _VehicleToSupply) select 2) <= 1.0;
		
	if (   ( (_Still and _ObjectStill) 
	      or (! (_Still or _ObjectStill)) )
	    and ( (_OnGround and _ObjectOnGround) 
	       or (! (_OnGround or _ObjectOnGround)) ) ) then {
		
		_FilteredObjects = _FilteredObjects + [_Object];
	};
};

_FilteredObjects;





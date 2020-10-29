_player = player;
_vehicle = cursorTarget;
_canSize = getNumber(configFile >> "cfgMagazines" >> "EB_ItemFuelcan" >> "fuelcapacity");
_nameVeh = configFile >> "cfgVehicles" >> TypeOf(_vehicle);

//develop for types
_capacity = 20;
_vtype = TypeOf vehicle _vehicle;
if (_vtype isKindOf "Helicopter") then {_capacity=200};
if (_vtype isKindOf "Plane") then {_capacity=200};
if (_vtype isKindOf "Ship") then {_capacity=40};
if (_vtype isKindOf "StaticWeapon") then {_capacity=0};
if (_vtype isKindOf "Car") then {_capacity=80};
if (_vtype isKindOf "Truck") then {_capacity=180};
if (_vtype isKindOf "Tank") then {_capacity=120};
if (_vtype isKindOf "Motorcycle") then {_capacity=40};

//
_nameType = getText(_nameVeh >> "displayName");
_curFuel = (fuel _vehicle * _capacity);
_newFuel = (_curFuel + _canSize);
if (_newFuel > _capacity) then {_newFuel = _capacity};
_newFuel = (_newFuel / _capacity);
_player removeMagazine "EB_ItemFuelcan";
_vehicle setfuel _newFuel;
_player addMagazine "EB_ItemFuelcanEmpty";
playsound "fill";
_player playActionNow "Medic";
hintsilent format ["Vehicle refueled %1 L",_canSize];
sleep 6;

//call fnc_usec_medic_removeActions;
//r_action = false;
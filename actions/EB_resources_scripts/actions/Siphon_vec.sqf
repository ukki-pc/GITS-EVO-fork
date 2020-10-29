_player = player;
_vehicle = cursorTarget;
_canSize = getNumber(configFile >> "cfgMagazines" >> "EB_ItemFuelcanEmpty" >> "fuelcapacity");
_nameVeh = configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_nameType = getText(_nameVeh >> "displayName");
_capacity = 100;
_curFuel = (fuel _vehicle * _capacity);
_newFuel = (_curFuel - _canSize);
_newFuel = (_newFuel / _capacity);

_player removeMagazine "EB_ItemFuelcanEmpty";
_vehicle setfuel _newFuel;
_player addMagazine "EB_ItemFuelcan";
playsound "siphon";
_player playActionNow "Medic";
hintsilent format ["Vehicle siphoned %1 L",_canSize];

sleep 6;

//call fnc_usec_medic_removeActions;
//r_action = false;

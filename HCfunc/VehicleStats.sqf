// Arma 2 function

private ["_SelGpgsTopLevel","_VehicleStatsType","_str","_selgpgs","_vehicles","_nvehicles","_vi",
         "_vehicle","_VehicleType","_FuelCapacity","_FuelCargo","_AmmoCargo","_RepairCargo",
         "_MaxSpeed","_HasDriver","_TransportSoldier","_SupplyRadius"];
         
_SelGpgsTopLevel = + (_this select 0);
_VehicleStatsType = _this select 1;

_str = format ["Vehicles (%1):", _VehicleStatsType];

_selgpgs = _SelGpgsTopLevel call F_GroupsAndSubGroupsHC;

_vehicles = _selgpgs call F_GetGroupsVehiclesIn;
_nvehicles = count _vehicles;

for [{ _vi = 0 }, { _vi < _nvehicles }, { _vi = _vi + 1 }] do {

	_vehicle = _vehicles select _vi;
	_VehicleType = typeOf _vehicle;
	
	if ( _VehicleStatsType == "Fuel" ) then {
	
		_str = _str + (format ["\n%1: %2;", _VehicleType, (fuel _vehicle)]);  
	};

	if ( _VehicleStatsType == "Damage" ) then {
	
		_str = _str + (format ["\n%1: %2;", _VehicleType, (damage _vehicle)]); 
	};

	if ( _VehicleStatsType == "FuelDetails" ) then {
		
		_FuelCapacity = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "fuelCapacity");
		_FuelCargo = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "transportFuel");
		_AmmoCargo = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "transportAmmo");
		_RepairCargo = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "transportRepair");
		_MaxSpeed = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "maxspeed");
		_HasDriver = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "hasdriver");
		_TransportSoldier = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "transportSoldier");
		_SupplyRadius = getNumber (configFile >> "CfgVehicles" >> _VehicleType >> "supplyradius");
		
		_str = _str + (format ["\n%1: Fuel: %2 Fuel Capacity: %3 Fuel Cargo: %4 Ammo Cargo: %5", 
		                       _VehicleType, (fuel _vehicle), _FuelCapacity, _FuelCargo, _AmmoCargo]);  

		_str = _str + (format [" Repair Cargo: %1 MaxSpeed: %2; HasDriver = %3 TransportSoldier = %4 SupplyRadius = %5", 
		                        _RepairCargo, _MaxSpeed, _HasDriver, _SupplyRadius]);  
	};
};

hintSilent _str;
copyToClipboard _str;

nil;

// Arma 2 function

private ["_TheVehicle","_HasDriver"];

_TheVehicle = _this;

_HasDriver = (_TheVehicle isKindOf  'Car') or (_TheVehicle isKindOf  'Motorcycle') 
          or (_TheVehicle isKindOf  'Tank') or (_TheVehicle isKindOf  'Air') 
          or (_TheVehicle isKindOf  'Ship');
          
_HasDriver = _HasDriver
          and (!((_TheVehicle isKindOf  'BuoySmall') or (_TheVehicle isKindOf  'BuoyBig') 
		         or (_TheVehicle isKindOf  'BigShip') or (_TheVehicle isKindOf  'UAV') 
		         or (_TheVehicle isKindOf  'ParachuteBase')
				));
          
_HasDriver;
//Eggbeast fuel actions - inspired by DayZ scripts by Rocket

if (not (local player)) exitwith {};

EB_player_fillfuel = 	-1;
EB_player_siphonfuel = -1;
EB_player_refuelAction = -1;
EB_myCursorTarget = objNull;
EB_myCursorTarget2 = objNull;

//hintsilent "monitor script active 2";

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	_player = player;
	_vehicle = vehicle _player;
	_inVehicle = (_vehicle != _player);
	_hasFuelE = "EB_ItemFuelcanEmpty" in (magazines _player);
	_hasFuel = "EB_ItemFuelcan" in (magazines _player);
	_hasSiphon = "EB_ItemSiphon" in (items _player);
	_equipped = (_hasFuelE or _hasfuel);
	//if (_hasSiphon) then {hintsilent "has siphon"};

	if ( (!isNull cursorTarget) and (!_inVehicle) and (_player distance cursorTarget < 5) and (_equipped) ) then 
	{	//Has some kind of target
		_isVehicle = cursorTarget isKindOf "AllVehicles";
		_isFuel = false;
		_isMan = cursorTarget isKindOf "Man";
		_isAlive = alive cursorTarget;
		_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
		//hintsilent format ["vec: %1", _text];

		if (_hasFuelE) then 
		{
			_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "Land_wagon_tanker") or (cursorTarget isKindOf "Land_A_FuelStation_Shed") or (cursorTarget isKindOf "Land_repair_center") or (cursorTarget isKindOf "FuelStation") or (cursorTarget isKindOf "FuelStation_army") or (cursorTarget isKindOf "Land_Mil_Repair_center_EP1") or (cursorTarget isKindOf "Land_A_FuelStation_Build") or (cursorTarget isKindOf "Land_A_FuelStation_Feed") or (cursorTarget isKindOf "Land_Ind_FuelStation_Feed_EP1") or (cursorTarget isKindOf "Land_Ind_FuelStation_Build_EP1") or (cursorTarget isKindOf "Land_Ind_FuelStation_Shed_EP1") or (cursorTarget isKindOf "Land_Ind_Garage01_EP1") or (cursorTarget isKindOf "Land_benzina_schnell") or (cursorTarget isKindOf "Land_fuelstation") or (cursorTarget isKindOf "Land_fuelstation_army") or (cursorTarget isKindOf "Land_ibr_FuelStation_Feed") or (cursorTarget isKindOf "Land_ibr_FuelStation_Build") or (cursorTarget isKindOf "Land_ibr_FuelStation_Shed") or (cursorTarget isKindOf "Barrel5") or (cursorTarget isKindOf "Barrels") or (cursorTarget isKindOf "Land_Ind_TankSmall2") or (cursorTarget isKindOf "CDF_WarfareBVehicleServicePoint") or (cursorTarget isKindOf "INS_WarfareBVehicleServicePoint") or (cursorTarget isKindOf "RU_WarfareBVehicleServicePoint") or (cursorTarget isKindOf "USMC_WarfareBVehicleServicePoint") or (cursorTarget isKindOf "KamazRefuel") or (cursorTarget isKindOf "KamazRepair") or (cursorTarget isKindOf "MtvrRefuel") or (cursorTarget isKindOf "MtvrRepair") or (cursorTarget isKindOf "UralRepair_CDF") or (cursorTarget isKindOf "UralRefuel_CDF") or (cursorTarget isKindOf "UralRepair_INS") or (cursorTarget isKindOf "UralRefuel_INS") or (cursorTarget isKindOf "MtvrRefuel_DES_EP1") or (cursorTarget isKindOf "MtvrRepair_DES_EP1") or (cursorTarget isKindOf "UralRefuel_TK_EP1") or (cursorTarget isKindOf "UralRepair_TK_EP1") or (cursorTarget isKindOf "V3S_Refuel_TK_GUE_EP1");

			//_isFuel = ( (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "MtvrRefuel") );
		};
		//if (_isfuel) then {hintsilent "fuel"};

///////##################################
//Allow player to fill Fuel can
///////##################################

		if ( (_hasFuelE) and (_isFuel) ) then 
		{
			if (EB_player_fillfuel < 0) then 
			{
				_fstring0 = format[Localize "str_action_refuel",_text];
				_ficon = "<img image='\ca\ui\data\ui_action_refuel_ca.paa' size='1.0' shadow='false' />";
				_fstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_ficon,_fstring0];
				EB_player_fillfuel = EB_myCursorTarget addAction [_fstring, "Actions\EB_resources_scripts\actions\Fuelcan_fill.sqf",[], 3, true, true,"",""];
			};
		} else 
		{
			_player removeAction EB_player_fillfuel;
			EB_player_fillfuel = -1;
		};
///////##################################
//Allow player to siphon Fuel: vehicle to fuelcan with siphon
///////##################################

		if( (_hasFuelE) and (_hasSiphon) and (_isVehicle) and (!_isMan) and (_isAlive)) then 
		{
			if (EB_player_siphonfuel < 0)then
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget = _vehicle;
				_fuel = fuel _vehicle;
				if (_fuel > 0) then
				{
					EB_myCursorTarget removeAction EB_player_siphonfuel;
					_nstring0 = format ["Siphon fuel from %1",_text];
					_nicon = "<img image='\ca\ui\data\ui_action_refuel_ca.paa' size='1.0' shadow='false' />";
					_nstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_nicon,_nstring0];
					EB_player_siphonfuel = EB_myCursorTarget addAction [_nstring, "Actions\EB_resources_scripts\actions\Siphon_vec.sqf",[], 3, true, true, "",""];
				};
			};
		} else 
		{
			EB_myCursorTarget removeAction EB_player_siphonfuel;
			EB_player_siphonfuel = -1;
		};

///////##################################
//Refueling Vehicles
///////##################################

		if ( (_hasFuel) and (_isVehicle) and (_isAlive) and (!_isMan) ) then 
		{
			if (EB_player_refuelAction < 0) then 
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget2 = _vehicle;
				EB_myCursorTarget2 removeAction EB_player_refuelAction;
				_fuel = fuel _vehicle;
				if (_fuel < 1) then
				{
					_vname = format[Localize "str_state_refuel"];
					_vstring0 = format["%1 the %2",_vname,_text];
					_vicon = "<img image='\ca\ui\data\ui_action_refuel_ca.paa' size='1.0' shadow='false' />";
					_vstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_vicon,_vstring0];
					EB_player_refuelAction = EB_myCursorTarget2 addAction [_vstring, "Actions\EB_resources_scripts\actions\Refuel_vec.sqf",[], 4, true, true, "",""];
				};
			};
		} else 
		{
			EB_myCursorTarget2 removeAction EB_player_refuelAction;
			EB_player_refuelAction = -1;
		};
	} else 
///////##################################
	{
		EB_myCursorTarget2 removeAction EB_player_refuelAction; EB_myCursorTarget2 = objNull;
		EB_myCursorTarget removeAction EB_player_fillfuel; EB_player_fillfuel = -1;
		EB_myCursorTarget removeAction EB_player_siphonfuel; EB_player_siphonfuel = -1;

while {EB_player_refuelAction >= 0} do	{
	EB_myCursorTarget removeAction EB_player_refuelAction;
	EB_player_refuelAction = EB_player_refuelAction - 1;
};
	};
sleep 5;
};


/*
//config_depot.sqf8   refuel
//str_misc_fuel_can   fuel can
//str_editor_edobj_veh_param_fuel   fuel
//str_dn_fuel_station    fuel station
//str_dyno_fueldepot    fuel depot
//str_dyno_fueldump     fuel dump
//str_support_refuel    refuel truck
//str_reply_fuel_low   fuel low
//str_cfg_cutscenes_refuel    refueling
//str_sent_support_ask_refuel_1    H.Q., we're running on fumes, need refuel at %1, over.
//str_sent_fuel_low_1    I'm running out of fuel.
//str_sent_fuel_critical_1   Be advised, I'm out of fuel!
//str_state_refuel   refuel
//str_lib_info_fuel_cap   fuel capacity:
//str_action_refuel   refuel at  %1
*/

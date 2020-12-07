//Eggbeast fuel actions - inspired by DayZ scripts by Rocket

if (not (local player)) exitwith {};
private ["_player","_vehicle","_inVehicle","_hasKit","_isMan","_isAlive"];

EB_player_repairAction = -1;
EB_myCursorTarget = objNull;
EB_myCursorTarget2 = objNull;
//hintsilent "monitor script active 2";

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	_player = player;
	_vehicle = vehicle _player;
	_inVehicle = (_vehicle != _player);
	_hasKit = "EB_ItemRepairKit" in (magazines _player);
	sleep BIS_EVO_GlobalSleep;
	//if (_hasSiphon) then {hintsilent "has siphon"};

	if ( (!isNull cursorTarget) and (!_inVehicle) and (_player distance cursorTarget < 5) and (_hasKit) ) then 
	{	//Has some kind of target
		_isVehicle = cursorTarget isKindOf "AllVehicles";
		_isMan = cursorTarget isKindOf "Man";
		_isAlive = alive cursorTarget;
		_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
		//hintsilent format ["vec: %1", _text];

		//if (_isfuel) then {hintsilent "fuel"};

///////##################################
//Allow player to fill Fuel can
///////##################################


//Allow player to siphon Fuel: vehicle to fuelcan with siphon
///////##################################

///////##################################
//Refueling Vehicles
///////##################################

		if ( (_hasKit) and (_isVehicle) and (_isAlive) and (!_isMan) ) then 
		{
			if (EB_player_repairAction < 0) then 
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget2 = _vehicle;
				EB_myCursorTarget2 removeAction EB_player_repairAction;
				_fuel = fuel _vehicle;
				if (_fuel < 1) then
				{
					_vname = format[Localize "str_state_refuel"];
					_vstring0 = format["%1 the %2",_vname,_text];
					_vicon = "<img image='\ca\ui\data\ui_action_refuel_ca.paa' size='1.0' shadow='false' />";
					_vstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_vicon,_vstring0];
					EB_player_repairAction = EB_myCursorTarget2 addAction [_vstring, "Actions\EB_resources_scripts\actions\Refuel_vec.sqf",[], 4, true, true, "",""];
				};
			};
		} else 
		{
			EB_myCursorTarget2 removeAction EB_player_repairAction;
			EB_player_repairAction = -1;
		};
	} else 
///////##################################
	{
		EB_myCursorTarget2 removeAction EB_player_repairAction; EB_myCursorTarget2 = objNull;
		EB_myCursorTarget removeAction EB_player_fillfuel; EB_player_fillfuel = -1;
		EB_myCursorTarget removeAction EB_player_siphonfuel; EB_player_siphonfuel = -1;

while {EB_player_repairAction >= 0} do	{
	EB_myCursorTarget removeAction EB_player_repairAction;
	EB_player_repairAction = EB_player_repairAction - 1;
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

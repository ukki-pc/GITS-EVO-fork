//Eggbeast kill action - inspired by DayZ scripts by Rocket

if (not (local player)) exitwith {};

EB_player_kill = -1;
EB_player_bkill = -1;
EB_player_ckill = -1;
EB_myCursorTarget3 = objNull;

//set up bayonet class weapons
EB_player_foldbayo =-1;
EB_player_fixbayo =-1;
_cbayo = count EGG_bayoweps;
allbayos =[];
allbayoUs=[];
_hasbayouneq = false;
_hasbayoeq = false;
_hasbutt = false;

_i=0;
while {_i< _cbayo} do
{
	allbayoUs = allbayoUs + [(EGG_bayoweps select _i select 0)];//no bayo
	allbayos = allbayos + [(EGG_bayoweps select _i select 1)];//bayo
	_i=_i+1;
};

//set up silenced class weapons
//handguns
EB_player_rmvhsil =-1;
EB_player_fixhsil =-1;
_chsil = count EGG_hsilweps;
allhsil =[];
allhsilU=[];
_j=0;
while {_j< _chsil} do
{
	allhsilU = allhsilU + [(EGG_hsilweps select _j select 0)];//no silencer
	allhsil = allhsil + [(EGG_hsilweps select _j select 1)];//silencers
	_j=_j+1;
};

//rifles
EB_player_rmvrsil =-1;
EB_player_fixrsil =-1;
_crsil = count EGG_rsilweps;
allrsil =[];
allrsilU=[];
_k=0;
while {_k< _crsil} do
{
	allrsilU = allrsilU + [(EGG_rsilweps select _k select 0)];//no silencer
	allrsil = allrsil + [(EGG_rsilweps select _k select 1)];//silencers
	_k=_k+1;
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	_player = player;
	_vehicle = vehicle _player;
	_inVehicle = (_vehicle != _player);
	_hasknife = ( ("EB_knife" in (magazines _player)) || ("EB_kabar" in (magazines _player)) || ("uns_knife" in (magazines _player)) || ("uns_kabar" in (magazines _player)) );

	_wpn = primaryweapon _player;
	_hasbutt = (_wpn !="");
//	hint format ["butt:%1",_hasbutt];

//bayonet monitor
	_nobayo=0;
	{if (_player hasweapon _x) then {_nobayo=_nobayo+1}}forEach allbayoUs;
	_bayo=0;
	{if (_player hasweapon _x) then {_bayo=_bayo+1}}forEach allbayos;

	_hasbayouneq = (_nobayo>0);
	_hasbayoeq = (_bayo>0);

	if ( (_hasbayouneq) and (!_inVehicle) and (EB_player_fixbayo<0)) then 
	{
		EB_player_fixbayo = _player addAction ["<t color='#f79b31'>" +"#Fix Bayonet"+ "</t>", "Actions\EB_resources_scripts\actions\bayo_fix.sqf",[_player], 0, false, true,"",""];
	};
	if ( (_hasbayoeq) and (!_inVehicle) and (EB_player_foldbayo<0)) then 
	{
		EB_player_foldbayo = _player addAction ["<t color='#f79b31'>" +"#Fold Bayonet"+ "</t>", "Actions\EB_resources_scripts\actions\bayo_fold.sqf",[_player], 0, false, true,"",""];
	};

//silencer monitor
//handguns
	_nohsil=0;
	{if (_player hasweapon _x) then {_nohsil=_nohsil+1}}forEach allhsilU;
	_hsil=0;
	{if (_player hasweapon _x) then {_hsil=_hsil+1}}forEach allhsil;

	_hashsiluneq = (_nohsil>0);
	_hashsileq = (_hsil>0);
	_hashsilitem = (("EB_ItemSil_hgun" in (weapons _player))|| ("uns_ItemSil_hgun" in (weapons _player)));

	if ( (_hashsiluneq) and (!_inVehicle) and (EB_player_fixhsil<0)) then 
	{
		EB_player_fixhsil = _player addAction ["<t color='#f79b31'>" +"#Attach Handgun Silencer"+ "</t>", "Actions\EB_resources_scripts\actions\hsil_fix.sqf",[_player], 0, false, true,"",""];
	};
	if ( (_hashsileq) and (!_inVehicle) and (EB_player_rmvhsil <0)) then 
	{
		EB_player_rmvhsil = _player addAction ["<t color='#f79b31'>" +"#Remove Handgun Silencer"+ "</t>", "Actions\EB_resources_scripts\actions\rmv_hsil.sqf",[_player], 0, false, true,"",""];
	};

//rifles
	_norsil=0;
	{if (_player hasweapon _x) then {_norsil=_norsil+1}}forEach allrsilU;
	_rsil=0;
	{if (_player hasweapon _x) then {_rsil=_rsil+1}}forEach allrsil;

	_hasrsiluneq = (_norsil>0);
	_hasrsileq = (_rsil>0);
	_hasrsilitem = ( ("EB_ItemSil_rifle" in (weapons _player)) || ("uns_ItemSil_rifle" in (weapons _player)) );

	if ( (_hasrsiluneq) and !(_inVehicle) and (EB_player_fixrsil<0)) then 
	{
		EB_player_fixrsil = _player addAction ["<t color='#f79b31'>" +"#Attach Rifle Silencer"+ "</t>", "Actions\EB_resources_scripts\actions\rsil_fix.sqf",[_player], 0, false, true,"",""];
	};
	if ( (_hasrsileq) and (!_inVehicle) and (EB_player_rmvrsil <0)) then 
	{
		EB_player_rmvrsil = _player addAction ["<t color='#f79b31'>" +"#Remove Rifle Silencer"+ "</t>", "Actions\EB_resources_scripts\actions\rmv_rsil.sqf",[_player], 0, false, true,"",""];
	};

	if ( (!isNull cursorTarget) and (!_inVehicle) and (_player distance cursorTarget < 10) and ( (_hasknife) || 	(_hasbayoeq) || (_hasbutt) ) ) then 
	{
		_isMan = cursorTarget isKindOf "Man";
		_isAlive = alive cursorTarget;
		_text2 = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
		//hintsilent format ["vec: %1", _text2];
///////##################################
//Allow player to kill man
///////##################################
		if ( (_hasknife) and (_isMan) and (_isAlive) ) then 
		{
			if (EB_player_kill < 0) then 
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget3 = _vehicle;
				_fstring0 = format["knife %1",_text2];//kill name of type of man
				_ficon = "<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.0' shadow='false' />";
				_fstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_ficon,_fstring0];
				if (_hasknife) then 
				{
					EB_player_kill = EB_myCursorTarget3 addAction [_fstring, "Actions\EB_resources_scripts\actions\kill.sqf",[_vehicle,_player], 3, true, true,"",""];
				};
			};
		} else 
		{
			EB_myCursorTarget3 removeAction EB_player_kill;
			EB_player_kill = -1;
		};
///bayonet
		if ( (_hasbayoeq) and (_isMan) and (_isAlive) ) then 
		{
			if (EB_player_bkill < 0) then 
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget3 = _vehicle;
				_fstring0 = format["bayonet %1",_text2];//kill name of type of man
				_ficon = "<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.0' shadow='false' />";
				_fstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_ficon,_fstring0];
				if (_hasbayoeq) then 
				{
					EB_player_bkill = EB_myCursorTarget3 addAction [_fstring, "Actions\EB_resources_scripts\actions\killb.sqf",[_vehicle,_player], 3, true, true,"",""];
				};
			};
		} else 
		{
			EB_myCursorTarget3 removeAction EB_player_bkill;
			EB_player_bkill = -1;
		};

		if ( (_hasbutt) and (_isMan) and (_isAlive) ) then 
		{
			if (EB_player_ckill < 0) then 
			{
				_vehicle = cursorTarget;
				EB_myCursorTarget3 = _vehicle;
				_fstring0 = format["Club %1",_text2];//kill name of type of man
				_ficon = "<img image='\ca\ui\data\ui_action_getingunner_ca.paa' size='1.0' shadow='false' />";
				_fstring = format ["<t color='#f79b31'>" +"%1 %2"+ "</t>",_ficon,_fstring0];
				if (_hasbutt) then 
				{
					EB_player_ckill = EB_myCursorTarget3 addAction [_fstring, "Actions\EB_resources_scripts\actions\killc.sqf",[_vehicle,_player], 3, true, true,"",""];
				};
			};
		} else 
		{
			EB_myCursorTarget3 removeAction EB_player_ckill;
			EB_player_ckill = -1;
		};


	} else 
///////##################################
	{
		EB_myCursorTarget3 removeAction EB_player_kill; EB_player_kill = -1;
		EB_myCursorTarget3 removeAction EB_player_bkill; EB_player_bkill = -1;
		EB_myCursorTarget3 removeAction EB_player_ckill; EB_player_ckill = -1;
	};
sleep 1;
};
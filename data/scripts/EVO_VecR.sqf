// Non-auto-Respawning repairable military vehicles
BIS_EVO_VecR =
{	
	_time = 1+(random 1);
	sleep _time;
	_vcl = _this select 0;
	_class = _this select 1;
	_name = getText(configFile >> "CfgVehicles" >> format["%1", _class] >> "displayName");
	_name = _this select 2;
	_oldpos = _this select 3; 
	_died = false;
	_vclm = format ["%1", _vcl];
	_rmess = format [localize "STR_M04t46", _name];//%1 needs repair
	_vcl2=objNull;
	_markerobj = "";
	_rtime = 0;

	_vecinit = 
	{
		_getin = _vcl addEventHandler ["GetIn", {handle = [(_this select 0),(_this select 1)] execVM call BIS_EVO_Boarding}];
		if(_getin > 1) then {_vcl removeEventHandler ["GetIn", _getin]};

		/*
				if(_vcl isKindOf "Air") then
		{
			_warning = _vcl addEventHandler["IncomingMissile",{if ((_this select 1) in BIS_EVO_aaweapons) then 
			{	
				BIS_EVO_mtar = driver (_this select 0);
				publicVariable "BIS_EVO_mtar";
			}}];
		};
		*/


	
			_warning = _vcl addEventHandler["IncomingMissile",{
			
				BIS_EVO_mtar = driver (_this select 0);
				publicVariable "BIS_EVO_mtar";
			}];
	};
	BIS_EVO_Frew = 
	{
		if(time > _rtime) then 
		{
			if (_vcl in list reng1) then
			{
				BIS_EVO_epoint = reng1;
				publicVariable "BIS_EVO_epoint";
			};
			if (_vcl in list reng2) then
			{
				BIS_EVO_epoint = reng2;
				publicVariable "BIS_EVO_epoint";
			};
			if (_vcl in list reng3) then
			{	
				BIS_EVO_epoint = reng3;
				publicVariable "BIS_EVO_epoint";
			};
			if (_vcl in list reng4) then
			{
				BIS_EVO_epoint = reng4;
				publicVariable "BIS_EVO_epoint";
			};
//adding
//			_died = false; //
			_rtime = time+600;
		};
	};
	_vecmarker = 
	{
		if( (_vcl in list airportin)) then
		{
		
			_mrktype = "";
			if (_vcl isKindOf "Car") then {_mrktype = "b_motor_inf"};
			if (_vcl isKindOf "Tank") then {_mrktype = "b_armor"};
			if (_vcl isKindOf "Air") then {_mrktype = "b_air"};
			_markerobj = createMarker[_vclm,[getpos _vcl select 0,getpos _vcl select 1]];
			_markerobj setMarkerColor "ColorBlue";
			_markerobj setMarkerType _mrktype;
			_markerobj setMarkerSize [0.5, 0.5];
			if(fuel _vcl == 0) then 
			{
				_markerobj setMarkerText format [localize "STR_M04t46", _name];//%1 needs repair
			}
			else
			{
				_markerobj setMarkerText format ["%1", _name]
			};
		}
		else
		{
			_markerobj = "nomarker";
		};
	};

	[] call _vecinit;
	/*
	for [{_Rloop=0}, {_Rloop<1}, {_Rloop=_Rloop}] do
	{
		if (alive _vcl) then
		{
			if ((count units _vcl) == 0 and _markerobj == "") then
			{				
				[] call _vecmarker;
				sleep 1.0;
			};
			if ((count units _vcl) > 0 and _markerobj != "") then
			{
				deleteMarker _markerobj;
				_markerobj = "";
			};
		};
		if (not alive _vcl) then 
		{
			{_x setpos position _vcl} forEach crew _vcl;
		        Sleep 10;
			_respawnpoint = position _vcl;
			_posasl = getPosASL _vcl;
			_vecup = vectorUp _vcl;
			_vecdir = vectorDir _vcl;
			deleteVehicle _vcl;
			if (_posasl select 2 < 1.0) then 
			{
				sleep 3200.0;	
				_vcl = _class createVehicle _oldpos;
				_vcl setpos _oldpos;
				_vcl setdir 0.0;
			}
			else
			{
				_vcl = _class createVehicle _respawnpoint;
				_vcl setfuel 0;
				_vcl setpos _respawnpoint;
				_vcl setVectorDirAndUp [_vecdir,_vecup];
				sleep 1.0;
				_vcl setdammage 0.60;		
				deleteMarker _markerobj;_markerobj = "";				
				[] call _vecmarker;
				WaitUntil{damage _vcl == 0 or not alive _vcl};
				[] call BIS_EVO_Frew;
				
			};
			[] call _vecinit;			
		};
		Sleep 1.0;
	};		
	*/
};

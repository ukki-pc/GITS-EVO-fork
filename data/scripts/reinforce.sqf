// resupplies towns with reinforcements

private ["_allvec","_allvecs","_allvecs2","_spawn","_spawns","_radio","_alist","_tag","_type","_Allspawns","_wtime","_curtownInf","_basetownInf","_curtownMec","_basetownMec"]; 

	_spawn = [0,0,0];
	_spawns = [];
	_radio = objNull;
	_alist = objNull;
	_tag = "";
	_type = "";
	_Allspawns = [["parref","parrefa","parrefb"],["somref","somrefa","somrefb"],["cayref","cayrefa","cayrefb"],["dolref","dolrefa","dolrefb"],["ortref","ortrefa","ortrefb"],["corref","correfa","correfb"],["obrref","obrrefa","obrrefb"],["bagref","bagrefa","bagrefb"],["eporef","eporefa","eporefb"],["masref","masrefa","masrefb"],["pitref","pitrefa","pitrefb"]];
	_wtime = 0;
	_radio = BIS_EVO_radios select BIS_EVO_MissionProgress;
	_alist = BIS_EVO_DetectWest;
	
	_curtownInf = round(((BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 0)/enemynumdiv);
	_basetownInf = round(((BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 1)/enemynumdiv);
	_curtownMec = round(((BIS_EVO_Mechanized select BIS_EVO_MissionProgress) select 0)/enemynumdiv);
	_basetownMec = round(((BIS_EVO_Mechanized select BIS_EVO_MissionProgress) select 1)/enemynumdiv);

	//systemChat format["CI:%1 BI:%2 CM:%3 BM:%4 ",_curtownInf,_basetownInf,_curtownMec,_basetownMec];
	sleep 1;

	BIS_EVO_mKamazOpen =
	{
		private ["_allunits","_guardr","_unit","pos2","_max","_alist","_Allspawns","_radio","_spawns","_allvecs","_maxA","_ural"]; 
		_guardr = grpNull;
		_unit = objNull;
		_pos2 = objNull;
		_max = objnull;
		_alist = BIS_EVO_DetectWest;
		_Allspawns = [["parref","parrefa","parrefb"],["somref","somrefa","somrefb"],["cayref","cayrefa","cayrefb"],["dolref","dolrefa","dolrefb"],["ortref","ortrefa","ortrefb"],["corref","correfa","correfb"],["obrref","obrrefa","obrrefb"],["bagref","bagrefa","bagrefb"],["eporef","eporefa","eporefb"],["masref","masrefa","masrefb"],["pitref","pitrefa","pitrefb"]];
		_radio = BIS_EVO_radios select BIS_EVO_MissionProgress;

		_allunits = EGG_EVO_west1;
		_max = count _allunits;
		_guardr = createGroup (west);
		_spawns = _Allspawns select BIS_EVO_MissionProgress;
		_pos2 = GetMarkerPos (_spawns select (round random 2));
		_allvecs = EGG_EVO_mevconvoyb;
		_maxA = count _allvecs;
		_ural = createVehicle [(_allvecs select (round random (_maxA - 1))), _pos2, _spawns, 0, "NONE"];[_ural] call BIS_EVO_Lock;_ural addEventHandler ["killed", {handle = [_this select 0] execVM "data\scripts\bury.sqf"}];
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select (round random (_max - 1))), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsDriver _ural;_unit moveInDriver _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		_unit = _guardr createUnit [(_allunits select round random (_max - 1)), _pos2, [], 0, "NONE"];_unit setSkill skillfactor+(random 0.2);[_unit] join _guardr;_unit assignAsCargo _ural;_unit moveInCargo _ural;
		Sleep 0.2;
		[position _alist,_guardr,_radio,_alist] call BIS_EVO_Erefway;
		[_guardr, 1] setWaypointType "GETOUT";
		{_x addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}]; _x addmagazine ["EB_molotov_mag",2];} forEach (units _guardr);	
		_recy = [objnull,_guardr] execVM "data\scripts\grecycle.sqf";
		_guardr setFormation "COLUMN";
		[_guardr, 1] setWaypointCombatMode "RED";	
		[_guardr, 1] setWaypointSpeed "NORMAL";	

			


		sleep 300;
		deleteVehicle _ural;
	};

	BIS_EVO_MI17support =
	{	
		private ["pos","_unit","_vec","_heli0","_max","_maxv","_alist","_allunits2","_allvecs2","_pilot","_para","_radio","_posback","_pos1","_pos2","_sumark","_wp","_wp2","_wpx2","_i","_recy"]; 
		_pos = objNull;
		_unit = objNull;
		_vec = objNull;
		_heli0 = objnull;
		_max = objnull;
		_maxv = objnull;
		_alist = BIS_EVO_DetectWest;
		_allunits2 = EGG_EVO_west1;
		_max = count _allunits2;
		_radio = BIS_EVO_radios select BIS_EVO_MissionProgress;
		_pos = position _radio;
		_posback = getmarkerpos "EnemyAir03";
		_pilot = createGroup (west);
		(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
		(EGG_EVO_mepilot select 0) createUnit [getmarkerpos "centerp", _pilot];Sleep BIS_EVO_GlobalSleep;
		_pos1 = [(_pos select 0)-2000 -(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
		_pos2 = [(_pos select 0)+2000 +(random 2000),(_pos select 1)+2000 -(random 3000),(200 + random 100)];
		_allvecs2 = EGG_EVO_mevair3;
		_maxv = count _allvecs2;
		_heli0 = createVehicle [(_allvecs2 select round random (_maxv - 1)),_pos1, [], 500, "FLY"];Sleep BIS_EVO_GlobalSleep;
		_heli0 setpos [getpos _heli0 select 0, getpos _heli0 select 1, 200];
		_heli0 setdir (random 359);
		_heli0 engineon true;
		(units _pilot select 0) assignAsDriver _heli0;
		(units _pilot select 1) assignAsGunner _heli0;
		(units _pilot select 0) moveInDriver _heli0;
		(units _pilot select 1) moveInGunner _heli0;
		_sumark = [_heli0] execVM "data\scripts\sumarker.sqf";
		_wp = _pilot addWaypoint [_pos, 10];
		_wp2 = _pilot addWaypoint [_posback, 10];
		{_x setBehaviour "careless"} forEach (units _pilot);

		(driver _heli0) commandMove _pos;
		(driver _heli0) doMove _pos;
		_heli0 flyInHeight 150;

		waitUntil {(_heli0 distance _pos) < (random 200) or not (canmove _heli0)};

		if (canmove _heli0) then 
		{
			_para = createGroup (west);
			_count = 5;
			_i = 0;
			while {_i <= _count} do 
			{
				_pos = position _heli0;
				_unit = _para createUnit [_allunits2 select (round (random (_max - 1))), [0,0,0], [], 300, "NONE"];
				_unit setSkill skillfactor+(random 0.2);
				_unit addEventHandler ["killed", {handle = [_this select 0,"INF"] execVM "data\scripts\mobjbury.sqf"}];
				[_unit] join _para;
				_vec = createVehicle ["ParachuteWest", _pos, [], 20, 'NONE'];
				_vec setpos [_pos select 0,_pos select 1,(_pos select 2)- 12];
				_unit MoveInDriver _vec;
				sleep 0.7;
				_i = _i + 1;
			};

			{_x setBehaviour "combat"; _x addmagazine "EB_molotov_mag"} forEach (units _para);
			[position _alist,_para,_radio,_alist] call BIS_EVO_Erefway;
//adding
			_recy = [objnull,_para] execVM "data\scripts\grecycle.sqf";
			sleep 10;
			_wpx2 = _pilot addWaypoint [_posback, 20];
			[_pilot, 2] setWaypointType "MOVE";
			(driver _heli0) commandMove _posback;
			(driver _heli0) doMove _posback;
		};
		sleep 90;
		{deleteVehicle _x} forEach ([_heli0] + crew _heli0);
		if (!isNull _unit) then {deleteVehicle _unit};
		deleteGroup _pilot;
	};
	
	EGG_EVO_mecreinf = 
	{
		private ["_Allspawns","_alist","_radio","_unit","_guardm","_pos","_rng","_vec","_maxo","_spawns","_pos","_tag","_allvec","_rds","_cardir","_degrees","_dirdif","_array","_recy"]; 
		_Allspawns = [["parref","parrefa","parrefb"],["somref","somrefa","somrefb"],["cayref","cayrefa","cayrefb"],["dolref","dolrefa","dolrefb"],["ortref","ortrefa","ortrefb"],["corref","correfa","correfb"],["obrref","obrrefa","obrrefb"],["bagref","bagrefa","bagrefb"],["eporef","eporefa","eporefb"],["masref","masrefa","masrefb"],["pitref","pitrefa","pitrefb"]];
		_alist = BIS_EVO_DetectWest;
		_radio = BIS_EVO_radios select BIS_EVO_MissionProgress;
		_unit = objNull;
		_guardm = grpNull;
		_pos = objNull;
		_vec = objNull;
		_maxo = 0;
		_spawns = _Allspawns select BIS_EVO_MissionProgress;
		_pos = GetMarkerPos (_spawns select (round random 2));
		_tag = "MEC";

		//Increasing aggression
		_rng = round(random(9)+1 + (BIS_EVO_MissionProgress+1)*0.66);
		 if(_rng < 6) then 
		 {
		 	_allvec = EGG_EVO_westEasy; //mixed units reinforce
		 };
		if(_rng > 5 && _rng < 10) then 
		 {
		 	_allvec = EGG_EVO_westMedium; //mixed units reinforce
		 };
	 	if(_rng > 9) then 
		 {
		 	_allvec = EGG_EVO_westHard; //mixed units reinforce
		};

		//systemchat format ["Random number was: %1", _rng];
		_maxo = (count _allvec)-1;	
		_rds = [];
		_rds = (_pos nearRoads 10);
		waitUntil{count _rds > 0};
		_cardir = (getdir (_rds select 0));
		_degrees = [_pos,position _alist] call BIS_EVO_GetRelDir;
		_dirdif = (_cardir-_degrees);
		if((_dirdif > 89) or (_dirdif < -89)) then{_cardir=_cardir-180};	
		_pos = position (_rds select 0);

		_array = [_allvec select (round random _maxo),_pos,(west),20,_cardir,0] call BIS_EVO_CreateVehicle;

		_guardm = _array select 0;
		_vec = _array select 1;
	///	systemchat format ["spawned: %1", typeof _vec];
		[position _alist,_guardm,_radio,_alist] call BIS_EVO_Erefway;
		_vec lock 2;
		[_guardm, 1] setWaypointCombatMode "RED";		
		{_x addEventHandler ["killed", {handle = [_this select 0,"MEC"] execVM "data\scripts\mobjbury.sqf"}]} forEach (units _guardm);
		_guardm setFormation "COLUMN";
		//adding
		_recy = [objnull,_guardm] execVM "data\scripts\grecycle.sqf";
	};

if ( (_curtownInf <= _basetownInf) and (alive _radio) ) then 
{
//	systemChat "reinforcing infantry";
	_tag = "INF";	
	[] spawn BIS_EVO_mKamazOpen;
	[] spawn BIS_EVO_MI17support;
	(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, (_curtownInf*enemynumdiv)+12];
	sleep 1;
};
	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0,0];
sleep 15;

if( (_curtownMec <= _basetownMec) and (alive _radio) ) then 
{
//	systemChat "reinforcing mechanized";
	[] spawn EGG_EVO_mecreinf;
	(BIS_EVO_Mechanized select BIS_EVO_MissionProgress) set [0, (_curtownMec*enemynumdiv)+1];
	sleep 1;
};
sleep 1;


BIS_EVO_Infantry = [[7,7],[30,30],[7,7],[30,30],[30,30],[30,30],[30,30],[30,30],[30,30],[30,30],[30,30]];
BIS_EVO_Mechanized = [[3,3],[18,18],[3,3],[18,18],[18,18],[18,18],[18,18],[18,18],[18,18],[18,18],[18,18]];
//{if(side _x == east) then {_x setdamage 1}} foreach allunits


/*
TestLoop = 
{

	for [{_loop=0}, {_loop<1}, {_loop=_loop}] do  
	{
		_Mroad = ((vehicle player) nearRoads 10) select 0;
		_Broad = roadsConnectedTo _Mroad;
		hint format["dist: %1",(_Broad select 0) distance (_Broad select 1)];
		sleep 0.1
	}; 
};

[] call TestLoop;






//_grp = creategroup (west);
//[position player,180,"M1A1",east] call BIS_fnc_spawnVehicle;
/*
    https://mm.xdev.bistudio.com/svn/CA/Modules/Functions/spawning/spawnVehicle.sqf 

Description: Function to spawn a certain vehicle type with all crew (including turrets).

Params:

    * _this select 0: desired position (Array).
    * _this select 1: desired azimuth (Number).
    * _this select 2: type of the vehicle (String).
    * _this select 3: side or existing group (Side or Group). 
*/


//civcar = [] execVM "data\scripts\BIS_EVO_CivTraffic.sqf";aspec = [player,0,10,1] execVM 'spect\specta.sqf'

//////////////////////// dtest = [] execVM 'data\scripts\test.sqf'
/*
Troad1 = (((vehicle player) nearRoads 10) select 0);
Troads1 = (roadsConnectedTo Troad1);
Troad2 = Troads1 select 1;
Troads2 = (roadsConnectedTo Troad2);
hint format["%1\n\n%2\n\n%3\n\n%4",Troad1,Troads1,Troad2,Troads2];

pos1 = position player;
//pos1 = [5000,5000,0];
pos2 = [7657,9987,0];
wp = group player addWaypoint [pos2, 0];
wp = group player addWaypoint [pos1, 0];
xy=[(pos2 select 0)-(pos1 select 0),(pos2 select 1)-(pos1 select 1)]; 
degrees= ((xy select 0) atan2 (xy select 1));
//degrees= ((xy select 0) atan2 (xy select 1))-180;
if(degrees < 0)then{degrees=degrees+360};
hint format["%1 %2 %3",degrees,pos1,xy];
*/
//hint format["%1 POS_%2 :::%3",_road,position _road1,(roadsConnectedTo _road)];

//_troad = ((roadsConnectedTo _road) select 0);

//vehicle player setdir getdir Mroad;

//(((vehicle player) nearRoads 10) select 0)


//link = createDiaryLink ["Diary", player, "Player link"];
		/*_pos = (position player);
		_obj_para = "ParachuteWest" createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];		
		_tbox = "USOrdnanceBox" createVehicle _pos;
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		
		_tbox setpos [_pos select 0,_pos select 1,(_pos select 2) +50];
		
		_i = 999;
		while {_i > 0} do 
		{
			_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) + (_i/10)];
			_tbox setpos [_pos select 0,_pos select 1,(_pos select 2) + ((_i/10)-1)];
			sleep 0.01;
			_i = _i - 1;
		};
		
		_tbox setpos _pos;
		*/




//	_curtownInf = (BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 0;
//_basetownInf = (BIS_EVO_Infantry select BIS_EVO_MissionProgress) select 1;
//_run = [player ,10] execVM "data\scripts\Mass.sqf"
//BIS_EVO_Infantry = [[0,0],[1,1],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2]];//[Actual number of groups,Base number of groups]
//BIS_EVO_Mechanized = [[0,0],[1,1],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3]];//[Actual number of groups,Base number of groups]
//_events = [] execVM "data\scripts\EVO_Vecinit.sqf";
//_sin = [] execVM "data\scripts\sinitS.sqf";
/*
		_i = 1;
		_xPos = 0;
		_yPos = 0;
		_howBigA = 1;
		_howBigB = 1;
		_angle = direction player;
		_x = (_howBigA * (sin _i));
		_y = (_howBigB * (cos _i));
		_x_rot = _xPos + _x*(cos _angle) - _y*(sin _angle);
		_y_rot = _yPos + _x*(sin _angle) + _y*(cos _angle);

	//	if(true) exitWith {hint format["�%1 %2",_x_rot,_y_rot]};
		_player = _this select 0;
		_pos = (position vehicle player);
		_camera = "camera" camCreate _pos;
		_camera cameraEffect ["internal","back"];
		_camera camSetFOV 0.7;
		_camera camSetTarget [_pos select 0,_pos select 1,(_pos select 2)+0.2];
		_camera camSetRelPos [-_x_rot,_y_rot,1.2];
		_camera camCommit 0;
		_camera camSetFocus [2, 50];
		waitUntil {camCommitted _camera}; // Look at player
		_camera camSetTarget [_pos select 0,_pos select 1,(_pos select 2)+1.6];
		_camera camCommit 4;
		waitUntil {camCommitted _camera};
		Sleep 1.0;
		player cameraEffect ["terminate","back"];
		camUseNVG false;
		camDestroy _camera;
		titleCut["", "BLACK in",1];
/*


//_unit = 10;

//_professions = player execvm "data\scripts\EVO_UpdateProf.sqf";


link = createDiaryLink ["Diary", player, "Player link"];


//_link = format ["<execute expression=""BIS_EVO_PlayerModel = %2"">%1</execute>",_name,"&quot;FR_Marksman&quot;"];



//BIS_EVO_PlayerModel = "USMC_Soldier"


link = createDiaryLink ["Diary", player, "Player link"];


//Record = player createDiarySubject ["Prof", "Professions","\Ca\characters\data\portraits\comBarHead_usmc_soldier_ca"];
/*
record = player createDiaryRecord ["skiing", ["Kill all <execute expression=""hint &quot;Ahoj.&quot;;""> enemies</execute>.","newSection"]];
link = createDiaryLink ["Group", player, "Player link"];
processDiaryLink link;
*

/*
OldGuy=player;
_grp = createGroup (west);_pos = position airportin;NewGuy = _grp createUnit ["FR_TL", _pos, [], 0, "NONE"];selectPlayer NewGuy;handle = player execVM "data\scripts\spawn.sqf";



//_newMody = _grp createUnit ["FR_TL", (position player), [], 0, "FORM"];
sleep 2.0;


//_outpoints = ["TEST1","TEST2","TEST3","TEST4","TEST5"];
//
//_outpoints select (round random (count _outpoints)-1)
//hint format["TEST= %1",_outpoints select (round random (count _outpoints-1))];

//_intro = player execVM "data\scripts\intro.sqf";
//BIS_EVO_Onmission = true;_launch = [player,1,10] execVM "data\scripts\selectmis.sqf";
//BIS_EVO_Infantry = [[0,2],[2,2],[0,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2],[2,2]];
//BIS_EVO_Mechanized = [[3,3],[3,3],[2,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3]];
//hint format["MEC: %1 INF:%2",BIS_EVO_Mechanized,(BIS_EVO_Infantry select BIS_EVO_MissionProgress)];
//player setpos position BIS_EVO_DetectWest

//_vcl = "SkodaBlue" createVehicle position player;
//vehicle player setVelocity [0, 0, 0];
//[player,100] call BIS_EVO_RankReq;

//player setskill 0;
//_objectname setobjecttexture [0,"\pboname\texture.paa"];
//[player] call BIS_EVO_Erew;
//
//hint localize "STR_M04t0_5";
//(BIS_EVO_Infantry select BIS_EVO_MissionProgress) set [0, 99];
//hint format["MEC: %1 INF:%2",BIS_EVO_Mechanized,(BIS_EVO_Infantry select BIS_EVO_MissionProgress)];


//player addscore 10;
//debugLog "Debug log test";
//player createDiarySubject ["skiing", "RE"];
//link = createDiaryLink ["Group", player, "Player link"];
//processDiaryLink link;
//record = player createDiaryRecord ["diary", ["NewEntrie","Kill all <execute expression=""hint &quot;THIS IS  A HINT&quot;;""> enemies</execute>."]];
//record = player createDiaryRecord ["diary", ["","Kill all <execute expression=""hint 'THIS IS A HINT';""> enemies2</execute>."]];
//_record = player createDiaryRecord ["diary", [localize "STR_M04t78", _plaintext]];

/*
record = player createDiaryRecord ["test", "Kill all <execute expression=""hint &quot;Ahoj.&quot;;""> enemies</execute>."];
link = createDiaryLink ["Group", player, "Player link"];
processDiaryLink link;





_team = createTeam ["USMC_Team", "Fire Team Red"];
_team addTeamMember teamMember player;  
teamMember player createTask [["check1"], 1, "", value1, name2, value2];
//_txtmessage = format ["%1",_txtmessage];

//hint format["",]getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle _u)] >> "DisplayName");
//player setPosASL [position player select 0,position player select 1,15.4]
//hint format["%1:",getposasl vehicle player];

//hint format["%1:",CT_XLISTBOX];

		_medic = (nearestObject [vehicle player, "USMC_Soldier_Medic"]);
		hint format["%1",_medic];
		if (isNull _medic) then 
		{
			_medic = (nearestObject [vehicle player, "MASH"]);
			if (not (isNull _medic)) then
			{
				mpoint = _medic;
				publicVariable "mpoint";
			};
		};
		if (not (isNull _medic) and _medic != player) then
		{
			mpoint = _medic;
			publicVariable "mpoint";
		};
		
		fattack=false;
		
	//};


  //_Subject = player createDiarySubject ["diary", "Kill all enemies.more"]  

//hint format["Unit:%1 Reward:%2", sop];
//SideMissions = player createTask ["blah"], 1, "Missions"]
//player addscore -560;
/*
		_msg = [parseText "<t color='#00FF00'>Repair Bonus(L)</t><br/><br/>"];
		_msg = _msg+[parseText format["<t color='#FFFFFF'>+%1 Points(L)</t>",10]];
		_txt = composeText _msg;
		hint _txt;	

_txt = composeText _msg;
hint _txt;



punit = player;
prew = 100;
publicVariable "punit";
publicVariable "prew";
hint format["Unit:%1 Reward:%2", punit,prew];

Tobj6 = player createSimpleTask ["Tobj6"];
Tobj6 setSimpleTaskDescription ["Kill them allTobj6","KillemTobj6","Kill in hudTobj6"];
Tobj6 setSimpleTaskDestination markerPos "mrnd11";
Tobj6 settaskstate "Created";
*/


//player removeSimpleTask Tobj6; 

//Tobj6 settaskstate "Succeeded";


//player addscore -518;
//bparinf=2;
//bparmec=3;
//obag=true;
//{_x addscore 10} forEach list apar;
//hint format["%1__%2", crew player,parmec];
//player setpos position ((player nearRoads 50) select 0);
//handle = [player,player] execVM "data\scripts\killed.sqf";
//{_x setdammage 1} foreach parlist;
//never = true;

//{_x disableAI "TARGET";_x disableAI "AUTOTARGET";_x disableAI "MOVE";_x disableAI "ANIM"} foreach (list alleast);
//{_x setBehaviour "CARELESS"} foreach (list alleast);
//{deletevehicle _x} foreach (list alleast);

//{vehicle _x setpos [0,0,0]} foreach (list parlist);

//hint format["%1__",list parlist];

//BIS_EVO_opar = true;
//titleText[format ["%1 | %2 | %3",sop,sot,sor],"plain down"];
//parso1 setpos position player;

//player setpos position somso1;

//vehicle player AddWeaponCargo ["M4A1GL", 1];

BIS_EVO_ResetClick =
{
	onMapSingleClick "if (_alt and debug) then {vehicle player setpos _pos;{vehicle _x setpos _pos} forEach _units}";
};


BIS_EVO_Mrew =
{
	_bscore = 0;
	_unit = player;
	if (score _unit <= BIS_EVO_rank1 and _bscore < 2) then{_bscore = 14};
	 if (score _unit > BIS_EVO_rank1 and _bscore < 4) then{_bscore = 4};
	 if (score _unit > BIS_EVO_rank2 and _bscore < 6) then{_bscore = 6};
	 if (score _unit > BIS_EVO_rank3 and _bscore < 8) then{_bscore = 8};
	 if (score _unit > BIS_EVO_rank4 and _bscore < 10) then{_bscore = 10};
	 if (score _unit > BIS_EVO_rank5 and _bscore < 12) then {_bscore = 12};
	 if (score _unit >= BIS_EVO_rank6 and _bscore < 14) then{_bscore = 14};
	BIS_EVO_punitC = player;
	BIS_EVO_prewC  = _bscore;
	publicVariable "BIS_EVO_prewC";
	publicVariable "BIS_EVO_punitC";
	_txtcommon = localize "STR_M04t0_5";
	_txtpasshead = localize "STR_M04t77";
	_txtpassbody = format["+%1 %2",_bscore,_txtcommon];
	["#00FF00",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

BIS_EVO_Erew =
{
	_zone = _this select 0;
	_unit = player;
	_bscore = 0;
	if (_zone == BIS_EVO_EngZone) then
	{
		if (score _unit <= BIS_EVO_rank1) then {_bscore = 2;};
		if (score _unit > BIS_EVO_rank1) then {_bscore = 4};
		if (score _unit > BIS_EVO_rank2) then {_bscore = 6};
		if (score _unit > BIS_EVO_rank3) then {_bscore = 8};
		if (score _unit > BIS_EVO_rank4) then {_bscore = 10};
		if (score _unit > BIS_EVO_rank5) then {_bscore = 12};
		if (score _unit >= BIS_EVO_rank6) then {_bscore = 14};
		BIS_EVO_punitC = player;
		BIS_EVO_prewC  = _bscore;
		publicVariable "BIS_EVO_prewC";
		publicVariable "BIS_EVO_punitC";
		_txtcommon = localize "STR_M04t0_5";//Points
		_txtpasshead = localize "STR_M04t75";//Repair Bonus
		_txtpassbody = format["+%1 %2",_bscore,_txtcommon];
		["#00FF00",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
	};
};

BIS_EVO_AssignTasks =  // Assigns common main city objectives
{
	_MissionBriefingHUD = "";
	_MissionBriefingShort = "";
	_MissionBriefingLong = "";
	if(isNull BIS_EVO_Objective0) then
	{
		_MissionBriefingLong = localize "STR_M04t57";//Take a break for a while.
		_MissionBriefingHUD = "";
		_MissionBriefingShort = localize "STR_M04t56";//Unassign
		BIS_EVO_Objective0 = player createSimpleTask ["obj0"];
		BIS_EVO_Objective0 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective0 settaskstate "Created";
	};
	
	if( (BIS_EVO_MissionProgress != -1) ) then {
		_MissionBriefingHUD = localize "STR_M04t58";//ASSAULT
		_MissionBriefingShort = (BIS_EVO_Townnames select 0);
		_MissionBriefingLong = format[localize "STR_M04t59",_MissionBriefingShort];// Command has issued an order to launch a full scale assault on %1. The primary objective is to neutralize all enemy in the area. Secondary objectives are to disable their radio tower and capture any high ranking officers you find in the town.
		BIS_EVO_Objective1 = player createSimpleTask ["obj1"];
		BIS_EVO_Objective1 setSimpleTaskDescription [_MissionBriefingLong,_MissionBriefingShort,_MissionBriefingHUD];
		BIS_EVO_Objective1 setSimpleTaskDestination getPos (BIS_EVO_MissionTowns select BIS_EVO_MissionProgress);
		BIS_EVO_Objective1 settaskstate "Created";
		player setCurrentTask BIS_EVO_Objective1;
	};
		if(BIS_EVO_MissionProgress == -1 ) then {
		BIS_EVO_Objective1 settaskstate "Succeeded";
		//	BIS_EVO_Objective1 settaskstate "Succeeded";
		};
};

BIS_EVO_Message = // Most hint messages are sent here for a common display and record to log
{
	_headcolor = _this select 0;
	_head = _this select 1;
	_body = _this select 2;
	_plaintext = format["%1: %2",_head,_body];
	_parsedtext = parseText format["<t color='%1'>%2</t><br/><br/>%3",_headcolor,_head,_body];
	_msg = [_parsedtext];
	_txt = composeText _msg;
	hintSilent _txt;
	_record = player createDiaryRecord ["diary", [localize "STR_M04t78", _plaintext]];//"Message Log"
};

BIS_EVO_RankReq = // Displays required rank when player is ejected.
{
	_player = _this select 0;
	_name = name vehicle _player;
	_rank = rank _player;
	_reqrank = _this select 1;
	_nrank = "";

	switch (_reqrank) do
	{
	    case BIS_EVO_rank1:
	    {
		_nrank = "CORPORAL";
	    };
	    case BIS_EVO_rank2:
	    {
		_nrank = "SERGEANT";
	    };
	    case BIS_EVO_rank3:
	    {
		_nrank = "LIEUTENANT";
	    };
	    case  BIS_EVO_rank4:
	    {
		_nrank = "CAPTAIN";
	    };
	    case  BIS_EVO_rank5:
	    {
		_nrank = "MAJOR";
	    };
	    case  BIS_EVO_rank6:
	    {
		_nrank = "COLONEL";
	    };
	};

	_txtpasshead = localize "STR_M04t79";//Higher Rank Required
	_txtreq = localize "STR_M04t80";//Rank Required
	_textcur = localize "STR_M04t81";//Current Rank
	_txtpassbody = format["%1 : %2<br/>%3 : %4",_textcur,_rank,_txtreq,_nrank];
	["#FF0000",_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

true
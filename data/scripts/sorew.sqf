// sub objective rewards
_sop = _this select 0;
_sot = _this select 1;
_sor = _this select 2;

_txtpasshead = localize "STR_M04t68"; //Tower Destroyed
_txtcommon = localize "STR_M04t0_5"; //Points
_txtpassbody = format["+%1 %2",_sor,_txtcommon];
_city = "";

//_RadioTowerMessage = composeText [parseText format ["<t color='#FFFF00'>%1</t><br/><br/><t color='#FFFFFF'>+%2 %3</t>",_TextTower,_sor,_TextPoints]];

if(_sor > 0) then
{
	switch (_sot) do
	{
	    case "radio1":
	    {
//	    	_city = "LOPATINO";
//	    	_city = localize "str_location_lopatino";
		_city = (BIS_EVO_Townnames select 0);
	    	[West,"HQ"] SideChat format[localize "STR_M04t62",_city];//COMUNICATIONS CUT AT %1, GOOD WORK
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio1o":
	    {
//	    	_city = "LOPATINO";
//	    	_city = localize "str_location_lopatino";
		_city = (BIS_EVO_Townnames select 0);
	    	[West,"HQ"] SideChat format[localize "STR_M04t63",_city]; //OFFICER DETAINED AT %1, GOOD WORK
		playSound "Goodjob";
	    };
	    case "radio2":
	    {
//	    	_city = "VYBOR";
//	    	_city = localize "str_location_vybor";
		_city = (BIS_EVO_Townnames select 1);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio2o":
	    {
//	    	_city = "VYBOR";
//	    	_city = localize "str_location_vybor";
		_city = (BIS_EVO_Townnames select 1);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio3":
	    {
//	    	_city = "GRISHINO";
//	    	_city = localize "str_location_grishino";
		_city = (BIS_EVO_Townnames select 2);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio3o":
	    {
//	    	_city = "GRISHINO";
//	    	_city = localize "str_location_grishino";
		_city = (BIS_EVO_Townnames select 2);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio4":
	    {
//	    	_city = "GVOZDNO";
//	    	_city = localize "str_location_gvozdno";
		_city = (BIS_EVO_Townnames select 3);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio4o":
	    {
//	    	_city = "GVOZDNO";
//	    	_city = localize "str_location_gvozdno";
		_city = (BIS_EVO_Townnames select 3);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio5":
	    {
//	    	_city = "KRASNOSTAV";
//	    	_city = localize "str_location_krasnostav";
		_city = (BIS_EVO_Townnames select 4);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio5o":
	    {
//	    	_city = "KRASNOSTAV";
//	    	_city = localize "str_location_krasnostav";
		_city = (BIS_EVO_Townnames select 4);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio6":
	    {
//	    	_city = "KHELM";
//	    	_city = localize "str_location_khelm";
		_city = (BIS_EVO_Townnames select 5);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };  
	    case "radio6o":
	    {
//	    	_city = "KHELM";
//	    	_city = localize "str_location_khelm";
		_city = (BIS_EVO_Townnames select 5);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio7":
	    {
//	    	_city = "BEREZINO";
//	    	_city = localize "str_location_berezino";
		_city = (BIS_EVO_Townnames select 6);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio7o":
	    {
//	    	_city = "BEREZINO";
//	    	_city = localize "str_location_berezino";
		_city = (BIS_EVO_Townnames select 6);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio8":
	    {
//	    	_city = "SOLNICHNIY";
//	    	_city = localize "str_location_solnichniy";
		_city = (BIS_EVO_Townnames select 7);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio8o":
	    {
//	    	_city = "SOLNICHNIY";
//	    	_city = localize "str_location_solnichniy";
		_city = (BIS_EVO_Townnames select 7);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio9":
	    {
//	    	_city = "KAMYSHOVO";
//	    	_city = localize "str_location_kamyshovo";
		_city = (BIS_EVO_Townnames select 8);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio9o":
	    {
//	    	_city = "KAMYSHOVO";
//	    	_city = localize "str_location_kamyshovo";
		_city = (BIS_EVO_Townnames select 8);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio10":
	    {
//	    	_city = "ELEKTROZAVODSK";
//	    	_city = localize "str_location_elektrozavodsk";
		_city = (BIS_EVO_Townnames select 9);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio10o":
	    {
//	    	_city = "ELEKTROZAVODSK";
//	    	_city = localize "str_location_elektrozavodsk";
		_city = (BIS_EVO_Townnames select 9);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    };
	    case "radio11":
	    {
//	    	_city = "CHERNOGORSK";
//	    	_city = localize "str_location_chernogorsk";
		_city = (BIS_EVO_Townnames select 10);
		[West,"HQ"] SideChat format[localize "STR_M04t62",_city];
		if (_sop == player) then {["#0000FF",_txtpasshead,_txtpassbody] call BIS_EVO_Message};
		playSound "Goodjob";
	    };
	    case "radio11o":
	    {
//	    	_city = "CHERNOGORSK";
//	    	_city = localize "str_location_chernogorsk";
		_city = (BIS_EVO_Townnames select 10);
		[West,"HQ"] SideChat format[localize "STR_M04t63",_city];
		playSound "Goodjob";
	    }; 
	};
};
//if(isServer) then {_sop addscore _sor};

//adding to make whole group receive points
if(isServer) then 
	{
		BIS_EVO_punit = _sop;
		BIS_EVO_prew  = _sor;
		publicVariable "BIS_EVO_prew";
		publicVariable "BIS_EVO_punit" /////note no;
	};

if (_sot == format["%1",player]) exitWith 
{
	_txtpasshead = localize "STR_M04t69";//ROE Violation
	_txtcommon = localize "STR_M04t0_5";//Points
	_txtpassbody = localize "STR_M04t70";//You have broken the rules of engagement.
	_txtpassbodyf = format["%1 %2 %3",_txtpassbody,_sor,_txtcommon];
	["#FF0000",_txtpasshead,_txtpassbodyf] call BIS_EVO_Message;//added ;
	//adding
//	_sop addscore _sor
	BIS_EVO_punitC = _sop;
	BIS_EVO_prewC  = _sor;
	publicVariable "BIS_EVO_prewC";
	publicVariable "BIS_EVO_punitC" /////note no;
/*
from arma 1
if(_sot == _sop and _sop == vehicle player) exitWith {player addscore _sor;hint "You have broken the rules of engagment, -30 points"};
if(_sot != _sop) then {player addscore _sor;_sot removealleventhandlers "killed";deletevehicle _sot};
*/

};





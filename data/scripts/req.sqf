// checks players rank against the required rank
_player = _this select 0;
_name = name vehicle _player;
_rank = rank _player;
_reqrank = _this select 1;
_nrank = "test";

switch (_reqrank) do
{
    case rank1:
    {
	_nrank = "CORPORAL";
    };
    case rank2:
    {
	_nrank = "SERGEANT";
    };
    case rank3:
    {
	_nrank = "LIEUTENANT";
    };
    case  rank4:
    {
	_nrank = "CAPTAIN";
    };
    case  rank5:
    {
	_nrank = "MAJOR";
    };
    case  rank6:
    {
	_nrank = "COLONEL";
    };
};

_txtpasshead = "Higher Rank Required(L)";
_txtpassbody = format["Rank required : %1<br/>Current rank : %2(L)",_nrank,_rank];
["#FF0000",_txtpasshead,_txtpassbody] call EVO_Message;
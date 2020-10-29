// broadcasts chat to the server about requested support.
_player = _this select 0;
_supp = _this select 1;
_coord = _this select 2;


_messege = format[localize "STR_M04t118",_supp];//Requesting %1

_player sideChat _messege;

sleep 3.0;
_messege = format[localize "STR_M04t119",(name _player)];//Received and understood %1, your ordnance is on the way

[West,"HQ"] SideChat _messege;

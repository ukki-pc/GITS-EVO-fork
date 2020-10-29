
ScriptName "server\noplayermove.sqf";

if (isServer) then
{
	PRIVATE ["_body"];
	
	waituntil{(time>0)};
		for "_i" from 1 to 21 do
		{
			_obj = [] call compile format ["eng%1",_i];
			if (!isplayer _obj) then {_obj setpos getpos KIWEST;};
		};
};
// medic side heal reward script.
_unit = objNull;
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	sleep 1.023;
	_list = list BIS_EVO_ALLWEST;
	_div = [];
	_i=0;
	while {_i < (count _list)} do 
	{
		_unit = _list select _i;
		if(not (_unit isKindOf "Man")) then
		{		
			{_div = _div + [_x]} forEach crew _unit;
		}
		else
		{
			_div = _div + [_unit];
		};
		_i=_i+1;
		sleep 0.1;
	};
	_i=0;
	while {_i < (count _div)} do 
	{
		_unit = _div select _i;
		if(isPlayer _unit) then
		{
			_tag = format["m%1",BIS_EVO_dunit];
			deleteMarkerLocal _tag;
			_tag = format["m%1",name _unit];
			deleteMarkerLocal _tag;
			if ((getdammage _unit) >= 0.05 and alive _unit) then
			{	
				_pos = position vehicle _unit;
				_mssg = format[localize "STR_M04t45_0",(name _unit)];
				_medmark = createMarkerLocal [_tag, _pos];
				_medmark setMarkerShapeLocal "ICON";
				_medmark setMarkerTypeLocal "b_med";
				_medmark setMarkerColorLocal "ColorBlue";
				_medmark setMarkerTextLocal _mssg;
				_medmark setMarkerSizeLocal [0.5, 0.5];
			};
		};
		_i=_i+1;
		sleep 0.1;
	};
};

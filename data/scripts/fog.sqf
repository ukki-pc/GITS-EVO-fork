// weather system
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	1 setFog 0.0;
	waitUntil {vehicle player in list foggy};
	if ((speed vehicle player) > 100) then
	{
		10 setFog 0.8;
	}
	else
	{
		if ((speed vehicle player) > 25) then
		{
			20 setFog 0.8;
		}
		else
		{
			if ((speed vehicle player) < 25) then
			{
				30 setFog 0.8;
			};
		};
	};
	waitUntil {not (vehicle player in list foggy)};
	_wait = 0;
	if ((speed vehicle player) > 100 or not alive player) then
	{
		_wait = 10;
		_wait setFog 0.0;
	}
	else
	{
		if ((speed vehicle player) > 25) then
		{
			_wait = 20;
			_wait setFog 0.0;
		}
		else
		{
			if ((speed vehicle player) < 25) then
			{
				_wait = 30;
				_wait setFog 0.0;
			};
		};
	};
	sleep _wait;
};
				
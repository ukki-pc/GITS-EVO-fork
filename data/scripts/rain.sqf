// weather system client



for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	waitUntil {vehicle player in list rainy or vehicle player in list rainy2 or vehicle player in list rainy3};
	2 setRain 1.0;
	if ((speed vehicle player) > 100) then
	{
		10 setOvercast 1.0;
	}
	else
	{
		if ((speed vehicle player) > 25) then
		{
			20 setOvercast 1.0;
		}
		else
		{
			if ((speed vehicle player) < 25) then
			{
				30 setOvercast 1.0;
			};
		};
	};
	waitUntil {not (vehicle player in list rainy or vehicle player in list rainy2 or vehicle player in list rainy3)};
	if ((speed vehicle player) > 100 or not alive player) then
	{
		10 setOvercast 0.0;
	}
	else
	{
		if ((speed vehicle player) > 25) then
		{
			20 setOvercast 0.0;
		}
		else
		{
			if ((speed vehicle player) < 25) then
			{
				30 setOvercast 0.0;
			};
		};
	};
	2 setRain 0.0;
	sleep 1.0;
};
		
		
		
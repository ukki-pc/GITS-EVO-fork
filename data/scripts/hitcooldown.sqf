repaircooldown = repaircooldown + 1;

_tempCooldown = repaircooldown;

sleep 10.0;

	if(_tempCooldown == repaircooldown) then 
	{
		repaircooldown = 0;
	};
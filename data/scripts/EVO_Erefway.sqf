BIS_EVO_Erefway =
{
	_pos = _this select 0;
	_grp = _this select 1;
	_radio = _this select 2;
	_list = _this select 3;
	_enemy = objNull;
	_epos = position _radio;
	_rnd = (round random 1);
	_pos1 = [(_pos select 0),(_pos select 1)+300,(_pos select 2)]; // North
	_pos2 = [(_pos select 0)-300,(_pos select 1),(_pos select 2)]; // East
	_pos3 = [(_pos select 0),(_pos select 1)-300,(_pos select 2)]; // South
	_pos4 = [(_pos select 0)+300,(_pos select 1),(_pos select 2)]; // West
	_epos = _pos1;
	if(count list _list > 0) then 
	{
		_enemy = (list _list select 0);
		_epos = position _enemy;
	};
	_outpoints = [_pos1,_pos2,_pos3,_pos4,_epos];	
	switch (_rnd) do
	{
		 case 0: //Radio Defence
		{	
			_prad = position _radio;
			_wp1 = _grp addWaypoint [[(_prad select 0)+50,(_prad select 1),(_prad select 2)],50];
			_wp2 = _grp addWaypoint [[(_prad select 0),(_prad select 1)-50,(_prad select 2)],50];
			_wp3 = _grp addWaypoint [[(_prad select 0)-50,(_prad select 1),(_prad select 2)],50];
			_wp4 = _grp addWaypoint [[(_prad select 0),(_prad select 1)+50,(_prad select 2)],100];
			_wp5 = _grp addWaypoint [position _radio, 100];

		};
		 case 1: //Flank 
		{
			_rnd = (round random 4);
			switch (_rnd) do
			{			
				case 0: //Flank
				{
					_wp1 = _grp addWaypoint [_epos, 100];
					_wp2 = _grp addWaypoint [_pos1, 100];
					_wp3 = _grp addWaypoint [_pos2, 100];
					_wp4 = _grp addWaypoint [_pos3, 100];
					_wp5 = _grp addWaypoint [_pos4, 100];
					[_grp, 5] setWaypointType "CYCLE";
				};
				case 1: //Flank
				{
					_epos = _pos4;
					if(count list _list > 0) then 
					{
						_enemy = (list _list select 0);
						_epos = position _enemy;
					};		
					_wp1 = _grp addWaypoint [_epos, 100];
					_wp2 = _grp addWaypoint [_pos4, 100];
					_wp3 = _grp addWaypoint [_pos3, 100];
					_wp4 = _grp addWaypoint [_pos2, 100];
					_wp5 = _grp addWaypoint [_pos1, 100];
					[_grp, 5] setWaypointType "CYCLE";
				};
				 case 2: //Assault
				{
					_epos = _pos4;
					if(count list _list > 0) then 
					{
						_enemy = (list _list select 0);
						_epos = position _enemy;
					};		
					_wp1 = _grp addWaypoint [_epos, 100];
					_wp2 = _grp addWaypoint [_pos1, 100];
					_wp3 = _grp addWaypoint [_pos3, 100];
					_wp4 = _grp addWaypoint [_pos2, 100];
					_wp5 = _grp addWaypoint [_pos4, 100];
					[_grp, 5] setWaypointType "CYCLE";
				};
				 case 3: //Assault
				{
					_epos = _pos4;
					if(count list _list > 0) then 
					{
						_enemy = (list _list select 0);
						_epos = position _enemy;
					};		
					_wp1 = _grp addWaypoint [_epos, 100];
					_wp2 = _grp addWaypoint [_pos4, 100];
					_wp3 = _grp addWaypoint [_pos2, 100];
					_wp4 = _grp addWaypoint [_pos3, 100];
					_wp5 = _grp addWaypoint [_pos1, 100];
					[_grp, 5] setWaypointType "CYCLE";
				};
				 case 4: //Random
				{
					_wp1 = _grp addWaypoint [_outpoints select (round random (count _outpoints-1)), 100];
					_wp2 = _grp addWaypoint [_outpoints select (round random (count _outpoints-1)), 100];
					_wp3 = _grp addWaypoint [_outpoints select (round random (count _outpoints-1)), 100];
					_wp4 = _grp addWaypoint [_outpoints select (round random (count _outpoints-1)), 100];
					_wp5 = _grp addWaypoint [_outpoints select (round random (count _outpoints-1)), 100];
					[_grp, 5] setWaypointType "CYCLE";
				};
			};
		};	
	};
	
};
